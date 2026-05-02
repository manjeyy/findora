package com.landf.features.items;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.landf.features.database.ConnectionManager;

public class ItemDAO {

    private static final String LIST_ITEMS_BASE_SQL = """
            SELECT
                i.item_id,
                i.type,
                i.title,
                i.description,
                i.category,
                i.location_id,
                l.name AS location_name,
                i.event_date,
                i.image_url,
                i.user_id,
                reporter.username AS username,
                i.status,
                i.moderation_status,
                i.matched_item_id,
                i.claimed_by_claim_id,
                i.created_at,
                i.updated_at
            FROM Items i
            JOIN Locations l ON l.location_id = i.location_id
            JOIN Users reporter ON reporter.user_id = i.user_id
            WHERE 1 = 1
            """;
    private static final String FIND_ITEM_BY_ID_SQL = LIST_ITEMS_BASE_SQL + " AND i.item_id = ? LIMIT 1";
    private static final String INSERT_ITEM_SQL = """
            INSERT INTO Items (type, title, description, category, location_id, event_date, image_url, user_id)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """;
    private static final String UPDATE_ITEM_SQL = """
            UPDATE Items
            SET type = ?,
                title = ?,
                description = ?,
                category = ?,
                location_id = ?,
                event_date = ?,
                image_url = ?
            WHERE item_id = ?
            """;
    private static final String DELETE_ITEM_SQL = "DELETE FROM Items WHERE item_id = ?";

    public ItemDAO() {
    }

    public List<ItemModel> listItems(String type, String status, String category, Integer locationId) {
        List<ItemModel> items = new ArrayList<>();
        StringBuilder sql = new StringBuilder(LIST_ITEMS_BASE_SQL);
        List<Object> parameters = new ArrayList<>();

        if (type != null && !type.isBlank()) {
            sql.append(" AND i.type = ?");
            parameters.add(type.trim().toLowerCase());
        }

        if (status != null && !status.isBlank()) {
            sql.append(" AND i.status = ?");
            parameters.add(status.trim().toLowerCase());
        }

        if (category != null && !category.isBlank()) {
            sql.append(" AND i.category = ?");
            parameters.add(category.trim());
        }

        if (locationId != null) {
            sql.append(" AND i.location_id = ?");
            parameters.add(locationId);
        }

        sql.append(" ORDER BY i.created_at DESC");

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(sql.toString())) {
            bindParameters(statement, parameters);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    items.add(mapItem(resultSet));
                }
            }
        } catch (SQLException e) {
        }

        return items;
    }

    public Optional<ItemModel> findById(int itemId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(FIND_ITEM_BY_ID_SQL)) {
            statement.setInt(1, itemId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(mapItem(resultSet));
                }
            }
        } catch (SQLException e) {
        }

        return Optional.empty();
    }

    public Optional<ItemModel> createItem(ItemModel item) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_ITEM_SQL, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, item.getType());
            statement.setString(2, item.getTitle());
            statement.setString(3, item.getDescription());
            statement.setString(4, item.getCategory());
            statement.setInt(5, item.getLocationId());
            statement.setDate(6, Date.valueOf(LocalDate.parse(item.getEventDate())));
            statement.setString(7, item.getImageUrl());
            statement.setInt(8, item.getUserId());

            if (statement.executeUpdate() == 0) {
                return Optional.empty();
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return findById(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
        }

        return Optional.empty();
    }

    public boolean updateItem(ItemModel item) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_ITEM_SQL)) {
            statement.setString(1, item.getType());
            statement.setString(2, item.getTitle());
            statement.setString(3, item.getDescription());
            statement.setString(4, item.getCategory());
            statement.setInt(5, item.getLocationId());
            statement.setDate(6, Date.valueOf(LocalDate.parse(item.getEventDate())));
            statement.setString(7, item.getImageUrl());
            statement.setInt(8, item.getItemId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteItem(int itemId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_ITEM_SQL)) {
            statement.setInt(1, itemId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    private void bindParameters(PreparedStatement statement, List<Object> parameters) throws SQLException {
        for (int i = 0; i < parameters.size(); i++) {
            Object parameter = parameters.get(i);
            int index = i + 1;

            if (parameter instanceof Integer integer) {
                statement.setInt(index, integer);
            } else {
                statement.setString(index, parameter == null ? null : parameter.toString());
            }
        }
    }

    private ItemModel mapItem(ResultSet resultSet) throws SQLException {
        Integer matchedItemId = resultSet.getObject("matched_item_id") == null ? null : resultSet.getInt("matched_item_id");
        Integer claimedByClaimId = resultSet.getObject("claimed_by_claim_id") == null ? null : resultSet.getInt("claimed_by_claim_id");

        return new ItemModel(
                resultSet.getInt("item_id"),
                resultSet.getString("type"),
                resultSet.getString("title"),
                resultSet.getString("description"),
                resultSet.getString("category"),
                resultSet.getInt("location_id"),
                resultSet.getString("location_name"),
                toDateString(resultSet.getDate("event_date")),
                resultSet.getString("image_url"),
                resultSet.getInt("user_id"),
                resultSet.getString("username"),
                resultSet.getString("status"),
                resultSet.getString("moderation_status"),
                matchedItemId,
                claimedByClaimId,
                toTimestampString(resultSet.getTimestamp("created_at")),
                toTimestampString(resultSet.getTimestamp("updated_at"))
        );
    }

    private Connection openConnection() throws SQLException {
        return ConnectionManager.getConnection();
    }

    private String toDateString(Date date) {
        return date == null ? null : date.toString();
    }

    private String toTimestampString(java.sql.Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toString();
    }
}
