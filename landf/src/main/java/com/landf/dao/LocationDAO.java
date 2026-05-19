package com.landf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.landf.models.Location;
import com.landf.util.DatabaseConnection;

public class LocationDAO {

    public static List<Location> getAllApprovedLocations() throws SQLException {
        String sql = "SELECT * FROM Locations WHERE status = 'approved' ORDER BY name ASC";

        List<Location> locations = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                locations.add(mapRowToLocation(rs));
            }
        }
        return locations;
    }

    public static Location getLocationById(int locationId) throws SQLException {
        String sql = "SELECT * FROM Locations WHERE location_id = ?";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, locationId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapRowToLocation(rs);
            }
        }
        return null;
    }

    private static Location mapRowToLocation(ResultSet rs) throws SQLException {
        Location location = new Location();
        location.setLocationId(rs.getInt("location_id"));
        location.setName(rs.getString("name"));
        location.setLatitude(rs.getDouble("latitude"));
        location.setLongitude(rs.getDouble("longitude"));
        location.setStatus(rs.getString("status"));
        location.setCreatedBy(rs.getInt("created_by"));

        return location;
    }
}
