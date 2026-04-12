package com.landf.features.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;

import com.landf.features.auth.AuthConstants;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/auth/login", "/auth/register", "/auth/logout", "/dashboard"})
public class UserController extends HttpServlet {

    private static final String LOGIN_VIEW = "/pages/auth/login.jsp";
    private static final String REGISTER_VIEW = "/pages/auth/register.jsp";
    private static final String DASHBOARD_VIEW = "/pages/dashboard/user/home.jsp";
    private static final String DEFAULT_ROLE = "user";
    private static final int MIN_PASSWORD_LENGTH = 8;
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z0-9_]{3,30}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/auth/login" ->
                forward(LOGIN_VIEW, request, response);
            case "/auth/register" ->
                forward(REGISTER_VIEW, request, response);
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
            e.printStackTrace();
            forwardRegisterWithError("Could not create account right now. Please try again.", request, response);
            return;
        }

        if (createdUser.isEmpty()) {
            forwardRegisterWithError("Could not create account right now. Please try again.", request, response);
            return;
        }

        createSession(request, createdUser.get());
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
            e.printStackTrace();
            forwardLoginWithError("Could not sign in right now. Please try again.", request, response);
            return;
        }

        if (user.isEmpty() || !BCrypt.checkpw(password, user.get().getPassword())) {
            forwardLoginWithError("Invalid username or password.", request, response);
            return;
        }

        createSession(request, user.get());
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect(request.getContextPath() + "/auth/login");
    }

    private void handleDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAuthenticated(request)) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        forward(DASHBOARD_VIEW, request, response);
    }

    private void createSession(HttpServletRequest request, UserModel user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(AuthConstants.SESSION_USER_KEY, user.getUsername());
        session.setAttribute(AuthConstants.SESSION_USER_ID_KEY, user.getUser_id());
        session.setMaxInactiveInterval(30 * 60);
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute(AuthConstants.SESSION_USER_KEY) != null;
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

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private String defaultString(String value) {
        return value == null ? "" : value;
    }

    private boolean isValidUsername(String username) {
        return USERNAME_PATTERN.matcher(username).matches();
    }

    private boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).matches();
    }
}
