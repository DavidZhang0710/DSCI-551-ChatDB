/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3306
 Source Schema         : project551_movie_rental

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 17/04/2025 20:43:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film`  (
  `film_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `release_year` year NULL DEFAULT NULL,
  `rental_duration` tinyint UNSIGNED NOT NULL DEFAULT 3,
  `rental_rate` decimal(4, 2) NOT NULL DEFAULT 4.99,
  `length` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES (1, 'ACADEMY DINOSAUR', 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies', 2006, 6, 0.99, 86);
INSERT INTO `film` VALUES (2, 'ACE GOLDFINGER', 'A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China', 2006, 3, 4.99, 48);
INSERT INTO `film` VALUES (3, 'ADAPTATION HOLES', 'A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory', 2006, 7, 2.99, 50);
INSERT INTO `film` VALUES (4, 'AFFAIR PREJUDICE', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', 2006, 5, 2.99, 117);
INSERT INTO `film` VALUES (5, 'AFRICAN EGG', 'A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico', 2006, 6, 2.99, 130);
INSERT INTO `film` VALUES (6, 'AGENT TRUMAN', 'A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China', 2006, 3, 2.99, 169);
INSERT INTO `film` VALUES (7, 'AIRPLANE SIERRA', 'A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat', 2006, 6, 4.99, 62);
INSERT INTO `film` VALUES (8, 'AIRPORT POLLOCK', 'A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India', 2006, 6, 4.99, 54);
INSERT INTO `film` VALUES (9, 'ALABAMA DEVIL', 'A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat', 2006, 3, 2.99, 114);
INSERT INTO `film` VALUES (10, 'ALADDIN CALENDAR', 'A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China', 2006, 6, 4.99, 63);
INSERT INTO `film` VALUES (11, 'ALAMO VIDEOTAPE', 'A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention', 2006, 6, 0.99, 126);
INSERT INTO `film` VALUES (12, 'ALASKA PHANTOM', 'A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia', 2006, 6, 0.99, 136);
INSERT INTO `film` VALUES (13, 'ALI FOREVER', 'A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies', 2006, 4, 4.99, 150);
INSERT INTO `film` VALUES (14, 'ALICE FANTASIA', 'A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia', 2006, 6, 0.99, 94);
INSERT INTO `film` VALUES (15, 'ALIEN CENTER', 'A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention', 2006, 5, 2.99, 46);
INSERT INTO `film` VALUES (16, 'ALLEY EVOLUTION', 'A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans', 2006, 6, 2.99, 180);
INSERT INTO `film` VALUES (17, 'ALONE TRIP', 'A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House', 2006, 3, 0.99, 82);
INSERT INTO `film` VALUES (18, 'ALTER VICTORY', 'A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies', 2006, 6, 0.99, 57);
INSERT INTO `film` VALUES (19, 'AMADEUS HOLY', 'A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon', 2006, 6, 0.99, 113);
INSERT INTO `film` VALUES (20, 'AMELIE HELLFIGHTERS', 'A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon', 2006, 4, 4.99, 79);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `inventory_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` smallint UNSIGNED NOT NULL,
  `store_id` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`inventory_id`) USING BTREE,
  INDEX `film_id`(`film_id` ASC) USING BTREE,
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 1, 1);
INSERT INTO `inventory` VALUES (2, 1, 1);
INSERT INTO `inventory` VALUES (3, 1, 1);
INSERT INTO `inventory` VALUES (4, 1, 1);
INSERT INTO `inventory` VALUES (5, 1, 2);
INSERT INTO `inventory` VALUES (6, 1, 2);
INSERT INTO `inventory` VALUES (7, 1, 2);
INSERT INTO `inventory` VALUES (8, 1, 2);
INSERT INTO `inventory` VALUES (9, 2, 2);
INSERT INTO `inventory` VALUES (10, 2, 2);
INSERT INTO `inventory` VALUES (11, 2, 2);
INSERT INTO `inventory` VALUES (12, 3, 2);
INSERT INTO `inventory` VALUES (13, 3, 2);
INSERT INTO `inventory` VALUES (14, 3, 2);
INSERT INTO `inventory` VALUES (15, 3, 2);
INSERT INTO `inventory` VALUES (16, 4, 1);
INSERT INTO `inventory` VALUES (17, 4, 1);
INSERT INTO `inventory` VALUES (18, 4, 1);
INSERT INTO `inventory` VALUES (19, 4, 1);
INSERT INTO `inventory` VALUES (20, 4, 2);
INSERT INTO `inventory` VALUES (21, 4, 2);
INSERT INTO `inventory` VALUES (22, 4, 2);
INSERT INTO `inventory` VALUES (23, 5, 2);
INSERT INTO `inventory` VALUES (24, 5, 2);
INSERT INTO `inventory` VALUES (25, 5, 2);
INSERT INTO `inventory` VALUES (26, 6, 1);
INSERT INTO `inventory` VALUES (27, 6, 1);
INSERT INTO `inventory` VALUES (28, 6, 1);
INSERT INTO `inventory` VALUES (29, 6, 2);
INSERT INTO `inventory` VALUES (30, 6, 2);
INSERT INTO `inventory` VALUES (31, 6, 2);
INSERT INTO `inventory` VALUES (32, 7, 1);
INSERT INTO `inventory` VALUES (33, 7, 1);
INSERT INTO `inventory` VALUES (34, 7, 2);
INSERT INTO `inventory` VALUES (35, 7, 2);
INSERT INTO `inventory` VALUES (36, 7, 2);
INSERT INTO `inventory` VALUES (37, 8, 2);
INSERT INTO `inventory` VALUES (38, 8, 2);
INSERT INTO `inventory` VALUES (39, 8, 2);
INSERT INTO `inventory` VALUES (40, 8, 2);
INSERT INTO `inventory` VALUES (41, 9, 1);
INSERT INTO `inventory` VALUES (42, 9, 1);
INSERT INTO `inventory` VALUES (43, 9, 1);
INSERT INTO `inventory` VALUES (44, 9, 2);
INSERT INTO `inventory` VALUES (45, 9, 2);
INSERT INTO `inventory` VALUES (46, 10, 1);
INSERT INTO `inventory` VALUES (47, 10, 1);
INSERT INTO `inventory` VALUES (48, 10, 1);
INSERT INTO `inventory` VALUES (49, 10, 1);
INSERT INTO `inventory` VALUES (50, 10, 2);
INSERT INTO `inventory` VALUES (51, 10, 2);
INSERT INTO `inventory` VALUES (52, 10, 2);
INSERT INTO `inventory` VALUES (53, 11, 1);
INSERT INTO `inventory` VALUES (54, 11, 1);
INSERT INTO `inventory` VALUES (55, 11, 1);
INSERT INTO `inventory` VALUES (56, 11, 1);
INSERT INTO `inventory` VALUES (57, 11, 2);
INSERT INTO `inventory` VALUES (58, 11, 2);
INSERT INTO `inventory` VALUES (59, 11, 2);
INSERT INTO `inventory` VALUES (60, 12, 1);
INSERT INTO `inventory` VALUES (61, 12, 1);
INSERT INTO `inventory` VALUES (62, 12, 1);
INSERT INTO `inventory` VALUES (63, 12, 2);
INSERT INTO `inventory` VALUES (64, 12, 2);
INSERT INTO `inventory` VALUES (65, 12, 2);
INSERT INTO `inventory` VALUES (66, 12, 2);
INSERT INTO `inventory` VALUES (67, 13, 2);
INSERT INTO `inventory` VALUES (68, 13, 2);
INSERT INTO `inventory` VALUES (69, 13, 2);
INSERT INTO `inventory` VALUES (70, 13, 2);
INSERT INTO `inventory` VALUES (71, 15, 1);
INSERT INTO `inventory` VALUES (72, 15, 1);
INSERT INTO `inventory` VALUES (73, 15, 2);
INSERT INTO `inventory` VALUES (74, 15, 2);
INSERT INTO `inventory` VALUES (75, 15, 2);
INSERT INTO `inventory` VALUES (76, 15, 2);
INSERT INTO `inventory` VALUES (77, 16, 1);
INSERT INTO `inventory` VALUES (78, 16, 1);
INSERT INTO `inventory` VALUES (79, 16, 2);
INSERT INTO `inventory` VALUES (80, 16, 2);
INSERT INTO `inventory` VALUES (81, 17, 1);
INSERT INTO `inventory` VALUES (82, 17, 1);
INSERT INTO `inventory` VALUES (83, 17, 1);
INSERT INTO `inventory` VALUES (84, 17, 2);
INSERT INTO `inventory` VALUES (85, 17, 2);
INSERT INTO `inventory` VALUES (86, 17, 2);
INSERT INTO `inventory` VALUES (87, 18, 1);
INSERT INTO `inventory` VALUES (88, 18, 1);
INSERT INTO `inventory` VALUES (89, 18, 1);
INSERT INTO `inventory` VALUES (90, 18, 2);
INSERT INTO `inventory` VALUES (91, 18, 2);
INSERT INTO `inventory` VALUES (92, 18, 2);
INSERT INTO `inventory` VALUES (93, 19, 1);
INSERT INTO `inventory` VALUES (94, 19, 1);
INSERT INTO `inventory` VALUES (95, 19, 1);
INSERT INTO `inventory` VALUES (96, 19, 1);
INSERT INTO `inventory` VALUES (97, 19, 2);
INSERT INTO `inventory` VALUES (98, 19, 2);
INSERT INTO `inventory` VALUES (99, 20, 1);
INSERT INTO `inventory` VALUES (100, 20, 1);
INSERT INTO `inventory` VALUES (101, 20, 1);

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental`  (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint UNSIGNED NOT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`) USING BTREE,
  INDEX `inventory_id`(`inventory_id` ASC) USING BTREE,
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES (1, '2024-05-03 13:35:30', 93, '2024-05-12 05:35:04');
INSERT INTO `rental` VALUES (2, '2024-05-01 00:45:57', 35, '2024-05-02 13:52:53');
INSERT INTO `rental` VALUES (3, '2024-05-09 16:23:48', 2, '2024-05-13 06:17:11');
INSERT INTO `rental` VALUES (4, '2024-05-09 10:24:13', 91, '2024-05-16 04:07:16');
INSERT INTO `rental` VALUES (5, '2024-04-29 19:24:29', 88, '2024-05-03 23:56:45');
INSERT INTO `rental` VALUES (6, '2024-04-25 04:34:05', 20, '2024-05-01 11:33:22');
INSERT INTO `rental` VALUES (7, '2024-04-28 13:55:13', 44, '2024-05-08 09:00:13');
INSERT INTO `rental` VALUES (8, '2024-05-04 08:12:13', 45, '2024-05-14 00:59:35');
INSERT INTO `rental` VALUES (9, '2024-04-18 22:25:18', 68, '2024-04-23 03:25:03');
INSERT INTO `rental` VALUES (10, '2024-05-12 04:19:35', 47, '2024-05-19 07:47:22');
INSERT INTO `rental` VALUES (11, '2024-05-12 15:43:19', 83, '2024-05-18 17:42:02');
INSERT INTO `rental` VALUES (12, '2024-04-27 15:29:49', 7, '2024-05-03 04:05:41');
INSERT INTO `rental` VALUES (13, '2024-04-18 08:11:36', 39, '2024-04-25 19:25:33');
INSERT INTO `rental` VALUES (14, '2024-04-19 04:57:46', 58, '2024-04-23 12:07:26');
INSERT INTO `rental` VALUES (15, '2024-05-13 16:46:15', 71, '2024-05-21 09:41:34');
INSERT INTO `rental` VALUES (16, '2024-05-17 10:13:01', 17, '2024-05-27 09:53:16');
INSERT INTO `rental` VALUES (17, '2024-04-18 06:50:51', 66, '2024-04-26 08:53:01');
INSERT INTO `rental` VALUES (18, '2024-05-07 19:56:06', 17, '2024-05-10 22:27:26');
INSERT INTO `rental` VALUES (19, '2024-05-03 20:15:16', 24, '2024-05-13 01:29:41');
INSERT INTO `rental` VALUES (20, '2024-04-22 06:38:38', 49, '2024-04-25 05:35:47');
INSERT INTO `rental` VALUES (21, '2024-05-20 08:16:05', 2, '2024-06-01 19:50:11');

SET FOREIGN_KEY_CHECKS = 1;
