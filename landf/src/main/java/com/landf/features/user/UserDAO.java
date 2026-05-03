package com.landf.features.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.landf.features.database.ConnectionManager;

public class UserDAO {

    private static final String INSERT_USER_SQL
            = "INSERT INTO Users (username, email, password, role) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_USERNAME_SQL
            = "SELECT user_id, username, email, password, role, status, created_at FROM Users WHERE username = ? LIMIT 1";
    private static final String SELECT_USER_BY_EMAIL_SQL
            = "SELECT user_id, username, email, password, role, status, created_at FROM Users WHERE email = ? LIMIT 1";
    private static final String SELECT_USER_BY_ID_SQL
            = "SELECT user_id, username, email, password, role, status, created_at FROM Users WHERE user_id = ? LIMIT 1";
    private static final String SELECT_ALL_USERS_SQL
            = "SELECT user_id, username, email, password, role, status, created_at FROM Users ORDER BY user_id";
    private static final String EXISTS_USERNAME_SQL
            = "SELECT 1 FROM Users WHERE username = ? LIMIT 1";
    private static final String EXISTS_EMAIL_SQL
            = "SELECT 1 FROM Users WHERE email = ? LIMIT 1";
    private static final String UPDATE_USER_SQL
            = "UPDATE Users SET username = ?, email = ?, role = ?, status = ? WHERE user_id = ?";
    private static final String DELETE_USER_SQL
            = "DELETE FROM Users WHERE user_id = ?";
    private static final String LIST_USER_ITEMS_SQL = """
            SELECT
                i.item_id,
                i.type,
                i.title,
                i.description,
                i.category,
                i.location_id,
                l.name AS location_name,
                i.status,
                i.moderation_status,
                i.created_at
            FROM Items i
            JOIN Locations l ON l.location_id = i.location_id
            WHERE i.user_id = ?
            ORDER BY i.created_at DESC
            """;
    private static final String LIST_USER_CLAIMS_SQL = """
            SELECT
                c.claim_id,
                c.item_id,
                i.title AS item_title,
                i.type AS item_type,
                c.status,
                c.proof,
                c.identifiers,
                c.created_at,
                c.review_notes
            FROM Claims c
            JOIN Items i ON i.item_id = c.item_id
            WHERE c.claimant_user_id = ?
            ORDER BY c.created_at DESC
            """;
    private static final String LIST_USER_BADGES_SQL = """
            SELECT
                ub.user_badge_id,
                b.badge_id,
                b.name,
                b.description,
                b.criteria,
                ub.awarded_at
            FROM UserBadges ub
            JOIN Badges b ON b.badge_id = ub.badge_id
            WHERE ub.user_id = ?
            ORDER BY ub.awarded_at DESC
            """;
    private static final String FIND_USER_REPUTATION_SQL = """
            SELECT
                u.user_id,
                COALESCE(up.points, 0) AS points,
                COALESCE(up.successful_actions, 0) AS successful_actions,
                COALESCE(up.total_actions, 0) AS total_actions,
                COALESCE(up.penalty_events, 0) AS penalty_events,
                COALESCE(r.score, 0) AS score,
                COALESCE(r.trust_level, 'low') AS trust_level,
                r.updated_at AS updated_at
            FROM Users u
            LEFT JOIN UserPoints up ON up.user_id = u.user_id
            LEFT JOIN Reputation r ON r.user_id = u.user_id
            WHERE u.user_id = ?
            LIMIT 1
            """;
    private static final String LIST_USER_MISSIONS_SQL = """
            SELECT
                um.user_mission_id,
                um.mission_id,
                m.title,
                m.description,
                m.target_count,
                m.reward_points,
                um.progress_count,
                um.status,
                m.active,
                m.start_date,
                m.end_date,
                um.updated_at
            FROM UserMissions um
            JOIN Missions m ON m.mission_id = um.mission_id
            WHERE um.user_id = ?
            ORDER BY um.updated_at DESC
            """;

    private final ConnectionManager connectionManager;

    public UserDAO() {
        this(new ConnectionManager());
    }

    public UserDAO(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    public Optional<UserModel> createUser(UserModel user) throws SQLException, ClassNotFoundException {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_USER_SQL)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getRole());

            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                return Optional.empty();
            }

            return findByUsername(user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

    public Optional<UserModel> findByUsername(String username) throws SQLException, ClassNotFoundException {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_USERNAME_SQL)) {

            statement.setString(1, username);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(mapRow(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public Optional<UserModel> findByEmail(String email) throws SQLException, ClassNotFoundException {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_EMAIL_SQL)) {

            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(mapRow(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public Optional<UserModel> findById(int userId) throws SQLException, ClassNotFoundException {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_ID_SQL)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(mapRow(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public List<UserModel> listUsers() {
        List<UserModel> users = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS_SQL); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                users.add(mapRow(resultSet));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return users;
    }

    public boolean usernameExists(String username) {
        return exists(EXISTS_USERNAME_SQL, username);
    }

    public boolean emailExists(String email) {
        return exists(EXISTS_EMAIL_SQL, email);
    }

    private boolean exists(String sql, String value) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, value);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Connection openConnection() throws SQLException, ClassNotFoundException {
        Connection connection = ConnectionManager.getConnection();
        if (connection == null) {
            throw new SQLException("Unable to establish database connection.");
        }
        return connection;
    }

    private UserModel mapRow(ResultSet resultSet) throws SQLException {
        Timestamp createdAt = resultSet.getTimestamp("created_at");
        String createdAtValue = createdAt == null ? null : createdAt.toString();

        return new UserModel(
                resultSet.getInt("user_id"),
                resultSet.getString("username"),
                resultSet.getString("email"),
                resultSet.getString("password"),
                resultSet.getString("role"),
                resultSet.getString("status"),
                createdAtValue
        );
    }

    public boolean updatePasswordByUsername(String username, String newHashedPassword) {
        final String sql = "UPDATE Users SET password = ? WHERE username = ?";
        try (Connection connection = openConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newHashedPassword);
            stmt.setString(2, username);
            int updated = stmt.executeUpdate();
            return updated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(UserModel user) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getRole());
            statement.setString(4, user.getStatus());
            statement.setInt(5, user.getUser_id());
            return statement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<UserItemView> listItemsByUserId(int userId) {
        List<UserItemView> items = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_USER_ITEMS_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    items.add(new UserItemView(
                            resultSet.getInt("item_id"),
                            resultSet.getString("type"),
                            resultSet.getString("title"),
                            resultSet.getString("description"),
                            resultSet.getString("category"),
                            resultSet.getInt("location_id"),
                            resultSet.getString("location_name"),
                            resultSet.getString("status"),
                            resultSet.getString("moderation_status"),
                            toDateTimeString(resultSet.getTimestamp("created_at"))
                    ));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return items;
    }

    public List<UserClaimView> listClaimsByUserId(int userId) {
        List<UserClaimView> claims = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_USER_CLAIMS_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    claims.add(new UserClaimView(
                            resultSet.getInt("claim_id"),
                            resultSet.getInt("item_id"),
                            resultSet.getString("item_title"),
                            resultSet.getString("item_type"),
                            resultSet.getString("status"),
                            resultSet.getString("proof"),
                            resultSet.getString("identifiers"),
                            toDateTimeString(resultSet.getTimestamp("created_at")),
                            resultSet.getString("review_notes")
                    ));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return claims;
    }

    public List<UserBadgeView> listBadgesByUserId(int userId) {
        List<UserBadgeView> badges = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_USER_BADGES_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    badges.add(new UserBadgeView(
                            resultSet.getInt("user_badge_id"),
                            resultSet.getInt("badge_id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getString("criteria"),
                            toDateTimeString(resultSet.getTimestamp("awarded_at"))
                    ));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return badges;
    }

    public Optional<UserReputationView> findReputationByUserId(int userId) {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(FIND_USER_REPUTATION_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(new UserReputationView(
                            resultSet.getInt("user_id"),
                            resultSet.getInt("points"),
                            resultSet.getInt("successful_actions"),
                            resultSet.getInt("total_actions"),
                            resultSet.getInt("penalty_events"),
                            resultSet.getDouble("score"),
                            resultSet.getString("trust_level"),
                            toDateTimeString(resultSet.getTimestamp("updated_at"))
                    ));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    public List<UserMissionView> listMissionsByUserId(int userId) {
        List<UserMissionView> missions = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_USER_MISSIONS_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    missions.add(new UserMissionView(
                            resultSet.getInt("user_mission_id"),
                            resultSet.getInt("mission_id"),
                            resultSet.getString("title"),
                            resultSet.getString("description"),
                            resultSet.getInt("target_count"),
                            resultSet.getInt("reward_points"),
                            resultSet.getInt("progress_count"),
                            resultSet.getString("status"),
                            resultSet.getBoolean("active"),
                            resultSet.getString("start_date"),
                            resultSet.getString("end_date"),
                            toDateTimeString(resultSet.getTimestamp("updated_at"))
                    ));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return missions;
    }

    private String toDateTimeString(Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toString();
    }
}
