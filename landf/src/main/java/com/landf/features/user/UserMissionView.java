package com.landf.features.user;

public class UserMissionView {

    private final int userMissionId;
    private final int missionId;
    private final String title;
    private final String description;
    private final int targetCount;
    private final int rewardPoints;
    private final int progressCount;
    private final String status;
    private final boolean active;
    private final String startDate;
    private final String endDate;
    private final String updatedAt;

    public UserMissionView(
            int userMissionId,
            int missionId,
            String title,
            String description,
            int targetCount,
            int rewardPoints,
            int progressCount,
            String status,
            boolean active,
            String startDate,
            String endDate,
            String updatedAt
    ) {
        this.userMissionId = userMissionId;
        this.missionId = missionId;
        this.title = title;
        this.description = description;
        this.targetCount = targetCount;
        this.rewardPoints = rewardPoints;
        this.progressCount = progressCount;
        this.status = status;
        this.active = active;
        this.startDate = startDate;
        this.endDate = endDate;
        this.updatedAt = updatedAt;
    }

    public int getUserMissionId() {
        return userMissionId;
    }

    public int getMissionId() {
        return missionId;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public int getTargetCount() {
        return targetCount;
    }

    public int getRewardPoints() {
        return rewardPoints;
    }

    public int getProgressCount() {
        return progressCount;
    }

    public String getStatus() {
        return status;
    }

    public boolean isActive() {
        return active;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }
}
