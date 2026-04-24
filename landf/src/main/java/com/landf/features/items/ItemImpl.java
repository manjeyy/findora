package main.java.com.landf.features.items;

import main.java.com.landf.features.database.ConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemImpl {

    public boolean createItem(Item item) throws SQLException {
        try(Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(ItemQuery.INSERT_ITEM)) {
            ps.setString(1, item.getType());
            ps.setString(2, item.getTitle());
            ps.setString(3, item.getDescription());
            ps.setString(4, item.getCategory());
            ps.setInt(5, item.getLocation_id());
            ps.setDate(6, item.getEvent_date());
            ps.setString(7, item.getImage_url());
            ps.setInt(8, item.getUser_id());
            ps.setString(9, item.getStatus());
            ps.setString(10, item.getModeration_status());
            ps.setObject(11, item.getMatched_item_id());
            ps.setObject(12, item.getClaimed_by_claim_id());

            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public List<Item> getAllItems() throws SQLException {
        try (Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS)) {
            List<Item> items = new ArrayList<>();
            try(ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Item item = new Item();
                    item.setItem_id(rs.getInt("item_id"));
                    item.setType(rs.getString("type"));
                    item.setTitle(rs.getString("title"));
                    item.setDescription(rs.getString("description"));
                    item.setCategory(rs.getString("category"));
                    item.setLocation_id(rs.getInt("location_id"));
                    item.setEvent_date(rs.getDate("event_date"));
                    item.setImage_url(rs.getString("image_url"));
                    item.setUser_id(rs.getInt("user_id"));
                    item.setStatus(rs.getString("status"));
                    item.setModeration_status(rs.getString("moderation_status"));
                    item.setMatched_item_id((Integer) rs.getObject("matched_item_id"));
                    item.setClaimed_by_claim_id((Integer) rs.getObject("claimed_by_claim_id"));
                    item.setCreated_at(rs.getTimestamp("created_at"));
                    item.setUpdated_at(rs.getTimestamp("updated_at"));
                    items.add(item);
                }
            }
            return items;
        }
    }

    public Item getItemByID(int itemId) throws SQLException, RuntimeException {
        try(Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_ID)){
            ps.setInt(1,itemId);
            try(ResultSet rs = ps.executeQuery()){
                Item item = new Item();
                item.setItem_id(rs.getInt("item_id"));
                item.setType(rs.getString("type"));
                item.setTitle(rs.getString("title"));
                item.setDescription(rs.getString("description"));
                item.setCategory(rs.getString("category"));
                item.setLocation_id(rs.getInt("location_id"));
                item.setEvent_date(rs.getDate("event_date"));
                item.setImage_url(rs.getString("image_url"));
                item.setUser_id(rs.getInt("user_id"));
                item.setStatus(rs.getString("status"));
                item.setModeration_status(rs.getString("moderation_status"));
                item.setMatched_item_id((Integer) rs.getObject("matched_item_id"));
                item.setClaimed_by_claim_id((Integer) rs.getObject("claimed_by_claim_id"));
                item.setCreated_at(rs.getTimestamp("created_at"));
                item.setUpdated_at(rs.getTimestamp("updated_at"));
                return item;
            }
        }
    }

    public Item getItemByUser(int userId) throws SQLException, RuntimeException {
        try(Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_USER)){
            ps.setInt(1,userId);
            try(ResultSet rs = ps.executeQuery()){
                Item item = new Item();
                item.setItem_id(rs.getInt("item_id"));
                item.setType(rs.getString("type"));
                item.setTitle(rs.getString("title"));
                item.setDescription(rs.getString("description"));
                item.setCategory(rs.getString("category"));
                item.setLocation_id(rs.getInt("location_id"));
                item.setEvent_date(rs.getDate("event_date"));
                item.setImage_url(rs.getString("image_url"));
                item.setUser_id(rs.getInt("user_id"));
                item.setStatus(rs.getString("status"));
                item.setModeration_status(rs.getString("moderation_status"));
                item.setMatched_item_id((Integer) rs.getObject("matched_item_id"));
                item.setClaimed_by_claim_id((Integer) rs.getObject("claimed_by_claim_id"));
                item.setCreated_at(rs.getTimestamp("created_at"));
                item.setUpdated_at(rs.getTimestamp("updated_at"));
                return item;
            }
        }
    }

    public Item getItemByLocation(int locationId) throws SQLException, RuntimeException {
        try(Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.GET_ALL_ITEMS_BY_LOCATION)){
            ps.setInt(1,locationId);
            try(ResultSet rs = ps.executeQuery()){
                Item item = new Item();
                item.setItem_id(rs.getInt("item_id"));
                item.setType(rs.getString("type"));
                item.setTitle(rs.getString("title"));
                item.setDescription(rs.getString("description"));
                item.setCategory(rs.getString("category"));
                item.setLocation_id(rs.getInt("location_id"));
                item.setEvent_date(rs.getDate("event_date"));
                item.setImage_url(rs.getString("image_url"));
                item.setUser_id(rs.getInt("user_id"));
                item.setStatus(rs.getString("status"));
                item.setModeration_status(rs.getString("moderation_status"));
                item.setMatched_item_id((Integer) rs.getObject("matched_item_id"));
                item.setClaimed_by_claim_id((Integer) rs.getObject("claimed_by_claim_id"));
                item.setCreated_at(rs.getTimestamp("created_at"));
                item.setUpdated_at(rs.getTimestamp("updated_at"));
                return item;
            }
        }
    }

    public boolean deleteItemById(int itemId) throws SQLException {
        try(Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.DELETE_ITEMS_BY_ID)){
            ps.setInt(1,itemId);
            int rows = ps.executeUpdate();

            return rows > 0;
        }
    }

    public boolean updateItemById(Item item) throws SQLException {
        Item existing = getItemByID(item.getItem_id());

        if (existing == null) {
            throw new RuntimeException("Item not found");
        }

        if (item.getType() != null) existing.setType(item.getType());
        if (item.getTitle() != null) existing.setTitle(item.getTitle());
        if (item.getDescription() != null) existing.setDescription(item.getDescription());
        if (item.getCategory() != null) existing.setCategory(item.getCategory());
        if (item.getLocation_id() != 0) existing.setLocation_id(item.getLocation_id());
        if (item.getEvent_date() != null) existing.setEvent_date(item.getEvent_date());
        if (item.getImage_url() != null) existing.setImage_url(item.getImage_url());
        if (item.getUser_id() != 0) existing.setUser_id(item.getUser_id());
        if (item.getStatus() != null) existing.setStatus(item.getStatus());
        if (item.getModeration_status() != null) existing.setModeration_status(item.getModeration_status());
        if (item.getMatched_item_id() != null) existing.setMatched_item_id(item.getMatched_item_id());
        if (item.getClaimed_by_claim_id() != null) existing.setClaimed_by_claim_id(item.getClaimed_by_claim_id());


        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(ItemQuery.UPDATE_ITEM_BY_ID)) {

            ps.setString(1, existing.getType());
            ps.setString(2, existing.getTitle());
            ps.setString(3, existing.getDescription());
            ps.setString(4, existing.getCategory());
            ps.setInt(5, existing.getLocation_id());
            ps.setDate(6, existing.getEvent_date());
            ps.setString(7, existing.getImage_url());
            ps.setInt(8, existing.getUser_id());
            ps.setString(9, existing.getStatus());
            ps.setString(10, existing.getModeration_status());
            ps.setObject(11, existing.getMatched_item_id());
            ps.setObject(12, existing.getClaimed_by_claim_id());
            ps.setInt(13, existing.getItem_id());

            return ps.executeUpdate() > 0;
        }
    }
}