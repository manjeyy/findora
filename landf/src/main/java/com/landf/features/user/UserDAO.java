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
}
