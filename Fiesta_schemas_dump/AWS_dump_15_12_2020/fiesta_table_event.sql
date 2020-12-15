CREATE DATABASE  IF NOT EXISTS `fiesta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fiesta`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com    Database: fiesta
-- ------------------------------------------------------
-- Server version	8.0.17

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `table_event`
--

DROP TABLE IF EXISTS `table_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_event` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `event_desc` varchar(1000) NOT NULL,
  `event_tags` varchar(1000) NOT NULL,
  `event_type_participation` int(11) NOT NULL,
  `event_venue` varchar(450) NOT NULL,
  `event_max_participants` int(11) NOT NULL,
  `event_organizer_college` varchar(100) NOT NULL,
  `event_organizer_campus` varchar(100) DEFAULT NULL,
  `event_organizer_name` varchar(100) NOT NULL,
  `event_organizer_email` varchar(100) NOT NULL,
  `event_organizer_phone` varchar(20) NOT NULL,
  `event_organizer_details` varchar(1000) NOT NULL,
  `event_organizer_poster` blob,
  `event_organizer_other` varchar(100) DEFAULT NULL,
  `event_registration_link` varchar(100) DEFAULT NULL,
  `event_start_datetime` datetime NOT NULL,
  `event_end_datetime` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_event`
--

LOCK TABLES `table_event` WRITE;
/*!40000 ALTER TABLE `table_event` DISABLE KEYS */;
INSERT INTO `table_event` VALUES (6,'Street Football','Play football in streets','',1,'Near AB2',11,'Amrita Vishwa Vidyapeetham','Coimbatore','Amrita UNiversity','amrita@amrita.com','9876543434','Nothing',NULL,'Ettimadai','https://www.google.com','2020-11-12 19:49:00','2020-11-30 19:49:00'),(7,'asd','sfds','',0,'sdf',100,'Amrita Vishwa Vidyapeetham','Coimbatore','fsad','fdas@ga.com','1231231231','dsfd',NULL,'asdf','https://www.asdfdd.com','2020-10-29 20:08:00','2020-11-18 20:08:00'),(8,'ksdyfk','jkdsfosd','',0,'erfer',100,'Amrita Vishwa Vidyapeetham','Coimbatore','kj','khk@df.com','1234567890','n, n.b,',NULL,'kl','https://ww.dsdsdf.vcok','2020-11-15 20:11:00','2020-12-19 20:12:00'),(9,'akjdf','laskjdfkjdf','',0,'asdf',100,'Amrita Vishwa Vidyapeetham','Coimbatore','sdf','asd@asd.c','1231231231','sfd',NULL,'asdf','','2020-11-15 00:14:00','2020-11-19 20:14:00'),(12,'6th International Conference on Inventive Computation Technologies','In the emerging digital era, the need for developing advance computing technologies to meet the increasing demands of Information and Communication Technologies [ICT] and smart real-world applications like smart cities, automated business, entertainment, transportation, and healthcare has become imperative. To satisfy this increasing need the International Conference on Inventive Computation Technologies [ICICT 2021] paves way to foster the research innovations in the emerging computing technologies like neural networks, Fuzzy Systems, Genetic algorithms, Artificial Intelligence [AI] and other such hybrid computing models for addressing various uncertainties and complexities in almost all the real-time applications.','',0,'Hotel Aracdia',1,'Amrita Vishwa Vidyapeetham','Coimbatore','IEEE','ieee@gmail.com','9878987679','Popular Searches\r\nCountries supported by Townscript\r\nSell Event Tickets Online\r\nEvent Management Software\r\nEvent Registration Software\r\nConference management System\r\nEvent Planning Software',NULL,'Ettimadai','','2021-03-24 19:42:00','2021-03-31 19:42:00'),(13,'Anokha','Tech fest','singing,dancing',1,'Amrita',5,'Amrita Vishwa Vidyapeetham','Coimbatore','Sanjay','sanjay@gmail.com','1231231231','Student',NULL,'Amrita','','2020-12-02 13:08:00','2020-12-05 13:08:00'),(14,'Google Devfest','Developer conference','google,developer',1,'Amrita',2,'Amrita Vishwa Vidyapeetham','Coimbatore','Srishilesh','srishilesh@gmail.com','1234567890','Student',NULL,'Amrita','','2020-12-05 19:25:00','2020-12-02 19:25:00'),(16,'Techfest','Techfest','techfest',1,'Mumbai',3,'Others','Coimbatore','XYZ','xyz@gmail.com','1234567890','asdf',NULL,'Mumbai','','2020-12-02 19:39:00','2020-12-09 19:39:00'),(17,'ReactJS conference','Conference','conference',1,'Home',2,'Amrita Vishwa Vidyapeetham','Coimbatore','Sanjay','sanjay@gmail.com','1231231231','adsf',NULL,'Amrita','','2020-12-05 19:53:00','2020-12-03 19:54:00'),(18,'Who wants to be a millionaire?','Join to win 1 million','quiz',1,'Delhi',2,'Amrita Vishwa Vidyapeetham','Coimbatore','Amitabh','amitabh@gmail.com','9876543210','asef',NULL,'','','2020-12-10 20:02:00','2020-12-10 20:03:00'),(22,'Github universe','Conference','conference,github',0,'Home',1,'Amrita Vishwa Vidyapeetham','Coimbatore','Github','github@gmail.com','9876543210','asdf',NULL,'Home','','2020-12-08 12:22:00','2020-12-10 12:22:00'),(23,'Test1','Testing1','test',0,'Home',1,'Amrita Vishwa Vidyapeetham','Coimbatore','Sanjay','sanjay@gmail.com','9876543210','adsf',NULL,'Home','','2020-12-08 13:12:00','2020-12-09 13:12:00');
/*!40000 ALTER TABLE `table_event` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 10:28:41
