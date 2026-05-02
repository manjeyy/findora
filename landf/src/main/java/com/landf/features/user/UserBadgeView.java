package com.landf.features.user;

public class UserBadgeView {

    private final int userBadgeId;
    private final int badgeId;
    private final String name;
    private final String description;
    private final String criteria;
    private final String awardedAt;

    public UserBadgeView(
            int userBadgeId,
            int badgeId,
            String name,
            String description,
            String criteria,
            String awardedAt
    ) {
        this.userBadgeId = userBadgeId;
        this.badgeId = badgeId;
        this.name = name;
        this.description = description;
        this.criteria = criteria;
        this.awardedAt = awardedAt;
    }

    public int getUserBadgeId() {
        return userBadgeId;
    }

    public int getBadgeId() {
        return badgeId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getCriteria() {
        return criteria;
    }

    public String getAwardedAt() {
        return awardedAt;
    }
}
