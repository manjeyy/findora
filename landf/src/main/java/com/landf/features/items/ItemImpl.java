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
        try(Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(ItemQuery.UPDATE_ITEM_BY_ID)){
//            use optional
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

            ps.setInt(13,item.getItem_id());
            int rows = ps.executeUpdate();

            return rows > 0;
        }
    }


}
