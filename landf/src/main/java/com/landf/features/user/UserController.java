package com.landf.features.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.JwtService;
import com.landf.features.auth.guards.RoleGuard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/auth/login", "/auth/register", "/auth/logout", "/dashboard", "/users", "/users/*"})
public class UserController extends HttpServlet {

    private static final String LOGIN_VIEW = "/pages/auth/login.jsp";
    private static final String REGISTER_VIEW = "/pages/auth/register.jsp";
    private static final String DASHBOARD_VIEW = "/pages/dashboard/user/home.jsp";
    private static final String ADMIN_ROLE = "admin";
    private static final String LOCATION_ADMIN_ROLE = "location_admin";
    private static final String DEFAULT_ROLE = "user";
    private static final int MIN_PASSWORD_LENGTH = 8;
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z0-9_]{3,30}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    private final UserDAO userDAO = new UserDAO();
    private final JwtService jwtService = new JwtService();
    private final RoleGuard roleGuard = new RoleGuard();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("PATCH".equalsIgnoreCase(request.getMethod())) {
            handlePatch(request, response);
            return;
        }

        super.service(request, response);
    }

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
            case "/users" ->
                handleUsersGet(request, response);
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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("/users".equals(request.getServletPath())) {
            handleUsersDelete(request, response);
            return;
        }

        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }

    private void handlePatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("/users".equals(request.getServletPath())) {
            handleUsersPatch(request, response);
            return;
        }

        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }

    private void handleUsersGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!ensureAdminRole(request, response)) {
            return;
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo)) {
            List<UserModel> users = userDAO.listUsers();
            writeJson(response, toJsonUsers(users));
            return;
        }

        int userId = parsePathUserId(pathInfo);
        if (userId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user id.");
            return;
        }

        Optional<UserModel> user = findUserById(userId);
        if (user.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String remainder = resolveUserSubresource(pathInfo);
        if (remainder.isEmpty()) {
            writeJson(response, toJsonUser(user.get()));
            return;
        }

        switch (remainder) {
            case "/items" ->
                writeJson(response, toJsonUserItems(userDAO.listItemsByUserId(userId)));
            case "/claims" ->
                writeJson(response, toJsonUserClaims(userDAO.listClaimsByUserId(userId)));
            case "/badges" ->
                writeJson(response, toJsonUserBadges(userDAO.listBadgesByUserId(userId)));
            case "/reputation" ->
                writeJson(response, toJsonUserReputation(userDAO.findReputationByUserId(userId)));
            case "/missions" ->
                writeJson(response, toJsonUserMissions(userDAO.listMissionsByUserId(userId)));
            case "/points" ->
                writeJson(response, toJsonUserPoints(userDAO.findReputationByUserId(userId)));
            default ->
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleUsersPatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!ensureAdminRole(request, response)) {
            return;
        }

        int userId = resolveTargetUserId(request);
        if (userId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user id.");
            return;
        }

        Optional<UserModel> existing = findUserById(userId);
        if (existing.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        UserModel updatedUser = mergeUser(existing.get(), request);
        if (updatedUser == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No valid fields supplied.");
            return;
        }

        if (!userDAO.updateUser(updatedUser)) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update user.");
            return;
        }

        writeJson(response, toJsonUser(updatedUser));
    }

    private void handleUsersDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!ensureAdminRole(request, response)) {
            return;
        }

        int userId = resolveTargetUserId(request);
        if (userId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user id.");
            return;
        }

        Object currentUserId = request.getAttribute("authUserId");
        if (currentUserId instanceof Number number && number.intValue() == userId) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You cannot delete your own account.");
            return;
        }

        if (!userDAO.deleteUser(userId)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

    private boolean ensureAdminRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return roleGuard.hasRole(ADMIN_ROLE, request, response);
    }

    private Optional<UserModel> findUserById(int userId) {
        try {
            return userDAO.findById(userId);
        } catch (SQLException | ClassNotFoundException e) {
            log("Failed to load user " + userId, e);
            return Optional.empty();
        }
    }

    private UserModel mergeUser(UserModel currentUser, HttpServletRequest request) {
        String username = normalize(request.getParameter("username"));
        String email = normalize(request.getParameter("email"));
        String role = normalize(request.getParameter("role"));
        String locationIdValue = normalize(request.getParameter("locationId"));
        String status = normalize(request.getParameter("status"));

        boolean changed = false;

        if (!username.isBlank()) {
            if (!isValidUsername(username)) {
                return null;
            }
            currentUser.setUsername(username);
            changed = true;
        }

        if (!email.isBlank()) {
            if (!isValidEmail(email)) {
                return null;
            }
            currentUser.setEmail(email);
            changed = true;
        }

        if (!role.isBlank()) {
            currentUser.setRole(role);
            changed = true;
        }

        if (!locationIdValue.isBlank()) {
            try {
                int locationId = Integer.parseInt(locationIdValue);
                currentUser.setLocationId(locationId > 0 ? locationId : null);
                changed = true;
            } catch (NumberFormatException ex) {
                return null;
            }
        }

        if (!status.isBlank()) {
            currentUser.setStatus(status);
            changed = true;
        }

        return changed ? currentUser : null;
    }

    private int resolveTargetUserId(HttpServletRequest request) {
        String pathInfo = request.getPathInfo();
        return parsePathUserId(pathInfo);
    }

    private int parsePathUserId(String pathInfo) {
        if (pathInfo == null || pathInfo.isBlank()) {
            return -1;
        }

        String trimmed = pathInfo.startsWith("/") ? pathInfo.substring(1) : pathInfo;
        int slashIndex = trimmed.indexOf('/');
        String idPart = slashIndex >= 0 ? trimmed.substring(0, slashIndex) : trimmed;

        try {
            int parsed = Integer.parseInt(idPart.trim());
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ex) {
            return -1;
        }
    }

    private String resolveUserSubresource(String pathInfo) {
        if (pathInfo == null || pathInfo.isBlank()) {
            return "";
        }

        String trimmed = pathInfo.startsWith("/") ? pathInfo.substring(1) : pathInfo;
        int slashIndex = trimmed.indexOf('/');
        if (slashIndex < 0) {
            return "";
        }

        return trimmed.substring(slashIndex);
    }

    private String toJsonUsers(List<UserModel> users) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < users.size(); i++) {
            if (i > 0) {
                json.append(',');
            }
            json.append(toJsonUser(users.get(i)));
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonUser(UserModel user) {
        return String.format(
                "{\"user_id\":%d,\"username\":\"%s\",\"email\":\"%s\",\"role\":\"%s\",\"location_id\":%s,\"status\":\"%s\",\"created_at\":%s}",
                user.getUser_id(),
                escape(user.getUsername()),
                escape(user.getEmail()),
                escape(user.getRole()),
                user.getLocationId() == null ? "null" : user.getLocationId().toString(),
                escape(user.getStatus()),
                user.getCreated_at() == null ? "null" : "\"" + escape(user.getCreated_at()) + "\"");
    }

    private String toJsonUserItems(List<UserItemView> items) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < items.size(); i++) {
            if (i > 0) {
                json.append(',');
            }

            UserItemView item = items.get(i);
            json.append('{')
                    .append("\"item_id\":").append(item.getItemId()).append(',')
                    .append("\"type\":\"").append(escape(item.getType())).append("\",")
                    .append("\"title\":\"").append(escape(item.getTitle())).append("\",")
                    .append("\"description\":\"").append(escape(item.getDescription())).append("\",")
                    .append("\"category\":").append(item.getCategory() == null ? "null" : "\"" + escape(item.getCategory()) + "\"").append(',')
                    .append("\"location_id\":").append(item.getLocationId()).append(',')
                    .append("\"location_name\":\"").append(escape(item.getLocationName())).append("\",")
                    .append("\"status\":\"").append(escape(item.getStatus())).append("\",")
                    .append("\"moderation_status\":\"").append(escape(item.getModerationStatus())).append("\",")
                    .append("\"created_at\":").append(quote(item.getCreatedAt()))
                    .append('}');
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonUserClaims(List<UserClaimView> claims) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < claims.size(); i++) {
            if (i > 0) {
                json.append(',');
            }

            UserClaimView claim = claims.get(i);
            json.append('{')
                    .append("\"claim_id\":").append(claim.getClaimId()).append(',')
                    .append("\"item_id\":").append(claim.getItemId()).append(',')
                    .append("\"item_title\":\"").append(escape(claim.getItemTitle())).append("\",")
                    .append("\"item_type\":\"").append(escape(claim.getItemType())).append("\",")
                    .append("\"status\":\"").append(escape(claim.getStatus())).append("\",")
                    .append("\"proof\":").append(quote(claim.getProof())).append(',')
                    .append("\"identifiers\":").append(quote(claim.getIdentifiers())).append(',')
                    .append("\"created_at\":").append(quote(claim.getCreatedAt())).append(',')
                    .append("\"review_notes\":").append(quote(claim.getReviewNotes()))
                    .append('}');
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonUserBadges(List<UserBadgeView> badges) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < badges.size(); i++) {
            if (i > 0) {
                json.append(',');
            }

            UserBadgeView badge = badges.get(i);
            json.append('{')
                    .append("\"user_badge_id\":").append(badge.getUserBadgeId()).append(',')
                    .append("\"badge_id\":").append(badge.getBadgeId()).append(',')
                    .append("\"name\":\"").append(escape(badge.getName())).append("\",")
                    .append("\"description\":\"").append(escape(badge.getDescription())).append("\",")
                    .append("\"criteria\":\"").append(escape(badge.getCriteria())).append("\",")
                    .append("\"awarded_at\":").append(quote(badge.getAwardedAt()))
                    .append('}');
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonUserReputation(Optional<UserReputationView> reputation) {
        if (reputation.isEmpty()) {
            return "null";
        }

        UserReputationView view = reputation.get();
        return new StringBuilder("{")
                .append("\"user_id\":").append(view.getUserId()).append(',')
                .append("\"points\":").append(view.getPoints()).append(',')
                .append("\"successful_actions\":").append(view.getSuccessfulActions()).append(',')
                .append("\"total_actions\":").append(view.getTotalActions()).append(',')
                .append("\"penalty_events\":").append(view.getPenaltyEvents()).append(',')
                .append("\"score\":").append(view.getScore()).append(',')
                .append("\"trust_level\":\"").append(escape(view.getTrustLevel())).append("\",")
                .append("\"updated_at\":").append(quote(view.getUpdatedAt()))
                .append('}')
                .toString();
    }

    private String toJsonUserPoints(Optional<UserReputationView> reputation) {
        if (reputation.isEmpty()) {
            return "null";
        }

        UserReputationView view = reputation.get();
        return new StringBuilder("{")
                .append("\"user_id\":").append(view.getUserId()).append(',')
                .append("\"points\":").append(view.getPoints())
                .append('}')
                .toString();
    }

    private String toJsonUserMissions(List<UserMissionView> missions) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < missions.size(); i++) {
            if (i > 0) {
                json.append(',');
            }

            UserMissionView mission = missions.get(i);
            json.append('{')
                    .append("\"user_mission_id\":").append(mission.getUserMissionId()).append(',')
                    .append("\"mission_id\":").append(mission.getMissionId()).append(',')
                    .append("\"title\":\"").append(escape(mission.getTitle())).append("\",")
                    .append("\"description\":\"").append(escape(mission.getDescription())).append("\",")
                    .append("\"target_count\":").append(mission.getTargetCount()).append(',')
                    .append("\"reward_points\":").append(mission.getRewardPoints()).append(',')
                    .append("\"progress_count\":").append(mission.getProgressCount()).append(',')
                    .append("\"status\":\"").append(escape(mission.getStatus())).append("\",")
                    .append("\"active\":").append(mission.isActive()).append(',')
                    .append("\"start_date\":").append(quote(mission.getStartDate())).append(',')
                    .append("\"end_date\":").append(quote(mission.getEndDate())).append(',')
                    .append("\"updated_at\":").append(quote(mission.getUpdatedAt()))
                    .append('}');
        }
        json.append(']');
        return json.toString();
    }

    private String quote(String value) {
        return value == null ? "null" : "\"" + escape(value) + "\"";
    }

    private void writeJson(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
    }

    private String escape(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
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

        if (LOCATION_ADMIN_ROLE.equalsIgnoreCase(role)) {
            response.sendRedirect(request.getContextPath() + "/location-admin/dashboard");
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
