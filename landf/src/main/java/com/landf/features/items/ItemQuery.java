package main.java.com.landf.features.items;

public class ItemQuery {
    static final String INSERT_ITEM =
            "INSERT INTO Items (type, title, description, category, location_id, event_date, image_url, user_id, status, moderation_status, matched_item_id, claimed_by_claim_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    static final String GET_ALL_ITEMS = "SELECT * FROM Items";
    static final String GET_ALL_ITEMS_BY_ID = "SELECT * FROM Items WHERE item_id = ?";
    static final String GET_ALL_ITEMS_BY_USER = "SELECT * FROM Items WHERE user_id = ?";
    static final String GET_ALL_ITEMS_BY_LOCATION = "SELECT * FROM Items WHERE location_id = ?";
    static final String DELETE_ITEMS_BY_ID = "DELETE FROM Items WHERE item_id = ?";
    static final String UPDATE_ITEM_BY_ID =
            "UPDATE Items SET type=?, title=?, description=?, category=?, location_id=?, event_date=?, image_url=?, user_id=?, status=?, moderation_status=?, matched_item_id=?, claimed_by_claim_id=? WHERE item_id=?";
}
