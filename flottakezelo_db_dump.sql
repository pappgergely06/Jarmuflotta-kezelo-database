/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: flottakezelo_db
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `driver_assignment`
--

DROP TABLE IF EXISTS `driver_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_assignment` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `assigned_from` date NOT NULL,
  `assigned_to` date NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  UNIQUE KEY `assignment_id_UNIQUE` (`assignment_id`),
  KEY `vehicle_id_idx` (`vehicle_id`),
  KEY `driver_id_idx` (`driver_id`),
  CONSTRAINT `fk_assignment_driver` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignment_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_assignment`
--

LOCK TABLES `driver_assignment` WRITE;
/*!40000 ALTER TABLE `driver_assignment` DISABLE KEYS */;
INSERT INTO `driver_assignment` VALUES
(1,'2026-04-21','2026-04-21',1,1),
(7,'2026-04-26','2028-04-26',10,14);
/*!40000 ALTER TABLE `driver_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `license_number` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `starting_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `driver_id_UNIQUE` (`driver_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `fk_driver_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES
(1,'AB123456','1114 Budapest, Bartók Béla út 12.','laci.kovacs@gmail.com','+36301234567','Kovács László','2022-03-15',2),
(14,'ABC6ZHJ123','Nagykálló, Ady út 9','kissi@gmail.com','+36504587236','Kiss István','2026-04-26',35);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuelings`
--

DROP TABLE IF EXISTS `fuelings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuelings` (
  `fueling_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount_liters` int(11) NOT NULL,
  `price_per_liter` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  PRIMARY KEY (`fueling_id`),
  UNIQUE KEY `fueling_id_UNIQUE` (`fueling_id`),
  KEY `vehicle_id_idx` (`vehicle_id`),
  CONSTRAINT `fk_fueling_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuelings`
--

LOCK TABLES `fuelings` WRITE;
/*!40000 ALTER TABLE `fuelings` DISABLE KEYS */;
INSERT INTO `fuelings` VALUES
(6,'2026-04-23',5,550,1),
(7,'2026-04-23',5,450,1),
(8,'2026-04-23',5,450,1),
(9,'2026-04-24',45,100,1),
(10,'2026-04-23',5,100,1),
(11,'2026-04-23',5,100,1),
(12,'2026-04-23',5,1,1),
(13,'2026-04-23',45,620,1),
(14,'2026-04-23',15,100,1),
(15,'2026-04-23',5,100,1),
(17,'2026-05-07',5,103,1),
(18,'2026-04-25',5,100,1),
(19,'2026-04-25',45,100,1),
(20,'2026-04-25',5,100,1),
(21,'2026-04-25',5,100,1),
(22,'2026-04-25',5,100,1),
(24,'2026-04-26',40,560,10),
(25,'2026-05-14',45,610,10),
(26,'2026-06-01',10,590,10),
(28,'2026-04-26',5,100,1);
/*!40000 ALTER TABLE `fuelings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `next_service` date DEFAULT NULL,
  `vehicle_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `service_id_UNIQUE` (`service_id`),
  KEY `vehicle_id_idx` (`vehicle_id`),
  CONSTRAINT `fk_service_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES
(1,'2026-04-25','aaa','2026-04-25',1),
(2,'2026-04-25','aaa','2026-04-25',1),
(4,'2026-04-25','kuplung és váltóolaj csere','2026-04-25',1),
(5,'2025-05-07','Műszaki vizsga','2027-05-07',10),
(6,'2025-10-22','olajcsere, szűrők cseréje','2026-04-26',10),
(7,'2025-04-26','fékfelújítás','2026-04-26',10);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_list`
--

DROP TABLE IF EXISTS `services_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_list` (
  `name` varchar(45) NOT NULL,
  `service_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`service_list_id`),
  UNIQUE KEY `service_list_id_UNIQUE` (`service_list_id`),
  KEY `service_id_idx` (`service_id`),
  CONSTRAINT `fk_list_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_list`
--

LOCK TABLES `services_list` WRITE;
/*!40000 ALTER TABLE `services_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_document`
--

DROP TABLE IF EXISTS `travel_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_document` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `start_km` int(11) NOT NULL,
  `end_km` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id_UNIQUE` (`log_id`),
  KEY `vehicle_id_idx` (`vehicle_id`),
  CONSTRAINT `fk_travel_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_document`
--

LOCK TABLES `travel_document` WRITE;
/*!40000 ALTER TABLE `travel_document` DISABLE KEYS */;
INSERT INTO `travel_document` VALUES
(24,'2026-04-23',261000,261001,1),
(25,'2026-04-23',261001,261002,1),
(26,'2026-04-23',261002,261003,1),
(27,'2026-04-23',261003,261004,1),
(28,'2026-04-23',261004,261005,1),
(29,'2026-04-23',261005,261006,1),
(30,'2026-04-23',261006,261007,1),
(31,'2026-04-23',261007,261008,1),
(32,'2026-04-23',261008,261009,1),
(33,'2026-04-23',261008,261600,1),
(34,'2026-04-23',261600,261620,1),
(35,'2026-04-23',261620,261638,1),
(36,'2026-04-23',261638,261639,1),
(37,'2026-04-23',261639,261640,1),
(38,'2026-04-25',261641,261646,1),
(39,'2026-04-25',261646,261647,1),
(40,'2026-04-25',261647,261648,1),
(41,'2026-04-25',261648,261649,1),
(42,'2026-04-25',261649,261650,1),
(43,'2026-04-25',261650,261651,1),
(44,'2026-04-25',261651,261652,1),
(45,'2026-04-25',261652,261653,1),
(46,'2026-04-25',261653,261654,1),
(47,'2026-04-25',261654,261655,1),
(48,'2026-04-25',261655,261656,1),
(49,'2026-04-25',261656,261657,1),
(50,'2026-04-26',153289,153426,10),
(51,'2026-04-26',153426,153560,10),
(52,'2026-04-26',153560,153590,10),
(53,'2026-04-26',153590,153597,10),
(54,'2026-04-26',261657,261658,1);
/*!40000 ALTER TABLE `travel_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','driver') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2b$10$MZZpyOtwfDH3TE.H.UmwdONb6CdtHy7YtXC7Lql5qO9AhE5aLlAwq','admin'),
(2,'user','$2b$10$OeZEZXRcuUyD8iwIgxEzpO/p9pzy8DUVAN2K5U6Evt503u34rpWYi','driver'),
(4,'user1','$2b$10$9SvLGSfeto4CyLArE4GaZurmWekW8o6H.wdZ3GTChPOR3hxOHvz0G','driver'),
(5,'teszt','$2b$10$TCgXY3FfHwiUdJGmklDb9OFZE9rqT1nokjtjF7WL7yRR6sTrkFwqO','driver'),
(7,'proba','$2b$10$mKMIdhOIAEDRSYyZg8exGeEc8RgH5IsTsvjNl6BEKCeko2lMHIY3W','driver'),
(8,'proba1','$2b$10$J.YQogIGikICX9tvmAK5oefRcX8l72RW6cKcSqZUhlrxSixx38PpW','driver'),
(9,'u1','$2b$10$VWxtFrDHDs3q8IDcCLESJusjeApaH7zapeYbWl2yV4w3T4UZvaVii','driver'),
(10,'lajos','$2b$10$OKgttTcFUWme4Fw.Svnv2enzWb7qSRjbmj4NLJOsCLlpRPa/9lA2y','driver'),
(11,'kisl','$2b$10$0c900D0chzq1ZegiuV2DU.XIP7q4FC.qcPyJkcQE0JRQOG4TGLgOW','driver'),
(12,'user2','$2b$10$Kruqq9diaCd85yYy3p4HOeRb96nNKA90wMoAmIZWuueMH03yWaee6','driver'),
(14,'bencuska','$2b$10$95AMtxa7atuhpsKysGNf5.GrqPqaEByMTf5TEp4CLsTAm0PDgT.ZS','driver'),
(15,'bence1','$2b$10$vROnuUY9z8ur32PH1.7xcO3FpeOo1fi8fqhv00T0ztBFi49mLkzji','driver'),
(16,'gyula','$2b$10$JMAwNZKA2YmK4zNXHhut1.t41cyi6WVJiJFOTu9uu7F2j/8tbtWFS','driver'),
(17,'aa','$2b$10$L4zWaGo8PjcS1L35NuNYtuaNB94uVsKz3HDySn/jwjMsduD2Ejy/O','driver'),
(18,'alladin','$2b$10$uuE7jLeikeQ6eVfNsGZK8uSvxpxR7Aa178rTr4fLzwsO4GsO88C9C','driver'),
(19,'proba3','$2b$10$2D/o3675HW2TI9jYyXEjTOVXBIIhSKZ/zudmnAHTxd20zkAo7LFDK','driver'),
(20,'proba4','$2b$10$vWzTN1gN1EFNZ.eIyz80duARH4ZbFrZ5htmOf1YrCou2S1rcSOB4a','driver'),
(21,'proba5','$2b$10$w3YFw77oQ/dDYTAHjTzH8eaXUXdqKujE7OYcB2bJHhhLVuYO1xDiq','driver'),
(22,'ssss','$2b$10$.OsAhqV6YNjX3BNicsFq.eiaJUhnVBi73SFz8kWk44hl9rFRsnHS.','driver'),
(23,'alma','$2b$10$KQc7LPW1cj6oxnl4EglKBOy1Lqop30L0m8uJga1N6fQEfH2b9qzD2','driver'),
(24,'körte','$2b$10$vFMRIGqoc0URFo74iPhy6uWtxQAyKV4FHQda60AmYiKs76HBbZCry','driver'),
(25,'barack','$2b$10$QeZe8kIAHd4eKK5GtuqkxOPnJRUt3T.Xz.re4XCurvYrxkp.7uvna','driver'),
(26,'lali','$2b$10$6ZV1RqXQYfXu3.W3e7ujCO./0INl4alkMgockTg1TYqxF/Y0wYbN6','driver'),
(27,'sandor','$2b$10$a1.RD5ltzGBwc6HAevYZ.OhO6PvT2Swa2QuNTVAUM0AdXVJl8rZMm','driver'),
(28,'a','$2b$10$TNsrhBdpnvTjyUhhl3uraOF.GL6cDUGNs2Pf0.SwQqc4lKq./B1Vy','driver'),
(30,'aaa','$2b$10$F5sUC.jq.3.ZXwMzClfJY.wrRDX6VIdoRnonVdPOZRBz4mUgzFRR2','driver'),
(31,'tesztelek','$2b$10$6RQAPcO0p4WNFx7jHr4.A.yUXAY.fg2kFsYliGBjfwdRmVi1GoNUe','driver'),
(32,'nagya','$2b$10$bPzIfcp/izJdXCiT/.zPPON0kzXxjNomSJwemdyFU0TGEPRA1eiRK','driver'),
(33,'nagyf','$2b$10$dVooSvS.IrH9HxSuTR.ATOmlmZrphmoAd1ANWFCmyXBbH7TwRJ1Cy','driver'),
(35,'kiss istvan','$2b$10$40H7Vdje/ghh/FqdMIyE5er8aqrSCBEQgF7OXKVEbOkCTT49IXL9i','driver');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` date NOT NULL,
  `next_technical_exam` date NOT NULL,
  `year` varchar(4) NOT NULL,
  `model` varchar(30) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `start_odometer` int(11) NOT NULL,
  `insurance_expiry` date NOT NULL,
  `lisence_plate` varchar(7) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `vehicle_id_UNIQUE` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES
(1,'2026-04-26','2026-05-21','2004','Focus','Ford','WF0AXXGCDA4C50937',261658,'2027-05-11','AAMF342'),
(10,'2026-04-26','2027-05-07','2008','Rio','Kia','ABC12300000000000',153597,'2026-08-29','ABC123');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 20:07:03
