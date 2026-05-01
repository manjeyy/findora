package com.landf.features.items;

public class ItemModel {

    private int itemId;
    private String type;
    private String title;
    private String description;
    private String category;
    private int locationId;
    private String locationName;
    private String eventDate;
    private String imageUrl;
    private int userId;
    private String username;
    private String status;
    private String moderationStatus;
    private Integer matchedItemId;
    private Integer claimedByClaimId;
    private String createdAt;
    private String updatedAt;

    public ItemModel() {
    }

    public ItemModel(
            int itemId,
            String type,
            String title,
            String description,
            String category,
            int locationId,
            String locationName,
            String eventDate,
            String imageUrl,
            int userId,
            String username,
            String status,
            String moderationStatus,
            Integer matchedItemId,
            Integer claimedByClaimId,
            String createdAt,
            String updatedAt
    ) {
        this.itemId = itemId;
        this.type = type;
        this.title = title;
        this.description = description;
        this.category = category;
        this.locationId = locationId;
        this.locationName = locationName;
        this.eventDate = eventDate;
        this.imageUrl = imageUrl;
        this.userId = userId;
        this.username = username;
        this.status = status;
        this.moderationStatus = moderationStatus;
        this.matchedItemId = matchedItemId;
        this.claimedByClaimId = claimedByClaimId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getModerationStatus() {
        return moderationStatus;
    }

    public void setModerationStatus(String moderationStatus) {
        this.moderationStatus = moderationStatus;
    }

    public Integer getMatchedItemId() {
        return matchedItemId;
    }

    public void setMatchedItemId(Integer matchedItemId) {
        this.matchedItemId = matchedItemId;
    }

    public Integer getClaimedByClaimId() {
        return claimedByClaimId;
    }

    public void setClaimedByClaimId(Integer claimedByClaimId) {
        this.claimedByClaimId = claimedByClaimId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
