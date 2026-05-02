package com.landf.features.items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/items")
public class ItemController extends HttpServlet {

    private ItemService itemService = new ItemService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            if (action == null) {
                listItems(req, resp);
            } else {
                switch (action) {
                    case "view":
                        getItemById(req, resp);
                        break;
                    case "user":
                        getByUser(req, resp);
                        break;
                    case "location":
                        getByLocation(req, resp);
                        break;
                    default:
                        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                }
            }
        } catch (Exception e) {
            handleError(e, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            switch (action) {
                case "create":
                    createItem(req, resp);
                    break;
                case "update":
                    updateItem(req, resp);
                    break;
                case "delete":
                    deleteItem(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (Exception e) {
            handleError(e, resp);
        }
    }

    private void listItems(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException {

        List<Item> items = itemService.getAllItems();
        req.setAttribute("items", items);
        req.getRequestDispatcher("/items.jsp").forward(req, resp);
    }

    private void getItemById(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int id = parseInt(req.getParameter("id"));
        Item item = itemService.getItemById(id);

        req.setAttribute("item", item);
        req.getRequestDispatcher("/item-detail.jsp").forward(req, resp);
    }

    private void getByUser(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int userId = parseInt(req.getParameter("userId"));
        List<Item> items = itemService.getItemsByUser(userId);

        req.setAttribute("items", items);
        req.getRequestDispatcher("/items.jsp").forward(req, resp);
    }

    private void getByLocation(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int locationId = parseInt(req.getParameter("locationId"));
        List<Item> items = itemService.getItemsByLocation(locationId);

        req.setAttribute("items", items);
        req.getRequestDispatcher("/items.jsp").forward(req, resp);
    }

    private void createItem(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        Item item = extractItem(req);
        itemService.createItem(item);

        resp.sendRedirect("items");
    }

    private void updateItem(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        Item item = extractItem(req);
        item.setItem_id(parseInt(req.getParameter("item_id")));

        itemService.updateItem(item);

        resp.sendRedirect("items");
    }

    private void deleteItem(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        int id = parseInt(req.getParameter("id"));
        itemService.deleteItem(id);

        resp.sendRedirect("items");
    }


    private Item extractItem(HttpServletRequest req) {
        Item item = new Item();

        item.setType(req.getParameter("type"));
        item.setTitle(req.getParameter("title"));
        item.setDescription(req.getParameter("description"));
        item.setCategory(req.getParameter("category"));
        item.setStatus(req.getParameter("status"));
        item.setModeration_status(req.getParameter("moderation_status"));
        item.setImage_url(req.getParameter("image_url"));

        if (req.getParameter("location_id") != null)
            item.setLocation_id(parseInt(req.getParameter("location_id")));

        if (req.getParameter("user_id") != null)
            item.setUser_id(parseInt(req.getParameter("user_id")));

        return item;
    }

    private int parseInt(String value) {
        if (value == null || value.isEmpty())
            throw new IllegalArgumentException("Missing parameter");
        return Integer.parseInt(value);
    }

    private void handleError(Exception e, HttpServletResponse resp) throws IOException {
        e.printStackTrace();
        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
    }
}