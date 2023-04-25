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
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_details` (
  `person_id` int NOT NULL,
  `job_id` varchar(50) NOT NULL,
  `company_rep` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `type_of_org` varchar(50) NOT NULL,
  `industry_sector` varchar(50) NOT NULL,
  `no_of_members` varchar(50) NOT NULL,
  `no_of_rooms_required` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `parent_id` int DEFAULT NULL,
  `parent_id_1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `parent_id` (`parent_id`),
  KEY `process` (`parent_id_1`),
  CONSTRAINT `company_details_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `process` FOREIGN KEY (`parent_id_1`) REFERENCES `job_profile` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_details`
--

LOCK TABLES `company_details` WRITE;
/*!40000 ALTER TABLE `company_details` DISABLE KEYS */;
INSERT INTO `company_details` VALUES (10019,'0000000001','Product Manager','Emerson Electric','https://10019','Mechanical Engineering-based','Private','7','3','2023-07-22','2023-10-25',10019,'0000000001'),(10024,'0000000001','Product Manager','Mitsubishi Electric','https://10024','Civil Engineering-based','Semi-Private','7','3','2023-06-20','2023-10-24',10024,'0000000001'),(10027,'0000000001','CTO','Hitachi',NULL,'Aerospace Engineering-based','Public','4','5','2023-06-20','2023-12-24',10027,'0000000001'),(10032,'0000000001','Product Manager','Mitsubishi Electric','https://10032','Materials Science and Engineering-based','Public','7','5','2023-06-07','2023-09-15',10032,'0000000001'),(10034,'0000000001','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','6','4','2023-07-01','2023-09-09',10034,'0000000001'),(10035,'0000000001','Product Manager','Siemens',NULL,'Industrial Engineering-based','Public','4','6','2023-08-09','2023-12-23',10035,'0000000001'),(10043,'0000000002','CTO','ABB',NULL,'Environmental Engineering-based','Private','3','4','2023-06-20','2023-11-27',10043,'0000000002'),(10045,'0000000002','CTO','Honeywell',NULL,'Environmental Engineering-based','Private','7','4','2023-06-25','2023-11-27',10045,'0000000002'),(10050,'0000000002','HR','Siemens','https://10050','Civil Engineering-based','Semi-Private','7','3','2023-05-27','2023-09-28',10050,'0000000002'),(10052,'0000000002','HR','Siemens',NULL,'Computer Engineering-based','Public','3','3','2023-07-11','2023-12-12',10052,'0000000002'),(10053,'0000000002','CEO','Mitsubishi Electric','https://10053','Aerospace Engineering-based','Public','6','6','2023-07-18','2023-12-27',10053,'0000000002'),(10060,'0000000002','CEO','Siemens','https://10060','Computer Engineering-based','Semi-Private','7','6','2023-06-11','2023-11-22',10060,'0000000002'),(10064,'0000000002','HR','Yokogawa Electric','https://10064','Petroleum Engineering-based','Semi-Private','5','4','2023-06-22','2023-10-04',10064,'0000000002'),(10067,'0000000002','CEO','Hitachi','https://10067','Petroleum Engineering-based','Private','7','6','2023-05-14','2023-12-26',10067,'0000000002'),(10070,'0000000002','HR','Hitachi',NULL,'Computer Engineering-based','Semi-Private','7','7','2023-05-21','2023-10-17',10070,'0000000002'),(10072,'0000000002','HR','Mitsubishi Electric',NULL,'Civil Engineering-based','Public','4','4','2023-07-16','2023-12-26',10072,'0000000002'),(10076,'0000000002','Product Manager','Emerson Electric',NULL,'Industrial Engineering-based','Semi-Private','4','5','2023-08-07','2023-10-24',10076,'0000000002'),(10077,'0000000003','Product Manager','Honeywell','https://10077','Environmental Engineering-based','Private','3','6','2023-06-06','2023-11-14',10077,'0000000003'),(10079,'0000000003','CTO','Schneider Electric',NULL,'Nuclear Engineering-based','Semi-Private','3','4','2023-07-12','2023-10-09',10079,'0000000003'),(10080,'0000000003','HR','Siemens',NULL,'Petroleum Engineering-based','Semi-Private','4','7','2023-05-25','2023-12-13',10080,'0000000003'),(10083,'0000000004','CEO','Schneider Electric','https://10083','Mechanical Engineering-based','Semi-Private','6','3','2023-06-16','2023-12-05',10083,'0000000004'),(10094,'0000000004','Product Manager','Yokogawa Electric','https://10094','Petroleum Engineering-based','Public','5','6','2023-05-26','2023-10-23',10094,'0000000004'),(10097,'0000000005','CTO','Hitachi',NULL,'Environmental Engineering-based','Private','7','3','2023-07-14','2023-09-19',10097,'0000000005'),(10098,'0000000006','CTO','Hitachi','https://10098','Nuclear Engineering-based','Private','3','4','2023-08-08','2023-10-21',10098,'0000000006'),(10101,'0000000007','HR','Emerson Electric','https://10101','Industrial Engineering-based','Public','5','3','2023-05-20','2023-09-13',10101,'0000000007'),(10105,'0000000008','CEO','General Electric','https://10105','Biomedical Engineering-based','Public','4','4','2023-08-22','2023-09-28',10105,'0000000008'),(10107,'0000000009','CTO','General Electric','https://10107','Chemical Engineering-based','Private','6','7','2023-05-05','2023-10-26',10107,'0000000009'),(10109,'0000000010','Product Manager','Yokogawa Electric',NULL,'Petroleum Engineering-based','Semi-Private','7','5','2023-05-19','2023-12-19',10109,'0000000010'),(10113,'0000000011','HR','Emerson Electric',NULL,'Petroleum Engineering-based','Private','4','3','2023-05-19','2023-11-15',10113,'0000000011'),(10118,'0000000012','CTO','Honeywell',NULL,'Chemical Engineering-based','Public','3','6','2023-08-07','2023-11-05',10118,'0000000012'),(10120,'0000000013','CEO','Rockwell Automation',NULL,'Petroleum Engineering-based','Private','3','7','2023-06-22','2023-11-13',10120,'0000000013'),(10124,'00000000014','Product Manager','Siemens','https://10124','Materials Science and Engineering-based','Public','7','6','2023-08-05','2023-11-18',10124,'00000000014'),(10130,'00000000015','Product Manager','Mitsubishi Electric','https://10130','Petroleum Engineering-based','Semi-Private','3','6','2023-07-09','2023-11-23',10130,'00000000015'),(10133,'00000000016','HR','Rockwell Automation',NULL,'Materials Science and Engineering-based','Semi-Private','5','7','2023-08-10','2023-12-26',10133,'00000000016'),(10136,'00000000017','CEO','Hitachi','https://10136','Petroleum Engineering-based','Semi-Private','7','7','2023-07-11','2023-12-08',10136,'00000000017'),(10142,'00000000018','CTO','General Electric',NULL,'Environmental Engineering-based','Private','6','6','2023-07-16','2023-10-26',10142,'00000000018'),(10150,'00000000019','Product Manager','General Electric','https://10150','Nuclear Engineering-based','Semi-Private','7','7','2023-07-21','2023-11-11',10150,'00000000019'),(123456,'6789990','HR','Atlassian','WWW.gmail.com','Public','IT','1','1','2023-06-20','2023-06-20',123456,'6789990'),(1234567,'6789991','HR','Atlassian','WWW.gmail.com','Public','IT','1','1','2023-06-20','2023-06-20',1234567,'6789991'),(2001031,'49565538','iitgn','iitgn','WWW.gmail.com','Public','IT','1','1','2023-04-05','2023-04-28',49565538,'2001031'),(2438581,'24385816851','HR','iitgn','WWW.gmail.com','Public','IT','1','1','2023-06-20','2023-06-20',2438581,'24385816851'),(2438582,'24385816852','HR','iitgn','WWW.gmail.com','Public','IT','1','1','2023-03-17','2023-03-17',2438582,'24385816852'),(3715679,'10034','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-07-01','2023-09-09',10034,'3715679'),(7887888,'6789999','HR','iitgn','WWW.gmail.com','Public','IT','1','1','2023-06-20','2023-06-20',7887888,'6789999'),(10888406,'10034','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-07-01','2023-09-09',10034,'10888406'),(14315913,'10034','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-07-01','2023-09-09',10034,'14315913'),(18702914,'87547598','HR','ABCC','www.gmaill.commm','Electronics','PUblic','1','1','2023-04-17','2023-05-07',87547598,'18702914'),(19668052,'10109','Product Manager','Yokogawa Electric',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-05-19','2023-12-19',10109,'19668052'),(37305844,'57188337','HR','XYZZ','WWW.gmail.com','IT','Public','1','1','2023-03-29','2023-04-28',57188337,'37305844'),(37886093,'10034','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-07-01','2023-09-09',10034,'37886093'),(47421100,'474211067777777774rt44t5y4444rrvrbttwxtwbtbt','HR','yxt','WWW.gmail.com','Public','IT','1','1','2023-03-21','2023-03-31',47421100,'474211067777777774rt44t5y4444rrvrbttwxtwbtbt'),(47780306,'96454399','HR','anc','WWW.gmail.com','IT','Public','1','1','2023-04-06','2023-04-28',96454399,'47780306'),(48133110,'48133113','HR','XYZ','xyz.in','IT','Public','1','1','2023-04-05','2023-04-19',48133110,'48133113'),(49565538,'49565539','iitgn','iitgn','WWW.gmail.com','Public','IT','1','1','2023-04-05','2023-04-28',49565538,'49565539'),(57188337,'57188334','HR','XYZZ','WWW.gmail.com','IT','Public','1','1','2023-03-29','2023-04-28',57188337,'57188334'),(63389087,'69929164','iitgn','iitgn','xyz','Public','IT','1','1','2023-03-30','2023-04-19',69929164,'63389087'),(64361369,'10027','CTO','Hitachi',NULL,'Aerospace Engineering-based','Public','1','1','2023-06-20','2023-12-24',10027,'64361369'),(69929164,'69929167','iitgn','iitgn','xyz','Public','IT','1','1','2023-03-30','2023-04-19',69929164,'69929167'),(73306369,'73306364','HR','hjjhgfd','ABC','IT','Public','1','1','2023-03-30','2023-04-12',73306369,'73306364'),(77927023,'10027','CTO','Hitachi',NULL,'Aerospace Engineering-based','Public','1','1','2023-06-20','2023-12-24',10027,'77927023'),(82192077,'69929164','iitgn','iitgn','xyz','Public','IT','1','1','2023-03-30','2023-04-19',69929164,'82192077'),(82764153,'98084463','iitgn','20045337','WWW.gmail.com','Public','IT','1','1','2023-03-02','2023-03-09',82764153,'98084463'),(83838253,'10024','Product Manager','Mitsubishi Electric','https://10024','Civil Engineering-based','Semi-Private','1','1','2023-06-20','2023-10-24',10024,'83838253'),(87547598,'87547593','HR','ABCC','www.gmaill.commm','Electronics','PUblic','1','1','2023-04-17','2023-05-07',87547598,'87547593'),(92932575,'10034','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private','1','1','2023-07-01','2023-09-09',10034,'92932575'),(96454399,'96454398','HR','anc','WWW.gmail.com','IT','Public','1','1','2023-04-06','2023-04-28',96454399,'96454398'),(99490777,'994907756','HR','XYZ','WWW.gmail.com','IT','Public','1','1','2023-04-12','2023-04-18',99490777,'994907756');
/*!40000 ALTER TABLE `company_details` ENABLE KEYS */;
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
