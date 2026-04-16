package com.landf.features.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.landf.features.database.ConnectionManager;

public class AdminDAO {

    private static final int REWARD_FOUND_ITEM_SUCCESSFUL_CLAIM = 50;
    private static final int REWARD_SUCCESSFUL_CLAIM = 40;
    private static final int PENALTY_FALSE_CLAIM = 30;
    private static final int PENALTY_FAKE_REPORT = 50;

    private static final String DASHBOARD_STATS_SQL = """
            SELECT
                (SELECT COUNT(*) FROM Locations WHERE status = 'pending') AS pending_locations,
                (SELECT COUNT(*) FROM Claims WHERE status = 'pending') AS pending_claims,
                (SELECT COUNT(*) FROM Reports WHERE status = 'pending') AS pending_reports,
                (SELECT COUNT(*) FROM Items WHERE status = 'open') AS open_items,
                (SELECT COUNT(*) FROM Users) AS total_users,
                (SELECT COUNT(*) FROM Users WHERE status = 'suspended') AS suspended_users,
                (SELECT COUNT(*) FROM Claims WHERE status = 'approved') AS total_recoveries
            """;

    private static final String LIST_LOCATIONS_SQL = """
            SELECT
                l.location_id,
                l.name,
                l.latitude,
                l.longitude,
                l.status,
                creator.username AS created_by,
                reviewer.username AS reviewed_by,
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

    private static final String REVIEW_LOCATION_SQL = """
            UPDATE Locations
            SET status = ?, reviewed_by = ?, review_notes = ?, reviewed_at = NOW()
            WHERE location_id = ? AND status = 'pending'
            """;

    private static final String LIST_CLAIMS_SQL = """
            SELECT
                c.claim_id,
                c.item_id,
                i.title AS item_title,
                i.type AS item_type,
                i.status AS item_status,
                claimant.username AS claimant_username,
                c.status,
                c.proof,
                c.identifiers,
                c.created_at,
                reviewer.username AS reviewed_by,
                c.review_notes
            FROM Claims c
            JOIN Items i ON i.item_id = c.item_id
            JOIN Users claimant ON claimant.user_id = c.claimant_user_id
            LEFT JOIN Users reviewer ON reviewer.user_id = c.reviewed_by
            ORDER BY
                CASE c.status
                    WHEN 'pending' THEN 0
                    ELSE 1
                END,
                c.created_at DESC
            """;

    private static final String CLAIM_CONTEXT_FOR_UPDATE_SQL = """
            SELECT
                c.claim_id,
                c.item_id,
                c.claimant_user_id,
                c.status,
                i.user_id AS reporter_user_id,
                i.type AS item_type
            FROM Claims c
            JOIN Items i ON i.item_id = c.item_id
            WHERE c.claim_id = ?
            FOR UPDATE
            """;

    private static final String UPDATE_CLAIM_STATUS_SQL = """
            UPDATE Claims
            SET status = ?, reviewed_by = ?, review_notes = ?, reviewed_at = NOW()
            WHERE claim_id = ? AND status = 'pending'
            """;

    private static final String REJECT_OTHER_CLAIMS_SQL = """
            UPDATE Claims
            SET status = 'rejected', reviewed_by = ?, review_notes = ?, reviewed_at = NOW()
            WHERE item_id = ? AND claim_id <> ? AND status = 'pending'
            """;

    private static final String CLOSE_ITEM_FOR_CLAIM_SQL = """
            UPDATE Items
            SET status = 'closed', claimed_by_claim_id = ?, updated_at = NOW()
            WHERE item_id = ?
            """;

    private static final String LIST_ITEMS_SQL = """
            SELECT
                i.item_id,
                i.type,
                i.title,
                i.category,
                l.name AS location_name,
                reporter.username AS reporter_username,
                i.status,
                i.moderation_status,
                i.created_at
            FROM Items i
            JOIN Locations l ON l.location_id = i.location_id
            JOIN Users reporter ON reporter.user_id = i.user_id
            ORDER BY i.created_at DESC
            """;

    private static final String ITEM_CONTEXT_FOR_UPDATE_SQL = """
            SELECT item_id, user_id
            FROM Items
            WHERE item_id = ?
            FOR UPDATE
            """;

    private static final String MARK_ITEM_CLOSED_SQL = """
            UPDATE Items
            SET status = 'closed', updated_at = NOW()
            WHERE item_id = ?
            """;

    private static final String MARK_ITEM_OPEN_SQL = """
            UPDATE Items
            SET status = 'open', moderation_status = 'clean', updated_at = NOW()
            WHERE item_id = ?
            """;

    private static final String FLAG_ITEM_SQL = """
            UPDATE Items
            SET moderation_status = 'flagged', updated_at = NOW()
            WHERE item_id = ?
            """;

    private static final String MARK_ITEM_SPAM_SQL = """
            UPDATE Items
            SET status = 'closed', moderation_status = 'spam', updated_at = NOW()
            WHERE item_id = ?
            """;

    private static final String LIST_USERS_SQL = """
            SELECT
                u.user_id,
                u.username,
                u.email,
                u.role,
                u.status,
                COALESCE(up.points, 0) AS points,
                COALESCE(r.score, 0) AS reputation_score,
                COALESCE(r.trust_level, 'low') AS trust_level,
                u.created_at
            FROM Users u
            LEFT JOIN UserPoints up ON up.user_id = u.user_id
            LEFT JOIN Reputation r ON r.user_id = u.user_id
            ORDER BY u.created_at DESC
            """;

    private static final String UPDATE_USER_SQL = """
            UPDATE Users
            SET role = ?, status = ?, updated_at = NOW()
            WHERE user_id = ?
            """;

    private static final String LIST_REPORTS_SQL = """
            SELECT
                r.report_id,
                reporter.username AS reporter_username,
                r.target_type,
                r.target_id,
                r.reason,
                r.status,
                r.created_at,
                reviewer.username AS reviewed_by,
                r.review_notes
            FROM Reports r
            JOIN Users reporter ON reporter.user_id = r.reporter_user_id
            LEFT JOIN Users reviewer ON reviewer.user_id = r.reviewed_by
            ORDER BY
                CASE r.status
                    WHEN 'pending' THEN 0
                    ELSE 1
                END,
                r.created_at DESC
            """;

    private static final String REVIEW_REPORT_SQL = """
            UPDATE Reports
            SET status = ?, reviewed_by = ?, review_notes = ?, reviewed_at = NOW()
            WHERE report_id = ? AND status = 'pending'
            """;

    private static final String ENSURE_USER_POINTS_SQL = """
            INSERT INTO UserPoints (user_id)
            VALUES (?)
            ON DUPLICATE KEY UPDATE user_id = user_id
            """;

    private static final String ENSURE_REPUTATION_SQL = """
            INSERT INTO Reputation (user_id)
            VALUES (?)
            ON DUPLICATE KEY UPDATE user_id = user_id
            """;

    private static final String UPDATE_USER_POINTS_SQL = """
            UPDATE UserPoints
            SET points = points + ?,
                successful_actions = successful_actions + ?,
                total_actions = total_actions + ?,
                penalty_events = penalty_events + ?,
                updated_at = NOW()
            WHERE user_id = ?
            """;

    private static final String SELECT_REPUTATION_INPUT_SQL = """
            SELECT successful_actions, total_actions, penalty_events
            FROM UserPoints
            WHERE user_id = ?
            """;

    private static final String UPDATE_REPUTATION_SQL = """
            UPDATE Reputation
            SET score = ?, trust_level = ?, updated_at = NOW()
            WHERE user_id = ?
            """;

    private final ConnectionManager connectionManager;

    public AdminDAO() {
        this(new ConnectionManager());
    }

    public AdminDAO(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    public AdminDashboardStats loadDashboardStats() {
        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(DASHBOARD_STATS_SQL); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return new AdminDashboardStats(
                        resultSet.getInt("pending_locations"),
                        resultSet.getInt("pending_claims"),
                        resultSet.getInt("pending_reports"),
                        resultSet.getInt("open_items"),
                        resultSet.getInt("total_users"),
                        resultSet.getInt("suspended_users"),
                        resultSet.getInt("total_recoveries")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new AdminDashboardStats(0, 0, 0, 0, 0, 0, 0);
    }

    public List<AdminLocationView> listLocations() {
        List<AdminLocationView> locations = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_LOCATIONS_SQL); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                locations.add(new AdminLocationView(
                        resultSet.getInt("location_id"),
                        resultSet.getString("name"),
                        resultSet.getDouble("latitude"),
                        resultSet.getDouble("longitude"),
                        resultSet.getString("status"),
                        resultSet.getString("created_by"),
                        resultSet.getString("reviewed_by"),
                        resultSet.getString("review_notes"),
                        toDateTimeString(resultSet.getTimestamp("created_at")),
                        toDateTimeString(resultSet.getTimestamp("reviewed_at"))
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return locations;
    }

    public boolean reviewLocation(int locationId, String decision, int reviewerId, String notes) {
        if (!isLocationDecisionAllowed(decision)) {
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

    public List<AdminClaimView> listClaims() {
        List<AdminClaimView> claims = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_CLAIMS_SQL); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                claims.add(new AdminClaimView(
                        resultSet.getInt("claim_id"),
                        resultSet.getInt("item_id"),
                        resultSet.getString("item_title"),
                        resultSet.getString("item_type"),
                        resultSet.getString("item_status"),
                        resultSet.getString("claimant_username"),
                        resultSet.getString("status"),
                        resultSet.getString("proof"),
                        resultSet.getString("identifiers"),
                        toDateTimeString(resultSet.getTimestamp("created_at")),
                        resultSet.getString("reviewed_by"),
                        resultSet.getString("review_notes")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return claims;
    }

    public boolean reviewClaim(int claimId, String decision, int reviewerId, String notes) {
        if (!isClaimDecisionAllowed(decision)) {
            return false;
        }

        try (Connection connection = openConnection()) {
            boolean previousAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(false);

            try {
                ClaimContext context = loadClaimContextForUpdate(connection, claimId);
                if (context == null || !"pending".equalsIgnoreCase(context.status)) {
                    connection.rollback();
                    return false;
                }

                if ("approved".equalsIgnoreCase(decision)) {
                    if (!updateClaimStatus(connection, claimId, "approved", reviewerId, notes)) {
                        connection.rollback();
                        return false;
                    }

                    rejectOtherClaimsForItem(connection, context.itemId, claimId, reviewerId);

                    try (PreparedStatement closeItemStatement = connection.prepareStatement(CLOSE_ITEM_FOR_CLAIM_SQL)) {
                        closeItemStatement.setInt(1, claimId);
                        closeItemStatement.setInt(2, context.itemId);
                        closeItemStatement.executeUpdate();
                    }

                    adjustPoints(connection, context.claimantUserId, REWARD_SUCCESSFUL_CLAIM, 1, 1, 0);
                    recalculateReputation(connection, context.claimantUserId);

                    if ("found".equalsIgnoreCase(context.itemType)) {
                        adjustPoints(connection, context.reporterUserId, REWARD_FOUND_ITEM_SUCCESSFUL_CLAIM, 1, 1, 0);
                        recalculateReputation(connection, context.reporterUserId);
                    }
                } else {
                    if (!updateClaimStatus(connection, claimId, "rejected", reviewerId, notes)) {
                        connection.rollback();
                        return false;
                    }

                    adjustPoints(connection, context.claimantUserId, -PENALTY_FALSE_CLAIM, 0, 1, 1);
                    recalculateReputation(connection, context.claimantUserId);
                }

                connection.commit();
                return true;
            } catch (SQLException e) {
                connection.rollback();
                e.printStackTrace();
                return false;
            } finally {
                connection.setAutoCommit(previousAutoCommit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<AdminItemView> listItems() {
        List<AdminItemView> items = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_ITEMS_SQL); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                items.add(new AdminItemView(
                        resultSet.getInt("item_id"),
                        resultSet.getString("type"),
                        resultSet.getString("title"),
                        resultSet.getString("category"),
                        resultSet.getString("location_name"),
                        resultSet.getString("reporter_username"),
                        resultSet.getString("status"),
                        resultSet.getString("moderation_status"),
                        toDateTimeString(resultSet.getTimestamp("created_at"))
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    public boolean moderateItem(int itemId, String action) {
        if (!isItemActionAllowed(action)) {
            return false;
        }

        String normalizedAction = action.toLowerCase();

        try (Connection connection = openConnection()) {
            boolean previousAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(false);

            try {
                ItemContext itemContext = loadItemContextForUpdate(connection, itemId);
                if (itemContext == null) {
                    connection.rollback();
                    return false;
                }

                int affectedRows;
                switch (normalizedAction) {
                    case "close" ->
                        affectedRows = executeSingleItemUpdate(connection, MARK_ITEM_CLOSED_SQL, itemId);
                    case "reopen" ->
                        affectedRows = executeSingleItemUpdate(connection, MARK_ITEM_OPEN_SQL, itemId);
                    case "flag" ->
                        affectedRows = executeSingleItemUpdate(connection, FLAG_ITEM_SQL, itemId);
                    case "mark_spam" -> {
                        affectedRows = executeSingleItemUpdate(connection, MARK_ITEM_SPAM_SQL, itemId);
                        if (affectedRows > 0) {
                            adjustPoints(connection, itemContext.reporterUserId, -PENALTY_FAKE_REPORT, 0, 1, 1);
                            recalculateReputation(connection, itemContext.reporterUserId);
                        }
                    }
                    default -> {
                        connection.rollback();
                        return false;
                    }
                }

                if (affectedRows <= 0) {
                    connection.rollback();
                    return false;
                }

                connection.commit();
                return true;
            } catch (SQLException e) {
                connection.rollback();
                e.printStackTrace();
                return false;
            } finally {
                connection.setAutoCommit(previousAutoCommit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<AdminUserView> listUsers() {
        List<AdminUserView> users = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_USERS_SQL); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                users.add(new AdminUserView(
                        resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("role"),
                        resultSet.getString("status"),
                        resultSet.getInt("points"),
                        resultSet.getDouble("reputation_score"),
                        resultSet.getString("trust_level"),
                        toDateTimeString(resultSet.getTimestamp("created_at"))
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public boolean updateUser(int userId, String role, String status) {
        if (!isRoleAllowed(role) || !isUserStatusAllowed(status)) {
            return false;
        }

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER_SQL)) {

            statement.setString(1, role.toLowerCase());
            statement.setString(2, status.toLowerCase());
            statement.setInt(3, userId);

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<AdminReportView> listReports() {
        List<AdminReportView> reports = new ArrayList<>();

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(LIST_REPORTS_SQL); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                reports.add(new AdminReportView(
                        resultSet.getInt("report_id"),
                        resultSet.getString("reporter_username"),
                        resultSet.getString("target_type"),
                        resultSet.getInt("target_id"),
                        resultSet.getString("reason"),
                        resultSet.getString("status"),
                        toDateTimeString(resultSet.getTimestamp("created_at")),
                        resultSet.getString("reviewed_by"),
                        resultSet.getString("review_notes")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reports;
    }

    public boolean reviewReport(int reportId, String decision, int reviewerId, String notes) {
        if (!isReportDecisionAllowed(decision)) {
            return false;
        }

        try (Connection connection = openConnection(); PreparedStatement statement = connection.prepareStatement(REVIEW_REPORT_SQL)) {

            statement.setString(1, decision.toLowerCase());
            statement.setInt(2, reviewerId);
            statement.setString(3, normalizeNotes(notes));
            statement.setInt(4, reportId);

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private ClaimContext loadClaimContextForUpdate(Connection connection, int claimId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(CLAIM_CONTEXT_FOR_UPDATE_SQL)) {
            statement.setInt(1, claimId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new ClaimContext(
                            resultSet.getInt("claim_id"),
                            resultSet.getInt("item_id"),
                            resultSet.getInt("claimant_user_id"),
                            resultSet.getString("status"),
                            resultSet.getInt("reporter_user_id"),
                            resultSet.getString("item_type")
                    );
                }
            }
        }

        return null;
    }

    private ItemContext loadItemContextForUpdate(Connection connection, int itemId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(ITEM_CONTEXT_FOR_UPDATE_SQL)) {
            statement.setInt(1, itemId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new ItemContext(
                            resultSet.getInt("item_id"),
                            resultSet.getInt("user_id")
                    );
                }
            }
        }

        return null;
    }

    private boolean updateClaimStatus(Connection connection, int claimId, String status, int reviewerId, String notes)
            throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(UPDATE_CLAIM_STATUS_SQL)) {
            statement.setString(1, status);
            statement.setInt(2, reviewerId);
            statement.setString(3, normalizeNotes(notes));
            statement.setInt(4, claimId);

            return statement.executeUpdate() > 0;
        }
    }

    private void rejectOtherClaimsForItem(Connection connection, int itemId, int approvedClaimId, int reviewerId)
            throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(REJECT_OTHER_CLAIMS_SQL)) {
            statement.setInt(1, reviewerId);
            statement.setString(2, "Another claim was approved by admin.");
            statement.setInt(3, itemId);
            statement.setInt(4, approvedClaimId);
            statement.executeUpdate();
        }
    }

    private int executeSingleItemUpdate(Connection connection, String sql, int itemId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, itemId);
            return statement.executeUpdate();
        }
    }

    private void adjustPoints(
            Connection connection,
            int userId,
            int pointsDelta,
            int successfulActionsDelta,
            int totalActionsDelta,
            int penaltyEventsDelta
    ) throws SQLException {
        ensureUserPointsRow(connection, userId);

        try (PreparedStatement statement = connection.prepareStatement(UPDATE_USER_POINTS_SQL)) {
            statement.setInt(1, pointsDelta);
            statement.setInt(2, successfulActionsDelta);
            statement.setInt(3, totalActionsDelta);
            statement.setInt(4, penaltyEventsDelta);
            statement.setInt(5, userId);
            statement.executeUpdate();
        }
    }

    private void recalculateReputation(Connection connection, int userId) throws SQLException {
        ensureReputationRow(connection, userId);

        int successfulActions = 0;
        int totalActions = 0;
        int penaltyEvents = 0;

        try (PreparedStatement statement = connection.prepareStatement(SELECT_REPUTATION_INPUT_SQL)) {
            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    successfulActions = resultSet.getInt("successful_actions");
                    totalActions = resultSet.getInt("total_actions");
                    penaltyEvents = resultSet.getInt("penalty_events");
                }
            }
        }

        double score = 0;
        if (totalActions > 0) {
            score = ((double) successfulActions / (double) totalActions) - penaltyEvents;
        }

        String trustLevel;
        if (score >= 0.75) {
            trustLevel = "high";
        } else if (score >= 0.25) {
            trustLevel = "medium";
        } else {
            trustLevel = "low";
        }

        try (PreparedStatement statement = connection.prepareStatement(UPDATE_REPUTATION_SQL)) {
            statement.setDouble(1, score);
            statement.setString(2, trustLevel);
            statement.setInt(3, userId);
            statement.executeUpdate();
        }
    }

    private void ensureUserPointsRow(Connection connection, int userId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(ENSURE_USER_POINTS_SQL)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }

    private void ensureReputationRow(Connection connection, int userId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(ENSURE_REPUTATION_SQL)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
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

        if (normalized.length() > 255) {
            return normalized.substring(0, 255);
        }

        return normalized;
    }

    private String toDateTimeString(Timestamp timestamp) {
        return timestamp == null ? "" : timestamp.toString();
    }

    private boolean isLocationDecisionAllowed(String decision) {
        return "approved".equalsIgnoreCase(decision) || "rejected".equalsIgnoreCase(decision);
    }

    private boolean isClaimDecisionAllowed(String decision) {
        return "approved".equalsIgnoreCase(decision) || "rejected".equalsIgnoreCase(decision);
    }

    private boolean isItemActionAllowed(String action) {
        return "close".equalsIgnoreCase(action)
                || "reopen".equalsIgnoreCase(action)
                || "flag".equalsIgnoreCase(action)
                || "mark_spam".equalsIgnoreCase(action);
    }

    private boolean isRoleAllowed(String role) {
        return "admin".equalsIgnoreCase(role)
                || "location_admin".equalsIgnoreCase(role)
                || "user".equalsIgnoreCase(role);
    }

    private boolean isUserStatusAllowed(String status) {
        return "active".equalsIgnoreCase(status) || "suspended".equalsIgnoreCase(status);
    }

    private boolean isReportDecisionAllowed(String decision) {
        return "resolved".equalsIgnoreCase(decision) || "rejected".equalsIgnoreCase(decision);
    }

    private record ClaimContext(
            int claimId,
            int itemId,
            int claimantUserId,
            String status,
            int reporterUserId,
            String itemType
            ) {

    }

    private record ItemContext(int itemId, int reporterUserId) {

    }
}
