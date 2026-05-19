package com.landf.features.admin;

public class AdminUserView {

    private final int userId;
    private final String username;
    private final String email;
    private final String role;
    private final Integer locationId;
    private final String status;
    private final int points;
    private final double reputationScore;
    private final String trustLevel;
    private final String createdAt;

    public AdminUserView(
            int userId,
            String username,
            String email,
            String role,
            Integer locationId,
            String status,
            int points,
            double reputationScore,
            String trustLevel,
            String createdAt
    ) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.role = role;
        this.locationId = locationId;
        this.status = status;
        this.points = points;
        this.reputationScore = reputationScore;
        this.trustLevel = trustLevel;
        this.createdAt = createdAt;
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getRole() {
        return role;
    }

    public Integer getLocationId() {
        return locationId;
    }

    public String getStatus() {
        return status;
    }

    public int getPoints() {
        return points;
    }

    public double getReputationScore() {
        return reputationScore;
    }

    public String getTrustLevel() {
        return trustLevel;
    }

    public String getCreatedAt() {
        return createdAt;
    }
}
