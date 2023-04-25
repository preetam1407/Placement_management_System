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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `person_id` int NOT NULL,
  `designation` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (10001,'Internal Coordinator',10001),(10002,'Technical Team Lead',10002),(10005,'Head-CDS',10005),(10010,'Social Media Lead',10010),(10014,'Social Media Lead',10014),(10021,'Head-CDS',10021),(10022,'Internal Coordinator',10022),(10025,'Social Media Lead',10025),(10026,'Faculty Coordinator-Internships',10026),(10031,'Social Media Lead',10031),(10039,'Placement Coordinator',10039),(10040,'Technical Team Lead',10040),(10041,'Placement Coordinator',10041),(10042,'Technical Team Lead',10042),(10044,'Internal Coordinator',10044),(10051,'Placement Coordinator',10051),(10055,'Placement Coordinator',10055),(10061,'Placement Coordinator',10061),(10063,'Social Media Lead',10063),(10065,'Internal Coordinator',10065),(10069,'Head-CDS',10069),(10071,'Technical Team Lead',10071),(10073,'Placement Coordinator',10073),(10074,'Faculty Coordinator-Internships',10074),(10078,'Internal Coordinator',10078),(10084,'Faculty Coordinator-Internships',10084),(10092,'Faculty Coordinator-Internships',10092),(10093,'Head-CDS',10093),(10095,'Internal Coordinator',10095),(10103,'Internal Coordinator',10103),(10114,'Placement Coordinator',10114),(10117,'Placement Coordinator',10117),(10119,'Placement Coordinator',10119),(10121,'Social Media Lead',10121),(10122,'Placement Coordinator',10122),(10123,'Technical Team Lead',10123),(10125,'Social Media Lead',10125),(10126,'Placement Coordinator',10126),(10127,'Placement Coordinator',10127),(10128,'Placement Coordinator',10128),(10131,'Internal Coordinator',10131),(10134,'Internal Coordinator',10134),(10135,'Faculty Coordinator-Internships',10135),(10140,'Head-CDS',10140),(10143,'Internal Coordinator',10143),(10145,'Faculty Coordinator-Internships',10145),(10146,'Internal Coordinator',10146),(10153,'Placement Coordinator',10153),(10154,'Placement Coordinator',10154),(10158,'Internal Coordinator',10158),(10159,'Placement Coordinator',10159),(10161,'Internal Coordinator',10161),(10168,'Placement Coordinator',10168),(10173,'Internal Coordinator',10173),(10174,'Technical Team Lead',10174),(10175,'Head-CDS',10175),(10178,'Technical Team Lead',10178),(10179,'Technical Team Lead',10179),(10182,'Social Media Lead',10182),(10185,'Technical Team Lead',10185),(10188,'Head-CDS',10188),(10194,'Faculty Coordinator-Internships',10194),(10196,'Head-CDS',10196),(10198,'Faculty Coordinator-Internships',10198),(10200,'Placement Coordinator',10200),(10201,'Head-CDS',10201),(10203,'Faculty Coordinator-Internships',10203),(10206,'Social Media Lead',10206),(10215,'Social Media Lead',10215),(10221,'Social Media Lead',10221),(10222,'Head-CDS',10222),(10224,'Head-CDS',10224),(10225,'Technical Team Lead',10225),(10226,'Technical Team Lead',10226),(10229,'Technical Team Lead',10229),(10232,'Technical Team Lead',10232),(10248,'Faculty Coordinator-Internships',10248),(10249,'Placement Coordinator',10249),(10251,'Internal Coordinator',10251),(10255,'Technical Team Lead',10255),(10260,'Placement Coordinator',10260),(10267,'Placement Coordinator',10267),(10271,'Placement Coordinator',10271),(10272,'Placement Coordinator',10272),(10281,'Faculty Coordinator-Internships',10281),(10283,'Head-CDS',10283),(10284,'Placement Coordinator',10284),(10291,'Social Media Lead',10291),(10292,'Head-CDS',10292),(10297,'Internal Coordinator',10297),(10298,'Faculty Coordinator-Internships',10298),(10302,'Social Media Lead',10302),(10307,'Head-CDS',10307),(10314,'Placement Coordinator',10314),(10315,'Head-CDS',10315),(10317,'Technical Team Lead',10317),(10319,'Internal Coordinator',10319),(10320,'Internal Coordinator',10320),(10327,'Head-CDS',10327),(10329,'Social Media Lead',10329),(10331,'Faculty Coordinator-Internships',10331),(10335,'Faculty Coordinator-Internships',10335),(10336,'Social Media Lead',10336),(10338,'Faculty Coordinator-Internships',10338),(10340,'Faculty Coordinator-Internships',10340),(10343,'Placement Coordinator',10343),(10349,'Placement Coordinator',10349),(10350,'Faculty Coordinator-Internships',10350),(10353,'Faculty Coordinator-Internships',10353),(10354,'Placement Coordinator',10354),(10355,'Social Media Lead',10355),(10357,'Head-CDS',10357),(10359,'Head-CDS',10359),(10360,'Faculty Coordinator-Internships',10360),(10364,'Social Media Lead',10364),(10367,'Internal Coordinator',10367),(10368,'Social Media Lead',10368),(10369,'Faculty Coordinator-Internships',10369),(10372,'Head-CDS',10372),(10373,'Placement Coordinator',10373),(10374,'Placement Coordinator',10374),(10375,'Internal Coordinator',10375),(10376,'Social Media Lead',10376),(10380,'Internal Coordinator',10380),(10385,'Technical Team Lead',10385),(10393,'Social Media Lead',10393),(10396,'Faculty Coordinator-Internships',10396),(10397,'Technical Team Lead',10397),(10401,'Technical Team Lead',10401),(10405,'Faculty Coordinator-Internships',10405),(10408,'Head-CDS',10408),(10409,'Social Media Lead',10409),(10410,'Head-CDS',10410),(10411,'Technical Team Lead',10411),(10413,'Faculty Coordinator-Internships',10413),(10428,'Placement Coordinator',10428),(10437,'Technical Team Lead',10437),(10440,'Head-CDS',10440),(10442,'Social Media Lead',10442),(10444,'Internal Coordinator',10444),(10450,'Placement Coordinator',10450),(10452,'Internal Coordinator',10452),(10453,'Internal Coordinator',10453),(10455,'Technical Team Lead',10455),(10463,'Placement Coordinator',10463),(10464,'Social Media Lead',10464),(10467,'Internal Coordinator',10467),(10469,'Faculty Coordinator-Internships',10469),(10470,'Placement Coordinator',10470),(10474,'Placement Coordinator',10474),(10479,'Social Media Lead',10479),(10481,'Social Media Lead',10481),(10482,'Faculty Coordinator-Internships',10482),(10483,'Internal Coordinator',10483),(10484,'Social Media Lead',10484),(10485,'Technical Team Lead',10485),(10486,'Faculty Coordinator-Internships',10486),(10493,'Internal Coordinator',10493),(10494,'Head-CDS',10494),(10495,'Technical Team Lead',10495),(10497,'Technical Team Lead',10497),(10498,'Faculty Coordinator-Internships',10498),(10499,'Head-CDS',10499),(10502,'Head-CDS',10502),(10513,'Placement Coordinator',10513),(10514,'Social Media Lead',10514),(10522,'Social Media Lead',10522),(10524,'Placement Coordinator',10524),(10528,'Internal Coordinator',10528),(10534,'Placement Coordinator',10534),(10535,'Faculty Coordinator-Internships',10535),(10537,'Technical Team Lead',10537),(10538,'Technical Team Lead',10538),(10539,'Placement Coordinator',10539),(10546,'Social Media Lead',10546),(10549,'Faculty Coordinator-Internships',10549),(10551,'Placement Coordinator',10551),(10555,'Social Media Lead',10555),(10559,'Social Media Lead',10559),(10569,'Placement Coordinator',10569),(10570,'Technical Team Lead',10570),(10572,'Technical Team Lead',10572),(10573,'Internal Coordinator',10573),(10574,'Placement Coordinator',10574),(10581,'Social Media Lead',10581),(10582,'Technical Team Lead',10582),(10583,'Social Media Lead',10583),(10584,'Social Media Lead',10584),(10592,'Internal Coordinator',10592),(10606,'Technical Team Lead',10606),(10616,'Social Media Lead',10616),(10617,'Technical Team Lead',10617),(10621,'Placement Coordinator',10621),(10623,'Internal Coordinator',10623),(10627,'Placement Coordinator',10627),(10630,'Head-CDS',10630),(10632,'Social Media Lead',10632),(10639,'Placement Coordinator',10639),(10641,'Placement Coordinator',10641),(10644,'Head-CDS',10644),(10649,'Social Media Lead',10649),(10651,'Internal Coordinator',10651),(10653,'Head-CDS',10653),(10669,'Faculty Coordinator-Internships',10669),(10676,'Internal Coordinator',10676),(10680,'Faculty Coordinator-Internships',10680),(10681,'Technical Team Lead',10681),(10682,'Faculty Coordinator-Internships',10682),(10685,'Placement Coordinator',10685),(10688,'Placement Coordinator',10688),(10694,'Social Media Lead',10694),(10699,'Social Media Lead',10699),(10701,'Faculty Coordinator-Internships',10701),(10703,'Faculty Coordinator-Internships',10703),(10705,'Faculty Coordinator-Internships',10705),(10706,'Technical Team Lead',10706),(10707,'Placement Coordinator',10707),(10712,'Head-CDS',10712),(10713,'Placement Coordinator',10713),(10728,'Technical Team Lead',10728),(10729,'Faculty Coordinator-Internships',10729),(10730,'Internal Coordinator',10730),(10734,'Internal Coordinator',10734),(10736,'Technical Team Lead',10736),(10742,'Social Media Lead',10742),(10743,'Technical Team Lead',10743),(10744,'Internal Coordinator',10744),(10748,'Faculty Coordinator-Internships',10748),(10754,'Internal Coordinator',10754),(10756,'Faculty Coordinator-Internships',10756),(10757,'Head-CDS',10757),(10758,'Technical Team Lead',10758),(10764,'Faculty Coordinator-Internships',10764),(10765,'Head-CDS',10765),(10768,'Head-CDS',10768),(10769,'Head-CDS',10769),(10771,'Head-CDS',10771),(10774,'Faculty Coordinator-Internships',10774),(10779,'Internal Coordinator',10779),(10788,'Social Media Lead',10788),(10792,'Faculty Coordinator-Internships',10792),(10794,'Head-CDS',10794),(10797,'Social Media Lead',10797),(10801,'Social Media Lead',10801),(10804,'Internal Coordinator',10804),(10805,'Head-CDS',10805),(10807,'Technical Team Lead',10807),(10808,'Placement Coordinator',10808),(10809,'Social Media Lead',10809),(10811,'Head-CDS',10811),(10818,'Internal Coordinator',10818),(10819,'Head-CDS',10819),(10820,'Internal Coordinator',10820),(10823,'Faculty Coordinator-Internships',10823),(10826,'Technical Team Lead',10826),(10834,'Internal Coordinator',10834),(10843,'Head-CDS',10843),(10851,'Social Media Lead',10851),(10852,'Head-CDS',10852),(10854,'Internal Coordinator',10854),(10855,'Technical Team Lead',10855),(10866,'Faculty Coordinator-Internships',10866),(10867,'Technical Team Lead',10867),(10868,'Faculty Coordinator-Internships',10868),(10872,'Faculty Coordinator-Internships',10872),(10874,'Faculty Coordinator-Internships',10874),(10876,'Internal Coordinator',10876),(10877,'Head-CDS',10877),(10879,'Social Media Lead',10879),(10880,'Placement Coordinator',10880),(10884,'Social Media Lead',10884),(10887,'Placement Coordinator',10887),(10892,'Technical Team Lead',10892),(10893,'Technical Team Lead',10893),(10894,'Placement Coordinator',10894),(10895,'Technical Team Lead',10895),(10898,'Internal Coordinator',10898),(10899,'Technical Team Lead',10899),(10900,'Internal Coordinator',10900),(10901,'Internal Coordinator',10901),(10902,'Faculty Coordinator-Internships',10902),(10904,'Internal Coordinator',10904),(10909,'Placement Coordinator',10909),(10912,'Faculty Coordinator-Internships',10912),(10913,'Social Media Lead',10913),(10914,'Internal Coordinator',10914),(10915,'Social Media Lead',10915),(10919,'Social Media Lead',10919),(10920,'Placement Coordinator',10920),(10926,'Technical Team Lead',10926),(10929,'Social Media Lead',10929),(10942,'Head-CDS',10942),(10945,'Placement Coordinator',10945),(10947,'Technical Team Lead',10947),(10950,'Technical Team Lead',10950),(10951,'Internal Coordinator',10951),(10952,'Social Media Lead',10952),(10955,'Internal Coordinator',10955),(10956,'Head-CDS',10956),(10958,'Technical Team Lead',10958),(10959,'Technical Team Lead',10959),(10960,'Head-CDS',10960),(10964,'Faculty Coordinator-Internships',10964),(10966,'Head-CDS',10966),(10967,'Internal Coordinator',10967),(10968,'Social Media Lead',10968),(10974,'Head-CDS',10974),(10975,'Social Media Lead',10975),(10982,'Placement Coordinator',10982),(10987,'Technical Team Lead',10987),(10998,'Placement Coordinator',10998),(54321,'Admin',54321),(3018984,'Admin-Placement manager',3018984),(23336312,'Admin',23336312),(29231375,'Admin',29231375),(36853773,'Admin',36853773),(66798539,'Admin',66798539),(78377414,'Admin',78377414),(89627730,'Admin',89627730),(99490770,'admin',99490770);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
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
