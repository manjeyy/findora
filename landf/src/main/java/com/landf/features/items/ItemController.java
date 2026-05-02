package com.landf.features.items;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.AuthConstants;
import com.landf.features.auth.JwtService;
import com.landf.features.location.LocationDAO;
import com.landf.features.location.LocationModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/items", "/items/*"})
public class ItemController extends HttpServlet {

    private static final String[] ALLOWED_TYPES = {"lost", "found"};

    private final ItemDAO itemDAO = new ItemDAO();
    private final LocationDAO locationDAO = new LocationDAO();
    private final JwtService jwtService = new JwtService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("PATCH".equalsIgnoreCase(request.getMethod())) {
            handlePatch(request, response);
            return;
        }

        super.service(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo)) {
            List<ItemModel> items = itemDAO.listItems(
                    normalize(request.getParameter("type")),
                    normalize(request.getParameter("status")),
                    normalize(request.getParameter("category")),
                    parseOptionalPositiveInt(request.getParameter("location_id"))
            );

            writeJson(response, toJsonItems(items));
            return;
        }

        int itemId = parsePathItemId(pathInfo);
        if (itemId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid item id.");
            return;
        }

        Optional<ItemModel> item = itemDAO.findById(itemId);
        if (item.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        writeJson(response, toJsonItem(item.get()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.isBlank() && !"/".equals(pathInfo)) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return;
        }

        Integer currentUserId = resolveCurrentUserId(request);
        if (currentUserId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication required.");
            return;
        }

        ItemModel item = mergeCreateItem(request);
        if (item == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Type, title, description, location_id, and event_date are required.");
            return;
        }

        if (!locationExists(item.getLocationId())) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        item.setUserId(currentUserId);

        Optional<ItemModel> created = itemDAO.createItem(item);
        if (created.isEmpty()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create item.");
            return;
        }

        response.setStatus(HttpServletResponse.SC_CREATED);
        writeJson(response, toJsonItem(created.get()));
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = parsePathItemId(request.getPathInfo());
        if (itemId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid item id.");
            return;
        }

        Optional<ItemModel> existing = itemDAO.findById(itemId);
        if (existing.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        Integer currentUserId = resolveCurrentUserId(request);
        String role = resolveAuthRole(request);
        if (!canModifyItem(existing.get(), currentUserId, role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Item owner or admin access required.");
            return;
        }

        if (!itemDAO.deleteItem(itemId)) {
            response.sendError(HttpServletResponse.SC_CONFLICT, "Unable to delete item.");
            return;
        }

        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

    private void handlePatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = parsePathItemId(request.getPathInfo());
        if (itemId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid item id.");
            return;
        }

        Optional<ItemModel> existing = itemDAO.findById(itemId);
        if (existing.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        Integer currentUserId = resolveCurrentUserId(request);
        String role = resolveAuthRole(request);
        if (!canModifyItem(existing.get(), currentUserId, role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Item owner or admin access required.");
            return;
        }

        ItemModel updated = mergeUpdateItem(existing.get(), request);
        if (updated == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No valid fields supplied.");
            return;
        }

        if (!locationExists(updated.getLocationId())) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        if (!itemDAO.updateItem(updated)) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update item.");
            return;
        }

        writeJson(response, toJsonItem(itemDAO.findById(itemId).orElse(updated)));
    }

    private ItemModel mergeCreateItem(HttpServletRequest request) {
        String type = normalize(request.getParameter("type"));
        String title = normalize(request.getParameter("title"));
        String description = normalize(request.getParameter("description"));
        String category = normalize(request.getParameter("category"));
        String locationIdValue = normalize(request.getParameter("location_id"));
        String eventDateValue = normalize(request.getParameter("event_date"));
        String imageUrl = normalize(request.getParameter("image_url"));

        if (!isAllowedValue(type, ALLOWED_TYPES) || title.isBlank() || description.isBlank() || locationIdValue.isBlank() || eventDateValue.isBlank()) {
            return null;
        }

        int locationId = parsePositiveInt(locationIdValue);
        if (locationId <= 0) {
            return null;
        }

        if (!isValidDate(eventDateValue)) {
            return null;
        }

        ItemModel item = new ItemModel();
        item.setType(type.toLowerCase());
        item.setTitle(title);
        item.setDescription(description);
        item.setCategory(category.isBlank() ? null : category);
        item.setLocationId(locationId);
        item.setEventDate(eventDateValue);
        item.setImageUrl(imageUrl.isBlank() ? null : imageUrl);
        return item;
    }

    private ItemModel mergeUpdateItem(ItemModel current, HttpServletRequest request) {
        boolean changed = false;

        String type = normalize(request.getParameter("type"));
        if (!type.isBlank()) {
            if (!isAllowedValue(type, ALLOWED_TYPES)) {
                return null;
            }
            current.setType(type.toLowerCase());
            changed = true;
        }

        String title = normalize(request.getParameter("title"));
        if (!title.isBlank()) {
            current.setTitle(title);
            changed = true;
        }

        String description = normalize(request.getParameter("description"));
        if (!description.isBlank()) {
            current.setDescription(description);
            changed = true;
        }

        String category = request.getParameter("category");
        if (category != null) {
            String normalizedCategory = category.trim();
            current.setCategory(normalizedCategory.isBlank() ? null : normalizedCategory);
            changed = true;
        }

        String locationIdValue = normalize(request.getParameter("location_id"));
        if (!locationIdValue.isBlank()) {
            int locationId = parsePositiveInt(locationIdValue);
            if (locationId <= 0) {
                return null;
            }
            current.setLocationId(locationId);
            changed = true;
        }

        String eventDateValue = normalize(request.getParameter("event_date"));
        if (!eventDateValue.isBlank()) {
            if (!isValidDate(eventDateValue)) {
                return null;
            }
            current.setEventDate(eventDateValue);
            changed = true;
        }

        String imageUrl = request.getParameter("image_url");
        if (imageUrl != null) {
            String normalizedImageUrl = imageUrl.trim();
            current.setImageUrl(normalizedImageUrl.isBlank() ? null : normalizedImageUrl);
            changed = true;
        }

        return changed ? current : null;
    }

    private boolean canModifyItem(ItemModel item, Integer currentUserId, String role) {
        if (role != null && "admin".equalsIgnoreCase(role)) {
            return true;
        }

        return currentUserId != null && currentUserId == item.getUserId();
    }

    private boolean locationExists(int locationId) {
        Optional<LocationModel> location = locationDAO.findById(locationId);
        return location.isPresent();
    }

    private Integer resolveCurrentUserId(HttpServletRequest request) {
        Object value = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (value instanceof Integer integer) {
            return integer;
        }

        if (value instanceof Number number) {
            return number.intValue();
        }

        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            return null;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);
        Object resolved = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (resolved instanceof Integer integer) {
            return integer;
        }

        if (resolved instanceof Number number) {
            return number.intValue();
        }

        return null;
    }

    private String resolveAuthRole(HttpServletRequest request) {
        Object value = request.getAttribute(AuthConstants.AUTH_ROLE_KEY);
        if (value != null) {
            return value.toString();
        }

        Optional<DecodedJWT> jwt = jwtService.resolveToken(request).flatMap(jwtService::verify);
        if (jwt.isEmpty()) {
            return null;
        }

        jwtService.applyClaimsToRequest(jwt.get(), request);
        Object resolved = request.getAttribute(AuthConstants.AUTH_ROLE_KEY);
        return resolved == null ? null : resolved.toString();
    }

    private int parsePathItemId(String pathInfo) {
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo)) {
            return -1;
        }

        String trimmed = pathInfo.startsWith("/") ? pathInfo.substring(1) : pathInfo;
        int slashIndex = trimmed.indexOf('/');
        String idPart = slashIndex >= 0 ? trimmed.substring(0, slashIndex) : trimmed;

        try {
            int parsed = Integer.parseInt(idPart.trim());
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ex) {
            return -1;
        }
    }

    private Integer parseOptionalPositiveInt(String value) {
        int parsed = parsePositiveInt(value);
        return parsed > 0 ? parsed : null;
    }

    private int parsePositiveInt(String value) {
        if (value == null || value.isBlank()) {
            return -1;
        }

        try {
            int parsed = Integer.parseInt(value.trim());
            return parsed > 0 ? parsed : -1;
        } catch (NumberFormatException ex) {
            return -1;
        }
    }

    private boolean isAllowedValue(String value, String[] allowedValues) {
        if (value == null) {
            return false;
        }

        for (String allowedValue : allowedValues) {
            if (allowedValue.equalsIgnoreCase(value)) {
                return true;
            }
        }

        return false;
    }

    private boolean isValidDate(String value) {
        try {
            LocalDate.parse(value.trim());
            return true;
        } catch (DateTimeParseException ex) {
            return false;
        }
    }

    private String toJsonItems(List<ItemModel> items) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < items.size(); i++) {
            if (i > 0) {
                json.append(',');
            }

            json.append(toJsonItem(items.get(i)));
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonItem(ItemModel item) {
        return new StringBuilder("{")
                .append("\"item_id\":").append(item.getItemId()).append(',')
                .append("\"type\":").append(quote(item.getType())).append(',')
                .append("\"title\":").append(quote(item.getTitle())).append(',')
                .append("\"description\":").append(quote(item.getDescription())).append(',')
                .append("\"category\":").append(quote(item.getCategory())).append(',')
                .append("\"location_id\":").append(item.getLocationId()).append(',')
                .append("\"location_name\":").append(quote(item.getLocationName())).append(',')
                .append("\"event_date\":").append(quote(item.getEventDate())).append(',')
                .append("\"image_url\":").append(quote(item.getImageUrl())).append(',')
                .append("\"user_id\":").append(item.getUserId()).append(',')
                .append("\"username\":").append(quote(item.getUsername())).append(',')
                .append("\"status\":").append(quote(item.getStatus())).append(',')
                .append("\"moderation_status\":").append(quote(item.getModerationStatus())).append(',')
                .append("\"matched_item_id\":").append(item.getMatchedItemId() == null ? "null" : item.getMatchedItemId()).append(',')
                .append("\"claimed_by_claim_id\":").append(item.getClaimedByClaimId() == null ? "null" : item.getClaimedByClaimId()).append(',')
                .append("\"created_at\":").append(quote(item.getCreatedAt())).append(',')
                .append("\"updated_at\":").append(quote(item.getUpdatedAt()))
                .append('}')
                .toString();
    }

    private void writeJson(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
    }

    private String quote(String value) {
        return value == null ? "null" : "\"" + escape(value) + "\"";
    }

    private String escape(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }
}
