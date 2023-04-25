-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: placement_management_system
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `applies_to`
--

DROP TABLE IF EXISTS `applies_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applies_to` (
  `job_id` varchar(50) NOT NULL,
  `person_id` int NOT NULL,
  `is_protected` varchar(50) DEFAULT NULL,
  `curr_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`job_id`,`person_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `applies_to_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `student` (`person_id`),
  CONSTRAINT `applies_to_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_profile` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applies_to`
--

LOCK TABLES `applies_to` WRITE;
/*!40000 ALTER TABLE `applies_to` DISABLE KEYS */;
INSERT INTO `applies_to` VALUES ('0000000001',10111,'1','Applied'),('0000000001',14908606,'1','Applied'),('00000000014',10111,'1','Applied'),('00000000015',10111,'1','Applied'),('00000000015',10115,'1','Applied'),('00000000015',20110205,'1','Applied'),('00000000015',21110142,'1','Applied'),('0000000002',10111,'1','Applied'),('0000000003',10111,'1','Applied'),('0000000005',21110142,'1','Applied'),('0000000008',21110142,'1','Applied'),('0000000012',21110142,'1','Applied'),('0000000012',31036964,'1','Applied');
/*!40000 ALTER TABLE `applies_to` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 23:30:34
