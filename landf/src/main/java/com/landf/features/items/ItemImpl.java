package com.landf.features.items;

import com.landf.features.database.ConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemImpl {

    private Item map(ResultSet rs) throws SQLException {
        Item item = new Item();
        item.setItem_id(rs.getInt("item_id"));
        item.setType(rs.getString("type"));
        item.setTitle(rs.getString("title"));
        item.setDescription(rs.getString("description"));
        item.setCategory(rs.getString("category"));
        item.setLocation_id(rs.getInt("location_id"));
        item.setEvent_date(rs.getDate("event_date"));
        item.setImage_url(rs.getString("image_url"));
        item.setUser_id(rs.getInt("user_id"));
        item.setStatus(rs.getString("status"));
        item.setModeration_status(rs.getString("moderation_status"));
        item.setMatched_item_id((Integer) rs.getObject("matched_item_id"));
        item.setClaimed_by_claim_id((Integer) rs.getObject("claimed_by_claim_id"));
        item.setCreated_at(rs.getTimestamp("created_at"));
        item.setUpdated_at(rs.getTimestamp("updated_at"));
        return item;
    }

    public boolean createItem(Item item) throws SQLException {
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.INSERT_ITEM)) {

            ps.setString(1, item.getType());
            ps.setString(2, item.getTitle());
            ps.setString(3, item.getDescription());
            ps.setString(4, item.getCategory());
            ps.setInt(5, item.getLocation_id());
            ps.setDate(6, item.getEvent_date());
            ps.setString(7, item.getImage_url());
            ps.setInt(8, item.getUser_id());
            ps.setString(9, item.getStatus());
            ps.setString(10, item.getModeration_status());
            ps.setObject(11, item.getMatched_item_id());
            ps.setObject(12, item.getClaimed_by_claim_id());

            return ps.executeUpdate() > 0;
        }
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> items = new ArrayList<>();

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                items.add(map(rs));
            }
        }
        return items;
    }

    public Item getItemByID(int itemId) throws SQLException {
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_ID)) {

            ps.setInt(1, itemId);
            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return map(rs);
                }
                return null; // important
            }
        }
    }


    public List<Item> getItemByUser(int userId) throws SQLException {
        List<Item> items = new ArrayList<>();

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_USER)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    items.add(map(rs));
                }
            }
        }
        return items;
    }


    public List<Item> getItemByLocation(int locationId) throws SQLException {
        List<Item> items = new ArrayList<>();

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_LOCATION)) {

            ps.setInt(1, locationId);
            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    items.add(map(rs));
                }
            }
        }
        return items;
    }

    public boolean deleteItemById(int itemId) throws SQLException {
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.DELETE_ITEMS_BY_ID)) {

            ps.setInt(1, itemId);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateItemById(Item item) throws SQLException {
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.UPDATE_ITEM_BY_ID)) {

            ps.setString(1, item.getType());
            ps.setString(2, item.getTitle());
            ps.setString(3, item.getDescription());
            ps.setString(4, item.getCategory());
            ps.setInt(5, item.getLocation_id());
            ps.setDate(6, item.getEvent_date());
            ps.setString(7, item.getImage_url());
            ps.setInt(8, item.getUser_id());
            ps.setString(9, item.getStatus());
            ps.setString(10, item.getModeration_status());
            ps.setObject(11, item.getMatched_item_id());
            ps.setObject(12, item.getClaimed_by_claim_id());
            ps.setInt(13, item.getItem_id());

            return ps.executeUpdate() > 0;
        }
    }
}
