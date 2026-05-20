package com.landf.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.landf.dao.ItemDAO;
import com.landf.dao.UserPointsDAO;
import com.landf.models.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "homeServlet", value = "/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get recent items
            List<Item> recentItems = ItemDAO.getRecentItems(6);
            List<Item> lostItems = ItemDAO.getItemsByType("lost", 3, 0);
            List<Item> foundItems = ItemDAO.getItemsByType("found", 3, 0);
            List<Item> recentlyResolvedItems = ItemDAO.getRecentlyResolvedItems(5);
            List<Item> allLocations = ItemDAO.getAllItems(null, null, 1, 0);

            // Get statistics
            int totalOpenItems = ItemDAO.getTotalItemCount(null, null);

            // Get top users by points
            List<Map<String, Object>> topUsers = UserPointsDAO.getTopUsersByPoints(10);

            request.setAttribute("recentItems", recentItems);
            request.setAttribute("lostItems", lostItems);
            request.setAttribute("foundItems", foundItems);
            request.setAttribute("recentlyResolvedItems", recentlyResolvedItems);
            request.setAttribute("topUsers", topUsers);
            request.setAttribute("totalOpenItems", totalOpenItems);
            request.setAttribute("newMatches", 12); // Mock data
            request.setAttribute("successRate", "87%"); // Mock data

            request.getRequestDispatcher("/pages/public/home.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
