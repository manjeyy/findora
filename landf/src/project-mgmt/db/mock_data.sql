

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO Users (user_id, username, email, password, role, location_id, status, created_at)
VALUES
  (1, 'admin', 'admin@email.com', '$2a$10$/yyyturBotYpGJSqBM/slOExEkf/8ajd2V.UqGvIRGeKXs5pxiduu', 'admin', NULL, 'active', NOW()),
  (2, 'loc_admin', 'loc_admin@email.com', '$2a$10$/yyyturBotYpGJSqBM/slOExEkf/8ajd2V.UqGvIRGeKXs5pxiduu', 'location_admin', NULL, 'active', NOW()),
  (3, 'user1', 'user1@email.com', '$2a$10$/yyyturBotYpGJSqBM/slOExEkf/8ajd2V.UqGvIRGeKXs5pxiduu', 'user', NULL, 'active', NOW()),
  (4, 'user2', 'user2@email.com', '$2a$10$/yyyturBotYpGJSqBM/slOExEkf/8ajd2V.UqGvIRGeKXs5pxiduu', 'user', NULL, 'active', NOW()),
  (5, 'user3', 'user3@email.com', '$2a$10$/yyyturBotYpGJSqBM/slOExEkf/8ajd2V.UqGvIRGeKXs5pxiduu', 'user', NULL, 'active', NOW())
ON DUPLICATE KEY UPDATE username = VALUES(username);

INSERT INTO Locations (location_id, name, latitude, longitude, status, created_by, reviewed_by, review_notes, created_at, reviewed_at)
VALUES
  (1, 'Central Station Lost & Found', 40.7127760, -74.0059740, 'approved', 1, 1, 'Initial seed data', NOW(), NOW()),
  (2, 'University Campus Desk', 40.7295134, -73.9964609, 'approved', 1, 1, 'Seed location', NOW(), NOW())
ON DUPLICATE KEY UPDATE name = VALUES(name);

UPDATE Users SET location_id = 1 WHERE user_id = 2; 
UPDATE Users SET location_id = 2 WHERE user_id = 3; 


INSERT INTO Items (item_id, type, title, description, category, location_id, event_date, image_url, user_id, status, moderation_status, matched_item_id, claimed_by_claim_id, created_at)
VALUES
  (1, 'lost', 'Black Leather Wallet', 'Bifold leather wallet with initials A.D.', 'personal', 1, DATE_SUB(CURDATE(), INTERVAL 10 DAY), NULL, 3, 'open', 'clean', NULL, NULL, NOW()),
  (2, 'found', 'Silver Fountain Pen', 'Engraved: J.V.', 'accessory', 1, DATE_SUB(CURDATE(), INTERVAL 3 DAY), NULL, 4, 'open', 'clean', NULL, NULL, NOW()),
  (3, 'lost', 'Blue Backpack', 'Contains laptop sleeve with sticker', 'bag', 2, DATE_SUB(CURDATE(), INTERVAL 5 DAY), NULL, 5, 'open', 'clean', NULL, NULL, NOW())
ON DUPLICATE KEY UPDATE title = VALUES(title);


INSERT INTO Claims (claim_id, item_id, claimant_user_id, proof, identifiers, status, reviewed_by, review_notes, created_at, reviewed_at)
VALUES
  (1, 1, 3, 'Photo of ID and wallet interior', 'ID: A12345', 'pending', NULL, NULL, NOW(), NULL),
  (2, 2, 3, 'Colleague says it belongs to them', NULL, 'pending', NULL, NULL, NOW(), NULL)
ON DUPLICATE KEY UPDATE proof = VALUES(proof);


INSERT INTO Reports (report_id, reporter_user_id, target_type, target_id, reason, details, status, reviewed_by, review_notes, created_at, reviewed_at)
VALUES
  (1, 4, 'item', 2, 'Suspicious item left unattended', 'Left near bench for 2 days', 'pending', NULL, NULL, NOW(), NULL),
  (2, 2, 'claim', 1, 'Claim seems questionable', 'Docs incomplete', 'pending', NULL, NULL, NOW(), NULL)
ON DUPLICATE KEY UPDATE reason = VALUES(reason);


INSERT INTO UserPoints (user_id, points, successful_actions, total_actions, penalty_events, updated_at)
VALUES
  (3, 120, 5, 6, 0, NOW()),
  (4, 40, 1, 3, 0, NOW()),
  (5, 10, 0, 1, 0, NOW())
ON DUPLICATE KEY UPDATE points = VALUES(points), successful_actions = VALUES(successful_actions);

INSERT IGNORE INTO Badges (badge_id, name, description, criteria)
VALUES
  (1, 'First Recovery', 'First successful item claim completed', '1 successful claim'),
  (2, 'Helper', 'Five successful recoveries completed', '5 successful recoveries'),
  (3, 'Trusted Reporter', 'Consistent report approval record', 'High report approval rate'),
  (4, 'Local Guardian', 'Strong contribution within one location', 'High location activity');


INSERT INTO UserBadges (user_id, badge_id)
SELECT 3, badge_id FROM Badges WHERE name = 'First Recovery' LIMIT 1
ON DUPLICATE KEY UPDATE awarded_at = awarded_at;

INSERT INTO UserBadges (user_id, badge_id)
SELECT 2, badge_id FROM Badges WHERE name = 'Local Guardian' LIMIT 1
ON DUPLICATE KEY UPDATE awarded_at = awarded_at;


INSERT INTO Reputation (user_id, score, trust_level, updated_at)
VALUES
  (3, 78.5, 'medium', NOW()),
  (2, 120.0, 'high', NOW()),
  (4, 12.0, 'low', NOW())
ON DUPLICATE KEY UPDATE score = VALUES(score), trust_level = VALUES(trust_level);


INSERT INTO Missions (mission_id, title, description, target_count, reward_points, active, start_date, end_date)
VALUES
  (1, 'Report 3 suspicious items', 'Help identify suspicious items in your location', 3, 50, 1, CURDATE() - INTERVAL 7 DAY, CURDATE() + INTERVAL 23 DAY),
  (2, 'Assist first recovery', 'Complete your first verified recovery', 1, 25, 1, CURDATE() - INTERVAL 1 DAY, CURDATE() + INTERVAL 29 DAY)
ON DUPLICATE KEY UPDATE title = VALUES(title);


INSERT INTO UserMissions (user_mission_id, user_id, mission_id, progress_count, status, updated_at)
VALUES
  (1, 3, 1, 1, 'in_progress', NOW()),
  (2, 4, 2, 0, 'in_progress', NOW())
ON DUPLICATE KEY UPDATE progress_count = VALUES(progress_count);


INSERT INTO Leaderboards (leaderboard_id, location_id, user_id, metric_type, metric_value, calculated_at)
VALUES
  (1, 1, 2, 'recoveries', 5.0, NOW()),
  (2, 1, 3, 'recoveries', 3.0, NOW()),
  (3, 2, 5, 'reputation', 10.0, NOW())
ON DUPLICATE KEY UPDATE metric_value = VALUES(metric_value);

SET FOREIGN_KEY_CHECKS = 1;

