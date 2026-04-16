package com.landf.features.admin;

public class AdminClaimView {

    private final int claimId;
    private final int itemId;
    private final String itemTitle;
    private final String itemType;
    private final String itemStatus;
    private final String claimantUsername;
    private final String status;
    private final String proof;
    private final String identifiers;
    private final String createdAt;
    private final String reviewedBy;
    private final String reviewNotes;

    public AdminClaimView(
            int claimId,
            int itemId,
            String itemTitle,
            String itemType,
            String itemStatus,
            String claimantUsername,
            String status,
            String proof,
            String identifiers,
            String createdAt,
            String reviewedBy,
            String reviewNotes
    ) {
        this.claimId = claimId;
        this.itemId = itemId;
        this.itemTitle = itemTitle;
        this.itemType = itemType;
        this.itemStatus = itemStatus;
        this.claimantUsername = claimantUsername;
        this.status = status;
        this.proof = proof;
        this.identifiers = identifiers;
        this.createdAt = createdAt;
        this.reviewedBy = reviewedBy;
        this.reviewNotes = reviewNotes;
    }

    public int getClaimId() {
        return claimId;
    }

    public int getItemId() {
        return itemId;
    }

    public String getItemTitle() {
        return itemTitle;
    }

    public String getItemType() {
        return itemType;
    }

    public String getItemStatus() {
        return itemStatus;
    }

    public String getClaimantUsername() {
        return claimantUsername;
    }

    public String getStatus() {
        return status;
    }

    public String getProof() {
        return proof;
    }

    public String getIdentifiers() {
        return identifiers;
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
