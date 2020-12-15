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
-- Table structure for table `table_student_registration`
--

DROP TABLE IF EXISTS `table_student_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_student_registration` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_roll_num` varchar(16) NOT NULL,
  `student_email` varchar(45) NOT NULL,
  `student_password` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_roll_num_UNIQUE` (`student_roll_num`),
  UNIQUE KEY `student_email_UNIQUE` (`student_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_student_registration`
--

LOCK TABLES `table_student_registration` WRITE;
/*!40000 ALTER TABLE `table_student_registration` DISABLE KEYS */;
INSERT INTO `table_student_registration` VALUES (1,'Srishilesh','CB.EN.U4CSE17453','srishilesh@gmail.com','test123'),(2,'Sanjay','CB.EN.U4CSE17451','sanjay@gmail.com','test123'),(3,'Gayathri','CB.EN.U4CSE17467','gayathri@yahoo.co.in','test123'),(4,'Prathyusha','CB.EN.U4CSE17643','prath@gmail.com','test123'),(5,'Neeraj Kumar','CB.EN.U4CSE17891','neeraj@yahoo.co.in','test123'),(7,'Test','CB.EN.U4CSE17400','test@gmail.com','test123'),(9,'Rosy','CB.EN.U4CSE17470','rosy@gmail.com','rosyroso1234@R'),(11,'Gary','CB.ENU4CSE17481','Gary@gmail.com','gary'),(13,'Babu','CB.ENU4CSE17461','babu@gmail.com','babu'),(15,'Bobby','CB.EN.U4CSE17666','bobby@gmail.com','Bobby@123'),(17,'potti','CB.EN.U4CSE17333','potti@gmail.com','potti'),(19,'Ronaldo','CB.EN.U4CSE17410','ronaldo@gmail.com','asdf');
/*!40000 ALTER TABLE `table_student_registration` ENABLE KEYS */;
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

-- Dump completed on 2020-12-15 10:29:06
