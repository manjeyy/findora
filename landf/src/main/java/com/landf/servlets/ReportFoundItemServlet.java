package com.landf.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.List;

import com.landf.dao.ItemDAO;
import com.landf.dao.LocationDAO;
import com.landf.models.Item;
import com.landf.models.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 6 * 1024 * 1024)
@WebServlet(name = "reportFoundItemServlet", value = "/report-found-item")
public class ReportFoundItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            // Check if user is logged in, if not set a default user for testing
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                // For testing, use a default user ID. In production, redirect to login
                userId = 3; // Default test user
                session.setAttribute("userId", userId);
            }

            // Get locations for dropdown
            List<Location> locations = LocationDAO.getAllApprovedLocations();
            request.setAttribute("locations", locations);

            request.getRequestDispatcher("/pages/public/reportFoundItem.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                // Use default test user
                userId = 3;
                session.setAttribute("userId", userId);
            }

            // Get form parameters
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String locationIdStr = request.getParameter("locationId");
            String eventDate = request.getParameter("eventDate");
            String imageUrl = request.getParameter("imageUrl");
            imageUrl = saveUploadedImage(request, imageUrl);

            // Validate required fields
            if (title == null || title.trim().isEmpty()
                    || description == null || description.trim().isEmpty()
                    || category == null || locationIdStr == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields");
                return;
            }

            int locationId = Integer.parseInt(locationIdStr);

            // Create item
            Item item = new Item("found", title.trim(), description.trim(), category,
                    locationId, eventDate, imageUrl, userId);
            ItemDAO.createItem(item);

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/browse-items?type=found");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    private String saveUploadedImage(HttpServletRequest request, String imageUrl)
            throws IOException, ServletException {
        Part imageFile = request.getPart("imageFile");
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
        return imageUrl;
    }
}
