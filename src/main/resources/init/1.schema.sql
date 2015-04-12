/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : xiaoyou

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2015-04-12 22:15:49
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
FOREIGN KEY (`permission_id`) REFERENCES `acct_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `role_id` USING BTREE (`role_id`) ,
INDEX `permission_id` USING BTREE (`permission_id`) 
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
`login_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员帐号' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名' ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码' ,
`salt`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`register_date`  timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `login_name` USING BTREE (`login_name`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='管理员'

;

-- ----------------------------
-- Table structure for `acct_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
`user_id`  bigint(20) NOT NULL ,
`role_id`  bigint(20) NOT NULL ,
FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `user_id` USING BTREE (`user_id`) ,
INDEX `role_id` USING BTREE (`role_id`) 
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
`cname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学校名称' ,
`addr_code`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区编码对应sys_region表中的id' ,
`addr`  varchar(62) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='学院，院系'

;

-- ----------------------------
-- Table structure for `fr_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_group`;
CREATE TABLE `fr_group` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`gname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群组名称' ,
`descript`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' ,
`status`  int(11) NOT NULL DEFAULT 1 COMMENT '群组状态：1：活动小组；2：已关闭;3:已关闭' ,
`college`  bigint(20) NULL DEFAULT NULL COMMENT '所属学校' ,
`addr_code`  bigint(20) NULL DEFAULT NULL COMMENT '群组所在地区编码' ,
`createtime`  date NULL DEFAULT '0000-00-00' COMMENT '创建日期' ,
`creator_id`  bigint(20) NULL DEFAULT NULL COMMENT '创建者id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='群组'
AUTO_INCREMENT=11

;

-- ----------------------------
-- Table structure for `fr_message`
-- ----------------------------
DROP TABLE IF EXISTS `fr_message`;
CREATE TABLE `fr_message` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`title`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题' ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容' ,
`createtime`  date NULL DEFAULT NULL COMMENT '发布日期' ,
`status`  int(11) NULL DEFAULT 0 COMMENT '状态：0：发布中；1：已关闭' ,
`tid`  bigint(20) NULL DEFAULT NULL COMMENT '所属消息类型id' ,
`uid`  bigint(20) NULL DEFAULT NULL COMMENT '发布者id' ,
`gid`  bigint(20) NULL DEFAULT NULL COMMENT '所属群组id' ,
`replay_id`  bigint(20) NULL DEFAULT 0 COMMENT '如果该字段有值，说明该消息是一个回复消息，该字段表示回复的那个消息的id' ,
`istop`  int(11) NULL DEFAULT 1 COMMENT '是否置顶：0是，1：不制定' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='帖子'
AUTO_INCREMENT=80

;

-- ----------------------------
-- Table structure for `fr_msgbox`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgbox`;
CREATE TABLE `fr_msgbox` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
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
AUTO_INCREMENT=8

;

-- ----------------------------
-- Table structure for `fr_msgtype`
-- ----------------------------
DROP TABLE IF EXISTS `fr_msgtype`;
CREATE TABLE `fr_msgtype` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型名称' ,
`descript`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Table structure for `fr_school`
-- ----------------------------
DROP TABLE IF EXISTS `fr_school`;
CREATE TABLE `fr_school` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cid`  bigint(20) NOT NULL COMMENT '所属学校id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='学校'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `fr_user`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user`;
CREATE TABLE `fr_user` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`uname`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名' ,
`pwd`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`nick_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称' ,
`real_name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`email`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email' ,
`tel`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`qq`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq' ,
`cid`  bigint(20) NULL DEFAULT NULL COMMENT '所属学校id' ,
`sid`  bigint(20) NULL DEFAULT NULL COMMENT '所属院系id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户'
AUTO_INCREMENT=6

;

-- ----------------------------
-- Table structure for `fr_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `fr_user_group`;
CREATE TABLE `fr_user_group` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`fr_group_id`  bigint(20) NULL DEFAULT NULL COMMENT '群组id' ,
`fr_user_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户群组关系表'
AUTO_INCREMENT=20

;

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`log_type`  tinyint(4) NOT NULL ,
`ip`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`create_time`  timestamp NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
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
AUTO_INCREMENT=1

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
-- Auto increment value for `fr_group`
-- ----------------------------
ALTER TABLE `fr_group` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `fr_message`
-- ----------------------------
ALTER TABLE `fr_message` AUTO_INCREMENT=80;

-- ----------------------------
-- Auto increment value for `fr_msgbox`
-- ----------------------------
ALTER TABLE `fr_msgbox` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `fr_msgtype`
-- ----------------------------
ALTER TABLE `fr_msgtype` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `fr_school`
-- ----------------------------
ALTER TABLE `fr_school` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `fr_user`
-- ----------------------------
ALTER TABLE `fr_user` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `fr_user_group`
-- ----------------------------
ALTER TABLE `fr_user_group` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for `sys_log`
-- ----------------------------
ALTER TABLE `sys_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `sys_param`
-- ----------------------------
ALTER TABLE `sys_param` AUTO_INCREMENT=1;
