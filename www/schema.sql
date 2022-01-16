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
-- Table structure for table `deck_board`
--

DROP TABLE IF EXISTS `deck_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deck_board` (
  `numcard` enum('1','2','3','4','5','6','7','8','9','10','K') NOT NULL,
  `symbcard` enum('H','D','C','S') NOT NULL,
  `idcard` int(2) NOT NULL,
  `player` enum('P1','P2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck_board`
--

LOCK TABLES `deck_board` WRITE;
/*!40000 ALTER TABLE `deck_board` DISABLE KEYS */;
INSERT INTO `deck_board` VALUES ('K','C',11,'P1');
/*!40000 ALTER TABLE `deck_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck_start`
--

DROP TABLE IF EXISTS `deck_start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deck_start` (
  `numcard` enum('1','2','3','4','5','6','7','8','9','10','K') NOT NULL,
  `symbcard` enum('H','D','C','S') NOT NULL,
  `idcard` int(2) NOT NULL,
  `player` enum('P1','P2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck_start`
--

LOCK TABLES `deck_start` WRITE;
/*!40000 ALTER TABLE `deck_start` DISABLE KEYS */;
INSERT INTO `deck_start` VALUES ('1','C',1,'P1'),('2','C',2,'P1'),('3','C',3,'P1'),('4','C',4,'P1'),('5','C',5,'P1'),('6','C',6,'P1'),('7','C',7,'P1'),('8','C',8,'P1'),('9','C',9,'P1'),('10','C',10,'P1'),('K','C',11,'P1'),('1','S',12,'P1'),('2','S',13,'P1'),('3','S',14,'P1'),('4','S',15,'P1'),('5','S',16,'P1'),('6','S',17,'P1'),('7','S',18,'P1'),('8','S',19,'P1'),('9','S',20,'P1'),('10','S',21,'P2'),('1','H',22,'P2'),('2','H',23,'P2'),('3','H',24,'P2'),('4','H',25,'P2'),('5','H',26,'P2'),('6','H',27,'P2'),('7','H',28,'P2'),('8','H',29,'P2'),('9','H',30,'P2'),('10','H',31,'P2'),('1','D',32,'P2'),('2','D',33,'P2'),('3','D',34,'P2'),('4','D',35,'P2'),('5','D',36,'P2'),('6','D',37,'P2'),('7','D',38,'P2'),('8','D',39,'P2'),('9','D',40,'P2'),('10','D',41,'P1');
/*!40000 ALTER TABLE `deck_start` ENABLE KEYS */;
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
INSERT INTO `game_status` VALUES ('ended','P2','P2','2022-01-16 18:09:22');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT 'null',
  `player` enum('P1','P2') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('mourat','P1','afa0b3a9a7f64b20ad0411865bf8ec97','2022-01-16 18:08:00'),('sakis','P2','26f3df5e5f342e992eb6a2981dbd0929','2022-01-16 18:08:06');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'moutzouris'
--
/*!50003 DROP PROCEDURE IF EXISTS `assign_cards_toplayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_cards_toplayers`()
BEGIN
REPLACE INTO deck_board SELECT * FROM deck_start ORDER BY RAND();
UPDATE deck_board SET player='P1' ;
UPDATE deck_board SET player='P2' limit 21;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reset_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_all`()
BEGIN
delete from game_status;
delete from players;
INSERT INTO `game_status` VALUES ('not active',NULL,NULL,NULL);
INSERT INTO `players` VALUES (NULL,'P1',NULL,NULL),(NULL,'P2',NULL,NULL);
delete from deck_board;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-16 20:16:40
