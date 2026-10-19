CREATE DATABASE  IF NOT EXISTS `loreverse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `loreverse`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loreverse
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `character_factions`
--

DROP TABLE IF EXISTS `character_factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_factions` (
  `character_id` int unsigned NOT NULL,
  `faction_id` int unsigned NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`character_id`,`faction_id`),
  KEY `fk_cf_faction` (`faction_id`),
  CONSTRAINT `fk_cf_character` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cf_faction` FOREIGN KEY (`faction_id`) REFERENCES `factions` (`faction_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_factions`
--

LOCK TABLES `character_factions` WRITE;
/*!40000 ALTER TABLE `character_factions` DISABLE KEYS */;
INSERT INTO `character_factions` VALUES (1,2,'Member');
/*!40000 ALTER TABLE `character_factions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `character_id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `game_id` (`game_id`,`name`),
  CONSTRAINT `fk_characters_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,1,'Johnny Silverhand','Silverhand','Legendary rockerboy, former member of Samurai,\n    and anti-corporate rebel closely associated\n    with the history of Arasaka.','2026-10-19 09:09:24'),(2,1,'Jackie Welles','Jackie','A Night City mercenary and close friend of V.','2026-10-19 09:11:22');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factions`
--

DROP TABLE IF EXISTS `factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factions` (
  `faction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faction_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`faction_id`),
  UNIQUE KEY `game_id` (`game_id`,`name`),
  CONSTRAINT `fk_factions_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factions`
--

LOCK TABLES `factions` WRITE;
/*!40000 ALTER TABLE `factions` DISABLE KEYS */;
INSERT INTO `factions` VALUES (1,1,'Arasaka','Corporation','A powerful megacorporation involved in\n    security, technology, and global politics.'),(2,1,'Samurai','Band','A legendary rock band whose members\n    included Johnny Silverhand.');
/*!40000 ALTER TABLE `factions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franchises`
--

DROP TABLE IF EXISTS `franchises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `franchises` (
  `franchise_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`franchise_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchises`
--

LOCK TABLES `franchises` WRITE;
/*!40000 ALTER TABLE `franchises` DISABLE KEYS */;
INSERT INTO `franchises` VALUES (1,'Cyberpunk','cyberpunk',NULL),(2,'Grand Theft Auto','grand-theft-auto',NULL),(3,'Resident Evil','resident-evil',NULL),(4,'The Legend of Zelda','zelda',NULL),(5,'Assassin\'s Creed','assassins-creed',NULL);
/*!40000 ALTER TABLE `franchises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developer` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `franchise_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `title` (`title`),
  KEY `fk_games_franchise` (`franchise_id`),
  CONSTRAINT `fk_games_franchise` FOREIGN KEY (`franchise_id`) REFERENCES `franchises` (`franchise_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Cyberpunk 2077','CD PROJEKT RED','2020-12-10','An open-world role-playing game set in\n    Night City, where players follow V,\n    a mercenary navigating a world of\n    corporations, cyberware, and crime.','2026-10-19 09:07:02',1);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `game_id` (`game_id`,`name`),
  CONSTRAINT `fk_locations_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'Night City','City','A major metropolitan city on the western\n    coast of North America, known for its\n    powerful corporations and criminal activity.'),(2,1,'Watson','District','A district of Night City containing\n    several neighborhoods, including\n    Kabuki and Little China.'),(3,1,'Pacifica','District','A largely abandoned resort development\n    area of Night City.');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lore_characters`
--

DROP TABLE IF EXISTS `lore_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lore_characters` (
  `entry_id` int unsigned NOT NULL,
  `character_id` int unsigned NOT NULL,
  `connection_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`character_id`),
  KEY `fk_lc_character` (`character_id`),
  CONSTRAINT `fk_lc_character` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lc_entry` FOREIGN KEY (`entry_id`) REFERENCES `lore_entries` (`entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lore_characters`
--

LOCK TABLES `lore_characters` WRITE;
/*!40000 ALTER TABLE `lore_characters` DISABLE KEYS */;
INSERT INTO `lore_characters` VALUES (1,1,'Participant');
/*!40000 ALTER TABLE `lore_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lore_entries`
--

DROP TABLE IF EXISTS `lore_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lore_entries` (
  `entry_id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int unsigned NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_year` smallint unsigned DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`entry_id`),
  UNIQUE KEY `game_id` (`game_id`,`title`),
  CONSTRAINT `fk_lore_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lore_entries`
--

LOCK TABLES `lore_entries` WRITE;
/*!40000 ALTER TABLE `lore_entries` DISABLE KEYS */;
INSERT INTO `lore_entries` VALUES (1,1,'The Arasaka Tower Bombing','Historical Event',2023,'The destruction of Arasaka Tower\n    during the Fourth Corporate War.','In 2023, an assault on Arasaka Tower\n    culminated in a nuclear explosion.\n    Johnny Silverhand participated in\n    the operation, which became a major\n    event in Night City history.',NULL,'2026-10-19 09:36:38');
/*!40000 ALTER TABLE `lore_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lore_factions`
--

DROP TABLE IF EXISTS `lore_factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lore_factions` (
  `entry_id` int unsigned NOT NULL,
  `faction_id` int unsigned NOT NULL,
  `connection_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`faction_id`),
  KEY `faction_id` (`faction_id`),
  CONSTRAINT `lore_factions_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `lore_entries` (`entry_id`) ON DELETE CASCADE,
  CONSTRAINT `lore_factions_ibfk_2` FOREIGN KEY (`faction_id`) REFERENCES `factions` (`faction_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lore_factions`
--

LOCK TABLES `lore_factions` WRITE;
/*!40000 ALTER TABLE `lore_factions` DISABLE KEYS */;
INSERT INTO `lore_factions` VALUES (1,1,'Involved');
/*!40000 ALTER TABLE `lore_factions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lore_locations`
--

DROP TABLE IF EXISTS `lore_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lore_locations` (
  `entry_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`location_id`),
  KEY `fk_ll_location` (`location_id`),
  CONSTRAINT `fk_ll_entry` FOREIGN KEY (`entry_id`) REFERENCES `lore_entries` (`entry_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ll_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lore_locations`
--

LOCK TABLES `lore_locations` WRITE;
/*!40000 ALTER TABLE `lore_locations` DISABLE KEYS */;
INSERT INTO `lore_locations` VALUES (1,1);
/*!40000 ALTER TABLE `lore_locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-19  4:38:31