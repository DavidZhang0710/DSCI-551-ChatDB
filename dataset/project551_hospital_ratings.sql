/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3306
 Source Schema         : project551_hospital_ratings

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 17/04/2025 20:42:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hospital_info
-- ----------------------------
DROP TABLE IF EXISTS `hospital_info`;
CREATE TABLE `hospital_info`  (
  `hospital_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hospital_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `state` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hospital_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `hospital_ownership` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`hospital_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_info
-- ----------------------------
INSERT INTO `hospital_info` VALUES ('100121', 'BARTOW REGIONAL MEDICAL CENTER', '2200 OSPREY BLVD', 'BARTOW', 'FL', 'Acute Care Hospitals', 'Proprietary');
INSERT INTO `hospital_info` VALUES ('10018', 'CALLAHAN EYE HOSPITAL', '1720 UNIVERSITY BLVD', 'BIRMINGHAM', 'AL', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('100191', 'MEDICAL CENTER OF TRINITY', '9330 SR 54, STE 401', 'TRINITY', 'FL', 'Acute Care Hospitals', 'Proprietary');
INSERT INTO `hospital_info` VALUES ('111310', 'MEDICAL CENTER OF PEACH COUNTY, NAVICENT HEALTH', '1960 HIGHWAY 247 CONNECTOR', 'BYRON', 'GA', 'Critical Access Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('171321', 'MEADE DISTRICT HOSPITAL', '510 EAST CARTHAGE', 'MEADE', 'KS', 'Critical Access Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('190151', 'RICHARDSON MEDICAL CENTER', '254 HIGHWAY 3048', 'RAYVILLE', 'LA', 'Acute Care Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('230156', 'ST JOSEPH MERCY HOSPITAL', '5301 E HURON RIVER DR', 'ANN ARBOR', 'MI', 'Acute Care Hospitals', 'Voluntary non-profit - Church');
INSERT INTO `hospital_info` VALUES ('250081', 'ANDERSON RMC SOUTH', '1102 CONSTITUTION AVENUE', 'MERIDIAN', 'MS', 'Acute Care Hospitals', 'Proprietary');
INSERT INTO `hospital_info` VALUES ('260070', 'PEMISCOT COUNTY MEMORIAL HOSPITAL', '946 EAST REED', 'HAYTI', 'MO', 'Acute Care Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('271310', 'GARFIELD COUNTY HEALTH CENTER', '332 LEAVITT AVE', 'JORDAN', 'MT', 'Critical Access Hospitals', 'Government - Local');
INSERT INTO `hospital_info` VALUES ('280125', 'FAITH REGIONAL HEALTH SERVICES', '2700 WEST NORFOLK AVE', 'NORFOLK', 'NE', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('340069', 'WAKEMED, RALEIGH CAMPUS', '3000 NEW BERN AVE', 'RALEIGH', 'NC', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('381312', 'COQUILLE VALLEY HOSPITAL DISTRICT', '940 EAST 5TH STREET', 'COQUILLE', 'OR', 'Critical Access Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('41328', 'CHICOT MEMORIAL MEDICAL CENTER', '2729 SOUTH HIGHWAY 65 & 82', 'LAKE VILLAGE', 'AR', 'Critical Access Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('420023', 'ST FRANCIS-DOWNTOWN', 'ONE ST FRANCIS DR', 'GREENVILLE', 'SC', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('440130', 'BAPTIST MEMORIAL HOSPITAL UNION CITY', '1201 BISHOP ST, PO BOX 310', 'UNION CITY', 'TN', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('450097', 'BAYSHORE MEDICAL CENTER', '4000 SPENCER HWY', 'PASADENA', 'TX', 'Acute Care Hospitals', 'Proprietary');
INSERT INTO `hospital_info` VALUES ('451309', 'MCCAMEY HOSPITAL', '2500 HWY 305 SOUTH', 'MCCAMEY', 'TX', 'Critical Access Hospitals', 'Government - Hospital District or Authority');
INSERT INTO `hospital_info` VALUES ('50077', 'SCRIPPS MERCY HOSPITAL', '4077 5TH AVE', 'SAN DIEGO', 'CA', 'Acute Care Hospitals', 'Voluntary non-profit - Private');
INSERT INTO `hospital_info` VALUES ('520091', 'HOWARD YOUNG MEDICAL CTR', '240 MAPLE ST', 'WOODRUFF', 'WI', 'Acute Care Hospitals', 'Voluntary non-profit - Church');

-- ----------------------------
-- Table structure for hospital_ratings
-- ----------------------------
DROP TABLE IF EXISTS `hospital_ratings`;
CREATE TABLE `hospital_ratings`  (
  `record_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hospital_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `overall_rating` int NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `hospital_id`(`hospital_id` ASC) USING BTREE,
  CONSTRAINT `hospital_ratings_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_info` (`hospital_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_ratings
-- ----------------------------
INSERT INTO `hospital_ratings` VALUES ('R00001', '171321', 4);
INSERT INTO `hospital_ratings` VALUES ('R00002', '100191', 5);
INSERT INTO `hospital_ratings` VALUES ('R00003', '111310', 4);
INSERT INTO `hospital_ratings` VALUES ('R00004', '340069', 4);
INSERT INTO `hospital_ratings` VALUES ('R00005', '10018', 3);
INSERT INTO `hospital_ratings` VALUES ('R00006', '440130', 2);
INSERT INTO `hospital_ratings` VALUES ('R00007', '340069', 3);
INSERT INTO `hospital_ratings` VALUES ('R00008', '280125', 4);
INSERT INTO `hospital_ratings` VALUES ('R00009', '100121', 1);
INSERT INTO `hospital_ratings` VALUES ('R00010', '381312', 4);
INSERT INTO `hospital_ratings` VALUES ('R00011', '520091', 2);
INSERT INTO `hospital_ratings` VALUES ('R00012', '100191', 5);
INSERT INTO `hospital_ratings` VALUES ('R00013', '340069', 5);
INSERT INTO `hospital_ratings` VALUES ('R00014', '50077', 1);
INSERT INTO `hospital_ratings` VALUES ('R00015', '100191', 1);
INSERT INTO `hospital_ratings` VALUES ('R00016', '100121', 4);
INSERT INTO `hospital_ratings` VALUES ('R00017', '280125', 1);
INSERT INTO `hospital_ratings` VALUES ('R00018', '250081', 1);
INSERT INTO `hospital_ratings` VALUES ('R00019', '520091', 1);
INSERT INTO `hospital_ratings` VALUES ('R00020', '440130', 1);
INSERT INTO `hospital_ratings` VALUES ('R00021', '230156', 1);
INSERT INTO `hospital_ratings` VALUES ('R00022', '111310', 5);
INSERT INTO `hospital_ratings` VALUES ('R00023', '100191', 2);
INSERT INTO `hospital_ratings` VALUES ('R00024', '381312', 5);
INSERT INTO `hospital_ratings` VALUES ('R00025', '250081', 5);
INSERT INTO `hospital_ratings` VALUES ('R00026', '190151', 3);
INSERT INTO `hospital_ratings` VALUES ('R00027', '111310', 4);
INSERT INTO `hospital_ratings` VALUES ('R00028', '340069', 5);
INSERT INTO `hospital_ratings` VALUES ('R00029', '440130', 3);
INSERT INTO `hospital_ratings` VALUES ('R00030', '41328', 3);
INSERT INTO `hospital_ratings` VALUES ('R00031', '381312', 2);
INSERT INTO `hospital_ratings` VALUES ('R00032', '520091', 3);
INSERT INTO `hospital_ratings` VALUES ('R00033', '260070', 5);
INSERT INTO `hospital_ratings` VALUES ('R00034', '440130', 4);
INSERT INTO `hospital_ratings` VALUES ('R00035', '250081', 2);
INSERT INTO `hospital_ratings` VALUES ('R00036', '450097', 2);
INSERT INTO `hospital_ratings` VALUES ('R00037', '190151', 4);
INSERT INTO `hospital_ratings` VALUES ('R00038', '190151', 2);
INSERT INTO `hospital_ratings` VALUES ('R00039', '41328', 2);
INSERT INTO `hospital_ratings` VALUES ('R00040', '41328', 4);
INSERT INTO `hospital_ratings` VALUES ('R00041', '190151', 2);
INSERT INTO `hospital_ratings` VALUES ('R00042', '340069', 4);
INSERT INTO `hospital_ratings` VALUES ('R00043', '451309', 1);
INSERT INTO `hospital_ratings` VALUES ('R00044', '260070', 1);
INSERT INTO `hospital_ratings` VALUES ('R00045', '250081', 5);
INSERT INTO `hospital_ratings` VALUES ('R00046', '41328', 3);
INSERT INTO `hospital_ratings` VALUES ('R00047', '171321', 1);
INSERT INTO `hospital_ratings` VALUES ('R00048', '420023', 1);
INSERT INTO `hospital_ratings` VALUES ('R00049', '520091', 2);
INSERT INTO `hospital_ratings` VALUES ('R00050', '440130', 3);
INSERT INTO `hospital_ratings` VALUES ('R00051', '230156', 1);
INSERT INTO `hospital_ratings` VALUES ('R00052', '260070', 5);
INSERT INTO `hospital_ratings` VALUES ('R00053', '41328', 1);
INSERT INTO `hospital_ratings` VALUES ('R00054', '450097', 4);
INSERT INTO `hospital_ratings` VALUES ('R00055', '271310', 1);
INSERT INTO `hospital_ratings` VALUES ('R00056', '420023', 4);
INSERT INTO `hospital_ratings` VALUES ('R00057', '271310', 5);
INSERT INTO `hospital_ratings` VALUES ('R00058', '340069', 1);
INSERT INTO `hospital_ratings` VALUES ('R00059', '171321', 3);
INSERT INTO `hospital_ratings` VALUES ('R00060', '520091', 2);
INSERT INTO `hospital_ratings` VALUES ('R00061', '340069', 3);
INSERT INTO `hospital_ratings` VALUES ('R00062', '250081', 3);
INSERT INTO `hospital_ratings` VALUES ('R00063', '250081', 2);
INSERT INTO `hospital_ratings` VALUES ('R00064', '50077', 4);
INSERT INTO `hospital_ratings` VALUES ('R00065', '10018', 3);
INSERT INTO `hospital_ratings` VALUES ('R00066', '41328', 1);
INSERT INTO `hospital_ratings` VALUES ('R00067', '420023', 2);
INSERT INTO `hospital_ratings` VALUES ('R00068', '41328', 3);
INSERT INTO `hospital_ratings` VALUES ('R00069', '100121', 3);
INSERT INTO `hospital_ratings` VALUES ('R00070', '171321', 5);
INSERT INTO `hospital_ratings` VALUES ('R00071', '271310', 4);
INSERT INTO `hospital_ratings` VALUES ('R00072', '450097', 4);
INSERT INTO `hospital_ratings` VALUES ('R00073', '451309', 4);
INSERT INTO `hospital_ratings` VALUES ('R00074', '381312', 3);
INSERT INTO `hospital_ratings` VALUES ('R00075', '190151', 3);
INSERT INTO `hospital_ratings` VALUES ('R00076', '250081', 1);
INSERT INTO `hospital_ratings` VALUES ('R00077', '381312', 4);
INSERT INTO `hospital_ratings` VALUES ('R00078', '381312', 5);
INSERT INTO `hospital_ratings` VALUES ('R00079', '450097', 5);
INSERT INTO `hospital_ratings` VALUES ('R00080', '451309', 5);
INSERT INTO `hospital_ratings` VALUES ('R00081', '520091', 2);
INSERT INTO `hospital_ratings` VALUES ('R00082', '381312', 4);
INSERT INTO `hospital_ratings` VALUES ('R00083', '450097', 2);
INSERT INTO `hospital_ratings` VALUES ('R00084', '100121', 2);
INSERT INTO `hospital_ratings` VALUES ('R00085', '420023', 2);
INSERT INTO `hospital_ratings` VALUES ('R00086', '111310', 5);
INSERT INTO `hospital_ratings` VALUES ('R00087', '440130', 2);
INSERT INTO `hospital_ratings` VALUES ('R00088', '250081', 4);
INSERT INTO `hospital_ratings` VALUES ('R00089', '451309', 4);
INSERT INTO `hospital_ratings` VALUES ('R00090', '260070', 5);
INSERT INTO `hospital_ratings` VALUES ('R00091', '190151', 4);
INSERT INTO `hospital_ratings` VALUES ('R00092', '520091', 3);
INSERT INTO `hospital_ratings` VALUES ('R00093', '50077', 1);
INSERT INTO `hospital_ratings` VALUES ('R00094', '41328', 3);
INSERT INTO `hospital_ratings` VALUES ('R00095', '230156', 1);
INSERT INTO `hospital_ratings` VALUES ('R00096', '451309', 4);
INSERT INTO `hospital_ratings` VALUES ('R00097', '450097', 4);
INSERT INTO `hospital_ratings` VALUES ('R00098', '440130', 3);
INSERT INTO `hospital_ratings` VALUES ('R00099', '190151', 5);
INSERT INTO `hospital_ratings` VALUES ('R00100', '10018', 4);
INSERT INTO `hospital_ratings` VALUES ('R00101', '271310', 1);
INSERT INTO `hospital_ratings` VALUES ('R00102', '111310', 5);
INSERT INTO `hospital_ratings` VALUES ('R00103', '420023', 5);
INSERT INTO `hospital_ratings` VALUES ('R00104', '451309', 4);
INSERT INTO `hospital_ratings` VALUES ('R00105', '100121', 3);
INSERT INTO `hospital_ratings` VALUES ('R00106', '50077', 5);
INSERT INTO `hospital_ratings` VALUES ('R00107', '271310', 4);
INSERT INTO `hospital_ratings` VALUES ('R00108', '340069', 1);

SET FOREIGN_KEY_CHECKS = 1;
