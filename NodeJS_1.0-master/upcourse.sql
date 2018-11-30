-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: coursePlanner
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `crn` int(11) NOT NULL,
  `cname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prof` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpa` decimal(65,30) DEFAULT NULL,
  PRIMARY KEY (`crn`,`prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (6035,'Intro To Info Security','Cannady','13:30:00','14:45:00','Architecture East 123',3.710000000000000000000000000000),(6210,'Adv Operating Systems','Gavrilovska','12:00:00','13:15:00','Klaus 1447',3.457500000000000000000000000000),(6238,'Secure Computer Systems','Ahamad','15:00:00','16:15:00','Coll of Computing 101',3.375000000000000000000000000000),(6241,'Compiler Design','Pande','16:30:00','17:45:00','Mason 3133',3.452000000000000000000000000000),(6260,'Applied Cryptography','Boldyreva','09:30:00','10:45:00','Klaus 2443',3.305000000000000000000000000000),(6262,'Network Security','Antonakakis','16:30:00','17:45:00','Boggs B5',3.890000000000000000000000000000),(6290,'High Perform Comput Arch','Conte','13:30:00','14:45:00','Klaus 1443',3.502222222222220000000000000000),(6301,'Adv Software Engineering','Orso','15:00:00','16:15:00','Coll of Computing 102',3.970000000000000000000000000000),(6365,'Intro Enterprise Comput.','Pu','12:00:00','13:15:00','Coll of Computing 16',3.846666666666670000000000000000),(6422,'Database System Implemnt','Arulraj','15:00:00','16:15:00','Instr Center 109',0.000000000000000000000000000000),(6440,'Intro Health Informatics','Duke','16:30:00','17:45:00','Klaus 1447',0.000000000000000000000000000000),(6460,'Educ Tech-Foundations','Shapiro','15:00:00','16:15:00','Instr Center 205',0.000000000000000000000000000000),(6470,'Online Communities','Bruckman','13:30:00','14:45:00','Klaus 2456',3.860000000000000000000000000000),(6475,'Comp. Photography','Dellaert','15:00:00','16:15:00','Klaus 2456',3.835000000000000000000000000000),(6515,'Intro to Grad Algorithms','TBA','09:30:00','10:45:00','Architecture East 123',0.000000000000000000000000000000),(6550,'Design& Analy-Algorithms','Vigoda','13:30:00','14:45:00','Klaus 2447',0.000000000000000000000000000000),(6675,'Advance Internet Comput','Liu','15:00:00','16:15:00','Mason 2117',3.935714285714290000000000000000),(6725,'Info Security Policies','Swire','18:00:00','20:45:00','College of Business 200',3.663333333333330000000000000000),(6745,'Info&Com Tech&Global Dev','Best','13:30:00','14:45:00','Clough Commons 129',0.000000000000000000000000000000),(6750,'Human-Computer Interact','DiSalvo','15:00:00','16:15:00','U A Whitaker Biomedical Engr 1103',0.000000000000000000000000000000),(6795,'Intro-Cognitive Science','Goel','09:30:00','10:45:00','Cherry Emerson 204',3.722500000000000000000000000000),(7260,'Internet Arch& Protocols','Xu','13:30:00','14:45:00','Klaus 2443',3.754444444444450000000000000000),(7455,'Issues/Human-Center Comp','Disalvo','15:00:00','16:15:00','TBA',3.720000000000000000000000000000),(7470,'Ubiquitous Computing','Ploetz','09:30:00','10:45:00','College of Business 200',3.955000000000000000000000000000),(7492,'Simulation of Biology','Turk','10:10:00','11:00:00','College of Business 300',3.965000000000000000000000000000),(7520,'Approximation Algorithms','Singh','09:30:00','10:45:00','Groseclose 402',0.000000000000000000000000000000),(7632,'Game AI','Riedl','15:00:00','16:15:00','College of Business 100',3.866666666666670000000000000000),(7641,'Machine Learning','Isbell','13:30:00','14:45:00','College of Business 100',3.520769230769230000000000000000),(7643,'Deep Learning','Kira','15:00:00','16:15:00','Mason 2117',0.000000000000000000000000000000),(7649,'Robot Intelli: Planning','Gombolay','09:30:00','10:45:00','ES&T L1255',0.000000000000000000000000000000),(8750,'Robotics Research Fnd I','TBA','18:00:00','20:20:00','Howey Physics L5',0.000000000000000000000000000000),(8751,'Robotics Research Fnd II','TBA','18:00:00','20:20:00','Howey Physics L5',0.000000000000000000000000000000),(8803,'Special Topics\nStatistical Machine Learning','Bloch','12:00:00','13:15:00','Clough Commons 152',0.000000000000000000000000000000),(8803,'Special Topics\nAdaptive Control and RL','Boots','15:00:00','16:15:00','Van Leer C341',3.887500000000000000000000000000),(8803,'Special Topics\nMobile Applications & Services','Clark','16:30:00','17:45:00','Klaus 1443',3.870000000000000000000000000000),(8803,'Special Topics\nUsable Privacy and Security','Das','13:30:00','14:45:00','Van Leer C456',0.000000000000000000000000000000),(8803,'Special Topics\nGraphical Models in ML','Fekri','16:30:00','17:45:00','Weber SST III 1',3.953333333333330000000000000000),(8803,'Special Topics\nBig Data and Society','Howard','16:30:00','17:45:00','Klaus 2456',0.000000000000000000000000000000),(8803,'Special Topics\nRobotics Motion Planning','Hutchinson','09:30:00','10:45:00','Architecture West 258',0.000000000000000000000000000000),(8803,'Special Topics\nInverse Uncertainty Quant','Isaac','12:00:00','13:15:00','Cherry Emerson 322',0.000000000000000000000000000000),(8803,'Special Topics\nBlockchain and Cryptocurrencies','Kolesnikov','16:30:00','17:45:00','Clough Commons 102',0.000000000000000000000000000000),(8803,'Special Topics\nInterconnection Networks','Krishna','15:00:00','16:15:00','Van Leer C241',4.000000000000000000000000000000),(8803,'Special Topics\nSystems Issues in Cloud Computing','Ramachandran','13:55:00','16:40:00','TBA',4.000000000000000000000000000000),(8803,'Special Topics\nData Visualization Prin & Appl','TBA','13:30:00','14:45:00','College of Business 300',0.000000000000000000000000000000),(8803,'Special Topics\nContinuous Algorithms','Vempala','09:30:00','10:45:00','Howey Physics N210',3.832000000000000000000000000000),(8803,'Special Topics\nSonification Lab R&D Studio','Walker','08:00:00','09:15:00','Klaus 2456',3.961000000000000000000000000000),(8803,'Special Topics\nHuman AI Interaction','Wilcox','15:00:00','16:15:00','U A Whitaker Biomedical Engr 1103',3.826666666666670000000000000000),(8803,'Special Topics\nCyber-Phys Sys Design','Wolf','13:30:00','14:45:00','Coll of Computing 102',0.000000000000000000000000000000);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `specialization` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','$2b$10$D9Jb6QB38Fr7LUG7FyQ2AOmHmI907P6IQflOJN/3fuZXzDk23HRbq','systems'),('palak','$2b$10$/kWC2Fg30MAyS7M0h4spD.nHqYMlphNXCFS3/mStsPiZcerI7DLh6','palak');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30 13:07:17
