-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: helpdesk
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Agrigate'),(2,'ASIC'),(3,'Awba'),(4,'Awba Group'),(5,'Evo'),(6,'HAIC'),(7,'MAFSCO'),(8,'Maha Microfinance'),(9,'Mahamate'),(10,'MAI'),(11,'MKTK'),(12,'MSCN'),(13,'Pahtama Seed'),(14,'PTPZ'),(15,'Village Link'),(16,'WSR');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Account'),(2,'Admin'),(3,'Audit'),(4,'Chairman Office'),(5,'Cooperative'),(6,'Coorporate Affairs and Special'),(7,'Customer Service/Order Process'),(8,'Delivery'),(9,'DXIT'),(10,'Engineering'),(11,'Finance/Account'),(12,'HAIC'),(13,'HR'),(14,'HSE'),(15,'Internal Audit'),(16,'IT'),(17,'Legal'),(18,'Logistic'),(19,'Management'),(20,'Market Communication'),(21,'Marketing'),(22,'Operation'),(23,'Order'),(24,'Product Registration'),(25,'Production'),(26,'QA'),(27,'Trading'),(28,'Warehouse');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `is_multiple_tag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'CUG',1),(2,'Denko',1),(3,'FMS',1),(4,'IT Support',1),(5,'Kaizala',1),(6,'Loyalty',1),(7,'Loyalty 2.0',1),(8,'SAP',1),(9,'User Support',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tag`
--

DROP TABLE IF EXISTS `project_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tag` (
  `project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `project_tag_project` (`project_id`),
  KEY `project_tag_tag` (`tag_id`),
  CONSTRAINT `project_tag_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `project_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tag`
--

LOCK TABLES `project_tag` WRITE;
/*!40000 ALTER TABLE `project_tag` DISABLE KEYS */;
INSERT INTO `project_tag` VALUES (8,19),(8,10),(8,24),(8,14),(8,4),(6,15),(6,5),(6,9),(6,6),(6,8),(6,27),(4,11),(4,17),(9,13),(9,20),(9,21),(9,18),(9,28),(9,26),(1,3),(1,2),(1,7),(1,16),(2,22),(2,12),(3,22),(3,12),(5,25),(5,12),(7,1),(7,25),(7,8),(7,23);
/*!40000 ALTER TABLE `project_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Non-DXIT Employee'),(2,'Non-DXIT Manager'),(3,'Non-DXIT Administrator'),(4,'DXIT Employee'),(5,'DXIT Manager'),(6,'DXIT Administrator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Opened'),(2,'Assigned'),(3,'Resolved'),(4,'Closed');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_type`
--

LOCK TABLES `support_type` WRITE;
/*!40000 ALTER TABLE `support_type` DISABLE KEYS */;
INSERT INTO `support_type` VALUES (1,'Admin Portal'),(2,'Communication Apps'),(3,'Direct Support'),(4,'Email'),(5,'Phone Call'),(6,'Phone Service'),(7,'Remote'),(8,'Teams call'),(9,'Ticket open'),(10,'Whatsapp');
/*!40000 ALTER TABLE `support_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'App Issue'),(2,'Balance Issue'),(3,'Billing Issue'),(4,'Budget and Billing Request'),(5,'Channel app Issue'),(6,'Client PC Issue'),(7,'Connection Issue'),(8,'Data Retrieve Support'),(9,'Database Issue'),(10,'Functional Issue'),(11,'Internet billing issue'),(12,'Issue'),(13,'Laptop and Accessories Purchase issue'),(14,'License Request'),(15,'Maintenance Support'),(16,'Monthly Request'),(17,'Network issue'),(18,'Office 365 Issue'),(19,'Operational Issue'),(20,'Outlook Issue'),(21,'Printer/Scanner Issue'),(22,'Request'),(23,'Requirement Request'),(24,'Server Issue'),(25,'Training'),(26,'Unicode Issue'),(27,'User Role Request'),(28,'Windows/Software Setup');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `open_person` int(11) NOT NULL,
  `open_date` varchar(50) NOT NULL,
  `assign_person` int(11) NOT NULL,
  `assign_date` varchar(50) NOT NULL,
  `resolve_person` int(11) DEFAULT NULL,
  `resolve_date` varchar(50) DEFAULT NULL,
  `resolution_description` text,
  `close_person` int(11) DEFAULT NULL,
  `close_date` varchar(50) DEFAULT NULL,
  `support_type_id` int(11) DEFAULT NULL,
  `remark` text NOT NULL,
  `open_dow` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_project` (`project_id`),
  KEY `ticket_status` (`status_id`),
  KEY `ticket_close_person` (`user_id`),
  KEY `ticket_support_type` (`support_type_id`),
  CONSTRAINT `ticket_assign_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_close_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_open_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `ticket_resolve_person` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `ticket_support_type` FOREIGN KEY (`support_type_id`) REFERENCES `support_type` (`id`),
  CONSTRAINT `ticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,2,1,2,1,'09/11/2020 09:29:45',1,'09/11/2020 09:29:45',NULL,NULL,NULL,NULL,NULL,NULL,'4',1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_tag`
--

DROP TABLE IF EXISTS `ticket_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_tag` (
  `ticket_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `ticket_tag_ticket` (`ticket_id`),
  KEY `ticket_tag_tag` (`tag_id`),
  CONSTRAINT `ticket_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `ticket_tag_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_tag`
--

LOCK TABLES `ticket_tag` WRITE;
/*!40000 ALTER TABLE `ticket_tag` DISABLE KEYS */;
INSERT INTO `ticket_tag` VALUES (1,3),(1,2),(1,7),(1,16);
/*!40000 ALTER TABLE `ticket_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `position` varchar(40) NOT NULL,
  `is_verified` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_company` (`company_id`),
  KEY `user_department` (`department_id`),
  KEY `user_role` (`role_id`),
  CONSTRAINT `user_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `user_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Zay Min Paing','zayminpaing@awba-group.com','48ad574bb0194f5b0155b0a61177b8f46f87cbfe895909ce26acdfec985c578dfa073b1c0f78b1c2e295087e4cb0917fcd3272fdaf8a0d1f6792629dcb4cd509',4,9,4,'Project Coordinator',0),(2,'Aung Chit Moe','aungchitmoe@awba-group.com','dxit',4,9,4,'Project Coordinator',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-12  4:14:53
