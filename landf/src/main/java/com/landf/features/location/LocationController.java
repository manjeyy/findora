package com.landf.features.location;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.landf.features.auth.AuthConstants;
import com.landf.features.auth.JwtService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/locations", "/locations/*"})
public class LocationController extends HttpServlet {

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
            writeJson(response, toJsonLocations(locationDAO.listLocations()));
            return;
        }

        if ("/pending".equals(pathInfo)) {
            if (!ensureAdmin(request, response)) {
                return;
            }

            writeJson(response, toJsonLocations(locationDAO.listPendingLocations()));
            return;
        }

        int locationId = parsePathLocationId(pathInfo);
        if (locationId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        Optional<LocationModel> location = locationDAO.findById(locationId);
        if (location.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        writeJson(response, toJsonLocation(location.get()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo)) {
            handleCreate(request, response);
            return;
        }

        if (pathInfo.endsWith("/approve") || pathInfo.endsWith("/reject")) {
            handleReview(request, response);
            return;
        }

        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locationId = parsePathLocationId(request.getPathInfo());
        if (locationId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        Optional<LocationModel> location = locationDAO.findById(locationId);
        if (location.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (!ensureAdminOrOwner(request, response, location.get())) {
            return;
        }

        if (!locationDAO.deleteLocation(locationId)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

    private void handlePatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locationId = parsePathLocationId(request.getPathInfo());
        if (locationId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        Optional<LocationModel> existing = locationDAO.findById(locationId);
        if (existing.isEmpty()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        if (!ensureAdminOrOwner(request, response, existing.get())) {
            return;
        }

        LocationModel updated = mergeLocation(existing.get(), request);
        if (updated == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No valid fields supplied.");
            return;
        }

        if (!locationDAO.updateLocation(updated)) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update location.");
            return;
        }

        writeJson(response, toJsonLocation(locationDAO.findById(locationId).orElse(updated)));
    }

    private void handleCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer currentUserId = resolveCurrentUserId(request);
        if (currentUserId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication required.");
            return;
        }

        String name = normalize(request.getParameter("name"));
        String latitudeValue = normalize(request.getParameter("latitude"));
        String longitudeValue = normalize(request.getParameter("longitude"));

        if (name.isBlank() || latitudeValue.isBlank() || longitudeValue.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Name, latitude, and longitude are required.");
            return;
        }

        double latitude;
        double longitude;
        try {
            latitude = Double.parseDouble(latitudeValue);
            longitude = Double.parseDouble(longitudeValue);
        } catch (NumberFormatException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Latitude and longitude must be numeric.");
            return;
        }

        Optional<LocationModel> created = locationDAO.createLocation(new LocationModel(name, latitude, longitude, currentUserId));
        if (created.isEmpty()) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create location.");
            return;
        }

        response.setStatus(HttpServletResponse.SC_CREATED);
        writeJson(response, toJsonLocation(created.get()));
    }

    private void handleReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!ensureAdmin(request, response)) {
            return;
        }

        int locationId = parsePathLocationId(request.getPathInfo());
        if (locationId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid location id.");
            return;
        }

        String decision = request.getPathInfo().endsWith("/approve") ? "approved" : "rejected";
        Integer reviewerId = resolveCurrentUserId(request);
        if (reviewerId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Authentication required.");
            return;
        }

        String notes = request.getParameter("notes");
        if (!locationDAO.reviewLocation(locationId, decision, reviewerId, notes)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Location review failed.");
            return;
        }

        writeJson(response, toJsonLocation(locationDAO.findById(locationId).orElse(null)));
    }

    private LocationModel mergeLocation(LocationModel current, HttpServletRequest request) {
        boolean changed = false;

        String name = normalize(request.getParameter("name"));
        if (!name.isBlank()) {
            current.setName(name);
            changed = true;
        }

        String latitudeValue = normalize(request.getParameter("latitude"));
        if (!latitudeValue.isBlank()) {
            try {
                current.setLatitude(Double.parseDouble(latitudeValue));
                changed = true;
            } catch (NumberFormatException ex) {
                return null;
            }
        }

        String longitudeValue = normalize(request.getParameter("longitude"));
        if (!longitudeValue.isBlank()) {
            try {
                current.setLongitude(Double.parseDouble(longitudeValue));
                changed = true;
            } catch (NumberFormatException ex) {
                return null;
            }
        }

        return changed ? current : null;
    }

    private boolean ensureAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Object role = resolveAuthRole(request);
        if (role == null || !"admin".equalsIgnoreCase(role.toString())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required.");
            return false;
        }

        return true;
    }

    private boolean ensureAdminOrOwner(HttpServletRequest request, HttpServletResponse response, LocationModel location) throws IOException {
        Object role = resolveAuthRole(request);
        if (role != null && "admin".equalsIgnoreCase(role.toString())) {
            return true;
        }

        Integer currentUserId = resolveCurrentUserId(request);
        if (currentUserId != null && currentUserId == location.getCreatedByUserId()) {
            return true;
        }

        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin or creator access required.");
        return false;
    }

    private Integer resolveCurrentUserId(HttpServletRequest request) {
        Object value = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (value instanceof Integer integer) {
            return integer;
        }

        if (value instanceof Number number) {
            return number.intValue();
        }

        if (value == null) {
            Optional<DecodedJWT> jwt = resolveJwt(request);
            if (jwt.isEmpty()) {
                return null;
            }

            Integer jwtUserId = jwt.get().getClaim("userId").asInt();
            if (jwtUserId != null) {
                applyClaimsToRequest(jwt.get(), request);
            }
            return jwtUserId;
        }

        try {
            return Integer.parseInt(value.toString());
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private Object resolveAuthRole(HttpServletRequest request) {
        Object role = request.getAttribute(AuthConstants.AUTH_ROLE_KEY);
        if (role != null) {
            return role;
        }

        Optional<DecodedJWT> jwt = resolveJwt(request);
        if (jwt.isEmpty()) {
            return null;
        }

        applyClaimsToRequest(jwt.get(), request);
        return request.getAttribute(AuthConstants.AUTH_ROLE_KEY);
    }

    private Optional<DecodedJWT> resolveJwt(HttpServletRequest request) {
        return jwtService.resolveToken(request).flatMap(jwtService::verify);
    }

    private void applyClaimsToRequest(DecodedJWT jwt, HttpServletRequest request) {
        request.setAttribute(AuthConstants.AUTH_USER_KEY, jwt.getSubject());
        request.setAttribute(AuthConstants.AUTH_USER_ID_KEY, jwt.getClaim("userId").asInt());
        request.setAttribute(AuthConstants.AUTH_ROLE_KEY, jwt.getClaim("role").asString());
    }

    private int parsePathLocationId(String pathInfo) {
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo) || "/pending".equals(pathInfo)) {
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

    private String toJsonLocations(List<LocationModel> locations) {
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < locations.size(); i++) {
            if (i > 0) {
                json.append(',');
            }
            json.append(toJsonLocation(locations.get(i)));
        }
        json.append(']');
        return json.toString();
    }

    private String toJsonLocation(LocationModel location) {
        if (location == null) {
            return "null";
        }

        return new StringBuilder("{")
                .append("\"location_id\":").append(location.getLocationId()).append(',')
                .append("\"name\":\"").append(escape(location.getName())).append("\",")
                .append("\"latitude\":").append(location.getLatitude()).append(',')
                .append("\"longitude\":").append(location.getLongitude()).append(',')
                .append("\"status\":\"").append(escape(location.getStatus())).append("\",")
                .append("\"created_by\":").append(location.getCreatedByUserId()).append(',')
                .append("\"created_by_username\":\"").append(escape(location.getCreatedByUsername())).append("\",")
                .append("\"reviewed_by\":").append(location.getReviewedByUserId() == null ? "null" : location.getReviewedByUserId()).append(',')
                .append("\"reviewed_by_username\":").append(quote(location.getReviewedByUsername())).append(',')
                .append("\"review_notes\":").append(quote(location.getReviewNotes())).append(',')
                .append("\"created_at\":").append(quote(location.getCreatedAt())).append(',')
                .append("\"reviewed_at\":").append(quote(location.getReviewedAt()))
                .append('}')
                .toString();
    }

    private void writeJson(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
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

    private String quote(String value) {
        return value == null ? "null" : "\"" + escape(value) + "\"";
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }
}
