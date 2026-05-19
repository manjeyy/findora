package com.landf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.landf.util.DatabaseConnection;

public class ReportDAO {
    public static void createReport(int reporterUserId, String targetType, int targetId, String reason, String details) throws SQLException {
        String sql = "INSERT INTO Reports (reporter_user_id, target_type, target_id, reason, details, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, 'pending', NOW())";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, reporterUserId);
            pstmt.setString(2, targetType);
            pstmt.setInt(3, targetId);
            pstmt.setString(4, reason);
            pstmt.setString(5, details);
            pstmt.executeUpdate();
        }
    }
}
