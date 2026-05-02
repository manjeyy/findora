package com.landf.features.admin;

import java.io.IOException;
import java.util.List;

import com.landf.features.auth.AuthConstants;
import com.landf.features.location.LocationDAO;
import com.landf.features.location.LocationModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {
    "/admin/dashboard",
    "/admin/locations",
    "/admin/locations/pending",
    "/admin/locations/new",
    "/admin/locations/create",
    "/admin/locations/review",
    "/admin/claims",
    "/admin/claims/review",
    "/admin/items",
    "/admin/items/ledger",
    "/admin/items/moderate",
    "/admin/users",
    "/admin/users/update",
    "/admin/reports",
    "/admin/reports/review"
})
public class AdminController extends HttpServlet {

    private static final String ADMIN_ROLE = "admin";

    private static final String ADMIN_DASHBOARD_VIEW = "/pages/dashboard/admin/home.jsp";
    private static final String ADMIN_LOCATIONS_VIEW = "/pages/dashboard/admin/locations.jsp";
    private static final String ADMIN_LOCATION_CREATE_VIEW = "/pages/dashboard/admin/location-create.jsp";
    private static final String ADMIN_CLAIMS_VIEW = "/pages/dashboard/admin/claims.jsp";
    private static final String ADMIN_ITEMS_VIEW = "/pages/dashboard/admin/items.jsp";
    private static final String ADMIN_ITEM_LEDGER_VIEW = "/pages/dashboard/admin/item-ledger.jsp";
    private static final String ADMIN_USERS_VIEW = "/pages/dashboard/admin/users.jsp";
    private static final String ADMIN_REPORTS_VIEW = "/pages/dashboard/admin/reports.jsp";

    private static final String FLASH_SUCCESS_KEY = "flashSuccess";
    private static final String FLASH_ERROR_KEY = "flashError";

    private final AdminDAO adminDAO = new AdminDAO();
    private final LocationDAO locationDAO = new LocationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!ensureAdmin(request, response)) {
            return;
        }

        applyFlash(request);
        attachCommonRequestAttributes(request);

        switch (request.getServletPath()) {
            case "/admin/dashboard" ->
                showDashboard(request, response);
            case "/admin/locations" ->
                showLocations(request, response);
            case "/admin/locations/pending" ->
                showPendingLocations(request, response);
            case "/admin/locations/new" ->
                showLocationCreateForm(request, response);
            case "/admin/claims" ->
                showClaims(request, response);
            case "/admin/items" ->
                showItems(request, response);
            case "/admin/items/ledger" ->
                showItemLedger(request, response);
            case "/admin/users" ->
                showUsers(request, response);
            case "/admin/reports" ->
                showReports(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!ensureAdmin(request, response)) {
            return;
        }

        switch (request.getServletPath()) {
            case "/admin/locations/create" ->
                createLocation(request, response);
            case "/admin/locations/review" ->
                reviewLocation(request, response);
            case "/admin/claims/review" ->
                reviewClaim(request, response);
            case "/admin/items/moderate" ->
                moderateItem(request, response);
            case "/admin/users/update" ->
                updateUser(request, response);
            case "/admin/reports/review" ->
                reviewReport(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDashboardStats stats = adminDAO.loadDashboardStats();
        request.setAttribute("stats", stats);
        request.setAttribute("activeSection", "dashboard");
        forward(ADMIN_DASHBOARD_VIEW, request, response);
    }

    private void showLocations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminLocationView> locations = adminDAO.listLocations();
        request.setAttribute("locations", locations);
        request.setAttribute("activeSection", "locations");
        request.setAttribute("locationScope", "all");
        forward(ADMIN_LOCATIONS_VIEW, request, response);
    }

    private void showPendingLocations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminLocationView> locations = adminDAO.listPendingLocations();
        request.setAttribute("locations", locations);
        request.setAttribute("activeSection", "locations");
        request.setAttribute("locationScope", "pending");
        forward(ADMIN_LOCATIONS_VIEW, request, response);
    }

    private void showLocationCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("activeSection", "locations");
        forward(ADMIN_LOCATION_CREATE_VIEW, request, response);
    }

    private void showClaims(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminClaimView> claims = adminDAO.listClaims();
        request.setAttribute("claims", claims);
        request.setAttribute("activeSection", "claims");
        forward(ADMIN_CLAIMS_VIEW, request, response);
    }

    private void showItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminItemView> items = adminDAO.listItems();
        request.setAttribute("items", items);
        request.setAttribute("activeSection", "items");
        forward(ADMIN_ITEMS_VIEW, request, response);
    }

    private void showItemLedger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("items", adminDAO.listItems());
        request.setAttribute("stats", adminDAO.loadDashboardStats());
        request.setAttribute("activeSection", "items");
        forward(ADMIN_ITEM_LEDGER_VIEW, request, response);
    }

    private void showUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminUserView> users = adminDAO.listUsers();
        request.setAttribute("users", users);
        request.setAttribute("activeSection", "users");
        forward(ADMIN_USERS_VIEW, request, response);
    }

    private void showReports(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminReportView> reports = adminDAO.listReports();
        request.setAttribute("reports", reports);
        request.setAttribute("activeSection", "reports");
        forward(ADMIN_REPORTS_VIEW, request, response);
    }

    private void reviewLocation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int locationId = parsePositiveInt(request.getParameter("locationId"));
        int adminUserId = resolveAdminUserId(request);
        String decision = normalize(request.getParameter("decision"));
        String notes = request.getParameter("notes");

        if (locationId <= 0 || adminUserId <= 0) {
            setFlashError(request, "Invalid location review request.");
            redirect(response, request, "/admin/locations");
            return;
        }

        boolean reviewed = adminDAO.reviewLocation(locationId, decision, adminUserId, notes);
        if (reviewed) {
            setFlashSuccess(request, "Location reviewed successfully.");
        } else {
            setFlashError(request, "Location review failed. Check status and try again.");
        }

        redirect(response, request, "/admin/locations");
    }

    private void reviewClaim(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int claimId = parsePositiveInt(request.getParameter("claimId"));
        int adminUserId = resolveAdminUserId(request);
        String decision = normalize(request.getParameter("decision"));
        String notes = request.getParameter("notes");

        if (claimId <= 0 || adminUserId <= 0) {
            setFlashError(request, "Invalid claim review request.");
            redirect(response, request, "/admin/claims");
            return;
        }

        boolean reviewed = adminDAO.reviewClaim(claimId, decision, adminUserId, notes);
        if (reviewed) {
            setFlashSuccess(request, "Claim reviewed and workflow updated.");
        } else {
            setFlashError(request, "Claim review failed. Ensure this claim is still pending.");
        }

        redirect(response, request, "/admin/claims");
    }

    private void moderateItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int itemId = parsePositiveInt(request.getParameter("itemId"));
        String action = normalize(request.getParameter("action"));

        if (itemId <= 0) {
            setFlashError(request, "Invalid item moderation request.");
            redirect(response, request, "/admin/items");
            return;
        }

        boolean moderated = adminDAO.moderateItem(itemId, action);
        if (moderated) {
            setFlashSuccess(request, "Item moderation action applied.");
        } else {
            setFlashError(request, "Item moderation failed.");
        }

        redirect(response, request, "/admin/items");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = parsePositiveInt(request.getParameter("userId"));
        int adminUserId = resolveAdminUserId(request);
        String role = normalize(request.getParameter("role"));
        String status = normalize(request.getParameter("status"));

        if (userId <= 0) {
            setFlashError(request, "Invalid user update request.");
            redirect(response, request, "/admin/users");
            return;
        }

        if (userId == adminUserId && "suspended".equalsIgnoreCase(status)) {
            setFlashError(request, "You cannot suspend your own admin account.");
            redirect(response, request, "/admin/users");
            return;
        }

        boolean updated = adminDAO.updateUser(userId, role, status);
        if (updated) {
            setFlashSuccess(request, "User account updated.");
        } else {
            setFlashError(request, "User update failed.");
        }

        redirect(response, request, "/admin/users");
    }

    private void reviewReport(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reportId = parsePositiveInt(request.getParameter("reportId"));
        int adminUserId = resolveAdminUserId(request);
        String decision = normalize(request.getParameter("decision"));
        String notes = request.getParameter("notes");

        if (reportId <= 0 || adminUserId <= 0) {
            setFlashError(request, "Invalid report review request.");
            redirect(response, request, "/admin/reports");
            return;
        }

        boolean reviewed = adminDAO.reviewReport(reportId, decision, adminUserId, notes);
        if (reviewed) {
            setFlashSuccess(request, "Report moderation decision saved.");
        } else {
            setFlashError(request, "Report moderation failed. Ensure report is pending.");
        }

        redirect(response, request, "/admin/reports");
    }

    private void createLocation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int adminUserId = resolveAdminUserId(request);
        String name = normalize(request.getParameter("name"));
        String latitudeValue = normalize(request.getParameter("latitude"));
        String longitudeValue = normalize(request.getParameter("longitude"));

        if (adminUserId <= 0 || name.isBlank() || latitudeValue.isBlank() || longitudeValue.isBlank()) {
            setFlashError(request, "Location name, latitude, and longitude are required.");
            redirect(response, request, "/admin/locations/new");
            return;
        }

        double latitude;
        double longitude;
        try {
            latitude = Double.parseDouble(latitudeValue);
            longitude = Double.parseDouble(longitudeValue);
        } catch (NumberFormatException ex) {
            setFlashError(request, "Latitude and longitude must be numeric.");
            redirect(response, request, "/admin/locations/new");
            return;
        }

        if (locationDAO.createLocation(new LocationModel(name, latitude, longitude, adminUserId)).isPresent()) {
            setFlashSuccess(request, "Location submitted for review.");
            redirect(response, request, "/admin/locations/pending");
        } else {
            setFlashError(request, "Failed to create location.");
            redirect(response, request, "/admin/locations/new");
        }
    }

    private boolean ensureAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Object userIdObject = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (userIdObject == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return false;
        }

        String role = String.valueOf(request.getAttribute(AuthConstants.AUTH_ROLE_KEY));
        if (!ADMIN_ROLE.equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required.");
            return false;
        }

        return true;
    }

    private int resolveAdminUserId(HttpServletRequest request) {
        Object userIdValue = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (userIdValue instanceof Integer userId) {
            return userId;
        }

        if (userIdValue instanceof Number number) {
            return number.intValue();
        }

        if (userIdValue == null) {
            return -1;
        }

        try {
            return Integer.parseInt(userIdValue.toString());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private void attachCommonRequestAttributes(HttpServletRequest request) {
        request.setAttribute("authUsername", String.valueOf(request.getAttribute(AuthConstants.AUTH_USER_KEY)));
        request.setAttribute("authRole", String.valueOf(request.getAttribute(AuthConstants.AUTH_ROLE_KEY)));
    }

    private void applyFlash(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }

        moveSessionAttributeToRequest(session, request, FLASH_SUCCESS_KEY);
        moveSessionAttributeToRequest(session, request, FLASH_ERROR_KEY);
    }

    private void moveSessionAttributeToRequest(HttpSession session, HttpServletRequest request, String key) {
        Object value = session.getAttribute(key);
        if (value != null) {
            request.setAttribute(key, value.toString());
            session.removeAttribute(key);
        }
    }

    private void setFlashSuccess(HttpServletRequest request, String message) {
        request.getSession(true).setAttribute(FLASH_SUCCESS_KEY, message);
    }

    private void setFlashError(HttpServletRequest request, String message) {
        request.getSession(true).setAttribute(FLASH_ERROR_KEY, message);
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

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private void forward(String view, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(view).forward(request, response);
    }

    private void redirect(HttpServletResponse response, HttpServletRequest request, String path) throws IOException {
        response.sendRedirect(request.getContextPath() + path);
    }
}
