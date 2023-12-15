/*
 Navicat Premium Data Transfer

 Source Server         : mysql_local
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : webcloud

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 14/12/2023 17:56:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 犊牛笼', 6, 'add_cage');
INSERT INTO `auth_permission` VALUES (22, 'Can change 犊牛笼', 6, 'change_cage');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 犊牛笼', 6, 'delete_cage');
INSERT INTO `auth_permission` VALUES (24, 'Can view 犊牛笼', 6, 'view_cage');
INSERT INTO `auth_permission` VALUES (25, 'Can add 犊牛', 7, 'add_calf');
INSERT INTO `auth_permission` VALUES (26, 'Can change 犊牛', 7, 'change_calf');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 犊牛', 7, 'delete_calf');
INSERT INTO `auth_permission` VALUES (28, 'Can view 犊牛', 7, 'view_calf');
INSERT INTO `auth_permission` VALUES (29, 'Can add 牧场', 8, 'add_pasture');
INSERT INTO `auth_permission` VALUES (30, 'Can change 牧场', 8, 'change_pasture');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 牧场', 8, 'delete_pasture');
INSERT INTO `auth_permission` VALUES (32, 'Can view 牧场', 8, 'view_pasture');
INSERT INTO `auth_permission` VALUES (33, 'Can add RFID', 9, 'add_rfid');
INSERT INTO `auth_permission` VALUES (34, 'Can change RFID', 9, 'change_rfid');
INSERT INTO `auth_permission` VALUES (35, 'Can delete RFID', 9, 'delete_rfid');
INSERT INTO `auth_permission` VALUES (36, 'Can view RFID', 9, 'view_rfid');
INSERT INTO `auth_permission` VALUES (37, 'Can add RFID & 犊牛笼', 10, 'add_rfidcage');
INSERT INTO `auth_permission` VALUES (38, 'Can change RFID & 犊牛笼', 10, 'change_rfidcage');
INSERT INTO `auth_permission` VALUES (39, 'Can delete RFID & 犊牛笼', 10, 'delete_rfidcage');
INSERT INTO `auth_permission` VALUES (40, 'Can view RFID & 犊牛笼', 10, 'view_rfidcage');
INSERT INTO `auth_permission` VALUES (41, 'Can add 历史加奶数据', 11, 'add_historydata');
INSERT INTO `auth_permission` VALUES (42, 'Can change 历史加奶数据', 11, 'change_historydata');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 历史加奶数据', 11, 'delete_historydata');
INSERT INTO `auth_permission` VALUES (44, 'Can view 历史加奶数据', 11, 'view_historydata');
INSERT INTO `auth_permission` VALUES (45, 'Can add 饲喂标准', 12, 'add_feedingstandard');
INSERT INTO `auth_permission` VALUES (46, 'Can change 饲喂标准', 12, 'change_feedingstandard');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 饲喂标准', 12, 'delete_feedingstandard');
INSERT INTO `auth_permission` VALUES (48, 'Can view 饲喂标准', 12, 'view_feedingstandard');
INSERT INTO `auth_permission` VALUES (49, 'Can add 犊牛 & 犊牛笼', 13, 'add_calfcage');
INSERT INTO `auth_permission` VALUES (50, 'Can change 犊牛 & 犊牛笼', 13, 'change_calfcage');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 犊牛 & 犊牛笼', 13, 'delete_calfcage');
INSERT INTO `auth_permission` VALUES (52, 'Can view 犊牛 & 犊牛笼', 13, 'view_calfcage');
INSERT INTO `auth_permission` VALUES (53, 'Can add 用户', 14, 'add_user');
INSERT INTO `auth_permission` VALUES (54, 'Can change 用户', 14, 'change_user');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 用户', 14, 'delete_user');
INSERT INTO `auth_permission` VALUES (56, 'Can view 用户', 14, 'view_user');
INSERT INTO `auth_permission` VALUES (57, 'Can add 犊牛剩余奶量', 15, 'add_remainingmilk');
INSERT INTO `auth_permission` VALUES (58, 'Can change 犊牛剩余奶量', 15, 'change_remainingmilk');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 犊牛剩余奶量', 15, 'delete_remainingmilk');
INSERT INTO `auth_permission` VALUES (60, 'Can view 犊牛剩余奶量', 15, 'view_remainingmilk');
INSERT INTO `auth_permission` VALUES (61, 'Can add 数据更新状态', 16, 'add_dataupdatestatus');
INSERT INTO `auth_permission` VALUES (62, 'Can change 数据更新状态', 16, 'change_dataupdatestatus');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 数据更新状态', 16, 'delete_dataupdatestatus');
INSERT INTO `auth_permission` VALUES (64, 'Can view 数据更新状态', 16, 'view_dataupdatestatus');
INSERT INTO `auth_permission` VALUES (65, 'Can add 设备日志', 17, 'add_devicelog');
INSERT INTO `auth_permission` VALUES (66, 'Can change 设备日志', 17, 'change_devicelog');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 设备日志', 17, 'delete_devicelog');
INSERT INTO `auth_permission` VALUES (68, 'Can view 设备日志', 17, 'view_devicelog');
INSERT INTO `auth_permission` VALUES (69, 'Can add 出笼犊牛', 18, 'add_unlinkcalf');
INSERT INTO `auth_permission` VALUES (70, 'Can change 出笼犊牛', 18, 'change_unlinkcalf');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 出笼犊牛', 18, 'delete_unlinkcalf');
INSERT INTO `auth_permission` VALUES (72, 'Can view 出笼犊牛', 18, 'view_unlinkcalf');
INSERT INTO `auth_permission` VALUES (73, 'Can add Auto历史加奶数据', 19, 'add_autohistorydata');
INSERT INTO `auth_permission` VALUES (74, 'Can change Auto历史加奶数据', 19, 'change_autohistorydata');
INSERT INTO `auth_permission` VALUES (75, 'Can delete Auto历史加奶数据', 19, 'delete_autohistorydata');
INSERT INTO `auth_permission` VALUES (76, 'Can view Auto历史加奶数据', 19, 'view_autohistorydata');
INSERT INTO `auth_permission` VALUES (77, 'Can add Ration历史加奶数据', 20, 'add_rationhistorydata');
INSERT INTO `auth_permission` VALUES (78, 'Can change Ration历史加奶数据', 20, 'change_rationhistorydata');
INSERT INTO `auth_permission` VALUES (79, 'Can delete Ration历史加奶数据', 20, 'delete_rationhistorydata');
INSERT INTO `auth_permission` VALUES (80, 'Can view Ration历史加奶数据', 20, 'view_rationhistorydata');

-- ----------------------------
-- Table structure for auto_historydata
-- ----------------------------
DROP TABLE IF EXISTS `auto_historydata`;
CREATE TABLE `auto_historydata`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `rfid_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cage_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calf_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `day_of_birth` smallint NOT NULL,
  `area` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `area_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adjusted_feeding` smallint NOT NULL,
  `feeding_total_feeding` smallint NOT NULL,
  `temp` double NULL DEFAULT NULL,
  `mae` smallint NOT NULL,
  `pasture_id` bigint NULL DEFAULT NULL,
  `data_time_auto` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_historydata_pasture_id_2e758508_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `auto_historydata_c_time_52ec4394`(`c_time` ASC) USING BTREE,
  INDEX `auto_historydata_u_time_ce935538`(`u_time` ASC) USING BTREE,
  INDEX `auto_historydata_is_delete_fc1f7e9b`(`is_delete` ASC) USING BTREE,
  CONSTRAINT `auto_historydata_pasture_id_2e758508_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auto_historydata
-- ----------------------------

-- ----------------------------
-- Table structure for cage
-- ----------------------------
DROP TABLE IF EXISTS `cage`;
CREATE TABLE `cage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cage_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `area_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pasture_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cage_id`(`cage_id` ASC) USING BTREE,
  INDEX `cage_pasture_id_633e01bc_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `cage_area_ced12b3a`(`area` ASC) USING BTREE,
  INDEX `cage_area_id_0dacb903`(`area_id` ASC) USING BTREE,
  CONSTRAINT `cage_pasture_id_633e01bc_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 455 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cage
-- ----------------------------
INSERT INTO `cage` VALUES (11, '500', '54', '54', '45', 1);
INSERT INTO `cage` VALUES (12, '499', '54', '54', '13', 1);
INSERT INTO `cage` VALUES (13, '498', '563', '35563', '653563', 1);
INSERT INTO `cage` VALUES (14, '497', '453453', '453453', '45353', 1);
INSERT INTO `cage` VALUES (15, '496', '453', '453', '453', 1);
INSERT INTO `cage` VALUES (16, '495', '5435', '453', '453', 1);
INSERT INTO `cage` VALUES (17, '494', '45222', '453', '444', 1);
INSERT INTO `cage` VALUES (18, '493', '543453', '543453', '45343', 1);
INSERT INTO `cage` VALUES (19, '492', '546456', '45645', '45645', 1);
INSERT INTO `cage` VALUES (20, '491', '4556', '456456', '54645', 1);
INSERT INTO `cage` VALUES (21, '490', '东区', '45645', '5464', 1);
INSERT INTO `cage` VALUES (23, '0001', '', '', '', 1);
INSERT INTO `cage` VALUES (24, '0002', '', '', '', 1);
INSERT INTO `cage` VALUES (25, '0003', '', '', '', 1);
INSERT INTO `cage` VALUES (26, '0004', '', '', '', 1);
INSERT INTO `cage` VALUES (27, '0005', '', '', '', 1);
INSERT INTO `cage` VALUES (28, '0006', '', '', '', 1);
INSERT INTO `cage` VALUES (29, '0007', '', '', '', 1);
INSERT INTO `cage` VALUES (30, '0008', '', '', '', 1);
INSERT INTO `cage` VALUES (31, '0009', '', '', '', 1);
INSERT INTO `cage` VALUES (32, '0010', '', '', '', 1);
INSERT INTO `cage` VALUES (33, '0011', '', '', '', 1);
INSERT INTO `cage` VALUES (34, '0012', '', '', '', 1);
INSERT INTO `cage` VALUES (35, '0013', '', '', '', 1);
INSERT INTO `cage` VALUES (36, '0014', '', '', '', 1);
INSERT INTO `cage` VALUES (37, '0015', '', '', '', 1);
INSERT INTO `cage` VALUES (38, '0016', '', '', '', 1);
INSERT INTO `cage` VALUES (39, '0017', '', '', '', 1);
INSERT INTO `cage` VALUES (40, '0018', '', '', '', 1);
INSERT INTO `cage` VALUES (41, '0019', '', '', '', 1);
INSERT INTO `cage` VALUES (42, '0020', '', '', '', 1);
INSERT INTO `cage` VALUES (43, '0021', '', '', '', 1);
INSERT INTO `cage` VALUES (44, '0022', '', '', '', 1);
INSERT INTO `cage` VALUES (45, '0023', '', '', '', 1);
INSERT INTO `cage` VALUES (46, '0024', '', '', '', 1);
INSERT INTO `cage` VALUES (47, '0025', '', '', '', 1);
INSERT INTO `cage` VALUES (48, '0026', '', '', '', 1);
INSERT INTO `cage` VALUES (49, '0027', '', '', '', 1);
INSERT INTO `cage` VALUES (50, '0028', '', '', '', 1);
INSERT INTO `cage` VALUES (51, '0029', '', '', '', 1);
INSERT INTO `cage` VALUES (52, '0030', '', '', '', 1);
INSERT INTO `cage` VALUES (53, '0031', '', '', '', 1);
INSERT INTO `cage` VALUES (54, '0032', '', '', '', 1);
INSERT INTO `cage` VALUES (55, '0033', '', '', '', 1);
INSERT INTO `cage` VALUES (56, '0034', '', '', '', 1);
INSERT INTO `cage` VALUES (57, '0035', '', '', '', 1);
INSERT INTO `cage` VALUES (58, '0036', '', '', '', 1);
INSERT INTO `cage` VALUES (59, '0037', '', '', '', 1);
INSERT INTO `cage` VALUES (60, '0038', '', '', '', 1);
INSERT INTO `cage` VALUES (61, '0039', '', '', '', 1);
INSERT INTO `cage` VALUES (62, '0040', '', '', '', 1);
INSERT INTO `cage` VALUES (63, '0041', '', '', '', 1);
INSERT INTO `cage` VALUES (64, '0042', '', '', '', 1);
INSERT INTO `cage` VALUES (65, '0043', '', '', '', 1);
INSERT INTO `cage` VALUES (66, '0044', '', '', '', 1);
INSERT INTO `cage` VALUES (67, '0045', '', '', '', 1);
INSERT INTO `cage` VALUES (68, '0046', '', '', '', 1);
INSERT INTO `cage` VALUES (69, '0047', '', '', '', 1);
INSERT INTO `cage` VALUES (70, '0048', '', '', '', 1);
INSERT INTO `cage` VALUES (71, '0049', '', '', '', 1);
INSERT INTO `cage` VALUES (72, '0050', '', '', '', 1);
INSERT INTO `cage` VALUES (73, '0051', '', '', '', 1);
INSERT INTO `cage` VALUES (74, '0052', '', '', '', 1);
INSERT INTO `cage` VALUES (75, '0053', '', '', '', 1);
INSERT INTO `cage` VALUES (76, '0054', '', '', '', 1);
INSERT INTO `cage` VALUES (77, '0055', '', '', '', 1);
INSERT INTO `cage` VALUES (78, '0056', '', '', '', 1);
INSERT INTO `cage` VALUES (79, '0057', '', '', '', 1);
INSERT INTO `cage` VALUES (80, '0058', '', '', '', 1);
INSERT INTO `cage` VALUES (81, '0059', '', '', '', 1);
INSERT INTO `cage` VALUES (82, '0060', '', '', '', 1);
INSERT INTO `cage` VALUES (83, '0061', '', '', '', 1);
INSERT INTO `cage` VALUES (84, '0062', '', '', '', 1);
INSERT INTO `cage` VALUES (85, '0063', '', '', '', 1);
INSERT INTO `cage` VALUES (86, '0064', '', '', '', 1);
INSERT INTO `cage` VALUES (87, '0065', '', '', '', 1);
INSERT INTO `cage` VALUES (88, '0066', '', '', '', 1);
INSERT INTO `cage` VALUES (89, '0067', '', '', '', 1);
INSERT INTO `cage` VALUES (90, '0068', '', '', '', 1);
INSERT INTO `cage` VALUES (91, '0069', '', '', '', 1);
INSERT INTO `cage` VALUES (92, '0070', '', '', '', 1);
INSERT INTO `cage` VALUES (93, '0071', '', '', '', 1);
INSERT INTO `cage` VALUES (94, '0072', '', '', '', 1);
INSERT INTO `cage` VALUES (95, '0073', '', '', '', 1);
INSERT INTO `cage` VALUES (96, '0074', '', '', '', 1);
INSERT INTO `cage` VALUES (97, '0075', '', '', '', 1);
INSERT INTO `cage` VALUES (98, '0076', '', '', '', 1);
INSERT INTO `cage` VALUES (99, '0077', '', '', '', 1);
INSERT INTO `cage` VALUES (100, '0078', '', '', '', 1);
INSERT INTO `cage` VALUES (101, '0079', '', '', '', 1);
INSERT INTO `cage` VALUES (102, '0080', '', '', '', 1);
INSERT INTO `cage` VALUES (103, '0081', '', '', '', 1);
INSERT INTO `cage` VALUES (104, '0082', '', '', '', 1);
INSERT INTO `cage` VALUES (105, '0083', '', '', '', 1);
INSERT INTO `cage` VALUES (106, '0084', '', '', '', 1);
INSERT INTO `cage` VALUES (107, '0085', '', '', '', 1);
INSERT INTO `cage` VALUES (108, '0086', '', '', '', 1);
INSERT INTO `cage` VALUES (109, '0087', '', '', '', 1);
INSERT INTO `cage` VALUES (110, '0088', '', '', '', 1);
INSERT INTO `cage` VALUES (111, '0089', '', '', '', 1);
INSERT INTO `cage` VALUES (112, '0090', '', '', '', 1);
INSERT INTO `cage` VALUES (113, '0091', '', '', '', 1);
INSERT INTO `cage` VALUES (114, '0092', '', '', '', 1);
INSERT INTO `cage` VALUES (115, '0093', '', '', '', 1);
INSERT INTO `cage` VALUES (116, '0094', '', '', '', 1);
INSERT INTO `cage` VALUES (117, '0095', '', '', '', 1);
INSERT INTO `cage` VALUES (118, '0096', '', '', '', 1);
INSERT INTO `cage` VALUES (119, '0097', '', '', '', 1);
INSERT INTO `cage` VALUES (120, '0098', '', '', '', 1);
INSERT INTO `cage` VALUES (121, '0099', '', '', '', 1);
INSERT INTO `cage` VALUES (122, '0100', '', '', '', 1);
INSERT INTO `cage` VALUES (123, '0101', '', '', '', 1);
INSERT INTO `cage` VALUES (124, '0102', '', '', '', 1);
INSERT INTO `cage` VALUES (125, '0103', '', '', '', 1);
INSERT INTO `cage` VALUES (126, '0104', '', '', '', 1);
INSERT INTO `cage` VALUES (127, '0105', '', '', '', 1);
INSERT INTO `cage` VALUES (128, '0106', '', '', '', 1);
INSERT INTO `cage` VALUES (129, '0107', '', '', '', 1);
INSERT INTO `cage` VALUES (130, '0108', '', '', '', 1);
INSERT INTO `cage` VALUES (131, '0109', '', '', '', 1);
INSERT INTO `cage` VALUES (132, '0110', '', '', '', 1);
INSERT INTO `cage` VALUES (133, '0111', '', '', '', 1);
INSERT INTO `cage` VALUES (134, '0112', '', '', '', 1);
INSERT INTO `cage` VALUES (135, '0113', '', '', '', 1);
INSERT INTO `cage` VALUES (136, '0114', '', '', '', 1);
INSERT INTO `cage` VALUES (137, '0115', '', '', '', 1);
INSERT INTO `cage` VALUES (138, '0116', '', '', '', 1);
INSERT INTO `cage` VALUES (139, '0117', '', '', '', 1);
INSERT INTO `cage` VALUES (140, '0118', '', '', '', 1);
INSERT INTO `cage` VALUES (141, '0119', '', '', '', 1);
INSERT INTO `cage` VALUES (142, '0120', '', '', '', 1);
INSERT INTO `cage` VALUES (143, '0121', '', '', '', 1);
INSERT INTO `cage` VALUES (144, '0122', '', '', '', 1);
INSERT INTO `cage` VALUES (145, '0123', '', '', '', 1);
INSERT INTO `cage` VALUES (146, '0124', '', '', '', 1);
INSERT INTO `cage` VALUES (147, '0125', '', '', '', 1);
INSERT INTO `cage` VALUES (148, '0126', '', '', '', 1);
INSERT INTO `cage` VALUES (149, '0127', '', '', '', 1);
INSERT INTO `cage` VALUES (150, '0128', '', '', '', 1);
INSERT INTO `cage` VALUES (151, '0129', '', '', '', 1);
INSERT INTO `cage` VALUES (152, '0130', '', '', '', 1);
INSERT INTO `cage` VALUES (153, '0131', '', '', '', 1);
INSERT INTO `cage` VALUES (154, '0132', '', '', '', 1);
INSERT INTO `cage` VALUES (155, '0133', '', '', '', 1);
INSERT INTO `cage` VALUES (156, '0134', '', '', '', 1);
INSERT INTO `cage` VALUES (157, '0135', '', '', '', 1);
INSERT INTO `cage` VALUES (158, '0136', '', '', '', 1);
INSERT INTO `cage` VALUES (159, '0137', '', '', '', 1);
INSERT INTO `cage` VALUES (160, '0138', '', '', '', 1);
INSERT INTO `cage` VALUES (161, '0139', '', '', '', 1);
INSERT INTO `cage` VALUES (162, '0140', '', '', '', 1);
INSERT INTO `cage` VALUES (163, '0141', '', '', '', 1);
INSERT INTO `cage` VALUES (164, '0142', '', '', '', 1);
INSERT INTO `cage` VALUES (165, '0143', '', '', '', 1);
INSERT INTO `cage` VALUES (166, '0144', '', '', '', 1);
INSERT INTO `cage` VALUES (167, '0145', '', '', '', 1);
INSERT INTO `cage` VALUES (168, '0146', '', '', '', 1);
INSERT INTO `cage` VALUES (169, '0147', '', '', '', 1);
INSERT INTO `cage` VALUES (170, '0148', '', '', '', 1);
INSERT INTO `cage` VALUES (171, '0149', '', '', '', 1);
INSERT INTO `cage` VALUES (172, '0150', '', '', '', 1);
INSERT INTO `cage` VALUES (173, '0151', '', '', '', 1);
INSERT INTO `cage` VALUES (174, '0152', '', '', '', 1);
INSERT INTO `cage` VALUES (175, '0153', '', '', '', 1);
INSERT INTO `cage` VALUES (176, '0154', '', '', '', 1);
INSERT INTO `cage` VALUES (177, '0155', '', '', '', 1);
INSERT INTO `cage` VALUES (178, '0156', '', '', '', 1);
INSERT INTO `cage` VALUES (179, '0157', '', '', '', 1);
INSERT INTO `cage` VALUES (180, '0158', '', '', '', 1);
INSERT INTO `cage` VALUES (181, '0159', '', '', '', 1);
INSERT INTO `cage` VALUES (182, '0160', '', '', '', 1);
INSERT INTO `cage` VALUES (183, '0161', '', '', '', 1);
INSERT INTO `cage` VALUES (184, '0162', '', '', '', 1);
INSERT INTO `cage` VALUES (185, '0163', '', '', '', 1);
INSERT INTO `cage` VALUES (186, '0164', '', '', '', 1);
INSERT INTO `cage` VALUES (187, '0165', '', '', '', 1);
INSERT INTO `cage` VALUES (188, '0166', '', '', '', 1);
INSERT INTO `cage` VALUES (189, '0167', '', '', '', 1);
INSERT INTO `cage` VALUES (190, '0168', '', '', '', 1);
INSERT INTO `cage` VALUES (191, '0169', '', '', '', 1);
INSERT INTO `cage` VALUES (192, '0170', '', '', '', 1);
INSERT INTO `cage` VALUES (193, '0171', '', '', '', 1);
INSERT INTO `cage` VALUES (194, '0172', '', '', '', 1);
INSERT INTO `cage` VALUES (195, '0173', '', '', '', 1);
INSERT INTO `cage` VALUES (196, '0174', '', '', '', 1);
INSERT INTO `cage` VALUES (197, '0175', '', '', '', 1);
INSERT INTO `cage` VALUES (198, '0176', '', '', '', 1);
INSERT INTO `cage` VALUES (199, '0177', '', '', '', 1);
INSERT INTO `cage` VALUES (200, '0178', '', '', '', 1);
INSERT INTO `cage` VALUES (201, '0179', '', '', '', 1);
INSERT INTO `cage` VALUES (202, '0180', '', '', '', 1);
INSERT INTO `cage` VALUES (203, '0181', '', '', '', 1);
INSERT INTO `cage` VALUES (204, '0182', '', '', '', 1);
INSERT INTO `cage` VALUES (205, '0183', '', '', '', 1);
INSERT INTO `cage` VALUES (206, '0184', '', '', '', 1);
INSERT INTO `cage` VALUES (207, '0185', '', '', '', 1);
INSERT INTO `cage` VALUES (208, '0186', '', '', '', 1);
INSERT INTO `cage` VALUES (209, '0187', '', '', '', 1);
INSERT INTO `cage` VALUES (210, '0188', '', '', '', 1);
INSERT INTO `cage` VALUES (211, '0189', '', '', '', 1);
INSERT INTO `cage` VALUES (212, '0190', '', '', '', 1);
INSERT INTO `cage` VALUES (213, '0191', '', '', '', 1);
INSERT INTO `cage` VALUES (214, '0192', '', '', '', 1);
INSERT INTO `cage` VALUES (215, '0193', '', '', '', 1);
INSERT INTO `cage` VALUES (216, '0194', '', '', '', 1);
INSERT INTO `cage` VALUES (217, '0195', '', '', '', 1);
INSERT INTO `cage` VALUES (218, '0196', '', '', '', 1);
INSERT INTO `cage` VALUES (219, '0197', '', '', '', 1);
INSERT INTO `cage` VALUES (220, '0198', '', '', '', 1);
INSERT INTO `cage` VALUES (221, '0199', '', '', '', 1);
INSERT INTO `cage` VALUES (222, '0200', '', '', '', 1);
INSERT INTO `cage` VALUES (223, '0201', '', '', '', 1);
INSERT INTO `cage` VALUES (224, '0202', '', '', '', 1);
INSERT INTO `cage` VALUES (225, '0203', '', '', '', 1);
INSERT INTO `cage` VALUES (226, '0204', '', '', '', 1);
INSERT INTO `cage` VALUES (227, '0205', '', '', '', 1);
INSERT INTO `cage` VALUES (228, '0206', '', '', '', 1);
INSERT INTO `cage` VALUES (229, '0207', '', '', '', 1);
INSERT INTO `cage` VALUES (230, '0208', '', '', '', 1);
INSERT INTO `cage` VALUES (231, '0209', '', '', '', 1);
INSERT INTO `cage` VALUES (232, '0210', '', '', '', 1);
INSERT INTO `cage` VALUES (233, '0211', '', '', '', 1);
INSERT INTO `cage` VALUES (234, '0212', '', '', '', 1);
INSERT INTO `cage` VALUES (235, '0213', '', '', '', 1);
INSERT INTO `cage` VALUES (236, '0214', '', '', '', 1);
INSERT INTO `cage` VALUES (237, '0215', '', '', '', 1);
INSERT INTO `cage` VALUES (238, '0216', '', '', '', 1);
INSERT INTO `cage` VALUES (239, '0217', '', '', '', 1);
INSERT INTO `cage` VALUES (240, '0218', '', '', '', 1);
INSERT INTO `cage` VALUES (241, '0219', '', '', '', 1);
INSERT INTO `cage` VALUES (242, '0220', '', '', '', 1);
INSERT INTO `cage` VALUES (243, '0221', '', '', '', 1);
INSERT INTO `cage` VALUES (244, '0222', '', '', '', 1);
INSERT INTO `cage` VALUES (245, '0223', '', '', '', 1);
INSERT INTO `cage` VALUES (246, '0224', '', '', '', 1);
INSERT INTO `cage` VALUES (247, '0225', '', '', '', 1);
INSERT INTO `cage` VALUES (248, '0226', '', '', '', 1);
INSERT INTO `cage` VALUES (249, '0227', '', '', '', 1);
INSERT INTO `cage` VALUES (250, '0228', '', '', '', 1);
INSERT INTO `cage` VALUES (251, '0229', '', '', '', 1);
INSERT INTO `cage` VALUES (252, '0230', '', '', '', 1);
INSERT INTO `cage` VALUES (253, '0231', '', '', '', 1);
INSERT INTO `cage` VALUES (254, '0232', '', '', '', 1);
INSERT INTO `cage` VALUES (255, '0233', '', '', '', 1);
INSERT INTO `cage` VALUES (256, '0234', '', '', '', 1);
INSERT INTO `cage` VALUES (257, '0235', '', '', '', 1);
INSERT INTO `cage` VALUES (258, '0236', '', '', '', 1);
INSERT INTO `cage` VALUES (259, '0237', '', '', '', 1);
INSERT INTO `cage` VALUES (260, '0238', '', '', '', 1);
INSERT INTO `cage` VALUES (261, '0239', '', '', '', 1);
INSERT INTO `cage` VALUES (262, '0240', '', '', '', 1);
INSERT INTO `cage` VALUES (263, '0241', '', '', '', 1);
INSERT INTO `cage` VALUES (264, '0242', '', '', '', 1);
INSERT INTO `cage` VALUES (265, '0243', '', '', '', 1);
INSERT INTO `cage` VALUES (266, '0244', '', '', '', 1);
INSERT INTO `cage` VALUES (267, '0245', '', '', '', 1);
INSERT INTO `cage` VALUES (268, '0246', '', '', '', 1);
INSERT INTO `cage` VALUES (269, '0247', '', '', '', 1);
INSERT INTO `cage` VALUES (270, '0248', '', '', '', 1);
INSERT INTO `cage` VALUES (271, '0249', '', '', '', 1);
INSERT INTO `cage` VALUES (272, '0250', '', '', '', 1);
INSERT INTO `cage` VALUES (273, '0251', '', '', '', 1);
INSERT INTO `cage` VALUES (274, '0252', '', '', '', 1);
INSERT INTO `cage` VALUES (275, '0253', '', '', '', 1);
INSERT INTO `cage` VALUES (276, '0254', '', '', '', 1);
INSERT INTO `cage` VALUES (277, '0255', '', '', '', 1);
INSERT INTO `cage` VALUES (278, '0256', '', '', '', 1);
INSERT INTO `cage` VALUES (279, '0257', '', '', '', 1);
INSERT INTO `cage` VALUES (280, '0258', '', '', '', 1);
INSERT INTO `cage` VALUES (281, '0259', '', '', '', 1);
INSERT INTO `cage` VALUES (282, '0260', '', '', '', 1);
INSERT INTO `cage` VALUES (283, '0261', '', '', '', 1);
INSERT INTO `cage` VALUES (284, '0262', '', '', '', 1);
INSERT INTO `cage` VALUES (285, '0263', '', '', '', 1);
INSERT INTO `cage` VALUES (286, '0264', '', '', '', 1);
INSERT INTO `cage` VALUES (287, '0265', '', '', '', 1);
INSERT INTO `cage` VALUES (288, '0266', '', '', '', 1);
INSERT INTO `cage` VALUES (289, '0267', '', '', '', 1);
INSERT INTO `cage` VALUES (290, '0268', '', '', '', 1);
INSERT INTO `cage` VALUES (291, '0269', '', '', '', 1);
INSERT INTO `cage` VALUES (292, '0270', '', '', '', 1);
INSERT INTO `cage` VALUES (293, '0271', '', '', '', 1);
INSERT INTO `cage` VALUES (294, '0272', '', '', '', 1);
INSERT INTO `cage` VALUES (295, '0273', '', '', '', 1);
INSERT INTO `cage` VALUES (296, '0274', '', '', '', 1);
INSERT INTO `cage` VALUES (297, '0275', '', '', '', 1);
INSERT INTO `cage` VALUES (298, '0276', '', '', '', 1);
INSERT INTO `cage` VALUES (299, '0277', '', '', '', 1);
INSERT INTO `cage` VALUES (300, '0278', '', '', '', 1);
INSERT INTO `cage` VALUES (301, '0279', '', '', '', 1);
INSERT INTO `cage` VALUES (302, '0280', '', '', '', 1);
INSERT INTO `cage` VALUES (303, '0281', '', '', '', 1);
INSERT INTO `cage` VALUES (304, '0282', '', '', '', 1);
INSERT INTO `cage` VALUES (305, '0283', '', '', '', 1);
INSERT INTO `cage` VALUES (306, '0284', '', '', '', 1);
INSERT INTO `cage` VALUES (307, '0285', '', '', '', 1);
INSERT INTO `cage` VALUES (308, '0286', '', '', '', 1);
INSERT INTO `cage` VALUES (309, '0287', '', '', '', 1);
INSERT INTO `cage` VALUES (310, '0288', '', '', '', 1);
INSERT INTO `cage` VALUES (311, '0289', '', '', '', 1);
INSERT INTO `cage` VALUES (312, '0290', '', '', '', 1);
INSERT INTO `cage` VALUES (313, '0291', '', '', '', 1);
INSERT INTO `cage` VALUES (314, '0292', '', '', '', 1);
INSERT INTO `cage` VALUES (315, '0293', '', '', '', 1);
INSERT INTO `cage` VALUES (316, '0294', '', '', '', 1);
INSERT INTO `cage` VALUES (317, '0295', '', '', '', 1);
INSERT INTO `cage` VALUES (318, '0296', '', '', '', 1);
INSERT INTO `cage` VALUES (319, '0297', '', '', '', 1);
INSERT INTO `cage` VALUES (320, '0298', '', '', '', 1);
INSERT INTO `cage` VALUES (321, '0299', '', '', '', 1);
INSERT INTO `cage` VALUES (322, '0300', '', '', '', 1);
INSERT INTO `cage` VALUES (323, '0301', '', '', '', 1);
INSERT INTO `cage` VALUES (324, '0302', '', '', '', 1);
INSERT INTO `cage` VALUES (325, '0303', '', '', '', 1);
INSERT INTO `cage` VALUES (326, '0304', '', '', '', 1);
INSERT INTO `cage` VALUES (327, '0305', '', '', '', 1);
INSERT INTO `cage` VALUES (328, '0306', '', '', '', 1);
INSERT INTO `cage` VALUES (329, '0307', '', '', '', 1);
INSERT INTO `cage` VALUES (330, '0308', '', '', '', 1);
INSERT INTO `cage` VALUES (331, '0309', '', '', '', 1);
INSERT INTO `cage` VALUES (332, '0310', '', '', '', 1);
INSERT INTO `cage` VALUES (333, '0311', '', '', '', 1);
INSERT INTO `cage` VALUES (334, '0312', '', '', '', 1);
INSERT INTO `cage` VALUES (335, '0313', '', '', '', 1);
INSERT INTO `cage` VALUES (336, '0314', '', '', '', 1);
INSERT INTO `cage` VALUES (337, '0315', '', '', '', 1);
INSERT INTO `cage` VALUES (338, '0316', '', '', '', 1);
INSERT INTO `cage` VALUES (339, '0317', '', '', '', 1);
INSERT INTO `cage` VALUES (340, '0318', '', '', '', 1);
INSERT INTO `cage` VALUES (341, '0319', '', '', '', 1);
INSERT INTO `cage` VALUES (342, '0320', '', '', '', 1);
INSERT INTO `cage` VALUES (343, '0321', '', '', '', 1);
INSERT INTO `cage` VALUES (344, '0322', '', '', '', 1);
INSERT INTO `cage` VALUES (345, '0323', '', '', '', 1);
INSERT INTO `cage` VALUES (346, '0324', '', '', '', 1);
INSERT INTO `cage` VALUES (347, '0325', '', '', '', 1);
INSERT INTO `cage` VALUES (348, '0326', '', '', '', 1);
INSERT INTO `cage` VALUES (349, '0327', '', '', '', 1);
INSERT INTO `cage` VALUES (350, '0328', '', '', '', 1);
INSERT INTO `cage` VALUES (351, '0329', '', '', '', 1);
INSERT INTO `cage` VALUES (352, '0330', '', '', '', 1);
INSERT INTO `cage` VALUES (353, '0331', '', '', '', 1);
INSERT INTO `cage` VALUES (354, '0332', '', '', '', 1);
INSERT INTO `cage` VALUES (355, '0333', '', '', '', 1);
INSERT INTO `cage` VALUES (356, '0334', '', '', '', 1);
INSERT INTO `cage` VALUES (357, '0335', '', '', '', 1);
INSERT INTO `cage` VALUES (358, '0336', '', '', '', 1);
INSERT INTO `cage` VALUES (359, '0337', '', '', '', 1);
INSERT INTO `cage` VALUES (360, '0338', '', '', '', 1);
INSERT INTO `cage` VALUES (361, '0339', '', '', '', 1);
INSERT INTO `cage` VALUES (362, '0340', '', '', '', 1);
INSERT INTO `cage` VALUES (363, '0341', '', '', '', 1);
INSERT INTO `cage` VALUES (364, '0342', '', '', '', 1);
INSERT INTO `cage` VALUES (365, '0343', '', '', '', 1);
INSERT INTO `cage` VALUES (366, '0344', '', '', '', 1);
INSERT INTO `cage` VALUES (367, '0345', '', '', '', 1);
INSERT INTO `cage` VALUES (368, '0346', '', '', '', 1);
INSERT INTO `cage` VALUES (369, '0347', '', '', '', 1);
INSERT INTO `cage` VALUES (370, '0348', '', '', '', 1);
INSERT INTO `cage` VALUES (371, '0349', '', '', '', 1);
INSERT INTO `cage` VALUES (372, '0350', '', '', '', 1);
INSERT INTO `cage` VALUES (373, '0351', '', '', '', 1);
INSERT INTO `cage` VALUES (374, '0352', '', '', '', 1);
INSERT INTO `cage` VALUES (375, '0353', '', '', '', 1);
INSERT INTO `cage` VALUES (376, '0354', '', '', '', 1);
INSERT INTO `cage` VALUES (377, '0355', '', '', '', 1);
INSERT INTO `cage` VALUES (378, '0356', '', '', '', 1);
INSERT INTO `cage` VALUES (379, '0357', '', '', '', 1);
INSERT INTO `cage` VALUES (380, '0358', '', '', '', 1);
INSERT INTO `cage` VALUES (381, '0359', '', '', '', 1);
INSERT INTO `cage` VALUES (382, '0360', '', '', '', 1);
INSERT INTO `cage` VALUES (383, '0361', '', '', '', 1);
INSERT INTO `cage` VALUES (384, '0362', '', '', '', 1);
INSERT INTO `cage` VALUES (385, '0363', '', '', '', 1);
INSERT INTO `cage` VALUES (386, '0364', '', '', '', 1);
INSERT INTO `cage` VALUES (387, '0365', '', '', '', 1);
INSERT INTO `cage` VALUES (388, '0366', '', '', '', 1);
INSERT INTO `cage` VALUES (389, '0367', '', '', '', 1);
INSERT INTO `cage` VALUES (390, '0368', '', '', '', 1);
INSERT INTO `cage` VALUES (391, '0369', '', '', '', 1);
INSERT INTO `cage` VALUES (392, '0370', '', '', '', 1);
INSERT INTO `cage` VALUES (393, '0371', '', '', '', 1);
INSERT INTO `cage` VALUES (394, '0372', '', '', '', 1);
INSERT INTO `cage` VALUES (395, '0373', '', '', '', 1);
INSERT INTO `cage` VALUES (396, '0374', '', '', '', 1);
INSERT INTO `cage` VALUES (397, '0375', '', '', '', 1);
INSERT INTO `cage` VALUES (398, '0376', '', '', '', 1);
INSERT INTO `cage` VALUES (399, '0377', '', '', '', 1);
INSERT INTO `cage` VALUES (400, '0378', '', '', '', 1);
INSERT INTO `cage` VALUES (401, '0379', '', '', '', 1);
INSERT INTO `cage` VALUES (402, '0380', '', '', '', 1);
INSERT INTO `cage` VALUES (403, '0381', '', '', '', 1);
INSERT INTO `cage` VALUES (404, '0382', '', '', '', 1);
INSERT INTO `cage` VALUES (405, '0383', '', '', '', 1);
INSERT INTO `cage` VALUES (406, '0384', '', '', '', 1);
INSERT INTO `cage` VALUES (407, '0385', '', '', '', 1);
INSERT INTO `cage` VALUES (408, '0386', '', '', '', 1);
INSERT INTO `cage` VALUES (409, '0387', '', '', '', 1);
INSERT INTO `cage` VALUES (410, '0388', '', '', '', 1);
INSERT INTO `cage` VALUES (411, '0389', '', '', '', 1);
INSERT INTO `cage` VALUES (412, '0390', '', '', '', 1);
INSERT INTO `cage` VALUES (413, '0391', '', '', '', 1);
INSERT INTO `cage` VALUES (414, '0392', '', '', '', 1);
INSERT INTO `cage` VALUES (415, '0393', '', '', '', 1);
INSERT INTO `cage` VALUES (416, '0394', '', '', '', 1);
INSERT INTO `cage` VALUES (417, '0395', '', '', '', 1);
INSERT INTO `cage` VALUES (418, '0396', '', '', '', 1);
INSERT INTO `cage` VALUES (419, '0397', '', '', '', 1);
INSERT INTO `cage` VALUES (420, '0398', '', '', '', 1);
INSERT INTO `cage` VALUES (421, '0399', '', '', '', 1);
INSERT INTO `cage` VALUES (422, '0400', '', '', '', 1);
INSERT INTO `cage` VALUES (423, '0474', '', '', '', 1);
INSERT INTO `cage` VALUES (424, '0475', '', '', '', 1);
INSERT INTO `cage` VALUES (425, '0476', '', '', '', 1);
INSERT INTO `cage` VALUES (426, '0477', '', '', '', 1);
INSERT INTO `cage` VALUES (427, '0478', '', '', '', 1);
INSERT INTO `cage` VALUES (428, '0479', '', '', '', 1);
INSERT INTO `cage` VALUES (429, '0480', '', '', '', 1);
INSERT INTO `cage` VALUES (430, '0481', '', '', '', 1);
INSERT INTO `cage` VALUES (431, '0482', '', '', '', 1);
INSERT INTO `cage` VALUES (432, '0483', '', '', '', 1);
INSERT INTO `cage` VALUES (433, '0484', '', '', '', 1);
INSERT INTO `cage` VALUES (434, '0485', '', '', '', 1);
INSERT INTO `cage` VALUES (435, '0486', '', '', '', 1);
INSERT INTO `cage` VALUES (436, '0487', '', '', '', 1);
INSERT INTO `cage` VALUES (437, '0488', '', '', '', 1);
INSERT INTO `cage` VALUES (438, '0489', '', '', '', 1);
INSERT INTO `cage` VALUES (439, '0490', '', '', '', 1);
INSERT INTO `cage` VALUES (440, '0491', '', '', '', 1);
INSERT INTO `cage` VALUES (441, '0492', '', '', '', 1);
INSERT INTO `cage` VALUES (442, '0493', '', '', '', 1);
INSERT INTO `cage` VALUES (443, '0494', '', '', '', 1);
INSERT INTO `cage` VALUES (444, '0495', '', '', '', 1);
INSERT INTO `cage` VALUES (445, '0496', '', '', '', 1);
INSERT INTO `cage` VALUES (446, '0497', '', '', '', 1);
INSERT INTO `cage` VALUES (447, '0498', '', '', '', 1);
INSERT INTO `cage` VALUES (448, '0499', '', '', '', 1);
INSERT INTO `cage` VALUES (449, '0500', '', '', '', 1);
INSERT INTO `cage` VALUES (450, 'HBTEST1', 'A区', '0001', NULL, 2);
INSERT INTO `cage` VALUES (451, 'HBTEST2', 'A区', '0002', NULL, 2);
INSERT INTO `cage` VALUES (452, 'HBTEST3', 'A区', '1003', NULL, 2);
INSERT INTO `cage` VALUES (453, 'HBTEST4', NULL, NULL, NULL, 2);
INSERT INTO `cage` VALUES (454, 'HBTEST5', NULL, NULL, NULL, 2);

-- ----------------------------
-- Table structure for calf
-- ----------------------------
DROP TABLE IF EXISTS `calf`;
CREATE TABLE `calf`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `calf_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `weight_day_add` double NOT NULL,
  `adjusted_feeding` double NOT NULL,
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pasture_id` bigint NOT NULL,
  `sex` smallint NOT NULL,
  `birth_weight` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `calf_id`(`calf_id` ASC) USING BTREE,
  INDEX `calf_pasture_id_73e728cd_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `calf_date_of_birth_20f799bd`(`date_of_birth` ASC) USING BTREE,
  INDEX `calf_weight_day_add_05a15443`(`weight_day_add` ASC) USING BTREE,
  INDEX `calf_adjusted_feeding_82c30cdc`(`adjusted_feeding` ASC) USING BTREE,
  INDEX `calf_sex_c0cd03cf`(`sex` ASC) USING BTREE,
  INDEX `calf_birth_weight_80170ed6`(`birth_weight` ASC) USING BTREE,
  CONSTRAINT `calf_pasture_id_73e728cd_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 334 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of calf
-- ----------------------------
INSERT INTO `calf` VALUES (12, '1499', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (13, '1498', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (14, '1497', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (15, '1496', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (16, '1495', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (17, '1494', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (18, '1493', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (19, '1492', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (20, '1491', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (21, '1490', '2023-11-28', 1, 1, NULL, 1, 2, 2);
INSERT INTO `calf` VALUES (22, '230635', '2023-10-18', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (23, '230634', '2023-10-18', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (24, '230633', '2023-10-18', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (25, '230632', '2023-10-18', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (26, '230631', '2023-10-17', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (27, '230630', '2023-10-17', 1, 0, '', 1, 2, 32);
INSERT INTO `calf` VALUES (28, '230629', '2023-10-17', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (29, '230628', '2023-10-17', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (30, '230627', '2023-10-16', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (31, '230626', '2023-10-16', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (32, '230625', '2023-10-16', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (33, '230624', '2023-10-16', 1, 0, '', 1, 2, 46);
INSERT INTO `calf` VALUES (34, '230623', '2023-10-15', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (35, '230622', '2023-10-15', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (36, '230621', '2023-10-15', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (37, '230620', '2023-10-15', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (38, '230619', '2023-10-15', 1, 0, '', 1, 2, 47);
INSERT INTO `calf` VALUES (39, '230618', '2023-10-15', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (40, '230617', '2023-10-14', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (41, '230616', '2023-10-14', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (42, '230614', '2023-10-14', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (43, '230613', '2023-10-14', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (44, '230612', '2023-10-14', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (45, '230611', '2023-10-14', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (46, '230610', '2023-10-14', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (47, '230609', '2023-10-14', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (48, '230608', '2023-10-13', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (49, '230607', '2023-10-13', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (50, '230605', '2023-10-13', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (51, '230604', '2023-10-13', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (52, '230603', '2023-10-13', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (53, '230602', '2023-10-12', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (54, '230601', '2023-10-12', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (55, '230600', '2023-10-11', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (56, '230599', '2023-10-11', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (57, '230598', '2023-10-11', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (58, '230597', '2023-10-11', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (59, '516', '2023-11-11', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (60, '517', '2023-11-12', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (61, '520', '2023-11-13', 1, 0, '', 1, 1, 43);
INSERT INTO `calf` VALUES (62, '521', '2023-11-13', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (63, '230773', '2023-11-11', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (64, '230772', '2023-11-11', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (65, '230771', '2023-11-11', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (66, '230770', '2023-11-11', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (67, '230777', '2023-11-11', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (68, '230776', '2023-11-11', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (69, '230775', '2023-11-11', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (70, '230774', '2023-11-11', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (71, '230762', '2023-11-10', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (72, '230769', '2023-11-11', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (73, '500', '2023-11-02', 1, 0, '', 1, 1, 44);
INSERT INTO `calf` VALUES (74, '523', '2023-11-14', 1, 0, '', 1, 1, 40);
INSERT INTO `calf` VALUES (75, '524', '2023-11-14', 1, 0, '', 1, 1, 38);
INSERT INTO `calf` VALUES (76, '525', '2023-11-15', 1, 0, '', 1, 1, 35);
INSERT INTO `calf` VALUES (77, '526', '2023-11-15', 1, 0, '', 1, 1, 35);
INSERT INTO `calf` VALUES (78, '230791', '2023-11-15', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (79, '230790', '2023-11-14', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (80, '230789', '2023-11-14', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (81, '230788', '2023-11-14', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (82, '230787', '2023-11-14', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (83, '230786', '2023-11-14', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (84, '230785', '2023-11-13', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (85, '230784', '2023-11-13', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (86, '230783', '2023-11-13', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (87, '230782', '2023-11-13', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (88, '230781', '2023-11-13', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (89, '230780', '2023-11-12', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (90, '230779', '2023-11-12', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (91, '230778', '2023-11-12', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (92, '230685', '2023-10-27', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (93, '230715', '2023-11-02', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (94, '230687', '2023-10-27', 1, 0, '', 1, 2, 45);
INSERT INTO `calf` VALUES (95, '230688', '2023-10-28', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (96, '230689', '2023-10-28', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (97, '230690', '2023-10-28', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (98, '230714', '2023-11-01', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (99, '230691', '2023-10-28', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (100, '230692', '2023-10-28', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (101, '230693', '2023-10-29', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (102, '230694', '2023-10-29', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (103, '230695', '2023-10-29', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (104, '230696', '2023-10-29', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (105, '230697', '2023-10-29', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (106, '230698', '2023-10-29', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (107, '230717', '2023-11-02', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (108, '230699', '2023-10-29', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (109, '230700', '2023-10-29', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (110, '230701', '2023-10-30', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (111, '230702', '2023-10-30', 1, 0, '', 1, 2, 30);
INSERT INTO `calf` VALUES (112, '230703', '2023-10-30', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (113, '230704', '2023-10-30', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (114, '230716', '2023-11-02', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (115, '230705', '2023-10-30', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (116, '230706', '2023-10-30', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (117, '230707', '2023-10-31', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (118, '230708', '2023-10-31', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (119, '230709', '2023-10-31', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (120, '230710', '2023-11-01', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (121, '230712', '2023-11-01', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (122, '230711', '2023-11-01', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (123, '230719', '2023-11-02', 1, 0, '', 1, 2, 46);
INSERT INTO `calf` VALUES (124, '230713', '2023-11-01', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (125, '558', '2023-11-26', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (126, '557', '2023-11-26', 1, 0, '', 1, 1, 40);
INSERT INTO `calf` VALUES (127, '555', '2023-11-25', 1, 0, '', 1, 1, 36);
INSERT INTO `calf` VALUES (128, '554', '2023-11-25', 1, 0, '', 1, 1, 42);
INSERT INTO `calf` VALUES (129, '553', '2023-11-25', 1, 0, '', 1, 1, 50);
INSERT INTO `calf` VALUES (130, '556', '2023-11-25', 1, 0, '', 1, 1, 33);
INSERT INTO `calf` VALUES (131, '550', '2023-11-24', 1, 0, '', 1, 1, 48);
INSERT INTO `calf` VALUES (132, '551', '2023-11-24', 1, 0, '', 1, 1, 46);
INSERT INTO `calf` VALUES (133, '552', '2023-11-24', 1, 0, '', 1, 1, 44);
INSERT INTO `calf` VALUES (134, '504', '2023-11-03', 1, 0, '', 1, 1, 38);
INSERT INTO `calf` VALUES (135, '505', '2023-11-04', 1, 0, '', 1, 1, 32);
INSERT INTO `calf` VALUES (136, '545', '2023-11-23', 1, 0, '', 1, 1, 46);
INSERT INTO `calf` VALUES (137, '507', '2023-11-04', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (138, '508', '2023-11-05', 1, 0, '', 1, 1, 40);
INSERT INTO `calf` VALUES (139, '537', '2023-11-19', 1, 0, '', 1, 1, 52);
INSERT INTO `calf` VALUES (140, '536', '2023-11-19', 1, 0, '', 1, 1, 49);
INSERT INTO `calf` VALUES (141, '510', '2023-11-06', 1, 0, '', 1, 1, 40);
INSERT INTO `calf` VALUES (142, '546', '2023-11-23', 1, 0, '', 1, 1, 38);
INSERT INTO `calf` VALUES (143, '544', '2023-11-22', 1, 0, '', 1, 1, 47);
INSERT INTO `calf` VALUES (144, '540', '2023-11-20', 1, 0, '', 1, 1, 44);
INSERT INTO `calf` VALUES (145, '538', '2023-11-19', 1, 0, '', 1, 1, 43);
INSERT INTO `calf` VALUES (146, '539', '2023-11-20', 1, 0, '', 1, 1, 47);
INSERT INTO `calf` VALUES (147, '535', '2023-11-18', 1, 0, '', 1, 1, 52);
INSERT INTO `calf` VALUES (148, '534', '2023-11-18', 1, 0, '', 1, 1, 48);
INSERT INTO `calf` VALUES (149, '533', '2023-11-18', 1, 0, '', 1, 1, 47);
INSERT INTO `calf` VALUES (150, '532', '2023-11-17', 1, 0, '', 1, 1, 38);
INSERT INTO `calf` VALUES (151, '531', '2023-11-17', 1, 0, '', 1, 1, 45);
INSERT INTO `calf` VALUES (152, '530', '2023-11-17', 1, 0, '', 1, 1, 43);
INSERT INTO `calf` VALUES (153, '529', '2023-11-16', 1, 0, '', 1, 1, 35);
INSERT INTO `calf` VALUES (154, '492', '2023-10-26', 1, 0, '', 1, 1, 46);
INSERT INTO `calf` VALUES (155, '528', '2023-11-15', 1, 0, '', 1, 1, 41);
INSERT INTO `calf` VALUES (156, '230662', '2023-10-23', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (157, '230661', '2023-10-23', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (158, '230660', '2023-10-23', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (159, '230659', '2023-10-22', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (160, '230658', '2023-10-22', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (161, '230656', '2023-10-22', 1, 0, '', 1, 2, 45);
INSERT INTO `calf` VALUES (162, '230655', '2023-10-22', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (163, '230654', '2023-10-22', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (164, '230653', '2023-10-22', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (165, '230652', '2023-10-22', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (166, '230651', '2023-10-21', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (167, '230650', '2023-10-21', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (168, '230649', '2023-10-21', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (169, '230648', '2023-10-21', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (170, '230647', '2023-10-21', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (171, '230657', '2023-10-22', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (172, '230645', '2023-10-20', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (173, '230644', '2023-10-20', 1, 0, '', 1, 2, 52);
INSERT INTO `calf` VALUES (174, '230643', '2023-10-20', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (175, '230642', '2023-10-20', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (176, '230641', '2023-10-20', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (177, '230640', '2023-10-20', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (178, '230639', '2023-10-19', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (179, '230638', '2023-10-19', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (180, '230637', '2023-10-19', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (181, '230636', '2023-10-19', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (182, '230663', '2023-10-23', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (183, '230664', '2023-10-23', 1, 0, '', 1, 2, 40);
INSERT INTO `calf` VALUES (184, '230665', '2023-10-23', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (185, '230666', '2023-10-23', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (186, '230667', '2023-10-24', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (187, '230668', '2023-10-24', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (188, '230669', '2023-10-24', 1, 0, '', 1, 2, 31);
INSERT INTO `calf` VALUES (189, '230670', '2023-10-24', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (190, '230671', '2023-10-25', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (191, '230672', '2023-10-25', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (192, '230673', '2023-10-25', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (193, '230674', '2023-10-25', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (194, '238675', '2023-10-25', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (195, '230676', '2023-10-25', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (196, '230677', '2023-10-25', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (197, '230678', '2023-10-26', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (198, '238679', '2023-10-26', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (199, '230680', '2023-10-26', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (200, '230681', '2023-10-26', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (201, '230682', '2023-10-26', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (202, '230683', '2023-10-27', 1, 0, '', 1, 2, 32);
INSERT INTO `calf` VALUES (203, '230684', '2023-10-27', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (204, '559', '2023-11-26', 1, 0, '', 1, 1, 39);
INSERT INTO `calf` VALUES (205, '512', '2023-11-08', 1, 0, '', 1, 1, 34);
INSERT INTO `calf` VALUES (206, '514', '2023-11-09', 1, 0, '', 1, 1, 37);
INSERT INTO `calf` VALUES (207, '513', '2023-11-08', 1, 0, '', 1, 1, 42);
INSERT INTO `calf` VALUES (208, '230768', '2023-11-11', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (209, '230767', '2023-11-11', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (210, '230766', '2023-11-11', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (211, '230765', '2023-11-11', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (212, '230764', '2023-11-10', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (213, '230763', '2023-11-10', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (214, '230761', '2023-11-10', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (215, '230760', '2023-11-10', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (216, '230759', '2023-11-10', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (217, '230758', '2023-11-10', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (218, '230757', '2023-11-09', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (219, '230756', '2023-11-09', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (220, '230755', '2023-11-09', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (221, '230754', '2023-11-09', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (222, '230753', '2023-11-09', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (223, '230752', '2023-11-08', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (224, '230751', '2023-11-08', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (225, '230750', '2023-11-08', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (226, '230749', '2023-11-08', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (227, '230748', '2023-11-08', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (228, '230747', '2023-11-08', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (229, '230746', '2023-11-07', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (230, '230745', '2023-11-07', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (231, '230744', '2023-11-07', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (232, '230743', '2023-11-07', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (233, '230742', '2023-11-07', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (234, '230741', '2023-11-06', 1, 0, '', 1, 2, 31);
INSERT INTO `calf` VALUES (235, '230740', '2023-11-06', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (236, '230739', '2023-11-06', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (237, '230738', '2023-11-06', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (238, '230737', '2023-11-06', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (239, '230736', '2023-11-06', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (240, '230735', '2023-11-05', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (241, '230734', '2023-11-05', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (242, '230733', '2023-11-05', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (243, '230732', '2023-11-05', 1, 0, '', 1, 2, 45);
INSERT INTO `calf` VALUES (244, '230731', '2023-11-05', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (245, '230730', '2023-11-05', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (246, '230729', '2023-11-05', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (247, '230728', '2023-11-04', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (248, '230727', '2023-11-04', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (249, '230726', '2023-11-04', 1, 0, '', 1, 2, 31);
INSERT INTO `calf` VALUES (250, '230725', '2023-11-04', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (251, '230724', '2023-11-04', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (252, '230723', '2023-11-04', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (253, '230722', '2023-11-03', 1, 0, '', 1, 2, 48);
INSERT INTO `calf` VALUES (254, '230721', '2023-11-03', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (255, '230720', '2023-11-02', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (256, '230718', '2023-11-02', 1, 0, '', 1, 2, 34);
INSERT INTO `calf` VALUES (257, '541', '2023-11-21', 1, 0, '', 1, 1, 52);
INSERT INTO `calf` VALUES (258, '542', '2023-11-21', 1, 0, '', 1, 1, 37);
INSERT INTO `calf` VALUES (259, '543', '2023-11-22', 1, 0, '', 1, 1, 38);
INSERT INTO `calf` VALUES (260, '547', '2023-11-23', 1, 0, '', 1, 1, 43);
INSERT INTO `calf` VALUES (261, '548', '2023-11-23', 1, 0, '', 1, 1, 44);
INSERT INTO `calf` VALUES (262, '549', '2023-11-24', 1, 0, '', 1, 1, 44);
INSERT INTO `calf` VALUES (263, '230833', '2023-11-23', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (264, '230832', '2023-11-23', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (265, '230831', '2023-11-22', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (266, '230830', '2023-11-22', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (267, '230829', '2023-11-21', 1, 0, '', 1, 2, 42);
INSERT INTO `calf` VALUES (268, '230828', '2023-11-21', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (269, '230827', '2023-11-21', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (270, '230826', '2023-11-21', 1, 0, '', 1, 2, 37);
INSERT INTO `calf` VALUES (271, '230825', '2023-11-21', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (272, '230824', '2023-11-21', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (273, '230823', '2023-11-21', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (274, '230822', '2023-11-20', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (275, '230821', '2023-11-20', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (276, '230820', '2023-11-20', 1, 0, '', 1, 2, 30);
INSERT INTO `calf` VALUES (277, '230819', '2023-11-20', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (278, '230818', '2023-11-19', 1, 0, '', 1, 2, 48);
INSERT INTO `calf` VALUES (279, '230817', '2023-11-19', 1, 0, '', 1, 2, 32);
INSERT INTO `calf` VALUES (280, '230816', '2023-11-19', 1, 0, '', 1, 2, 43);
INSERT INTO `calf` VALUES (281, '230815', '2023-11-19', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (282, '230814', '2023-11-19', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (283, '230813', '2023-11-18', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (284, '230812', '2023-11-18', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (285, '230811', '2023-11-18', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (286, '230810', '2023-11-18', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (287, '230809', '2023-11-17', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (288, '230808', '2023-11-17', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (289, '230807', '2023-11-17', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (290, '230806', '2023-11-17', 1, 0, '', 1, 2, 44);
INSERT INTO `calf` VALUES (291, '230805', '2023-11-17', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (292, '230804', '2023-11-17', 1, 0, '', 1, 2, 33);
INSERT INTO `calf` VALUES (293, '230803', '2023-11-17', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (294, '230802', '2023-11-17', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (295, '230801', '2023-11-16', 1, 0, '', 1, 2, 35);
INSERT INTO `calf` VALUES (296, '527', '2023-11-15', 1, 0, '', 1, 1, 42);
INSERT INTO `calf` VALUES (297, '230800', '2023-11-16', 1, 0, '', 1, 2, 41);
INSERT INTO `calf` VALUES (298, '230799', '2023-11-16', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (299, '230798', '2023-11-16', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (300, '230792', '2023-11-15', 1, 0, '', 1, 2, 50);
INSERT INTO `calf` VALUES (301, '230797', '2023-11-15', 1, 0, '', 1, 2, 38);
INSERT INTO `calf` VALUES (302, '230796', '2023-11-15', 1, 0, '', 1, 2, 32);
INSERT INTO `calf` VALUES (303, '230795', '2023-11-15', 1, 0, '', 1, 2, 39);
INSERT INTO `calf` VALUES (304, '230794', '2023-11-15', 1, 0, '', 1, 2, 30);
INSERT INTO `calf` VALUES (305, '230793', '2023-11-15', 1, 0, '', 1, 2, 36);
INSERT INTO `calf` VALUES (321, '880103', '2023-12-07', 1, 0, '', 2, 2, 40);
INSERT INTO `calf` VALUES (322, '880105', '2023-12-07', 1, 0, '', 2, 2, 51);
INSERT INTO `calf` VALUES (325, '880102', '2023-12-07', 1, 0, '', 2, 2, 31);
INSERT INTO `calf` VALUES (328, '10001', '2023-12-01', 1, 0, '', 1, 2, 45);
INSERT INTO `calf` VALUES (329, '10002', '2023-11-01', 1, -3, '', 1, 2, 45);
INSERT INTO `calf` VALUES (330, '880101', '2023-12-07', 1, 0, '', 2, 2, 31);
INSERT INTO `calf` VALUES (331, '880106', '2023-12-09', 1, 0, '', 2, 2, 21);
INSERT INTO `calf` VALUES (333, '1500', '2023-12-08', 1, 0, '', 1, 2, 31);

-- ----------------------------
-- Table structure for calf_cage
-- ----------------------------
DROP TABLE IF EXISTS `calf_cage`;
CREATE TABLE `calf_cage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cage_entry_time` date NOT NULL,
  `cage_id` bigint NOT NULL,
  `calf_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cage_id`(`cage_id` ASC) USING BTREE,
  UNIQUE INDEX `calf_id`(`calf_id` ASC) USING BTREE,
  INDEX `calf_cage_cage_entry_time_7dc264d8`(`cage_entry_time` ASC) USING BTREE,
  CONSTRAINT `calf_cage_cage_id_b8cbdf23_fk_cage_id` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `calf_cage_calf_id_f8f9f26b_fk_calf_id` FOREIGN KEY (`calf_id`) REFERENCES `calf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of calf_cage
-- ----------------------------
INSERT INTO `calf_cage` VALUES (10, '2023-11-28', 12, 12);
INSERT INTO `calf_cage` VALUES (11, '2023-11-28', 13, 13);
INSERT INTO `calf_cage` VALUES (12, '2023-11-28', 14, 14);
INSERT INTO `calf_cage` VALUES (13, '2023-11-28', 15, 15);
INSERT INTO `calf_cage` VALUES (14, '2023-11-28', 16, 16);
INSERT INTO `calf_cage` VALUES (15, '2023-11-28', 17, 17);
INSERT INTO `calf_cage` VALUES (16, '2023-11-28', 18, 18);
INSERT INTO `calf_cage` VALUES (17, '2023-11-28', 19, 19);
INSERT INTO `calf_cage` VALUES (18, '2023-11-28', 20, 20);
INSERT INTO `calf_cage` VALUES (19, '2023-11-28', 21, 21);
INSERT INTO `calf_cage` VALUES (20, '2023-11-29', 23, 22);
INSERT INTO `calf_cage` VALUES (21, '2023-11-29', 24, 23);
INSERT INTO `calf_cage` VALUES (22, '2023-11-29', 25, 24);
INSERT INTO `calf_cage` VALUES (23, '2023-11-29', 26, 25);
INSERT INTO `calf_cage` VALUES (24, '2023-11-29', 27, 26);
INSERT INTO `calf_cage` VALUES (25, '2023-11-29', 28, 27);
INSERT INTO `calf_cage` VALUES (26, '2023-11-29', 29, 28);
INSERT INTO `calf_cage` VALUES (27, '2023-11-29', 30, 29);
INSERT INTO `calf_cage` VALUES (28, '2023-11-29', 31, 30);
INSERT INTO `calf_cage` VALUES (29, '2023-11-29', 32, 31);
INSERT INTO `calf_cage` VALUES (30, '2023-11-29', 33, 32);
INSERT INTO `calf_cage` VALUES (31, '2023-11-29', 34, 33);
INSERT INTO `calf_cage` VALUES (32, '2023-11-29', 35, 34);
INSERT INTO `calf_cage` VALUES (33, '2023-11-29', 36, 35);
INSERT INTO `calf_cage` VALUES (34, '2023-11-29', 37, 36);
INSERT INTO `calf_cage` VALUES (35, '2023-11-29', 38, 37);
INSERT INTO `calf_cage` VALUES (36, '2023-11-29', 39, 38);
INSERT INTO `calf_cage` VALUES (37, '2023-11-29', 40, 39);
INSERT INTO `calf_cage` VALUES (38, '2023-11-29', 41, 40);
INSERT INTO `calf_cage` VALUES (39, '2023-11-29', 42, 41);
INSERT INTO `calf_cage` VALUES (40, '2023-11-29', 44, 42);
INSERT INTO `calf_cage` VALUES (41, '2023-11-29', 45, 43);
INSERT INTO `calf_cage` VALUES (42, '2023-11-29', 46, 44);
INSERT INTO `calf_cage` VALUES (43, '2023-11-29', 47, 45);
INSERT INTO `calf_cage` VALUES (44, '2023-11-29', 48, 46);
INSERT INTO `calf_cage` VALUES (45, '2023-11-29', 49, 47);
INSERT INTO `calf_cage` VALUES (46, '2023-11-29', 50, 48);
INSERT INTO `calf_cage` VALUES (47, '2023-11-29', 51, 49);
INSERT INTO `calf_cage` VALUES (48, '2023-11-29', 53, 50);
INSERT INTO `calf_cage` VALUES (49, '2023-11-29', 54, 51);
INSERT INTO `calf_cage` VALUES (50, '2023-11-29', 55, 52);
INSERT INTO `calf_cage` VALUES (51, '2023-11-29', 56, 53);
INSERT INTO `calf_cage` VALUES (52, '2023-11-29', 57, 54);
INSERT INTO `calf_cage` VALUES (53, '2023-11-29', 58, 55);
INSERT INTO `calf_cage` VALUES (54, '2023-11-29', 59, 56);
INSERT INTO `calf_cage` VALUES (55, '2023-11-29', 60, 57);
INSERT INTO `calf_cage` VALUES (56, '2023-11-29', 61, 58);
INSERT INTO `calf_cage` VALUES (57, '2023-11-29', 66, 59);
INSERT INTO `calf_cage` VALUES (58, '2023-11-29', 67, 60);
INSERT INTO `calf_cage` VALUES (59, '2023-11-29', 70, 61);
INSERT INTO `calf_cage` VALUES (60, '2023-11-29', 71, 62);
INSERT INTO `calf_cage` VALUES (61, '2023-11-29', 72, 63);
INSERT INTO `calf_cage` VALUES (62, '2023-11-29', 73, 64);
INSERT INTO `calf_cage` VALUES (63, '2023-11-29', 74, 65);
INSERT INTO `calf_cage` VALUES (64, '2023-11-29', 75, 66);
INSERT INTO `calf_cage` VALUES (65, '2023-11-29', 76, 67);
INSERT INTO `calf_cage` VALUES (66, '2023-11-29', 77, 68);
INSERT INTO `calf_cage` VALUES (67, '2023-11-29', 78, 69);
INSERT INTO `calf_cage` VALUES (68, '2023-11-29', 79, 70);
INSERT INTO `calf_cage` VALUES (69, '2023-11-29', 80, 71);
INSERT INTO `calf_cage` VALUES (70, '2023-11-29', 81, 72);
INSERT INTO `calf_cage` VALUES (71, '2023-11-29', 82, 73);
INSERT INTO `calf_cage` VALUES (72, '2023-11-29', 83, 74);
INSERT INTO `calf_cage` VALUES (73, '2023-11-29', 84, 75);
INSERT INTO `calf_cage` VALUES (74, '2023-11-29', 85, 76);
INSERT INTO `calf_cage` VALUES (75, '2023-11-29', 86, 77);
INSERT INTO `calf_cage` VALUES (76, '2023-11-29', 88, 78);
INSERT INTO `calf_cage` VALUES (77, '2023-11-29', 89, 79);
INSERT INTO `calf_cage` VALUES (78, '2023-11-29', 90, 80);
INSERT INTO `calf_cage` VALUES (79, '2023-11-29', 91, 81);
INSERT INTO `calf_cage` VALUES (80, '2023-11-29', 92, 82);
INSERT INTO `calf_cage` VALUES (81, '2023-11-29', 93, 83);
INSERT INTO `calf_cage` VALUES (82, '2023-11-29', 94, 84);
INSERT INTO `calf_cage` VALUES (83, '2023-11-29', 95, 85);
INSERT INTO `calf_cage` VALUES (84, '2023-11-29', 96, 86);
INSERT INTO `calf_cage` VALUES (85, '2023-11-29', 97, 87);
INSERT INTO `calf_cage` VALUES (86, '2023-11-29', 98, 88);
INSERT INTO `calf_cage` VALUES (87, '2023-11-29', 99, 89);
INSERT INTO `calf_cage` VALUES (88, '2023-11-29', 100, 90);
INSERT INTO `calf_cage` VALUES (89, '2023-11-29', 101, 91);
INSERT INTO `calf_cage` VALUES (90, '2023-11-29', 102, 92);
INSERT INTO `calf_cage` VALUES (91, '2023-11-29', 103, 93);
INSERT INTO `calf_cage` VALUES (92, '2023-11-29', 104, 94);
INSERT INTO `calf_cage` VALUES (93, '2023-11-29', 105, 95);
INSERT INTO `calf_cage` VALUES (94, '2023-11-29', 106, 96);
INSERT INTO `calf_cage` VALUES (95, '2023-11-29', 107, 97);
INSERT INTO `calf_cage` VALUES (96, '2023-11-29', 108, 98);
INSERT INTO `calf_cage` VALUES (97, '2023-11-29', 109, 99);
INSERT INTO `calf_cage` VALUES (98, '2023-11-29', 110, 100);
INSERT INTO `calf_cage` VALUES (99, '2023-11-29', 111, 101);
INSERT INTO `calf_cage` VALUES (100, '2023-11-29', 112, 102);
INSERT INTO `calf_cage` VALUES (101, '2023-11-29', 113, 103);
INSERT INTO `calf_cage` VALUES (102, '2023-11-29', 114, 104);
INSERT INTO `calf_cage` VALUES (103, '2023-11-29', 115, 105);
INSERT INTO `calf_cage` VALUES (104, '2023-11-29', 116, 106);
INSERT INTO `calf_cage` VALUES (105, '2023-11-29', 117, 107);
INSERT INTO `calf_cage` VALUES (106, '2023-11-29', 118, 108);
INSERT INTO `calf_cage` VALUES (107, '2023-11-29', 119, 109);
INSERT INTO `calf_cage` VALUES (108, '2023-11-29', 120, 110);
INSERT INTO `calf_cage` VALUES (109, '2023-11-29', 121, 111);
INSERT INTO `calf_cage` VALUES (110, '2023-11-29', 122, 112);
INSERT INTO `calf_cage` VALUES (111, '2023-11-29', 124, 113);
INSERT INTO `calf_cage` VALUES (112, '2023-11-29', 125, 114);
INSERT INTO `calf_cage` VALUES (113, '2023-11-29', 126, 115);
INSERT INTO `calf_cage` VALUES (114, '2023-11-29', 127, 116);
INSERT INTO `calf_cage` VALUES (115, '2023-11-29', 128, 117);
INSERT INTO `calf_cage` VALUES (116, '2023-11-29', 129, 118);
INSERT INTO `calf_cage` VALUES (117, '2023-11-29', 130, 119);
INSERT INTO `calf_cage` VALUES (118, '2023-11-29', 131, 120);
INSERT INTO `calf_cage` VALUES (119, '2023-11-29', 132, 121);
INSERT INTO `calf_cage` VALUES (120, '2023-11-29', 133, 122);
INSERT INTO `calf_cage` VALUES (121, '2023-11-29', 134, 123);
INSERT INTO `calf_cage` VALUES (122, '2023-11-29', 135, 124);
INSERT INTO `calf_cage` VALUES (123, '2023-11-29', 136, 125);
INSERT INTO `calf_cage` VALUES (124, '2023-11-29', 137, 126);
INSERT INTO `calf_cage` VALUES (125, '2023-11-29', 138, 127);
INSERT INTO `calf_cage` VALUES (126, '2023-11-29', 139, 128);
INSERT INTO `calf_cage` VALUES (127, '2023-11-29', 140, 129);
INSERT INTO `calf_cage` VALUES (128, '2023-11-29', 141, 130);
INSERT INTO `calf_cage` VALUES (129, '2023-11-29', 142, 131);
INSERT INTO `calf_cage` VALUES (130, '2023-11-29', 144, 133);
INSERT INTO `calf_cage` VALUES (131, '2023-11-29', 147, 134);
INSERT INTO `calf_cage` VALUES (132, '2023-11-29', 148, 135);
INSERT INTO `calf_cage` VALUES (133, '2023-11-29', 150, 136);
INSERT INTO `calf_cage` VALUES (134, '2023-11-29', 152, 137);
INSERT INTO `calf_cage` VALUES (135, '2023-11-29', 153, 138);
INSERT INTO `calf_cage` VALUES (136, '2023-11-29', 154, 139);
INSERT INTO `calf_cage` VALUES (137, '2023-11-29', 156, 140);
INSERT INTO `calf_cage` VALUES (138, '2023-11-29', 157, 141);
INSERT INTO `calf_cage` VALUES (139, '2023-11-29', 158, 142);
INSERT INTO `calf_cage` VALUES (140, '2023-11-29', 159, 143);
INSERT INTO `calf_cage` VALUES (141, '2023-11-29', 160, 144);
INSERT INTO `calf_cage` VALUES (142, '2023-11-29', 161, 145);
INSERT INTO `calf_cage` VALUES (143, '2023-11-29', 162, 146);
INSERT INTO `calf_cage` VALUES (144, '2023-11-29', 163, 147);
INSERT INTO `calf_cage` VALUES (145, '2023-11-29', 164, 148);
INSERT INTO `calf_cage` VALUES (146, '2023-11-29', 165, 149);
INSERT INTO `calf_cage` VALUES (147, '2023-11-29', 166, 150);
INSERT INTO `calf_cage` VALUES (148, '2023-11-29', 167, 151);
INSERT INTO `calf_cage` VALUES (149, '2023-11-29', 168, 152);
INSERT INTO `calf_cage` VALUES (150, '2023-11-29', 169, 153);
INSERT INTO `calf_cage` VALUES (151, '2023-11-29', 170, 154);
INSERT INTO `calf_cage` VALUES (152, '2023-11-29', 171, 155);
INSERT INTO `calf_cage` VALUES (153, '2023-11-29', 172, 156);
INSERT INTO `calf_cage` VALUES (154, '2023-11-29', 173, 157);
INSERT INTO `calf_cage` VALUES (155, '2023-11-29', 174, 158);
INSERT INTO `calf_cage` VALUES (156, '2023-11-29', 175, 159);
INSERT INTO `calf_cage` VALUES (157, '2023-11-29', 176, 160);
INSERT INTO `calf_cage` VALUES (158, '2023-11-29', 177, 161);
INSERT INTO `calf_cage` VALUES (159, '2023-11-29', 178, 162);
INSERT INTO `calf_cage` VALUES (160, '2023-11-29', 179, 163);
INSERT INTO `calf_cage` VALUES (161, '2023-11-29', 180, 164);
INSERT INTO `calf_cage` VALUES (162, '2023-11-29', 181, 165);
INSERT INTO `calf_cage` VALUES (163, '2023-11-29', 182, 166);
INSERT INTO `calf_cage` VALUES (164, '2023-11-29', 183, 167);
INSERT INTO `calf_cage` VALUES (165, '2023-11-29', 184, 168);
INSERT INTO `calf_cage` VALUES (166, '2023-11-29', 185, 169);
INSERT INTO `calf_cage` VALUES (167, '2023-11-29', 186, 170);
INSERT INTO `calf_cage` VALUES (168, '2023-11-29', 187, 171);
INSERT INTO `calf_cage` VALUES (169, '2023-11-29', 188, 172);
INSERT INTO `calf_cage` VALUES (170, '2023-11-29', 189, 173);
INSERT INTO `calf_cage` VALUES (171, '2023-11-29', 190, 174);
INSERT INTO `calf_cage` VALUES (172, '2023-11-29', 191, 175);
INSERT INTO `calf_cage` VALUES (173, '2023-11-29', 192, 176);
INSERT INTO `calf_cage` VALUES (174, '2023-11-29', 193, 177);
INSERT INTO `calf_cage` VALUES (175, '2023-11-29', 194, 178);
INSERT INTO `calf_cage` VALUES (176, '2023-11-29', 195, 179);
INSERT INTO `calf_cage` VALUES (177, '2023-11-29', 196, 180);
INSERT INTO `calf_cage` VALUES (178, '2023-11-29', 197, 181);
INSERT INTO `calf_cage` VALUES (179, '2023-11-29', 198, 182);
INSERT INTO `calf_cage` VALUES (180, '2023-11-29', 199, 183);
INSERT INTO `calf_cage` VALUES (181, '2023-11-29', 200, 184);
INSERT INTO `calf_cage` VALUES (182, '2023-11-29', 203, 185);
INSERT INTO `calf_cage` VALUES (183, '2023-11-29', 204, 186);
INSERT INTO `calf_cage` VALUES (184, '2023-11-29', 205, 187);
INSERT INTO `calf_cage` VALUES (185, '2023-11-29', 206, 188);
INSERT INTO `calf_cage` VALUES (186, '2023-11-29', 207, 189);
INSERT INTO `calf_cage` VALUES (187, '2023-11-29', 208, 190);
INSERT INTO `calf_cage` VALUES (188, '2023-11-29', 209, 191);
INSERT INTO `calf_cage` VALUES (189, '2023-11-29', 210, 192);
INSERT INTO `calf_cage` VALUES (190, '2023-11-29', 211, 193);
INSERT INTO `calf_cage` VALUES (191, '2023-11-29', 213, 194);
INSERT INTO `calf_cage` VALUES (192, '2023-11-29', 214, 195);
INSERT INTO `calf_cage` VALUES (193, '2023-11-29', 215, 196);
INSERT INTO `calf_cage` VALUES (194, '2023-11-29', 216, 197);
INSERT INTO `calf_cage` VALUES (195, '2023-11-29', 217, 198);
INSERT INTO `calf_cage` VALUES (196, '2023-11-29', 218, 199);
INSERT INTO `calf_cage` VALUES (197, '2023-11-29', 219, 200);
INSERT INTO `calf_cage` VALUES (198, '2023-11-29', 220, 201);
INSERT INTO `calf_cage` VALUES (199, '2023-11-29', 221, 202);
INSERT INTO `calf_cage` VALUES (200, '2023-11-29', 222, 203);
INSERT INTO `calf_cage` VALUES (201, '2023-11-29', 223, 204);
INSERT INTO `calf_cage` VALUES (202, '2023-11-29', 224, 205);
INSERT INTO `calf_cage` VALUES (203, '2023-11-29', 225, 206);
INSERT INTO `calf_cage` VALUES (204, '2023-11-29', 226, 207);
INSERT INTO `calf_cage` VALUES (205, '2023-11-29', 227, 208);
INSERT INTO `calf_cage` VALUES (206, '2023-11-29', 228, 209);
INSERT INTO `calf_cage` VALUES (207, '2023-11-29', 229, 210);
INSERT INTO `calf_cage` VALUES (208, '2023-11-29', 230, 211);
INSERT INTO `calf_cage` VALUES (209, '2023-11-29', 231, 212);
INSERT INTO `calf_cage` VALUES (210, '2023-11-29', 232, 213);
INSERT INTO `calf_cage` VALUES (211, '2023-11-29', 233, 214);
INSERT INTO `calf_cage` VALUES (212, '2023-11-29', 234, 215);
INSERT INTO `calf_cage` VALUES (213, '2023-11-29', 235, 216);
INSERT INTO `calf_cage` VALUES (214, '2023-11-29', 236, 217);
INSERT INTO `calf_cage` VALUES (215, '2023-11-29', 237, 218);
INSERT INTO `calf_cage` VALUES (216, '2023-11-29', 238, 219);
INSERT INTO `calf_cage` VALUES (217, '2023-11-29', 239, 220);
INSERT INTO `calf_cage` VALUES (218, '2023-11-29', 240, 221);
INSERT INTO `calf_cage` VALUES (219, '2023-11-29', 241, 222);
INSERT INTO `calf_cage` VALUES (220, '2023-11-29', 242, 223);
INSERT INTO `calf_cage` VALUES (221, '2023-11-29', 243, 224);
INSERT INTO `calf_cage` VALUES (222, '2023-11-29', 244, 225);
INSERT INTO `calf_cage` VALUES (223, '2023-11-29', 245, 226);
INSERT INTO `calf_cage` VALUES (224, '2023-11-29', 246, 227);
INSERT INTO `calf_cage` VALUES (225, '2023-11-29', 247, 228);
INSERT INTO `calf_cage` VALUES (226, '2023-11-29', 248, 229);
INSERT INTO `calf_cage` VALUES (227, '2023-11-29', 249, 230);
INSERT INTO `calf_cage` VALUES (228, '2023-11-29', 250, 231);
INSERT INTO `calf_cage` VALUES (229, '2023-11-29', 251, 232);
INSERT INTO `calf_cage` VALUES (230, '2023-11-29', 252, 233);
INSERT INTO `calf_cage` VALUES (231, '2023-11-29', 253, 234);
INSERT INTO `calf_cage` VALUES (232, '2023-11-29', 254, 235);
INSERT INTO `calf_cage` VALUES (233, '2023-11-29', 255, 236);
INSERT INTO `calf_cage` VALUES (234, '2023-11-29', 256, 237);
INSERT INTO `calf_cage` VALUES (235, '2023-11-29', 257, 238);
INSERT INTO `calf_cage` VALUES (236, '2023-11-29', 258, 239);
INSERT INTO `calf_cage` VALUES (237, '2023-11-29', 259, 240);
INSERT INTO `calf_cage` VALUES (238, '2023-11-29', 260, 241);
INSERT INTO `calf_cage` VALUES (239, '2023-11-29', 261, 242);
INSERT INTO `calf_cage` VALUES (240, '2023-11-29', 262, 243);
INSERT INTO `calf_cage` VALUES (241, '2023-11-29', 263, 244);
INSERT INTO `calf_cage` VALUES (242, '2023-11-29', 264, 245);
INSERT INTO `calf_cage` VALUES (243, '2023-11-29', 266, 246);
INSERT INTO `calf_cage` VALUES (244, '2023-11-29', 267, 247);
INSERT INTO `calf_cage` VALUES (245, '2023-11-29', 268, 248);
INSERT INTO `calf_cage` VALUES (246, '2023-11-29', 269, 249);
INSERT INTO `calf_cage` VALUES (247, '2023-11-29', 270, 250);
INSERT INTO `calf_cage` VALUES (248, '2023-11-29', 271, 251);
INSERT INTO `calf_cage` VALUES (249, '2023-11-29', 272, 252);
INSERT INTO `calf_cage` VALUES (250, '2023-11-29', 273, 253);
INSERT INTO `calf_cage` VALUES (251, '2023-11-29', 274, 254);
INSERT INTO `calf_cage` VALUES (252, '2023-11-29', 275, 255);
INSERT INTO `calf_cage` VALUES (253, '2023-11-29', 276, 256);
INSERT INTO `calf_cage` VALUES (254, '2023-11-29', 277, 257);
INSERT INTO `calf_cage` VALUES (255, '2023-11-29', 278, 258);
INSERT INTO `calf_cage` VALUES (256, '2023-11-29', 279, 259);
INSERT INTO `calf_cage` VALUES (257, '2023-11-29', 280, 260);
INSERT INTO `calf_cage` VALUES (258, '2023-11-29', 281, 261);
INSERT INTO `calf_cage` VALUES (259, '2023-11-29', 282, 262);
INSERT INTO `calf_cage` VALUES (260, '2023-11-29', 283, 263);
INSERT INTO `calf_cage` VALUES (261, '2023-11-29', 284, 264);
INSERT INTO `calf_cage` VALUES (262, '2023-11-29', 285, 265);
INSERT INTO `calf_cage` VALUES (263, '2023-11-29', 286, 266);
INSERT INTO `calf_cage` VALUES (264, '2023-11-29', 287, 267);
INSERT INTO `calf_cage` VALUES (265, '2023-11-29', 288, 268);
INSERT INTO `calf_cage` VALUES (266, '2023-11-29', 289, 269);
INSERT INTO `calf_cage` VALUES (267, '2023-11-29', 290, 270);
INSERT INTO `calf_cage` VALUES (268, '2023-11-29', 291, 271);
INSERT INTO `calf_cage` VALUES (269, '2023-11-29', 292, 272);
INSERT INTO `calf_cage` VALUES (270, '2023-11-29', 293, 273);
INSERT INTO `calf_cage` VALUES (271, '2023-11-29', 294, 274);
INSERT INTO `calf_cage` VALUES (272, '2023-11-29', 295, 275);
INSERT INTO `calf_cage` VALUES (273, '2023-11-29', 296, 276);
INSERT INTO `calf_cage` VALUES (274, '2023-11-29', 297, 277);
INSERT INTO `calf_cage` VALUES (275, '2023-11-29', 298, 278);
INSERT INTO `calf_cage` VALUES (276, '2023-11-29', 299, 279);
INSERT INTO `calf_cage` VALUES (277, '2023-11-29', 300, 280);
INSERT INTO `calf_cage` VALUES (278, '2023-11-29', 301, 281);
INSERT INTO `calf_cage` VALUES (279, '2023-11-29', 302, 282);
INSERT INTO `calf_cage` VALUES (280, '2023-11-29', 303, 283);
INSERT INTO `calf_cage` VALUES (281, '2023-11-29', 305, 284);
INSERT INTO `calf_cage` VALUES (282, '2023-11-29', 306, 285);
INSERT INTO `calf_cage` VALUES (283, '2023-11-29', 307, 286);
INSERT INTO `calf_cage` VALUES (284, '2023-11-29', 308, 287);
INSERT INTO `calf_cage` VALUES (285, '2023-11-29', 309, 288);
INSERT INTO `calf_cage` VALUES (286, '2023-11-29', 310, 289);
INSERT INTO `calf_cage` VALUES (287, '2023-11-29', 311, 290);
INSERT INTO `calf_cage` VALUES (288, '2023-11-29', 312, 291);
INSERT INTO `calf_cage` VALUES (289, '2023-11-29', 313, 292);
INSERT INTO `calf_cage` VALUES (290, '2023-11-29', 314, 293);
INSERT INTO `calf_cage` VALUES (291, '2023-11-29', 315, 294);
INSERT INTO `calf_cage` VALUES (292, '2023-11-29', 316, 295);
INSERT INTO `calf_cage` VALUES (293, '2023-11-29', 317, 296);
INSERT INTO `calf_cage` VALUES (294, '2023-11-29', 318, 297);
INSERT INTO `calf_cage` VALUES (295, '2023-11-29', 319, 298);
INSERT INTO `calf_cage` VALUES (296, '2023-11-29', 320, 299);
INSERT INTO `calf_cage` VALUES (297, '2023-11-29', 321, 300);
INSERT INTO `calf_cage` VALUES (298, '2023-11-29', 322, 301);
INSERT INTO `calf_cage` VALUES (299, '2023-11-29', 323, 302);
INSERT INTO `calf_cage` VALUES (300, '2023-11-29', 324, 303);
INSERT INTO `calf_cage` VALUES (301, '2023-11-29', 325, 304);
INSERT INTO `calf_cage` VALUES (302, '2023-11-29', 326, 305);
INSERT INTO `calf_cage` VALUES (309, '2023-12-04', 143, 132);
INSERT INTO `calf_cage` VALUES (315, '2023-12-07', 451, 325);
INSERT INTO `calf_cage` VALUES (316, '2023-12-07', 452, 321);
INSERT INTO `calf_cage` VALUES (317, '2023-12-08', 431, 328);
INSERT INTO `calf_cage` VALUES (318, '2023-12-08', 432, 329);
INSERT INTO `calf_cage` VALUES (319, '2023-12-08', 450, 330);
INSERT INTO `calf_cage` VALUES (322, '2023-12-09', 11, 333);

-- ----------------------------
-- Table structure for data_update_status
-- ----------------------------
DROP TABLE IF EXISTS `data_update_status`;
CREATE TABLE `data_update_status`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `u_time` datetime(6) NOT NULL,
  `is_synced` tinyint(1) NOT NULL,
  `pasture_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `data_update_status_u_time_1dfc15fa`(`u_time` ASC) USING BTREE,
  INDEX `data_update_status_is_synced_53292175`(`is_synced` ASC) USING BTREE,
  CONSTRAINT `data_update_status_pasture_id_f1e5ea47_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_update_status
-- ----------------------------
INSERT INTO `data_update_status` VALUES (3, '2023-12-10 21:00:09.000000', 0, 1);
INSERT INTO `data_update_status` VALUES (4, '2023-12-09 20:34:36.000000', 0, 2);

-- ----------------------------
-- Table structure for device_log
-- ----------------------------
DROP TABLE IF EXISTS `device_log`;
CREATE TABLE `device_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `device_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `power` int NOT NULL,
  `milk_temperature` double NOT NULL,
  `boot_time` datetime(6) NOT NULL,
  `shutdown_time` datetime(6) NOT NULL,
  `spare1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `spare2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_log_c_time_e05fe490`(`c_time` ASC) USING BTREE,
  INDEX `device_log_u_time_57b86ad1`(`u_time` ASC) USING BTREE,
  INDEX `device_log_is_delete_f2532637`(`is_delete` ASC) USING BTREE,
  INDEX `device_log_device_id_769d437b`(`device_id` ASC) USING BTREE,
  INDEX `device_log_power_84aa8949`(`power` ASC) USING BTREE,
  INDEX `device_log_milk_temperature_6bb60a2b`(`milk_temperature` ASC) USING BTREE,
  INDEX `device_log_boot_time_17c4f51c`(`boot_time` ASC) USING BTREE,
  INDEX `device_log_shutdown_time_22f059b0`(`shutdown_time` ASC) USING BTREE,
  INDEX `device_log_spare1_62bfead3`(`spare1` ASC) USING BTREE,
  INDEX `device_log_spare2_77c87522`(`spare2` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_tb_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 461 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-10-24 13:03:00.747395', '1', '康盛牧业', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-10-24 13:33:51.172685', '1', '1001', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-10-24 13:34:09.670565', '1', '101', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-10-24 13:34:38.170243', '1', 'FeedingStandard object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-10-24 14:21:20.980855', '1', '101', 2, '[{\"changed\": {\"fields\": [\"\\u5907\\u6ce8\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-10-26 14:46:34.145424', '1', '100001', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-10-26 14:47:09.784347', '1', '100001-101', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-10-26 14:47:32.752969', '2', '1002', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-10-26 14:47:42.534210', '3', '1003', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-10-27 02:43:12.952523', '2', 'FeedingStandard object (2)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-10-27 02:43:23.030199', '3', 'FeedingStandard object (3)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-10-27 02:43:29.694628', '4', 'FeedingStandard object (4)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-10-27 02:43:41.434274', '5', 'FeedingStandard object (5)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-10-27 02:44:46.254666', '6', 'FeedingStandard object (6)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-11-15 08:38:17.237457', '1', '0000000001b1010100000490', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-11-15 08:38:27.149541', '2', '0000000001b1010100000491', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-11-15 08:38:49.262075', '2', '7516060001b1010100000001', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-11-15 08:38:53.786157', '1', '7516060001b1010100000002', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-11-15 08:38:59.398803', '3', '7516060001b1010100000003', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-11-15 08:39:03.735417', '4', '7516060001b1010100000004', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-11-15 08:39:09.137946', '5', '7516060001b1010100000005', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-11-15 08:39:40.153697', '6', '7516060001b1010100000006', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-11-15 08:39:45.571237', '7', '7516060001b1010100000007', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-11-15 08:39:50.193351', '8', '7516060001b1010100000008', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-11-15 08:39:55.967344', '9', '7516060001b1010100000009', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-11-15 08:40:01.928125', '10', '7516060001b1010100000010', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (27, '2023-11-15 08:43:54.367434', '1', '1', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\", \"\\u533a\\u57df\", \"\\u533a\\u53f7\", \"\\u5907\\u6ce8\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (28, '2023-11-15 08:44:08.936529', '2', '2', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (29, '2023-11-15 08:44:15.360091', '3', '3', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (30, '2023-11-15 08:44:22.982405', '4', '4', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (31, '2023-11-15 08:44:29.575886', '5', '5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (32, '2023-11-15 08:44:35.105254', '6', '6', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (33, '2023-11-15 08:45:34.658980', '7', '7', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (34, '2023-11-15 08:45:44.130810', '8', '8', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (35, '2023-11-15 08:45:52.041851', '9', '9', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (36, '2023-11-15 08:46:04.515256', '10', '10', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (37, '2023-11-15 08:48:42.688095', '1', '1001', 2, '[{\"changed\": {\"fields\": [\"\\u51fa\\u751f\\u65e5\\u671f\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (38, '2023-11-15 08:48:49.734623', '2', '1002', 2, '[{\"changed\": {\"fields\": [\"\\u51fa\\u751f\\u65e5\\u671f\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (39, '2023-11-15 08:48:54.354599', '3', '1003', 2, '[{\"changed\": {\"fields\": [\"\\u51fa\\u751f\\u65e5\\u671f\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (40, '2023-11-15 08:52:13.355300', '4', '1005', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (41, '2023-11-15 08:52:23.466351', '5', '1004', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (42, '2023-11-15 08:57:04.672124', '10', '10', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (43, '2023-11-15 08:57:13.955884', '9', '9', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (44, '2023-11-15 08:57:17.028709', '8', '8', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (45, '2023-11-15 08:57:21.004367', '7', '7', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (46, '2023-11-15 08:57:24.224262', '6', '6', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (47, '2023-11-15 08:57:27.382085', '5', '5', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (48, '2023-11-15 08:57:29.987918', '4', '4', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (49, '2023-11-15 08:57:32.624220', '3', '3', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (50, '2023-11-15 08:57:35.652914', '2', '2', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (51, '2023-11-15 08:57:38.388887', '1', '1', 2, '[{\"changed\": {\"fields\": [\"\\u533a\\u57df\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (52, '2023-11-16 06:22:00.157169', '1', '7516060001b1010100000002-2', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u7b3c\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (53, '2023-11-22 05:41:24.171308', '1', '1001-1', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (54, '2023-11-22 05:41:28.339275', '2', '1002-2', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (55, '2023-11-22 05:47:14.477895', '2', '7516060001b1010100000003-3', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (56, '2023-11-22 05:47:23.473371', '3', '7516060001b1010100000004-4', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (57, '2023-11-22 05:47:49.906980', '7', 'FeedingStandard object (7)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (58, '2023-11-22 06:05:19.555552', '3', '1003-3', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (59, '2023-11-23 09:01:05.515160', '1', 'FeedingStandard object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (60, '2023-11-23 09:01:15.401591', '3', 'FeedingStandard object (3)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (61, '2023-11-23 09:01:25.680006', '4', 'FeedingStandard object (4)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (62, '2023-11-23 09:01:34.756081', '5', 'FeedingStandard object (5)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (63, '2023-11-23 09:01:47.999164', '6', 'FeedingStandard object (6)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (64, '2023-11-23 09:01:57.889313', '7', 'FeedingStandard object (7)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (65, '2023-11-23 09:02:08.787249', '8', 'FeedingStandard object (8)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (66, '2023-11-23 09:08:42.408648', '9', 'FeedingStandard object (9)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (67, '2023-11-23 09:08:53.845573', '10', 'FeedingStandard object (10)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (68, '2023-11-23 09:09:24.433502', '11', 'FeedingStandard object (11)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (69, '2023-11-23 09:09:38.955307', '12', 'FeedingStandard object (12)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (70, '2023-11-23 09:10:49.451343', '13', 'FeedingStandard object (13)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (71, '2023-11-23 09:10:58.268831', '14', 'FeedingStandard object (14)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (72, '2023-11-23 09:11:05.126142', '15', 'FeedingStandard object (15)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (73, '2023-11-23 09:11:11.677575', '16', 'FeedingStandard object (16)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (74, '2023-11-23 09:11:25.176986', '17', 'FeedingStandard object (17)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (75, '2023-11-23 09:11:31.310288', '18', 'FeedingStandard object (18)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (76, '2023-11-23 09:11:39.235166', '19', 'FeedingStandard object (19)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (77, '2023-11-23 09:12:34.996952', '20', 'FeedingStandard object (20)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (78, '2023-11-23 09:12:38.077975', '20', 'FeedingStandard object (20)', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (79, '2023-11-23 09:12:52.817759', '21', 'FeedingStandard object (21)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (80, '2023-11-23 09:13:01.325989', '22', 'FeedingStandard object (22)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (81, '2023-11-23 09:13:11.834345', '23', 'FeedingStandard object (23)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (82, '2023-11-23 09:13:20.700206', '24', 'FeedingStandard object (24)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (83, '2023-11-23 09:13:27.035598', '25', 'FeedingStandard object (25)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (84, '2023-11-23 09:13:33.906050', '26', 'FeedingStandard object (26)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (85, '2023-11-23 09:13:39.686115', '27', 'FeedingStandard object (27)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (86, '2023-11-23 09:13:46.149072', '28', 'FeedingStandard object (28)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (87, '2023-11-23 09:13:54.148970', '29', 'FeedingStandard object (29)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (88, '2023-11-23 09:14:00.800490', '30', 'FeedingStandard object (30)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (89, '2023-11-23 09:14:06.885085', '31', 'FeedingStandard object (31)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (90, '2023-11-23 09:14:13.317713', '32', 'FeedingStandard object (32)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (91, '2023-11-23 09:14:20.263358', '33', 'FeedingStandard object (33)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (92, '2023-11-23 09:14:26.758785', '34', 'FeedingStandard object (34)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (93, '2023-11-23 09:14:33.716250', '35', 'FeedingStandard object (35)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (94, '2023-11-23 09:14:45.907793', '36', 'FeedingStandard object (36)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (95, '2023-11-23 09:14:52.873749', '37', 'FeedingStandard object (37)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (96, '2023-11-23 09:14:59.230416', '38', 'FeedingStandard object (38)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (97, '2023-11-23 09:15:05.470462', '39', 'FeedingStandard object (39)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (98, '2023-11-23 09:15:13.202604', '40', 'FeedingStandard object (40)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (99, '2023-11-23 09:15:19.423380', '41', 'FeedingStandard object (41)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (100, '2023-11-23 09:15:26.410971', '42', 'FeedingStandard object (42)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (101, '2023-11-23 09:15:32.335660', '43', 'FeedingStandard object (43)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (102, '2023-11-23 09:15:40.491594', '44', 'FeedingStandard object (44)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (103, '2023-11-23 09:15:47.236919', '45', 'FeedingStandard object (45)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (104, '2023-11-23 09:15:52.813098', '46', 'FeedingStandard object (46)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (105, '2023-11-23 09:15:58.940309', '47', 'FeedingStandard object (47)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (106, '2023-11-23 09:16:05.581319', '48', 'FeedingStandard object (48)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (107, '2023-11-23 09:16:12.055384', '49', 'FeedingStandard object (49)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (108, '2023-11-23 09:16:19.168018', '50', 'FeedingStandard object (50)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (109, '2023-11-23 09:19:53.141448', '51', 'FeedingStandard object (51)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (110, '2023-11-23 09:19:57.879370', '52', 'FeedingStandard object (52)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (111, '2023-11-23 09:20:03.235237', '53', 'FeedingStandard object (53)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (112, '2023-11-23 09:20:08.066788', '54', 'FeedingStandard object (54)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (113, '2023-11-23 09:20:13.046740', '55', 'FeedingStandard object (55)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (114, '2023-11-23 09:20:19.199315', '56', 'FeedingStandard object (56)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (115, '2023-11-23 09:20:24.667649', '57', 'FeedingStandard object (57)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (116, '2023-11-23 09:20:29.175628', '58', 'FeedingStandard object (58)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (117, '2023-11-23 09:20:34.008150', '59', 'FeedingStandard object (59)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (118, '2023-11-23 09:20:41.796089', '60', 'FeedingStandard object (60)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (119, '2023-11-23 09:21:25.606688', '61', 'FeedingStandard object (61)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (120, '2023-11-23 09:22:23.474176', '62', 'FeedingStandard object (62)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (121, '2023-11-23 09:23:02.185798', '63', 'FeedingStandard object (63)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (122, '2023-11-23 09:23:10.028070', '64', 'FeedingStandard object (64)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (123, '2023-11-23 09:23:15.401891', '65', 'FeedingStandard object (65)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (124, '2023-11-23 09:23:31.532394', '66', 'FeedingStandard object (66)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (125, '2023-11-23 09:23:47.202255', '67', 'FeedingStandard object (67)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (126, '2023-11-23 09:23:57.970657', '68', 'FeedingStandard object (68)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (127, '2023-11-23 09:24:15.925796', '69', 'FeedingStandard object (69)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (128, '2023-11-23 09:24:24.763255', '70', 'FeedingStandard object (70)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (129, '2023-11-23 13:32:30.845498', '4', '1004-4', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (130, '2023-11-23 13:40:06.175501', '4', '7516060001b1010100000005-5', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (131, '2023-11-23 13:40:15.659854', '5', '1005-5', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (132, '2023-11-23 13:43:06.822548', '7', '1006', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (133, '2023-11-23 13:43:17.859563', '5', '7516060001b1010100000006-6', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (134, '2023-11-23 13:43:26.087313', '6', '1006-6', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (135, '2023-11-24 02:05:29.745751', '8', '1007', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (136, '2023-11-24 02:17:32.444458', '9', '1008', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (137, '2023-11-24 10:24:13.588800', '10', '1009', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (138, '2023-11-24 10:25:09.268867', '7', '1007-7', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (139, '2023-11-24 10:52:34.618468', '6', '7516060001b1010100000007-7', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (140, '2023-11-24 10:52:40.843962', '7', '7516060001b1010100000008-8', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (141, '2023-11-28 15:56:49.177051', '8', '1008-8', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (142, '2023-11-28 16:54:33.790615', '12', '7516060001b1010100000490', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (143, '2023-11-28 16:54:50.731215', '13', '7516060001b1010100000491', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (144, '2023-11-28 16:54:56.451147', '14', '7516060001b1010100000492', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (145, '2023-11-28 16:54:58.468099', '14', '7516060001b1010100000493', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (146, '2023-11-28 16:55:03.263705', '14', '7516060001b1010100000494', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (147, '2023-11-28 16:55:06.211569', '14', '7516060001b1010100000495', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (148, '2023-11-28 16:55:08.285615', '14', '7516060001b1010100000496', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (149, '2023-11-28 16:55:10.315244', '14', '7516060001b1010100000497', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (150, '2023-11-28 16:55:12.532345', '14', '7516060001b1010100000498', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (151, '2023-11-28 16:55:15.431006', '14', '7516060001b1010100000499', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (152, '2023-11-28 16:55:18.838420', '14', '7516060001b1010100000500', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (153, '2023-11-28 16:55:45.324766', '11', '490', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (154, '2023-11-28 16:55:49.055364', '11', '491', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (155, '2023-11-28 16:55:51.166051', '11', '492', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (156, '2023-11-28 16:55:53.316853', '11', '493', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (157, '2023-11-28 16:55:55.366241', '11', '494', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (158, '2023-11-28 16:55:58.501751', '11', '495', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (159, '2023-11-28 16:56:00.616131', '11', '496', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (160, '2023-11-28 16:56:03.360373', '11', '497', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (161, '2023-11-28 16:56:05.863931', '11', '498', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (162, '2023-11-28 16:56:08.559670', '11', '499', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (163, '2023-11-28 16:56:11.372584', '11', '500', 2, '[{\"changed\": {\"fields\": [\"\\u7b3c\\u53f7\\u7f16\\u7801\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (164, '2023-11-28 16:56:43.482048', '11', '500', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (165, '2023-11-28 16:56:54.314034', '11', '500', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (166, '2023-11-28 16:57:04.944046', '12', '499', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (167, '2023-11-28 16:57:13.634464', '13', '498', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (168, '2023-11-28 16:57:21.938967', '14', '497', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (169, '2023-11-28 16:57:30.562854', '15', '496', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (170, '2023-11-28 16:57:39.445239', '16', '495', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (171, '2023-11-28 16:57:47.531224', '17', '494', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (172, '2023-11-28 16:57:55.643049', '18', '493', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (173, '2023-11-28 16:58:04.012971', '19', '492', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (174, '2023-11-28 16:58:12.246199', '20', '491', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (175, '2023-11-28 16:58:20.200048', '21', '490', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (176, '2023-11-28 16:58:42.461981', '15', '7516060001b1010100000492', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (177, '2023-11-28 16:58:47.039627', '16', '7516060001b1010100000493', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (178, '2023-11-28 16:58:51.939568', '17', '7516060001b1010100000494', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (179, '2023-11-28 16:58:57.761894', '18', '7516060001b1010100000495', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (180, '2023-11-28 16:59:02.564114', '19', '7516060001b1010100000496', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (181, '2023-11-28 16:59:06.883715', '20', '7516060001b1010100000497', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (182, '2023-11-28 16:59:12.167250', '21', '7516060001b1010100000498', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (183, '2023-11-28 16:59:16.991258', '22', '7516060001b1010100000499', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (184, '2023-11-28 17:00:37.813852', '8', '7516060001b1010100000490-490', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (185, '2023-11-28 17:00:46.739183', '9', '7516060001b1010100000491-491', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (186, '2023-11-28 17:00:53.291846', '10', '7516060001b1010100000492-492', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (187, '2023-11-28 17:00:57.731293', '11', '7516060001b1010100000493-493', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (188, '2023-11-28 17:01:02.834050', '12', '7516060001b1010100000494-494', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (189, '2023-11-28 17:01:07.715019', '13', '7516060001b1010100000495-495', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (190, '2023-11-28 17:01:13.657914', '14', '7516060001b1010100000496-496', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (191, '2023-11-28 17:01:18.250282', '15', '7516060001b1010100000497-497', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (192, '2023-11-28 17:01:24.822940', '16', '7516060001b1010100000498-498', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (193, '2023-11-28 17:01:29.873860', '17', '7516060001b1010100000499-499', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (194, '2023-11-28 17:01:34.543257', '18', '7516060001b1010100000500-500', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (195, '2023-11-28 17:01:55.252596', '11', '1500', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (196, '2023-11-28 17:02:06.249354', '12', '1499', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (197, '2023-11-28 17:02:15.911424', '13', '1498', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (198, '2023-11-28 17:02:21.385486', '14', '1497', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (199, '2023-11-28 17:02:26.944734', '15', '1496', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (200, '2023-11-28 17:02:31.365892', '16', '1495', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (201, '2023-11-28 17:02:38.023348', '17', '1494', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (202, '2023-11-28 17:02:43.393569', '18', '1493', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (203, '2023-11-28 17:02:47.458191', '19', '1492', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (204, '2023-11-28 17:02:51.383759', '20', '1491', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (205, '2023-11-28 17:02:56.952495', '21', '1490', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (206, '2023-11-28 17:03:09.262932', '9', '1500-500', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (207, '2023-11-28 17:03:13.916491', '10', '1499-499', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (208, '2023-11-28 17:03:18.471442', '11', '1498-498', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (209, '2023-11-28 17:03:23.135293', '12', '1497-497', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (210, '2023-11-28 17:03:27.889451', '13', '1496-496', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (211, '2023-11-28 17:03:33.227154', '14', '1495-495', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (212, '2023-11-28 17:03:37.930387', '15', '1494-494', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (213, '2023-11-28 17:03:42.143764', '16', '1493-493', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (214, '2023-11-28 17:03:46.753425', '17', '1492-492', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (215, '2023-11-28 17:03:52.558834', '18', '1491-491', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (216, '2023-11-28 17:03:58.203231', '19', '1490-490', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (217, '2023-11-28 17:12:21.415958', '76', 'FeedingStandard object (76)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (218, '2023-11-28 17:46:13.574787', '76', 'FeedingStandard object (76)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (219, '2023-11-28 17:46:40.868339', '70', 'FeedingStandard object (70)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (220, '2023-11-28 22:16:20.276513', '8', '1008-8', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (221, '2023-11-29 21:37:37.240580', '1', '1001-1', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (222, '2023-11-29 21:37:37.246166', '2', '1002-2', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (223, '2023-11-29 21:37:37.251838', '3', '1003-3', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (224, '2023-11-29 21:37:37.256775', '5', '1005-5', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (225, '2023-11-29 21:37:37.262401', '4', '1004-4', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (226, '2023-11-29 21:37:37.267936', '6', '1006-6', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (227, '2023-11-29 21:37:37.272811', '7', '1007-7', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (228, '2023-11-29 21:41:42.498837', '1', '7516060001b1010100000002-0002', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u7b3c\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (229, '2023-11-29 21:41:56.200606', '2', '7516060001b1010100000003-0003', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u7b3c\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (230, '2023-11-29 21:42:04.036151', '3', '7516060001b1010100000004-0004', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u7b3c\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (231, '2023-11-29 21:42:09.190395', '4', '7516060001b1010100000005-0005', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u7b3c\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (232, '2023-11-29 21:48:35.740014', '2', 'HBTEST', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (233, '2023-11-29 21:49:18.439526', '10', '10', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (234, '2023-11-29 21:49:18.445453', '9', '9', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (235, '2023-11-29 21:49:18.450967', '8', '8', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (236, '2023-11-29 21:49:18.455733', '7', '7', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (237, '2023-11-29 21:49:18.464189', '6', '6', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (238, '2023-11-29 21:49:18.469830', '5', '5', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (239, '2023-11-29 21:49:18.475633', '4', '4', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (240, '2023-11-29 21:49:18.480447', '3', '3', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (241, '2023-11-29 21:49:18.486076', '2', '2', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (242, '2023-11-29 21:49:18.491495', '1', '1', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (243, '2023-11-29 21:49:49.371052', '2', '1002', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (244, '2023-11-29 21:49:49.378067', '3', '1003', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (245, '2023-11-29 21:49:49.382961', '5', '1004', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (246, '2023-11-29 21:49:49.387826', '4', '1005', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (247, '2023-11-29 21:49:49.392681', '7', '1006', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (248, '2023-11-29 21:49:49.398350', '8', '1007', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (249, '2023-11-29 21:49:49.403917', '9', '1008', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (250, '2023-11-29 21:49:49.408825', '10', '1009', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (251, '2023-11-29 21:50:10.125873', '1', '1001', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (252, '2023-11-29 21:50:22.486667', '430', '751001', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (253, '2023-11-29 21:51:03.996089', '450', 'HBTEST1', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (254, '2023-11-29 21:51:45.027472', '430', 'HBTEST751001', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (255, '2023-11-29 21:52:03.779432', '1', 'HBTEST1001', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u8033\\u6807ID\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (256, '2023-11-29 22:15:11.511493', '430', 'HBTEST789123456789751001', 2, '[{\"changed\": {\"fields\": [\"RFID\\u5361\\u53f7\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (257, '2023-11-30 10:38:06.308242', '22', '7516060001b1010100000499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (258, '2023-11-30 10:38:11.697622', '21', '7516060001b1010100000498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (259, '2023-11-30 10:38:15.039092', '20', '7516060001b1010100000497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (260, '2023-11-30 10:38:17.968179', '19', '7516060001b1010100000496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (261, '2023-11-30 10:38:21.180669', '19', '7516060001b1010100000496', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (262, '2023-11-30 10:38:24.008413', '18', '7516060001b1010100000495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (263, '2023-11-30 10:38:26.911498', '17', '7516060001b1010100000494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (264, '2023-11-30 10:38:30.076409', '16', '7516060001b1010100000493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (265, '2023-11-30 10:38:32.898660', '15', '7516060001b1010100000492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (266, '2023-11-30 10:38:37.645793', '14', '7516060001b1010100000500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (267, '2023-11-30 10:38:41.198009', '13', '7516060001b1010100000491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (268, '2023-11-30 10:38:43.579444', '12', '7516060001b1010100000490', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (269, '2023-11-30 10:38:47.019154', '12', '7516060001b1010100000490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (270, '2023-11-30 10:39:43.090188', '21', '490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (271, '2023-11-30 10:39:47.220737', '21', '490', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (272, '2023-11-30 10:39:50.991549', '20', '491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (273, '2023-11-30 10:39:54.436847', '19', '492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (274, '2023-11-30 10:39:57.926856', '18', '493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (275, '2023-11-30 10:40:01.673327', '17', '494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (276, '2023-11-30 10:40:05.503676', '16', '495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (277, '2023-11-30 10:40:08.975242', '16', '495', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (278, '2023-11-30 10:40:12.689450', '15', '496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (279, '2023-11-30 10:40:18.165586', '14', '497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (280, '2023-11-30 10:40:20.800299', '15', '496', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (281, '2023-11-30 10:40:24.288589', '13', '498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (282, '2023-11-30 10:40:27.470672', '12', '499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (283, '2023-11-30 10:40:31.297279', '11', '500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (284, '2023-11-30 10:41:17.599869', '21', '1490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (285, '2023-11-30 10:41:22.609233', '20', '1491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (286, '2023-11-30 10:41:26.505672', '19', '1492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (287, '2023-11-30 10:41:31.694108', '19', '1492', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (288, '2023-11-30 10:41:36.261674', '18', '1493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (289, '2023-11-30 10:41:39.856656', '17', '1494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (290, '2023-11-30 10:41:43.684127', '16', '1495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (291, '2023-11-30 10:41:47.211221', '15', '1496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (292, '2023-11-30 10:41:51.893789', '14', '1497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (293, '2023-11-30 10:41:59.147730', '14', '1497', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (294, '2023-11-30 10:42:03.525266', '13', '1498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (295, '2023-11-30 10:42:07.982573', '14', '1497', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (296, '2023-11-30 10:42:11.950349', '13', '1498', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (297, '2023-11-30 10:42:16.997414', '13', '1498', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (298, '2023-11-30 10:42:21.332192', '12', '1499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (299, '2023-11-30 10:42:25.961133', '11', '1500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (300, '2023-11-30 17:50:24.816802', '13', '7516060001b1010100000491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (301, '2023-11-30 17:50:46.691593', '12', '7516060001b1010100000490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (302, '2023-11-30 17:50:56.663417', '14', '7516060001b1010100000500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (303, '2023-11-30 17:51:00.533852', '15', '7516060001b1010100000492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (304, '2023-11-30 17:51:03.529853', '16', '7516060001b1010100000493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (305, '2023-11-30 17:51:10.364908', '17', '7516060001b1010100000494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (306, '2023-11-30 17:51:13.296219', '17', '7516060001b1010100000494', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (307, '2023-11-30 17:51:16.140283', '18', '7516060001b1010100000495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (308, '2023-11-30 17:51:18.767045', '19', '7516060001b1010100000496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (309, '2023-11-30 17:51:22.146757', '19', '7516060001b1010100000496', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (310, '2023-11-30 17:51:24.706539', '20', '7516060001b1010100000497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (311, '2023-11-30 17:51:27.234893', '21', '7516060001b1010100000498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (312, '2023-11-30 17:51:29.179728', '21', '7516060001b1010100000498', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (313, '2023-11-30 17:51:31.492233', '22', '7516060001b1010100000499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (314, '2023-11-30 17:51:48.021504', '21', '1490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (315, '2023-11-30 17:51:53.285113', '21', '1490', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (316, '2023-11-30 17:51:59.709933', '19', '1492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (317, '2023-11-30 17:52:05.430846', '19', '1492', 2, '[]', 7, 1);
INSERT INTO `django_admin_log` VALUES (318, '2023-11-30 17:52:08.958151', '18', '1493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (319, '2023-11-30 17:52:12.921525', '17', '1494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (320, '2023-11-30 17:52:16.405939', '16', '1495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (321, '2023-11-30 17:52:19.624030', '15', '1496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (322, '2023-11-30 17:52:23.046975', '14', '1497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (323, '2023-11-30 17:52:26.321725', '13', '1498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (324, '2023-11-30 17:52:29.649036', '12', '1499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (325, '2023-11-30 17:52:33.511103', '11', '1500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (326, '2023-11-30 17:52:40.584001', '21', '490', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (327, '2023-11-30 17:52:43.238655', '20', '491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (328, '2023-11-30 17:52:48.461595', '19', '492', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (329, '2023-11-30 17:52:51.452243', '18', '493', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (330, '2023-11-30 17:52:55.926304', '17', '494', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (331, '2023-11-30 17:52:59.176005', '17', '494', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (332, '2023-11-30 17:53:02.583116', '16', '495', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (333, '2023-11-30 17:53:05.685951', '15', '496', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (334, '2023-11-30 17:53:08.298171', '15', '496', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (335, '2023-11-30 17:53:10.802441', '14', '497', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (336, '2023-11-30 17:53:13.594593', '13', '498', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (337, '2023-11-30 17:53:15.920348', '13', '498', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (338, '2023-11-30 17:53:18.789086', '12', '499', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (339, '2023-11-30 17:53:21.918927', '11', '500', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (340, '2023-11-30 18:11:49.225034', '20', '1491', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (341, '2023-12-02 15:23:20.009321', '3', 'FeedingStandard object (3)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (342, '2023-12-02 15:24:41.170550', '4', 'FeedingStandard object (4)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (343, '2023-12-02 15:42:44.530281', '69', 'FeedingStandard object (69)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (344, '2023-12-02 15:42:51.084095', '68', 'FeedingStandard object (68)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (345, '2023-12-02 15:42:55.369624', '67', 'FeedingStandard object (67)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (346, '2023-12-02 15:43:07.184418', '66', 'FeedingStandard object (66)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (347, '2023-12-02 15:43:14.771831', '65', 'FeedingStandard object (65)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (348, '2023-12-02 15:43:20.902420', '64', 'FeedingStandard object (64)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (349, '2023-12-02 15:43:24.707916', '63', 'FeedingStandard object (63)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (350, '2023-12-02 15:43:28.781733', '62', 'FeedingStandard object (62)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (351, '2023-12-02 15:43:32.285918', '61', 'FeedingStandard object (61)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (352, '2023-12-02 15:43:39.897796', '60', 'FeedingStandard object (60)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (353, '2023-12-02 15:44:17.503759', '59', 'FeedingStandard object (59)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (354, '2023-12-02 20:05:28.805609', '4', 'FeedingStandard object (4)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (355, '2023-12-04 18:00:32.573850', '431', 'HBTEST789123456789751002', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (356, '2023-12-04 18:00:37.479341', '432', 'HBTEST789123456789751003', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (357, '2023-12-04 18:00:41.805376', '433', 'HBTEST789123456789751004', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (358, '2023-12-04 18:00:46.105076', '434', 'HBTEST789123456789751005', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (359, '2023-12-04 18:09:09.319854', '451', 'HBTEST2', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (360, '2023-12-04 18:09:13.741021', '452', 'HBTEST3', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (361, '2023-12-04 18:09:19.363287', '453', 'HBTEST4', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (362, '2023-12-04 18:09:23.298068', '454', 'HBTEST5', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (363, '2023-12-04 19:36:23.272086', '307', '880105-HBTEST5', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (364, '2023-12-04 19:36:23.277781', '306', '880104-HBTEST4', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (365, '2023-12-04 19:36:23.283326', '305', '880103-HBTEST3', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (366, '2023-12-04 19:37:55.894081', '304', '880102-HBTEST2', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (367, '2023-12-04 21:04:40.425712', '311', '880102', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (368, '2023-12-05 11:06:20.191460', '1', 'FeedingStandard object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (369, '2023-12-05 11:06:42.007223', '2', 'FeedingStandard object (2)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (370, '2023-12-05 11:06:49.930692', '3', 'FeedingStandard object (3)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (371, '2023-12-05 11:07:10.781401', '4', 'FeedingStandard object (4)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (372, '2023-12-05 11:07:15.656841', '3', 'FeedingStandard object (3)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (373, '2023-12-05 11:07:19.796937', '2', 'FeedingStandard object (2)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (374, '2023-12-05 11:07:24.412939', '1', 'FeedingStandard object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (375, '2023-12-05 11:07:30.609439', '5', 'FeedingStandard object (5)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (376, '2023-12-05 11:07:39.806836', '6', 'FeedingStandard object (6)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (377, '2023-12-05 11:07:44.335526', '7', 'FeedingStandard object (7)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (378, '2023-12-05 11:07:49.911743', '8', 'FeedingStandard object (8)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (379, '2023-12-05 11:07:55.119387', '9', 'FeedingStandard object (9)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (380, '2023-12-05 11:08:00.064082', '10', 'FeedingStandard object (10)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (381, '2023-12-05 11:08:09.849362', '11', 'FeedingStandard object (11)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (382, '2023-12-05 11:08:14.093273', '12', 'FeedingStandard object (12)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (383, '2023-12-05 11:08:18.032860', '13', 'FeedingStandard object (13)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (384, '2023-12-05 11:08:23.816153', '14', 'FeedingStandard object (14)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (385, '2023-12-05 11:08:27.625530', '15', 'FeedingStandard object (15)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (386, '2023-12-05 11:08:36.635935', '16', 'FeedingStandard object (16)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (387, '2023-12-05 11:08:41.374876', '17', 'FeedingStandard object (17)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (388, '2023-12-05 11:08:45.944875', '18', 'FeedingStandard object (18)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (389, '2023-12-05 11:08:53.887829', '19', 'FeedingStandard object (19)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (390, '2023-12-05 11:09:04.730146', '20', 'FeedingStandard object (20)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (391, '2023-12-05 11:09:12.520108', '21', 'FeedingStandard object (21)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (392, '2023-12-05 11:09:18.160054', '22', 'FeedingStandard object (22)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (393, '2023-12-05 11:10:01.549974', '23', 'FeedingStandard object (23)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (394, '2023-12-05 11:10:09.754334', '24', 'FeedingStandard object (24)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (395, '2023-12-05 11:10:18.587201', '25', 'FeedingStandard object (25)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (396, '2023-12-05 11:10:33.792007', '26', 'FeedingStandard object (26)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (397, '2023-12-05 11:10:54.705952', '27', 'FeedingStandard object (27)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (398, '2023-12-05 11:11:00.572504', '28', 'FeedingStandard object (28)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (399, '2023-12-05 11:11:05.952820', '29', 'FeedingStandard object (29)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (400, '2023-12-05 11:11:10.244466', '30', 'FeedingStandard object (30)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (401, '2023-12-05 11:11:15.276111', '31', 'FeedingStandard object (31)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (402, '2023-12-05 11:11:20.370516', '32', 'FeedingStandard object (32)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (403, '2023-12-05 11:11:24.598250', '33', 'FeedingStandard object (33)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (404, '2023-12-05 11:11:29.977695', '34', 'FeedingStandard object (34)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (405, '2023-12-05 11:11:34.893710', '35', 'FeedingStandard object (35)', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (406, '2023-12-05 11:11:40.161013', '34', 'FeedingStandard object (34)', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (407, '2023-12-05 11:11:45.070556', '35', 'FeedingStandard object (35)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (408, '2023-12-05 11:11:50.122993', '36', 'FeedingStandard object (36)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (409, '2023-12-05 11:11:54.940854', '37', 'FeedingStandard object (37)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (410, '2023-12-05 11:11:59.090843', '38', 'FeedingStandard object (38)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (411, '2023-12-05 11:12:04.760449', '39', 'FeedingStandard object (39)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (412, '2023-12-05 11:12:14.315115', '40', 'FeedingStandard object (40)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (413, '2023-12-05 11:12:19.494335', '41', 'FeedingStandard object (41)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (414, '2023-12-05 11:12:24.717114', '42', 'FeedingStandard object (42)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (415, '2023-12-05 11:12:28.766309', '43', 'FeedingStandard object (43)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (416, '2023-12-05 11:12:37.868246', '44', 'FeedingStandard object (44)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (417, '2023-12-05 11:12:42.652637', '45', 'FeedingStandard object (45)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (418, '2023-12-05 11:12:47.031024', '46', 'FeedingStandard object (46)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (419, '2023-12-05 11:12:51.925551', '47', 'FeedingStandard object (47)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (420, '2023-12-05 11:12:57.219869', '48', 'FeedingStandard object (48)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (421, '2023-12-05 11:13:01.756257', '49', 'FeedingStandard object (49)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (422, '2023-12-05 11:13:08.373262', '50', 'FeedingStandard object (50)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (423, '2023-12-05 11:13:13.044475', '51', 'FeedingStandard object (51)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (424, '2023-12-05 11:13:17.162180', '52', 'FeedingStandard object (52)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (425, '2023-12-05 11:14:25.112941', '53', 'FeedingStandard object (53)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (426, '2023-12-05 11:14:31.176717', '54', 'FeedingStandard object (54)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (427, '2023-12-05 11:14:35.580722', '55', 'FeedingStandard object (55)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (428, '2023-12-05 11:14:39.472675', '56', 'FeedingStandard object (56)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (429, '2023-12-05 11:14:44.324639', '57', 'FeedingStandard object (57)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (430, '2023-12-05 11:14:48.697052', '58', 'FeedingStandard object (58)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (431, '2023-12-05 11:15:08.282229', '59', 'FeedingStandard object (59)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (432, '2023-12-05 11:15:13.026991', '60', 'FeedingStandard object (60)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (433, '2023-12-05 11:15:47.004234', '61', 'FeedingStandard object (61)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (434, '2023-12-05 11:15:53.458839', '62', 'FeedingStandard object (62)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (435, '2023-12-05 11:15:56.895162', '63', 'FeedingStandard object (63)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (436, '2023-12-05 11:16:05.439064', '64', 'FeedingStandard object (64)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (437, '2023-12-05 11:16:09.331824', '65', 'FeedingStandard object (65)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (438, '2023-12-05 11:16:23.351231', '62', 'FeedingStandard object (62)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (439, '2023-12-05 11:16:31.341001', '63', 'FeedingStandard object (63)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (440, '2023-12-05 11:16:41.271370', '64', 'FeedingStandard object (64)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (441, '2023-12-05 11:16:58.139974', '65', 'FeedingStandard object (65)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (442, '2023-12-05 11:17:40.065295', '67', 'FeedingStandard object (67)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\", \"\\u9972\\u5582\\u6bd4\\u4f8b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (443, '2023-12-05 11:18:32.095126', '68', 'FeedingStandard object (68)', 2, '[{\"changed\": {\"fields\": [\"\\u9972\\u5582\\u6bd4\\u4f8b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (444, '2023-12-05 11:18:49.033150', '69', 'FeedingStandard object (69)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\", \"\\u9972\\u5582\\u6bd4\\u4f8b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (445, '2023-12-05 11:18:57.255620', '70', 'FeedingStandard object (70)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\", \"\\u9972\\u5582\\u6bd4\\u4f8b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (446, '2023-12-05 11:20:20.925558', '76', 'FeedingStandard object (76)', 2, '[{\"changed\": {\"fields\": [\"\\u603b\\u9972\\u5582\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (447, '2023-12-06 13:03:15.346376', '11', '7516060001b2010100000010', 2, '[{\"changed\": {\"fields\": [\"\\u7267\\u573a\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (448, '2023-12-06 14:15:21.500588', '316', '1500', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (449, '2023-12-06 14:20:39.201734', '2', '1500', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (450, '2023-12-06 14:20:39.207753', '1', '880103', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (451, '2023-12-06 15:45:12.936199', '317', '1500', 2, '[{\"changed\": {\"fields\": [\"\\u51fa\\u751f\\u65e5\\u671f\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (452, '2023-12-06 15:50:51.844414', '3', '1500', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (453, '2023-12-06 16:00:24.169020', '4', '1500', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (454, '2023-12-06 16:09:04.169194', '5', '1500', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (455, '2023-12-06 20:39:29.278928', '319', '15000', 2, '[{\"changed\": {\"fields\": [\"\\u728a\\u725b\\u8033\\u6807ID\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (456, '2023-12-08 18:10:53.434808', '7', '15000', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (457, '2023-12-08 18:10:53.440544', '6', '880102', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (458, '2023-12-09 15:27:56.190974', '8', '880101', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (459, '2023-12-09 20:34:52.283309', '9', '880104', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (460, '2023-12-09 21:25:33.460245', '10', '1500', 3, '', 18, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (14, 'users', 'user');
INSERT INTO `django_content_type` VALUES (19, 'WebCloud', 'autohistorydata');
INSERT INTO `django_content_type` VALUES (6, 'WebCloud', 'cage');
INSERT INTO `django_content_type` VALUES (7, 'WebCloud', 'calf');
INSERT INTO `django_content_type` VALUES (13, 'WebCloud', 'calfcage');
INSERT INTO `django_content_type` VALUES (16, 'WebCloud', 'dataupdatestatus');
INSERT INTO `django_content_type` VALUES (17, 'WebCloud', 'devicelog');
INSERT INTO `django_content_type` VALUES (12, 'WebCloud', 'feedingstandard');
INSERT INTO `django_content_type` VALUES (11, 'WebCloud', 'historydata');
INSERT INTO `django_content_type` VALUES (8, 'WebCloud', 'pasture');
INSERT INTO `django_content_type` VALUES (20, 'WebCloud', 'rationhistorydata');
INSERT INTO `django_content_type` VALUES (15, 'WebCloud', 'remainingmilk');
INSERT INTO `django_content_type` VALUES (9, 'WebCloud', 'rfid');
INSERT INTO `django_content_type` VALUES (10, 'WebCloud', 'rfidcage');
INSERT INTO `django_content_type` VALUES (18, 'WebCloud', 'unlinkcalf');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'WebCloud', '0001_initial', '2023-10-24 09:56:57.973119');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2023-10-24 09:56:58.012915');
INSERT INTO `django_migrations` VALUES (3, 'contenttypes', '0002_remove_content_type_name', '2023-10-24 09:56:58.082924');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0001_initial', '2023-10-24 09:56:58.297807');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2023-10-24 09:56:58.344873');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0003_alter_user_email_max_length', '2023-10-24 09:56:58.356292');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0004_alter_user_username_opts', '2023-10-24 09:56:58.368009');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0005_alter_user_last_login_null', '2023-10-24 09:56:58.379636');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0006_require_contenttypes_0002', '2023-10-24 09:56:58.388182');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0007_alter_validators_add_error_messages', '2023-10-24 09:56:58.400698');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0008_alter_user_username_max_length', '2023-10-24 09:56:58.411948');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0009_alter_user_last_name_max_length', '2023-10-24 09:56:58.423288');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0010_alter_group_name_max_length', '2023-10-24 09:56:58.442882');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0011_update_proxy_permissions', '2023-10-24 09:56:58.465632');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0012_alter_user_first_name_max_length', '2023-10-24 09:56:58.476939');
INSERT INTO `django_migrations` VALUES (16, 'users', '0001_initial', '2023-10-24 09:56:58.781724');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0001_initial', '2023-10-24 09:56:58.899193');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0002_logentry_remove_auto_add', '2023-10-24 09:56:58.914310');
INSERT INTO `django_migrations` VALUES (19, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-24 09:56:58.928078');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2023-10-24 09:56:58.972300');
INSERT INTO `django_migrations` VALUES (21, 'WebCloud', '0002_calf_sex_alter_feedingstandard_unique_together', '2023-10-27 09:30:48.034110');
INSERT INTO `django_migrations` VALUES (22, 'WebCloud', '0003_remainingmilk', '2023-11-01 09:22:42.153995');
INSERT INTO `django_migrations` VALUES (23, 'WebCloud', '0004_alter_calf_adjusted_feeding_and_more', '2023-11-15 09:02:00.109862');
INSERT INTO `django_migrations` VALUES (24, 'WebCloud', '0005_dataupdatestatus', '2023-11-20 01:52:21.191254');
INSERT INTO `django_migrations` VALUES (25, 'WebCloud', '0006_remove_dataupdatestatus_c_time_and_more', '2023-11-20 02:23:30.003313');
INSERT INTO `django_migrations` VALUES (26, 'WebCloud', '0007_alter_dataupdatestatus_u_time', '2023-11-20 03:41:46.081383');
INSERT INTO `django_migrations` VALUES (27, 'WebCloud', '0008_devicelog', '2023-11-20 05:32:33.957916');
INSERT INTO `django_migrations` VALUES (28, 'WebCloud', '0009_calf_birth_weight_unlinkcalf', '2023-11-21 06:14:07.391080');
INSERT INTO `django_migrations` VALUES (29, 'WebCloud', '0010_rfidcage_bound_time', '2023-11-21 06:45:46.128948');
INSERT INTO `django_migrations` VALUES (30, 'WebCloud', '0011_alter_calfcage_cage_entry_time_and_more', '2023-12-05 09:24:28.922757');
INSERT INTO `django_migrations` VALUES (31, 'WebCloud', '0012_alter_unlinkcalf_date_unlink', '2023-12-05 16:13:06.078021');
INSERT INTO `django_migrations` VALUES (32, 'WebCloud', '0013_unlinkcalf_weight_day_add', '2023-12-05 16:14:50.139469');
INSERT INTO `django_migrations` VALUES (33, 'WebCloud', '0014_autohistorydata_rationhistorydata_delete_historydata', '2023-12-07 16:06:35.446861');
INSERT INTO `django_migrations` VALUES (34, 'WebCloud', '0015_autohistorydata_data_time_auto_and_more', '2023-12-11 10:21:09.722510');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5by2h57923trcqtlsqg8nvr49erdkheb', '.eJy9l02PmzAQhv9KxKGnfAA2NuyxrSr10EulVQ9lFY0_SOgSWNlwqFb578UkWyUO7Foh5JJJPON3mMcZbL96a2jq7brRUq1z4T14gTc_HWPAn2VpHOIPlJtqyauyVjlbmpDl0auXPyohi8_H2DOBLehtO5sGPKZZBAwRHwEOEI4h9qmUMpIk9CPEMEAgmPAxEpIkPCMkwwmPMJPSZ2BEd7JsdKv1-zX1StjJ1HuYpd5jm0Wn3rz9mrcPdxjMQM0yWPBc8UIenDvziNq4z-enaUOjMG4NCREdEDKlHFyNKg6eFYhdXq6MR3efq0MACPE4HNN6j3FMSRBcNTvW81AuRe3ns2sL2T8Zp8yF8QW-H9oDgS3-SzJeVI0YAfrnt-9fHabbgNvMX0zmlcpyMcz4PMwRs2NVNgyHSmyguE9j9mlmFi2MoTMRM4YhPpYSh410JNWFTk_rykptilHPfz4KMnhTO08xgmJTFnn5zKHIHDieBE9LckS1NknSp41i0pksNCYE35iEmkESUfOLICLHcN3muq7UXwE1OIA9jZ6e7E2qtznTvrd0SKjRpgjGsHwBXTfKpdHfIidn6F6ZzSnuVbtJLzt28X369_qOTd5Xm2IvMUgc95L_ofckeJtdJfA_WKdbgHSEeGeA1_G6OBy2MklCu9dmFBtD2qN9t1lxMgZbJqXIy42uoRSgXA5_9ozJYV5bt8304gSOepLFDHBneGCy4Jh3m1LcnfkpRpc5tcmpt7ksxAKK-uObkOR4QKW7xCx4telfNHPjW21U1bwML9NJjOPC3KboviZwKtReJWwPoP2Tt_8HAG_Dcg:1r9Ojt:3yge1NpmG7QTX4Y0KeeE3dR0hd6vRdw5F_uRPM8-GWk', '2023-12-16 20:04:53.684980');
INSERT INTO `django_session` VALUES ('8nnerdritpw3dwimyrbz771lqbp5idk1', '.eJy9l0uPmzAQgP9KxKGnPDBgY_bWhyr10EulVQ9lFQ1-JO4SWBk4VKv892KSrRIHWjeEXDKJZzzj-cb2xK_eGpp6u24qodeKew8e8uanYxmwZ1EYBf8JxaZcsrKotcqWxmR51FbLryUX-Yej7ZmDLVRb4zbkLMHYz1CUJBCRhHKEcCRQlkgZU-QTIQmEFHORSeCRL3kW-xRLwSQEUWic7kTRVK2vH6-pV8BOpN7DLPUe2yhV6s3br6pd3GFQgp5JWDClWS4Oyp1ZYmXU5_PTtIlxQFtBgjAecGRSOaganR80K-A7VayMpuo-VwcD4Pxx2KbVHu0yLYAz3eyynkW5JLWfz65NZP9klEJxo0O-H9gDyHb-XWQsLxs-AvT7pi7bxeGQkk7IwIgAfCOS2AwSHJtfJCTCIZBdinaNH80aV-3uK7eqqkv9i0MNw4UZnOFYJkcqNsybkrBLF9nRvn3-8mkMTS0Vd0DYmU3LzSETmwbu8zF7NzOHJaDQCZwZkYVsLCUGG-FIqjOdntaVmdoUyYVvqFU79y6nWXex_u88X86ZmPVtedj84567HiMJb9U8L_EI1k2Rq-KZQS4dIJ8YT0t3RLY2SdrXNQMSmxBxCGPYvUBVN9rlAniznJyae2Y2p6TX2032mOPuus--unonIf_v3qboMQaJY4_5Y3pPgrfpNujiz-cEIB0h3hngdbyCHqdJEncNCFMjCPW7ewAxMgabFIKrYlPVUHDQLn8K7RmTw7w2b5tpaF-IYU8wmkHUCYZMlIiyrr3T7g0WR-FlzMrErLZK5HwBef3vl6lg0YCX7lG5YOWmv2jmBb7a6LJ5GS7TiY1jYW6TdN8hcErUrhK2B6L9k7f_DUkyRIk:1rBwKA:9a2bopsMOaVe3XSVLjAP33NWsHmlr61Ay5Q6U5a4kv8', '2023-12-23 20:20:50.672278');
INSERT INTO `django_session` VALUES ('eix1wvl1ji7nbvdaes5as1i7mpvue3oz', '.eJy9l02PmzAQhv9KxKGnfAAG2-yxrSr10EulVQ-lWo0_SGgJrGw4VKv89zIkbROXdK2Q5JIJntcznsfGmbwET9C1m6fOavNUquAhiIL58ZgA-UPX6FDfoV43S9nUrSnFEiXLg9cuPzVKV28P2pMAG7CbfjaLJGdFCoLQkEASkYQDD5nWOtU0DlMiEoBICRUmRGmayYLSIslkmgitQwEYdKvrzvaxvr7kQQ1bnQcPszx47LPYPJj3X8t-cfvBAsysgIUsjaz03rnFJVp0n87P846lMe8NjQk7EwhL2bs6U-09K1Dbsl6hxw6fq70AlHo8r-m9B50wGpQ03VaMLMqnqN18dmkhu2_o1KVCXxSGsTsQucG_aCGrplMTQH_-8PG9x3QXcJ_5HWZemaJU5xmfyjwxe1blwvCoxAWajMWYvZnhpsUcBpMKNILIqZQkrLUnqUF6e1oXVupSTEfOfEo4HUwRo4khRJMxHKQpwydKqJ7CdFPatjE_FbTggfVYfVuyV6ve5UzH7paYMozNCExh-Qy27YzP8fytvDlD_8pcTmw02t9DPoGThKrwgDTI7kDItyaXEP9_tFvcgIjE8wb8I70nwSvdhdkr-3QNkJ4Q7wzwIl5ROBI0y9hwbaYcDe0bUnyKJJ2CrdBalfXatlArMD4tizvj5jAvrdtlGrmHkowk4wKSwcgIsyRcDj9KfOhUWUL-zWkxp92UulILqNrX-3ctkzNRhtZ7IZv1-Kbh_5TV2jTd8_ltOtJ4bsx1ih57CbwKdXeJuAN9ux_sfgGbO1rr:1qxQjB:lmUGZgg9j0oUwaXn8r1HVU5OLA6uqcJw1-Z_U_1Ax9A', '2023-11-13 11:46:41.750050');
INSERT INTO `django_session` VALUES ('mztc0d5aapc4o50llsvg2yfgpwt7xrcc', '.eJy9l0uPmzAQgP9KxKGnPDBgY_bWhyr10EulVQ9lFQ1-JO4SWBk4VKv892KSrRIHWjeEXDKJZzzj-cb2xK_eGpp6u24qodeKew8e8uanYxmwZ1EYBf8JxaZcsrKotcqWxmR51FbLryUX-Yej7ZmDLVRb4zbkLMHYz1CUJBCRhHKEcCRQlkgZU-QTIQmEFHORSeCRL3kW-xRLwSQEUWic7kTRVK2vH6-pV8BOpN7DLPUe2yhV6s3br6pd3GFQgp5JWDClWS4Oyp1ZYmXU5_PTtIlxQFtBgjAecGRSOaganR80K-A7VayMpuo-VwcD4Pxx2KbVHu0yLYAz3eyynkW5JLWfz65NZP9klEJxo0O-H9gDyHb-XWQsLxs-AvT7pi7bxeGQkk7IwIgAfCOS2AwSHJtfJCTCIZBdinaNH80aV-3uK7eqqkv9i0MNw4UZnOFYJkcqNsybkrBLF9nRvn3-8mkMTS0Vd0DYmU3LzSETmwbu8zF7NzOHJaDQCZwZkYVsLCUGG-FIqjOdntaVmdoUyYVvqFU79y6nWXex_u88X86ZmPVtedj84567HiMJb9U8L_EI1k2Rq-KZQS4dIJ8YT0t3RLY2SdrXNQMSmxBxCGPYvUBVN9rlAniznJyae2Y2p6TX2032mOPuus--unonIf_v3qboMQaJY4_5Y3pPgrfpNujiz-cEIB0h3hngdbyCHqdJEncNCFMjCPW7ewAxMgabFIKrYlPVUHDQLn8K7RmTw7w2b5tpaF-IYU8wmkHUCYZMlIiyrr3T7g0WR-FlzMrErLZK5HwBef3vl6lg0YCX7lG5YOWmv2jmBb7a6LJ5GS7TiY1jYW6TdN8hcErUrhK2B6L9k7f_DUkyRIk:1rCUjH:nuQIUcoqM_428j-lTh56sj63S9DUTP7jSGmCqGPoWQQ', '2023-12-25 09:05:03.192555');
INSERT INTO `django_session` VALUES ('r8n8850bt9jv3as8yqrbjhao2d98eu3a', '.eJy9l02PmzAQhv9KxKGnfAAG2-yxrSr10EulVQ-lWo0_SGgJrGw4VKv89zIkbROXdK2Q5JIJntcznsfGmbwET9C1m6fOavNUquAhiIL58ZgA-UPX6FDfoV43S9nUrSnFEiXLg9cuPzVKV28P2pMAG7CbfjaLJGdFCoLQkEASkYQDD5nWOtU0DlMiEoBICRUmRGmayYLSIslkmgitQwEYdKvrzvaxvr7kQQ1bnQcPszx47LPYPJj3X8t-cfvBAsysgIUsjaz03rnFJVp0n87P846lMe8NjQk7EwhL2bs6U-09K1Dbsl6hxw6fq70AlHo8r-m9B50wGpQ03VaMLMqnqN18dmkhu2_o1KVCXxSGsTsQucG_aCGrplMTQH_-8PG9x3QXcJ_5HWZemaJU5xmfyjwxe1blwvCoxAWajMWYvZnhpsUcBpMKNILIqZQkrLUnqUF6e1oXVupSTEfOfEo4HUwRo4khRJMxHKQpwydKqJ7CdFPatjE_FbTggfVYfVuyV6ve5UzH7paYMozNCExh-Qy27YzP8fytvDlD_8pcTmw02t9DPoGThKrwgDTI7kDItyaXEP9_tFvcgIjE8wb8I70nwSvdhdkr-3QNkJ4Q7wzwIl5ROBI0y9hwbaYcDe0bUnyKJJ2CrdBalfXatlArMD4tizvj5jAvrdtlGrmHkowk4wKSwcgIsyRcDj9KfOhUWUL-zWkxp92UulILqNrX-3ctkzNRhtZ7IZv1-Kbh_5TV2jTd8_ltOtJ4bsx1ih57CbwKdXeJuAN9ux_sfgGbO1rr:1qwBoG:P94Tle-v8w5uBUqCDAHpR4znn1peZJ5on-1ur1xLxQ0', '2023-11-10 01:38:48.815916');
INSERT INTO `django_session` VALUES ('zgwasgz0ulxd3dchk08fkl8wkudeh9r1', '.eJy9l02PmzAQhv9KxKGnfAAG2-yxrSr10EulVQ-lWo0_SGgJrGw4VKv89zIkbROXdK2Q5JIJntcznsfGmbwET9C1m6fOavNUquAhiIL58ZgA-UPX6FDfoV43S9nUrSnFEiXLg9cuPzVKV28P2pMAG7CbfjaLJGdFCoLQkEASkYQDD5nWOtU0DlMiEoBICRUmRGmayYLSIslkmgitQwEYdKvrzvaxvr7kQQ1bnQcPszx47LPYPJj3X8t-cfvBAsysgIUsjaz03rnFJVp0n87P846lMe8NjQk7EwhL2bs6U-09K1Dbsl6hxw6fq70AlHo8r-m9B50wGpQ03VaMLMqnqN18dmkhu2_o1KVCXxSGsTsQucG_aCGrplMTQH_-8PG9x3QXcJ_5HWZemaJU5xmfyjwxe1blwvCoxAWajMWYvZnhpsUcBpMKNILIqZQkrLUnqUF6e1oXVupSTEfOfEo4HUwRo4khRJMxHKQpwydKqJ7CdFPatjE_FbTggfVYfVuyV6ve5UzH7paYMozNCExh-Qy27YzP8fytvDlD_8pcTmw02t9DPoGThKrwgDTI7kDItyaXEP9_tFvcgIjE8wb8I70nwSvdhdkr-3QNkJ4Q7wzwIl5ROBI0y9hwbaYcDe0bUnyKJJ2CrdBalfXatlArMD4tizvj5jAvrdtlGrmHkowk4wKSwcgIsyRcDj9KfOhUWUL-zWkxp92UulILqNrX-3ctkzNRhtZ7IZv1-Kbh_5TV2jTd8_ltOtJ4bsx1ih57CbwKdXeJuAN9ux_sfgGbO1rr:1r2sUr:6IvSuadOeN4icCnyF9QwUzakVKUY7FM4qj2bditZrog', '2023-11-28 12:26:25.469634');

-- ----------------------------
-- Table structure for feeding_standard
-- ----------------------------
DROP TABLE IF EXISTS `feeding_standard`;
CREATE TABLE `feeding_standard`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feeding_age` smallint NOT NULL,
  `feeding_total_feeding` smallint NOT NULL,
  `feeding_up` smallint NOT NULL,
  `pasture_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `feeding_standard_feeding_age_pasture_id_ffc205b8_uniq`(`feeding_age` ASC, `pasture_id` ASC) USING BTREE,
  INDEX `feeding_standard_pasture_id_2dab806d_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `feeding_standard_feeding_age_469bbe16`(`feeding_age` ASC) USING BTREE,
  INDEX `feeding_standard_feeding_total_feeding_c4ffd41c`(`feeding_total_feeding` ASC) USING BTREE,
  INDEX `feeding_standard_feeding_up_21ea89de`(`feeding_up` ASC) USING BTREE,
  CONSTRAINT `feeding_standard_pasture_id_2dab806d_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feeding_standard
-- ----------------------------
INSERT INTO `feeding_standard` VALUES (1, 1, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (2, 2, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (3, 3, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (4, 4, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (5, 5, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (6, 6, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (7, 7, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (8, 8, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (9, 9, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (10, 10, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (11, 11, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (12, 12, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (13, 13, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (14, 14, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (15, 15, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (16, 16, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (17, 17, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (18, 18, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (19, 19, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (20, 20, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (21, 21, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (22, 22, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (23, 23, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (24, 24, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (25, 25, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (26, 26, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (27, 27, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (28, 28, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (29, 29, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (30, 30, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (31, 31, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (32, 32, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (33, 33, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (34, 34, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (35, 35, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (36, 36, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (37, 37, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (38, 38, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (39, 39, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (40, 40, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (41, 41, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (42, 42, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (43, 43, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (44, 44, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (45, 45, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (46, 46, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (47, 47, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (48, 48, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (49, 49, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (50, 50, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (51, 51, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (52, 52, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (53, 53, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (54, 54, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (55, 55, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (56, 56, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (57, 57, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (58, 58, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (59, 59, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (60, 60, 16, 50, 1);
INSERT INTO `feeding_standard` VALUES (61, 61, 14, 50, 1);
INSERT INTO `feeding_standard` VALUES (62, 62, 12, 50, 1);
INSERT INTO `feeding_standard` VALUES (63, 63, 10, 50, 1);
INSERT INTO `feeding_standard` VALUES (64, 64, 8, 50, 1);
INSERT INTO `feeding_standard` VALUES (65, 65, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (66, 66, 4, 50, 1);
INSERT INTO `feeding_standard` VALUES (67, 67, 2, 50, 1);
INSERT INTO `feeding_standard` VALUES (68, 68, 2, 50, 1);
INSERT INTO `feeding_standard` VALUES (69, 69, 2, 50, 1);
INSERT INTO `feeding_standard` VALUES (70, 70, 2, 50, 1);
INSERT INTO `feeding_standard` VALUES (76, 0, 6, 50, 1);
INSERT INTO `feeding_standard` VALUES (85, 1, 6, 51, 2);
INSERT INTO `feeding_standard` VALUES (86, 2, 6, 53, 2);
INSERT INTO `feeding_standard` VALUES (87, 3, 6, 50, 2);
INSERT INTO `feeding_standard` VALUES (92, 5, 12, 50, 2);
INSERT INTO `feeding_standard` VALUES (93, 6, 15, 50, 2);
INSERT INTO `feeding_standard` VALUES (94, 7, 18, 50, 2);
INSERT INTO `feeding_standard` VALUES (95, 8, 20, 50, 2);
INSERT INTO `feeding_standard` VALUES (96, 9, 22, 50, 2);
INSERT INTO `feeding_standard` VALUES (97, 10, 24, 50, 2);
INSERT INTO `feeding_standard` VALUES (98, 11, 25, 50, 2);
INSERT INTO `feeding_standard` VALUES (107, 4, 8, 52, 2);
INSERT INTO `feeding_standard` VALUES (108, 0, 20, 20, 2);

-- ----------------------------
-- Table structure for pasture
-- ----------------------------
DROP TABLE IF EXISTS `pasture`;
CREATE TABLE `pasture`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `district` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `pasture_c_time_81ea9472`(`c_time` ASC) USING BTREE,
  INDEX `pasture_u_time_aa1e0491`(`u_time` ASC) USING BTREE,
  INDEX `pasture_is_delete_00171115`(`is_delete` ASC) USING BTREE,
  INDEX `pasture_province_85a23083`(`province` ASC) USING BTREE,
  INDEX `pasture_city_16315793`(`city` ASC) USING BTREE,
  INDEX `pasture_district_3d1488f2`(`district` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pasture
-- ----------------------------
INSERT INTO `pasture` VALUES (1, '2023-10-24 13:03:00.740158', '2023-10-24 13:03:00.740192', 0, '康盛牧业', '宁夏回族自治区', '吴忠市', '青铜峡市', '青铜峡');
INSERT INTO `pasture` VALUES (2, '2023-11-29 21:48:35.733197', '2023-11-29 21:48:35.733219', 0, 'HBTEST', '宁夏回族自治区', '银川市', '市辖区', '');

-- ----------------------------
-- Table structure for ration_historydata
-- ----------------------------
DROP TABLE IF EXISTS `ration_historydata`;
CREATE TABLE `ration_historydata`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `rfid_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cage_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calf_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `day_of_birth` smallint NOT NULL,
  `area` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `area_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adjusted_feeding` smallint NOT NULL,
  `feeding_total_feeding` smallint NOT NULL,
  `temp` double NULL DEFAULT NULL,
  `mae` smallint NOT NULL,
  `pasture_id` bigint NULL DEFAULT NULL,
  `data_time_auto` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ration_historydata_pasture_id_4c02471f_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `ration_historydata_c_time_addfbffc`(`c_time` ASC) USING BTREE,
  INDEX `ration_historydata_u_time_3c7ac7f1`(`u_time` ASC) USING BTREE,
  INDEX `ration_historydata_is_delete_779d3fbe`(`is_delete` ASC) USING BTREE,
  CONSTRAINT `ration_historydata_pasture_id_4c02471f_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ration_historydata
-- ----------------------------

-- ----------------------------
-- Table structure for remaining_milk
-- ----------------------------
DROP TABLE IF EXISTS `remaining_milk`;
CREATE TABLE `remaining_milk`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `milk_volume` double NOT NULL,
  `pasture_id` bigint NOT NULL,
  `rfid_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `remaining_milk_pasture_id_eb52ffc2_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `remaining_milk_rfid_id_5fe92f84_fk_rfid_id`(`rfid_id` ASC) USING BTREE,
  INDEX `remaining_milk_c_time_7d8dacda`(`c_time` ASC) USING BTREE,
  INDEX `remaining_milk_u_time_75d66343`(`u_time` ASC) USING BTREE,
  INDEX `remaining_milk_is_delete_5cb628ba`(`is_delete` ASC) USING BTREE,
  INDEX `remaining_milk_date_fd3077d0`(`date` ASC) USING BTREE,
  INDEX `remaining_milk_milk_volume_82578e79`(`milk_volume` ASC) USING BTREE,
  CONSTRAINT `remaining_milk_pasture_id_eb52ffc2_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remaining_milk_rfid_id_5fe92f84_fk_rfid_id` FOREIGN KEY (`rfid_id`) REFERENCES `rfid` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of remaining_milk
-- ----------------------------

-- ----------------------------
-- Table structure for rfid
-- ----------------------------
DROP TABLE IF EXISTS `rfid`;
CREATE TABLE `rfid`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rfid_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_invalid` tinyint(1) NOT NULL,
  `pasture_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rfid_id`(`rfid_id` ASC) USING BTREE,
  INDEX `rfid_pasture_id_b37fd3d3_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `rfid_is_invalid_573b0000`(`is_invalid` ASC) USING BTREE,
  CONSTRAINT `rfid_pasture_id_b37fd3d3_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rfid
-- ----------------------------
INSERT INTO `rfid` VALUES (1, '7516060001b1010100000002', 0, 1);
INSERT INTO `rfid` VALUES (2, '7516060001b1010100000001', 0, 1);
INSERT INTO `rfid` VALUES (3, '7516060001b1010100000003', 0, 1);
INSERT INTO `rfid` VALUES (4, '7516060001b1010100000004', 0, 1);
INSERT INTO `rfid` VALUES (5, '7516060001b1010100000005', 0, 1);
INSERT INTO `rfid` VALUES (6, '7516060001b1010100000006', 0, 1);
INSERT INTO `rfid` VALUES (7, '7516060001b1010100000007', 0, 1);
INSERT INTO `rfid` VALUES (8, '7516060001b1010100000008', 0, 1);
INSERT INTO `rfid` VALUES (9, '7516060001b1010100000009', 0, 1);
INSERT INTO `rfid` VALUES (10, '7516060001b1010100000010', 0, 1);
INSERT INTO `rfid` VALUES (11, '7516060001b2010100000010', 0, 2);
INSERT INTO `rfid` VALUES (12, '7516060001b1010100000490', 0, 1);
INSERT INTO `rfid` VALUES (13, '7516060001b1010100000491', 0, 1);
INSERT INTO `rfid` VALUES (14, '7516060001b1010100000500', 0, 1);
INSERT INTO `rfid` VALUES (15, '7516060001b1010100000492', 0, 1);
INSERT INTO `rfid` VALUES (16, '7516060001b1010100000493', 0, 1);
INSERT INTO `rfid` VALUES (17, '7516060001b1010100000494', 0, 1);
INSERT INTO `rfid` VALUES (18, '7516060001b1010100000495', 0, 1);
INSERT INTO `rfid` VALUES (19, '7516060001b1010100000496', 0, 1);
INSERT INTO `rfid` VALUES (20, '7516060001b1010100000497', 0, 1);
INSERT INTO `rfid` VALUES (21, '7516060001b1010100000498', 0, 1);
INSERT INTO `rfid` VALUES (22, '7516060001b1010100000499', 0, 1);
INSERT INTO `rfid` VALUES (24, '7516060001b1010100000011', 0, 1);
INSERT INTO `rfid` VALUES (25, '7516060001b1010100000012', 0, 1);
INSERT INTO `rfid` VALUES (26, '7516060001b1010100000013', 0, 1);
INSERT INTO `rfid` VALUES (27, '7516060001b1010100000014', 0, 1);
INSERT INTO `rfid` VALUES (28, '7516060001b1010100000015', 0, 1);
INSERT INTO `rfid` VALUES (29, '7516060001b1010100000016', 0, 1);
INSERT INTO `rfid` VALUES (30, '7516060001b1010100000017', 0, 1);
INSERT INTO `rfid` VALUES (31, '7516060001b1010100000018', 0, 1);
INSERT INTO `rfid` VALUES (32, '7516060001b1010100000019', 0, 1);
INSERT INTO `rfid` VALUES (33, '7516060001b1010100000020', 0, 1);
INSERT INTO `rfid` VALUES (34, '7516060001b1010100000021', 0, 1);
INSERT INTO `rfid` VALUES (35, '7516060001b1010100000022', 0, 1);
INSERT INTO `rfid` VALUES (36, '7516060001b1010100000023', 0, 1);
INSERT INTO `rfid` VALUES (37, '7516060001b1010100000024', 0, 1);
INSERT INTO `rfid` VALUES (38, '7516060001b1010100000025', 0, 1);
INSERT INTO `rfid` VALUES (39, '7516060001b1010100000026', 0, 1);
INSERT INTO `rfid` VALUES (40, '7516060001b1010100000027', 0, 1);
INSERT INTO `rfid` VALUES (41, '7516060001b1010100000028', 0, 1);
INSERT INTO `rfid` VALUES (42, '7516060001b1010100000029', 0, 1);
INSERT INTO `rfid` VALUES (43, '7516060001b1010100000030', 0, 1);
INSERT INTO `rfid` VALUES (44, '7516060001b1010100000031', 0, 1);
INSERT INTO `rfid` VALUES (45, '7516060001b1010100000032', 0, 1);
INSERT INTO `rfid` VALUES (46, '7516060001b1010100000033', 0, 1);
INSERT INTO `rfid` VALUES (47, '7516060001b1010100000034', 0, 1);
INSERT INTO `rfid` VALUES (48, '7516060001b1010100000035', 0, 1);
INSERT INTO `rfid` VALUES (49, '7516060001b1010100000036', 0, 1);
INSERT INTO `rfid` VALUES (50, '7516060001b1010100000037', 0, 1);
INSERT INTO `rfid` VALUES (51, '7516060001b1010100000038', 0, 1);
INSERT INTO `rfid` VALUES (52, '7516060001b1010100000039', 0, 1);
INSERT INTO `rfid` VALUES (53, '7516060001b1010100000040', 0, 1);
INSERT INTO `rfid` VALUES (54, '7516060001b1010100000041', 0, 1);
INSERT INTO `rfid` VALUES (55, '7516060001b1010100000042', 0, 1);
INSERT INTO `rfid` VALUES (56, '7516060001b1010100000043', 0, 1);
INSERT INTO `rfid` VALUES (57, '7516060001b1010100000044', 0, 1);
INSERT INTO `rfid` VALUES (58, '7516060001b1010100000045', 0, 1);
INSERT INTO `rfid` VALUES (59, '7516060001b1010100000046', 0, 1);
INSERT INTO `rfid` VALUES (60, '7516060001b1010100000047', 0, 1);
INSERT INTO `rfid` VALUES (61, '7516060001b1010100000048', 0, 1);
INSERT INTO `rfid` VALUES (62, '7516060001b1010100000049', 0, 1);
INSERT INTO `rfid` VALUES (63, '7516060001b1010100000050', 0, 1);
INSERT INTO `rfid` VALUES (64, '7516060001b1010100000051', 0, 1);
INSERT INTO `rfid` VALUES (65, '7516060001b1010100000052', 0, 1);
INSERT INTO `rfid` VALUES (66, '7516060001b1010100000053', 0, 1);
INSERT INTO `rfid` VALUES (67, '7516060001b1010100000054', 0, 1);
INSERT INTO `rfid` VALUES (68, '7516060001b1010100000055', 0, 1);
INSERT INTO `rfid` VALUES (69, '7516060001b1010100000056', 0, 1);
INSERT INTO `rfid` VALUES (70, '7516060001b1010100000057', 0, 1);
INSERT INTO `rfid` VALUES (71, '7516060001b1010100000058', 0, 1);
INSERT INTO `rfid` VALUES (72, '7516060001b1010100000059', 0, 1);
INSERT INTO `rfid` VALUES (73, '7516060001b1010100000060', 0, 1);
INSERT INTO `rfid` VALUES (74, '7516060001b1010100000061', 0, 1);
INSERT INTO `rfid` VALUES (75, '7516060001b1010100000062', 0, 1);
INSERT INTO `rfid` VALUES (76, '7516060001b1010100000063', 0, 1);
INSERT INTO `rfid` VALUES (77, '7516060001b1010100000064', 0, 1);
INSERT INTO `rfid` VALUES (78, '7516060001b1010100000065', 0, 1);
INSERT INTO `rfid` VALUES (79, '7516060001b1010100000066', 0, 1);
INSERT INTO `rfid` VALUES (80, '7516060001b1010100000067', 0, 1);
INSERT INTO `rfid` VALUES (81, '7516060001b1010100000068', 0, 1);
INSERT INTO `rfid` VALUES (82, '7516060001b1010100000069', 0, 1);
INSERT INTO `rfid` VALUES (83, '7516060001b1010100000070', 0, 1);
INSERT INTO `rfid` VALUES (84, '7516060001b1010100000071', 0, 1);
INSERT INTO `rfid` VALUES (85, '7516060001b1010100000072', 0, 1);
INSERT INTO `rfid` VALUES (86, '7516060001b1010100000073', 0, 1);
INSERT INTO `rfid` VALUES (87, '7516060001b1010100000074', 0, 1);
INSERT INTO `rfid` VALUES (88, '7516060001b1010100000075', 0, 1);
INSERT INTO `rfid` VALUES (89, '7516060001b1010100000076', 0, 1);
INSERT INTO `rfid` VALUES (90, '7516060001b1010100000077', 0, 1);
INSERT INTO `rfid` VALUES (91, '7516060001b1010100000078', 0, 1);
INSERT INTO `rfid` VALUES (92, '7516060001b1010100000079', 0, 1);
INSERT INTO `rfid` VALUES (93, '7516060001b1010100000080', 0, 1);
INSERT INTO `rfid` VALUES (94, '7516060001b1010100000081', 0, 1);
INSERT INTO `rfid` VALUES (95, '7516060001b1010100000082', 0, 1);
INSERT INTO `rfid` VALUES (96, '7516060001b1010100000083', 0, 1);
INSERT INTO `rfid` VALUES (97, '7516060001b1010100000084', 0, 1);
INSERT INTO `rfid` VALUES (98, '7516060001b1010100000085', 0, 1);
INSERT INTO `rfid` VALUES (99, '7516060001b1010100000086', 0, 1);
INSERT INTO `rfid` VALUES (100, '7516060001b1010100000087', 0, 1);
INSERT INTO `rfid` VALUES (101, '7516060001b1010100000088', 0, 1);
INSERT INTO `rfid` VALUES (102, '7516060001b1010100000089', 0, 1);
INSERT INTO `rfid` VALUES (103, '7516060001b1010100000090', 0, 1);
INSERT INTO `rfid` VALUES (104, '7516060001b1010100000091', 0, 1);
INSERT INTO `rfid` VALUES (105, '7516060001b1010100000092', 0, 1);
INSERT INTO `rfid` VALUES (106, '7516060001b1010100000093', 0, 1);
INSERT INTO `rfid` VALUES (107, '7516060001b1010100000094', 0, 1);
INSERT INTO `rfid` VALUES (108, '7516060001b1010100000095', 0, 1);
INSERT INTO `rfid` VALUES (109, '7516060001b1010100000096', 0, 1);
INSERT INTO `rfid` VALUES (110, '7516060001b1010100000097', 0, 1);
INSERT INTO `rfid` VALUES (111, '7516060001b1010100000098', 0, 1);
INSERT INTO `rfid` VALUES (112, '7516060001b1010100000099', 0, 1);
INSERT INTO `rfid` VALUES (113, '7516060001b1010100000100', 0, 1);
INSERT INTO `rfid` VALUES (114, '7516060001b1010100000101', 0, 1);
INSERT INTO `rfid` VALUES (115, '7516060001b1010100000102', 0, 1);
INSERT INTO `rfid` VALUES (116, '7516060001b1010100000103', 0, 1);
INSERT INTO `rfid` VALUES (117, '7516060001b1010100000104', 0, 1);
INSERT INTO `rfid` VALUES (118, '7516060001b1010100000105', 0, 1);
INSERT INTO `rfid` VALUES (119, '7516060001b1010100000106', 0, 1);
INSERT INTO `rfid` VALUES (120, '7516060001b1010100000107', 0, 1);
INSERT INTO `rfid` VALUES (121, '7516060001b1010100000108', 0, 1);
INSERT INTO `rfid` VALUES (122, '7516060001b1010100000109', 0, 1);
INSERT INTO `rfid` VALUES (123, '7516060001b1010100000110', 0, 1);
INSERT INTO `rfid` VALUES (124, '7516060001b1010100000111', 0, 1);
INSERT INTO `rfid` VALUES (125, '7516060001b1010100000112', 0, 1);
INSERT INTO `rfid` VALUES (126, '7516060001b1010100000113', 0, 1);
INSERT INTO `rfid` VALUES (127, '7516060001b1010100000114', 0, 1);
INSERT INTO `rfid` VALUES (128, '7516060001b1010100000115', 0, 1);
INSERT INTO `rfid` VALUES (129, '7516060001b1010100000116', 0, 1);
INSERT INTO `rfid` VALUES (130, '7516060001b1010100000117', 0, 1);
INSERT INTO `rfid` VALUES (131, '7516060001b1010100000118', 0, 1);
INSERT INTO `rfid` VALUES (132, '7516060001b1010100000119', 0, 1);
INSERT INTO `rfid` VALUES (133, '7516060001b1010100000120', 0, 1);
INSERT INTO `rfid` VALUES (134, '7516060001b1010100000121', 0, 1);
INSERT INTO `rfid` VALUES (135, '7516060001b1010100000122', 0, 1);
INSERT INTO `rfid` VALUES (136, '7516060001b1010100000123', 0, 1);
INSERT INTO `rfid` VALUES (137, '7516060001b1010100000124', 0, 1);
INSERT INTO `rfid` VALUES (138, '7516060001b1010100000125', 0, 1);
INSERT INTO `rfid` VALUES (139, '7516060001b1010100000126', 0, 1);
INSERT INTO `rfid` VALUES (140, '7516060001b1010100000127', 0, 1);
INSERT INTO `rfid` VALUES (141, '7516060001b1010100000128', 0, 1);
INSERT INTO `rfid` VALUES (142, '7516060001b1010100000129', 0, 1);
INSERT INTO `rfid` VALUES (143, '7516060001b1010100000130', 0, 1);
INSERT INTO `rfid` VALUES (144, '7516060001b1010100000131', 0, 1);
INSERT INTO `rfid` VALUES (145, '7516060001b1010100000132', 0, 1);
INSERT INTO `rfid` VALUES (146, '7516060001b1010100000133', 0, 1);
INSERT INTO `rfid` VALUES (147, '7516060001b1010100000134', 0, 1);
INSERT INTO `rfid` VALUES (148, '7516060001b1010100000135', 0, 1);
INSERT INTO `rfid` VALUES (149, '7516060001b1010100000136', 0, 1);
INSERT INTO `rfid` VALUES (150, '7516060001b1010100000137', 0, 1);
INSERT INTO `rfid` VALUES (151, '7516060001b1010100000138', 0, 1);
INSERT INTO `rfid` VALUES (152, '7516060001b1010100000139', 0, 1);
INSERT INTO `rfid` VALUES (153, '7516060001b1010100000140', 0, 1);
INSERT INTO `rfid` VALUES (154, '7516060001b1010100000141', 0, 1);
INSERT INTO `rfid` VALUES (155, '7516060001b1010100000142', 0, 1);
INSERT INTO `rfid` VALUES (156, '7516060001b1010100000143', 0, 1);
INSERT INTO `rfid` VALUES (157, '7516060001b1010100000144', 0, 1);
INSERT INTO `rfid` VALUES (158, '7516060001b1010100000145', 0, 1);
INSERT INTO `rfid` VALUES (159, '7516060001b1010100000146', 0, 1);
INSERT INTO `rfid` VALUES (160, '7516060001b1010100000147', 0, 1);
INSERT INTO `rfid` VALUES (161, '7516060001b1010100000148', 0, 1);
INSERT INTO `rfid` VALUES (162, '7516060001b1010100000149', 0, 1);
INSERT INTO `rfid` VALUES (163, '7516060001b1010100000150', 0, 1);
INSERT INTO `rfid` VALUES (164, '7516060001b1010100000151', 0, 1);
INSERT INTO `rfid` VALUES (165, '7516060001b1010100000152', 0, 1);
INSERT INTO `rfid` VALUES (166, '7516060001b1010100000153', 0, 1);
INSERT INTO `rfid` VALUES (167, '7516060001b1010100000154', 0, 1);
INSERT INTO `rfid` VALUES (168, '7516060001b1010100000155', 0, 1);
INSERT INTO `rfid` VALUES (169, '7516060001b1010100000156', 0, 1);
INSERT INTO `rfid` VALUES (170, '7516060001b1010100000157', 0, 1);
INSERT INTO `rfid` VALUES (171, '7516060001b1010100000158', 0, 1);
INSERT INTO `rfid` VALUES (172, '7516060001b1010100000159', 0, 1);
INSERT INTO `rfid` VALUES (173, '7516060001b1010100000160', 0, 1);
INSERT INTO `rfid` VALUES (174, '7516060001b1010100000161', 0, 1);
INSERT INTO `rfid` VALUES (175, '7516060001b1010100000162', 0, 1);
INSERT INTO `rfid` VALUES (176, '7516060001b1010100000163', 0, 1);
INSERT INTO `rfid` VALUES (177, '7516060001b1010100000164', 0, 1);
INSERT INTO `rfid` VALUES (178, '7516060001b1010100000165', 0, 1);
INSERT INTO `rfid` VALUES (179, '7516060001b1010100000166', 0, 1);
INSERT INTO `rfid` VALUES (180, '7516060001b1010100000167', 0, 1);
INSERT INTO `rfid` VALUES (181, '7516060001b1010100000168', 0, 1);
INSERT INTO `rfid` VALUES (182, '7516060001b1010100000169', 0, 1);
INSERT INTO `rfid` VALUES (183, '7516060001b1010100000170', 0, 1);
INSERT INTO `rfid` VALUES (184, '7516060001b1010100000171', 0, 1);
INSERT INTO `rfid` VALUES (185, '7516060001b1010100000172', 0, 1);
INSERT INTO `rfid` VALUES (186, '7516060001b1010100000173', 0, 1);
INSERT INTO `rfid` VALUES (187, '7516060001b1010100000174', 0, 1);
INSERT INTO `rfid` VALUES (188, '7516060001b1010100000175', 0, 1);
INSERT INTO `rfid` VALUES (189, '7516060001b1010100000176', 0, 1);
INSERT INTO `rfid` VALUES (190, '7516060001b1010100000177', 0, 1);
INSERT INTO `rfid` VALUES (191, '7516060001b1010100000178', 0, 1);
INSERT INTO `rfid` VALUES (192, '7516060001b1010100000179', 0, 1);
INSERT INTO `rfid` VALUES (193, '7516060001b1010100000180', 0, 1);
INSERT INTO `rfid` VALUES (194, '7516060001b1010100000181', 0, 1);
INSERT INTO `rfid` VALUES (195, '7516060001b1010100000182', 0, 1);
INSERT INTO `rfid` VALUES (196, '7516060001b1010100000183', 0, 1);
INSERT INTO `rfid` VALUES (197, '7516060001b1010100000184', 0, 1);
INSERT INTO `rfid` VALUES (198, '7516060001b1010100000185', 0, 1);
INSERT INTO `rfid` VALUES (199, '7516060001b1010100000186', 0, 1);
INSERT INTO `rfid` VALUES (200, '7516060001b1010100000187', 0, 1);
INSERT INTO `rfid` VALUES (201, '7516060001b1010100000188', 0, 1);
INSERT INTO `rfid` VALUES (202, '7516060001b1010100000189', 0, 1);
INSERT INTO `rfid` VALUES (203, '7516060001b1010100000190', 0, 1);
INSERT INTO `rfid` VALUES (204, '7516060001b1010100000191', 0, 1);
INSERT INTO `rfid` VALUES (205, '7516060001b1010100000192', 0, 1);
INSERT INTO `rfid` VALUES (206, '7516060001b1010100000193', 0, 1);
INSERT INTO `rfid` VALUES (207, '7516060001b1010100000194', 0, 1);
INSERT INTO `rfid` VALUES (208, '7516060001b1010100000195', 0, 1);
INSERT INTO `rfid` VALUES (209, '7516060001b1010100000196', 0, 1);
INSERT INTO `rfid` VALUES (210, '7516060001b1010100000197', 0, 1);
INSERT INTO `rfid` VALUES (211, '7516060001b1010100000198', 0, 1);
INSERT INTO `rfid` VALUES (212, '7516060001b1010100000199', 0, 1);
INSERT INTO `rfid` VALUES (213, '7516060001b1010100000200', 0, 1);
INSERT INTO `rfid` VALUES (214, '7516060001b1010100000201', 0, 1);
INSERT INTO `rfid` VALUES (215, '7516060001b1010100000202', 0, 1);
INSERT INTO `rfid` VALUES (216, '7516060001b1010100000203', 0, 1);
INSERT INTO `rfid` VALUES (217, '7516060001b1010100000204', 0, 1);
INSERT INTO `rfid` VALUES (218, '7516060001b1010100000205', 0, 1);
INSERT INTO `rfid` VALUES (219, '7516060001b1010100000206', 0, 1);
INSERT INTO `rfid` VALUES (220, '7516060001b1010100000207', 0, 1);
INSERT INTO `rfid` VALUES (221, '7516060001b1010100000208', 0, 1);
INSERT INTO `rfid` VALUES (222, '7516060001b1010100000209', 0, 1);
INSERT INTO `rfid` VALUES (223, '7516060001b1010100000210', 0, 1);
INSERT INTO `rfid` VALUES (224, '7516060001b1010100000211', 0, 1);
INSERT INTO `rfid` VALUES (225, '7516060001b1010100000212', 0, 1);
INSERT INTO `rfid` VALUES (226, '7516060001b1010100000213', 0, 1);
INSERT INTO `rfid` VALUES (227, '7516060001b1010100000214', 0, 1);
INSERT INTO `rfid` VALUES (228, '7516060001b1010100000215', 0, 1);
INSERT INTO `rfid` VALUES (229, '7516060001b1010100000216', 0, 1);
INSERT INTO `rfid` VALUES (230, '7516060001b1010100000217', 0, 1);
INSERT INTO `rfid` VALUES (231, '7516060001b1010100000218', 0, 1);
INSERT INTO `rfid` VALUES (232, '7516060001b1010100000219', 0, 1);
INSERT INTO `rfid` VALUES (233, '7516060001b1010100000220', 0, 1);
INSERT INTO `rfid` VALUES (234, '7516060001b1010100000221', 0, 1);
INSERT INTO `rfid` VALUES (235, '7516060001b1010100000222', 0, 1);
INSERT INTO `rfid` VALUES (236, '7516060001b1010100000223', 0, 1);
INSERT INTO `rfid` VALUES (237, '7516060001b1010100000224', 0, 1);
INSERT INTO `rfid` VALUES (238, '7516060001b1010100000225', 0, 1);
INSERT INTO `rfid` VALUES (239, '7516060001b1010100000226', 0, 1);
INSERT INTO `rfid` VALUES (240, '7516060001b1010100000227', 0, 1);
INSERT INTO `rfid` VALUES (241, '7516060001b1010100000228', 0, 1);
INSERT INTO `rfid` VALUES (242, '7516060001b1010100000229', 0, 1);
INSERT INTO `rfid` VALUES (243, '7516060001b1010100000230', 0, 1);
INSERT INTO `rfid` VALUES (244, '7516060001b1010100000231', 0, 1);
INSERT INTO `rfid` VALUES (245, '7516060001b1010100000232', 0, 1);
INSERT INTO `rfid` VALUES (246, '7516060001b1010100000233', 0, 1);
INSERT INTO `rfid` VALUES (247, '7516060001b1010100000234', 0, 1);
INSERT INTO `rfid` VALUES (248, '7516060001b1010100000235', 0, 1);
INSERT INTO `rfid` VALUES (249, '7516060001b1010100000236', 0, 1);
INSERT INTO `rfid` VALUES (250, '7516060001b1010100000237', 0, 1);
INSERT INTO `rfid` VALUES (251, '7516060001b1010100000238', 0, 1);
INSERT INTO `rfid` VALUES (252, '7516060001b1010100000239', 0, 1);
INSERT INTO `rfid` VALUES (253, '7516060001b1010100000240', 0, 1);
INSERT INTO `rfid` VALUES (254, '7516060001b1010100000241', 0, 1);
INSERT INTO `rfid` VALUES (255, '7516060001b1010100000242', 0, 1);
INSERT INTO `rfid` VALUES (256, '7516060001b1010100000243', 0, 1);
INSERT INTO `rfid` VALUES (257, '7516060001b1010100000244', 0, 1);
INSERT INTO `rfid` VALUES (258, '7516060001b1010100000245', 0, 1);
INSERT INTO `rfid` VALUES (259, '7516060001b1010100000246', 0, 1);
INSERT INTO `rfid` VALUES (260, '7516060001b1010100000247', 0, 1);
INSERT INTO `rfid` VALUES (261, '7516060001b1010100000248', 0, 1);
INSERT INTO `rfid` VALUES (262, '7516060001b1010100000249', 0, 1);
INSERT INTO `rfid` VALUES (263, '7516060001b1010100000250', 0, 1);
INSERT INTO `rfid` VALUES (264, '7516060001b1010100000251', 0, 1);
INSERT INTO `rfid` VALUES (265, '7516060001b1010100000252', 0, 1);
INSERT INTO `rfid` VALUES (266, '7516060001b1010100000253', 0, 1);
INSERT INTO `rfid` VALUES (267, '7516060001b1010100000254', 0, 1);
INSERT INTO `rfid` VALUES (268, '7516060001b1010100000255', 0, 1);
INSERT INTO `rfid` VALUES (269, '7516060001b1010100000256', 0, 1);
INSERT INTO `rfid` VALUES (270, '7516060001b1010100000257', 0, 1);
INSERT INTO `rfid` VALUES (271, '7516060001b1010100000258', 0, 1);
INSERT INTO `rfid` VALUES (272, '7516060001b1010100000259', 0, 1);
INSERT INTO `rfid` VALUES (273, '7516060001b1010100000260', 0, 1);
INSERT INTO `rfid` VALUES (274, '7516060001b1010100000261', 0, 1);
INSERT INTO `rfid` VALUES (275, '7516060001b1010100000262', 0, 1);
INSERT INTO `rfid` VALUES (276, '7516060001b1010100000263', 0, 1);
INSERT INTO `rfid` VALUES (277, '7516060001b1010100000264', 0, 1);
INSERT INTO `rfid` VALUES (278, '7516060001b1010100000265', 0, 1);
INSERT INTO `rfid` VALUES (279, '7516060001b1010100000266', 0, 1);
INSERT INTO `rfid` VALUES (280, '7516060001b1010100000267', 0, 1);
INSERT INTO `rfid` VALUES (281, '7516060001b1010100000268', 0, 1);
INSERT INTO `rfid` VALUES (282, '7516060001b1010100000269', 0, 1);
INSERT INTO `rfid` VALUES (283, '7516060001b1010100000270', 0, 1);
INSERT INTO `rfid` VALUES (284, '7516060001b1010100000271', 0, 1);
INSERT INTO `rfid` VALUES (285, '7516060001b1010100000272', 0, 1);
INSERT INTO `rfid` VALUES (286, '7516060001b1010100000273', 0, 1);
INSERT INTO `rfid` VALUES (287, '7516060001b1010100000274', 0, 1);
INSERT INTO `rfid` VALUES (288, '7516060001b1010100000275', 0, 1);
INSERT INTO `rfid` VALUES (289, '7516060001b1010100000276', 0, 1);
INSERT INTO `rfid` VALUES (290, '7516060001b1010100000277', 0, 1);
INSERT INTO `rfid` VALUES (291, '7516060001b1010100000278', 0, 1);
INSERT INTO `rfid` VALUES (292, '7516060001b1010100000279', 0, 1);
INSERT INTO `rfid` VALUES (293, '7516060001b1010100000280', 0, 1);
INSERT INTO `rfid` VALUES (294, '7516060001b1010100000281', 0, 1);
INSERT INTO `rfid` VALUES (295, '7516060001b1010100000282', 0, 1);
INSERT INTO `rfid` VALUES (296, '7516060001b1010100000283', 0, 1);
INSERT INTO `rfid` VALUES (297, '7516060001b1010100000284', 0, 1);
INSERT INTO `rfid` VALUES (298, '7516060001b1010100000285', 0, 1);
INSERT INTO `rfid` VALUES (299, '7516060001b1010100000286', 0, 1);
INSERT INTO `rfid` VALUES (300, '7516060001b1010100000287', 0, 1);
INSERT INTO `rfid` VALUES (301, '7516060001b1010100000288', 0, 1);
INSERT INTO `rfid` VALUES (302, '7516060001b1010100000289', 0, 1);
INSERT INTO `rfid` VALUES (303, '7516060001b1010100000290', 0, 1);
INSERT INTO `rfid` VALUES (304, '7516060001b1010100000291', 0, 1);
INSERT INTO `rfid` VALUES (305, '7516060001b1010100000292', 0, 1);
INSERT INTO `rfid` VALUES (306, '7516060001b1010100000293', 0, 1);
INSERT INTO `rfid` VALUES (307, '7516060001b1010100000294', 0, 1);
INSERT INTO `rfid` VALUES (308, '7516060001b1010100000295', 0, 1);
INSERT INTO `rfid` VALUES (309, '7516060001b1010100000296', 0, 1);
INSERT INTO `rfid` VALUES (310, '7516060001b1010100000297', 0, 1);
INSERT INTO `rfid` VALUES (311, '7516060001b1010100000298', 0, 1);
INSERT INTO `rfid` VALUES (312, '7516060001b1010100000299', 0, 1);
INSERT INTO `rfid` VALUES (313, '7516060001b1010100000300', 0, 1);
INSERT INTO `rfid` VALUES (314, '7516060001b1010100000301', 0, 1);
INSERT INTO `rfid` VALUES (315, '7516060001b1010100000302', 0, 1);
INSERT INTO `rfid` VALUES (316, '7516060001b1010100000303', 0, 1);
INSERT INTO `rfid` VALUES (317, '7516060001b1010100000304', 0, 1);
INSERT INTO `rfid` VALUES (318, '7516060001b1010100000305', 0, 1);
INSERT INTO `rfid` VALUES (319, '7516060001b1010100000306', 0, 1);
INSERT INTO `rfid` VALUES (320, '7516060001b1010100000307', 0, 1);
INSERT INTO `rfid` VALUES (321, '7516060001b1010100000308', 0, 1);
INSERT INTO `rfid` VALUES (322, '7516060001b1010100000309', 0, 1);
INSERT INTO `rfid` VALUES (323, '7516060001b1010100000310', 0, 1);
INSERT INTO `rfid` VALUES (324, '7516060001b1010100000311', 0, 1);
INSERT INTO `rfid` VALUES (325, '7516060001b1010100000312', 0, 1);
INSERT INTO `rfid` VALUES (326, '7516060001b1010100000313', 0, 1);
INSERT INTO `rfid` VALUES (327, '7516060001b1010100000314', 0, 1);
INSERT INTO `rfid` VALUES (328, '7516060001b1010100000315', 0, 1);
INSERT INTO `rfid` VALUES (329, '7516060001b1010100000316', 0, 1);
INSERT INTO `rfid` VALUES (330, '7516060001b1010100000317', 0, 1);
INSERT INTO `rfid` VALUES (331, '7516060001b1010100000318', 0, 1);
INSERT INTO `rfid` VALUES (332, '7516060001b1010100000319', 0, 1);
INSERT INTO `rfid` VALUES (333, '7516060001b1010100000320', 0, 1);
INSERT INTO `rfid` VALUES (334, '7516060001b1010100000321', 0, 1);
INSERT INTO `rfid` VALUES (335, '7516060001b1010100000322', 0, 1);
INSERT INTO `rfid` VALUES (336, '7516060001b1010100000323', 0, 1);
INSERT INTO `rfid` VALUES (337, '7516060001b1010100000324', 0, 1);
INSERT INTO `rfid` VALUES (338, '7516060001b1010100000325', 0, 1);
INSERT INTO `rfid` VALUES (339, '7516060001b1010100000326', 0, 1);
INSERT INTO `rfid` VALUES (340, '7516060001b1010100000327', 0, 1);
INSERT INTO `rfid` VALUES (341, '7516060001b1010100000328', 0, 1);
INSERT INTO `rfid` VALUES (342, '7516060001b1010100000329', 0, 1);
INSERT INTO `rfid` VALUES (343, '7516060001b1010100000330', 0, 1);
INSERT INTO `rfid` VALUES (344, '7516060001b1010100000331', 0, 1);
INSERT INTO `rfid` VALUES (345, '7516060001b1010100000332', 0, 1);
INSERT INTO `rfid` VALUES (346, '7516060001b1010100000333', 0, 1);
INSERT INTO `rfid` VALUES (347, '7516060001b1010100000334', 0, 1);
INSERT INTO `rfid` VALUES (348, '7516060001b1010100000335', 0, 1);
INSERT INTO `rfid` VALUES (349, '7516060001b1010100000336', 0, 1);
INSERT INTO `rfid` VALUES (350, '7516060001b1010100000337', 0, 1);
INSERT INTO `rfid` VALUES (351, '7516060001b1010100000338', 0, 1);
INSERT INTO `rfid` VALUES (352, '7516060001b1010100000339', 0, 1);
INSERT INTO `rfid` VALUES (353, '7516060001b1010100000340', 0, 1);
INSERT INTO `rfid` VALUES (354, '7516060001b1010100000341', 0, 1);
INSERT INTO `rfid` VALUES (355, '7516060001b1010100000342', 0, 1);
INSERT INTO `rfid` VALUES (356, '7516060001b1010100000343', 0, 1);
INSERT INTO `rfid` VALUES (357, '7516060001b1010100000344', 0, 1);
INSERT INTO `rfid` VALUES (358, '7516060001b1010100000345', 0, 1);
INSERT INTO `rfid` VALUES (359, '7516060001b1010100000346', 0, 1);
INSERT INTO `rfid` VALUES (360, '7516060001b1010100000347', 0, 1);
INSERT INTO `rfid` VALUES (361, '7516060001b1010100000348', 0, 1);
INSERT INTO `rfid` VALUES (362, '7516060001b1010100000349', 0, 1);
INSERT INTO `rfid` VALUES (363, '7516060001b1010100000350', 0, 1);
INSERT INTO `rfid` VALUES (364, '7516060001b1010100000351', 0, 1);
INSERT INTO `rfid` VALUES (365, '7516060001b1010100000352', 0, 1);
INSERT INTO `rfid` VALUES (366, '7516060001b1010100000353', 0, 1);
INSERT INTO `rfid` VALUES (367, '7516060001b1010100000354', 0, 1);
INSERT INTO `rfid` VALUES (368, '7516060001b1010100000355', 0, 1);
INSERT INTO `rfid` VALUES (369, '7516060001b1010100000356', 0, 1);
INSERT INTO `rfid` VALUES (370, '7516060001b1010100000357', 0, 1);
INSERT INTO `rfid` VALUES (371, '7516060001b1010100000358', 0, 1);
INSERT INTO `rfid` VALUES (372, '7516060001b1010100000359', 0, 1);
INSERT INTO `rfid` VALUES (373, '7516060001b1010100000360', 0, 1);
INSERT INTO `rfid` VALUES (374, '7516060001b1010100000361', 0, 1);
INSERT INTO `rfid` VALUES (375, '7516060001b1010100000362', 0, 1);
INSERT INTO `rfid` VALUES (376, '7516060001b1010100000363', 0, 1);
INSERT INTO `rfid` VALUES (377, '7516060001b1010100000364', 0, 1);
INSERT INTO `rfid` VALUES (378, '7516060001b1010100000365', 0, 1);
INSERT INTO `rfid` VALUES (379, '7516060001b1010100000366', 0, 1);
INSERT INTO `rfid` VALUES (380, '7516060001b1010100000367', 0, 1);
INSERT INTO `rfid` VALUES (381, '7516060001b1010100000368', 0, 1);
INSERT INTO `rfid` VALUES (382, '7516060001b1010100000369', 0, 1);
INSERT INTO `rfid` VALUES (383, '7516060001b1010100000370', 0, 1);
INSERT INTO `rfid` VALUES (384, '7516060001b1010100000371', 0, 1);
INSERT INTO `rfid` VALUES (385, '7516060001b1010100000372', 0, 1);
INSERT INTO `rfid` VALUES (386, '7516060001b1010100000373', 0, 1);
INSERT INTO `rfid` VALUES (387, '7516060001b1010100000374', 0, 1);
INSERT INTO `rfid` VALUES (388, '7516060001b1010100000375', 0, 1);
INSERT INTO `rfid` VALUES (389, '7516060001b1010100000376', 0, 1);
INSERT INTO `rfid` VALUES (390, '7516060001b1010100000377', 0, 1);
INSERT INTO `rfid` VALUES (391, '7516060001b1010100000378', 0, 1);
INSERT INTO `rfid` VALUES (392, '7516060001b1010100000379', 0, 1);
INSERT INTO `rfid` VALUES (393, '7516060001b1010100000380', 0, 1);
INSERT INTO `rfid` VALUES (394, '7516060001b1010100000381', 0, 1);
INSERT INTO `rfid` VALUES (395, '7516060001b1010100000382', 0, 1);
INSERT INTO `rfid` VALUES (396, '7516060001b1010100000383', 0, 1);
INSERT INTO `rfid` VALUES (397, '7516060001b1010100000384', 0, 1);
INSERT INTO `rfid` VALUES (398, '7516060001b1010100000385', 0, 1);
INSERT INTO `rfid` VALUES (399, '7516060001b1010100000386', 0, 1);
INSERT INTO `rfid` VALUES (400, '7516060001b1010100000387', 0, 1);
INSERT INTO `rfid` VALUES (401, '7516060001b1010100000388', 0, 1);
INSERT INTO `rfid` VALUES (402, '7516060001b1010100000389', 0, 1);
INSERT INTO `rfid` VALUES (403, '7516060001b1010100000390', 0, 1);
INSERT INTO `rfid` VALUES (404, '7516060001b1010100000391', 0, 1);
INSERT INTO `rfid` VALUES (405, '7516060001b1010100000392', 0, 1);
INSERT INTO `rfid` VALUES (406, '7516060001b1010100000393', 0, 1);
INSERT INTO `rfid` VALUES (407, '7516060001b1010100000394', 0, 1);
INSERT INTO `rfid` VALUES (408, '7516060001b1010100000395', 0, 1);
INSERT INTO `rfid` VALUES (409, '7516060001b1010100000396', 0, 1);
INSERT INTO `rfid` VALUES (410, '7516060001b1010100000397', 0, 1);
INSERT INTO `rfid` VALUES (411, '7516060001b1010100000398', 0, 1);
INSERT INTO `rfid` VALUES (412, '7516060001b1010100000399', 0, 1);
INSERT INTO `rfid` VALUES (413, '7516060001b1010100000400', 0, 1);
INSERT INTO `rfid` VALUES (414, '7516060001b1010100000474', 0, 1);
INSERT INTO `rfid` VALUES (415, '7516060001b1010100000475', 0, 1);
INSERT INTO `rfid` VALUES (416, '7516060001b1010100000476', 0, 1);
INSERT INTO `rfid` VALUES (417, '7516060001b1010100000477', 0, 1);
INSERT INTO `rfid` VALUES (418, '7516060001b1010100000478', 0, 1);
INSERT INTO `rfid` VALUES (419, '7516060001b1010100000479', 0, 1);
INSERT INTO `rfid` VALUES (420, '7516060001b1010100000480', 0, 1);
INSERT INTO `rfid` VALUES (421, '7516060001b1010100000481', 0, 1);
INSERT INTO `rfid` VALUES (422, '7516060001b1010100000482', 0, 1);
INSERT INTO `rfid` VALUES (423, '7516060001b1010100000483', 0, 1);
INSERT INTO `rfid` VALUES (424, '7516060001b1010100000484', 0, 1);
INSERT INTO `rfid` VALUES (425, '7516060001b1010100000485', 0, 1);
INSERT INTO `rfid` VALUES (426, '7516060001b1010100000486', 0, 1);
INSERT INTO `rfid` VALUES (427, '7516060001b1010100000487', 0, 1);
INSERT INTO `rfid` VALUES (428, '7516060001b1010100000488', 0, 1);
INSERT INTO `rfid` VALUES (429, '7516060001b1010100000489', 0, 1);
INSERT INTO `rfid` VALUES (430, 'HBTEST789123456789751001', 0, 2);
INSERT INTO `rfid` VALUES (431, 'HBTEST789123456789751002', 0, 2);
INSERT INTO `rfid` VALUES (432, 'HBTEST789123456789751003', 0, 2);
INSERT INTO `rfid` VALUES (433, 'HBTEST789123456789751004', 0, 2);
INSERT INTO `rfid` VALUES (434, 'HBTEST789123456789751005', 0, 2);

-- ----------------------------
-- Table structure for rfid_cage
-- ----------------------------
DROP TABLE IF EXISTS `rfid_cage`;
CREATE TABLE `rfid_cage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cage_id` bigint NOT NULL,
  `rfid_id` bigint NOT NULL,
  `bound_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cage_id`(`cage_id` ASC) USING BTREE,
  UNIQUE INDEX `rfid_id`(`rfid_id` ASC) USING BTREE,
  INDEX `rfid_cage_bound_time_15e37dca`(`bound_time` ASC) USING BTREE,
  CONSTRAINT `rfid_cage_cage_id_8b8bbff9_fk_cage_id` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rfid_cage_rfid_id_9c5d0634_fk_rfid_id` FOREIGN KEY (`rfid_id`) REFERENCES `rfid` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 452 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rfid_cage
-- ----------------------------
INSERT INTO `rfid_cage` VALUES (1, 24, 1, '2023-11-21');
INSERT INTO `rfid_cage` VALUES (2, 25, 3, '2023-11-22');
INSERT INTO `rfid_cage` VALUES (3, 26, 4, '2023-11-22');
INSERT INTO `rfid_cage` VALUES (4, 27, 5, '2023-11-23');
INSERT INTO `rfid_cage` VALUES (9, 20, 13, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (10, 19, 15, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (11, 18, 16, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (12, 17, 17, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (13, 16, 18, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (14, 15, 19, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (15, 14, 20, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (16, 13, 21, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (17, 12, 22, '2023-11-28');
INSERT INTO `rfid_cage` VALUES (19, 23, 2, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (20, 28, 6, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (21, 29, 7, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (22, 30, 8, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (23, 31, 9, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (24, 32, 10, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (25, 33, 24, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (26, 34, 25, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (27, 35, 26, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (28, 36, 27, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (29, 37, 28, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (30, 38, 29, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (31, 39, 30, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (32, 40, 31, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (33, 41, 32, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (34, 42, 33, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (35, 43, 34, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (36, 44, 35, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (37, 45, 36, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (38, 46, 37, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (39, 47, 38, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (40, 48, 39, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (41, 49, 40, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (42, 50, 41, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (43, 51, 42, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (44, 52, 43, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (45, 53, 44, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (46, 54, 45, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (47, 55, 46, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (48, 56, 47, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (49, 57, 48, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (50, 58, 49, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (51, 59, 50, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (52, 60, 51, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (53, 61, 52, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (54, 62, 53, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (55, 63, 54, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (56, 64, 55, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (57, 65, 56, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (58, 66, 57, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (59, 67, 58, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (60, 68, 59, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (61, 69, 60, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (62, 70, 61, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (63, 71, 62, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (64, 72, 63, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (65, 73, 64, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (66, 74, 65, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (67, 75, 66, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (68, 76, 67, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (69, 77, 68, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (70, 78, 69, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (71, 79, 70, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (72, 80, 71, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (73, 81, 72, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (74, 82, 73, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (75, 83, 74, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (76, 84, 75, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (77, 85, 76, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (78, 86, 77, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (79, 87, 78, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (80, 88, 79, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (81, 89, 80, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (82, 90, 81, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (83, 91, 82, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (84, 92, 83, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (85, 93, 84, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (86, 94, 85, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (87, 95, 86, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (88, 96, 87, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (89, 97, 88, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (90, 98, 89, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (91, 99, 90, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (92, 100, 91, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (93, 101, 92, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (94, 102, 93, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (95, 103, 94, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (96, 104, 95, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (97, 105, 96, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (98, 106, 97, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (99, 107, 98, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (100, 108, 99, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (101, 109, 100, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (102, 110, 101, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (103, 111, 102, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (104, 112, 103, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (105, 113, 104, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (106, 114, 105, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (107, 115, 106, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (108, 116, 107, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (109, 117, 108, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (110, 118, 109, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (111, 119, 110, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (112, 120, 111, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (113, 121, 112, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (114, 122, 113, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (115, 123, 114, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (116, 124, 115, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (117, 125, 116, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (118, 126, 117, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (119, 127, 118, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (120, 128, 119, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (121, 129, 120, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (122, 130, 121, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (123, 131, 122, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (124, 132, 123, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (125, 133, 124, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (126, 134, 125, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (127, 135, 126, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (128, 136, 127, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (129, 137, 128, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (130, 138, 129, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (131, 139, 130, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (132, 140, 131, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (133, 141, 132, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (134, 142, 133, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (135, 143, 134, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (136, 144, 135, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (137, 145, 136, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (138, 146, 137, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (139, 147, 138, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (140, 148, 139, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (141, 149, 140, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (142, 150, 141, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (143, 151, 142, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (144, 152, 143, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (145, 153, 144, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (146, 154, 145, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (147, 155, 146, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (148, 156, 147, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (149, 157, 148, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (150, 158, 149, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (151, 159, 150, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (152, 160, 151, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (153, 161, 152, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (154, 162, 153, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (155, 163, 154, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (156, 164, 155, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (157, 165, 156, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (158, 166, 157, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (159, 167, 158, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (160, 168, 159, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (161, 169, 160, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (162, 170, 161, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (163, 171, 162, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (164, 172, 163, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (165, 173, 164, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (166, 174, 165, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (167, 175, 166, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (168, 176, 167, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (169, 177, 168, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (170, 178, 169, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (171, 179, 170, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (172, 180, 171, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (173, 181, 172, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (174, 182, 173, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (175, 183, 174, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (176, 184, 175, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (177, 185, 176, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (178, 186, 177, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (179, 187, 178, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (180, 188, 179, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (181, 189, 180, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (182, 190, 181, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (183, 191, 182, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (184, 192, 183, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (185, 193, 184, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (186, 194, 185, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (187, 195, 186, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (188, 196, 187, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (189, 197, 188, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (190, 198, 189, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (191, 199, 190, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (192, 200, 191, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (193, 201, 192, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (194, 202, 193, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (195, 203, 194, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (196, 204, 195, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (197, 205, 196, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (198, 206, 197, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (199, 207, 198, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (200, 208, 199, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (201, 209, 200, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (202, 210, 201, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (203, 211, 202, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (204, 212, 203, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (205, 213, 204, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (206, 214, 205, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (207, 215, 206, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (208, 216, 207, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (209, 217, 208, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (210, 218, 209, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (211, 219, 210, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (212, 220, 211, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (213, 221, 212, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (214, 222, 213, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (215, 223, 214, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (216, 224, 215, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (217, 225, 216, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (218, 226, 217, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (219, 227, 218, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (220, 228, 219, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (221, 229, 220, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (222, 230, 221, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (223, 231, 222, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (224, 232, 223, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (225, 233, 224, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (226, 234, 225, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (227, 235, 226, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (228, 236, 227, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (229, 237, 228, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (230, 238, 229, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (231, 239, 230, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (232, 240, 231, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (233, 241, 232, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (234, 242, 233, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (235, 243, 234, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (236, 244, 235, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (237, 245, 236, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (238, 246, 237, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (239, 247, 238, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (240, 248, 239, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (241, 249, 240, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (242, 250, 241, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (243, 251, 242, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (244, 252, 243, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (245, 253, 244, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (246, 254, 245, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (247, 255, 246, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (248, 256, 247, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (249, 257, 248, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (250, 258, 249, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (251, 259, 250, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (252, 260, 251, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (253, 261, 252, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (254, 262, 253, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (255, 263, 254, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (256, 264, 255, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (257, 265, 256, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (258, 266, 257, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (259, 267, 258, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (260, 268, 259, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (261, 269, 260, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (262, 270, 261, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (263, 271, 262, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (264, 272, 263, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (265, 273, 264, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (266, 274, 265, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (267, 275, 266, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (268, 276, 267, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (269, 277, 268, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (270, 278, 269, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (271, 279, 270, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (272, 280, 271, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (273, 281, 272, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (274, 282, 273, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (275, 283, 274, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (276, 284, 275, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (277, 285, 276, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (278, 286, 277, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (279, 287, 278, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (280, 288, 279, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (281, 289, 280, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (282, 290, 281, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (283, 291, 282, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (284, 292, 283, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (285, 293, 284, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (286, 294, 285, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (287, 295, 286, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (288, 296, 287, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (289, 297, 288, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (290, 298, 289, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (291, 299, 290, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (292, 300, 291, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (293, 301, 292, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (294, 302, 293, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (295, 303, 294, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (296, 304, 295, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (297, 305, 296, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (298, 306, 297, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (299, 307, 298, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (300, 308, 299, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (301, 309, 300, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (302, 310, 301, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (303, 311, 302, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (304, 312, 303, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (305, 313, 304, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (306, 314, 305, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (307, 315, 306, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (308, 316, 307, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (309, 317, 308, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (310, 318, 309, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (311, 319, 310, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (312, 320, 311, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (313, 321, 312, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (314, 322, 313, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (315, 323, 314, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (316, 324, 315, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (317, 325, 316, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (318, 326, 317, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (319, 327, 318, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (320, 328, 319, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (321, 329, 320, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (322, 330, 321, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (323, 331, 322, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (324, 332, 323, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (325, 333, 324, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (326, 334, 325, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (327, 335, 326, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (328, 336, 327, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (329, 337, 328, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (330, 338, 329, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (331, 339, 330, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (332, 340, 331, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (333, 341, 332, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (334, 342, 333, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (335, 343, 334, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (336, 344, 335, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (337, 345, 336, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (338, 346, 337, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (339, 347, 338, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (340, 348, 339, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (341, 349, 340, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (342, 350, 341, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (343, 351, 342, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (344, 352, 343, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (345, 353, 344, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (346, 354, 345, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (347, 355, 346, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (348, 356, 347, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (349, 357, 348, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (350, 358, 349, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (351, 359, 350, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (352, 360, 351, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (353, 361, 352, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (354, 362, 353, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (355, 363, 354, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (356, 364, 355, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (357, 365, 356, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (358, 366, 357, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (359, 367, 358, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (360, 368, 359, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (361, 369, 360, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (362, 370, 361, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (363, 371, 362, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (364, 372, 363, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (365, 373, 364, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (366, 374, 365, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (367, 375, 366, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (368, 376, 367, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (369, 377, 368, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (370, 378, 369, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (371, 379, 370, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (372, 380, 371, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (373, 381, 372, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (374, 382, 373, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (375, 383, 374, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (376, 384, 375, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (377, 385, 376, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (378, 386, 377, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (379, 387, 378, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (380, 388, 379, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (381, 389, 380, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (382, 390, 381, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (383, 391, 382, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (384, 392, 383, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (385, 393, 384, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (386, 394, 385, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (387, 395, 386, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (388, 396, 387, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (389, 397, 388, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (390, 398, 389, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (391, 399, 390, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (392, 400, 391, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (393, 401, 392, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (394, 402, 393, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (395, 403, 394, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (396, 404, 395, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (397, 405, 396, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (398, 406, 397, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (399, 407, 398, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (400, 408, 399, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (401, 409, 400, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (402, 410, 401, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (403, 411, 402, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (404, 412, 403, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (405, 413, 404, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (406, 414, 405, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (407, 415, 406, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (408, 416, 407, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (409, 417, 408, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (410, 418, 409, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (411, 419, 410, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (412, 420, 411, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (413, 421, 412, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (414, 422, 413, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (415, 423, 414, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (416, 424, 415, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (417, 425, 416, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (418, 426, 417, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (419, 427, 418, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (420, 428, 419, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (421, 429, 420, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (422, 430, 421, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (423, 431, 422, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (424, 432, 423, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (425, 433, 424, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (426, 434, 425, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (427, 435, 426, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (428, 436, 427, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (429, 437, 428, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (430, 438, 429, '2023-11-29');
INSERT INTO `rfid_cage` VALUES (440, 11, 14, '2023-12-06');
INSERT INTO `rfid_cage` VALUES (441, 451, 431, '2023-12-07');
INSERT INTO `rfid_cage` VALUES (445, 452, 432, '2023-12-08');
INSERT INTO `rfid_cage` VALUES (449, 450, 430, '2023-12-08');
INSERT INTO `rfid_cage` VALUES (451, 21, 12, '2023-12-09');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` int NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pasture_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile` ASC) USING BTREE,
  INDEX `tb_user_pasture_id_f66dadb7_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  CONSTRAINT `tb_user_pasture_id_f66dadb7_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'pbkdf2_sha256$720000$Rz4efNXYhumAIoy43kWB85$eadkLuQRB1M80NK6JwyCS2Vfxf0CFWFgCLwcHChkA2Q=', '2023-12-05 11:05:26.173171', 1, 'admin', '', '', '', 1, 1, '2023-10-24 09:58:12.989753', NULL, '', 3, '', NULL);

-- ----------------------------
-- Table structure for tb_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_groups`;
CREATE TABLE `tb_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_user_groups_user_id_group_id_adb62351_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `tb_user_groups_group_id_3d826fde_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `tb_user_groups_group_id_3d826fde_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_user_groups_user_id_162ae03c_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_user_permissions`;
CREATE TABLE `tb_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_user_user_permissions_user_id_permission_id_fb1d58db_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `tb_user_user_permiss_permission_id_83890c0b_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `tb_user_user_permiss_permission_id_83890c0b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_user_user_permissions_user_id_1b639637_fk_tb_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for unlink_calf
-- ----------------------------
DROP TABLE IF EXISTS `unlink_calf`;
CREATE TABLE `unlink_calf`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `u_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `calf_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` smallint NOT NULL,
  `birth_weight` double NOT NULL,
  `weight_unlink` double NOT NULL,
  `date_unlink` date NOT NULL,
  `rsn_unlink` int NOT NULL,
  `infor_unlink` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pasture_id` bigint NOT NULL,
  `weight_day_add` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unlink_calf_pasture_id_bf65a0de_fk_pasture_id`(`pasture_id` ASC) USING BTREE,
  INDEX `unlink_calf_c_time_1fc2fbf2`(`c_time` ASC) USING BTREE,
  INDEX `unlink_calf_u_time_e5c8a9b9`(`u_time` ASC) USING BTREE,
  INDEX `unlink_calf_is_delete_eddcea36`(`is_delete` ASC) USING BTREE,
  INDEX `unlink_calf_date_of_birth_5bfdf630`(`date_of_birth` ASC) USING BTREE,
  INDEX `unlink_calf_sex_cc12c1bb`(`sex` ASC) USING BTREE,
  INDEX `unlink_calf_birth_weight_d29c0096`(`birth_weight` ASC) USING BTREE,
  INDEX `unlink_calf_weight_unlink_fa7ff60f`(`weight_unlink` ASC) USING BTREE,
  INDEX `unlink_calf_date_unlink_6b879bc6`(`date_unlink` ASC) USING BTREE,
  INDEX `unlink_calf_rsn_unlink_86f0aa6b`(`rsn_unlink` ASC) USING BTREE,
  INDEX `unlink_calf_weight_day_add_505f8dec`(`weight_day_add` ASC) USING BTREE,
  INDEX `unlink_calf_calf_id_ff40cd7d`(`calf_id` ASC) USING BTREE,
  CONSTRAINT `unlink_calf_pasture_id_bf65a0de_fk_pasture_id` FOREIGN KEY (`pasture_id`) REFERENCES `pasture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unlink_calf
-- ----------------------------

-- ----------------------------
-- Triggers structure for table cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_cage_insert`;
delimiter ;;
CREATE TRIGGER `after_cage_insert` AFTER INSERT ON `cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = NEW.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( NEW.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_cage_update`;
delimiter ;;
CREATE TRIGGER `after_cage_update` AFTER UPDATE ON `cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_cage_delete`;
delimiter ;;
CREATE TRIGGER `after_cage_delete` AFTER DELETE ON `cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 OLD.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_insert`;
delimiter ;;
CREATE TRIGGER `after_calf_insert` AFTER INSERT ON `calf` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = NEW.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( NEW.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_update`;
delimiter ;;
CREATE TRIGGER `after_calf_update` AFTER UPDATE ON `calf` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_delete`;
delimiter ;;
CREATE TRIGGER `after_calf_delete` AFTER DELETE ON `calf` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 OLD.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_cage_insert`;
delimiter ;;
CREATE TRIGGER `after_calf_cage_insert` AFTER INSERT ON `calf_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		calf 
	WHERE
		id = NEW.calf_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_cage_update`;
delimiter ;;
CREATE TRIGGER `after_calf_cage_update` AFTER UPDATE ON `calf_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		calf 
	WHERE
		id = OLD.calf_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table calf_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_calf_cage_delete`;
delimiter ;;
CREATE TRIGGER `after_calf_cage_delete` AFTER DELETE ON `calf_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		calf 
	WHERE
		id = OLD.calf_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table feeding_standard
-- ----------------------------
DROP TRIGGER IF EXISTS `after_feeding_standard_insert`;
delimiter ;;
CREATE TRIGGER `after_feeding_standard_insert` AFTER INSERT ON `feeding_standard` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = NEW.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( NEW.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table feeding_standard
-- ----------------------------
DROP TRIGGER IF EXISTS `after_feeding_standard_update`;
delimiter ;;
CREATE TRIGGER `after_feeding_standard_update` AFTER UPDATE ON `feeding_standard` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table feeding_standard
-- ----------------------------
DROP TRIGGER IF EXISTS `after_feeding_standard_delete`;
delimiter ;;
CREATE TRIGGER `after_feeding_standard_delete` AFTER DELETE ON `feeding_standard` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 OLD.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_insert`;
delimiter ;;
CREATE TRIGGER `after_rfid_insert` AFTER INSERT ON `rfid` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = NEW.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( NEW.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_update`;
delimiter ;;
CREATE TRIGGER `after_rfid_update` AFTER UPDATE ON `rfid` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 NEW.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_delete`;
delimiter ;;
CREATE TRIGGER `after_rfid_delete` AFTER DELETE ON `rfid` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;-- 检索与 OLD.pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = OLD.pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( OLD.pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_cage_insert`;
delimiter ;;
CREATE TRIGGER `after_rfid_cage_insert` AFTER INSERT ON `rfid_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		rfid 
	WHERE
		id = NEW.rfid_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_cage_update`;
delimiter ;;
CREATE TRIGGER `after_rfid_cage_update` AFTER UPDATE ON `rfid_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		rfid 
	WHERE
		id = OLD.rfid_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rfid_cage
-- ----------------------------
DROP TRIGGER IF EXISTS `after_rfid_cage_delete`;
delimiter ;;
CREATE TRIGGER `after_rfid_cage_delete` AFTER DELETE ON `rfid_cage` FOR EACH ROW BEGIN
	DECLARE
		existing_id BIGINT;
	DECLARE
		related_pasture_id BIGINT;-- 从 rfid 表中获取与 rfid_cage 表中更新的行相对应的 pasture_id
	SELECT
		pasture_id INTO related_pasture_id 
	FROM
		rfid 
	WHERE
		id = OLD.rfid_id;-- 检索与 related_pasture_id 相关联的 data_update_status 表中的记录
	SELECT
		id INTO existing_id 
	FROM
		data_update_status 
	WHERE
		pasture_id = related_pasture_id;
	IF
		existing_id IS NULL THEN-- 如果在 data_update_status 中找不到相关记录，则创建一条新记录
			INSERT INTO data_update_status ( pasture_id, is_synced, u_time)
		VALUES
			( related_pasture_id, FALSE, NOW());
		ELSE -- 如果找到了相关记录，则更新这条记录的 is_synced 字段
		UPDATE data_update_status 
		SET is_synced = FALSE,
		u_time = NOW() 
		WHERE
			id = existing_id;
		
	END IF;
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
