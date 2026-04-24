package com.landf.features.items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/items")
public class ItemController extends HttpServlet {

    private ItemImpl itemDAO = new ItemImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            if (action == null) {

                List<Item> items = itemDAO.getAllItems();
                req.setAttribute("items", items);
                req.getRequestDispatcher("/items.jsp").forward(req, resp);

            } else if ("getById".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));
                Item item = itemDAO.getItemByID(id);

                req.setAttribute("item", item);
                req.getRequestDispatcher("/item-detail.jsp").forward(req, resp);

            } else if ("getByUser".equals(action)) {

                int userId = Integer.parseInt(req.getParameter("userId"));
                List<Item> items = itemDAO.getItemByUser(userId);

                req.setAttribute("items", items);
                req.getRequestDispatcher("/items.jsp").forward(req, resp);

            } else if ("getByLocation".equals(action)) {

                int locationId = Integer.parseInt(req.getParameter("locationId"));
                List<Item> items = itemDAO.getItemByLocation(locationId);

                req.setAttribute("items", items);
                req.getRequestDispatcher("/items.jsp").forward(req, resp);

            } else if ("delete".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));
                itemDAO.deleteItemById(id);

                resp.sendRedirect("items");

            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            if ("create".equals(action)) {

                Item item = extractItem(req);
                itemDAO.createItem(item);

                resp.sendRedirect("items");

            } else if ("update".equals(action)) {

                Item item = extractItem(req);
                item.setItem_id(Integer.parseInt(req.getParameter("item_id")));

                itemDAO.updateItemById(item);

                resp.sendRedirect("items");

            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private Item extractItem(HttpServletRequest req) {
        Item item = new Item();

        item.setType(req.getParameter("type"));
        item.setTitle(req.getParameter("title"));
        item.setDescription(req.getParameter("description"));
        item.setCategory(req.getParameter("category"));

        if (req.getParameter("location_id") != null)
            item.setLocation_id(Integer.parseInt(req.getParameter("location_id")));

        if (req.getParameter("user_id") != null)
            item.setUser_id(Integer.parseInt(req.getParameter("user_id")));

        item.setStatus(req.getParameter("status"));
        item.setModeration_status(req.getParameter("moderation_status"));
        item.setImage_url(req.getParameter("image_url"));

        return item;
    }
}
