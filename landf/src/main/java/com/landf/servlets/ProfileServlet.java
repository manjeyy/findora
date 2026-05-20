package com.landf.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.JwtService;
import com.landf.features.user.UserBadgeView;
import com.landf.features.user.UserClaimView;
import com.landf.features.user.UserDAO;
import com.landf.features.user.UserItemView;
import com.landf.features.user.UserMissionView;
import com.landf.features.user.UserModel;
import com.landf.features.user.UserReputationView;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 6 * 1024 * 1024)
@WebServlet(name = "profileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {

    private final JwtService jwtService = new JwtService();
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Resolve authenticated user from JWT token
        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);
        int userId = jwt.get().getClaim("userId").asInt();

        try {
            Optional<UserModel> userOpt = userDAO.findById(userId);
            if (userOpt.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                return;
            }

            UserModel user = userOpt.get();
            Optional<UserReputationView> reputationOpt = userDAO.findReputationByUserId(userId);
            List<UserItemView> items = userDAO.listItemsByUserId(userId);
            List<UserClaimView> claims = userDAO.listClaimsByUserId(userId);
            List<UserBadgeView> badges = userDAO.listBadgesByUserId(userId);
            List<UserMissionView> missions = userDAO.listMissionsByUserId(userId);

            request.setAttribute("profileUser", user);
            request.setAttribute("reputation", reputationOpt.orElse(null));
            request.setAttribute("items", items);
            request.setAttribute("claims", claims);
            request.setAttribute("badges", badges);
            request.setAttribute("missions", missions);

            request.getRequestDispatcher("/pages/user_pages/profile.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error retrieving profile data");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Resolve authenticated user from JWT token
        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);
        int userId = jwt.get().getClaim("userId").asInt();

        // Support awarding a badge via POST (minimal demo: award by badge name)
        String awardBadgeName = request.getParameter("awardBadgeName");
        if (awardBadgeName != null && !awardBadgeName.isBlank()) {
            boolean awarded = userDAO.awardBadgeByName(userId, awardBadgeName.trim());
            if (awarded) {
                response.sendRedirect(request.getContextPath() + "/profile?status=award_success");
            } else {
                response.sendRedirect(request.getContextPath() + "/profile?status=award_failed");
            }
            return;
        }

        try {
            String photoUrl = saveUploadedImage(request);
            if (photoUrl != null) {
                userDAO.updateProfilePhoto(userId, photoUrl);
                request.getSession().setAttribute("profilePhoto", photoUrl);
                response.sendRedirect(request.getContextPath() + "/profile?status=upload_success");
            } else {
                response.sendRedirect(request.getContextPath() + "/profile?status=upload_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/profile?status=upload_error");
        }
    }

    private String saveUploadedImage(HttpServletRequest request)
            throws IOException, ServletException {
        Part imageFile = request.getPart("profilePhotoFile");
        if (imageFile != null && imageFile.getSize() > 0) {
            String originalFileName = Paths.get(imageFile.getSubmittedFileName()).getFileName().toString();
            String safeFileName = System.currentTimeMillis() + "-" + originalFileName.replaceAll("[^a-zA-Z0-9.-]", "_");
            String uploadDir = getServletContext().getRealPath("/uploads");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }
            File uploadedFile = new File(uploadFolder, safeFileName);
            try (InputStream input = imageFile.getInputStream()) {
                Files.copy(input, uploadedFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            return request.getContextPath() + "/uploads/" + safeFileName;
        }
        return null;
    }
}
