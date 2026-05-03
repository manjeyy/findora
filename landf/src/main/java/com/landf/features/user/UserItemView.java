package com.landf.features.user;

public class UserItemView {

    private final int itemId;
    private final String type;
    private final String title;
    private final String description;
    private final String category;
    private final int locationId;
    private final String locationName;
    private final String status;
    private final String moderationStatus;
    private final String createdAt;

    public UserItemView(
            int itemId,
            String type,
            String title,
            String description,
            String category,
            int locationId,
            String locationName,
            String status,
            String moderationStatus,
            String createdAt
    ) {
        this.itemId = itemId;
        this.type = type;
        this.title = title;
        this.description = description;
        this.category = category;
        this.locationId = locationId;
        this.locationName = locationName;
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

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public int getLocationId() {
        return locationId;
    }

    public String getLocationName() {
        return locationName;
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
