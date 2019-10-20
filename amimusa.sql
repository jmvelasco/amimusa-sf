-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: amimusa
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Visites`
--

DROP TABLE IF EXISTS `Visites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visites` (
  `id_publication` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_publication`,`date`,`referer`),
  KEY `publication_IDX` (`id_publication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visites`
--

LOCK TABLES `Visites` WRITE;
/*!40000 ALTER TABLE `Visites` DISABLE KEYS */;
/*!40000 ALTER TABLE `Visites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contributors`
--

DROP TABLE IF EXISTS `contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `description` mediumtext,
  `link_to_profile` varchar(80) DEFAULT NULL,
  `inscription_date` timestamp NULL DEFAULT NULL,
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `security_token` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `UNIQ_72D2626292FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_72D26262A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_72D26262C05FB297` (`confirmation_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributors`
--

LOCK TABLES `contributors` WRITE;
/*!40000 ALTER TABLE `contributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `contributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id_publication` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `referer` varchar(255) NOT NULL,
  PRIMARY KEY (`id_publication`,`date`,`referer`),
  KEY `publication_IDX` (`id_publication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musas`
--

DROP TABLE IF EXISTS `musas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musas`
--

LOCK TABLES `musas` WRITE;
/*!40000 ALTER TABLE `musas` DISABLE KEYS */;
/*!40000 ALTER TABLE `musas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contributor` int(11) DEFAULT NULL,
  `id_writting` int(11) DEFAULT NULL,
  `id_state` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `writting_FK` (`id_writting`),
  KEY `contributor_FK` (`id_contributor`),
  KEY `state_FK` (`id_state`),
  CONSTRAINT `FK_32783AF440C1075C` FOREIGN KEY (`id_writting`) REFERENCES `writtings` (`id`),
  CONSTRAINT `FK_32783AF44D1693CB` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`),
  CONSTRAINT `FK_32783AF4C27D5A64` FOREIGN KEY (`id_contributor`) REFERENCES `contributors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_musas`
--

DROP TABLE IF EXISTS `publications_musas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_musas` (
  `id_publication` int(11) NOT NULL,
  `id_musa` int(11) NOT NULL,
  PRIMARY KEY (`id_publication`,`id_musa`),
  KEY `IDX_7EF2161FFB53D80` (`id_musa`),
  CONSTRAINT `FK_7EF2161FB72EAA8E` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_musas`
--

LOCK TABLES `publications_musas` WRITE;
/*!40000 ALTER TABLE `publications_musas` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_musas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_type`
--

DROP TABLE IF EXISTS `publications_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_type`
--

LOCK TABLES `publications_type` WRITE;
/*!40000 ALTER TABLE `publications_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Published'),(2,'Draft'),(3,'Deleted');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writtings`
--

DROP TABLE IF EXISTS `writtings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writtings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `body` longtext,
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL,
  `publication_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publication_type_FK` (`publication_type`),
  CONSTRAINT `FK_F9A6AFF48726D6E4` FOREIGN KEY (`publication_type`) REFERENCES `publications_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writtings`
--

LOCK TABLES `writtings` WRITE;
/*!40000 ALTER TABLE `writtings` DISABLE KEYS */;
/*!40000 ALTER TABLE `writtings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-20 14:39:56
