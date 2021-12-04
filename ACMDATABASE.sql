-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: acm_database
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `city_chapter`
--

DROP TABLE IF EXISTS `city_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_chapter` (
  `city` varchar(45) NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city`),
  KEY `fk_CITY_CHAPTER_STATECHAPTER1_idx` (`state_name`),
  CONSTRAINT `fk_CITY_CHAPTER_STATECHAPTER1` FOREIGN KEY (`state_name`) REFERENCES `statechapter` (`state_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_chapter`
--

LOCK TABLES `city_chapter` WRITE;
/*!40000 ALTER TABLE `city_chapter` DISABLE KEYS */;
INSERT INTO `city_chapter` VALUES ('Bellville','Texas'),('Bryan','Texas'),('College Station','Texas'),('Houston','Texas'),('Round Top','Texas'),('Sealy','Texas');
/*!40000 ALTER TABLE `city_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinator`
--

DROP TABLE IF EXISTS `coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinator` (
  `coordinator_id` int NOT NULL,
  `chairman_id` int DEFAULT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coordinator_id`),
  KEY `fk_COORDINATOR_STATECHAIRMAN1_idx` (`chairman_id`),
  KEY `fk_COORDINATOR_STATECHAPTER1_idx` (`state_name`),
  CONSTRAINT `fk_COORDINATOR_STATECHAIRMAN1` FOREIGN KEY (`chairman_id`) REFERENCES `countrychairman` (`chairman_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_COORDINATOR_STATECHAPTER1` FOREIGN KEY (`state_name`) REFERENCES `statechapter` (`state_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinator`
--

LOCK TABLES `coordinator` WRITE;
/*!40000 ALTER TABLE `coordinator` DISABLE KEYS */;
INSERT INTO `coordinator` VALUES (2,1,'Texas'),(3,1,'Texas'),(4,1,'Texas'),(5,1,'Texas'),(6,1,'Texas');
/*!40000 ALTER TABLE `coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrychairman`
--

DROP TABLE IF EXISTS `countrychairman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrychairman` (
  `chairman_id` int NOT NULL,
  `year_of_hire` varchar(45) DEFAULT NULL,
  `chairman_name` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`chairman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrychairman`
--

LOCK TABLES `countrychairman` WRITE;
/*!40000 ALTER TABLE `countrychairman` DISABLE KEYS */;
INSERT INTO `countrychairman` VALUES (1,'2021','Smitty Werben','Chairman','5555555555');
/*!40000 ALTER TABLE `countrychairman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `sub_type` varchar(45) DEFAULT NULL,
  `member_name` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `date_of_joining` varchar(45) DEFAULT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fk_MEMBER_SUB_ENTITY_CHAPTER1_idx` (`sub_type`),
  KEY `fk_MEMBER_CITY_CHAPTER1_idx` (`city`),
  CONSTRAINT `fk_MEMBER_CITY_CHAPTER1` FOREIGN KEY (`city`) REFERENCES `city_chapter` (`city`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_MEMBER_SUB_ENTITY_CHAPTER1` FOREIGN KEY (`sub_type`) REFERENCES `sub_entity_chapter` (`sub_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (10,'College Station','Youth','John','ACM assistant','2021',25),(11,'College Station','Veteran','Joe','NA','2020',22),(12,'College Station','Student','Jessica','NA','2019',30),(13,'College Station','Women','Jordan','NA','2018',40),(14,'College Station','ACM','Jem','NA','2017',20),(15,'College Station','ACM','Jenn','Chapter assistant','2020',20),(16,'Bryan','Youth','Jeppy','ACM assistant','2019',25),(17,'Bryan','Women','Jennifer','Chapter assistant','2017',40);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statechapter`
--

DROP TABLE IF EXISTS `statechapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statechapter` (
  `state_name` varchar(45) NOT NULL,
  PRIMARY KEY (`state_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statechapter`
--

LOCK TABLES `statechapter` WRITE;
/*!40000 ALTER TABLE `statechapter` DISABLE KEYS */;
INSERT INTO `statechapter` VALUES ('Alaska'),('Arizona'),('California'),('Colorado'),('District of Columbia'),('Iowa'),('Maine'),('Minnesota'),('Missouri'),('Nebraska'),('New York'),('North Dakota'),('South Dakota'),('Tennessee'),('Texas'),('Utah'),('Washington');
/*!40000 ALTER TABLE `statechapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_entity_chapter`
--

DROP TABLE IF EXISTS `sub_entity_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_entity_chapter` (
  `sub_type` varchar(45) NOT NULL,
  `COORDINATOR_coordinator_id` int NOT NULL,
  PRIMARY KEY (`sub_type`),
  KEY `fk_SUB_ENTITY_CHAPTER_COORDINATOR1_idx` (`COORDINATOR_coordinator_id`),
  CONSTRAINT `fk_SUB_ENTITY_CHAPTER_COORDINATOR1` FOREIGN KEY (`COORDINATOR_coordinator_id`) REFERENCES `coordinator` (`coordinator_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_entity_chapter`
--

LOCK TABLES `sub_entity_chapter` WRITE;
/*!40000 ALTER TABLE `sub_entity_chapter` DISABLE KEYS */;
INSERT INTO `sub_entity_chapter` VALUES ('ACM',2),('Student',3),('Youth',4),('Veteran',5),('Women',6);
/*!40000 ALTER TABLE `sub_entity_chapter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-04 16:35:29
