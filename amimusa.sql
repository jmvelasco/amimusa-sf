-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 02, 2015 at 10:15 PM
-- Server version: 5.5.44
-- PHP Version: 5.4.41-0+deb7u1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amimusa`
--
DROP SCHEMA IF EXISTS`amimusa`;
CREATE SCHEMA `amimusa`;
USE `amimusa`;
-- --------------------------------------------------------

--
-- Table structure for table `contributors`
--

CREATE TABLE IF NOT EXISTS `contributors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `description` mediumtext,
  `link_to_profile` varchar(80) DEFAULT NULL,
  `inscription_date` timestamp NULL DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `security_token` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id_publication` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `referer` varchar(255) NOT NULL,
  PRIMARY KEY (`id_publication`, `date`, `referer`),
  KEY `publication_IDX` (`id_publication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `musas`
--

CREATE TABLE IF NOT EXISTS `musas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
  -- KEY `name_IDX` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE IF NOT EXISTS `publications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_contributor` int(11) unsigned NOT NULL,
  `id_writting` int(11) unsigned NOT NULL,
  `id_state` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
  -- KEY `contributor_FK` (`id_contributor`),
  -- KEY `writting_FK` (`id_writting`),
  -- KEY `state_FK` (`id_state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publications_musas`
--

CREATE TABLE IF NOT EXISTS `publications_musas` (
  `id_publication` int(11) unsigned NOT NULL,
  `id_musa` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_publication`,`id_musa`)
  -- KEY `publication_FK` (`id_publication`),
  -- KEY `musa_FK` (`id_musa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publications_type`
--

CREATE TABLE IF NOT EXISTS `publications_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Published'),
(2, 'Draft'),
(3, 'Deleted');
-- --------------------------------------------------------

--
-- Table structure for table `writtings`
--

CREATE TABLE IF NOT EXISTS `writtings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `body` longtext,
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL,
  `publication_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
  -- KEY `publication_type_FK` (`publication_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `contributor_FK` FOREIGN KEY (`id_contributor`) REFERENCES `contributors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `state_FK` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `writting_FK` FOREIGN KEY (`id_writting`) REFERENCES `writtings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publications_musas`
--
ALTER TABLE `publications_musas`
  ADD CONSTRAINT `musa_FK` FOREIGN KEY (`id_musa`) REFERENCES `musas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_FK` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `writtings`
--
ALTER TABLE `writtings`
  ADD CONSTRAINT `publication_type_FK` FOREIGN KEY (`publication_type`) REFERENCES `publications_type` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
