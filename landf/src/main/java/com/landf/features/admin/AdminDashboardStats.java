package com.landf.features.admin;

public class AdminDashboardStats {

    private final int pendingLocations;
    private final int pendingClaims;
    private final int pendingReports;
    private final int openItems;
    private final int totalUsers;
    private final int suspendedUsers;
    private final int totalRecoveries;

    public AdminDashboardStats(
            int pendingLocations,
            int pendingClaims,
            int pendingReports,
            int openItems,
            int totalUsers,
            int suspendedUsers,
            int totalRecoveries
    ) {
        this.pendingLocations = pendingLocations;
        this.pendingClaims = pendingClaims;
        this.pendingReports = pendingReports;
        this.openItems = openItems;
        this.totalUsers = totalUsers;
        this.suspendedUsers = suspendedUsers;
        this.totalRecoveries = totalRecoveries;
    }

    public int getPendingLocations() {
        return pendingLocations;
    }

    public int getPendingClaims() {
        return pendingClaims;
    }

    public int getPendingReports() {
        return pendingReports;
    }

    public int getOpenItems() {
        return openItems;
    }

    public int getTotalUsers() {
        return totalUsers;
    }

    public int getSuspendedUsers() {
        return suspendedUsers;
    }

    public int getTotalRecoveries() {
        return totalRecoveries;
    }
}
