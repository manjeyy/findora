package com.landf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.landf.util.DatabaseConnection;

public class UserPointsDAO {

    public static List<Map<String, Object>> getTopUsersByPoints(int limit) throws SQLException {
        String sql = "SELECT u.user_id, u.username, u.profile_photo, COALESCE(up.points, 0) as points "
                + "FROM Users u "
                + "LEFT JOIN UserPoints up ON u.user_id = up.user_id "
                + "WHERE u.status = 'active' "
                + "ORDER BY points DESC, u.username ASC "
                + "LIMIT ?";

        List<Map<String, Object>> users = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, Object> user = new HashMap<>();
                user.put("userId", rs.getInt("user_id"));
                user.put("username", rs.getString("username"));
                user.put("points", rs.getInt("points"));
                user.put("profilePhoto", rs.getString("profile_photo"));
                users.add(user);
            }
        }
        return users;
    }

    public static void addPoints(int userId, int points) throws SQLException {
        String checkSql = "SELECT user_id FROM UserPoints WHERE user_id = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setInt(1, userId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Update existing record
                String updateSql = "UPDATE UserPoints SET points = points + ? WHERE user_id = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setInt(1, points);
                    updateStmt.setInt(2, userId);
                    updateStmt.executeUpdate();
                }
            } else {
                // Insert new record
                String insertSql = "INSERT INTO UserPoints (user_id, points, successful_actions, total_actions, penalty_events) VALUES (?, ?, 0, 0, 0)";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, userId);
                    insertStmt.setInt(2, points);
                    insertStmt.executeUpdate();
                }
            }
        }
    }
}
