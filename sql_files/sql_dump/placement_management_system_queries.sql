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
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` int NOT NULL AUTO_INCREMENT,
  `person_role` varchar(50) DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `query_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `person_queries` (`person_id`),
  CONSTRAINT `person_queries` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,'student',10000,'this is a message','prakriti.saroj@iitgn.ac.in','13-04-2023'),(2,'company_rep',10006,'this is another message','prakriti.saroj@iitgn.ac.in1','14-04-2023'),(3,'company_rep',10008,'this is a yet another message','prakriti.saroj@iitgn.ac.in2','15-04-2023'),(4,'student',10007,'another message','prakriti.saroj@iitgn.ac.in3','15-04-2023'),(5,'student',10015,'this is a message','prakriti.saroj@iitgn.acv.in','13-04-2023'),(6,'company_rep',10016,'this is another message','prakriti.saroj@iitgln.ac.in1','14-04-2023'),(8,'student',14908606,'this is a test query!','14908606@gmail.comm','2023-04-15'),(9,'company',87547598,'this is a test queryyy!','18702914@gmail.com','2023-04-15');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15 23:30:35
