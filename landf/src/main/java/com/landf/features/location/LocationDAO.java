package com.landf.features.location;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.landf.features.database.ConnectionManager;

public class LocationDAO {

    private static final String LIST_LOCATIONS_SQL = """
            SELECT
                l.location_id,
                l.name,
                l.latitude,
                l.longitude,
                l.status,
                l.created_by,
                creator.username AS created_by_username,
                l.reviewed_by,
                reviewer.username AS reviewed_by_username,
                l.review_notes,
                l.created_at,
                l.reviewed_at
            FROM Locations l
            JOIN Users creator ON creator.user_id = l.created_by
            LEFT JOIN Users reviewer ON reviewer.user_id = l.reviewed_by
            ORDER BY
                CASE l.status
                    WHEN 'pending' THEN 0
                    WHEN 'rejected' THEN 1
                    ELSE 2
                END,
                l.created_at DESC
            """;
    private static final String LIST_PENDING_LOCATIONS_SQL = """
            SELECT
                l.location_id,
                l.name,
                l.latitude,
                l.longitude,
                l.status,
                l.created_by,
                creator.username AS created_by_username,
                l.reviewed_by,
                reviewer.username AS reviewed_by_username,
                l.review_notes,
                l.created_at,
                l.reviewed_at
            FROM Locations l
            JOIN Users creator ON creator.user_id = l.created_by
            LEFT JOIN Users reviewer ON reviewer.user_id = l.reviewed_by
            WHERE l.status = 'pending'
            ORDER BY l.created_at DESC
            """;
    private static final String FIND_LOCATION_BY_ID_SQL = """
            SELECT
                l.location_id,
                l.name,
                l.latitude,
                l.longitude,
                l.status,
                l.created_by,
                creator.username AS created_by_username,
                l.reviewed_by,
                reviewer.username AS reviewed_by_username,
                l.review_notes,
                l.created_at,
                l.reviewed_at
            FROM Locations l
            JOIN Users creator ON creator.user_id = l.created_by
            LEFT JOIN Users reviewer ON reviewer.user_id = l.reviewed_by
            WHERE l.location_id = ?
            LIMIT 1
            """;
    private static final String INSERT_LOCATION_SQL = """
            INSERT INTO Locations (name, latitude, longitude, status, created_by)
            VALUES (?, ?, ?, 'pending', ?)
            """;
    private static final String UPDATE_LOCATION_SQL = """
            UPDATE Locations
            SET name = ?, latitude = ?, longitude = ?
            WHERE location_id = ?
            """;
    private static final String DELETE_LOCATION_SQL = "DELETE FROM Locations WHERE location_id = ?";
    private static final String REVIEW_LOCATION_SQL = """
            UPDATE Locations
            SET status = ?, reviewed_by = ?, review_notes = ?, reviewed_at = NOW()
            WHERE location_id = ? AND status = 'pending'
            """;

    private final ConnectionManager connectionManager;

    public LocationDAO() {
        this(new ConnectionManager());
    }

    public LocationDAO(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    public List<LocationModel> listLocations() {
        List<LocationModel> locations = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_LOCATIONS_SQL); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                locations.add(mapLocation(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return locations;
    }

    public List<LocationModel> listPendingLocations() {
        List<LocationModel> locations = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_PENDING_LOCATIONS_SQL); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                locations.add(mapLocation(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return locations;
    }

    public Optional<LocationModel> findById(int locationId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(FIND_LOCATION_BY_ID_SQL)) {
            statement.setInt(1, locationId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(mapLocation(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public Optional<LocationModel> createLocation(LocationModel location) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_LOCATION_SQL, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, location.getName());
            statement.setDouble(2, location.getLatitude());
            statement.setDouble(3, location.getLongitude());
            statement.setInt(4, location.getCreatedByUserId());

            if (statement.executeUpdate() == 0) {
                return Optional.empty();
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return findById(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public boolean updateLocation(LocationModel location) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_LOCATION_SQL)) {
            statement.setString(1, location.getName());
            statement.setDouble(2, location.getLatitude());
            statement.setDouble(3, location.getLongitude());
            statement.setInt(4, location.getLocationId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteLocation(int locationId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_LOCATION_SQL)) {
            statement.setInt(1, locationId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean reviewLocation(int locationId, String decision, int reviewerId, String notes) {
        if (!isDecisionAllowed(decision)) {
            return false;
        }

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(REVIEW_LOCATION_SQL)) {
            statement.setString(1, decision.toLowerCase());
            statement.setInt(2, reviewerId);
            statement.setString(3, normalizeNotes(notes));
            statement.setInt(4, locationId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private LocationModel mapLocation(ResultSet resultSet) throws SQLException {
        Integer reviewedByUserId = resultSet.getObject("reviewed_by") == null ? null : resultSet.getInt("reviewed_by");

        return new LocationModel(
                resultSet.getInt("location_id"),
                resultSet.getString("name"),
                resultSet.getDouble("latitude"),
                resultSet.getDouble("longitude"),
                resultSet.getString("status"),
                resultSet.getInt("created_by"),
                resultSet.getString("created_by_username"),
                reviewedByUserId,
                resultSet.getString("reviewed_by_username"),
                resultSet.getString("review_notes"),
                toDateTimeString(resultSet.getTimestamp("created_at")),
                toDateTimeString(resultSet.getTimestamp("reviewed_at"))
        );
    }

    private Connection openConnection() throws SQLException {
        return connectionManager.getConnection();
    }

    private String normalizeNotes(String notes) {
        if (notes == null) {
            return null;
        }

        String normalized = notes.trim();
        if (normalized.isEmpty()) {
            return null;
        }

        return normalized.length() > 255 ? normalized.substring(0, 255) : normalized;
    }

    private String toDateTimeString(java.sql.Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toString();
    }

    private boolean isDecisionAllowed(String decision) {
        return "approved".equalsIgnoreCase(decision) || "rejected".equalsIgnoreCase(decision);
    }
}

