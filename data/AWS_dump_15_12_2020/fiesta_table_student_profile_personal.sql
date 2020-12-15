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
-- Table structure for table `table_student_profile_personal`
--

DROP TABLE IF EXISTS `table_student_profile_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_student_profile_personal` (
  `student_id` int(11) NOT NULL,
  `student_dob` varchar(45) NOT NULL,
  `student_graduation` varchar(45) NOT NULL,
  `student_dept` varchar(45) NOT NULL,
  `student_about_myself` varchar(1000) NOT NULL,
  `student_school` varchar(100) NOT NULL,
  `student_address` varchar(1000) NOT NULL,
  `student_regno` varchar(45) NOT NULL,
  `student_skill1` varchar(45) NOT NULL,
  `student_skill2` varchar(45) NOT NULL,
  `student_skill1_rating` varchar(45) NOT NULL,
  `student_skill2_rating` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_student_profile_personal`
--

LOCK TABLES `table_student_profile_personal` WRITE;
/*!40000 ALTER TABLE `table_student_profile_personal` DISABLE KEYS */;
INSERT INTO `table_student_profile_personal` VALUES (1,'2020-12-02','2020-11','Computer Science & Engineering','Student','Engineering','Localhost','CB.EN.U4CSE17458','Coding','Karate','5','4'),(2,'2020-12-05','2020-12','Computer Science & Engineering','asdfasdf','Engineering','Localhost','CB.EN.U4CSE17453','Coding','Karate','5','5'),(7,'2020-12-02','2020-12','Computer Science & Engineering','Student','Engineering','Home','CB.EN.U4CSE17400','Singing','Dancing','5','1'),(19,'2020-12-10','2020-12','Mechanical Engineering','Mech','Engineering','Amrita','CB.EN.U4CSE17410','Welding','Singing','5','2');
/*!40000 ALTER TABLE `table_student_profile_personal` ENABLE KEYS */;
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

-- Dump completed on 2020-12-15 10:29:23
