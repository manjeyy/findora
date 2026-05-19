package com.landf.models;

import java.time.LocalDateTime;

public class Item {

    private int itemId;
    private String type; // 'lost' or 'found'
    private String title;
    private String description;
    private String category;
    private int locationId;
    private String eventDate;
    private String imageUrl;
    private int userId;
    private String status; // 'open', 'matched', 'claimed', etc.
    private String moderationStatus; // 'clean', 'flagged', etc.
    private Integer matchedItemId;
    private Integer claimedByClaimId;
    private LocalDateTime createdAt;
    private String locationName;
    private String userName;
    private String ownerEmail;

    public Item() {
    }

    public Item(String type, String title, String description, String category,
            int locationId, String eventDate, String imageUrl, int userId) {
        this.type = type;
        this.title = title;
        this.description = description;
        this.category = category;
        this.locationId = locationId;
        this.eventDate = eventDate;
        this.imageUrl = imageUrl;
        this.userId = userId;
        this.status = "open";
        this.moderationStatus = "pending";
    }

    // Getters and Setters
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }
}
