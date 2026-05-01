package com.landf.features.user;

public class UserClaimView {

    private final int claimId;
    private final int itemId;
    private final String itemTitle;
    private final String itemType;
    private final String status;
    private final String proof;
    private final String identifiers;
    private final String createdAt;
    private final String reviewNotes;

    public UserClaimView(
            int claimId,
            int itemId,
            String itemTitle,
            String itemType,
            String status,
            String proof,
            String identifiers,
            String createdAt,
            String reviewNotes
    ) {
        this.claimId = claimId;
        this.itemId = itemId;
        this.itemTitle = itemTitle;
        this.itemType = itemType;
        this.status = status;
        this.proof = proof;
        this.identifiers = identifiers;
        this.createdAt = createdAt;
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

    public String getReviewNotes() {
        return reviewNotes;
    }
}
