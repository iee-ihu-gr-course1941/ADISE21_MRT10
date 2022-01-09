-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: moutzouris
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

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
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deck` (
  `Numcard` tinyint(2) NOT NULL,
  `Symbcard` varchar(1) NOT NULL,
  `Player` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES (1,'C',''),(2,'C',''),(3,'C',''),(4,'C',''),(5,'C',''),(6,'C',''),(7,'C',''),(8,'C',''),(9,'C',''),(10,'C',''),(13,'C',''),(1,'S',''),(2,'S',''),(3,'S',''),(4,'S',''),(5,'S',''),(6,'S',''),(7,'S',''),(8,'S',''),(9,'S',''),(10,'S',''),(1,'H',''),(2,'H',''),(3,'H',''),(4,'H',''),(5,'H',''),(6,'H',''),(7,'H',''),(8,'H',''),(9,'H',''),(10,'H',''),(1,'D',''),(2,'D',''),(3,'D',''),(4,'D',''),(5,'D',''),(6,'D',''),(7,'D',''),(8,'D',''),(9,'D',''),(10,'D','');
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck_field`
--

DROP TABLE IF EXISTS `deck_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deck_field` (
  `Numcard` tinyint(2) NOT NULL,
  `Symbcard` varchar(1) NOT NULL,
  `Player` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck_field`
--

LOCK TABLES `deck_field` WRITE;
/*!40000 ALTER TABLE `deck_field` DISABLE KEYS */;
INSERT INTO `deck_field` VALUES (4,'S','P2'),(5,'H','P2'),(4,'D','P2'),(5,'S','P2'),(2,'C','P2'),(2,'S','P2'),(4,'H','P2'),(1,'H','P2'),(7,'H','P2'),(10,'S','P2'),(3,'D','P2'),(5,'C','P2'),(3,'S','P2'),(9,'S','P2'),(6,'C','P2'),(10,'D','P2'),(3,'C','P2'),(13,'C','P2'),(2,'D','P2'),(10,'C','P2'),(6,'H','P2'),(1,'C','P1'),(2,'H','P1'),(8,'D','P1'),(9,'D','P1'),(6,'D','P1'),(7,'D','P1'),(1,'D','P1'),(6,'S','P1'),(4,'C','P1'),(9,'H','P1'),(3,'H','P1'),(8,'C','P1'),(5,'D','P1'),(8,'S','P1'),(8,'H','P1'),(1,'S','P1'),(9,'C','P1'),(10,'H','P1'),(7,'S','P1'),(7,'C','P1');
/*!40000 ALTER TABLE `deck_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('P1','P2') DEFAULT NULL,
  `result` enum('P1','P2') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `playerId` varchar(20) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-09 12:22:11
