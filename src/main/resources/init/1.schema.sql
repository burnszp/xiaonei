/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : xiaoyou

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2015-04-12 10:26:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acct_permission`
-- ----------------------------
DROP TABLE IF EXISTS `acct_permission`;
CREATE TABLE `acct_permission` (
`id`  bigint(20) NOT NULL ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`key`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sort_num`  int(11) NULL DEFAULT NULL ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `acct_role`
-- ----------------------------
DROP TABLE IF EXISTS `acct_role`;
CREATE TABLE `acct_role` (
`id`  bigint(20) NOT NULL ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `acct_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `acct_role_permission`;
CREATE TABLE `acct_role_permission` (
`role_id`  bigint(20) NOT NULL ,
`permission_id`  bigint(20) NOT NULL ,
FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`permission_id`) REFERENCES `acct_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `acct_user`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
`id`  bigint(20) NOT NULL ,
`login_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`salt`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`register_date`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `acct_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
`user_id`  bigint(20) NOT NULL ,
`role_id`  bigint(20) NOT NULL ,
FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_college`
-- ----------------------------
DROP TABLE IF EXISTS `fr_college`;
CREATE TABLE `fr_college` (
`id`  bigint(20) NOT NULL ,
`cname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`addr_code`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区编码对应sys_region表中的id' ,
`addr`  varchar(62) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_group`;
CREATE TABLE `fr_group` (
`id`  bigint(20) NOT NULL ,
`gname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`descript`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  int(11) NOT NULL DEFAULT 1 COMMENT '群组状态：1：活动小组；2：已关闭;3:已关闭' ,
`college`  bigint(20) NULL DEFAULT NULL COMMENT '所属学校' ,
`addr_code`  bigint(20) NULL DEFAULT NULL COMMENT '群组所在地区编码' ,
`createtime`  date NULL DEFAULT '0000-00-00' ,
`creator_id`  bigint(20) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_message`
-- ----------------------------
DROP TABLE IF EXISTS `fr_message`;
CREATE TABLE `fr_message` (
`id`  bigint(20) NOT NULL ,
`title`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`createtime`  date NULL DEFAULT NULL COMMENT '发布日期' ,
`status`  int(11) NULL DEFAULT 0 COMMENT '状态：0：发布中；1：已关闭' ,
`tid`  bigint(20) NULL DEFAULT NULL COMMENT '所属消息类型id' ,
`uid`  bigint(20) NULL DEFAULT NULL COMMENT '发布者id' ,
`gid`  bigint(20) NULL DEFAULT NULL ,
`replay_id`  bigint(20) NULL DEFAULT 0 COMMENT '如果该字段有值，说明该消息是一个回复消息，该字段表示回复的那个消息的id' ,
`istop`  int(11) NULL DEFAULT 1 COMMENT '是否置顶：0是，1：不制定' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_msgbox`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgbox`;
CREATE TABLE `fr_msgbox` (
`id`  bigint(20) NOT NULL ,
`send_user`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息发送者' ,
`send_date`  date NULL DEFAULT NULL COMMENT '发送日期' ,
`if_read`  int(11) NULL DEFAULT NULL COMMENT '是否读过，0：未读，1：已读' ,
`receive_user`  bigint(20) NULL DEFAULT NULL COMMENT '消息接受者' ,
`descript`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='收件箱'

;

-- ----------------------------
-- Table structure for `fr_msgtype`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgtype`;
CREATE TABLE `fr_msgtype` (
`id`  bigint(20) NOT NULL ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_school`
-- ----------------------------
DROP TABLE IF EXISTS `fr_school`;
CREATE TABLE `fr_school` (
`id`  bigint(20) NOT NULL ,
`sname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cid`  bigint(20) NOT NULL COMMENT '所属学校id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_user`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user`;
CREATE TABLE `fr_user` (
`id`  bigint(20) NOT NULL ,
`uname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pwd`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nick_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`real_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tel`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`qq`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cid`  bigint(20) NULL DEFAULT NULL COMMENT '所属学校id' ,
`sid`  bigint(20) NULL DEFAULT NULL COMMENT '所属院系id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `fr_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user_group`;
CREATE TABLE `fr_user_group` (
`id`  bigint(20) NOT NULL ,
`fr_group_id`  bigint(20) NULL DEFAULT NULL COMMENT '群组id' ,
`fr_user_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
`id`  bigint(20) NOT NULL ,
`log_type`  tinyint(4) NOT NULL ,
`ip`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
`id`  bigint(20) NOT NULL ,
`param_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`param_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`param_type`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`param_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`param_desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_modify_time`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`last_modify_by`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `sys_region`
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
`id`  bigint(20) NOT NULL COMMENT '地区编码，后四位为0的地区是省份' ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称' ,
`description`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区描述' ,
`lng`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度' ,
`lat`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='地区编码表'

;
 
-- ----------------------------
-- Indexes structure for table acct_role_permission
-- ----------------------------
CREATE INDEX `role_id` USING BTREE ON `acct_role_permission`(`role_id`) ;
CREATE INDEX `permission_id` USING BTREE ON `acct_role_permission`(`permission_id`) ;

-- ----------------------------
-- Indexes structure for table acct_user
-- ----------------------------
CREATE UNIQUE INDEX `login_name` USING BTREE ON `acct_user`(`login_name`) ;

-- ----------------------------
-- Indexes structure for table acct_user_role
-- ----------------------------
CREATE INDEX `user_id` USING BTREE ON `acct_user_role`(`user_id`) ;
CREATE INDEX `role_id` USING BTREE ON `acct_user_role`(`role_id`) ;
