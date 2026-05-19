package com.landf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.landf.util.DatabaseConnection;

public class ClaimDAO {
    public static void createClaim(int itemId, int claimantUserId, String proof, String identifiers) throws SQLException {
        String sql = "INSERT INTO Claims (item_id, claimant_user_id, proof, identifiers, status, created_at) "
                + "VALUES (?, ?, ?, ?, 'pending', NOW())";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, itemId);
            pstmt.setInt(2, claimantUserId);
            pstmt.setString(3, proof);
            pstmt.setString(4, identifiers);
            pstmt.executeUpdate();
        }
    }
}
