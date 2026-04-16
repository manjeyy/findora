package com.landf.features.admin;

public class AdminReportView {

    private final int reportId;
    private final String reporterUsername;
    private final String targetType;
    private final int targetId;
    private final String reason;
    private final String status;
    private final String createdAt;
    private final String reviewedBy;
    private final String reviewNotes;

    public AdminReportView(
            int reportId,
            String reporterUsername,
            String targetType,
            int targetId,
            String reason,
            String status,
            String createdAt,
            String reviewedBy,
            String reviewNotes
    ) {
        this.reportId = reportId;
        this.reporterUsername = reporterUsername;
        this.targetType = targetType;
        this.targetId = targetId;
        this.reason = reason;
        this.status = status;
        this.createdAt = createdAt;
        this.reviewedBy = reviewedBy;
        this.reviewNotes = reviewNotes;
    }

    public int getReportId() {
        return reportId;
    }

    public String getReporterUsername() {
        return reporterUsername;
    }

    public String getTargetType() {
        return targetType;
    }

    public int getTargetId() {
        return targetId;
    }

    public String getReason() {
        return reason;
    }

    public String getStatus() {
        return status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getReviewedBy() {
        return reviewedBy;
    }

    public String getReviewNotes() {
        return reviewNotes;
    }
}
