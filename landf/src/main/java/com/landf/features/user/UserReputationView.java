package com.landf.features.user;

public class UserReputationView {

    private final int userId;
    private final int points;
    private final int successfulActions;
    private final int totalActions;
    private final int penaltyEvents;
    private final double score;
    private final String trustLevel;
    private final String updatedAt;

    public UserReputationView(
            int userId,
            int points,
            int successfulActions,
            int totalActions,
            int penaltyEvents,
            double score,
            String trustLevel,
            String updatedAt
    ) {
        this.userId = userId;
        this.points = points;
        this.successfulActions = successfulActions;
        this.totalActions = totalActions;
        this.penaltyEvents = penaltyEvents;
        this.score = score;
        this.trustLevel = trustLevel;
        this.updatedAt = updatedAt;
    }

    public int getUserId() {
        return userId;
    }

    public int getPoints() {
        return points;
    }

    public int getSuccessfulActions() {
        return successfulActions;
    }

    public int getTotalActions() {
        return totalActions;
    }

    public int getPenaltyEvents() {
        return penaltyEvents;
    }

    public double getScore() {
        return score;
    }

    public String getTrustLevel() {
        return trustLevel;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }
}
