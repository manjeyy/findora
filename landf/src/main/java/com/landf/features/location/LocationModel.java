package com.landf.features.location;

public class LocationModel {

    private int locationId;
    private String name;
    private double latitude;
    private double longitude;
    private String status;
    private int createdByUserId;
    private String createdByUsername;
    private Integer reviewedByUserId;
    private String reviewedByUsername;
    private String reviewNotes;
    private String createdAt;
    private String reviewedAt;

    public LocationModel() {
    }

    public LocationModel(
            int locationId,
            String name,
            double latitude,
            double longitude,
            String status,
            int createdByUserId,
            String createdByUsername,
            Integer reviewedByUserId,
            String reviewedByUsername,
            String reviewNotes,
            String createdAt,
            String reviewedAt
    ) {
        this.locationId = locationId;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.status = status;
        this.createdByUserId = createdByUserId;
        this.createdByUsername = createdByUsername;
        this.reviewedByUserId = reviewedByUserId;
        this.reviewedByUsername = reviewedByUsername;
        this.reviewNotes = reviewNotes;
        this.createdAt = createdAt;
        this.reviewedAt = reviewedAt;
    }

    public LocationModel(String name, double latitude, double longitude, int createdByUserId) {
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.createdByUserId = createdByUserId;
        this.status = "pending";
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreatedByUserId() {
        return createdByUserId;
    }

    public void setCreatedByUserId(int createdByUserId) {
        this.createdByUserId = createdByUserId;
    }

    public String getCreatedByUsername() {
        return createdByUsername;
    }

    public void setCreatedByUsername(String createdByUsername) {
        this.createdByUsername = createdByUsername;
    }

    public Integer getReviewedByUserId() {
        return reviewedByUserId;
    }

    public void setReviewedByUserId(Integer reviewedByUserId) {
        this.reviewedByUserId = reviewedByUserId;
    }

    public String getReviewedByUsername() {
        return reviewedByUsername;
    }

    public void setReviewedByUsername(String reviewedByUsername) {
        this.reviewedByUsername = reviewedByUsername;
    }

    public String getReviewNotes() {
        return reviewNotes;
    }

    public void setReviewNotes(String reviewNotes) {
        this.reviewNotes = reviewNotes;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getReviewedAt() {
        return reviewedAt;
    }

    public void setReviewedAt(String reviewedAt) {
        this.reviewedAt = reviewedAt;
    }
}
