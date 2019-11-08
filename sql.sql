# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: LucidVMSDB
# Generation Time: 2019-11-08 09:23:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_type`;

CREATE TABLE `access_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL DEFAULT '',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `access_type` WRITE;
/*!40000 ALTER TABLE `access_type` DISABLE KEYS */;

INSERT INTO `access_type` (`id`, `description`, `date_created`)
VALUES
	(1,'SUPPLIER','2019-11-08 16:54:46'),
	(2,'ADMIN','2019-11-08 16:54:59'),
	(3,'APPROVER','2019-11-08 16:55:10');

/*!40000 ALTER TABLE `access_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`id`, `description`, `date_created`)
VALUES
	(1,'PENDING','2019-11-08 16:55:21'),
	(2,'ACCREDITED','2019-11-08 16:55:49'),
	(3,'BLOCKED','2019-11-08 16:55:57');

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(250) NOT NULL DEFAULT '',
  `contact_person` varchar(100) NOT NULL DEFAULT '',
  `contact_number` varchar(20) NOT NULL DEFAULT '',
  `supplier_type_id` int(11) unsigned NOT NULL,
  `status_id` int(11) unsigned NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `supplier_type_id` (`supplier_type_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supplier_type_id`) REFERENCES `supplier_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supplier_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table supplier_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_type`;

CREATE TABLE `supplier_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL DEFAULT '',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `supplier_type` WRITE;
/*!40000 ALTER TABLE `supplier_type` DISABLE KEYS */;

INSERT INTO `supplier_type` (`id`, `description`, `date_created`)
VALUES
	(1,'WOODWORKS','2019-11-08 16:56:28'),
	(2,'ELECTRICAL','2019-11-08 16:59:21'),
	(3,'FOOD','2019-11-08 16:59:33'),
	(4,'OFFICE SUPPLIES','2019-11-08 16:59:50');

/*!40000 ALTER TABLE `supplier_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `access_type_id` int(11) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `access_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
