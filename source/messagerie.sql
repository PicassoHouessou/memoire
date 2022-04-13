-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: messagerie
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailUnique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@eneam.da','$argon2i$v=19$m=1024,t=2,p=2$RFNLaHNyS1ROUmlqT0YuRQ$YyWyEK06b6SPLN0nxo4xuBpZgT2pnLGhtN4Cm+vp4f0','Houessou','Picasso'),(2,'master@eneam.da','$argon2i$v=19$m=1024,t=2,p=2$RFNLaHNyS1ROUmlqT0YuRQ$YyWyEK06b6SPLN0nxo4xuBpZgT2pnLGhtN4Cm+vp4f0','master','master');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES ('2018-07-22');
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_domains`
--

DROP TABLE IF EXISTS `virtual_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_domains`
--

LOCK TABLES `virtual_domains` WRITE;
/*!40000 ALTER TABLE `virtual_domains` DISABLE KEYS */;
INSERT INTO `virtual_domains` VALUES (1,'eneam.da');
/*!40000 ALTER TABLE `virtual_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_users`
--

DROP TABLE IF EXISTS `virtual_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `maildir` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_users`
--

LOCK TABLES `virtual_users` WRITE;
/*!40000 ALTER TABLE `virtual_users` DISABLE KEYS */;
INSERT INTO `virtual_users` VALUES (10,1,'$argon2i$v=19$m=65536,t=4,p=1$cVk1TFVRY2JnTjlaLmNRWQ$tWZ+MIaPTRPGiJlct3dFoEuypXLzSUEo4MBYS2nebYM','facebook@eneam.da','eneam.da/facebook/'),(11,1,'$argon2i$v=19$m=65536,t=4,p=1$d01VMm44NjFWZlo2NUZLZQ$g5CjjLk51liBwJz9TG6v1ZTy6v/lZgnlKvrzIacaQ58','houessoupicasso1@eneam.da','eneam.da/houessoupicasso1/'),(12,1,'$argon2i$v=19$m=65536,t=4,p=1$bWF6T1l4V1hQZDJheC9wdw$hX2Ndb+/nu9jTawGrECLH0zLGFpH4/1fGrPqGw0unYk','fcxerwrexcr@eneam.da','eneam.da/fcxerwrexcr/'),(13,1,'$argon2i$v=19$m=65536,t=4,p=1$by9wZ25rUWkyeGhrVERuSw$du7tQ5d8JQHzSq6FnwTIsyrtA2IFUlwyNLau4DHEsMg','chal@eneam.da','eneam.da/chal/'),(14,1,'$argon2i$v=19$m=65536,t=4,p=1$ekZ5dG0ubGRFTmdwSmtFNw$ADVj4M3MIvvnK8jzmOEwMHZbbPuo62XfA9O10wBPJ3M','gdg@eneam.da','eneam.da/gdg/'),(15,1,'$argon2i$v=19$m=65536,t=4,p=1$czdIQ2tnLkhjYlI0RVY4Ng$fiTJkvfRPvon656BGtRN6JFqppHHJtodHztbRDdUhI0','sssss@eneam.da','eneam.da/sssss/'),(16,1,'$argon2i$v=19$m=65536,t=4,p=1$SzFPLlJDZEhuTjJrVEI3eQ$/hqYWXJLHZ3fXzjRZc+9U2Bjhn1n+XMuyxrUPvuDGps','aaaaaaa@ehehe.eneam.da','eneam.da/aaaaaaa/'),(18,1,'$argon2i$v=19$m=65536,t=4,p=1$YVFZVzR0OEFsbXFRYi4wZw$5gKMvZQqC6FkbC3uRkeqb94Yecfm3A/5enaZ/DDXNH4','bake@eneam.da','eneam.da/bake/'),(19,1,'$argon2i$v=19$m=65536,t=4,p=1$eTJKcVc0dC9pL0ZrZ1NETQ$91dLFAfsz2z8SJEhXlvoQn3trCbx+o3CIZUwA3K1pxA','toto@eneam.da','eneam.da/toto/'),(20,1,'$argon2i$v=19$m=1024,t=2,p=2$RFNLaHNyS1ROUmlqT0YuRQ$YyWyEK06b6SPLN0nxo4xuBpZgT2pnLGhtN4Cm+vp4f0','admin@eneam.da','eneam.da/admin/');
/*!40000 ALTER TABLE `virtual_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_users_infos`
--

DROP TABLE IF EXISTS `virtual_users_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_users_infos`
--

LOCK TABLES `virtual_users_infos` WRITE;
/*!40000 ALTER TABLE `virtual_users_infos` DISABLE KEYS */;
INSERT INTO `virtual_users_infos` VALUES (10,10,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(11,11,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(12,12,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(13,13,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(14,14,'uytrtxt','yvutrt',NULL,NULL,'Bénin',NULL,NULL),(15,15,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(16,16,NULL,NULL,NULL,NULL,'Bénin',NULL,NULL),(18,18,'Bake','Bake',NULL,NULL,'Bénin',NULL,NULL),(19,19,'Toto','Toto',NULL,NULL,'Bénin',NULL,NULL);
/*!40000 ALTER TABLE `virtual_users_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-20 11:23:32
