package com.landf.features.locationadmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.landf.features.admin.AdminClaimView;
import com.landf.features.admin.AdminDAO;
import com.landf.features.admin.AdminReportView;
import com.landf.features.auth.AuthConstants;
import com.landf.features.items.ItemDAO;
import com.landf.features.items.ItemModel;
import com.landf.features.location.LocationDAO;
import com.landf.features.location.LocationModel;
import com.landf.features.user.UserDAO;
import com.landf.features.user.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
    "/location-admin",
    "/location-admin/dashboard",
    "/location-admin/locations",
    "/location-admin/items",
    "/location-admin/items/moderate",
    "/location-admin/claims",
    "/location-admin/claims/review",
    "/location-admin/reports",
    "/location-admin/reports/review"
})
public class LocationAdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DASHBOARD_VIEW = "/web_pages/location_admin/locationAdminDashboard.jsp";
    private static final String ITEMS_VIEW = "/web_pages/location_admin/locationItemLedger.jsp";
    private static final String CLAIMS_VIEW = "/web_pages/location_admin/claimVerificationLedger.jsp";
    private static final String REPORTS_VIEW = "/web_pages/location_admin/claimVerificationPanel.jsp";
    private static final String NO_LOCATION_VIEW = "/web_pages/location_admin/noLocationAssigned.jsp";

    private final AdminDAO adminDAO = new AdminDAO();
    private final ItemDAO itemDAO = new ItemDAO();
    private final LocationDAO locationDAO = new LocationDAO();
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith("/locations")) {
            showDashboard(request, response, "locations");
            return;
        }

        if (path.endsWith("/items")) {
            showItems(request, response);
            return;
        }

        if (path.endsWith("/claims")) {
            showClaims(request, response);
            return;
        }

        if (path.endsWith("/reports")) {
            showReports(request, response);
            return;
        }

        showDashboard(request, response, "dashboard");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith("/items/moderate")) {
            moderateItem(request, response);
            return;
        }

        if (path.endsWith("/claims/review")) {
            reviewClaim(request, response);
            return;
        }

        if (path.endsWith("/reports/review")) {
            reviewReport(request, response);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/location-admin/dashboard");
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response, String activeSection) throws ServletException, IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            request.setAttribute("activeSection", "dashboard");
            request.getRequestDispatcher(NO_LOCATION_VIEW).forward(request, response);
            return;
        }

        LocationContext locationContext = context.get();
        List<ItemModel> items = itemDAO.listItems(null, null, null, locationContext.locationId());
        List<AdminClaimView> claims = filterClaimsForLocation(locationContext.locationId());
        List<AdminReportView> reports = filterReportsForLocation(locationContext.locationId(), claims);

        request.setAttribute("activeSection", activeSection);
        request.setAttribute("sectionLabel", "Location Admin Console");
        request.setAttribute("pageTitle", locationContext.location() == null ? "Assigned Location" : locationContext.location().getName());
        request.setAttribute("searchPlaceholder", "Search items, claims, or reports...");
        request.setAttribute("locationId", locationContext.locationId());
        request.setAttribute("location", locationContext.location());
        request.setAttribute("locationContext", locationContext);
        request.setAttribute("locationItems", items);
        request.setAttribute("locationClaims", claims);
        request.setAttribute("locationReports", reports);
        request.setAttribute("pendingItemsCount", countPendingItems(items));
        request.setAttribute("pendingClaimsCount", countPendingClaims(claims));
        request.setAttribute("pendingReportsCount", countPendingReports(reports));
        request.setAttribute("flaggedItemsCount", countFlaggedItems(items));

        request.getRequestDispatcher(DASHBOARD_VIEW).forward(request, response);
    }

    private void showItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            request.setAttribute("activeSection", "items");
            request.getRequestDispatcher(NO_LOCATION_VIEW).forward(request, response);
            return;
        }

        LocationContext locationContext = context.get();
        List<ItemModel> items = itemDAO.listItems(null, null, null, locationContext.locationId());

        request.setAttribute("activeSection", "items");
        request.setAttribute("sectionLabel", "Location Item Ledger");
        request.setAttribute("pageTitle", locationContext.location() == null ? "Assigned Location" : locationContext.location().getName());
        request.setAttribute("searchPlaceholder", "Search local items...");
        request.setAttribute("locationId", locationContext.locationId());
        request.setAttribute("location", locationContext.location());
        request.setAttribute("locationContext", locationContext);
        request.setAttribute("locationItems", items);
        request.setAttribute("pendingItemsCount", countPendingItems(items));
        request.setAttribute("flaggedItemsCount", countFlaggedItems(items));

        request.getRequestDispatcher(ITEMS_VIEW).forward(request, response);
    }

    private void showClaims(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            request.setAttribute("activeSection", "claims");
            request.getRequestDispatcher(NO_LOCATION_VIEW).forward(request, response);
            return;
        }

        LocationContext locationContext = context.get();
        List<AdminClaimView> claims = filterClaimsForLocation(locationContext.locationId());

        request.setAttribute("activeSection", "claims");
        request.setAttribute("sectionLabel", "Claim Review");
        request.setAttribute("pageTitle", locationContext.location() == null ? "Assigned Location" : locationContext.location().getName());
        request.setAttribute("searchPlaceholder", "Search claims or claimants...");
        request.setAttribute("locationId", locationContext.locationId());
        request.setAttribute("location", locationContext.location());
        request.setAttribute("locationContext", locationContext);
        request.setAttribute("claims", claims);
        request.setAttribute("pendingClaimsCount", countPendingClaims(claims));

        request.getRequestDispatcher(CLAIMS_VIEW).forward(request, response);
    }

    private void showReports(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            request.setAttribute("activeSection", "reports");
            request.getRequestDispatcher(NO_LOCATION_VIEW).forward(request, response);
            return;
        }

        LocationContext locationContext = context.get();
        List<AdminClaimView> claims = filterClaimsForLocation(locationContext.locationId());
        List<AdminReportView> reports = filterReportsForLocation(locationContext.locationId(), claims);

        request.setAttribute("activeSection", "reports");
        request.setAttribute("sectionLabel", "Location Reports");
        request.setAttribute("pageTitle", locationContext.location() == null ? "Assigned Location" : locationContext.location().getName());
        request.setAttribute("searchPlaceholder", "Search reports and targets...");
        request.setAttribute("locationId", locationContext.locationId());
        request.setAttribute("location", locationContext.location());
        request.setAttribute("locationContext", locationContext);
        request.setAttribute("reports", reports);
        request.setAttribute("pendingReportsCount", countPendingReports(reports));

        request.getRequestDispatcher(REPORTS_VIEW).forward(request, response);
    }

    private void moderateItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            redirectWithError(request, response, "/location-admin/items", "Location assignment is required.");
            return;
        }

        int itemId = parsePositiveInt(request.getParameter("itemId"));
        String action = normalize(request.getParameter("action"));

        if (itemId <= 0) {
            redirectWithError(request, response, "/location-admin/items", "Invalid item selection.");
            return;
        }

        if (!belongsToLocation(itemId, context.get().locationId())) {
            redirectWithError(request, response, "/location-admin/items", "That item does not belong to your location.");
            return;
        }

        boolean moderated = adminDAO.moderateItem(itemId, action);
        if (moderated) {
            redirectWithSuccess(request, response, "/location-admin/items", "Item updated.");
        } else {
            redirectWithError(request, response, "/location-admin/items", "Item update failed.");
        }
    }

    private void reviewClaim(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            redirectWithError(request, response, "/location-admin/claims", "Location assignment is required.");
            return;
        }

        int claimId = parsePositiveInt(request.getParameter("claimId"));
        String decision = normalize(request.getParameter("decision"));
        String notes = normalize(request.getParameter("notes"));

        if (claimId <= 0) {
            redirectWithError(request, response, "/location-admin/claims", "Invalid claim selection.");
            return;
        }

        if (!belongsClaimToLocation(claimId, context.get().locationId())) {
            redirectWithError(request, response, "/location-admin/claims", "That claim does not belong to your location.");
            return;
        }

        int reviewerId = resolveAuthenticatedUserId(request);
        boolean reviewed = adminDAO.reviewClaim(claimId, decision, reviewerId, notes);
        if (reviewed) {
            redirectWithSuccess(request, response, "/location-admin/claims", "Claim review saved.");
        } else {
            redirectWithError(request, response, "/location-admin/claims", "Claim review failed.");
        }
    }

    private void reviewReport(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Optional<LocationContext> context = resolveLocationContext(request);
        if (context.isEmpty()) {
            redirectWithError(request, response, "/location-admin/reports", "Location assignment is required.");
            return;
        }

        int reportId = parsePositiveInt(request.getParameter("reportId"));
        String decision = normalize(request.getParameter("decision"));
        String notes = normalize(request.getParameter("notes"));

        if (reportId <= 0) {
            redirectWithError(request, response, "/location-admin/reports", "Invalid report selection.");
            return;
        }

        if (!belongsReportToLocation(reportId, context.get().locationId())) {
            redirectWithError(request, response, "/location-admin/reports", "That report does not belong to your location.");
            return;
        }

        int reviewerId = resolveAuthenticatedUserId(request);
        boolean reviewed = adminDAO.reviewReport(reportId, decision, reviewerId, notes);
        if (reviewed) {
            redirectWithSuccess(request, response, "/location-admin/reports", "Report review saved.");
        } else {
            redirectWithError(request, response, "/location-admin/reports", "Report review failed.");
        }
    }

    private Optional<LocationContext> resolveLocationContext(HttpServletRequest request) {
        Integer locationId = resolveLocationId(request);
        if (locationId == null) {
            return Optional.empty();
        }

        Optional<LocationModel> location = locationDAO.findById(locationId);
        return Optional.of(new LocationContext(locationId, location.orElse(null)));
    }

    private Integer resolveLocationId(HttpServletRequest request) {
        Object requestLocationId = request.getAttribute(AuthConstants.AUTH_LOCATION_ID_KEY);
        if (requestLocationId instanceof Integer integer && integer > 0) {
            return integer;
        }

        int userId = resolveAuthenticatedUserId(request);
        if (userId <= 0) {
            return null;
        }

        try {
            Optional<UserModel> user = userDAO.findById(userId);
            if (user.isPresent() && user.get().getLocationId() != null && user.get().getLocationId() > 0) {
                return user.get().getLocationId();
            }
        } catch (SQLException | ClassNotFoundException e) {
            request.getServletContext().log("Failed to resolve assigned location for location admin", e);
        }

        return null;
    }

    private int resolveAuthenticatedUserId(HttpServletRequest request) {
        Object userId = request.getAttribute(AuthConstants.AUTH_USER_ID_KEY);
        if (userId instanceof Integer integer) {
            return integer;
        }

        return parsePositiveInt(userId == null ? null : userId.toString());
    }

    private List<AdminClaimView> filterClaimsForLocation(int locationId) {
        List<AdminClaimView> filteredClaims = new ArrayList<>();
        Map<Integer, ItemModel> itemsById = loadItemsById(locationId);

        for (AdminClaimView claim : adminDAO.listClaims()) {
            ItemModel item = itemsById.get(claim.getItemId());
            if (item != null) {
                filteredClaims.add(claim);
            }
        }

        return filteredClaims;
    }

    private List<AdminReportView> filterReportsForLocation(int locationId, List<AdminClaimView> claims) {
        List<AdminReportView> filteredReports = new ArrayList<>();
        Map<Integer, ItemModel> itemsById = loadItemsById(locationId);
        Map<Integer, AdminClaimView> claimsById = new HashMap<>();

        for (AdminClaimView claim : claims) {
            claimsById.put(claim.getClaimId(), claim);
        }

        for (AdminReportView report : adminDAO.listReports()) {
            if (belongsReportToLocation(report, locationId, itemsById, claimsById)) {
                filteredReports.add(report);
            }
        }

        return filteredReports;
    }

    private Map<Integer, ItemModel> loadItemsById(int locationId) {
        Map<Integer, ItemModel> itemsById = new HashMap<>();

        for (ItemModel item : itemDAO.listItems(null, null, null, locationId)) {
            itemsById.put(item.getItemId(), item);
        }

        return itemsById;
    }

    private boolean belongsToLocation(int itemId, int locationId) {
        return itemDAO.findById(itemId)
                .map(item -> item.getLocationId() == locationId)
                .orElse(false);
    }

    private boolean belongsClaimToLocation(int claimId, int locationId) {
        for (AdminClaimView claim : adminDAO.listClaims()) {
            if (claim.getClaimId() == claimId) {
                return belongsToLocation(claim.getItemId(), locationId);
            }
        }

        return false;
    }

    private boolean belongsReportToLocation(int reportId, int locationId) {
        List<AdminClaimView> claims = adminDAO.listClaims();
        Map<Integer, ItemModel> itemsById = loadItemsById(locationId);
        Map<Integer, AdminClaimView> claimsById = new HashMap<>();

        for (AdminClaimView claim : claims) {
            claimsById.put(claim.getClaimId(), claim);
        }

        for (AdminReportView report : adminDAO.listReports()) {
            if (report.getReportId() == reportId) {
                return belongsReportToLocation(report, locationId, itemsById, claimsById);
            }
        }

        return false;
    }

    private boolean belongsReportToLocation(
            AdminReportView report,
            int locationId,
            Map<Integer, ItemModel> itemsById,
            Map<Integer, AdminClaimView> claimsById
    ) {
        if ("item".equalsIgnoreCase(report.getTargetType())) {
            ItemModel item = itemsById.get(report.getTargetId());
            return item != null && item.getLocationId() == locationId;
        }

        if ("claim".equalsIgnoreCase(report.getTargetType())) {
            AdminClaimView claim = claimsById.get(report.getTargetId());
            return claim != null && belongsToLocation(claim.getItemId(), locationId);
        }

        return false;
    }

    private int countPendingItems(List<ItemModel> items) {
        int count = 0;
        for (ItemModel item : items) {
            if ("open".equalsIgnoreCase(item.getStatus())) {
                count++;
            }
        }
        return count;
    }

    private int countFlaggedItems(List<ItemModel> items) {
        int count = 0;
        for (ItemModel item : items) {
            if ("flagged".equalsIgnoreCase(item.getModerationStatus()) || "spam".equalsIgnoreCase(item.getModerationStatus())) {
                count++;
            }
        }
        return count;
    }

    private int countPendingClaims(List<AdminClaimView> claims) {
        int count = 0;
        for (AdminClaimView claim : claims) {
            if ("pending".equalsIgnoreCase(claim.getStatus())) {
                count++;
            }
        }
        return count;
    }

    private int countPendingReports(List<AdminReportView> reports) {
        int count = 0;
        for (AdminReportView report : reports) {
            if ("pending".equalsIgnoreCase(report.getStatus())) {
                count++;
            }
        }
        return count;
    }

    private void redirectToHome(HttpServletRequest request, HttpServletResponse response, String message) throws IOException {
        redirectWithError(request, response, "/dashboard", message);
    }

    private void redirectWithSuccess(HttpServletRequest request, HttpServletResponse response, String path, String message) throws IOException {
        request.getSession().setAttribute("flashSuccess", message);
        response.sendRedirect(request.getContextPath() + path);
    }

    private void redirectWithError(HttpServletRequest request, HttpServletResponse response, String path, String message) throws IOException {
        request.getSession().setAttribute("flashError", message);
        response.sendRedirect(request.getContextPath() + path);
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

    private record LocationContext(int locationId, LocationModel location) {

    }
}
