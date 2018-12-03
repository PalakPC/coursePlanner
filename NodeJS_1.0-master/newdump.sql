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
-- Table structure for table `course_days`
--

DROP TABLE IF EXISTS `course_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_days` (
  `course` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prof` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Days` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`course`,`prof`,`Days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_days`
--

LOCK TABLES `course_days` WRITE;
/*!40000 ALTER TABLE `course_days` DISABLE KEYS */;
INSERT INTO `course_days` VALUES ('6035','Cannady','R'),('6035','Cannady','T'),('6210','Gavrilovska','R'),('6210','Gavrilovska','T'),('6238','Ahamad','R'),('6238','Ahamad','T'),('6241','Pande','M'),('6241','Pande','W'),('6260','Boldyreva','R'),('6260','Boldyreva','T'),('6262','Antonakakis','M'),('6262','Antonakakis','W'),('6290','Conte','R'),('6290','Conte','T'),('6301','Orso','M'),('6301','Orso','W'),('6365','Pu','R'),('6365','Pu','T'),('6422','Arulraj','R'),('6422','Arulraj','T'),('6440','Duke','R'),('6440','Duke','T'),('6460','Shapiro','R'),('6460','Shapiro','T'),('6470','Bruckman','R'),('6470','Bruckman','T'),('6475','Dellaert','R'),('6475','Dellaert','T'),('6515','TBA','R'),('6515','TBA','T'),('6550','Vigoda','R'),('6550','Vigoda','T'),('6675','Liu','M'),('6675','Liu','W'),('6725','Swire','T'),('6745','Best','R'),('6745','Best','T'),('6750','DiSalvo','M'),('6750','DiSalvo','W'),('6795','Goel','R'),('6795','Goel','T'),('7260','Xu','R'),('7260','Xu','T'),('7455','Disalvo','M'),('7455','Disalvo','W'),('7470','Ploetz','R'),('7470','Ploetz','T'),('7492','Turk','F'),('7492','Turk','M'),('7492','Turk','W'),('7520','Singh','R'),('7520','Singh','T'),('7632','Riedl','M'),('7632','Riedl','W'),('7641','Isbell','R'),('7641','Isbell','T'),('7643','Kira','R'),('7643','Kira','T'),('7649','Gombolay','R'),('7649','Gombolay','T'),('8750','TBA','M'),('8751','TBA','M'),('8803','Bloch','R'),('8803','Bloch','T'),('8803','Boots','M'),('8803','Boots','W'),('8803','Clark','M'),('8803','Clark','W'),('8803','Das','R'),('8803','Das','T'),('8803','Fekri','M'),('8803','Fekri','W'),('8803','Howard','M'),('8803','Howard','W'),('8803','Hutchinson','R'),('8803','Hutchinson','T'),('8803','Isaac','R'),('8803','Isaac','T'),('8803','Kolesnikov','M'),('8803','Kolesnikov','W'),('8803','Krishna','M'),('8803','Krishna','W'),('8803','Ramachandran','M'),('8803','TBA','M'),('8803','TBA','W'),('8803','Vempala','M'),('8803','Vempala','W'),('8803','Walker','R'),('8803','Walker','T'),('8803','Wilcox','R'),('8803','Wilcox','T'),('8803','Wolf','R'),('8803','Wolf','T');
/*!40000 ALTER TABLE `course_days` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializations` (
  `6035` int(11) NOT NULL,
  `Intro_To_Info_Security` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Computing_Systems` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`6035`,`Intro_To_Info_Security`,`Computing_Systems`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (6210,'Adv Operating Systems','Computing Systems'),(6238,'Secure Computer Systems','Computing Systems'),(6238,'Secure Computer Systems','Social Computing'),(6241,'Compiler Design','Computing Systems'),(6241,'Compiler Design','High Performance Computing'),(6260,'Applied Cryptography','Computing Systems'),(6262,'Network Security','Computing Systems'),(6290,'High Perform Comput Arch','Computing Systems'),(6290,'High Perform Comput Arch','High Performance Computing'),(6301,'Adv Software Engineering','Interactive Intelligence'),(6365,'Intro Enterprise Comput.','Computing Systems'),(6422,'Database System Implemnt','Computing Systems'),(6440,'Intro Health Informatics','Interactive Intelligence'),(6460,'Educ Tech-Foundations','Human Centered Computing'),(6460,'Educ Tech-Foundations','Human Computer Interaction'),(6460,'Educ Tech-Foundations','Interactive Intelligence'),(6470,'Online Communities','Human Centered Computing'),(6470,'Online Communities','Human Computer Interaction'),(6470,'Online Communities','Social Computing'),(6475,'Comp. Photography','Computational Perception and Robotics'),(6475,'Comp. Photography','Computer Graphics'),(6550,'Design& Analy-Algorithms','Computational Perception and Robotics'),(6550,'Design& Analy-Algorithms','Computing Systems'),(6550,'Design& Analy-Algorithms','Machine Learning'),(6675,'Advance Internet Comput','Computing Systems'),(6675,'Advance Internet Comput','Social Computing'),(6725,'Info Security Policies','NA'),(6745,'Info&Com Tech&Global Dev','NA'),(6750,'Human-Computer Interact','Human Centered Computing'),(6750,'Human-Computer Interact','Human Computer Interaction'),(6750,'Human-Computer Interact','Interactive Intelligence'),(6750,'Human-Computer Interact','Social Computing'),(6750,'Human-Computer Interact','Visual Analytics'),(6795,'Intro-Cognitive Science','Human Centered Computing'),(6795,'Intro-Cognitive Science','Human Computer Interaction'),(6795,'Intro-Cognitive Science','Interactive Intelligence'),(6795,'Intro-Cognitive Science','Visual Analytics'),(7260,'Internet Arch& Protocols','Computing Systems'),(7455,'Issues/Human-Center Comp','Human Centered Computing'),(7470,'Ubiquitous Computing','Human Centered Computing'),(7470,'Ubiquitous Computing','Human Computer Interaction'),(7492,'Simulation of Biology','Computer Graphics'),(7520,'Approximation Algorithms','Computational Perception and Robotics'),(7520,'Approximation Algorithms','Machine Learning'),(7632,'Game AI','Human Centered Computing'),(7632,'Game AI','Interactive Intelligence'),(7641,'Machine Learning','Computational Perception and Robotics'),(7641,'Machine Learning','Interactive Intelligence'),(7641,'Machine Learning','Machine Learning'),(7643,'Deep Learning','Machine Learning'),(7649,'Robot Intelli: Planning','Computational Perception and Robotics'),(8803,'Intro to Grad Algorithms','NA'),(8803,'Robotics Research Fnd I','NA'),(8803,'Robotics Research Fnd II','NA'),(8803,'Special Topics\nData Visualization Prin & Appl','NA'),(8803,'Special Topics Adaptive Control and RL','NA'),(8803,'Special Topics Big Data and Society','NA'),(8803,'Special Topics Blockchain and Cryptocurrencies','NA'),(8803,'Special Topics Continuous Algorithms','NA'),(8803,'Special Topics Cyber-Phys Sys Design','NA'),(8803,'Special Topics Graphical Models in ML','NA'),(8803,'Special Topics Human AI Interaction','NA'),(8803,'Special Topics Interconnection Networks','NA'),(8803,'Special Topics Inverse Uncertainty Quant','NA'),(8803,'Special Topics Mobile Applications & Services','NA'),(8803,'Special Topics Robotics Motion Planning','NA'),(8803,'Special Topics Sonification Lab R&D Studio','NA'),(8803,'Special Topics Statistical Machine Learning','NA'),(8803,'Special Topics Systems Issues in Cloud Computing','NA'),(8803,'Special Topics Usable Privacy and Security','NA');
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taken`
--

DROP TABLE IF EXISTS `taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taken` (
  `username` varchar(20) DEFAULT NULL,
  `crn` int(5) DEFAULT NULL,
  `prof` varchar(20) DEFAULT NULL,
  `grade` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taken`
--

LOCK TABLES `taken` WRITE;
/*!40000 ALTER TABLE `taken` DISABLE KEYS */;
INSERT INTO `taken` VALUES ('pchoudhary32',6210,'Ramachandran','4'),('pchoudhary32',6290,'Qureshi','4'),('pchoudhary32',6230,'Isaac','4'),('pchoudhary32',8903,'Ramachandran','4'),('pchoudhary32',6133,'Lim','4'),('pchoudhary32',6122,'Swenson','4'),('pchoudhary32',6102,'Blough','3'),('pchoudhary32',8823,'Yalamanchilli','4'),('pchoudhary32',6601,'Starner','4'),('pchoudhary32',6400,'Navathe','4'),('pchoudhary32',6262,'Lee','4');
/*!40000 ALTER TABLE `taken` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('pchoudhary32','password','computing systems'),('admin','$2b$10$RRMa4iSi3SrBCjGMypXpL.fsahO/7RdoamC9M5HfL6Iq5zdM1nwie','systems');
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

-- Dump completed on 2018-12-02 19:43:10
