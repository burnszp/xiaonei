DROP TABLE IF EXISTS `acct_permission`;
CREATE TABLE `acct_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `key` varchar(20) NOT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `acct_permission` VALUES (1,'浏览用户','user:list',1,NULL),(2,'添加用户','user:add',2,NULL),(3,'修改用户','user:modify',3,NULL),(4,'删除用户','user:remove',4,NULL),(5,'浏览角色','role:list',5,NULL),(6,'添加角色','role:add',6,NULL),(7,'修改角色','role:modify',7,NULL),(8,'删除角色','role:remove',8,NULL),(9,'浏览日志','log:list',9,NULL),(10,'浏览系统参数','param:list',10,NULL),(11,'修改系统参数','param:modify',11,NULL);
 

DROP TABLE IF EXISTS `acct_role`;
CREATE TABLE `acct_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8; 
INSERT INTO `acct_role` VALUES (1,'用户管理员','只能对用户进行操作'),(2,'超级管理员','超级管理员');
 

DROP TABLE IF EXISTS `acct_role_permission`;
CREATE TABLE `acct_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `acct_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`),
  CONSTRAINT `acct_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `acct_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
INSERT INTO `acct_role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11);
 

DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

 
INSERT INTO `acct_user` VALUES (1,'admin','Admin','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','2012-06-03 17:00:00'),(2,'user','Calvin','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','2012-06-03 18:00:00'),(3,'test','test','6269761c24740c8c65cbb2696bc6ff508042982d','11a9f442812060dc','2013-12-27 01:27:52'),(7,'asdf','223','f1d1af8d6b86ac3cde167b250dcedb4ed34b9fb8','412645ead7b9fc93','2013-12-30 03:11:37'),(8,'gg','gg','2bf1efa58e708e15c5b3dbe6b37ac886dcc52099','f78acdaf70f26a6e','2013-12-30 03:12:03'),(9,'tester1','张三','e4f313cf742cac21aaf6acacf2c93dead56ab1b4','47bd01eb1de80501','2014-02-14 17:35:49');
 

DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `acct_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`),
  CONSTRAINT `acct_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `acct_user_role` VALUES (3,1),(2,1),(1,1),(1,2),(8,1),(7,1),(9,1),(9,2);

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(100) NOT NULL,
  `param_value` varchar(100) NOT NULL,
  `param_type` varchar(1) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_desc` varchar(255) DEFAULT NULL,
  `last_modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
