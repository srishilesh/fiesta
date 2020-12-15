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
-- Table structure for table `table_latest_news`
--

DROP TABLE IF EXISTS `table_latest_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_latest_news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(100) NOT NULL,
  `news_message` varchar(1000) NOT NULL,
  `news_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_latest_news`
--

LOCK TABLES `table_latest_news` WRITE;
/*!40000 ALTER TABLE `table_latest_news` DISABLE KEYS */;
INSERT INTO `table_latest_news` VALUES (1,'Diego Maradona will be remembered as one of soccer\'s greatest, the sport\'s ultimate flawed genius','As massive as Maradona\'s on-field legacy is -- and it includes titles in three different countries, as well as captaining Argentina to victory in the 1986 World Cup -- his charisma and resonance off the pitch might be even greater.','https://www.espn.in/football'),(2,'2020 Cultural Brand Award goes to European Union Youth Orchestra','The award ceremony was an unusual event in unusual times: On the evening of November 26, the Cultural Brand Awards were presented in the Nikolaisaal concert hall in Potsdam, near Berlin. The digital broadcast, with a small group of prize winners, speakers and organizers, could be watched from all over Europe.','https://www.dw.com/en/2020-cultural-brand-award-goes-to-european-union-youth-orchestra/a-55733391'),(3,'Organizations with a culture of innovation fuelling business resilience','The study found that in a short span of six months, organizations in India have increased their ability to innovate by 4% by maturing their Culture of Innovation. The study also showed that close to 78% of India organizations are speeding up digitalization in a variety of ways to adapt to the new reality. This included launching digital products and introducing digital payments to embracing ecommerce and automation. ','https://news.microsoft.com/');
/*!40000 ALTER TABLE `table_latest_news` ENABLE KEYS */;
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

-- Dump completed on 2020-12-15 10:28:58
