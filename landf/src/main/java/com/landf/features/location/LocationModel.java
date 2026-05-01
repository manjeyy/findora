package com.landf.features.location;

import java.sql.Timestamp;

public class LocationModel {
    public int location_id;
    public String name;
    public float latitude;
    public float longitude;
    public String status;
    public int created_by;
    public int reviewed_by;
    public String review_notes;
    public Timestamp created_at;
    public Timestamp reviewed_at;

    public LocationModel(String name, float latitude, float longitude, String status, int created_by, int reviewed_by, String review_notes) {
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.status = status;
        this.created_by = created_by;
        this.reviewed_by = reviewed_by;
        this.review_notes = review_notes;
    }

    public LocationModel(int location_id, String name, float latitude, float longitude, String status, int created_by, int reviewed_by, String review_notes, Timestamp created_at, Timestamp reviewed_at) {
        this.location_id = location_id;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.status = status;
        this.created_by = created_by;
        this.reviewed_by = reviewed_by;
        this.review_notes = review_notes;
        this.created_at = created_at;
        this.reviewed_at = reviewed_at;
    }

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getReviewed_by() {
        return reviewed_by;
    }

    public void setReviewed_by(int reviewed_by) {
        this.reviewed_by = reviewed_by;
    }

    public String getReview_notes() {
        return review_notes;
    }

    public void setReview_notes(String review_notes) {
        this.review_notes = review_notes;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getReviewed_at() {
        return reviewed_at;
    }

    public void setReviewed_at(Timestamp reviewed_at) {
        this.reviewed_at = reviewed_at;
    }
}
