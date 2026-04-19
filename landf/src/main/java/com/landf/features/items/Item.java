package main.java.com.landf.features.items;


import java.sql.*;

public class Item {
    private int item_id;
    private String type;
    private String title;
    private String description;
    private String category;
    private int location_id;
    private Date event_date;
    private String image_url;
    private int user_id;
    private String status;
    private String moderation_status;
    private Integer matched_item_id;
    private Integer claimed_by_claim_id;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Item() {}

    public Item(String type, String title, String description, String category, int location_id, Date event_date, String image_url, int user_id, String status, String moderation_status, Integer matched_item_id, Integer claimed_by_claim_id, Timestamp created_at, Timestamp updated_at) {
        this.type = type;
        this.title = title;
        this.description = description;
        this.category = category;
        this.location_id = location_id;
        this.event_date = event_date;
        this.image_url = image_url;
        this.user_id = user_id;
        this.status = status;
        this.moderation_status = moderation_status;
        this.matched_item_id = matched_item_id;
        this.claimed_by_claim_id = claimed_by_claim_id;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Item(int item_id, String type, String title, String description, String category, int location_id, Date event_date, String image_url, int user_id, String status, String moderation_status, Integer matched_item_id, Integer claimed_by_claim_id, Timestamp created_at, Timestamp updated_at) {
        this.item_id = item_id;
        this.type = type;
        this.title = title;
        this.description = description;
        this.category = category;
        this.location_id = location_id;
        this.event_date = event_date;
        this.image_url = image_url;
        this.user_id = user_id;
        this.status = status;
        this.moderation_status = moderation_status;
        this.matched_item_id = matched_item_id;
        this.claimed_by_claim_id = claimed_by_claim_id;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
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

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }

    public Date getEvent_date() {
        return event_date;
    }

    public void setEvent_date(Date event_date) {
        this.event_date = event_date;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getModeration_status() {
        return moderation_status;
    }

    public void setModeration_status(String moderation_status) {
        this.moderation_status = moderation_status;
    }

    public Integer getMatched_item_id() {
        return matched_item_id;
    }

    public void setMatched_item_id(Integer matched_item_id) {
        this.matched_item_id = matched_item_id;
    }

    public Integer getClaimed_by_claim_id() {
        return claimed_by_claim_id;
    }

    public void setClaimed_by_claim_id(Integer claimed_by_claim_id) {
        this.claimed_by_claim_id = claimed_by_claim_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
