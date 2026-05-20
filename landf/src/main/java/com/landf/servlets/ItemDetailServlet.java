package com.landf.servlets;

import java.io.IOException;
import java.sql.SQLException;

import com.landf.dao.ItemDAO;
import com.landf.models.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "itemDetailServlet", value = "/item-detail")
public class ItemDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String itemIdStr = request.getParameter("id");

            if (itemIdStr == null || itemIdStr.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Item ID is required");
                return;
            }

            int itemId = Integer.parseInt(itemIdStr);
            Item item = ItemDAO.getItemById(itemId);

            if (item == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Item not found");
                return;
            }

            request.setAttribute("item", item);
            request.getRequestDispatcher("/pages/public/itemDetailPage.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
