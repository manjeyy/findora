package com.landf.features.admin;

public class AdminLocationView {

    private final int locationId;
    private final String name;
    private final double latitude;
    private final double longitude;
    private final String status;
    private final String createdBy;
    private final String reviewedBy;
    private final String reviewNotes;
    private final String createdAt;
    private final String reviewedAt;

    public AdminLocationView(
            int locationId,
            String name,
            double latitude,
            double longitude,
            String status,
            String createdBy,
            String reviewedBy,
            String reviewNotes,
            String createdAt,
            String reviewedAt
    ) {
        this.locationId = locationId;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.status = status;
        this.createdBy = createdBy;
        this.reviewedBy = reviewedBy;
        this.reviewNotes = reviewNotes;
        this.createdAt = createdAt;
        this.reviewedAt = reviewedAt;
    }

    public int getLocationId() {
        return locationId;
    }

    public String getName() {
        return name;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getStatus() {
        return status;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public String getReviewedBy() {
        return reviewedBy;
    }

    public String getReviewNotes() {
        return reviewNotes;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getReviewedAt() {
        return reviewedAt;
    }
}
