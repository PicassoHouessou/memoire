DROP DATABASE IF EXISTS messagerie;
START TRANSACTION;
--
-- Current Database: `messagerie`
--
CREATE DATABASE IF NOT EXISTS messagerie DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci';
CREATE USER IF NOT EXISTS 'messagerieUser'@'localhost' IDENTIFIED BY  'amettre' ;
GRANT ALL ON `messagerie`.* TO  'messagerieUser'@'localhost' ;
USE `messagerie`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `telephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailUnique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `admin`
--

INSERT INTO `admin` VALUES (1,'master@eneam.da','$argon2i$v=19$m=1024,t=2,p=2$RFNLaHNyS1ROUmlqT0YuRQ$YyWyEK06b6SPLN0nxo4xuBpZgT2pnLGhtN4Cm+vp4f0','master','master',1,NULL) ;

--
-- Table structure for table `virtual_domains`
--

DROP TABLE IF EXISTS `virtual_domains`;
CREATE TABLE `virtual_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `virtual_domains`
--

INSERT INTO `virtual_domains` VALUES (1,'eneam.da');

--
-- Table structure for table `virtual_users`
--

DROP TABLE IF EXISTS `virtual_users`;
CREATE TABLE `virtual_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `maildir` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Table structure for table `virtual_users_infos`
--

DROP TABLE IF EXISTS `virtual_users_infos`;
CREATE TABLE `virtual_users_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtual_user_id` int(11) NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricule` int(11) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `pays` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `delete_token` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cle_etrangere` (`virtual_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

COMMIT ;