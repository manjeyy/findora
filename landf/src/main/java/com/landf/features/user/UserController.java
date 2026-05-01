package com.landf.features.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.JwtService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/auth/login", "/auth/register", "/auth/logout", "/dashboard"})
public class UserController extends HttpServlet {

    private static final String LOGIN_VIEW = "/pages/auth/login.jsp";
    private static final String REGISTER_VIEW = "/pages/auth/register.jsp";
    private static final String DASHBOARD_VIEW = "/pages/dashboard/user/home.jsp";
    private static final String ADMIN_ROLE = "admin";
    private static final String DEFAULT_ROLE = "user";
    private static final int MIN_PASSWORD_LENGTH = 8;
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z0-9_]{3,30}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    private final UserDAO userDAO = new UserDAO();
    private final JwtService jwtService = new JwtService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/auth/login" ->
                handleLoginView(request, response);
            case "/auth/register" ->
                handleRegisterView(request, response);
            case "/auth/logout" ->
                handleLogout(request, response);
            case "/dashboard" ->
                handleDashboard(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/auth/login" ->
                handleLogin(request, response);
            case "/auth/register" ->
                handleRegister(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = normalize(request.getParameter("username"));
        String email = normalize(request.getParameter("email"));
        String password = defaultString(request.getParameter("password"));

        request.setAttribute("username", username);
        request.setAttribute("email", email);

        if (!isValidUsername(username)) {
            forwardRegisterWithError("Username must be 3-30 characters and contain only letters, numbers, or underscore.", request, response);
            return;
        }

        if (password.length() < MIN_PASSWORD_LENGTH) {
            forwardRegisterWithError("Password must be at least 8 characters.", request, response);
            return;
        }

        if (!isValidEmail(email)) {
            forwardRegisterWithError("Please provide a valid email address.", request, response);
            return;
        }

        if (userDAO.usernameExists(username)) {
            forwardRegisterWithError("Username is already taken.", request, response);
            return;
        }

        if (userDAO.emailExists(email)) {
            forwardRegisterWithError("Email is already in use.", request, response);
            return;
        }

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        UserModel userToCreate = new UserModel(username, email, hashedPassword, DEFAULT_ROLE);
        Optional<UserModel> createdUser;
        try {
            createdUser = userDAO.createUser(userToCreate);
        } catch (SQLException | ClassNotFoundException e) {
            log("Failed to create user account", e);
            forwardRegisterWithError("Could not create account right now. Please try again.", request, response);
            return;
        }

        if (createdUser.isEmpty()) {
            forwardRegisterWithError("Could not create account right now. Please try again.", request, response);
            return;
        }

        issueAuthCookie(createdUser.get(), request, response);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = normalize(request.getParameter("username"));
        String password = defaultString(request.getParameter("password"));

        request.setAttribute("username", username);

        if (username.isBlank() || password.isBlank()) {
            forwardLoginWithError("Username and password are required.", request, response);
            return;
        }

        Optional<UserModel> user;
        try {
            user = userDAO.findByUsername(username);
        } catch (SQLException | ClassNotFoundException e) {
            log("Failed to authenticate user", e);
            forwardLoginWithError("Could not sign in right now. Please try again.", request, response);
            return;
        }

        if (user.isEmpty() || !BCrypt.checkpw(password, user.get().getPassword())) {
            forwardLoginWithError("Invalid username or password.", request, response);
            return;
        }

        if ("suspended".equalsIgnoreCase(user.get().getStatus())) {
            forwardLoginWithError("Your account is suspended. Contact an admin.", request, response);
            return;
        }

        issueAuthCookie(user.get(), request, response);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.addCookie(jwtService.buildClearedAuthCookie(request));
        response.sendRedirect(request.getContextPath() + "/auth/login");
    }

    private void handleDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Optional<DecodedJWT> jwt = resolveAuthenticatedUser(request);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);

        String role = jwt.get().getClaim("role").asString();
        if (ADMIN_ROLE.equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        forward(DASHBOARD_VIEW, request, response);
    }

    private void handleLoginView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        forward(LOGIN_VIEW, request, response);
    }

    private void handleRegisterView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        forward(REGISTER_VIEW, request, response);
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        return resolveAuthenticatedUser(request).isPresent();
    }

    private Optional<DecodedJWT> resolveAuthenticatedUser(HttpServletRequest request) {
        return jwtService.resolveToken(request).flatMap(jwtService::verify);
    }

    private void issueAuthCookie(UserModel user, HttpServletRequest request, HttpServletResponse response) {
        String token = jwtService.generateToken(user);
        response.addCookie(jwtService.buildAuthCookie(token, request));
        response.setHeader("Cache-Control", "no-store");
    }

    private void forward(String view, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(view).forward(request, response);
    }

    private void forwardRegisterWithError(String error, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("error", error);
        forward(REGISTER_VIEW, request, response);
    }

    private void forwardLoginWithError(String error, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("error", error);
        forward(LOGIN_VIEW, request, response);
    }

    public String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    public String defaultString(String value) {
        return value == null ? "" : value;
    }

    public boolean isValidUsername(String username) {
        return USERNAME_PATTERN.matcher(username).matches();
    }

    public boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).matches();
    }
}
