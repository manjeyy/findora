CREATE TABLE IF NOT EXISTS Users
(
    user_id     INT PRIMARY KEY AUTO_INCREMENT,
    username    VARCHAR(50)                              NOT NULL UNIQUE,
    email       VARCHAR(100)                             NOT NULL UNIQUE,
    password    VARCHAR(255)                             NOT NULL,
    role        ENUM ('admin', 'location_admin', 'user') NOT NULL DEFAULT 'user',
    location_id INT                                      NULL,
    status      ENUM ('active', 'suspended')             NOT NULL DEFAULT 'active',
    created_at  TIMESTAMP                                         DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP                                         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_users_location FOREIGN KEY (location_id) REFERENCES Locations (location_id)
);


CREATE TABLE IF NOT EXISTS Locations
(
    location_id  INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(140)                             NOT NULL,
    latitude     DECIMAL(10, 7)                           NOT NULL,
    longitude    DECIMAL(10, 7)                           NOT NULL,
    status       ENUM ('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    created_by   INT                                      NOT NULL,
    reviewed_by  INT,
    review_notes VARCHAR(255),
    created_at   TIMESTAMP                                         DEFAULT CURRENT_TIMESTAMP,
    reviewed_at  TIMESTAMP                                NULL,
    CONSTRAINT fk_locations_creator FOREIGN KEY (created_by) REFERENCES Users (user_id),
    CONSTRAINT fk_locations_reviewer FOREIGN KEY (reviewed_by) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS Items
(
    item_id             INT PRIMARY KEY AUTO_INCREMENT,
    type                ENUM ('lost', 'found')                        NOT NULL,
    title               VARCHAR(140)                                  NOT NULL,
    description         TEXT                                          NOT NULL,
    category            VARCHAR(100),
    location_id         INT                                           NOT NULL,
    event_date          DATE                                          NOT NULL,
    image_url           VARCHAR(255),
    user_id             INT                                           NOT NULL,
    status              ENUM ('open', 'matched', 'claimed', 'closed') NOT NULL DEFAULT 'open',
    moderation_status   ENUM ('clean', 'flagged', 'spam')             NOT NULL DEFAULT 'clean',
    matched_item_id     INT,
    claimed_by_claim_id INT,
    created_at          TIMESTAMP                                              DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_items_location FOREIGN KEY (location_id) REFERENCES Locations (location_id),
    CONSTRAINT fk_items_user FOREIGN KEY (user_id) REFERENCES Users (user_id),
    CONSTRAINT fk_items_matched_item FOREIGN KEY (matched_item_id) REFERENCES Items (item_id)
);

CREATE TABLE IF NOT EXISTS Claims
(
    claim_id         INT PRIMARY KEY AUTO_INCREMENT,
    item_id          INT                                      NOT NULL,
    claimant_user_id INT                                      NOT NULL,
    proof            TEXT                                     NOT NULL,
    identifiers      TEXT,
    status           ENUM ('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    reviewed_by      INT,
    review_notes     VARCHAR(255),
    created_at       TIMESTAMP                                         DEFAULT CURRENT_TIMESTAMP,
    reviewed_at      TIMESTAMP                                NULL,
    CONSTRAINT fk_claims_item FOREIGN KEY (item_id) REFERENCES Items (item_id),
    CONSTRAINT fk_claims_claimant FOREIGN KEY (claimant_user_id) REFERENCES Users (user_id),
    CONSTRAINT fk_claims_reviewer FOREIGN KEY (reviewed_by) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS Reports
(
    report_id        INT PRIMARY KEY AUTO_INCREMENT,
    reporter_user_id INT                                      NOT NULL,
    target_type      ENUM ('item', 'claim', 'user')           NOT NULL,
    target_id        INT                                      NOT NULL,
    reason           VARCHAR(255)                             NOT NULL,
    details          TEXT,
    status           ENUM ('pending', 'resolved', 'rejected') NOT NULL DEFAULT 'pending',
    reviewed_by      INT,
    review_notes     VARCHAR(255),
    created_at       TIMESTAMP                                         DEFAULT CURRENT_TIMESTAMP,
    reviewed_at      TIMESTAMP                                NULL,
    CONSTRAINT fk_reports_reporter FOREIGN KEY (reporter_user_id) REFERENCES Users (user_id),
    CONSTRAINT fk_reports_reviewer FOREIGN KEY (reviewed_by) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS UserPoints
(
    user_id            INT PRIMARY KEY,
    points             INT NOT NULL DEFAULT 0,
    successful_actions INT NOT NULL DEFAULT 0,
    total_actions      INT NOT NULL DEFAULT 0,
    penalty_events     INT NOT NULL DEFAULT 0,
    updated_at         TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_points_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS Badges
(
    badge_id    INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(80)  NOT NULL UNIQUE,
    description VARCHAR(255) NOT NULL,
    criteria    VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS UserBadges
(
    user_badge_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id       INT NOT NULL,
    badge_id      INT NOT NULL,
    awarded_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_user_badge UNIQUE (user_id, badge_id),
    CONSTRAINT fk_user_badges_user FOREIGN KEY (user_id) REFERENCES Users (user_id),
    CONSTRAINT fk_user_badges_badge FOREIGN KEY (badge_id) REFERENCES Badges (badge_id)
);

CREATE TABLE IF NOT EXISTS Reputation
(
    user_id     INT PRIMARY KEY,
    score       DECIMAL(12, 4)                 NOT NULL DEFAULT 0,
    trust_level ENUM ('low', 'medium', 'high') NOT NULL DEFAULT 'low',
    updated_at  TIMESTAMP                               DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_reputation_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS Missions
(
    mission_id    INT PRIMARY KEY AUTO_INCREMENT,
    title         VARCHAR(140) NOT NULL,
    description   VARCHAR(255) NOT NULL,
    target_count  INT          NOT NULL DEFAULT 1,
    reward_points INT          NOT NULL,
    active        TINYINT(1)   NOT NULL DEFAULT 1,
    start_date    DATE,
    end_date      DATE
);

CREATE TABLE IF NOT EXISTS UserMissions
(
    user_mission_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id         INT                                          NOT NULL,
    mission_id      INT                                          NOT NULL,
    progress_count  INT                                          NOT NULL DEFAULT 0,
    status          ENUM ('in_progress', 'completed', 'expired') NOT NULL DEFAULT 'in_progress',
    updated_at      TIMESTAMP                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT uq_user_mission UNIQUE (user_id, mission_id),
    CONSTRAINT fk_user_missions_user FOREIGN KEY (user_id) REFERENCES Users (user_id),
    CONSTRAINT fk_user_missions_mission FOREIGN KEY (mission_id) REFERENCES Missions (mission_id)
);

CREATE TABLE IF NOT EXISTS Leaderboards
(
    leaderboard_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id    INT,
    user_id        INT                                                  NOT NULL,
    metric_type    ENUM ('recoveries', 'reputation', 'helpful_reports') NOT NULL,
    metric_value   DECIMAL(12, 4)                                       NOT NULL,
    calculated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_leaderboards_location FOREIGN KEY (location_id) REFERENCES Locations (location_id),
    CONSTRAINT fk_leaderboards_user FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

INSERT INTO Badges (name, description, criteria)
VALUES ('First Recovery', 'First successful item claim completed', '1 successful claim'),
       ('Helper', 'Five successful recoveries completed', '5 successful recoveries'),
       ('Trusted Reporter', 'Consistent report approval record', 'High report approval rate'),
       ('Local Guardian', 'Strong contribution within one location', 'High location activity')
ON DUPLICATE KEY UPDATE description = VALUES(description),
                        criteria    = VALUES(criteria);
