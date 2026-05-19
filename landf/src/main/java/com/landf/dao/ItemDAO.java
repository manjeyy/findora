package com.landf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.landf.models.Item;
import com.landf.util.DatabaseConnection;

public class ItemDAO {

    public static void createItem(Item item) throws SQLException {
        String sql = "INSERT INTO Items (type, title, description, category, location_id, event_date, "
                + "image_url, user_id, status, moderation_status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, item.getType());
            pstmt.setString(2, item.getTitle());
            pstmt.setString(3, item.getDescription());
            pstmt.setString(4, item.getCategory());
            pstmt.setInt(5, item.getLocationId());
            pstmt.setString(6, item.getEventDate());
            pstmt.setString(7, item.getImageUrl());
            pstmt.setInt(8, item.getUserId());
            pstmt.setString(9, item.getStatus());
            pstmt.setString(10, item.getModerationStatus());
            pstmt.executeUpdate();
        }
    }

    public static Item getItemById(int itemId) throws SQLException {
        String sql = "SELECT i.*, l.name as location_name, u.username, u.email as owner_email "
                + "FROM Items i "
                + "LEFT JOIN Locations l ON i.location_id = l.location_id "
                + "LEFT JOIN Users u ON i.user_id = u.user_id "
                + "WHERE i.item_id = ?";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, itemId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapRowToItem(rs);
            }
        }
        return null;
    }

    public static List<Item> getItemsByType(String type, int limit, int offset) throws SQLException {
        String sql = "SELECT i.*, l.name as location_name, u.username, u.email as owner_email "
                + "FROM Items i "
                + "LEFT JOIN Locations l ON i.location_id = l.location_id "
                + "LEFT JOIN Users u ON i.user_id = u.user_id "
                + "WHERE i.type = ? AND i.status = 'open' AND i.moderation_status = 'clean' "
                + "ORDER BY i.created_at DESC LIMIT ? OFFSET ?";

        List<Item> items = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, type);
            pstmt.setInt(2, limit);
            pstmt.setInt(3, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                items.add(mapRowToItem(rs));
            }
        }
        return items;
    }

    public static List<Item> getAllItems(String category, String location, int limit, int offset) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT i.*, l.name as location_name, u.username, u.email as owner_email "
                + "FROM Items i "
                + "LEFT JOIN Locations l ON i.location_id = l.location_id "
                + "LEFT JOIN Users u ON i.user_id = u.user_id "
                + "WHERE i.status = 'open' AND i.moderation_status = 'clean'");

        List<Object> params = new ArrayList<>();

        if (category != null && !category.isEmpty() && !category.equals("All")) {
            sql.append(" AND i.category = ?");
            params.add(category);
        }

        if (location != null && !location.isEmpty() && !location.equals("All")) {
            sql.append(" AND i.location_id = ?");
            params.add(Integer.parseInt(location));
        }

        sql.append(" ORDER BY i.created_at DESC LIMIT ? OFFSET ?");
        params.add(limit);
        params.add(offset);

        List<Item> items = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                Object param = params.get(i);
                if (param instanceof String) {
                    pstmt.setString(i + 1, (String) param);
                } else {
                    pstmt.setInt(i + 1, (Integer) param);
                }
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                items.add(mapRowToItem(rs));
            }
        }
        return items;
    }

    public static List<Item> getRecentItems(int limit) throws SQLException {
        String sql = "SELECT i.*, l.name as location_name, u.username, u.email as owner_email "
                + "FROM Items i "
                + "LEFT JOIN Locations l ON i.location_id = l.location_id "
                + "LEFT JOIN Users u ON i.user_id = u.user_id "
                + "WHERE i.status = 'open' AND i.moderation_status = 'clean' "
                + "ORDER BY i.created_at DESC LIMIT ?";

        List<Item> items = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                items.add(mapRowToItem(rs));
            }
        }
        return items;
    }

    public static int getTotalItemCount(String category, String location) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) as count FROM Items i "
                + "WHERE i.status = 'open' AND i.moderation_status = 'clean'");

        List<Object> params = new ArrayList<>();

        if (category != null && !category.isEmpty() && !category.equals("All")) {
            sql.append(" AND i.category = ?");
            params.add(category);
        }

        if (location != null && !location.isEmpty() && !location.equals("All")) {
            sql.append(" AND i.location_id = ?");
            params.add(Integer.parseInt(location));
        }

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                Object param = params.get(i);
                if (param instanceof String) {
                    pstmt.setString(i + 1, (String) param);
                } else {
                    pstmt.setInt(i + 1, (Integer) param);
                }
            }

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    public static List<Item> getRecentlyResolvedItems(int limit) throws SQLException {
        String sql = "SELECT i.*, l.name as location_name, u.username "
                + "FROM Items i "
                + "LEFT JOIN Locations l ON i.location_id = l.location_id "
                + "LEFT JOIN Users u ON i.user_id = u.user_id "
                + "WHERE i.status IN ('matched', 'claimed', 'returned') AND i.moderation_status = 'clean' "
                + "ORDER BY i.created_at DESC LIMIT ?";

        List<Item> items = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                items.add(mapRowToItem(rs));
            }
        }
        return items;
    }

    private static Item mapRowToItem(ResultSet rs) throws SQLException {
        Item item = new Item();
        item.setItemId(rs.getInt("item_id"));
        item.setType(rs.getString("type"));
        item.setTitle(rs.getString("title"));
        item.setDescription(rs.getString("description"));
        item.setCategory(rs.getString("category"));
        item.setLocationId(rs.getInt("location_id"));
        item.setEventDate(rs.getString("event_date"));
        item.setImageUrl(rs.getString("image_url"));
        item.setUserId(rs.getInt("user_id"));
        item.setStatus(rs.getString("status"));
        item.setModerationStatus(rs.getString("moderation_status"));
        item.setLocationName(rs.getString("location_name"));
        item.setUserName(rs.getString("username"));
        item.setOwnerEmail(rs.getString("owner_email"));

        Timestamp createdAt = rs.getTimestamp("created_at");
        if (createdAt != null) {
            item.setCreatedAt(createdAt.toLocalDateTime());
        }

        return item;
    }
}
