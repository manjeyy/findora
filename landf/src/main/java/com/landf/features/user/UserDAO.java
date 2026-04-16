package com.landf.features.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Optional;

import com.landf.features.database.ConnectionManager;

public class UserDAO {

    private static final String INSERT_USER_SQL
            = "INSERT INTO Users (username, email, password, role) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_USERNAME_SQL
            = "SELECT user_id, username, email, password, role, status, created_at FROM Users WHERE username = ? LIMIT 1";
    private static final String EXISTS_USERNAME_SQL
            = "SELECT 1 FROM Users WHERE username = ? LIMIT 1";
    private static final String EXISTS_EMAIL_SQL
            = "SELECT 1 FROM Users WHERE email = ? LIMIT 1";

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
        Connection connection = connectionManager.getConnection();
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
}
