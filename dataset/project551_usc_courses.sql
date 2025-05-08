/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3306
 Source Schema         : project551_usc_courses

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 17/04/2025 21:00:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `Course_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Course_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Units` float NULL DEFAULT NULL,
  `Prerequisites` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Days` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Instructor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Course_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('CSCI 102L', 'Fundamentals of Computation', 2, 'Not available', '3:00-4:50pm', 'Monday', 'Mohammad Reza Rajati');
INSERT INTO `courses` VALUES ('CSCI 103L', 'Introduction to Programming', 4, 'Prerequisite: CSCI 102', '8:00-9:20am', 'Tue, Thu', 'Mark Redekopp');
INSERT INTO `courses` VALUES ('CSCI 104L', 'Data Structures and Object Oriented Design', 4, 'Prerequisite: CSCI 103 and CSCI 170', '11:00-12:20pm', 'Tue, Thu', 'Andrew Goodney');
INSERT INTO `courses` VALUES ('CSCI 170', 'Discrete Methods in Computer Science', 4, 'Prerequisite: CSCI 102', '9:30-10:50am', 'Tue, Thu', 'Aaron Cote');
INSERT INTO `courses` VALUES ('CSCI 201', 'Principles of Software Development', 4, 'Prerequisite: CSCI 104', '11:00-12:20pm', 'Tue, Thu', 'Marco Papa');
INSERT INTO `courses` VALUES ('CSCI 270', 'Introduction to Algorithms and Theory of Computing', 4, 'Prerequisite: CSCI 104 and CSCI 170', '12:30-1:50pm', 'Mon, Wed', 'David Kempe');
INSERT INTO `courses` VALUES ('CSCI 310', 'Software Engineering', 4, 'Prerequisite: CSCI 201', '10:00-11:50am', 'Mon, Wed', 'William Halfond');
INSERT INTO `courses` VALUES ('CSCI 350', 'Introduction to Operating Systems', 4, 'Prerequisite: CSCI 201 and 1 from (CSCI 356 or EE 354)', '12:00-3:20pm', 'Friday', 'Tanya Ryutov');
INSERT INTO `courses` VALUES ('CSCI 353', 'Introduction to Internetworking', 4, 'Prerequisite: CSCI 201', '12:00-1:50pm', 'Mon, Wed', 'William Cheng');
INSERT INTO `courses` VALUES ('CSCI 356', 'Introduction to Computer Systems', 4, 'Prerequisite: CSCI 104', '3:30-4:50pm', 'Tue, Thu', 'Marco Paolieri');
INSERT INTO `courses` VALUES ('CSCI 360', 'Introduction to Artificial Intelligence', 4, 'Prerequisite: CSCI 104 and CSCI 170', '12:00-1:50pm', 'Mon, Wed', 'Mohammad Reza Rajati');
INSERT INTO `courses` VALUES ('CSCI 368', 'Cross-Platform App Development', 4, 'Prerequisite: 1 from (ITP 265 or CSCI 103)', '6:00-9:40pm', 'Tuesday', 'Allen Almasi');
INSERT INTO `courses` VALUES ('CSCI 401', 'Capstone: Design and Construction of Large Software Systems', 4, 'Prerequisite: (CSCI 270 and CSCI 310)', '8:00-9:50am', 'Mon, Wed', 'Victor Adamchik');
INSERT INTO `courses` VALUES ('CSCI 402', 'Operating Systems', 4, 'Not available', '10:00-11:20am', 'Mon, Wed', 'William Cheng');
INSERT INTO `courses` VALUES ('CSCI 420', 'Computer Graphics', 4, 'Prerequisite: CSCI 104 and 1 from (MATH 225 or (EE 141 and MATH 126) or (EE 141 and MATH 127) or (EE 141 and MATH 129))', '10:00-11:50am', 'Mon, Wed', 'Jernej Barbic');
INSERT INTO `courses` VALUES ('CSCI 426', 'Game Prototyping', 4, 'Not available', '1:00-4:20pm', 'Wednesday', 'Andrew Nealen');
INSERT INTO `courses` VALUES ('CSCI 430', 'Introduction to Computer and Network Security', 4, 'Prerequisite: CSCI 201', '4:00-5:50pm', 'Mon, Wed', 'Genevieve Bartlett');
INSERT INTO `courses` VALUES ('CSCI 435', 'Professional C++', 4, 'Prerequisite: 1 from (CSCI 104 or ITP 365)', '2:00-3:50pm', 'Mon, Wed', 'Sanjay Madhav');
INSERT INTO `courses` VALUES ('CSCI 445L', 'Introduction to Robotics', 4, 'Prerequisite: CSCI 103', '8:00-9:20am', 'Tue, Thu', 'Erdem Biyik');
INSERT INTO `courses` VALUES ('CSCI 452', 'Parallel and Distributed Computation', 4, 'Prerequisite: 1 from (EE 355 or CSCI 201)', '2:00-3:20pm', 'Tue, Thu', 'Viktor Prasanna');
INSERT INTO `courses` VALUES ('CSCI 455x', 'Introduction to Programming Systems Design', 4, 'Not available', '10:00-11:20am', 'Tue, Thu', 'Claire Bono');
INSERT INTO `courses` VALUES ('CSCI 457', 'Computer Systems Organization', 4, 'Prerequisite: EE 354', '2:00-3:50pm', 'Mon, Wed', 'Gandhi Puvvada');
INSERT INTO `courses` VALUES ('CSCI 458', 'Numerical Methods', 4, 'Prerequisite: 1 from (MATH 225 or MATH 235 or MATH 245)', '2:00-2:50pm', 'MWF', 'Aykut Arslan');
INSERT INTO `courses` VALUES ('CSCI 467', 'Introduction to Machine Learning', 4, 'Prerequisite: (CSCI 270 and MATH 225) and 1 from (EE 364 or MATH 407)', '3:30-4:50pm', 'Tue, Thu', 'Robin Jia');
INSERT INTO `courses` VALUES ('CSCI 475', 'Theory of Computation', 4, 'Prerequisite: CSCI 270', '10:00-11:50am', 'Mon, Wed', 'Aaron Cote');
INSERT INTO `courses` VALUES ('CSCI 490x', 'Directed Research', 1, 'Not available', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 499', 'Special Topics', 2, 'Not available', '8:00-9:50am', 'Mon, Wed', 'Souti Chattopadhyay');
INSERT INTO `courses` VALUES ('CSCI 501', 'Numerical Analysis and Computation', 3, 'Not available', '12:00-12:50pm', 'MWF', 'Cymra Haskell');
INSERT INTO `courses` VALUES ('CSCI 502a', 'Numerical Analysis', 3, 'Prerequisite: (MATH 425A and MATH 471)', '9:00-9:50am', 'MWF', 'Gary Rosen');
INSERT INTO `courses` VALUES ('CSCI 505b', 'Applied Probability', 3, 'Prerequisite: MATH 505A', '1:00-1:50pm', 'MWF', 'Ken Alexander');
INSERT INTO `courses` VALUES ('CSCI 520', 'Computer Animation and Simulation', 4, 'Prerequisite: 1 from (CSCI 420 or CSCI 580)', '2:00-3:50pm', 'Mon, Wed', 'Jernej Barbic');
INSERT INTO `courses` VALUES ('CSCI 522', 'Game Engine Development', 4, 'Not available', '7:00-10:20pm', 'Monday', 'Artjoms Kovalovs');
INSERT INTO `courses` VALUES ('CSCI 526', 'Advanced Mobile Devices and Game Consoles', 4, 'Not available', '1:00-4:20pm', 'Tuesday', 'Scott Easley');
INSERT INTO `courses` VALUES ('CSCI 531', 'Applied Cryptography', 4, 'Not available', '2:00-5:20pm', 'Wednesday', 'Tanya Ryutov');
INSERT INTO `courses` VALUES ('CSCI 532', 'Innovation for Defense Applications', 4, 'Not available', '3:30-6:50pm', 'Thursday', 'Clifford Neuman');
INSERT INTO `courses` VALUES ('CSCI 533', 'Algebraic Combinatorics', 3, 'Prerequisite: MATH 410 and MATH 532', '1:00-1:50pm', 'MWF', 'Sami Assaf');
INSERT INTO `courses` VALUES ('CSCI 534', 'Affective Computing', 4, 'Not available', '2:00-3:50pm', 'Mon, Wed', 'Jonathan Gratch');
INSERT INTO `courses` VALUES ('CSCI 535', 'Multimodal Probabilistic Learning of Human Communication', 4, 'Not available', '3:30-5:20pm', 'Tue, Thu', 'nan');
INSERT INTO `courses` VALUES ('CSCI 536', 'Linear Programming and Extensions', 4, 'Not available', '2:00-5:20pm', 'Wednesday', 'Monir Sabbaghtorkan');
INSERT INTO `courses` VALUES ('CSCI 544', 'Applied Natural Language Processing', 4, 'Not available', '5:00-6:50pm', 'Tue, Thu', 'Xuezhe Ma');
INSERT INTO `courses` VALUES ('CSCI 545', 'Robotics', 4, 'Not available', '4:00-5:50pm', 'Mon, Wed', 'Daniel Seita');
INSERT INTO `courses` VALUES ('CSCI 547', 'Robot Dynamics and Control', 4, 'Not available', '10:00-11:50am', 'Mon, Wed', 'Quan Nguyen');
INSERT INTO `courses` VALUES ('CSCI 550', 'Advanced Data Stores', 4, 'Prerequisite: 1 from (CSCI 485 or CSCI 585)', '10:00-11:50am', 'Tue, Thu', 'Ibrahim Sabek');
INSERT INTO `courses` VALUES ('CSCI 554', 'Cyber-Physical Systems: A Computing Perspective', 4, 'Not available', '8:00-9:50am', 'Mon, Wed', 'Paul Bogdan');
INSERT INTO `courses` VALUES ('CSCI 555L', 'Advanced Operating Systems', 4, 'Prerequisite: 1 from (CSCI 350 or CSCI 402)', '2:00-3:50pm', 'Mon, Wed', 'Harsha Madhyastha');
INSERT INTO `courses` VALUES ('CSCI 557', 'Computer Systems Architecture', 4, 'Prerequisite: EE 457', '2:00-3:50pm', 'Tue, Thu', 'Murali Annavaram');
INSERT INTO `courses` VALUES ('CSCI 559', 'Machine Learning I: Supervised Methods', 4, 'Not available', '4:00-5:50pm', 'Mon, Wed', 'Keith Jenkins');
INSERT INTO `courses` VALUES ('CSCI 561', 'Foundations of Artificial Intelligence', 4, 'Not available', '3:00-4:50pm', 'Mon, Wed', 'Laurent Itti');
INSERT INTO `courses` VALUES ('CSCI 566', 'Deep Learning and Its Applications', 4, 'Not available', '1:00-4:20pm', 'Friday', 'Yue Zhao');
INSERT INTO `courses` VALUES ('CSCI 567', 'Machine Learning', 4, 'Not available', '1:00-3:20pm', 'Friday', 'Vatsal Sharan');
INSERT INTO `courses` VALUES ('CSCI 570', 'Analysis of Algorithms', 4, 'Not available', '5:00-7:20pm', 'Wednesday', 'Shahriar Shamsian');
INSERT INTO `courses` VALUES ('CSCI 571', 'Web Technologies', 4, 'Not available', '7:30-9:20pm', 'Tue, Thu', 'Marco Papa');
INSERT INTO `courses` VALUES ('CSCI 572', 'Information Retrieval and Web Search Engines', 4, 'Not available', '5:00-8:20pm', 'Tuesday', 'Sathyanaraya Raghavachary');
INSERT INTO `courses` VALUES ('CSCI 575', 'Quantum Computing and Quantum Cryptography', 4, 'Not available', '2:00-3:50pm', 'Mon, Wed', 'Ming-Deh Huang');
INSERT INTO `courses` VALUES ('CSCI 576', 'Multimedia Systems Design', 4, 'Not available', '6:00-9:20pm', 'Monday', 'Parag Havaldar');
INSERT INTO `courses` VALUES ('CSCI 580', '3-D Graphics and Rendering', 4, 'Not available', '2:00-3:50pm', 'Tue, Thu', 'Sathyanaraya Raghavachary');
INSERT INTO `courses` VALUES ('CSCI 585', 'Database Systems', 4, 'Not available', '5:00-7:20pm', 'Thursday', 'Sathyanaraya Raghavachary');
INSERT INTO `courses` VALUES ('CSCI 590', 'Directed Research', 1, 'Not available', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 591', 'Computer Science Research Colloquium', 1, 'Not available', '4:00-5:20pm', 'Tue, Thu', 'nan');
INSERT INTO `courses` VALUES ('CSCI 593', 'Mathematical Foundations for System Design: Modeling, Analys', 4, 'Not available', '4:00-5:50pm', 'Tue, Thu', 'Pierluigi Nuzzo');
INSERT INTO `courses` VALUES ('CSCI 599', 'Special Topics', 2, 'Not available', '5:00-6:50pm', 'Mon, Wed', 'Shahram Ghandeharizadeh');
INSERT INTO `courses` VALUES ('CSCI 625', 'Program Synthesis and Computer-Aided Verification', 4, 'Not available', '3:30-5:20pm', 'Mon, Wed', 'Mukund Raghothaman');
INSERT INTO `courses` VALUES ('CSCI 641', 'Computational Human-Robot Interaction', 4, 'Not available', '8:00-9:50am', 'Mon, Wed', 'Stefanos Nikolaidis');
INSERT INTO `courses` VALUES ('CSCI 644', 'Natural Language Dialogue Systems', 4, 'Not available', '1:00-4:20pm', 'Wednesday', 'Kallirroi Georgila,David Traum');
INSERT INTO `courses` VALUES ('CSCI 655', 'Advanced Topics in Operating Systems', 4, 'Prerequisite: 1 from (CSCI 350 or CSCI 402)', '2:00-3:50pm', 'Mon, Wed', 'Harsha Madhyastha');
INSERT INTO `courses` VALUES ('CSCI 656', 'Networked Systems in Cloud Computing', 4, 'Prerequisite: 1 from (CSCI 551 or CSCI 651)', '4:00-5:50pm', 'Mon, Wed', 'Ramesh Govindan');
INSERT INTO `courses` VALUES ('CSCI 658', 'Diagnosis and Design of Reliable Digital Systems', 4, 'Not available', '11:00-2:50pm', 'Saturday', 'Moe Tabar');
INSERT INTO `courses` VALUES ('CSCI 670', 'Advanced Analysis of Algorithms', 4, 'Prerequisite: CSCI 570', '10:00-11:50am', 'Mon, Wed', 'Ming-Deh Huang');
INSERT INTO `courses` VALUES ('CSCI 675', 'Convex and Combinatorial Optimization', 4, 'Prerequisite: 1 from (CSCI 570 or CSCI 670)', '2:00-3:50pm', 'Mon, Wed', 'Shaddin Dughmi');
INSERT INTO `courses` VALUES ('CSCI 697', 'Seminar in Computer Science Research', 1, 'Not available', '12:00-12:50pm', 'Monday', 'nan');
INSERT INTO `courses` VALUES ('CSCI 698', 'Practicum in Teaching Computer Science', 1, 'Not available', '1:00-1:50pm', 'Monday', 'nan');
INSERT INTO `courses` VALUES ('CSCI 699', 'Special Topics', 2, 'Not available', '3:00-6:20pm', 'Monday', 'Souti Chattopadhyay');
INSERT INTO `courses` VALUES ('CSCI 790', 'Research', 1, 'Not available', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 794a', 'Doctoral Dissertation', 2, 'Not available', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 794b', 'Doctoral Dissertation', 2, 'Prerequisite: CSCI 794a', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 794c', 'Doctoral Dissertation', 2, 'Prerequisite: CSCI 794b', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 794d', 'Doctoral Dissertation', 2, 'Prerequisite: CSCI 794c', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('CSCI 794z', 'Doctoral Dissertation', 0, 'Prerequisite: CSCI 794d', 'TBA', 'TBA', 'nan');
INSERT INTO `courses` VALUES ('DSCI 351', 'Foundations of Data Management', 4, 'Prerequisite: DSCI 250 and ITP 115', '10:00-11:50am', 'Mon, Wed', 'Wensheng Wu');
INSERT INTO `courses` VALUES ('DSCI 352', 'Applied Machine Learning and Data Mining', 4, 'Prerequisite: DSCI 250 and MATH 208', '3:30-6:50pm', 'Thursday', 'David Pynadath');
INSERT INTO `courses` VALUES ('DSCI 454', 'Data Visualization and User Interface Design', 4, 'Prerequisite: DSCI 250', '2:00-5:20pm', 'Tuesday', 'David Chan');
INSERT INTO `courses` VALUES ('DSCI 510', 'Principles of Programming for Data Science', 4, 'Not available', '12:00-1:50pm', 'Monday', 'nan');
INSERT INTO `courses` VALUES ('DSCI 525', 'Trusted System Design, Analysis and Development', 4, 'Not available', '2:00-5:20pm', 'Monday', 'Tanya Ryutov');
INSERT INTO `courses` VALUES ('DSCI 529', 'Security and Privacy', 4, 'Not available', '12:00-3:20pm', 'Friday', 'Clifford Neuman');
INSERT INTO `courses` VALUES ('DSCI 531', 'Fairness in Artificial Intelligence', 4, 'Not available', '10:00-11:50am', 'Mon, Wed', 'nan');
INSERT INTO `courses` VALUES ('DSCI 549', 'Introduction to Computational Thinking and Data Science', 4, 'Not available', '2:00-5:20pm', 'Tuesday', 'Ning Wang');
INSERT INTO `courses` VALUES ('DSCI 550', 'Data Science at Scale', 4, 'Not available', '4:00-7:20pm', 'Thursday', 'Christian Mattmann');
INSERT INTO `courses` VALUES ('DSCI 551', 'Foundations of Data Management', 4, 'Not available', '5:00-8:20pm', 'Wednesday', 'Wensheng Wu');
INSERT INTO `courses` VALUES ('DSCI 552', 'Machine Learning for Data Science', 4, 'Not available', '4:00-5:50pm', 'Tue, Thu', 'Mohammad Reza Rajati');
INSERT INTO `courses` VALUES ('DSCI 553', 'Foundations and Applications of Data Mining', 4, 'Prerequisite: 1 from (DSCI 551 or CSCI 585) and 1 from (DSCI 552 or CSCI 567)', '2:00-5:20pm', 'Friday', 'Wei-Min Shen');
INSERT INTO `courses` VALUES ('DSCI 560', 'Data Science Professional Practicum', 4, 'Not available', '8:00-9:50am', 'Tue, Thu', 'Young Cho');
INSERT INTO `courses` VALUES ('DSCI 561', 'Predictive Analytics', 4, 'Not available', '12:00-1:50pm', 'Mon, Wed', 'Maryam Pishgar');
INSERT INTO `courses` VALUES ('DSCI 563', 'Medical Diagnostics, Therapeutics and Informatics Applications', 4, 'Not available', '10:00-11:50am', 'Tue, Thu', 'Brent Liu');
INSERT INTO `courses` VALUES ('DSCI 599', 'Special Topics', 1, 'Not available', '12:00-1:50pm', 'Mon, Wed', 'Alefiya Hussain');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `usc_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`usc_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (2025200001, 'David', 22, 'Data Science');
INSERT INTO `students` VALUES (2025200002, 'Huangyu', 22, 'Computer Science');
INSERT INTO `students` VALUES (2025200003, 'Angela', 23, 'Data Science');
INSERT INTO `students` VALUES (2025200004, 'Amey', 22, 'Data Science');

SET FOREIGN_KEY_CHECKS = 1;
