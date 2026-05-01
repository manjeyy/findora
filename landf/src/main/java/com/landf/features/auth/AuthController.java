package com.landf.features.auth;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

import com.landf.features.user.UserController;
import org.mindrot.jbcrypt.BCrypt;
import com.landf.features.user.UserDAO;
import com.landf.features.user.UserModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/auth/refresh", "/auth/me", "/auth/verify-email", "/auth/forgot-password", "/auth/reset-password"})
public class AuthController extends HttpServlet {

    private final JwtService jwtService = new JwtService();
    private final UserDAO userDAO = new UserDAO();
    private final PasswordResetService resetService = new PasswordResetService();
    private final EmailVerificationService verificationService = new EmailVerificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getServletPath().equals("/auth/me")) {
            handleMe(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        switch (request.getServletPath()) {
            case "/auth/refresh" ->
                handleRefresh(request, response);
            case "/auth/verify-email" ->
                handleVerifyEmail(request, response);
            case "/auth/forgot-password" ->
                handleForgotPassword(request, response);
            case "/auth/reset-password" ->
                handleResetPassword(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    // this is not how it works, the refresh tokens  needs to be in the database
    // you verify the tokens from database and send access token
    private void handleRefresh(HttpServletRequest request, HttpServletResponse response)  {
        Optional<String> tokenOpt = jwtService.resolveToken(request);
        tokenOpt.flatMap(jwtService::verify).ifPresentOrElse(jwt -> {
            try {
                Optional<UserModel> user = userDAO.findByUsername(jwt.getSubject());
                if (user.isPresent()) {
                    String newToken = jwtService.generateToken(user.get());
                    response.addCookie(jwtService.buildAuthCookie(newToken, request));
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                }
            } catch (SQLException | ClassNotFoundException e) {
                log("Failed to refresh token", e);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }, () -> {
            try {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            } catch (Exception ignored) {
            }
        });
    }

    private void handleMe(HttpServletRequest request, HttpServletResponse response) {
        jwtService.resolveToken(request).flatMap(jwtService::verify).ifPresentOrElse(jwt -> {
            try {
                Optional<UserModel> user = userDAO.findByUsername(jwt.getSubject());
                if (user.isPresent()) {
                    UserModel u = user.get();
                    response.setContentType("application/json;charset=UTF-8");
                    String json = String.format("{\"user_id\":%d,\"username\":\"%s\",\"email\":\"%s\",\"role\":\"%s\",\"status\":\"%s\"}",
                            u.getUser_id(), escape(u.getUsername()), escape(u.getEmail()), escape(u.getRole()), escape(u.getStatus()));
                    try {
                        response.getWriter().write(json);
                    } catch (IOException e) {
                        log("Failed to write response", e);
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } catch (SQLException | ClassNotFoundException e) {
                log("Failed to read user", e);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }, () -> response.setStatus(HttpServletResponse.SC_UNAUTHORIZED));
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = defaultString(request.getParameter("email")).trim();

        UserController uc = new UserController();

        if (email.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "email is required");
            return;
        }

        if (!uc.isValidEmail(email)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Valid email is required");
            return;
        }

        try {
            Optional<UserModel> userOpt = userDAO.findByEmail(email);
            if (userOpt.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"ok\":true}");
                System.out.println("Email was actually not found, but sent ok to not reveal email");
                return;
            }

            String token = resetService.generateTokenForUsername(userOpt.get().getUsername());
            System.out.println("Password reset token for " + email + ": " + token);
            System.out.println(token);

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"ok\":true}");
        } catch (SQLException | ClassNotFoundException e) {
            log("Failed to process forgot-password", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String token = defaultString(request.getParameter("token")).trim();
        String newPassword = defaultString(request.getParameter("password"));

        if (token.isBlank() || newPassword.isBlank() || newPassword.length() < 8) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "token and valid password required");
            return;
        }

        Optional<String> usernameOpt = resetService.consumeToken(token);
        if (usernameOpt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "invalid or expired token");
            return;
        }

        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        boolean updated = userDAO.updatePasswordByUsername(usernameOpt.get(), hashed);
        if (!updated) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"msg\":The password has been reset successfully}");
    }

    private void handleVerifyEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String token = defaultString(request.getParameter("token")).trim();
        if (token.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "token required");
            return;
        }

        Optional<String> usernameOpt = verificationService.consumeToken(token);
        if (usernameOpt.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "invalid or expired token");
            return;
        }

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"ok\":true}");
    }

    private String defaultString(String value) {
        return value == null ? "" : value;
    }

    private String escape(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n");
    }
}
