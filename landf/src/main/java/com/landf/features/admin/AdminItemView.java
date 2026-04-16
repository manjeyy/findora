package com.landf.features.admin;

public class AdminItemView {

    private final int itemId;
    private final String type;
    private final String title;
    private final String category;
    private final String locationName;
    private final String reporterUsername;
    private final String status;
    private final String moderationStatus;
    private final String createdAt;

    public AdminItemView(
            int itemId,
            String type,
            String title,
            String category,
            String locationName,
            String reporterUsername,
            String status,
            String moderationStatus,
            String createdAt
    ) {
        this.itemId = itemId;
        this.type = type;
        this.title = title;
        this.category = category;
        this.locationName = locationName;
        this.reporterUsername = reporterUsername;
        this.status = status;
        this.moderationStatus = moderationStatus;
        this.createdAt = createdAt;
    }

    public int getItemId() {
        return itemId;
    }

    public String getType() {
        return type;
    }

    public String getTitle() {
        return title;
    }

    public String getCategory() {
        return category;
    }

    public String getLocationName() {
        return locationName;
    }

    public String getReporterUsername() {
        return reporterUsername;
    }

    public String getStatus() {
        return status;
    }

    public String getModerationStatus() {
        return moderationStatus;
    }

    public String getCreatedAt() {
        return createdAt;
    }
}
