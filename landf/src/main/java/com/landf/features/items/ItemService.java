package com.landf.features.items;

import java.sql.SQLException;
import java.util.List;

public class ItemService {
    private ItemImpl itemDAO = new ItemImpl();

    public List<Item> getAllItems() throws SQLException {
        return itemDAO.getAllItems();
    }

    public Item getItemById(int id) throws SQLException {
        if (id <= 0) throw new IllegalArgumentException("Invalid ID");
        return itemDAO.getItemByID(id);
    }

    public List<Item> getItemsByUser(int userId) throws SQLException {
        if (userId <= 0) throw new IllegalArgumentException("Invalid user ID");
        return itemDAO.getItemByUser(userId);
    }

    public List<Item> getItemsByLocation(int locationId) throws SQLException {
        if (locationId <= 0) throw new IllegalArgumentException("Invalid location ID");
        return itemDAO.getItemByLocation(locationId);
    }

    public void createItem(Item item) throws SQLException {
        validateItem(item);
        itemDAO.createItem(item);
    }

    public void updateItem(Item item) throws SQLException {
        if (item.getItem_id() <= 0) throw new IllegalArgumentException("Invalid item ID");
        validateItem(item);
        itemDAO.updateItemById(item);
    }

    public void deleteItem(int id) throws SQLException {
        if (id <= 0) throw new IllegalArgumentException("Invalid ID");
        itemDAO.deleteItemById(id);
    }

    private void validateItem(Item item) {
        if (item.getTitle() == null || item.getTitle().isEmpty())
            throw new IllegalArgumentException("Title is required");

        if (item.getType() == null || item.getType().isEmpty())
            throw new IllegalArgumentException("Type is required");
    }
}
