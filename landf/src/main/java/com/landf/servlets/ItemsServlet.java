package com.landf.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.landf.dao.ItemDAO;
import com.landf.dao.LocationDAO;
import com.landf.models.Item;
import com.landf.models.Location;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "itemsServlet", value = "/browse-items")
public class ItemsServlet extends HttpServlet {

    private static final int ITEMS_PER_PAGE = 12;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String pageStr = request.getParameter("page");
            int page = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
            int offset = (page - 1) * ITEMS_PER_PAGE;

            String category = request.getParameter("category");
            String location = request.getParameter("location");
            String type = request.getParameter("type");

            // Get items
            List<Item> items;
            if (type != null && !type.isEmpty()) {
                items = ItemDAO.getItemsByType(type, ITEMS_PER_PAGE, offset);
            } else {
                items = ItemDAO.getAllItems(category, location, ITEMS_PER_PAGE, offset);
            }

            int totalItems = ItemDAO.getTotalItemCount(category, location);
            int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);

            // Get filters
            List<Location> locations = LocationDAO.getAllApprovedLocations();

            // Convert selectedLocation to int for proper comparison in JSP
            int selectedLocationId = 0;
            if (location != null && !location.isEmpty()) {
                try {
                    selectedLocationId = Integer.parseInt(location);
                } catch (NumberFormatException e) {
                    selectedLocationId = 0;
                }
            }

            request.setAttribute("items", items);
            request.setAttribute("locations", locations);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalItems", totalItems);
            request.setAttribute("selectedCategory", category != null ? category : "All");
            request.setAttribute("selectedLocation", selectedLocationId);
            request.setAttribute("selectedType", type != null ? type : "All");

            request.getRequestDispatcher("/pages/public/itemListing.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
