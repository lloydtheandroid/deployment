-- MySQL dump 10.14  Distrib 5.5.46-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: threadfix
-- ------------------------------------------------------
-- Server version	5.5.46-MariaDB

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
-- Current Database: `threadfix`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `threadfix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `threadfix`;

--
-- Table structure for table `APIKey`
--

DROP TABLE IF EXISTS `APIKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIKey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `apiKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRestrictedKey` bit(1) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7374AE05D593C930` (`userId`),
  CONSTRAINT `FK7374AE05D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APIKey`
--

LOCK TABLES `APIKey` WRITE;
/*!40000 ALTER TABLE `APIKey` DISABLE KEYS */;
/*!40000 ALTER TABLE `APIKey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessControlApplicationMap`
--

DROP TABLE IF EXISTS `AccessControlApplicationMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessControlApplicationMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `accessControlTeamMapId` int(11) NOT NULL,
  `applicationId` int(11) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD8CDF9855AD99D46` (`accessControlTeamMapId`),
  KEY `FKD8CDF985D03E73C6` (`roleId`),
  KEY `FKD8CDF985C96E039C` (`applicationId`),
  CONSTRAINT `FKD8CDF985C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKD8CDF9855AD99D46` FOREIGN KEY (`accessControlTeamMapId`) REFERENCES `AccessControlTeamMap` (`id`),
  CONSTRAINT `FKD8CDF985D03E73C6` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessControlApplicationMap`
--

LOCK TABLES `AccessControlApplicationMap` WRITE;
/*!40000 ALTER TABLE `AccessControlApplicationMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessControlApplicationMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessControlTeamMap`
--

DROP TABLE IF EXISTS `AccessControlTeamMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessControlTeamMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `allApps` bit(1) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `organizationId` int(11) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2321484688316300` (`organizationId`),
  KEY `FK23214846D03E73C6` (`roleId`),
  KEY `FK23214846F66212FA` (`groupId`),
  KEY `FK23214846D593C930` (`userId`),
  CONSTRAINT `FK23214846D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK2321484688316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`),
  CONSTRAINT `FK23214846D03E73C6` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK23214846F66212FA` FOREIGN KEY (`groupId`) REFERENCES `Groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessControlTeamMap`
--

LOCK TABLES `AccessControlTeamMap` WRITE;
/*!40000 ALTER TABLE `AccessControlTeamMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessControlTeamMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `component` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criticalVulnCount` int(11) DEFAULT NULL,
  `encryptedPassword` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedUserName` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frameworkType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highVulnCount` int(11) DEFAULT NULL,
  `infoVulnCount` int(11) DEFAULT NULL,
  `lowVulnCount` int(11) DEFAULT NULL,
  `mediumVulnCount` int(11) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `projectId` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectRoot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryBranch` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryDBBranch` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryEncryptedPassword` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryEncryptedUserName` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryFolder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryRevision` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repositoryUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rootPath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skipApplicationMerge` bit(1) DEFAULT NULL,
  `sourceCodeAccessLevel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalVulnCount` int(11) DEFAULT NULL,
  `uniqueId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useDefaultCredentials` bit(1) DEFAULT NULL,
  `useDefaultProject` bit(1) DEFAULT NULL,
  `applicationCriticalityId` int(11) DEFAULT NULL,
  `defectTrackerId` int(11) DEFAULT NULL,
  `grcToolId` int(11) DEFAULT NULL,
  `mainDefaultDefectProfileId` int(11) DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  `wafId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC00DAD3088316300` (`organizationId`),
  KEY `FKC00DAD303088567C` (`grcToolId`),
  KEY `FKC00DAD30D9C91C2A` (`defectTrackerId`),
  KEY `FKC00DAD30CBF8F578` (`applicationCriticalityId`),
  KEY `FKC00DAD30C2587A41` (`mainDefaultDefectProfileId`),
  KEY `FKC00DAD308B18CCB4` (`wafId`),
  CONSTRAINT `FKC00DAD308B18CCB4` FOREIGN KEY (`wafId`) REFERENCES `Waf` (`id`),
  CONSTRAINT `FKC00DAD303088567C` FOREIGN KEY (`grcToolId`) REFERENCES `GRCTool` (`id`),
  CONSTRAINT `FKC00DAD3088316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`),
  CONSTRAINT `FKC00DAD30C2587A41` FOREIGN KEY (`mainDefaultDefectProfileId`) REFERENCES `DefaultDefectProfile` (`id`),
  CONSTRAINT `FKC00DAD30CBF8F578` FOREIGN KEY (`applicationCriticalityId`) REFERENCES `ApplicationCriticality` (`id`),
  CONSTRAINT `FKC00DAD30D9C91C2A` FOREIGN KEY (`defectTrackerId`) REFERENCES `DefectTracker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApplicationChannel`
--

DROP TABLE IF EXISTS `ApplicationChannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationChannel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `scanCounter` int(11) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `channelTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC2231B347A56B56` (`channelTypeId`),
  KEY `FKBC2231B3C96E039C` (`applicationId`),
  CONSTRAINT `FKBC2231B3C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKBC2231B347A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationChannel`
--

LOCK TABLES `ApplicationChannel` WRITE;
/*!40000 ALTER TABLE `ApplicationChannel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApplicationChannel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApplicationCriticality`
--

DROP TABLE IF EXISTS `ApplicationCriticality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationCriticality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationCriticality`
--

LOCK TABLES `ApplicationCriticality` WRITE;
/*!40000 ALTER TABLE `ApplicationCriticality` DISABLE KEYS */;
INSERT INTO `ApplicationCriticality` VALUES (1,'Low'),(2,'Medium'),(3,'High'),(4,'Critical');
/*!40000 ALTER TABLE `ApplicationCriticality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApplicationVersion`
--

DROP TABLE IF EXISTS `ApplicationVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApplicationVersion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA50BD188C96E039C` (`applicationId`),
  CONSTRAINT `FKA50BD188C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApplicationVersion`
--

LOCK TABLES `ApplicationVersion` WRITE;
/*!40000 ALTER TABLE `ApplicationVersion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApplicationVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Application_Tag`
--

DROP TABLE IF EXISTS `Application_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application_Tag` (
  `Application_Id` int(11) NOT NULL,
  `Tag_Id` int(11) NOT NULL,
  KEY `FK7A400BEB4FD7845B` (`Tag_Id`),
  KEY `FK7A400BEBB8FDAF9B` (`Application_Id`),
  CONSTRAINT `FK7A400BEBB8FDAF9B` FOREIGN KEY (`Application_Id`) REFERENCES `Application` (`id`),
  CONSTRAINT `FK7A400BEB4FD7845B` FOREIGN KEY (`Tag_Id`) REFERENCES `Tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application_Tag`
--

LOCK TABLES `Application_Tag` WRITE;
/*!40000 ALTER TABLE `Application_Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Application_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit`
--

DROP TABLE IF EXISTS `Audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3CAABBBDFCC92B4` (`vulnerabilityId`),
  CONSTRAINT `FK3CAABBBDFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit`
--

LOCK TABLES `Audit` WRITE;
/*!40000 ALTER TABLE `Audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelSeverity`
--

DROP TABLE IF EXISTS `ChannelSeverity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelSeverity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numericValue` int(11) NOT NULL,
  `channelTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3895F90047A56B56` (`channelTypeId`),
  CONSTRAINT `FK3895F90047A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelSeverity`
--

LOCK TABLES `ChannelSeverity` WRITE;
/*!40000 ALTER TABLE `ChannelSeverity` DISABLE KEYS */;
INSERT INTO `ChannelSeverity` VALUES (1,'3','Medium',3,4),(2,'4','High',4,4),(3,'1','Info',1,4),(4,'2','Low',2,4),(5,'5','Critical',5,4),(6,'1','1',1,22),(7,'2','2',2,22),(8,'3','3',3,22),(9,'4','4',4,22),(10,'5','5',5,22),(11,'medium','medium',3,1),(12,'high','high',4,1),(13,'info','info',1,1),(14,'low','low',2,1),(15,'4.0','Hot',3,9),(16,'3.0','Warning',2,9),(17,'2.0','Info',1,9),(18,'Critical','Critical',4,9),(19,'High','High',3,9),(20,'Medium','Medium',2,9),(21,'Low','Low',1,9),(22,'Critical','Critical',5,10),(23,'High','High',4,10),(24,'Medium','Medium',3,10),(25,'Low','Low',2,10),(26,'Info','Info',1,10),(27,'High','High',4,7),(28,'Medium','Medium',3,7),(29,'Low','Low',2,7),(30,'Informational','Informational',1,7),(31,'Information','Information',1,7),(32,'1','1',2,13),(33,'2','2',3,13),(34,'3','3',5,13),(35,'0-Safe','0-Safe',1,14),(36,'1-Info','1-Info',2,14),(37,'2-Low','2-Low',3,14),(38,'3-Med','3-Med',4,14),(39,'4-High','4-High',5,14),(40,'3-Medium','3-Medium',4,14),(41,'1-Informational','1-Informational',2,14),(42,'0','0',1,21),(43,'1','1',2,21),(44,'2','2',3,21),(45,'3','3',4,21),(46,'4','4',5,21),(47,'5','5',5,19),(48,'4','4',4,19),(49,'3','3',3,19),(50,'2','2',2,19),(51,'1','1',1,19),(52,'Critical','Critical',5,12),(53,'High','High',4,12),(54,'Medium','Medium',3,12),(55,'Low','Low',2,12),(56,'Info','Info',1,12),(57,'1','1',1,8),(58,'2','2',2,8),(59,'3','3',3,8),(60,'4','4',4,8),(61,'5','5',5,8),(62,'Information','Information',1,3),(63,'Medium','Medium',3,3),(64,'High','High',4,3),(65,'Low','Low',2,3),(66,'Information','Information',1,11),(67,'Medium','Medium',3,11),(68,'Important','Important',4,11),(69,'Low','Low',2,11),(70,'Critical','Critical',5,11),(71,'INFORMATIONAL','INFORMATIONAL',1,2),(72,'LOW','LOW',2,2),(73,'MEDIUM','MEDIUM',3,2),(74,'HIGH','HIGH',4,2),(75,'2','Medium',2,6),(76,'3','Low',1,6),(77,'1','High',3,6),(78,'0','High',3,6),(79,'0','0',1,18),(80,'1','1',2,18),(81,'2','2',3,18),(82,'3','3',4,18),(83,'4','4',5,18),(84,'5','5',5,17),(85,'4','4',4,17),(86,'3','3',3,17),(87,'2','2',2,17),(88,'1','1',1,17),(89,'Medium','Medium',3,20),(90,'Low','Low',2,20),(91,'High','High',4,20),(92,'Info','Info',1,20),(93,'1','1',1,15),(94,'2','2',2,15),(95,'3','3',3,15),(96,'4','4',4,15),(97,'5','5',5,15),(98,'High','1',3,6),(99,'Low','3',1,6),(100,'Medium','2',2,6),(101,'Informational','Informational',1,2),(102,'High','High',4,2),(103,'Medium','Medium',3,2),(104,'Low','Low',2,2),(105,'Critical','5',5,4),(106,'Low','2',2,4),(107,'Info','1',1,4),(108,'High','4',4,4),(109,'Medium','3',3,4),(110,'Information','Information',1,24),(111,'High','High',4,24),(112,'Medium','Medium',3,24),(113,'Low','Low',2,24),(114,'Information','Information',1,25),(115,'High','High',4,25),(116,'Medium','Medium',3,25),(117,'Low','Low',2,25),(118,'Info','Info',1,9),(119,'Warning','Warning',2,9),(120,'Hot','Hot',3,9),(121,'Medium','Medium',3,26),(122,'Information','Information',1,20),(123,'note','note',1,19),(124,'critical','critical',5,19),(125,'high','high',4,19),(126,'medium','medium',3,19),(127,'low','low',2,19),(128,'1','Critical',5,16),(129,'2','High',4,16),(130,'3','Medium',3,16),(131,'4','Low',2,16),(132,'5','Information',1,16),(133,'Note','Note',1,27),(134,'Critical','Critical',5,27),(135,'High','High',4,27),(136,'Medium','Medium',3,27),(137,'Low','Low',2,27),(138,'0','0',1,15),(139,'No Threat','No Threat',1,10),(140,'critical','critical',5,10),(141,'severe','severe',4,10),(142,'moderate','moderate',3,10),(143,'Code Quality','Code Quality',1,9),(144,'error','High',4,28),(145,'warning','Medium',3,28),(146,'style','Low',2,28),(147,'performance','Low',2,28),(148,'portability','Low',2,28),(149,'information','Information',1,28),(150,'Information','Information',1,30),(151,'Critical','Critical',5,30),(152,'High','High',4,30),(153,'Medium','Medium',3,30),(154,'Low','Low',2,30),(155,'Medium','Medium',3,31);
/*!40000 ALTER TABLE `ChannelSeverity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelType`
--

DROP TABLE IF EXISTS `ChannelType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exportInfo` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelType`
--

LOCK TABLES `ChannelType` WRITE;
/*!40000 ALTER TABLE `ChannelType` DISABLE KEYS */;
INSERT INTO `ChannelType` VALUES (1,'The Acunetix importer requires the XML output from Acunetix. To export in this format, use the /exportxml option on the command line.','Acunetix WVS','http://www.acunetix.com/vulnerability-scanner/','8'),(2,'The Arachni importer requires the XML output from Arachni. To get this format, use an option with this format: --report=xml:outfile=example.xml','Arachni','https://github.com/Zapotek/arachni','.3'),(3,'The Burp importer accepts the XML output as input. After you are done scanning, navigate to scanner -> results, then highlight the results in the left panel that you want to include, then right click and select \"report selected issues.\" In that menu pick XML and keep the default options.','Burp Suite Pro','http://portswigger.net/burp/','1.4'),(4,'The Brakeman importer requires the Brakeman JSON output. To get this format, either specify a file with a JSON extension for output (-o example.json) or use the -f option to set it explicitly (-f json).','Brakeman','http://brakemanscanner.org/','1.5.2'),(5,'The Appscan Source Edition importer imports the .ozasmt format. This may not work with up-to-date versions of AppScan source edition.','IBM Security AppScan Enterprise','http://www-01.ibm.com/software/rational/products/appscan/source/','-'),(6,'The Appscan Enterprise importer requires the full xml report.','IBM Security AppScan Source','http://www-01.ibm.com/software/rational/products/appscan/enterprise/','-'),(7,'The AppScan importer accepts the XML output as input. Click File -> Export -> Scan Results as XML.','IBM Security AppScan Standard','http://www-01.ibm.com/software/awdtools/appscan/','-'),(8,'The FindBugs importer requires the XML output of FindBugs (FindBugs -> Save XML).','FindBugs','http://findbugs.sourceforge.net/','1.3.9'),(9,'The Fortify importer requires the Fortify FPR format. To export in this format, use the -f filename.fpr option.','Fortify SCA','http://www.fortify.com','2.5.0'),(10,'This upload uses the SSVL format.','Manual','https://github.com/OWASP/SSVL','.3'),(11,'The Netsparker importer requires the Vulnerabilities List (XML) format from the Reporting menu in the Netsparker GUI.','Mavituna Security Netsparker','http://www.mavitunasecurity.com/','-'),(12,'The CAT.NET importer requires the CAT.NET XML format.','Microsoft CAT.NET','http://msdn.microsoft.com/en-us/security/default.aspx','1 CTP'),(13,'The Nessus importer requires the Nessus 5 v2 .nessus format. To export a report in this format, select the scan in the Reports screen, then click Download, then pick .nessus in the Download Format drop down.','Nessus','http://www.tenable.com/products/nessus','4.4'),(14,'ThreadFix imports the VulnerabilitiesSummary generated in the Reports/scan-name/date directory after the scan finishes.','AppSpider','http://www.ntobjectives.com/security-software/ntospider-application-security-scanner/','5.4'),(15,'The OWASP ZAP importer requires the XML format, which you can export with Report -> Generate XML Report...','OWASP Zed Attack Proxy','http://code.google.com/p/zaproxy/','1.3.2'),(16,'The PMD importer requires the XML output of PMD.','PMD','http://pmd.sourceforge.net/','5.1.1'),(17,'You shouldn\'t be seeing this.','QualysGuard WAS','http://www.qualys.com/products/qg_suite/was/','2.1'),(18,'The Skipfish importer accepts a zipped version of the Skipfish output folder as input. Specify the output folder with -o example-folder-name, then zip the folder with whatever utility you prefer.','Skipfish','http://code.google.com/p/skipfish/','1.92b'),(19,'You shouldn\'t be seeing this.','WhiteHat Sentinel','http://www.whitehatsec.com/home/services/services.html','-'),(20,'The w3af importer needs a configured XML output plugin. The w3af standard scripts contain one called script-xml_output.w3af which generates a valid xml configuration for ThreadFix.','w3af','http://w3af.sourceforge.net/','1.0-rc6'),(21,'The WebInspect importer requires the Full XML report format. To export in this format after you have conducted a scan, click Export, then Details, then Full.','WebInspect','https://www.fortify.com/products/web_inspect.html','9.00'),(22,'You shouldn\'t be seeing this.','Veracode','http://www.veracode.com/','-'),(23,'You shouldn\'t be seeing this.','Dependency Check','https://github.com/jeremylong/DependencyCheck','1.02'),(24,' Download it from the site','Trustwave Hailstorm','http://www.cenzic.com','1'),(25,' Download it from the site','CheckMarx','http://www.checkmarx.com','7.8'),(26,'xml sample files','SWAMP SCARF','','1'),(27,'Use as a Remote Provider','Contrast','http://www1.contrastsecurity.com/','1'),(28,'XML format (version 2). Command parameter --xml-version=2','Cppcheck','http://cppcheck.sourceforge.net/','1.67'),(29,'Create a scan manually','SSVL','https://github.com/OWASP/SSVL','.1'),(30,'Do a manual scan','CodeProfiler','https://www.virtualforge.com/','3.8'),(31,'NOTE HERE ON FILE INPUT TYPE','Clang','http://clang-analyzer.llvm.org/','checker-276'),(32,'Use as a Remote Provider','Sonatype','http://www.sonatype.org/nexus/','1'),(33,'Use as a Remote Provider','WhiteHat Sentinel Source','https://source.whitehatsec.com/application_findings_detail.html','1');
/*!40000 ALTER TABLE `ChannelType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelVulnerability`
--

DROP TABLE IF EXISTS `ChannelVulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelVulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userCreated` bit(1) DEFAULT NULL,
  `channelTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE09C785947A56B56` (`channelTypeId`),
  CONSTRAINT `FKE09C785947A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelVulnerability`
--

LOCK TABLES `ChannelVulnerability` WRITE;
/*!40000 ALTER TABLE `ChannelVulnerability` DISABLE KEYS */;
INSERT INTO `ChannelVulnerability` VALUES (11672,'Android Bad Practices: Application Permission Defined','Android Bad Practices: Application Permission Defined','\0',9),(11673,'Often Misused: File Uploads','Often Misused: File Uploads','\0',9),(11674,'Unsafe Native Invoke','Unsafe Native Invoke','\0',9),(11675,'Insecure Storage: Android World Readable or Writeable','Insecure Storage: Android World Readable or Writeable','\0',9),(11676,'ASP.NET Misconfiguration: HttpOnly Unset','ASP.NET Misconfiguration: HttpOnly Unset','\0',9),(11677,'Often Misused: Weak SSL Certificate','Often Misused: Weak SSL Certificate','\0',9),(11678,'Insecure Storage: Android Backup Storage','Insecure Storage: Android Backup Storage','\0',9),(11679,'Password Management: Insecure Submission','Password Management: Insecure Submission','\0',9),(11680,'Object Model Violation: Just One of Equals() and GetHashCode() Defined','Object Model Violation: Just One of Equals() and GetHashCode() Defined','\0',9),(11681,'Dangerous Function: Strcpy','Dangerous Function: Strcpy','\0',9),(11682,'Poor Error Handling: XACT_STATE()','Poor Error Handling: XACT_STATE()','\0',9),(11683,'Statistical: Function Return Unused','Statistical: Function Return Unused','\0',9),(11684,'Struts 2 Bad Practices: Request Map Tampering','Struts 2 Bad Practices: Request Map Tampering','\0',9),(11685,'XQuery Injection','XQuery Injection','\0',9),(11686,'Privacy Violation: Heap Inspection','Privacy Violation: Heap Inspection','\0',9),(11687,'Insecure Randomness: Poor Seeding','Insecure Randomness: Poor Seeding','\0',9),(11688,'PHP Misconfiguration: magic_quotes_sybase Enabled','PHP Misconfiguration: magic_quotes_sybase Enabled','\0',9),(11689,'WCF Misconfiguration: Certificate Validation Not Enabled','WCF Misconfiguration: Certificate Validation Not Enabled','\0',9),(11690,'ASP.NET MVC Bad Practices: Request Parameters Bound into Persisted Objects','ASP.NET MVC Bad Practices: Request Parameters Bound into Persisted Objects','\0',9),(11691,'Encoded Data Validation','Encoded Data Validation','\0',9),(11692,'Key Management: Empty Encryption Key','Key Management: Empty Encryption Key','\0',9),(11693,'SQL Injection: Lateral SQL Injection','SQL Injection: Lateral SQL Injection','\0',9),(11694,'Often Misused: Exception Handling','Often Misused: Exception Handling','\0',9),(11695,'Privilege Management: Missing Content Provider Permission','Privilege Management: Missing Content Provider Permission','\0',9),(11696,'Hadoop Job Manipulation','Hadoop Job Manipulation','\0',9),(11697,'Insecure SSL: Android Socket','Insecure SSL: Android Socket','\0',9),(11698,'Unreleased Resource: Android Media','Unreleased Resource: Android Media','\0',9),(11699,'Key Management: Null Encryption Key','Key Management: Null Encryption Key','\0',9),(11700,'HTML5: Form Validation Turned Off','HTML5: Form Validation Turned Off','\0',9),(11701,'ASP.NET Misconfiguration: Sensitive File Persistence','ASP.NET Misconfiguration: Sensitive File Persistence','\0',9),(11702,'Password Management: Password in HTML Form','Password Management: Password in HTML Form','\0',9),(11703,'ASP.NET Misconfiguration: Incomplete Certificate Validation','ASP.NET Misconfiguration: Incomplete Certificate Validation','\0',9),(11704,'Android Bad Practices: Weak Authentication','Android Bad Practices: Weak Authentication','\0',9),(11705,'Insecure Transport','Insecure Transport','\0',9),(11706,'Often Misused: Android Permission Check','Often Misused: Android Permission Check','\0',9),(11707,'XML External Entity Injection','XML External Entity Injection','\0',9),(11708,'Portability Flaw: File Separator','Portability Flaw: File Separator','\0',9),(11709,'Denial of Service: Routing','Denial of Service: Routing','\0',9),(11710,'Often Misused: Strings','Often Misused: Strings','\0',9),(11711,'Spring Webflow Bad Practices: Flow Bypass','Spring Webflow Bad Practices: Flow Bypass','\0',9),(11712,'HTML5: Overly Permissive Message Posting Policy','HTML5: Overly Permissive Message Posting Policy','\0',9),(11713,'Android Bad Practices: Use of Released SQLite Resource','Android Bad Practices: Use of Released SQLite Resource','\0',9),(11714,'Unreleased Resource: Android Camera','Unreleased Resource: Android Camera','\0',9),(11715,'ASP.NET Misconfiguration: Excessive Session Timeout','ASP.NET Misconfiguration: Excessive Session Timeout','\0',9),(11716,'Weak XML Schema: Unbounded Occurences','Weak XML Schema: Unbounded Occurences','\0',9),(11717,'Spring MVC Bad Practices: Flow Bypass','Spring MVC Bad Practices: Flow Bypass','\0',9),(11718,'HTML5: Overly Permissive CORS Policy','HTML5: Overly Permissive CORS Policy','\0',9),(11719,'Struts 2 Bad Practices: Application Map Tampering','Struts 2 Bad Practices: Application Map Tampering','\0',9),(11720,'Null Dereference: Dereference before Check','Null Dereference: Dereference before Check','\0',9),(11721,'Privacy Violation: Android Internal Storage','Privacy Violation: Android Internal Storage','\0',9),(11722,'Unreleased Resource: Android SQLite Database','Unreleased Resource: Android SQLite Database','\0',9),(11723,'Dynamic Code Evaluation: Code Manipulation','Dynamic Code Evaluation: Code Manipulation','\0',9),(11724,'Insecure SSL: Android Customized Implementation','Insecure SSL: Android Customized Implementation','\0',9),(11725,'HTML5: Easy-to-Guess Database Name','HTML5: Easy-to-Guess Database Name','\0',9),(11726,'Often Misused: File System','Often Misused: File System','\0',9),(11727,'ASP.NET Bad Practices: Unvalidated Web API Model','ASP.NET Bad Practices: Unvalidated Web API Model','\0',9),(11728,'HTTP Parameter Pollution','HTTP Parameter Pollution','\0',9),(11729,'HTTP Response Splitting','HTTP Response Splitting','\0',9),(11730,'Code Correctness: Regular Expressions Denial of Service','Code Correctness: Regular Expressions Denial of Service','\0',9),(11731,'Dangerous Function: strcpy()','Dangerous Function: strcpy()','\0',9),(11732,'Insecure Storage: Missing Encryption on Stored Private Media','Insecure Storage: Missing Encryption on Stored Private Media','\0',9),(11733,'Privilege Management: Android Connectivity','Privilege Management: Android Connectivity','\0',9),(11734,'Android Bad Practices: Use of Released Camera Resource','Android Bad Practices: Use of Released Camera Resource','\0',9),(11735,'ASP.NET Misconfiguration: Double Escaping Enabled','ASP.NET Misconfiguration: Double Escaping Enabled','\0',9),(11736,'Android Bad Practices: Unnecessary Component Exposure','Android Bad Practices: Unnecessary Component Exposure','\0',9),(11737,'Insecure SSL: Android Hostname Verification Disabled','Insecure SSL: Android Hostname Verification Disabled','\0',9),(11738,'Struts 2 Bad Practices: Session Map Tampering','Struts 2 Bad Practices: Session Map Tampering','\0',9),(11739,'Poor Error Handling: No Default Exception Handler','Poor Error Handling: No Default Exception Handler','\0',9),(11740,'JSON Injection','JSON Injection','\0',9),(11741,'Hadoop Cluster Manipulation','Hadoop Cluster Manipulation','\0',9),(11742,'Null Dereference: Check before Dereference','Null Dereference: Check before Dereference','\0',9),(11743,'Android Bad Practices: Use of Released Media Resource','Android Bad Practices: Use of Released Media Resource','\0',9),(11744,'Android Misconfiguration: Debug Information','Android Misconfiguration: Debug Information','\0',9),(11745,'ASP.NET Misconfiguration: Request Path Validation Disabled','ASP.NET Misconfiguration: Request Path Validation Disabled','\0',9),(11746,'Unsafe Mobile Code: Insecure Transport','Unsafe Mobile Code: Insecure Transport','\0',9),(11747,'Array Bounds Error','Array Bounds Error','\0',9),(11748,'Unreleased Resource: Unmanaged Object','Unreleased Resource: Unmanaged Object','\0',9),(11749,'PCI Privacy Violation','PCI Privacy Violation','\0',9),(11750,'Often Misused: SMS','Often Misused: SMS','\0',9),(11751,'Privacy Violation: Keyboard Caching','Privacy Violation: Keyboard Caching','\0',9),(11752,'XML Entity Expansion Injection','XML Entity Expansion Injection','\0',9),(11753,'Key Management: Hardcoded Encryption Key','Key Management: Hardcoded Encryption Key','\0',9),(11754,'Access Control: SecurityManager Bypass','Access Control: SecurityManager Bypass','\0',9),(11755,'ASP.NET Misconfiguration: Header Checking Disabled','ASP.NET Misconfiguration: Header Checking Disabled','\0',9),(11756,'Privacy Violation: Screen Caching','Privacy Violation: Screen Caching','\0',9),(11757,'XSLT Injection','XSLT Injection','\0',9),(11758,'Insecure Transport: HTTP GET','Insecure Transport: HTTP GET','\0',9),(11759,'Android Bad Practices: Mixed Component Functionality','Android Bad Practices: Mixed Component Functionality','\0',9),(11760,'Fortify 360 Build Misconfiguration: External Ant Dependency Repository','Fortify 360 Build Misconfiguration: External Ant Dependency Repository','\0',9),(11761,'Fortify 360 Cookie Security: Overly Broad Path','Fortify 360 Cookie Security: Overly Broad Path','\0',9),(11762,'Fortify 360 Insider Threat: Email Spying','Fortify 360 Insider Threat: Email Spying','\0',9),(11763,'Fortify 360 Insider Threat: External Ant Command','Fortify 360 Insider Threat: External Ant Command','\0',9),(11764,'Fortify 360 Insider Threat: Password Bypass','Fortify 360 Insider Threat: Password Bypass','\0',9),(11765,'Fortify 360 Insider Threat: Static Config File SQL Query','Fortify 360 Insider Threat: Static Config File SQL Query','\0',9),(11766,'Fortify 360 Insider Threat: Static SQL Query','Fortify 360 Insider Threat: Static SQL Query','\0',9),(11767,'Fortify 360 Insider Threat: Suspicious String','Fortify 360 Insider Threat: Suspicious String','\0',9),(11768,'Fortify 360 Insider Threat: Time Bomb','Fortify 360 Insider Threat: Time Bomb','\0',9),(11769,'Fortify 360 Insider Threat: Transaction Disruption','Fortify 360 Insider Threat: Transaction Disruption','\0',9),(11770,'Fortify 360 OGNL Expression Injection: Struts 2','Fortify 360 OGNL Expression Injection: Struts 2','\0',9),(11771,'Fortify 360 Struts Misconfiguration: Invalid Path','Fortify 360 Struts Misconfiguration: Invalid Path','\0',9),(11772,'Fortify 360 Struts Misconfiguration: Missing Forward Name','Fortify 360 Struts Misconfiguration: Missing Forward Name','\0',9),(11773,'Fortify 360 Struts: Unused Action Form','Fortify 360 Struts: Unused Action Form','\0',9),(11774,'Fortify 360 System Information Leak: Internal','Fortify 360 System Information Leak: Internal','\0',9),(11775,'Fortify 360 System Information Leak: Struts 2','Fortify 360 System Information Leak: Struts 2','\0',9),(11776,'System Information Leak: Internal','System Information Leak: Internal','\0',9),(11777,'Access Specifier Manipulation','Access Specifier Manipulation','\0',9),(11778,'Database Bad Practices: Use of Restricted Accounts','Database Bad Practices: Use of Restricted Accounts','\0',9),(11779,'Code Correctness: Comparison of Boxed Primitive Types','Code Correctness: Comparison of Boxed Primitive Types','\0',9),(11780,'J2EE Bad Practices: JVM Termination','J2EE Bad Practices: JVM Termination','\0',9),(11781,'Portability Flaw: Locale Dependent Comparison','Portability Flaw: Locale Dependent Comparison','\0',9),(11782,'Denial of Service: Regular Expression','Denial of Service: Regular Expression','\0',9),(11783,'Code Correctness: Constructor Invokes Overridable Function','Code Correctness: Constructor Invokes Overridable Function','\0',9),(11784,'Mass Assignment: Insecure Binder Configuration','Mass Assignment: Insecure Binder Configuration','\0',9),(11785,'Code Correctness: clone() Invokes Overridable Function','Code Correctness: clone() Invokes Overridable Function','\0',9),(11786,'Code Correctness: Invalid Call to Object.equals()','Code Correctness: Invalid Call to Object.equals()','\0',9),(11787,'arrayIndexOutOfBounds','Array \'array[2]\' accessed at index 2 which is out of bounds.','\0',28),(11788,'arrayIndexThenCheck','Array index \'index\' is used before limits check.','\0',28),(11789,'assignBoolToPointer','Boolean value assigned to pointer.','\0',28),(11790,'assignIfError','Mismatching assignment and comparison comparison \'\' is always false.','\0',28),(11791,'AssignmentAddressToInteger','Assigning a pointer to an integer is not portable.','\0',28),(11792,'AssignmentIntegerToAddress','Assigning an integer to a pointer is not portable.','\0',28),(11793,'bufferAccessOutOfBounds','Buffer is accessed out of bounds: buffer','\0',28),(11794,'CastAddressToIntegerAtReturn','Returning an address value in a function with integer return type is not portable.','\0',28),(11795,'CastIntegerToAddressAtReturn','Returning an integer in a function with pointer return type is not portable.','\0',28),(11796,'clarifyCalculation','Clarify calculation precedence for \'+\' and \'?\'.','\0',28),(11797,'clarifyCondition','Suspicious condition (assignment + comparison); Clarify expression with parentheses.','\0',28),(11798,'clarifyStatement','Ineffective statement similar to \'*A++;\'. Did you intend to write \'(*A)++;\'?','\0',28),(11799,'comparisonError','Expression \'(X & 0x6) == 0x1\' is always false.','\0',28),(11800,'comparisonFunctionIsAlwaysTrueOrFalse','Comparison of two identical variables with isless(varNamevarName) evaluates always to false.','\0',28),(11801,'cstyleCast','C-style pointer casting','\0',28),(11802,'deadpointer','Dead pointer usage. Pointer \'pointer\' is dead if it has been assigned \'&x\' at line 0.','\0',28),(11803,'deallocDealloc','Deallocating a deallocated pointer: varname','\0',28),(11804,'doubleFree','Memory pointed to by \'varname\' is freed twice.','\0',28),(11805,'duplicateExpression','Same expression on both sides of \'&&\'.','\0',28),(11806,'ignoredReturnValue','Return value of function malloc() is not used.','\0',28),(11807,'incorrectStringBooleanError','\"Conversion of string literal \"\"Hello World\"\" to bool always evaluates to true.\"','\0',28),(11808,'invalidPointerCast','Casting between float* and double* which have an incompatible binary data representation.','\0',28),(11809,'invalidPrintfArgType_float','%f in format string (no. 1) requires \'double\' but the argument type is Unknown.','\0',28),(11810,'invalidPrintfArgType_int','%X in format string (no. 1) requires \'unsigned int\' but the argument type is Unknown.','\0',28),(11811,'invalidPrintfArgType_n','%n in format string (no. 1) requires \'int *\' but the argument type is Unknown.','\0',28),(11812,'invalidPrintfArgType_p','%p in format string (no. 1) requires an address but the argument type is Unknown.','\0',28),(11813,'invalidPrintfArgType_s','%s in format string (no. 1) requires \'char *\' but the argument type is Unknown.','\0',28),(11814,'invalidPrintfArgType_sint','%i in format string (no. 1) requires \'int\' but the argument type is Unknown.','\0',28),(11815,'invalidPrintfArgType_uint','%u in format string (no. 1) requires \'unsigned int\' but the argument type is Unknown.','\0',28),(11816,'invalidScanfArgType_float','%f in format string (no. 1) requires \'float *\' but the argument type is Unknown.','\0',28),(11817,'invalidScanfArgType_int','%d in format string (no. 1) requires \'int *\' but the argument type is Unknown.','\0',28),(11818,'invalidScanfArgType_s','%s in format string (no. 1) requires a \'char *\' but the argument type is Unknown.','\0',28),(11819,'leakNoVarFunctionCall','Allocation with funcName funcName doesn\'t release it.','\0',28),(11820,'leakReturnValNotUsed','Return value of allocation function funcName is not used.','\0',28),(11821,'memleak','Memory leak: varname','\0',28),(11822,'memleakOnRealloc','Common realloc mistake: \'varname\' nulled but not freed upon failure','\0',28),(11823,'memsetClass','Using \'memfunc\' on class that contains a classname.','\0',28),(11824,'memsetClassFloat','Using memset() on class which contains a floating point number.','\0',28),(11825,'memsetClassReference','Using \'memfunc\' on class that contains a reference.','\0',28),(11826,'noConstructor','The class \'classname\' does not have a constructor.','\0',28),(11827,'noCopyConstructor','\'class class\' does not have a copy constructor which is recommended since the class contains a pointer to allocated memory.','\0',28),(11828,'nullPointer','Possible null pointer dereference: pointer','\0',28),(11829,'operatorEqVarError','Member variable \'classname::\' is not assigned a value in \'classname::operator=\'.','\0',28),(11830,'oppositeInnerCondition','Opposite conditions in nested \'if\' blocks lead to a dead code block.','\0',28),(11831,'postfixOperator','Prefer prefix ++/-- operators for non-primitive types.','\0',28),(11832,'publicAllocationError','Possible leak in public function. The pointer \'varname\' is not deallocated before it is allocated.','\0',28),(11833,'redundantAssignment','Variable \'var\' is reassigned a value before the old one has been used.','\0',28),(11834,'redundantAssignInSwitch','Variable \'var\' is reassigned a value before the old one has been used. \'break;\' missing?','\0',28),(11835,'redundantCopy','Buffer \'var\' is being written before its old content has been used.','\0',28),(11836,'redundantCopyInSwitch','Buffer \'var\' is being written before its old content has been used. \'break;\' missing?','\0',28),(11837,'resourceLeak','Resource leak: varname','\0',28),(11838,'StlMissingComparison','Missing bounds check for extra iterator increment in loop.','\0',28),(11839,'stlSize','Possible inefficient checking for \'list\' emptiness.','\0',28),(11840,'stringCompare','Comparison of identical string variables.','\0',28),(11841,'switchCaseFallThrough','Switch falls through case without comment. \'break;\' missing?','\0',28),(11842,'thisSubtraction','Suspicious pointer subtraction. Did you intend to write \'->\'?','\0',28),(11843,'uninitMemberVar','Member variable \'classname::varname\' is not initialized in the constructor.','\0',28),(11844,'uninitvar','Uninitialized variable: varname','\0',28),(11845,'unreachableCode','Statements following return break continue goto or throw will never be executed.','\0',28),(11846,'unreadVariable','Variable \'varname\' is assigned a value that is never used.','\0',28),(11847,'unusedAllocatedMemory','Variable \'varname\' is allocated memory that is never used.','\0',28),(11848,'unusedFunction','The function \'funcName\' is never used.','\0',28),(11849,'unusedPrivateFunction','Unused private function: \'classname::funcname\'','\0',28),(11850,'unusedScopedObject','Instance of \'varname\' object is destroyed immediately.','\0',28),(11851,'unusedStructMember','struct or union member \'structname::variable\' is never used.','\0',28),(11852,'unusedVariable','Unused variable: varname','\0',28),(11853,'useInitializationList','Variable \'variable\' is assigned in constructor body. Consider performing initialization in initialization list.','\0',28),(11854,'uselessAssignmentArg','Assignment of function parameter has no effect outside the function.','\0',28),(11855,'uselessAssignmentPtrArg','Assignment of function parameter has no effect outside the function. Did you forget dereferencing it?','\0',28),(11856,'uselessCallsRemove','Return value of std::remove() ignored. Elements remain in container.','\0',28),(11857,'variableScope','The scope of the variable \'varname\' can be reduced.','\0',28),(11858,'writeOutsideBufferSize','Writing 1 bytes outside buffer size.','\0',28),(11859,'zerodiv','Division by zero.','\0',28),(11860,'zerodivcond','Either the condition \'\' is useless or there is division by zero at line 0.','\0',28),(11861,'PT_ABSOLUTE_PATH_TRAVERSAL','PT: Absolute path traversal in servlet','\0',8),(11862,'PT_RELATIVE_PATH_TRAVERSAL','PT: Relative path traversal in servlet','\0',8),(11863,'5243152','Open redirection (DOM-based)','\0',3),(11864,'1051392','File path manipulation','\0',3),(11865,'1051648','PHP code injection','\0',3),(11866,'1051904','Server-side JavaScript code injection','\0',3),(11867,'1052160','Perl code injection','\0',3),(11868,'1052416','Ruby code injection','\0',3),(11869,'1052672','Unidentified code injection','\0',3),(11870,'2097936','Cross-site scripting (DOM-based)','\0',3),(11871,'2097952','JavaScript injection (DOM-based)','\0',3),(11872,'2097968','Client-side SQL injection (DOM-based)','\0',3),(11873,'2097984','WebSocket hijacking (DOM-based)','\0',3),(11874,'2098000','Local file path manipulation (DOM-based)','\0',3),(11875,'2098016','Client-side XPath injection (DOM-based)','\0',3),(11876,'2098032','Client-side JSON injection (DOM-based)','\0',3),(11877,'2098944','Cross-site request forgery','\0',3),(11878,'4196608','Serialized object in HTTP message','\0',3),(11879,'5245696','Cookie manipulation (DOM-based)','\0',3),(11880,'5245952','Ajax request header manipulation (DOM-based)','\0',3),(11881,'5246208','Denial of service (DOM-based)','\0',3),(11882,'5246464','HTML5 web message manipulation (DOM-based)','\0',3),(11883,'5246720','HTML5 storage manipulation (DOM-based)','\0',3),(11884,'5246976','Link manipulation (DOM-based)','\0',3),(11885,'5247232','Document domain manipulation (DOM-based)','\0',3),(11886,'5247488','DOM data manipulation (DOM-based)','\0',3),(11887,'1052432','Python code injection','\0',3),(11888,'1052928','SSI injection','\0',3),(11889,'2097960','Path-relative style sheet import','\0',3),(11890,'3146240','External service interaction (DNS)','\0',3),(11891,'3146256','External service interaction (HTTP)','\0',3),(11892,'4196864','Duplicate cookies set','\0',3),(11893,'6292816','Private key disclosed','\0',3),(11894,'Cross-Site Scripting','1 Cross-Site Scripting','\0',30),(11895,'Denial of Service (DOS) in DO Loop','2 Denial of Service (DOS) in DO Loop','\0',30),(11896,'Hard-coded User Name (sy-uname)','4 Hard-coded User Name (sy-uname)','\0',30),(11897,'All Occurrences of sy-uname','5 All Occurrences of sy-uname','\0',30),(11898,'Dangerous ABAP Commands','8 Dangerous ABAP Commands','\0',30),(11899,'Direct Database Modifications','9 Direct Database Modifications','\0',30),(11900,'Missing AUTHORITY-CHECK in RFC-Enabled Functions','14 Missing AUTHORITY-CHECK in RFC-Enabled Functions','\0',30),(11901,'Missing AUTHORITY-CHECK before CALL TRANSACTION','15 Missing AUTHORITY-CHECK before CALL TRANSACTION','\0',30),(11902,'OSQL Injection (Write Access)','18 OSQL Injection (Write Access)','\0',30),(11903,'Usage of Regular Expression','20 Usage of Regular Expression','\0',30),(11904,'Forceful Querying (Write Access)','21 Forceful Querying (Write Access)','\0',30),(11905,'Generic ABAP Module Calls','22 Generic ABAP Module Calls','\0',30),(11906,'Directory Traversal (Write Access)','24 Directory Traversal (Write Access)','\0',30),(11907,'Suspicious Filter Usage (replace)','25 Suspicious Filter Usage (replace)','\0',30),(11908,'Exposed System Calls','26 Exposed System Calls','\0',30),(11909,'Generic Variable Readers','28 Generic Variable Readers','\0',30),(11910,'Disclosure of critical DB Content (Customized)','29 Disclosure of critical DB Content (Customized)','\0',30),(11911,'Method Calls in Inactive Assertions','30 Method Calls in Inactive Assertions','\0',30),(11912,'HTTP Response Tampering','31 HTTP Response Tampering','\0',30),(11913,'Alias Authorization in SUBMIT report','32 Alias Authorization in SUBMIT report','\0',30),(11914,'ABAP Command Injection (report)','34 ABAP Command Injection (report)','\0',30),(11915,'ABAP Command Injection (program)','35 ABAP Command Injection (program)','\0',30),(11916,'Exposed Kernel Calls','36 Exposed Kernel Calls','\0',30),(11917,'Unmanaged SQL','39 Unmanaged SQL','\0',30),(11918,'OS Command Execution (Parameter)','41 OS Command Execution (Parameter)','\0',30),(11919,'Phishing','43 Phishing','\0',30),(11920,'Hard-coded SAP System ID Checks (sy-sysid)','45 Hard-coded SAP System ID Checks (sy-sysid)','\0',30),(11921,'Cross-Client Access to Business Data','46 Cross-Client Access to Business Data','\0',30),(11922,'Generic RFC Destinations','48 Generic RFC Destinations','\0',30),(11923,'File Upload (SAP GUI)','49 File Upload (SAP GUI)','\0',30),(11924,'File Download (SAP GUI)','50 File Download (SAP GUI)','\0',30),(11925,'OS Command Execution (Client OS)','52 OS Command Execution (Client OS)','\0',30),(11926,'Hard-coded SAP Client Checks (sy-mandt)','53 Hard-coded SAP Client Checks (sy-mandt)','\0',30),(11927,'Hard-coded System Date Checks (sy-datum)','56 Hard-coded System Date Checks (sy-datum)','\0',30),(11928,'Directory Traversal (Read Access)','59 Directory Traversal (Read Access)','\0',30),(11929,'OSQL Injection (Read Access)','60 OSQL Injection (Read Access)','\0',30),(11930,'SQL Injection (Native)','71 SQL Injection (Native)','\0',30),(11931,'Missing AUTHORITY-CHECK in Reports','80 Missing AUTHORITY-CHECK in Reports','\0',30),(11932,'Hidden ABAP Code','82 Hidden ABAP Code','\0',30),(11933,'Outgoing FTP Connections','84 Outgoing FTP Connections','\0',30),(11934,'Forceful Querying (Read Access)','85 Forceful Querying (Read Access)','\0',30),(11935,'Generic Table Query (Read Access)','87 Generic Table Query (Read Access)','\0',30),(11936,'Generic Table Query (Write Access)','88 Generic Table Query (Write Access)','\0',30),(11937,'Alias Authorization in AUTHORITY-CHECK','94 Alias Authorization in AUTHORITY-CHECK','\0',30),(11938,'Generic Database Connections','100 Generic Database Connections','\0',30),(11939,'Generic Transformations','101 Generic Transformations','\0',30),(11940,'Broken AUTHORITY-CHECKs','103 Broken AUTHORITY-CHECKs','\0',30),(11941,'Generic DELETE REPORT','109 Generic DELETE REPORT','\0',30),(11942,'Generic READ REPORT','110 Generic READ REPORT','\0',30),(11943,'Hard-coded Passwords','111 Hard-coded Passwords','\0',30),(11944,'Denial of Service (DOS) in TRANSFER','112 Denial of Service (DOS) in TRANSFER','\0',30),(11945,'Dummy AUTHORITY-CHECKs','113 Dummy AUTHORITY-CHECKs','\0',30),(11946,'AUTHORITY-CHECKs with Dummy Field \'ACTVT\'','118 AUTHORITY-CHECKs with Dummy Field \'ACTVT\'','\0',30),(11947,'Privileging AUTHORITY-CHECKs (ACTVT)','120 Privileging AUTHORITY-CHECKs (ACTVT)','\0',30),(11948,'Manipulation of SAP Client (sy-mandt)','123 Manipulation of SAP Client (sy-mandt)','\0',30),(11949,'Insufficient Authorization Functionality','128 Insufficient Authorization Functionality','\0',30),(11950,'SQL Injection (CALL \'C_DB_FUNCTION\')','131 SQL Injection (CALL \'C_DB_FUNCTION\')','\0',30),(11951,'OS Command Injection (RFC_REMOTE_PIPE)','132 OS Command Injection (RFC_REMOTE_PIPE)','\0',30),(11952,'OS Command Injection (RFC_REMOTE_EXEC)','133 OS Command Injection (RFC_REMOTE_EXEC)','\0',30),(11953,'Directory Traversal (RFC_REMOTE_FILE)','134 Directory Traversal (RFC_REMOTE_FILE)','\0',30),(11954,'Disclosure of Source Code','135 Disclosure of Source Code','\0',30),(11955,'OS Command Injection (CALL \'SYSTEM\')','136 OS Command Injection (CALL \'SYSTEM\')','\0',30),(11956,'Directory Traversal (CALL \'ALERTS\' / Read Access)','137 Directory Traversal (CALL \'ALERTS\' / Read Access)','\0',30),(11957,'OS Command Injection (CALL \'ThWpInfo\')','138 OS Command Injection (CALL \'ThWpInfo\')','\0',30),(11958,'Directory Traversal (CALL \'C_RSTRB_READ_BUFFERED\')','139 Directory Traversal (CALL \'C_RSTRB_READ_BUFFERED\')','\0',30),(11959,'Generic Table Query (CALL \'C_MOD_TABLE\' / Write Access)','140 Generic Table Query (CALL \'C_MOD_TABLE\' / Write Access)','\0',30),(11960,'Generic Table Query (CALL \'C_GET_TABLE\' / Read Access)','141 Generic Table Query (CALL \'C_GET_TABLE\' / Read Access)','\0',30),(11961,'SQL Injection (CALL \'C_DB_EXECUTE\')','142 SQL Injection (CALL \'C_DB_EXECUTE\')','\0',30),(11962,'Usage of DB Tables without Authorization Groups','207 Usage of DB Tables without Authorization Groups','\0',30),(11963,'Hard-coded Domain (User Name)','219 Hard-coded Domain (User Name)','\0',30),(11964,'Control Flow based on SPA/GPA Parameter','220 Control Flow based on SPA/GPA Parameter','\0',30),(11965,'Disclosure of Directory Contents (CALL \'C_DIR_READ_START\')','222 Disclosure of Directory Contents (CALL \'C_DIR_READ_START\')','\0',30),(11966,'Usage of dangerous Kernel Call (\'C_REMOVE\')','226 Usage of dangerous Kernel Call (\'C_REMOVE\')','\0',30),(11967,'AUTHORITY-CHECKs with Dummy Field \'AUTHC\'','230 AUTHORITY-CHECKs with Dummy Field \'AUTHC\'','\0',30),(11968,'AUTHORITY-CHECKs with Dummy Field \'CO_ACTION\'','231 AUTHORITY-CHECKs with Dummy Field \'CO_ACTION\'','\0',30),(11969,'Privileging AUTHORITY-CHECKs (AUTHC)','232 Privileging AUTHORITY-CHECKs (AUTHC)','\0',30),(11970,'Privileging AUTHORITY-CHECKs (CO_ACTION)','233 Privileging AUTHORITY-CHECKs (CO_ACTION)','\0',30),(11971,'Usage of pseudo-cryptographic Algorithms','234 Usage of pseudo-cryptographic Algorithms','\0',30),(11972,'Deactivation of Table-Change Logging','235 Deactivation of Table-Change Logging','\0',30),(11973,'Cross-Client Data Transfer','237 Cross-Client Data Transfer','\0',30),(11974,'OS Command Injection (OPEN DATASET; File Name)','239 OS Command Injection (OPEN DATASET; File Name)','\0',30),(11975,'Hard-coded Alias Authorization in AUTHORITY-CHECK','240 Hard-coded Alias Authorization in AUTHORITY-CHECK','\0',30),(11976,'SQL Injection on In-Memory Tables (Read Access)','241 SQL Injection on In-Memory Tables (Read Access)','\0',30),(11977,'SQL Injection on In-Memory Tables (Write Access)','242 SQL Injection on In-Memory Tables (Write Access)','\0',30),(11978,'Execution of Stored Procedures (CALL \'C_DB_FUNCTION\')','246 Execution of Stored Procedures (CALL \'C_DB_FUNCTION\')','\0',30),(11979,'OS Command Execution (Command Name)','247 OS Command Execution (Command Name)','\0',30),(11980,'Disclosure of critical Variable Content (Customized)','251 Disclosure of critical Variable Content (Customized)','\0',30),(11981,'Potentially wrong Usage of DUMMY in AUTHORITY-CHECK','252 Potentially wrong Usage of DUMMY in AUTHORITY-CHECK','\0',30),(11982,'Hard-coded OS Commands','253 Hard-coded OS Commands','\0',30),(11983,'AUTHORITY-CHECKs with an incomplete ID List','258 AUTHORITY-CHECKs with an incomplete ID List','\0',30),(11984,'All Kernel Calls','261 All Kernel Calls','\0',30),(11985,'All System Calls','272 All System Calls','\0',30),(11986,'Hidden OK-Codes','274 Hidden OK-Codes','\0',30),(11987,'Cross-Client Access to Data Clusters (Database)','275 Cross-Client Access to Data Clusters (Database)','\0',30),(11988,'Cross-Client Access to Data Clusters (Shared Memory)','276 Cross-Client Access to Data Clusters (Shared Memory)','\0',30),(11989,'Cross-Client Access to Data Clusters (Shared Buffer)','277 Cross-Client Access to Data Clusters (Shared Buffer)','\0',30),(11990,'AUTHORITY-CHECK \'S_TCODE\' with Dummy Field \'TCD\'','279 AUTHORITY-CHECK \'S_TCODE\' with Dummy Field \'TCD\'','\0',30),(11991,'Privileging AUTHORITY-CHECKs (S_TCODE)','280 Privileging AUTHORITY-CHECKs (S_TCODE)','\0',30),(11992,'Insecure Usage of Security Functionality (Unchecked classic Exception)','281 Insecure Usage of Security Functionality (Unchecked classic Exception)','\0',30),(11993,'Insecure Usage of Security Functionality (Ignored classic Exception)','282 Insecure Usage of Security Functionality (Ignored classic Exception)','\0',30),(11994,'API:Argument with \'nonnull\' attribute passed null','API:Argument with \'nonnull\' attribute passed null','\0',31),(11995,'API:Sum of expressions causes overflow','API:Sum of expressions causes overflow','\0',31),(11996,'API Misuse (Apple):Improper use of \'dispatch_once\'','API Misuse (Apple):Improper use of \'dispatch_once\'','\0',31),(11997,'API Misuse (Apple):Improper use of SecKeychain API','API Misuse (Apple):Improper use of SecKeychain API','\0',31),(11998,'API Upgrade (Apple):Use -drain instead of -release','API Upgrade (Apple):Use -drain instead of -release','\0',31),(11999,'C String API:Anti-pattern in the argument','C String API:Anti-pattern in the argument','\0',31),(12000,'Coding conventions (Apple):Bad return type when passing CFErrorRef*','Coding conventions (Apple):Bad return type when passing CFErrorRef*','\0',31),(12001,'Coding conventions (Apple):Bad return type when passing NSError**','Coding conventions (Apple):Bad return type when passing NSError**','\0',31),(12002,'Coding conventions (Apple):CFErrorRef* null dereference','Coding conventions (Apple):CFErrorRef* null dereference','\0',31),(12003,'Coding conventions (Apple):NSError** null dereference','Coding conventions (Apple):NSError** null dereference','\0',31),(12004,'Core Foundation/Objective-C:CFArray API','Core Foundation/Objective-C:CFArray API','\0',31),(12005,'Core Foundation/Objective-C:Missing call to superclass','Core Foundation/Objective-C:Missing call to superclass','\0',31),(12006,'Cplusplus:Call pure virtual function during construction or Destruction','Cplusplus:Call pure virtual function during construction or Destruction','\0',31),(12007,'Cplusplus:Call virtual function during construction or Destruction','Cplusplus:Call virtual function during construction or Destruction','\0',31),(12008,'Dead code:Unreachable code','Dead code:Unreachable code','\0',31),(12009,'Dead store:Dead assignment','Dead store:Dead assignment','\0',31),(12010,'Dead store:Dead increment','Dead store:Dead increment','\0',31),(12011,'Dead store:Dead initialization','Dead store:Dead initialization','\0',31),(12012,'LLVM Conventions:AST node allocates heap memory','LLVM Conventions:AST node allocates heap memory','\0',31),(12013,'LLVM Conventions:StringRef should not be bound to temporary std::string that it outlives','LLVM Conventions:StringRef should not be bound to temporary std::string that it outlives','\0',31),(12014,'Lock checker:Destroy invalid lock','Lock checker:Destroy invalid lock','\0',31),(12015,'Lock checker:Double locking','Lock checker:Double locking','\0',31),(12016,'Lock checker:Double unlocking','Lock checker:Double unlocking','\0',31),(12017,'Lock checker:Init invalid lock','Lock checker:Init invalid lock','\0',31),(12018,'Lock checker:Lock order reversal','Lock checker:Lock order reversal','\0',31),(12019,'Lock checker:Use destroyed lock','Lock checker:Use destroyed lock','\0',31),(12020,'Logic error:Array subscript is undefined','Logic error:Array subscript is undefined','\0',31),(12021,'Logic error:Assigned value is garbage or undefined','Logic error:Assigned value is garbage or undefined','\0',31),(12022,'Logic error:Assignment of a non-Boolean value','Logic error:Assignment of a non-Boolean value','\0',31),(12023,'Logic error:Branch condition evaluates to a garbage value','Logic error:Branch condition evaluates to a garbage value','\0',31),(12024,'Logic error:Called C++ object pointer is null','Logic error:Called C++ object pointer is null','\0',31),(12025,'Logic error:Called function pointer is an uninitalized pointer value','Logic error:Called function pointer is an uninitalized pointer value','\0',31),(12026,'Logic error:Called function pointer is null (null dereference)','Logic error:Called function pointer is null (null dereference)','\0',31),(12027,'Logic error:Compare of identical expressions','Logic error:Compare of identical expressions','\0',31),(12028,'Logic error:Dangerous pointer arithmetic','Logic error:Dangerous pointer arithmetic','\0',31),(12029,'Logic error:Dangerous variable-length array (VLA) declaration','Logic error:Dangerous variable-length array (VLA) declaration','\0',31),(12030,'Logic error:Dereference of null pointer','Logic error:Dereference of null pointer','\0',31),(12031,'Logic error:Dereference of undefined pointer value','Logic error:Dereference of undefined pointer value','\0',31),(12032,'Logic error:Division by zero','Logic error:Division by zero','\0',31),(12033,'Logic error:Double fclose','Logic error:Double fclose','\0',31),(12034,'Logic error:Function call with too few arguments','Logic error:Function call with too few arguments','\0',31),(12035,'Logic error:Garbage return value','Logic error:Garbage return value','\0',31),(12036,'Logic error:Identical branches','Logic error:Identical branches','\0',31),(12037,'Logic error:Identical conditions','Logic error:Identical conditions','\0',31),(12038,'Logic error:Identical expressions in conditional expression','Logic error:Identical expressions in conditional expression','\0',31),(12039,'Logic error:Illegal whence argument','Logic error:Illegal whence argument','\0',31),(12040,'Logic error:Nil value used as mutex for @synchronized() (no synchronization will occur)','Logic error:Nil value used as mutex for @synchronized() (no synchronization will occur)','\0',31),(12041,'Logic error:NULL stream pointer','Logic error:NULL stream pointer','\0',31),(12042,'Logic error:Out of bound memory access ','Logic error:Out of bound memory access ','\0',31),(12043,'Logic error:Out of bound memory access (access exceeds upper limit of memory block)','Logic error:Out of bound memory access (access exceeds upper limit of memory block)','\0',31),(12044,'Logic error:Out of bound memory access (accessed memory precedes memory block)','Logic error:Out of bound memory access (accessed memory precedes memory block)','\0',31),(12045,'Logic error:Out of bound memory access (index is tainted)','Logic error:Out of bound memory access (index is tainted)','\0',31),(12046,'Logic error:Out-of-bound access','Logic error:Out-of-bound access','\0',31),(12047,'Logic error:Out-of-bound array access','Logic error:Out-of-bound array access','\0',31),(12048,'Logic error:Pointer subtraction','Logic error:Pointer subtraction','\0',31),(12049,'Logic error:Potential unintended use of sizeof() on pointer type','Logic error:Potential unintended use of sizeof() on pointer type','\0',31),(12050,'Logic error:Property access on an uninitialized object pointer','Logic error:Property access on an uninitialized object pointer','\0',31),(12051,'Logic error:Receiver in message expression is an uninitialized value','Logic error:Receiver in message expression is an uninitialized value','\0',31),(12052,'Logic error:Receiver in message expression is \'nil\'','Logic error:Receiver in message expression is \'nil\'','\0',31),(12053,'Logic error:Resource Leak','Logic error:Resource Leak','\0',31),(12054,'Logic error:Result of operation is garbage or undefined','Logic error:Result of operation is garbage or undefined','\0',31),(12055,'Logic error:Return of address to stack-allocated memory','Logic error:Return of address to stack-allocated memory','\0',31),(12056,'Logic error:Return of pointer value outside of expected range','Logic error:Return of pointer value outside of expected range','\0',31),(12057,'Logic error:Returning null reference','Logic error:Returning null reference','\0',31),(12058,'Logic error:Stack address stored into global variable','Logic error:Stack address stored into global variable','\0',31),(12059,'Logic error:Subscript access on an uninitialized object pointer','Logic error:Subscript access on an uninitialized object pointer','\0',31),(12060,'Logic error:Uninitialized argument value','Logic error:Uninitialized argument value','\0',31),(12061,'Logic error:Uninitialized value used as mutex for @synchronized','Logic error:Uninitialized value used as mutex for @synchronized','\0',31),(12062,'Logic error:uninitialized variable captured by block','Logic error:uninitialized variable captured by block','\0',31),(12063,'Logic error:Use fixed address','Logic error:Use fixed address','\0',31),(12064,'Logic error:Use of identical expressions','Logic error:Use of identical expressions','\0',31),(12065,'Memory (Core Foundation/Objective-C):Direct assignment to an instance variable backing a property; use the setter instead','Memory (Core Foundation/Objective-C):Direct assignment to an instance variable backing a property; use the setter instead','\0',31),(12066,'Memory (Core Foundation/Objective-C):Incompatible instance method return type','Memory (Core Foundation/Objective-C):Incompatible instance method return type','\0',31),(12067,'Memory (Core Foundation/Objective-C):Incomplete invalidation','Memory (Core Foundation/Objective-C):Incomplete invalidation','\0',31),(12068,'Memory (Core Foundation/Objective-C):Leak','Memory (Core Foundation/Objective-C):Leak','\0',31),(12069,'Memory (Core Foundation/Objective-C):Leak of returned object','Memory (Core Foundation/Objective-C):Leak of returned object','\0',31),(12070,'Memory (Core Foundation/Objective-C):missing -dealloc','Memory (Core Foundation/Objective-C):missing -dealloc','\0',31),(12071,'Memory Error:Bad deallocator','Memory Error:Bad deallocator','\0',31),(12072,'Memory Error:Bad free','Memory Error:Bad free','\0',31),(12073,'Memory Error:Double delete','Memory Error:Double delete','\0',31),(12074,'Memory Error:Double free','Memory Error:Double free','\0',31),(12075,'Memory Error:Memory leak','Memory Error:Memory leak','\0',31),(12076,'Memory Error:Offset free','Memory Error:Offset free','\0',31),(12077,'Memory Error:Use-after-free','Memory Error:Use-after-free','\0',31),(12078,'Optimization:Unused instance variable','Optimization:Unused instance variable','\0',31),(12079,'Security:Floating point variable used as loop counter','Security:Floating point variable used as loop counter','\0',31),(12080,'Security:Insecure temporary file creation','Security:Insecure temporary file creation','\0',31),(12081,'Security:Potential buffer overflow in call to \'getpw\'','Security:Potential buffer overflow in call to \'getpw\'','\0',31),(12082,'Security:Potential buffer overflow in call to \'gets\'','Security:Potential buffer overflow in call to \'gets\'','\0',31),(12083,'Security:Potential insecure implementation-specific behavior in call \'vfork\'','Security:Potential insecure implementation-specific behavior in call \'vfork\'','\0',31),(12084,'Security:Potential insecure memory buffer bounds restriction in call \'strcat\'','Security:Potential insecure memory buffer bounds restriction in call \'strcat\'','\0',31),(12085,'Security:Potential insecure memory buffer bounds restriction in call \'strcpy\'','Security:Potential insecure memory buffer bounds restriction in call \'strcpy\'','\0',31),(12086,'Security:Potential insecure temporary file in call \'mktemp\'','Security:Potential insecure temporary file in call \'mktemp\'','\0',31),(12087,'Security:\'random\' is not a secure random number generator','Security:\'random\' is not a secure random number generator','\0',31),(12088,'Unix API:Allocator sizeof operand mismatch','Unix API:Allocator sizeof operand mismatch','\0',31),(12089,'Unix API:Argument is not a null-terminated string.','Unix API:Argument is not a null-terminated string.','\0',31),(12090,'Unix API:Improper arguments','Unix API:Improper arguments','\0',31),(12091,'Unix API:Improper use of \'open\'','Unix API:Improper use of \'open\'','\0',31),(12092,'Unix API:Improper use of \'pthread_once\'','Unix API:Improper use of \'pthread_once\'','\0',31),(12093,'Unix API:malloc() size overflow','Unix API:malloc() size overflow','\0',31),(12094,'Unix API:Undefined allocation of 0 bytes (CERT MEM04-C; CWE-131)','Unix API:Undefined allocation of 0 bytes (CERT MEM04-C; CWE-131)','\0',31),(12095,'Unix API:Null pointer argument in call to byte string function','Unix API:Null pointer argument in call to byte string function','\0',31),(12096,'Unix Stream API Error:Double fclose','Unix Stream API Error:Double fclose','\0',31),(12097,'Unix Stream API Error:Resource Leak','Unix Stream API Error:Resource Leak','\0',31),(12098,'Untrusted Data:Use of Untrusted Data','Untrusted Data:Use of Untrusted Data','\0',31),(12099,'150052','Password is present in HTTP traffic unrelated to the login page','\0',17),(12100,'150053','Login Form Is Not Submitted Via HTTPS ','\0',17),(12101,'150056','SQL Error Message','\0',17),(12102,'150059','Reference to Windows file path is present in HTML','\0',17),(12103,'150068','Session ID in URL','\0',17),(12104,'150072','Form With Potential Sensitive Content Submits Over HTTP','\0',17),(12105,'150082','Protection against Clickjacking vulnerability','\0',17),(12106,'150090','Reflected Cross-Site Scripting (XSS) Vulnerabilities in Web Service Call','\0',17),(12107,'150092','Browser-Specific Cross-Site Scripting in Web Service Call','\0',17),(12108,'150093','SQL Injection in Web Service call','\0',17),(12109,'150094','Selenium Web Application Authentication Was Successful','\0',17),(12110,'150095','Selenium Web Application Authentication Failed','\0',17),(12111,'150097','HTTP Response Indicates Scan May Be Blocked','\0',17),(12112,'150098','Web Service Response Error','\0',17),(12113,'150099','Cookies Issued Without User Consent','\0',17),(12114,'150100','Selenium Diagnostics','\0',17),(12115,'150101','Third-party Cookies Collected','\0',17),(12116,'150103','Secure Cookie set by Insecure Connection ','\0',17),(12117,'150104','Form Contains Email Address Field','\0',17),(12118,'150105','Form Contains Postal Address Field','\0',17),(12119,'150106','Content of crossdomain.xml','\0',17),(12120,'150107','Very permissive access directive in crossdomain.xml','\0',17),(12121,'150108','Secure attribute set to false  in crossdomain.xml','\0',17),(12122,'150109','Very permissive list of ports  in crossdomain.xml','\0',17),(12123,'150111','HTTP Service Detection Failure','\0',17),(12124,'150112','Sensitive form field has not disabled autocomplete','\0',17),(12125,'150114','Arbitrary File Upload vulnerability','\0',17),(12126,'150115','Authentication Form found','\0',17),(12127,'150116','Server Authentication Found','\0',17),(12128,'150118','Failure to Restrict Form Submission','\0',17),(12129,'150120','Session Cookie Does Not Contain The \"secure\" Attribute','\0',17),(12130,'150121','Session Cookie Does Not Contain The \"HTTPOnly\" Attribute','\0',17),(12131,'150122','Cookie Does Not Contain The \"secure\" Attribute','\0',17),(12132,'150123','Cookie Does Not Contain The \"HTTPOnly\" Attribute','\0',17),(12133,'150124','Framable Page','\0',17),(12134,'150125','File Upload Form Found','\0',17),(12135,'150127','Apache Struts ClassLoader Manipulation Security Bypass Vulnerability (S2-020 S2-021)','\0',17),(12136,'150128','Authenticated Resource Is Not Served Over HTTPS','\0',17),(12137,'150129','Insufficient Session Protection/Regeneration','\0',17),(12138,'150134','Shellshock Apache Injection','\0',17);
/*!40000 ALTER TABLE `ChannelVulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChannelVulnerabilityFilter`
--

DROP TABLE IF EXISTS `ChannelVulnerabilityFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChannelVulnerabilityFilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `channelTypeId` int(11) DEFAULT NULL,
  `channelVulnerabilityId` int(11) DEFAULT NULL,
  `genericSeverityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC8DAC931E2A500AC` (`channelVulnerabilityId`),
  KEY `FKC8DAC93147A56B56` (`channelTypeId`),
  KEY `FKC8DAC931AD661F44` (`genericSeverityId`),
  CONSTRAINT `FKC8DAC931AD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`),
  CONSTRAINT `FKC8DAC93147A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`),
  CONSTRAINT `FKC8DAC931E2A500AC` FOREIGN KEY (`channelVulnerabilityId`) REFERENCES `ChannelVulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChannelVulnerabilityFilter`
--

LOCK TABLES `ChannelVulnerabilityFilter` WRITE;
/*!40000 ALTER TABLE `ChannelVulnerabilityFilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChannelVulnerabilityFilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataFlowElement`
--

DROP TABLE IF EXISTS `DataFlowElement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataFlowElement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columnNumber` int(11) NOT NULL,
  `lineNumber` int(11) NOT NULL,
  `lineText` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `sourceFileName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `findingId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC9F887C414599E4E` (`findingId`),
  CONSTRAINT `FKC9F887C414599E4E` FOREIGN KEY (`findingId`) REFERENCES `Finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataFlowElement`
--

LOCK TABLES `DataFlowElement` WRITE;
/*!40000 ALTER TABLE `DataFlowElement` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataFlowElement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultConfigCSVExportField`
--

DROP TABLE IF EXISTS `DefaultConfigCSVExportField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultConfigCSVExportField` (
  `DefaultConfigId` int(11) NOT NULL,
  `csvExportField` int(11) DEFAULT NULL,
  `index_id` int(11) NOT NULL,
  PRIMARY KEY (`DefaultConfigId`,`index_id`),
  KEY `FK7992D363A46DDA92` (`DefaultConfigId`),
  CONSTRAINT `FK7992D363A46DDA92` FOREIGN KEY (`DefaultConfigId`) REFERENCES `DefaultConfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultConfigCSVExportField`
--

LOCK TABLES `DefaultConfigCSVExportField` WRITE;
/*!40000 ALTER TABLE `DefaultConfigCSVExportField` DISABLE KEYS */;
/*!40000 ALTER TABLE `DefaultConfigCSVExportField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultConfiguration`
--

DROP TABLE IF EXISTS `DefaultConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultConfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeDirectoryBase` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activeDirectoryCredentials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activeDirectoryCredentialsEncrypted` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activeDirectoryURL` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activeDirectoryUsername` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activeDirectoryUsernameEncrypted` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baseUrl` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelTypeUpdatedDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closeVulnWhenNoScannersReport` bit(1) DEFAULT NULL,
  `defaultRoleId` int(11) DEFAULT NULL,
  `fileUploadLocation` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `globalGroupEnabled` bit(1) DEFAULT NULL,
  `hasAddedScheduledDefectTrackerUpdates` bit(1) DEFAULT NULL,
  `hasAddedScheduledGRCToolUpdates` bit(1) DEFAULT NULL,
  `hasAddedScheduledImports` bit(1) DEFAULT NULL,
  `hasCachedData` bit(1) DEFAULT NULL,
  `hasTagCommentUpdates` bit(1) DEFAULT NULL,
  `lastScannerMappingsUpdate` datetime DEFAULT NULL,
  `proxyHost` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxyPasswordEncrypted` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxyPort` int(11) DEFAULT NULL,
  `proxyUsernameEncrypted` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessionTimeout` int(11) DEFAULT NULL,
  `shouldProxyBugzilla` bit(1) DEFAULT NULL,
  `shouldProxyContrast` bit(1) DEFAULT NULL,
  `shouldProxyHPQC` bit(1) DEFAULT NULL,
  `shouldProxyJira` bit(1) DEFAULT NULL,
  `shouldProxyQualys` bit(1) DEFAULT NULL,
  `shouldProxyTFS` bit(1) DEFAULT NULL,
  `shouldProxyTrustwaveHailstorm` bit(1) DEFAULT NULL,
  `shouldProxyVeracode` bit(1) DEFAULT NULL,
  `shouldProxyVersionOne` bit(1) DEFAULT NULL,
  `shouldProxyWhiteHat` bit(1) DEFAULT NULL,
  `shouldUseProxyCredentials` bit(1) DEFAULT NULL,
  `applicationTopLeftId` int(11) DEFAULT NULL,
  `applicationTopRightId` int(11) DEFAULT NULL,
  `dashboardBottomLeftId` int(11) DEFAULT NULL,
  `dashboardBottomRightId` int(11) DEFAULT NULL,
  `dashboardTopLeftId` int(11) DEFAULT NULL,
  `dashboardTopRightId` int(11) DEFAULT NULL,
  `teamTopLeftId` int(11) DEFAULT NULL,
  `teamTopRightId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK893FF455708BB7ED` (`teamTopLeftId`),
  KEY `FK893FF4555D608B45` (`applicationTopRightId`),
  KEY `FK893FF455E424AE94` (`dashboardBottomLeftId`),
  KEY `FK893FF455402D7A4B` (`dashboardBottomRightId`),
  KEY `FK893FF4559BBB5D96` (`dashboardTopLeftId`),
  KEY `FK893FF45540A79C12` (`teamTopRightId`),
  KEY `FK893FF455482E965A` (`applicationTopLeftId`),
  KEY `FK893FF4557B6CAB89` (`dashboardTopRightId`),
  CONSTRAINT `FK893FF4557B6CAB89` FOREIGN KEY (`dashboardTopRightId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF455402D7A4B` FOREIGN KEY (`dashboardBottomRightId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF45540A79C12` FOREIGN KEY (`teamTopRightId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF455482E965A` FOREIGN KEY (`applicationTopLeftId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF4555D608B45` FOREIGN KEY (`applicationTopRightId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF455708BB7ED` FOREIGN KEY (`teamTopLeftId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF4559BBB5D96` FOREIGN KEY (`dashboardTopLeftId`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK893FF455E424AE94` FOREIGN KEY (`dashboardBottomLeftId`) REFERENCES `Report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultConfiguration`
--

LOCK TABLES `DefaultConfiguration` WRITE;
/*!40000 ALTER TABLE `DefaultConfiguration` DISABLE KEYS */;
INSERT INTO `DefaultConfiguration` VALUES (1,'','',NULL,'','',NULL,NULL,'2015-07-29 10:56','\0',1,NULL,'','','\0','','\0','','2015-10-23 13:00:00',NULL,NULL,NULL,NULL,NULL,'\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0',3,4,9,10,1,2,5,6);
/*!40000 ALTER TABLE `DefaultConfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultDefectField`
--

DROP TABLE IF EXISTS `DefaultDefectField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultDefectField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `dynamicDefault` bit(1) NOT NULL,
  `dynamicValue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staticValue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueMapping` bit(1) NOT NULL,
  `defaultDefectProfileId` int(11) DEFAULT NULL,
  `defaultTagId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8803F128A48F7548` (`defaultDefectProfileId`),
  KEY `FK8803F128EF7E762C` (`defaultTagId`),
  CONSTRAINT `FK8803F128EF7E762C` FOREIGN KEY (`defaultTagId`) REFERENCES `DefaultTag` (`id`),
  CONSTRAINT `FK8803F128A48F7548` FOREIGN KEY (`defaultDefectProfileId`) REFERENCES `DefaultDefectProfile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultDefectField`
--

LOCK TABLES `DefaultDefectField` WRITE;
/*!40000 ALTER TABLE `DefaultDefectField` DISABLE KEYS */;
/*!40000 ALTER TABLE `DefaultDefectField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultDefectProfile`
--

DROP TABLE IF EXISTS `DefaultDefectProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultDefectProfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defectTrackerId` int(11) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB7B08657D9C91C2A` (`defectTrackerId`),
  KEY `FKB7B08657C96E039C` (`applicationId`),
  CONSTRAINT `FKB7B08657C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKB7B08657D9C91C2A` FOREIGN KEY (`defectTrackerId`) REFERENCES `DefectTracker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultDefectProfile`
--

LOCK TABLES `DefaultDefectProfile` WRITE;
/*!40000 ALTER TABLE `DefaultDefectProfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `DefaultDefectProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultTag`
--

DROP TABLE IF EXISTS `DefaultTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultTag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullClassName` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultTag`
--

LOCK TABLES `DefaultTag` WRITE;
/*!40000 ALTER TABLE `DefaultTag` DISABLE KEYS */;
INSERT INTO `DefaultTag` VALUES (1,'Evaluates the generic Threadfix name for the first vulnerability in the list','com.denimgroup.threadfix.service.defects.defaults.tags.GenericNameDefaultTagMapper','GenericName'),(2,'Evaluates the generic Threadfix severity in its literal form (high low...) for the first vulnerability in the list','com.denimgroup.threadfix.service.defects.defaults.tags.GenericSeverityDefaultTagMapper','GenericSeverity');
/*!40000 ALTER TABLE `DefaultTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefaultValueMappingMap`
--

DROP TABLE IF EXISTS `DefaultValueMappingMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefaultValueMappingMap` (
  `defaultDefectFieldId` int(11) NOT NULL,
  `defaultValue` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyValue` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`defaultDefectFieldId`,`keyValue`),
  KEY `FK9F75F19EDCD91E6A` (`defaultDefectFieldId`),
  CONSTRAINT `FK9F75F19EDCD91E6A` FOREIGN KEY (`defaultDefectFieldId`) REFERENCES `DefaultDefectField` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefaultValueMappingMap`
--

LOCK TABLES `DefaultValueMappingMap` WRITE;
/*!40000 ALTER TABLE `DefaultValueMappingMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `DefaultValueMappingMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Defect`
--

DROP TABLE IF EXISTS `Defect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Defect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `defectURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusUpdatedDate` datetime DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`(191)),
  KEY `FK79C8B591C96E039C` (`applicationId`),
  CONSTRAINT `FK79C8B591C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Defect`
--

LOCK TABLES `Defect` WRITE;
/*!40000 ALTER TABLE `Defect` DISABLE KEYS */;
/*!40000 ALTER TABLE `Defect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefectTracker`
--

DROP TABLE IF EXISTS `DefectTracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefectTracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `defaultProductName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedDefaultPassword` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedDefaultUsername` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defectTrackerTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA41584676E74A8BE` (`defectTrackerTypeId`),
  CONSTRAINT `FKA41584676E74A8BE` FOREIGN KEY (`defectTrackerTypeId`) REFERENCES `DefectTrackerType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefectTracker`
--

LOCK TABLES `DefectTracker` WRITE;
/*!40000 ALTER TABLE `DefectTracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `DefectTracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DefectTrackerType`
--

DROP TABLE IF EXISTS `DefectTrackerType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DefectTrackerType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullClassName` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlPlaceholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DefectTrackerType`
--

LOCK TABLES `DefectTrackerType` WRITE;
/*!40000 ALTER TABLE `DefectTrackerType` DISABLE KEYS */;
INSERT INTO `DefectTrackerType` VALUES (1,'com.denimgroup.threadfix.service.defects.BugzillaDefectTracker','Bugzilla',NULL,NULL),(2,'com.denimgroup.threadfix.service.defects.TFSDefectTracker','Microsoft TFS',NULL,NULL),(3,'com.denimgroup.threadfix.service.defects.JiraDefectTracker','JIRA',NULL,NULL),(4,'com.denimgroup.threadfix.service.defects.HPQualityCenterDefectTracker','HP Quality Center',NULL,NULL),(5,'com.denimgroup.threadfix.service.defects.VersionOneDefectTracker','Version One',NULL,NULL);
/*!40000 ALTER TABLE `DefectTrackerType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedCloseMap`
--

DROP TABLE IF EXISTS `DeletedCloseMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedCloseMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `scanId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedCloseMap`
--

LOCK TABLES `DeletedCloseMap` WRITE;
/*!40000 ALTER TABLE `DeletedCloseMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedCloseMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedDataFlowElement`
--

DROP TABLE IF EXISTS `DeletedDataFlowElement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedDataFlowElement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `columnNumber` int(11) NOT NULL,
  `deletedFindingId` int(11) DEFAULT NULL,
  `lineNumber` int(11) NOT NULL,
  `lineText` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `sourceFileName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedDataFlowElement`
--

LOCK TABLES `DeletedDataFlowElement` WRITE;
/*!40000 ALTER TABLE `DeletedDataFlowElement` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedDataFlowElement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedDefect`
--

DROP TABLE IF EXISTS `DeletedDefect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedDefect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) DEFAULT NULL,
  `defectURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedDefect`
--

LOCK TABLES `DeletedDefect` WRITE;
/*!40000 ALTER TABLE `DeletedDefect` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedDefect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedFinding`
--

DROP TABLE IF EXISTS `DeletedFinding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedFinding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deletedScanId` int(11) DEFAULT NULL,
  `firstFindingForVuln` bit(1) NOT NULL,
  `isStatic` bit(1) NOT NULL,
  `longDescription` varchar(2047) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `markedFalsePositive` bit(1) DEFAULT NULL,
  `nativeId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberMergedResults` int(11) DEFAULT NULL,
  `sourceFileLocation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelSeverityId` int(11) DEFAULT NULL,
  `channelVulnerabilityId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA623150E2A500AC` (`channelVulnerabilityId`),
  KEY `FKA623150DFCC92B4` (`vulnerabilityId`),
  KEY `FKA623150D593C930` (`userId`),
  KEY `FKA6231504BC6129C` (`channelSeverityId`),
  CONSTRAINT `FKA6231504BC6129C` FOREIGN KEY (`channelSeverityId`) REFERENCES `ChannelSeverity` (`id`),
  CONSTRAINT `FKA623150D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FKA623150DFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`),
  CONSTRAINT `FKA623150E2A500AC` FOREIGN KEY (`channelVulnerabilityId`) REFERENCES `ChannelVulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedFinding`
--

LOCK TABLES `DeletedFinding` WRITE;
/*!40000 ALTER TABLE `DeletedFinding` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedFinding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedRemoteProviderApplication`
--

DROP TABLE IF EXISTS `DeletedRemoteProviderApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedRemoteProviderApplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `applicationChannelId` int(11) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `lastImportTime` datetime DEFAULT NULL,
  `nativeName` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remoteProviderTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedRemoteProviderApplication`
--

LOCK TABLES `DeletedRemoteProviderApplication` WRITE;
/*!40000 ALTER TABLE `DeletedRemoteProviderApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedRemoteProviderApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedReopenMap`
--

DROP TABLE IF EXISTS `DeletedReopenMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedReopenMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `scanId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedReopenMap`
--

LOCK TABLES `DeletedReopenMap` WRITE;
/*!40000 ALTER TABLE `DeletedReopenMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedReopenMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedRepeatFindingMap`
--

DROP TABLE IF EXISTS `DeletedRepeatFindingMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedRepeatFindingMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `findingId` int(11) DEFAULT NULL,
  `scanId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedRepeatFindingMap`
--

LOCK TABLES `DeletedRepeatFindingMap` WRITE;
/*!40000 ALTER TABLE `DeletedRepeatFindingMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedRepeatFindingMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedScan`
--

DROP TABLE IF EXISTS `DeletedScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedScan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationChannelId` int(11) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `importTime` datetime DEFAULT NULL,
  `numberClosedVulnerabilities` int(11) DEFAULT NULL,
  `numberNewVulnerabilities` int(11) DEFAULT NULL,
  `numberOldVulnerabilities` int(11) DEFAULT NULL,
  `numberOldVulnerabilitiesInitiallyFromThisChannel` int(11) DEFAULT NULL,
  `numberRepeatFindings` int(11) DEFAULT NULL,
  `numberRepeatResults` int(11) DEFAULT NULL,
  `numberResurfacedVulnerabilities` int(11) DEFAULT NULL,
  `numberTotalVulnerabilities` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedScan`
--

LOCK TABLES `DeletedScan` WRITE;
/*!40000 ALTER TABLE `DeletedScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedSurfaceLocation`
--

DROP TABLE IF EXISTS `DeletedSurfaceLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedSurfaceLocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `deletedFindingId` int(11) DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL,
  `protocol` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedSurfaceLocation`
--

LOCK TABLES `DeletedSurfaceLocation` WRITE;
/*!40000 ALTER TABLE `DeletedSurfaceLocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedSurfaceLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedVulnerability`
--

DROP TABLE IF EXISTS `DeletedVulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedVulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `closeTime` datetime DEFAULT NULL,
  `defectClosedTime` datetime DEFAULT NULL,
  `defectId` int(11) NOT NULL,
  `defectSubmittedTime` datetime DEFAULT NULL,
  `expired` bit(1) NOT NULL,
  `foundByScanner` bit(1) NOT NULL,
  `isFalsePositive` bit(1) NOT NULL,
  `locationHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locationVariableHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openTime` datetime DEFAULT NULL,
  `surfaceLocationId` int(11) NOT NULL,
  `variableHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wafRuleGeneratedTime` datetime DEFAULT NULL,
  `genericSeverityId` int(11) DEFAULT NULL,
  `genericVulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3607F903AD661F44` (`genericSeverityId`),
  KEY `FK3607F9031DDA9D04` (`genericVulnerabilityId`),
  CONSTRAINT `FK3607F9031DDA9D04` FOREIGN KEY (`genericVulnerabilityId`) REFERENCES `GenericVulnerability` (`id`),
  CONSTRAINT `FK3607F903AD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedVulnerability`
--

LOCK TABLES `DeletedVulnerability` WRITE;
/*!40000 ALTER TABLE `DeletedVulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedVulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeletedWafRule`
--

DROP TABLE IF EXISTS `DeletedWafRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeletedWafRule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nativeId` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vulnerabilityDesc` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  `wafId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeletedWafRule`
--

LOCK TABLES `DeletedWafRule` WRITE;
/*!40000 ALTER TABLE `DeletedWafRule` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeletedWafRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependency`
--

DROP TABLE IF EXISTS `Dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `componentFilePath` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `componentName` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cve` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `refLink` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependency`
--

LOCK TABLES `Dependency` WRITE;
/*!40000 ALTER TABLE `Dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Document`
--

DROP TABLE IF EXISTS `Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `contentType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` longblob,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3737353BDFCC92B4` (`vulnerabilityId`),
  KEY `FK3737353BC96E039C` (`applicationId`),
  CONSTRAINT `FK3737353BC96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FK3737353BDFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Document`
--

LOCK TABLES `Document` WRITE;
/*!40000 ALTER TABLE `Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailAddress`
--

DROP TABLE IF EXISTS `EmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailAddress` (
  `EmailListId` int(11) NOT NULL,
  `emailAddress` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FKC9F634D82034FB50` (`EmailListId`),
  CONSTRAINT `FKC9F634D82034FB50` FOREIGN KEY (`EmailListId`) REFERENCES `EmailList` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailAddress`
--

LOCK TABLES `EmailAddress` WRITE;
/*!40000 ALTER TABLE `EmailAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailList`
--

DROP TABLE IF EXISTS `EmailList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailList`
--

LOCK TABLES `EmailList` WRITE;
/*!40000 ALTER TABLE `EmailList` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmailList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmptyScan`
--

DROP TABLE IF EXISTS `EmptyScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmptyScan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alreadyProcessed` bit(1) NOT NULL,
  `dateUploaded` datetime DEFAULT NULL,
  `fileName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicationChannelId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22CE714AD1ED50A0` (`applicationChannelId`),
  CONSTRAINT `FK22CE714AD1ED50A0` FOREIGN KEY (`applicationChannelId`) REFERENCES `ApplicationChannel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmptyScan`
--

LOCK TABLES `EmptyScan` WRITE;
/*!40000 ALTER TABLE `EmptyScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmptyScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndpointPermission`
--

DROP TABLE IF EXISTS `EndpointPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndpointPermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF21E4564C96E039C` (`applicationId`),
  CONSTRAINT `FKF21E4564C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndpointPermission`
--

LOCK TABLES `EndpointPermission` WRITE;
/*!40000 ALTER TABLE `EndpointPermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `EndpointPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndpointPermission_Finding`
--

DROP TABLE IF EXISTS `EndpointPermission_Finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndpointPermission_Finding` (
  `EndpointPermission_Id` int(11) NOT NULL,
  `Finding_Id` int(11) NOT NULL,
  KEY `FKDB27B8E259CF17B` (`Finding_Id`),
  KEY `FKDB27B8E42F21C59` (`EndpointPermission_Id`),
  CONSTRAINT `FKDB27B8E42F21C59` FOREIGN KEY (`EndpointPermission_Id`) REFERENCES `EndpointPermission` (`id`),
  CONSTRAINT `FKDB27B8E259CF17B` FOREIGN KEY (`Finding_Id`) REFERENCES `Finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndpointPermission_Finding`
--

LOCK TABLES `EndpointPermission_Finding` WRITE;
/*!40000 ALTER TABLE `EndpointPermission_Finding` DISABLE KEYS */;
/*!40000 ALTER TABLE `EndpointPermission_Finding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndpointPermission_Vulnerability`
--

DROP TABLE IF EXISTS `EndpointPermission_Vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndpointPermission_Vulnerability` (
  `EndpointPermission_Id` int(11) NOT NULL,
  `Vulnerability_Id` int(11) NOT NULL,
  KEY `FKDA3B1CC18282DBDB` (`Vulnerability_Id`),
  KEY `FKDA3B1CC142F21C59` (`EndpointPermission_Id`),
  CONSTRAINT `FKDA3B1CC142F21C59` FOREIGN KEY (`EndpointPermission_Id`) REFERENCES `EndpointPermission` (`id`),
  CONSTRAINT `FKDA3B1CC18282DBDB` FOREIGN KEY (`Vulnerability_Id`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndpointPermission_Vulnerability`
--

LOCK TABLES `EndpointPermission_Vulnerability` WRITE;
/*!40000 ALTER TABLE `EndpointPermission_Vulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `EndpointPermission_Vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `apiAction` bit(1) DEFAULT NULL,
  `date` datetime NOT NULL,
  `deletedScanId` int(11) DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventAction` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `defectId` int(11) DEFAULT NULL,
  `findingId` int(11) DEFAULT NULL,
  `policyId` int(11) DEFAULT NULL,
  `policyStatusId` int(11) DEFAULT NULL,
  `scanId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  `commentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK403827A6E262BC2` (`policyStatusId`),
  KEY `FK403827AE77AAA7E` (`policyId`),
  KEY `FK403827ADFCC92B4` (`vulnerabilityId`),
  KEY `FK403827AD1459A14` (`scanId`),
  KEY `FK403827A14599E4E` (`findingId`),
  KEY `FK403827ACB67DB3C` (`commentId`),
  KEY `FK403827AD86EDF3C` (`defectId`),
  KEY `FK403827AC96E039C` (`applicationId`),
  KEY `FK403827AD593C930` (`userId`),
  CONSTRAINT `FK403827AD593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK403827A14599E4E` FOREIGN KEY (`findingId`) REFERENCES `Finding` (`id`),
  CONSTRAINT `FK403827A6E262BC2` FOREIGN KEY (`policyStatusId`) REFERENCES `PolicyStatus` (`id`),
  CONSTRAINT `FK403827AC96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FK403827ACB67DB3C` FOREIGN KEY (`commentId`) REFERENCES `VulnerabilityComment` (`id`),
  CONSTRAINT `FK403827AD1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`),
  CONSTRAINT `FK403827AD86EDF3C` FOREIGN KEY (`defectId`) REFERENCES `Defect` (`id`),
  CONSTRAINT `FK403827ADFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`),
  CONSTRAINT `FK403827AE77AAA7E` FOREIGN KEY (`policyId`) REFERENCES `Policy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExceptionLog`
--

DROP TABLE IF EXISTS `ExceptionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExceptionLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exceptionStackTrace` longtext COLLATE utf8mb4_unicode_ci,
  `exceptionToString` longtext COLLATE utf8mb4_unicode_ci,
  `freeMemory` bigint(20) DEFAULT NULL,
  `message` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `totalMemoryAvailable` bigint(20) DEFAULT NULL,
  `totalSpaceAvailable` bigint(20) DEFAULT NULL,
  `type` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExceptionLog`
--

LOCK TABLES `ExceptionLog` WRITE;
/*!40000 ALTER TABLE `ExceptionLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExceptionLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilterDate`
--

DROP TABLE IF EXISTS `FilterDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FilterDate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilterDate`
--

LOCK TABLES `FilterDate` WRITE;
/*!40000 ALTER TABLE `FilterDate` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilterDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilterJsonBlob`
--

DROP TABLE IF EXISTS `FilterJsonBlob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FilterJsonBlob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `defaultTrending` bit(1) DEFAULT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilterJsonBlob`
--

LOCK TABLES `FilterJsonBlob` WRITE;
/*!40000 ALTER TABLE `FilterJsonBlob` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilterJsonBlob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Finding`
--

DROP TABLE IF EXISTS `Finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Finding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `attackRequest` longtext COLLATE utf8mb4_unicode_ci,
  `attackResponse` longtext COLLATE utf8mb4_unicode_ci,
  `attackString` longtext COLLATE utf8mb4_unicode_ci,
  `authenticationRequired` int(11) DEFAULT NULL,
  `calculatedFilePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculatedUrlPath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entryPointLineNumber` int(11) DEFAULT NULL,
  `firstFindingForVuln` bit(1) NOT NULL,
  `foundHAMEndpoint` bit(1) DEFAULT NULL,
  `hasStatisticsCounter` bit(1) DEFAULT NULL,
  `isStatic` bit(1) NOT NULL,
  `issueId` longtext COLLATE utf8mb4_unicode_ci,
  `longDescription` varchar(2047) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `markedFalsePositive` bit(1) DEFAULT NULL,
  `nativeId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numberMergedResults` int(11) NOT NULL,
  `rawFinding` longtext COLLATE utf8mb4_unicode_ci,
  `scannedDate` datetime DEFAULT NULL,
  `scannerDetail` longtext COLLATE utf8mb4_unicode_ci,
  `scannerRecommendation` longtext COLLATE utf8mb4_unicode_ci,
  `sourceFileLocation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlReference` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelSeverityId` int(11) DEFAULT NULL,
  `channelVulnerabilityId` int(11) DEFAULT NULL,
  `dependencyId` int(11) DEFAULT NULL,
  `scanId` int(11) DEFAULT NULL,
  `staticPathInformationId` int(11) DEFAULT NULL,
  `surfaceLocationId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firstFinding` (`firstFindingForVuln`),
  KEY `statsCounter` (`hasStatisticsCounter`),
  KEY `FK305E3369E2A500AC` (`channelVulnerabilityId`),
  KEY `FK305E33699240CF0` (`dependencyId`),
  KEY `FK305E3369DFCC92B4` (`vulnerabilityId`),
  KEY `FK305E3369B0B03CAE` (`staticPathInformationId`),
  KEY `FK305E3369D1459A14` (`scanId`),
  KEY `FK305E33694E2A66E0` (`surfaceLocationId`),
  KEY `FK305E3369D593C930` (`userId`),
  KEY `FK305E33694BC6129C` (`channelSeverityId`),
  CONSTRAINT `FK305E33694BC6129C` FOREIGN KEY (`channelSeverityId`) REFERENCES `ChannelSeverity` (`id`),
  CONSTRAINT `FK305E33694E2A66E0` FOREIGN KEY (`surfaceLocationId`) REFERENCES `SurfaceLocation` (`id`),
  CONSTRAINT `FK305E33699240CF0` FOREIGN KEY (`dependencyId`) REFERENCES `Dependency` (`id`),
  CONSTRAINT `FK305E3369B0B03CAE` FOREIGN KEY (`staticPathInformationId`) REFERENCES `StaticPathInformation` (`id`),
  CONSTRAINT `FK305E3369D1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`),
  CONSTRAINT `FK305E3369D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK305E3369DFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`),
  CONSTRAINT `FK305E3369E2A500AC` FOREIGN KEY (`channelVulnerabilityId`) REFERENCES `ChannelVulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Finding`
--

LOCK TABLES `Finding` WRITE;
/*!40000 ALTER TABLE `Finding` DISABLE KEYS */;
/*!40000 ALTER TABLE `Finding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRCApplication`
--

DROP TABLE IF EXISTS `GRCApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRCApplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policyNumber` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `grcToolId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCE06F5783088567C` (`grcToolId`),
  KEY `FKCE06F578C96E039C` (`applicationId`),
  CONSTRAINT `FKCE06F578C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKCE06F5783088567C` FOREIGN KEY (`grcToolId`) REFERENCES `GRCTool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRCApplication`
--

LOCK TABLES `GRCApplication` WRITE;
/*!40000 ALTER TABLE `GRCApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRCApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRCControl`
--

DROP TABLE IF EXISTS `GRCControl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRCControl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `controlId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referenceUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grcApplicationId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA28A985D1429E6A` (`grcApplicationId`),
  KEY `FKA28A985DFCC92B4` (`vulnerabilityId`),
  CONSTRAINT `FKA28A985DFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`),
  CONSTRAINT `FKA28A985D1429E6A` FOREIGN KEY (`grcApplicationId`) REFERENCES `GRCApplication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRCControl`
--

LOCK TABLES `GRCControl` WRITE;
/*!40000 ALTER TABLE `GRCControl` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRCControl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRCTool`
--

DROP TABLE IF EXISTS `GRCTool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRCTool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `encryptedPassword` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedUsername` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grcToolTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK3B9FD670838A6A10` (`grcToolTypeId`),
  CONSTRAINT `FK3B9FD670838A6A10` FOREIGN KEY (`grcToolTypeId`) REFERENCES `GRCToolType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRCTool`
--

LOCK TABLES `GRCTool` WRITE;
/*!40000 ALTER TABLE `GRCTool` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRCTool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRCToolType`
--

DROP TABLE IF EXISTS `GRCToolType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRCToolType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullClassName` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRCToolType`
--

LOCK TABLES `GRCToolType` WRITE;
/*!40000 ALTER TABLE `GRCToolType` DISABLE KEYS */;
/*!40000 ALTER TABLE `GRCToolType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenericSeverity`
--

DROP TABLE IF EXISTS `GenericSeverity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenericSeverity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intValue` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenericSeverity`
--

LOCK TABLES `GenericSeverity` WRITE;
/*!40000 ALTER TABLE `GenericSeverity` DISABLE KEYS */;
INSERT INTO `GenericSeverity` VALUES (1,NULL,4,'High'),(2,NULL,2,'Low'),(3,NULL,3,'Medium'),(4,NULL,5,'Critical'),(5,NULL,1,'Info');
/*!40000 ALTER TABLE `GenericSeverity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenericVulnerability`
--

DROP TABLE IF EXISTS `GenericVulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GenericVulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customText` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cweId` int(11) DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenericVulnerability`
--

LOCK TABLES `GenericVulnerability` WRITE;
/*!40000 ALTER TABLE `GenericVulnerability` DISABLE KEYS */;
INSERT INTO `GenericVulnerability` VALUES (1,NULL,1,'Location'),(2,NULL,2,'Environment'),(3,NULL,3,'Technology-specific Environment Issues'),(4,NULL,4,'J2EE Environment Issues'),(5,NULL,5,'J2EE Misconfiguration: Data Transmission Without Encryption'),(6,NULL,6,'J2EE Misconfiguration: Insufficient Session-ID Length'),(7,NULL,7,'J2EE Misconfiguration: Missing Custom Error Page'),(8,NULL,8,'J2EE Misconfiguration: Entity Bean Declared Remote'),(9,NULL,9,'J2EE Misconfiguration: Weak Access Permissions for EJB Methods'),(10,NULL,10,'ASP.NET Environment Issues'),(11,NULL,11,'ASP.NET Misconfiguration: Creating Debug Binary'),(12,NULL,12,'ASP.NET Misconfiguration: Missing Custom Error Page'),(13,NULL,13,'ASP.NET Misconfiguration: Password in Configuration File'),(14,NULL,14,'Compiler Removal of Code to Clear Buffers'),(15,NULL,15,'External Control of System or Configuration Setting'),(16,NULL,16,'Configuration'),(17,NULL,17,'Code'),(18,NULL,18,'Source Code'),(19,NULL,19,'Data Handling'),(20,NULL,20,'Improper Input Validation'),(21,NULL,21,'Pathname Traversal and Equivalence Errors'),(22,NULL,22,'Improper Limitation of a Pathname to a Restricted Directory (\'Path Traversal\')'),(23,NULL,23,'Relative Path Traversal'),(24,NULL,24,'Path Traversal: \'../filedir\''),(25,NULL,25,'Path Traversal: \'/../filedir\''),(26,NULL,26,'Path Traversal: \'/dir/../filename\''),(27,NULL,27,'Path Traversal: \'dir/../../filename\''),(28,NULL,28,'Path Traversal: \'..\\filedir\''),(29,NULL,29,'Path Traversal: \'\\..\\filename\''),(30,NULL,30,'Path Traversal: \'\\dir\\..\\filename\''),(31,NULL,31,'Path Traversal: \'dir\\..\\..\\filename\''),(32,NULL,32,'Path Traversal: \'...\' (Triple Dot)'),(33,NULL,33,'Path Traversal: \'....\' (Multiple Dot)'),(34,NULL,34,'Path Traversal: \'....//\''),(35,NULL,35,'Path Traversal: \'.../...//\''),(36,NULL,36,'Absolute Path Traversal'),(37,NULL,37,'Path Traversal: \'/absolute/pathname/here\''),(38,NULL,38,'Path Traversal: \'\\absolute\\pathname\\here\''),(39,NULL,39,'Path Traversal: \'C:dirname\''),(40,NULL,40,'Path Traversal: \'\\UNC share name\' (Windows UNC Share)'),(41,NULL,41,'Improper Resolution of Path Equivalence'),(42,NULL,42,'Path Equivalence: \'filename.\' (Trailing Dot)'),(43,NULL,43,'Path Equivalence: \'filename....\' (Multiple Trailing Dot)'),(44,NULL,44,'Path Equivalence: \'file.name\' (Internal Dot)'),(45,NULL,45,'Path Equivalence: \'file...name\' (Multiple Internal Dot)'),(46,NULL,46,'Path Equivalence: \'filename \' (Trailing Space)'),(47,NULL,47,'Path Equivalence: \' filename\' (Leading Space)'),(48,NULL,48,'Path Equivalence: \'file name\' (Internal Whitespace)'),(49,NULL,49,'Path Equivalence: \'filename/\' (Trailing Slash)'),(50,NULL,50,'Path Equivalence: \'//multiple/leading/slash\''),(51,NULL,51,'Path Equivalence: \'/multiple//internal/slash\''),(52,NULL,52,'Path Equivalence: \'/multiple/trailing/slash//\''),(53,NULL,53,'Path Equivalence: \'\\multiple\\\\internal\\\\backslash\''),(54,NULL,54,'Path Equivalence: \'filedir\\\\\' (Trailing Backslash)'),(55,NULL,55,'Path Equivalence: \'/./\' (Single Dot Directory)'),(56,NULL,56,'Path Equivalence: \'filedir*\' (Wildcard)'),(57,NULL,57,'Path Equivalence: \'fakedir/../realdir/filename\''),(58,NULL,58,'Path Equivalence: Windows 8.3 Filename'),(59,NULL,59,'Improper Link Resolution Before File Access (\'Link Following\')'),(60,NULL,60,'UNIX Path Link Problems'),(61,NULL,61,'UNIX Symbolic Link (Symlink) Following'),(62,NULL,62,'UNIX Hard Link'),(63,NULL,63,'Windows Path Link Problems'),(64,NULL,64,'Windows Shortcut Following (.LNK)'),(65,NULL,65,'Windows Hard Link'),(66,NULL,66,'Improper Handling of File Names that Identify Virtual Resources'),(67,NULL,67,'Improper Handling of Windows Device Names'),(68,NULL,68,'Windows Virtual File Problems'),(69,NULL,69,'Improper Handling of Windows ::DATA Alternate Data Stream'),(70,NULL,70,'Mac Virtual File Problems'),(71,NULL,71,'Apple \'.DS_Store\''),(72,NULL,72,'Improper Handling of Apple HFS+ Alternate Data Stream Path'),(73,NULL,73,'External Control of File Name or Path'),(74,NULL,74,'Improper Neutralization of Special Elements in Output Used by a Downstream Component (\'Injection\')'),(75,NULL,75,'Failure to Sanitize Special Elements into a Different Plane (Special Element Injection)'),(76,NULL,76,'Improper Neutralization of Equivalent Special Elements'),(77,NULL,77,'Improper Neutralization of Special Elements used in a Command (\'Command Injection\')'),(78,NULL,78,'Improper Neutralization of Special Elements used in an OS Command (\'OS Command Injection\')'),(79,NULL,79,'Improper Neutralization of Input During Web Page Generation (\'Cross-site Scripting\')'),(80,NULL,80,'Improper Neutralization of Script-Related HTML Tags in a Web Page (Basic XSS)'),(81,NULL,81,'Improper Neutralization of Script in an Error Message Web Page'),(82,NULL,82,'Improper Neutralization of Script in Attributes of IMG Tags in a Web Page'),(83,NULL,83,'Improper Neutralization of Script in Attributes in a Web Page'),(84,NULL,84,'Improper Neutralization of Encoded URI Schemes in a Web Page'),(85,NULL,85,'Doubled Character XSS Manipulations'),(86,NULL,86,'Improper Neutralization of Invalid Characters in Identifiers in Web Pages'),(87,NULL,87,'Improper Neutralization of Alternate XSS Syntax'),(88,NULL,88,'Argument Injection or Modification'),(89,NULL,89,'Improper Neutralization of Special Elements used in an SQL Command (\'SQL Injection\')'),(90,NULL,90,'Improper Neutralization of Special Elements used in an LDAP Query (\'LDAP Injection\')'),(91,NULL,91,'XML Injection (aka Blind XPath Injection)'),(92,NULL,92,'DEPRECATED: Improper Sanitization of Custom Special Characters'),(93,NULL,93,'Improper Neutralization of CRLF Sequences (\'CRLF Injection\')'),(94,NULL,94,'Improper Control of Generation of Code (\'Code Injection\')'),(95,NULL,95,'Improper Neutralization of Directives in Dynamically Evaluated Code (\'Eval Injection\')'),(96,NULL,96,'Improper Neutralization of Directives in Statically Saved Code (\'Static Code Injection\')'),(97,NULL,97,'Improper Neutralization of Server-Side Includes (SSI) Within a Web Page'),(98,NULL,98,'Improper Control of Filename for Include/Require Statement in PHP Program (\'PHP Remote File Inclusion\')'),(99,NULL,99,'\"Improper Control of Resource Identifiers (\'Resource Injection\')'),(100,NULL,100,'Technology-Specific Input Validation Problems'),(101,NULL,101,'Struts Validation Problems'),(102,NULL,102,'Struts: Duplicate Validation Forms'),(103,NULL,103,'Struts: Incomplete validate() Method Definition'),(104,NULL,104,'Struts: Form Bean Does Not Extend Validation Class'),(105,NULL,105,'Struts: Form Field Without Validator'),(106,NULL,106,'Struts: Plug-in Framework not in Use'),(107,NULL,107,'Struts: Unused Validation Form'),(108,NULL,108,'Struts: Unvalidated Action Form'),(109,NULL,109,'Struts: Validator Turned Off'),(110,NULL,110,'Struts: Validator Without Form Field'),(111,NULL,111,'Direct Use of Unsafe JNI'),(112,NULL,112,'Missing XML Validation'),(113,NULL,113,'Improper Neutralization of CRLF Sequences in HTTP Headers (\'HTTP Response Splitting\')'),(114,NULL,114,'Process Control'),(115,NULL,115,'Misinterpretation of Input'),(116,NULL,116,'Improper Encoding or Escaping of Output'),(117,NULL,117,'Improper Output Neutralization for Logs'),(118,NULL,118,'Improper Access of Indexable Resource (\'Range Error\')'),(119,NULL,119,'Improper Restriction of Operations within the Bounds of a Memory Buffer'),(120,NULL,120,'Buffer Copy without Checking Size of Input (\'Classic Buffer Overflow\')'),(121,NULL,121,'Stack-based Buffer Overflow'),(122,NULL,122,'Heap-based Buffer Overflow'),(123,NULL,123,'Write-what-where Condition'),(124,NULL,124,'Buffer Underwrite (\'Buffer Underflow\')'),(125,NULL,125,'Out-of-bounds Read'),(126,NULL,126,'Buffer Over-read'),(127,NULL,127,'Buffer Under-read'),(128,NULL,128,'Wrap-around Error'),(129,NULL,129,'Improper Validation of Array Index'),(130,NULL,130,'Improper Handling of Length Parameter Inconsistency'),(131,NULL,131,'Incorrect Calculation of Buffer Size'),(132,NULL,132,'DEPRECATED (Duplicate): Miscalculated Null Termination'),(133,NULL,133,'String Errors'),(134,NULL,134,'Uncontrolled Format String'),(135,NULL,135,'Incorrect Calculation of Multi-Byte String Length'),(136,NULL,136,'Type Errors'),(137,NULL,137,'Representation Errors'),(138,NULL,138,'Improper Neutralization of Special Elements'),(139,NULL,139,'DEPRECATED: General Special Element Problems'),(140,NULL,140,'Improper Neutralization of Delimiters'),(141,NULL,141,'Improper Neutralization of Parameter/Argument Delimiters'),(142,NULL,142,'Improper Neutralization of Value Delimiters'),(143,NULL,143,'Improper Neutralization of Record Delimiters'),(144,NULL,144,'Improper Neutralization of Line Delimiters'),(145,NULL,145,'Improper Neutralization of Section Delimiters'),(146,NULL,146,'Improper Neutralization of Expression/Command Delimiters'),(147,NULL,147,'Improper Neutralization of Input Terminators'),(148,NULL,148,'Improper Neutralization of Input Leaders'),(149,NULL,149,'Improper Neutralization of Quoting Syntax'),(150,NULL,150,'Improper Neutralization of Escape, Meta, or Control Sequences'),(151,NULL,151,'Improper Neutralization of Comment Delimiters'),(152,NULL,152,'Improper Neutralization of Macro Symbols'),(153,NULL,153,'Improper Neutralization of Substitution Characters'),(154,NULL,154,'Improper Neutralization of Variable Name Delimiters'),(155,NULL,155,'Improper Neutralization of Wildcards or Matching Symbols'),(156,NULL,156,'Improper Neutralization of Whitespace'),(157,NULL,157,'Failure to Sanitize Paired Delimiters'),(158,NULL,158,'Improper Neutralization of Null Byte or NUL Character'),(159,NULL,159,'Failure to Sanitize Special Element'),(160,NULL,160,'Improper Neutralization of Leading Special Elements'),(161,NULL,161,'Improper Neutralization of Multiple Leading Special Elements'),(162,NULL,162,'Improper Neutralization of Trailing Special Elements'),(163,NULL,163,'Improper Neutralization of Multiple Trailing Special Elements'),(164,NULL,164,'Improper Neutralization of Internal Special Elements'),(165,NULL,165,'Improper Neutralization of Multiple Internal Special Elements'),(166,NULL,166,'Improper Handling of Missing Special Element'),(167,NULL,167,'Improper Handling of Additional Special Element'),(168,NULL,168,'Improper Handling of Inconsistent Special Elements'),(169,NULL,169,'Technology-Specific Special Elements'),(170,NULL,170,'Improper Null Termination'),(171,NULL,171,'Cleansing, Canonicalization, and Comparison Errors'),(172,NULL,172,'Encoding Error'),(173,NULL,173,'Improper Handling of Alternate Encoding'),(174,NULL,174,'Double Decoding of the Same Data'),(175,NULL,175,'Improper Handling of Mixed Encoding'),(176,NULL,176,'Improper Handling of Unicode Encoding'),(177,NULL,177,'Improper Handling of URL Encoding (Hex Encoding)'),(178,NULL,178,'Improper Handling of Case Sensitivity'),(179,NULL,179,'Incorrect Behavior Order: Early Validation'),(180,NULL,180,'Incorrect Behavior Order: Validate Before Canonicalize'),(181,NULL,181,'Incorrect Behavior Order: Validate Before Filter'),(182,NULL,182,'Collapse of Data into Unsafe Value'),(183,NULL,183,'Permissive Whitelist'),(184,NULL,184,'Incomplete Blacklist'),(185,NULL,185,'Incorrect Regular Expression'),(186,NULL,186,'Overly Restrictive Regular Expression'),(187,NULL,187,'Partial Comparison'),(188,NULL,188,'Reliance on Data/Memory Layout'),(189,NULL,189,'Numeric Errors'),(190,NULL,190,'Integer Overflow or Wraparound'),(191,NULL,191,'Integer Underflow (Wrap or Wraparound)'),(192,NULL,192,'Integer Coercion Error'),(193,NULL,193,'Off-by-one Error'),(194,NULL,194,'Unexpected Sign Extension'),(195,NULL,195,'Signed to Unsigned Conversion Error'),(196,NULL,196,'Unsigned to Signed Conversion Error'),(197,NULL,197,'Numeric Truncation Error'),(198,NULL,198,'Use of Incorrect Byte Ordering'),(199,NULL,199,'Information Management Errors'),(200,NULL,200,'Information Exposure'),(201,NULL,201,'Information Exposure Through Sent Data'),(202,NULL,202,'Exposure of Sensitive Data Through Data Queries'),(203,NULL,203,'Information Exposure Through Discrepancy'),(204,NULL,204,'Response Discrepancy Information Exposure'),(205,NULL,205,'Information Exposure Through Behavioral Discrepancy'),(206,NULL,206,'Information Exposure of Internal State Through Behavioral Inconsistency'),(207,NULL,207,'Information Exposure Through an External Behavioral Inconsistency'),(208,NULL,208,'Information Exposure Through Timing Discrepancy'),(209,NULL,209,'Information Exposure Through an Error Message'),(210,NULL,210,'Information Exposure Through Self-generated Error Message'),(211,NULL,211,'Information Exposure Through Externally-generated Error Message'),(212,NULL,212,'Improper Cross-boundary Removal of Sensitive Data'),(213,NULL,213,'Intentional Information Exposure'),(214,NULL,214,'Information Exposure Through Process Environment'),(215,NULL,215,'Information Exposure Through Debug Information'),(216,NULL,216,'Containment Errors (Container Errors)'),(217,NULL,217,'DEPRECATED: Failure to Protect Stored Data from Modification'),(218,NULL,218,'DEPRECATED (Duplicate): Failure to provide confidentiality for stored data'),(219,NULL,219,'Sensitive Data Under Web Root'),(220,NULL,220,'Sensitive Data Under FTP Root'),(221,NULL,221,'Information Loss or Omission'),(222,NULL,222,'Truncation of Security-relevant Information'),(223,NULL,223,'Omission of Security-relevant Information'),(224,NULL,224,'Obscured Security-relevant Information by Alternate Name'),(225,NULL,225,'DEPRECATED (Duplicate): General Information Management Problems'),(226,NULL,226,'Sensitive Information Uncleared Before Release'),(227,NULL,227,'Improper Fulfillment of API Contract (\'API Abuse\')'),(228,NULL,228,'Improper Handling of Syntactically Invalid Structure'),(229,NULL,229,'Improper Handling of Values'),(230,NULL,230,'Improper Handling of Missing Values'),(231,NULL,231,'Improper Handling of Extra Values'),(232,NULL,232,'Improper Handling of Undefined Values'),(233,NULL,233,'Improper Handling of Parameters'),(234,NULL,234,'Failure to Handle Missing Parameter'),(235,NULL,235,'Improper Handling of Extra Parameters'),(236,NULL,236,'Improper Handling of Undefined Parameters'),(237,NULL,237,'Improper Handling of Structural Elements'),(238,NULL,238,'Improper Handling of Incomplete Structural Elements'),(239,NULL,239,'Failure to Handle Incomplete Element'),(240,NULL,240,'Improper Handling of Inconsistent Structural Elements'),(241,NULL,241,'Improper Handling of Unexpected Data Type'),(242,NULL,242,'Use of Inherently Dangerous Function'),(243,NULL,243,'Creation of chroot Jail Without Changing Working Directory'),(244,NULL,244,'Improper Clearing of Heap Memory Before Release (\'Heap Inspection\')'),(245,NULL,245,'J2EE Bad Practices: Direct Management of Connections'),(246,NULL,246,'J2EE Bad Practices: Direct Use of Sockets'),(247,NULL,247,'DEPRECATED (Duplicate): Reliance on DNS Lookups in a Security Decision'),(248,NULL,248,'Uncaught Exception'),(249,NULL,249,'DEPRECATED: Often Misused: Path Manipulation'),(250,NULL,250,'Execution with Unnecessary Privileges'),(251,NULL,251,'Often Misused: String Management'),(252,NULL,252,'Unchecked Return Value'),(253,NULL,253,'Incorrect Check of Function Return Value'),(254,NULL,254,'Security Features'),(255,NULL,255,'Credentials Management'),(256,NULL,256,'Plaintext Storage of a Password'),(257,NULL,257,'Storing Passwords in a Recoverable Format'),(258,NULL,258,'Empty Password in Configuration File'),(259,NULL,259,'Use of Hard-coded Password'),(260,NULL,260,'Password in Configuration File'),(261,NULL,261,'Weak Cryptography for Passwords'),(262,NULL,262,'Not Using Password Aging'),(263,NULL,263,'Password Aging with Long Expiration'),(264,NULL,264,'Permissions, Privileges, and Access Controls'),(265,NULL,265,'Privilege / Sandbox Issues'),(266,NULL,266,'Incorrect Privilege Assignment'),(267,NULL,267,'Privilege Defined With Unsafe Actions'),(268,NULL,268,'Privilege Chaining'),(269,NULL,269,'Improper Privilege Management'),(270,NULL,270,'Privilege Context Switching Error'),(271,NULL,271,'Privilege Dropping / Lowering Errors'),(272,NULL,272,'Least Privilege Violation'),(273,NULL,273,'Improper Check for Dropped Privileges'),(274,NULL,274,'Improper Handling of Insufficient Privileges'),(275,NULL,275,'Permission Issues'),(276,NULL,276,'Incorrect Default Permissions'),(277,NULL,277,'Insecure Inherited Permissions'),(278,NULL,278,'Insecure Preserved Inherited Permissions'),(279,NULL,279,'Incorrect Execution-Assigned Permissions'),(280,NULL,280,'Improper Handling of Insufficient Permissions or Privileges'),(281,NULL,281,'Improper Preservation of Permissions'),(282,NULL,282,'Improper Ownership Management'),(283,NULL,283,'Unverified Ownership'),(284,NULL,284,'Improper Access Control'),(285,NULL,285,'Improper Authorization'),(286,NULL,286,'Incorrect User Management'),(287,NULL,287,'Improper Authentication'),(288,NULL,288,'Authentication Bypass Using an Alternate Path or Channel'),(289,NULL,289,'Authentication Bypass by Alternate Name'),(290,NULL,290,'Authentication Bypass by Spoofing'),(291,NULL,291,'Reliance on IP Address for Authentication'),(292,NULL,292,'DEPRECATED (Duplicate): Trusting Self-reported DNS Name'),(293,NULL,293,'Using Referer Field for Authentication'),(294,NULL,294,'Authentication Bypass by Capture-replay'),(295,NULL,295,'Improper Certificate Validation'),(296,NULL,296,'Improper Following of a Certificate\'s Chain of Trust'),(297,NULL,297,'Improper Validation of Certificate with Host Mismatch'),(298,NULL,298,'Improper Validation of Certificate Expiration'),(299,NULL,299,'Improper Check for Certificate Revocation'),(300,NULL,300,'Channel Accessible by Non-Endpoint (\'Man-in-the-Middle\')'),(301,NULL,301,'Reflection Attack in an Authentication Protocol'),(302,NULL,302,'Authentication Bypass by Assumed-Immutable Data'),(303,NULL,303,'Incorrect Implementation of Authentication Algorithm'),(304,NULL,304,'Missing Critical Step in Authentication'),(305,NULL,305,'Authentication Bypass by Primary Weakness'),(306,NULL,306,'Missing Authentication for Critical Function'),(307,NULL,307,'Improper Restriction of Excessive Authentication Attempts'),(308,NULL,308,'Use of Single-factor Authentication'),(309,NULL,309,'Use of Password System for Primary Authentication'),(310,NULL,310,'Cryptographic Issues'),(311,NULL,311,'Missing Encryption of Sensitive Data'),(312,NULL,312,'Cleartext Storage of Sensitive Information'),(313,NULL,313,'Cleartext Storage in a File or on Disk'),(314,NULL,314,'Cleartext Storage in the Registry'),(315,NULL,315,'Cleartext Storage of Sensitive Information in a Cookie'),(316,NULL,316,'Cleartext Storage of Sensitive Information in Memory'),(317,NULL,317,'Cleartext Storage of Sensitive Information in GUI'),(318,NULL,318,'Cleartext Storage of Sensitive Information in Executable'),(319,NULL,319,'Cleartext Transmission of Sensitive Information'),(320,NULL,320,'Key Management Errors'),(321,NULL,321,'Use of Hard-coded Cryptographic Key'),(322,NULL,322,'Key Exchange without Entity Authentication'),(323,NULL,323,'Reusing a Nonce, Key Pair in Encryption'),(324,NULL,324,'Use of a Key Past its Expiration Date'),(325,NULL,325,'Missing Required Cryptographic Step'),(326,NULL,326,'Inadequate Encryption Strength'),(327,NULL,327,'Use of a Broken or Risky Cryptographic Algorithm'),(328,NULL,328,'Reversible One-Way Hash'),(329,NULL,329,'Not Using a Random IV with CBC Mode'),(330,NULL,330,'Use of Insufficiently Random Values'),(331,NULL,331,'Insufficient Entropy'),(332,NULL,332,'Insufficient Entropy in PRNG'),(333,NULL,333,'Improper Handling of Insufficient Entropy in TRNG'),(334,NULL,334,'Small Space of Random Values'),(335,NULL,335,'PRNG Seed Error'),(336,NULL,336,'Same Seed in PRNG'),(337,NULL,337,'Predictable Seed in PRNG'),(338,NULL,338,'Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)'),(339,NULL,339,'Small Seed Space in PRNG'),(340,NULL,340,'Predictability Problems'),(341,NULL,341,'Predictable from Observable State'),(342,NULL,342,'Predictable Exact Value from Previous Values'),(343,NULL,343,'Predictable Value Range from Previous Values'),(344,NULL,344,'Use of Invariant Value in Dynamically Changing Context'),(345,NULL,345,'Insufficient Verification of Data Authenticity'),(346,NULL,346,'Origin Validation Error'),(347,NULL,347,'Improper Verification of Cryptographic Signature'),(348,NULL,348,'Use of Less Trusted Source'),(349,NULL,349,'Acceptance of Extraneous Untrusted Data With Trusted Data'),(350,NULL,350,'Reliance on Reverse DNS Resolution for a Security-Critical Action'),(351,NULL,351,'Insufficient Type Distinction'),(352,NULL,352,'Cross-Site Request Forgery (CSRF)'),(353,NULL,353,'Missing Support for Integrity Check'),(354,NULL,354,'Improper Validation of Integrity Check Value'),(355,NULL,355,'User Interface Security Issues'),(356,NULL,356,'Product UI does not Warn User of Unsafe Actions'),(357,NULL,357,'Insufficient UI Warning of Dangerous Operations'),(358,NULL,358,'Improperly Implemented Security Check for Standard'),(359,NULL,359,'Exposure of Private Information (\'Privacy Violation\')'),(360,NULL,360,'Trust of System Event Data'),(361,NULL,361,'Time and State'),(362,NULL,362,'Concurrent Execution using Shared Resource with Improper Synchronization (\'Race Condition\')'),(363,NULL,363,'Race Condition Enabling Link Following'),(364,NULL,364,'Signal Handler Race Condition'),(365,NULL,365,'Race Condition in Switch'),(366,NULL,366,'Race Condition within a Thread'),(367,NULL,367,'Time-of-check Time-of-use (TOCTOU) Race Condition'),(368,NULL,368,'Context Switching Race Condition'),(369,NULL,369,'Divide By Zero'),(370,NULL,370,'Missing Check for Certificate Revocation after Initial Check'),(371,NULL,371,'State Issues'),(372,NULL,372,'Incomplete Internal State Distinction'),(373,NULL,373,'DEPRECATED: State Synchronization Error'),(374,NULL,374,'Passing Mutable Objects to an Untrusted Method'),(375,NULL,375,'Returning a Mutable Object to an Untrusted Caller'),(376,NULL,376,'Temporary File Issues'),(377,NULL,377,'Insecure Temporary File'),(378,NULL,378,'Creation of Temporary File With Insecure Permissions'),(379,NULL,379,'Creation of Temporary File in Directory with Incorrect Permissions'),(380,NULL,380,'Technology-Specific Time and State Issues'),(381,NULL,381,'J2EE Time and State Issues'),(382,NULL,382,'J2EE Bad Practices: Use of System.exit()'),(383,NULL,383,'J2EE Bad Practices: Direct Use of Threads'),(384,NULL,384,'Session Fixation'),(385,NULL,385,'Covert Timing Channel'),(386,NULL,386,'Symbolic Name not Mapping to Correct Object'),(387,NULL,387,'Signal Errors'),(388,NULL,388,'Error Handling'),(389,NULL,389,'Error Conditions, Return Values, Status Codes'),(390,NULL,390,'Detection of Error Condition Without Action'),(391,NULL,391,'Unchecked Error Condition'),(392,NULL,392,'Missing Report of Error Condition'),(393,NULL,393,'Return of Wrong Status Code'),(394,NULL,394,'Unexpected Status Code or Return Value'),(395,NULL,395,'Use of NullPointerException Catch to Detect NULL Pointer Dereference'),(396,NULL,396,'Declaration of Catch for Generic Exception'),(397,NULL,397,'Declaration of Throws for Generic Exception'),(398,NULL,398,'Indicator of Poor Code Quality'),(399,NULL,399,'Resource Management Errors'),(400,NULL,400,'Uncontrolled Resource Consumption (\'Resource Exhaustion\')'),(401,NULL,401,'Improper Release of Memory Before Removing Last Reference (\'Memory Leak\')'),(402,NULL,402,'Transmission of Private Resources into a New Sphere (\'Resource Leak\')'),(403,NULL,403,'Exposure of File Descriptor to Unintended Control Sphere (\'File Descriptor Leak\')'),(404,NULL,404,'Improper Resource Shutdown or Release'),(405,NULL,405,'Asymmetric Resource Consumption (Amplification)'),(406,NULL,406,'Insufficient Control of Network Message Volume (Network Amplification)'),(407,NULL,407,'Algorithmic Complexity'),(408,NULL,408,'Incorrect Behavior Order: Early Amplification'),(409,NULL,409,'Improper Handling of Highly Compressed Data (Data Amplification)'),(410,NULL,410,'Insufficient Resource Pool'),(411,NULL,411,'Resource Locking Problems'),(412,NULL,412,'Unrestricted Externally Accessible Lock'),(413,NULL,413,'Improper Resource Locking'),(414,NULL,414,'Missing Lock Check'),(415,NULL,415,'Double Free'),(416,NULL,416,'Use After Free'),(417,NULL,417,'Channel and Path Errors'),(418,NULL,418,'Channel Errors'),(419,NULL,419,'Unprotected Primary Channel'),(420,NULL,420,'Unprotected Alternate Channel'),(421,NULL,421,'Race Condition During Access to Alternate Channel'),(422,NULL,422,'Unprotected Windows Messaging Channel (\'Shatter\')'),(423,NULL,423,'DEPRECATED (Duplicate): Proxied Trusted Channel'),(424,NULL,424,'Improper Protection of Alternate Path'),(425,NULL,425,'Direct Request (\'Forced Browsing\')'),(426,NULL,426,'Untrusted Search Path'),(427,NULL,427,'Uncontrolled Search Path Element'),(428,NULL,428,'Unquoted Search Path or Element'),(429,NULL,429,'Handler Errors'),(430,NULL,430,'Deployment of Wrong Handler'),(431,NULL,431,'Missing Handler'),(432,NULL,432,'Dangerous Signal Handler not Disabled During Sensitive Operations'),(433,NULL,433,'Unparsed Raw Web Content Delivery'),(434,NULL,434,'Unrestricted Upload of File with Dangerous Type'),(435,NULL,435,'Interaction Error'),(436,NULL,436,'Interpretation Conflict'),(437,NULL,437,'Incomplete Model of Endpoint Features'),(438,NULL,438,'Behavioral Problems'),(439,NULL,439,'Behavioral Change in New Version or Environment'),(440,NULL,440,'Expected Behavior Violation'),(441,NULL,441,'Unintended Proxy or Intermediary (\'Confused Deputy\')'),(442,NULL,442,'Web Problems'),(443,NULL,443,'DEPRECATED (Duplicate): HTTP response splitting'),(444,NULL,444,'Inconsistent Interpretation of HTTP Requests (\'HTTP Request Smuggling\')'),(445,NULL,445,'User Interface Errors'),(446,NULL,446,'UI Discrepancy for Security Feature'),(447,NULL,447,'Unimplemented or Unsupported Feature in UI'),(448,NULL,448,'Obsolete Feature in UI'),(449,NULL,449,'The UI Performs the Wrong Action'),(450,NULL,450,'Multiple Interpretations of UI Input'),(451,NULL,451,'User Interface (UI) Misrepresentation of Critical Information'),(452,NULL,452,'Initialization and Cleanup Errors'),(453,NULL,453,'Insecure Default Variable Initialization'),(454,NULL,454,'External Initialization of Trusted Variables or Data Stores'),(455,NULL,455,'Non-exit on Failed Initialization'),(456,NULL,456,'Missing Initialization of a Variable'),(457,NULL,457,'Use of Uninitialized Variable'),(458,NULL,458,'DEPRECATED: Incorrect Initialization'),(459,NULL,459,'Incomplete Cleanup'),(460,NULL,460,'Improper Cleanup on Thrown Exception'),(461,NULL,461,'Data Structure Issues'),(462,NULL,462,'Duplicate Key in Associative List (Alist)'),(463,NULL,463,'Deletion of Data Structure Sentinel'),(464,NULL,464,'Addition of Data Structure Sentinel'),(465,NULL,465,'Pointer Issues'),(466,NULL,466,'Return of Pointer Value Outside of Expected Range'),(467,NULL,467,'Use of sizeof() on a Pointer Type'),(468,NULL,468,'Incorrect Pointer Scaling'),(469,NULL,469,'Use of Pointer Subtraction to Determine Size'),(470,NULL,470,'Use of Externally-Controlled Input to Select Classes or Code (\'Unsafe Reflection\')'),(471,NULL,471,'Modification of Assumed-Immutable Data (MAID)'),(472,NULL,472,'External Control of Assumed-Immutable Web Parameter'),(473,NULL,473,'PHP External Variable Modification'),(474,NULL,474,'Use of Function with Inconsistent Implementations'),(475,NULL,475,'Undefined Behavior for Input to API'),(476,NULL,476,'NULL Pointer Dereference'),(477,NULL,477,'Use of Obsolete Functions'),(478,NULL,478,'Missing Default Case in Switch Statement'),(479,NULL,479,'Signal Handler Use of a Non-reentrant Function'),(480,NULL,480,'Use of Incorrect Operator'),(481,NULL,481,'Assigning instead of Comparing'),(482,NULL,482,'Comparing instead of Assigning'),(483,NULL,483,'Incorrect Block Delimitation'),(484,NULL,484,'Omitted Break Statement in Switch'),(485,NULL,485,'Insufficient Encapsulation'),(486,NULL,486,'Comparison of Classes by Name'),(487,NULL,487,'Reliance on Package-level Scope'),(488,NULL,488,'Exposure of Data Element to Wrong Session'),(489,NULL,489,'Leftover Debug Code'),(490,NULL,490,'Mobile Code Issues'),(491,NULL,491,'Public cloneable() Method Without Final (\'Object Hijack\')'),(492,NULL,492,'Use of Inner Class Containing Sensitive Data'),(493,NULL,493,'Critical Public Variable Without Final Modifier'),(494,NULL,494,'Download of Code Without Integrity Check'),(495,NULL,495,'Private Array-Typed Field Returned From A Public Method'),(496,NULL,496,'Public Data Assigned to Private Array-Typed Field'),(497,NULL,497,'Exposure of System Data to an Unauthorized Control Sphere'),(498,NULL,498,'Cloneable Class Containing Sensitive Information'),(499,NULL,499,'Serializable Class Containing Sensitive Data'),(500,NULL,500,'Public Static Field Not Marked Final'),(501,NULL,501,'Trust Boundary Violation'),(502,NULL,502,'Deserialization of Untrusted Data'),(503,NULL,503,'Byte/Object Code'),(504,NULL,504,'Motivation/Intent'),(505,NULL,505,'Intentionally Introduced Weakness'),(506,NULL,506,'Embedded Malicious Code'),(507,NULL,507,'Trojan Horse'),(508,NULL,508,'Non-Replicating Malicious Code'),(509,NULL,509,'Replicating Malicious Code (Virus or Worm)'),(510,NULL,510,'Trapdoor'),(511,NULL,511,'Logic/Time Bomb'),(512,NULL,512,'Spyware'),(513,NULL,513,'Intentionally Introduced Nonmalicious Weakness'),(514,NULL,514,'Covert Channel'),(515,NULL,515,'Covert Storage Channel'),(516,NULL,516,'DEPRECATED (Duplicate): Covert Timing Channel'),(517,NULL,517,'Other Intentional, Nonmalicious Weakness'),(518,NULL,518,'Inadvertently Introduced Weakness'),(519,NULL,519,'.NET Environment Issues'),(520,NULL,520,'.NET Misconfiguration: Use of Impersonation'),(521,NULL,521,'Weak Password Requirements'),(522,NULL,522,'Insufficiently Protected Credentials'),(523,NULL,523,'Unprotected Transport of Credentials'),(524,NULL,524,'Information Exposure Through Caching'),(525,NULL,525,'Information Exposure Through Browser Caching'),(526,NULL,526,'Information Exposure Through Environmental Variables'),(527,NULL,527,'Exposure of CVS Repository to an Unauthorized Control Sphere'),(528,NULL,528,'Exposure of Core Dump File to an Unauthorized Control Sphere'),(529,NULL,529,'Exposure of Access Control List Files to an Unauthorized Control Sphere'),(530,NULL,530,'Exposure of Backup File to an Unauthorized Control Sphere'),(531,NULL,531,'Information Exposure Through Test Code'),(532,NULL,532,'Information Exposure Through Log Files'),(533,NULL,533,'Information Exposure Through Server Log Files'),(534,NULL,534,'Information Exposure Through Debug Log Files'),(535,NULL,535,'Information Exposure Through Shell Error Message'),(536,NULL,536,'Information Exposure Through Servlet Runtime Error Message'),(537,NULL,537,'Information Exposure Through Java Runtime Error Message'),(538,NULL,538,'File and Directory Information Exposure'),(539,NULL,539,'Information Exposure Through Persistent Cookies'),(540,NULL,540,'Information Exposure Through Source Code'),(541,NULL,541,'Information Exposure Through Include Source Code'),(542,NULL,542,'Information Exposure Through Cleanup Log Files'),(543,NULL,543,'Use of Singleton Pattern Without Synchronization in a Multithreaded Context'),(544,NULL,544,'Missing Standardized Error Handling Mechanism'),(545,NULL,545,'Use of Dynamic Class Loading'),(546,NULL,546,'Suspicious Comment'),(547,NULL,547,'Use of Hard-coded, Security-relevant Constants'),(548,NULL,548,'Information Exposure Through Directory Listing'),(549,NULL,549,'Missing Password Field Masking'),(550,NULL,550,'Information Exposure Through Server Error Message'),(551,NULL,551,'Incorrect Behavior Order: Authorization Before Parsing and Canonicalization'),(552,NULL,552,'Files or Directories Accessible to External Parties'),(553,NULL,553,'Command Shell in Externally Accessible Directory'),(554,NULL,554,'ASP.NET Misconfiguration: Not Using Input Validation Framework'),(555,NULL,555,'J2EE Misconfiguration: Plaintext Password in Configuration File'),(556,NULL,556,'ASP.NET Misconfiguration: Use of Identity Impersonation'),(557,NULL,557,'Concurrency Issues'),(558,NULL,558,'Use of getlogin() in Multithreaded Application'),(559,NULL,559,'Often Misused: Arguments and Parameters'),(560,NULL,560,'Use of umask() with chmod-style Argument'),(561,NULL,561,'Dead Code'),(562,NULL,562,'Return of Stack Variable Address'),(563,NULL,563,'Assignment to Variable without Use (\'Unused Variable\')'),(564,NULL,564,'SQL Injection: Hibernate'),(565,NULL,565,'Reliance on Cookies without Validation and Integrity Checking'),(566,NULL,566,'Authorization Bypass Through User-Controlled SQL Primary Key'),(567,NULL,567,'Unsynchronized Access to Shared Data in a Multithreaded Context'),(568,NULL,568,'finalize() Method Without super.finalize()'),(569,NULL,569,'Expression Issues'),(570,NULL,570,'Expression is Always False'),(571,NULL,571,'Expression is Always True'),(572,NULL,572,'Call to Thread run() instead of start()'),(573,NULL,573,'Improper Following of Specification by Caller'),(574,NULL,574,'EJB Bad Practices: Use of Synchronization Primitives'),(575,NULL,575,'EJB Bad Practices: Use of AWT Swing'),(576,NULL,576,'EJB Bad Practices: Use of Java I/O'),(577,NULL,577,'EJB Bad Practices: Use of Sockets'),(578,NULL,578,'EJB Bad Practices: Use of Class Loader'),(579,NULL,579,'J2EE Bad Practices: Non-serializable Object Stored in Session'),(580,NULL,580,'clone() Method Without super.clone()'),(581,NULL,581,'Object Model Violation: Just One of Equals and Hashcode Defined'),(582,NULL,582,'Array Declared Public, Final, and Static'),(583,NULL,583,'finalize() Method Declared Public'),(584,NULL,584,'Return Inside Finally Block'),(585,NULL,585,'Empty Synchronized Block'),(586,NULL,586,'Explicit Call to Finalize()'),(587,NULL,587,'Assignment of a Fixed Address to a Pointer'),(588,NULL,588,'Attempt to Access Child of a Non-structure Pointer'),(589,NULL,589,'Call to Non-ubiquitous API'),(590,NULL,590,'Free of Memory not on the Heap'),(591,NULL,591,'Sensitive Data Storage in Improperly Locked Memory'),(592,NULL,592,'Authentication Bypass Issues'),(593,NULL,593,'Authentication Bypass: OpenSSL CTX Object Modified after SSL Objects are Created'),(594,NULL,594,'J2EE Framework: Saving Unserializable Objects to Disk'),(595,NULL,595,'Comparison of Object References Instead of Object Contents'),(596,NULL,596,'Incorrect Semantic Object Comparison'),(597,NULL,597,'Use of Wrong Operator in String Comparison'),(598,NULL,598,'Information Exposure Through Query Strings in GET Request'),(599,NULL,599,'Missing Validation of OpenSSL Certificate'),(600,NULL,600,'Uncaught Exception in Servlet'),(601,NULL,601,'URL Redirection to Untrusted Site (\'Open Redirect\')'),(602,NULL,602,'Client-Side Enforcement of Server-Side Security'),(603,NULL,603,'Use of Client-Side Authentication'),(604,NULL,604,'Deprecated Entries'),(605,NULL,605,'Multiple Binds to the Same Port'),(606,NULL,606,'Unchecked Input for Loop Condition'),(607,NULL,607,'Public Static Final Field References Mutable Object'),(608,NULL,608,'Struts: Non-private Field in ActionForm Class'),(609,NULL,609,'Double-Checked Locking'),(610,NULL,610,'Externally Controlled Reference to a Resource in Another Sphere'),(611,NULL,611,'Improper Restriction of XML External Entity Reference (\'XXE\')'),(612,NULL,612,'Information Exposure Through Indexing of Private Data'),(613,NULL,613,'Insufficient Session Expiration'),(614,NULL,614,'Sensitive Cookie in HTTPS Session Without \'Secure\' Attribute'),(615,NULL,615,'Information Exposure Through Comments'),(616,NULL,616,'Incomplete Identification of Uploaded File Variables (PHP)'),(617,NULL,617,'Reachable Assertion'),(618,NULL,618,'Exposed Unsafe ActiveX Method'),(619,NULL,619,'Dangling Database Cursor (\'Cursor Injection\')'),(620,NULL,620,'Unverified Password Change'),(621,NULL,621,'Variable Extraction Error'),(622,NULL,622,'Improper Validation of Function Hook Arguments'),(623,NULL,623,'Unsafe ActiveX Control Marked Safe For Scripting'),(624,NULL,624,'Executable Regular Expression Error'),(625,NULL,625,'Permissive Regular Expression'),(626,NULL,626,'Null Byte Interaction Error (Poison Null Byte)'),(627,NULL,627,'Dynamic Variable Evaluation'),(628,NULL,628,'Function Call with Incorrectly Specified Arguments'),(629,NULL,629,'Weaknesses in OWASP Top Ten (2007)'),(630,NULL,630,'Weaknesses Examined by SAMATE'),(631,NULL,631,'Resource-specific Weaknesses'),(632,NULL,632,'Weaknesses that Affect Files or Directories'),(633,NULL,633,'Weaknesses that Affect Memory'),(634,NULL,634,'Weaknesses that Affect System Processes'),(635,NULL,635,'Weaknesses Used by NVD'),(636,NULL,636,'Not Failing Securely (\'Failing Open\')'),(637,NULL,637,'Unnecessary Complexity in Protection Mechanism (Not Using \'Economy of Mechanism\')'),(638,NULL,638,'Not Using Complete Mediation'),(639,NULL,639,'Authorization Bypass Through User-Controlled Key'),(640,NULL,640,'Weak Password Recovery Mechanism for Forgotten Password'),(641,NULL,641,'Improper Restriction of Names for Files and Other Resources'),(642,NULL,642,'External Control of Critical State Data'),(643,NULL,643,'Improper Neutralization of Data within XPath Expressions (\'XPath Injection\')'),(644,NULL,644,'Improper Neutralization of HTTP Headers for Scripting Syntax'),(645,NULL,645,'Overly Restrictive Account Lockout Mechanism'),(646,NULL,646,'Reliance on File Name or Extension of Externally-Supplied File'),(647,NULL,647,'Use of Non-Canonical URL Paths for Authorization Decisions'),(648,NULL,648,'Incorrect Use of Privileged APIs'),(649,NULL,649,'Reliance on Obfuscation or Encryption of Security-Relevant Inputs without Integrity Checking'),(650,NULL,650,'Trusting HTTP Permission Methods on the Server Side'),(651,NULL,651,'Information Exposure Through WSDL File'),(652,NULL,652,'Improper Neutralization of Data within XQuery Expressions (\'XQuery Injection\')'),(653,NULL,653,'Insufficient Compartmentalization'),(654,NULL,654,'Reliance on a Single Factor in a Security Decision'),(655,NULL,655,'Insufficient Psychological Acceptability'),(656,NULL,656,'Reliance on Security Through Obscurity'),(657,NULL,657,'Violation of Secure Design Principles'),(658,NULL,658,'Weaknesses in Software Written in C'),(659,NULL,659,'Weaknesses in Software Written in C++'),(660,NULL,660,'Weaknesses in Software Written in Java'),(661,NULL,661,'Weaknesses in Software Written in PHP'),(662,NULL,662,'Improper Synchronization'),(663,NULL,663,'Use of a Non-reentrant Function in a Concurrent Context'),(664,NULL,664,'Improper Control of a Resource Through its Lifetime'),(665,NULL,665,'Improper Initialization'),(666,NULL,666,'Operation on Resource in Wrong Phase of Lifetime'),(667,NULL,667,'Improper Locking'),(668,NULL,668,'Exposure of Resource to Wrong Sphere'),(669,NULL,669,'Incorrect Resource Transfer Between Spheres'),(670,NULL,670,'Always-Incorrect Control Flow Implementation'),(671,NULL,671,'Lack of Administrator Control over Security'),(672,NULL,672,'Operation on a Resource after Expiration or Release'),(673,NULL,673,'External Influence of Sphere Definition'),(674,NULL,674,'Uncontrolled Recursion'),(675,NULL,675,'Duplicate Operations on Resource'),(676,NULL,676,'Use of Potentially Dangerous Function'),(677,NULL,677,'Weakness Base Elements'),(678,NULL,678,'Composites'),(679,NULL,679,'Chain Elements'),(680,NULL,680,'Integer Overflow to Buffer Overflow'),(681,NULL,681,'Incorrect Conversion between Numeric Types'),(682,NULL,682,'Incorrect Calculation'),(683,NULL,683,'Function Call With Incorrect Order of Arguments'),(684,NULL,684,'Incorrect Provision of Specified Functionality'),(685,NULL,685,'Function Call With Incorrect Number of Arguments'),(686,NULL,686,'Function Call With Incorrect Argument Type'),(687,NULL,687,'Function Call With Incorrectly Specified Argument Value'),(688,NULL,688,'Function Call With Incorrect Variable or Reference as Argument'),(689,NULL,689,'Permission Race Condition During Resource Copy'),(690,NULL,690,'Unchecked Return Value to NULL Pointer Dereference'),(691,NULL,691,'Insufficient Control Flow Management'),(692,NULL,692,'Incomplete Blacklist to Cross-Site Scripting'),(693,NULL,693,'Protection Mechanism Failure'),(694,NULL,694,'Use of Multiple Resources with Duplicate Identifier'),(695,NULL,695,'Use of Low-Level Functionality'),(696,NULL,696,'Incorrect Behavior Order'),(697,NULL,697,'Insufficient Comparison'),(698,NULL,698,'Execution After Redirect (EAR)'),(699,NULL,699,'Development Concepts'),(700,NULL,700,'Seven Pernicious Kingdoms'),(701,NULL,701,'Weaknesses Introduced During Design'),(702,NULL,702,'Weaknesses Introduced During Implementation'),(703,NULL,703,'Improper Check or Handling of Exceptional Conditions'),(704,NULL,704,'Incorrect Type Conversion or Cast'),(705,NULL,705,'Incorrect Control Flow Scoping'),(706,NULL,706,'Use of Incorrectly-Resolved Name or Reference'),(707,NULL,707,'Improper Enforcement of Message or Data Structure'),(708,NULL,708,'Incorrect Ownership Assignment'),(709,NULL,709,'Named Chains'),(710,NULL,710,'Coding Standards Violation'),(711,NULL,711,'Weaknesses in OWASP Top Ten (2004)'),(712,NULL,712,'OWASP Top Ten 2007 Category A1 - Cross Site Scripting (XSS)'),(713,NULL,713,'OWASP Top Ten 2007 Category A2 - Injection Flaws'),(714,NULL,714,'OWASP Top Ten 2007 Category A3 - Malicious File Execution'),(715,NULL,715,'OWASP Top Ten 2007 Category A4 - Insecure Direct Object Reference'),(716,NULL,716,'OWASP Top Ten 2007 Category A5 - Cross Site Request Forgery (CSRF)'),(717,NULL,717,'OWASP Top Ten 2007 Category A6 - Information Leakage and Improper Error Handling'),(718,NULL,718,'OWASP Top Ten 2007 Category A7 - Broken Authentication and Session Management'),(719,NULL,719,'OWASP Top Ten 2007 Category A8 - Insecure Cryptographic Storage'),(720,NULL,720,'OWASP Top Ten 2007 Category A9 - Insecure Communications'),(721,NULL,721,'OWASP Top Ten 2007 Category A10 - Failure to Restrict URL Access'),(722,NULL,722,'OWASP Top Ten 2004 Category A1 - Unvalidated Input'),(723,NULL,723,'OWASP Top Ten 2004 Category A2 - Broken Access Control'),(724,NULL,724,'OWASP Top Ten 2004 Category A3 - Broken Authentication and Session Management'),(725,NULL,725,'OWASP Top Ten 2004 Category A4 - Cross-Site Scripting (XSS) Flaws'),(726,NULL,726,'OWASP Top Ten 2004 Category A5 - Buffer Overflows'),(727,NULL,727,'OWASP Top Ten 2004 Category A6 - Injection Flaws'),(728,NULL,728,'OWASP Top Ten 2004 Category A7 - Improper Error Handling'),(729,NULL,729,'OWASP Top Ten 2004 Category A8 - Insecure Storage'),(730,NULL,730,'OWASP Top Ten 2004 Category A9 - Denial of Service'),(731,NULL,731,'OWASP Top Ten 2004 Category A10 - Insecure Configuration Management'),(732,NULL,732,'Incorrect Permission Assignment for Critical Resource'),(733,NULL,733,'Compiler Optimization Removal or Modification of Security-critical Code'),(734,NULL,734,'Weaknesses Addressed by the CERT C Secure Coding Standard'),(735,NULL,735,'CERT C Secure Coding Section 01 - Preprocessor (PRE)'),(736,NULL,736,'CERT C Secure Coding Section 02 - Declarations and Initialization (DCL)'),(737,NULL,737,'CERT C Secure Coding Section 03 - Expressions (EXP)'),(738,NULL,738,'CERT C Secure Coding Section 04 - Integers (INT)'),(739,NULL,739,'CERT C Secure Coding Section 05 - Floating Point (FLP)'),(740,NULL,740,'CERT C Secure Coding Section 06 - Arrays (ARR)'),(741,NULL,741,'CERT C Secure Coding Section 07 - Characters and Strings (STR)'),(742,NULL,742,'CERT C Secure Coding Section 08 - Memory Management (MEM)'),(743,NULL,743,'CERT C Secure Coding Section 09 - Input Output (FIO)'),(744,NULL,744,'CERT C Secure Coding Section 10 - Environment (ENV)'),(745,NULL,745,'CERT C Secure Coding Section 11 - Signals (SIG)'),(746,NULL,746,'CERT C Secure Coding Section 12 - Error Handling (ERR)'),(747,NULL,747,'CERT C Secure Coding Section 49 - Miscellaneous (MSC)'),(748,NULL,748,'CERT C Secure Coding Section 50 - POSIX (POS)'),(749,NULL,749,'Exposed Dangerous Method or Function'),(750,NULL,750,'Weaknesses in the 2009 CWE/SANS Top 25 Most Dangerous Programming Errors'),(751,NULL,751,'2009 Top 25 - Insecure Interaction Between Components'),(752,NULL,752,'2009 Top 25 - Risky Resource Management'),(753,NULL,753,'2009 Top 25 - Porous Defenses'),(754,NULL,754,'Improper Check for Unusual or Exceptional Conditions'),(755,NULL,755,'Improper Handling of Exceptional Conditions'),(756,NULL,756,'Missing Custom Error Page'),(757,NULL,757,'Selection of Less-Secure Algorithm During Negotiation (\'Algorithm Downgrade\')'),(758,NULL,758,'Reliance on Undefined, Unspecified, or Implementation-Defined Behavior'),(759,NULL,759,'Use of a One-Way Hash without a Salt'),(760,NULL,760,'Use of a One-Way Hash with a Predictable Salt'),(761,NULL,761,'Free of Pointer not at Start of Buffer'),(762,NULL,762,'Mismatched Memory Management Routines'),(763,NULL,763,'Release of Invalid Pointer or Reference'),(764,NULL,764,'Multiple Locks of a Critical Resource'),(765,NULL,765,'Multiple Unlocks of a Critical Resource'),(766,NULL,766,'Critical Variable Declared Public'),(767,NULL,767,'Access to Critical Private Variable via Public Method'),(768,NULL,768,'Incorrect Short Circuit Evaluation'),(769,NULL,769,'File Descriptor Exhaustion'),(770,NULL,770,'Allocation of Resources Without Limits or Throttling'),(771,NULL,771,'Missing Reference to Active Allocated Resource'),(772,NULL,772,'Missing Release of Resource after Effective Lifetime'),(773,NULL,773,'Missing Reference to Active File Descriptor or Handle'),(774,NULL,774,'Allocation of File Descriptors or Handles Without Limits or Throttling'),(775,NULL,775,'Missing Release of File Descriptor or Handle after Effective Lifetime'),(776,NULL,776,'Improper Restriction of Recursive Entity References in DTDs (\'XML Entity Expansion\')'),(777,NULL,777,'Regular Expression without Anchors'),(778,NULL,778,'Insufficient Logging'),(779,NULL,779,'Logging of Excessive Data'),(780,NULL,780,'Use of RSA Algorithm without OAEP'),(781,NULL,781,'Improper Address Validation in IOCTL with METHOD_NEITHER I/O Control Code'),(782,NULL,782,'Exposed IOCTL with Insufficient Access Control'),(783,NULL,783,'Operator Precedence Logic Error'),(784,NULL,784,'Reliance on Cookies without Validation and Integrity Checking in a Security Decision'),(785,NULL,785,'Use of Path Manipulation Function without Maximum-sized Buffer'),(786,NULL,786,'Access of Memory Location Before Start of Buffer'),(787,NULL,787,'Out-of-bounds Write'),(788,NULL,788,'Access of Memory Location After End of Buffer'),(789,NULL,789,'Uncontrolled Memory Allocation'),(790,NULL,790,'Improper Filtering of Special Elements'),(791,NULL,791,'Incomplete Filtering of Special Elements'),(792,NULL,792,'Incomplete Filtering of One or More Instances of Special Elements'),(793,NULL,793,'Only Filtering One Instance of a Special Element'),(794,NULL,794,'Incomplete Filtering of Multiple Instances of Special Elements'),(795,NULL,795,'Only Filtering Special Elements at a Specified Location'),(796,NULL,796,'Only Filtering Special Elements Relative to a Marker'),(797,NULL,797,'Only Filtering Special Elements at an Absolute Position'),(798,NULL,798,'Use of Hard-coded Credentials'),(799,NULL,799,'Improper Control of Interaction Frequency'),(800,NULL,800,'Weaknesses in the 2010 CWE/SANS Top 25 Most Dangerous Programming Errors'),(801,NULL,801,'2010 Top 25 - Insecure Interaction Between Components'),(802,NULL,802,'2010 Top 25 - Risky Resource Management'),(803,NULL,803,'2010 Top 25 - Porous Defenses'),(804,NULL,804,'Guessable CAPTCHA'),(805,NULL,805,'Buffer Access with Incorrect Length Value'),(806,NULL,806,'Buffer Access Using Size of Source Buffer'),(807,NULL,807,'Reliance on Untrusted Inputs in a Security Decision'),(808,NULL,808,'2010 Top 25 - Weaknesses On the Cusp'),(809,NULL,809,'Weaknesses in OWASP Top Ten (2010)'),(810,NULL,810,'OWASP Top Ten 2010 Category A1 - Injection'),(811,NULL,811,'OWASP Top Ten 2010 Category A2 - Cross-Site Scripting (XSS)'),(812,NULL,812,'OWASP Top Ten 2010 Category A3 - Broken Authentication and Session Management'),(813,NULL,813,'OWASP Top Ten 2010 Category A4 - Insecure Direct Object References'),(814,NULL,814,'OWASP Top Ten 2010 Category A5 - Cross-Site Request Forgery(CSRF)'),(815,NULL,815,'OWASP Top Ten 2010 Category A6 - Security Misconfiguration'),(816,NULL,816,'OWASP Top Ten 2010 Category A7 - Insecure Cryptographic Storage'),(817,NULL,817,'OWASP Top Ten 2010 Category A8 - Failure to Restrict URL Access'),(818,NULL,818,'OWASP Top Ten 2010 Category A9 - Insufficient Transport Layer Protection'),(819,NULL,819,'OWASP Top Ten 2010 Category A10 - Unvalidated Redirects and Forwards'),(820,NULL,820,'Missing Synchronization'),(821,NULL,821,'Incorrect Synchronization'),(822,NULL,822,'Untrusted Pointer Dereference'),(823,NULL,823,'Use of Out-of-range Pointer Offset'),(824,NULL,824,'Access of Uninitialized Pointer'),(825,NULL,825,'Expired Pointer Dereference'),(826,NULL,826,'Premature Release of Resource During Expected Lifetime'),(827,NULL,827,'Improper Control of Document Type Definition'),(828,NULL,828,'Signal Handler with Functionality that is not Asynchronous-Safe'),(829,NULL,829,'Inclusion of Functionality from Untrusted Control Sphere'),(830,NULL,830,'Inclusion of Web Functionality from an Untrusted Source'),(831,NULL,831,'Signal Handler Function Associated with Multiple Signals'),(832,NULL,832,'Unlock of a Resource that is not Locked'),(833,NULL,833,'Deadlock'),(834,NULL,834,'Excessive Iteration'),(835,NULL,835,'Loop with Unreachable Exit Condition (\'Infinite Loop\')'),(836,NULL,836,'Use of Password Hash Instead of Password for Authentication'),(837,NULL,837,'Improper Enforcement of a Single, Unique Action'),(838,NULL,838,'Inappropriate Encoding for Output Context'),(839,NULL,839,'Numeric Range Comparison Without Minimum Check'),(840,NULL,840,'Business Logic Errors'),(841,NULL,841,'Improper Enforcement of Behavioral Workflow'),(842,NULL,842,'Placement of User into Incorrect Group'),(843,NULL,843,'Access of Resource Using Incompatible Type (\'Type Confusion\')'),(844,NULL,844,'Weaknesses Addressed by the CERT Java Secure Coding Standard'),(845,NULL,845,'CERT Java Secure Coding Section 00 - Input Validation and Data Sanitization (IDS)'),(846,NULL,846,'CERT Java Secure Coding Section 01 - Declarations and Initialization (DCL)'),(847,NULL,847,'CERT Java Secure Coding Section 02 - Expressions (EXP)'),(848,NULL,848,'CERT Java Secure Coding Section 03 - Numeric Types and Operations (NUM)'),(849,NULL,849,'CERT Java Secure Coding Section 04 - Object Orientation (OBJ)'),(850,NULL,850,'CERT Java Secure Coding Section 05 - Methods (MET)'),(851,NULL,851,'CERT Java Secure Coding Section 06 - Exceptional Behavior (ERR)'),(852,NULL,852,'CERT Java Secure Coding Section 07 - Visibility and Atomicity (VNA)'),(853,NULL,853,'CERT Java Secure Coding Section 08 - Locking (LCK)'),(854,NULL,854,'CERT Java Secure Coding Section 09 - Thread APIs (THI)'),(855,NULL,855,'CERT Java Secure Coding Section 10 - Thread Pools (TPS)'),(856,NULL,856,'CERT Java Secure Coding Section 11 - Thread-Safety Miscellaneous (TSM)'),(857,NULL,857,'CERT Java Secure Coding Section 12 - Input Output (FIO)'),(858,NULL,858,'CERT Java Secure Coding Section 13 - Serialization (SER)'),(859,NULL,859,'CERT Java Secure Coding Section 14 - Platform Security (SEC)'),(860,NULL,860,'CERT Java Secure Coding Section 15 - Runtime Environment (ENV)'),(861,NULL,861,'CERT Java Secure Coding Section 49 - Miscellaneous (MSC)'),(862,NULL,862,'Missing Authorization'),(863,NULL,863,'Incorrect Authorization'),(864,NULL,864,'2011 Top 25 - Insecure Interaction Between Components'),(865,NULL,865,'2011 Top 25 - Risky Resource Management'),(866,NULL,866,'2011 Top 25 - Porous Defenses'),(867,NULL,867,'2011 Top 25 - Weaknesses On the Cusp'),(868,NULL,868,'Weaknesses Addressed by the CERT C++ Secure Coding Standard'),(869,NULL,869,'CERT C++ Secure Coding Section 01 - Preprocessor (PRE)'),(870,NULL,870,'CERT C++ Secure Coding Section 02 - Declarations and Initialization (DCL)'),(871,NULL,871,'CERT C++ Secure Coding Section 03 - Expressions (EXP)'),(872,NULL,872,'CERT C++ Secure Coding Section 04 - Integers (INT)'),(873,NULL,873,'CERT C++ Secure Coding Section 05 - Floating Point Arithmetic (FLP)'),(874,NULL,874,'CERT C++ Secure Coding Section 06 - Arrays and the STL (ARR)'),(875,NULL,875,'CERT C++ Secure Coding Section 07 - Characters and Strings (STR)'),(876,NULL,876,'CERT C++ Secure Coding Section 08 - Memory Management (MEM)'),(877,NULL,877,'CERT C++ Secure Coding Section 09 - Input Output (FIO)'),(878,NULL,878,'CERT C++ Secure Coding Section 10 - Environment (ENV)'),(879,NULL,879,'CERT C++ Secure Coding Section 11 - Signals (SIG)'),(880,NULL,880,'CERT C++ Secure Coding Section 12 - Exceptions and Error Handling (ERR)'),(881,NULL,881,'CERT C++ Secure Coding Section 13 - Object Oriented Programming (OOP)'),(882,NULL,882,'CERT C++ Secure Coding Section 14 - Concurrency (CON)'),(883,NULL,883,'CERT C++ Secure Coding Section 49 - Miscellaneous (MSC)'),(884,NULL,884,'CWE Cross-section'),(885,NULL,885,'SFP Primary Cluster: Risky Values'),(886,NULL,886,'SFP Primary Cluster: Unused entities'),(887,NULL,887,'SFP Primary Cluster: API'),(888,NULL,888,'Software Fault Pattern (SFP) Clusters'),(889,NULL,889,'SFP Primary Cluster: Exception Management'),(890,NULL,890,'SFP Primary Cluster: Memory Access'),(891,NULL,891,'SFP Primary Cluster: Memory Management'),(892,NULL,892,'SFP Primary Cluster: Resource Management'),(893,NULL,893,'SFP Primary Cluster: Path Resolution'),(894,NULL,894,'SFP Primary Cluster: Synchronization'),(895,NULL,895,'SFP Primary Cluster: Information Leak'),(896,NULL,896,'SFP Primary Cluster: Tainted Input'),(897,NULL,897,'SFP Primary Cluster: Entry Points'),(898,NULL,898,'SFP Primary Cluster: Authentication'),(899,NULL,899,'SFP Primary Cluster: Access Control'),(900,NULL,900,'Weaknesses in the 2011 CWE/SANS Top 25 Most Dangerous Software Errors'),(901,NULL,901,'SFP Primary Cluster: Privilege'),(902,NULL,902,'SFP Primary Cluster: Channel'),(903,NULL,903,'SFP Primary Cluster: Cryptography'),(904,NULL,904,'SFP Primary Cluster: Malware'),(905,NULL,905,'SFP Primary Cluster: Predictability'),(906,NULL,906,'SFP Primary Cluster: UI'),(907,NULL,907,'SFP Primary Cluster: Other'),(908,NULL,908,'Use of Uninitialized Resource'),(909,NULL,909,'Missing Initialization of Resource'),(910,NULL,910,'Use of Expired File Descriptor'),(911,NULL,911,'Improper Update of Reference Count'),(912,NULL,912,'Hidden Functionality'),(913,NULL,913,'Improper Control of Dynamically-Managed Code Resources'),(914,NULL,914,'Improper Control of Dynamically-Identified Variables'),(915,NULL,915,'Improperly Controlled Modification of Dynamically-Determined Object Attributes'),(916,NULL,916,'Use of Password Hash With Insufficient Computational Effort'),(917,NULL,917,'Improper Neutralization of Special Elements used in an Expression Language Statement (\'Expression Language Injection\')'),(918,NULL,918,'Server-Side Request Forgery (SSRF)'),(919,NULL,919,'Weaknesses in Mobile Applications'),(920,NULL,920,'Improper Restriction of Power Consumption'),(921,NULL,921,'Storage of Sensitive Data in a Mechanism without Access Control'),(922,NULL,922,'Insecure Storage of Sensitive Information'),(923,NULL,923,'Improper Restriction of Communication Channel to Intended Endpoints'),(924,NULL,924,'Improper Enforcement of Message Integrity During Transmission in a Communication Channel'),(925,NULL,925,'Improper Verification of Intent by Broadcast Receiver'),(926,NULL,926,'Improper Export of Android Application Components'),(927,NULL,927,'Use of Implicit Intent for Sensitive Communication'),(928,NULL,928,'Weaknesses in OWASP Top Ten (2013)'),(929,NULL,929,'OWASP Top Ten 2013 Category A1 - Injection'),(930,NULL,930,'OWASP Top Ten 2013 Category A2 - Broken Authentication and Session Management'),(931,NULL,931,'OWASP Top Ten 2013 Category A3 - Cross-Site Scripting (XSS)'),(932,NULL,932,'OWASP Top Ten 2013 Category A4 - Insecure Direct Object References'),(933,NULL,933,'OWASP Top Ten 2013 Category A5 - Security Misconfiguration'),(934,NULL,934,'OWASP Top Ten 2013 Category A6 - Sensitive Data Exposure'),(935,NULL,935,'OWASP Top Ten 2013 Category A7 - Missing Function Level Access Control'),(936,NULL,936,'OWASP Top Ten 2013 Category A8 - Cross-Site Request Forgery (CSRF)'),(937,NULL,937,'OWASP Top Ten 2013 Category A9 - Using Components with Known Vulnerabilities'),(938,NULL,938,'OWASP Top Ten 2013 Category A10 - Unvalidated Redirects and Forwards'),(939,NULL,1000,'Improper Authorization in Handler for Custom URL Scheme'),(940,NULL,2000,'Improper Verification of Source of a Communication Channel'),(941,NULL,941,'Incorrectly Specified Destination in a Communication Channel'),(942,NULL,944,'Overly Permissive Cross-domain Whitelist'),(943,NULL,945,'Improper Neutralization of Special Elements in Data Query Logic'),(944,NULL,946,'SFP Secondary Cluster: Insecure Resource Permissions'),(945,NULL,947,'SFP Secondary Cluster: Authentication Bypass'),(946,NULL,948,'SFP Secondary Cluster: Digital Certificate'),(947,NULL,949,'SFP Secondary Cluster: Faulty Endpoint Authentication'),(948,NULL,950,'SFP Secondary Cluster: Hardcoded Sensitive Data'),(949,NULL,951,'SFP Secondary Cluster: Insecure Authentication Policy'),(950,NULL,952,'SFP Secondary Cluster: Missing Authentication'),(951,NULL,953,'SFP Secondary Cluster: Missing Endpoint Authentication'),(952,NULL,954,'SFP Secondary Cluster: Multiple Binds to the Same Port'),(953,NULL,955,'SFP Secondary Cluster: Unrestricted Authentication'),(954,NULL,956,'SFP Secondary Cluster: Channel Attack'),(955,NULL,957,'SFP Secondary Cluster: Protocol Error'),(956,NULL,958,'SFP Secondary Cluster: Broken Cryptography'),(957,NULL,959,'SFP Secondary Cluster: Weak Cryptography'),(958,NULL,960,'SFP Secondary Cluster: Ambiguous Exception Type'),(959,NULL,961,'SFP Secondary Cluster: Incorrect Exception Behavior'),(960,NULL,962,'SFP Secondary Cluster: Unchecked Status Condition'),(961,NULL,963,'SFP Secondary Cluster: Exposed Data'),(962,NULL,964,'SFP Secondary Cluster: Exposure Temporary File'),(963,NULL,965,'SFP Secondary Cluster: Insecure Session Management'),(964,NULL,966,'SFP Secondary Cluster: Other Exposures'),(965,NULL,967,'SFP Secondary Cluster: State Disclosure'),(966,NULL,968,'SFP Secondary Cluster: Covert Channel'),(967,NULL,969,'SFP Secondary Cluster: Faulty Memory Release'),(968,NULL,970,'SFP Secondary Cluster: Faulty Buffer Access'),(969,NULL,971,'SFP Secondary Cluster: Faulty Pointer Use'),(970,NULL,972,'SFP Secondary Cluster: Faulty String Expansion'),(971,NULL,973,'SFP Secondary Cluster: Improper NULL Termination'),(972,NULL,974,'SFP Secondary Cluster: Incorrect Buffer Length Computation'),(973,NULL,975,'SFP Secondary Cluster: Architecture'),(974,NULL,976,'SFP Secondary Cluster: Compiler'),(975,NULL,977,'SFP Secondary Cluster: Design'),(976,NULL,978,'SFP Secondary Cluster: Implementation'),(977,NULL,979,'SFP Secondary Cluster: Failed Chroot Jail'),(978,NULL,980,'SFP Secondary Cluster: Link in Resource Name Resolution'),(979,NULL,981,'SFP Secondary Cluster: Path Traversal'),(980,NULL,982,'SFP Secondary Cluster: Failure to Release Resource'),(981,NULL,983,'SFP Secondary Cluster: Faulty Resource Use'),(982,NULL,984,'SFP Secondary Cluster: Life Cycle'),(983,NULL,985,'SFP Secondary Cluster: Unrestricted Consumption'),(984,NULL,986,'SFP Secondary Cluster: Missing Lock'),(985,NULL,987,'SFP Secondary Cluster: Multiple Locks/Unlocks'),(986,NULL,988,'SFP Secondary Cluster: Race Condition Window'),(987,NULL,989,'SFP Secondary Cluster: Unrestricted Lock'),(988,NULL,990,'SFP Secondary Cluster: Tainted Input to Command'),(989,NULL,991,'SFP Secondary Cluster: Tainted Input to Environment'),(990,NULL,992,'SFP Secondary Cluster: Faulty Input Transformation'),(991,NULL,993,'SFP Secondary Cluster: Incorrect Input Handling'),(992,NULL,994,'SFP Secondary Cluster: Tainted Input to Variable'),(993,NULL,995,'SFP Secondary Cluster: Feature'),(994,NULL,996,'SFP Secondary Cluster: Security'),(995,NULL,997,'SFP Secondary Cluster: Information Loss'),(996,NULL,998,'SFP Secondary Cluster: Glitch in Computation'),(997,NULL,999,'Weaknesses without Software Fault Patterns'),(998,NULL,1001,'SFP Secondary Cluster: Use of an Improper API'),(999,NULL,1002,'SFP Secondary Cluster: Unexpected Entry Points');
/*!40000 ALTER TABLE `GenericVulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `hasGlobalAccess` bit(1) DEFAULT NULL,
  `ldapGroup` bit(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7FA2C5F4D03E73C6` (`roleId`),
  CONSTRAINT `FK7FA2C5F4D03E73C6` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobStatus`
--

DROP TABLE IF EXISTS `JobStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endDate` datetime DEFAULT NULL,
  `hasStartedProcessing` bit(1) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `open` bit(1) NOT NULL,
  `scanDate` datetime DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `status` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlPath` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urlText` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationChannelId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBABFF5EFD1ED50A0` (`applicationChannelId`),
  CONSTRAINT `FKBABFF5EFD1ED50A0` FOREIGN KEY (`applicationChannelId`) REFERENCES `ApplicationChannel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobStatus`
--

LOCK TABLES `JobStatus` WRITE;
/*!40000 ALTER TABLE `JobStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `criticalVulnCount` int(11) DEFAULT NULL,
  `highVulnCount` int(11) DEFAULT NULL,
  `infoVulnCount` int(11) DEFAULT NULL,
  `lowVulnCount` int(11) DEFAULT NULL,
  `mediumVulnCount` int(11) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalVulnCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy`
--

DROP TABLE IF EXISTS `Policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sendEmail` bit(1) DEFAULT NULL,
  `filterJsonBlobId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ED291526EF3A94` (`filterJsonBlobId`),
  CONSTRAINT `FK8ED291526EF3A94` FOREIGN KEY (`filterJsonBlobId`) REFERENCES `FilterJsonBlob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy`
--

LOCK TABLES `Policy` WRITE;
/*!40000 ALTER TABLE `Policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyEmailAddress`
--

DROP TABLE IF EXISTS `PolicyEmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PolicyEmailAddress` (
  `PolicyId` int(11) NOT NULL,
  `emailAddress` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FK4A6F5B2AE77AAA7E` (`PolicyId`),
  CONSTRAINT `FK4A6F5B2AE77AAA7E` FOREIGN KEY (`PolicyId`) REFERENCES `Policy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyEmailAddress`
--

LOCK TABLES `PolicyEmailAddress` WRITE;
/*!40000 ALTER TABLE `PolicyEmailAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `PolicyEmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyStatus`
--

DROP TABLE IF EXISTS `PolicyStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PolicyStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `passing` bit(1) DEFAULT NULL,
  `sendEmail` bit(1) DEFAULT NULL,
  `Application_Id` int(11) NOT NULL,
  `Policy_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Application_Id` (`Application_Id`,`Policy_Id`),
  KEY `FK96D387E47D4477DB` (`Application_Id`),
  KEY `FK96D387E430DFFFF9` (`Policy_Id`),
  CONSTRAINT `FK96D387E430DFFFF9` FOREIGN KEY (`Policy_Id`) REFERENCES `Policy` (`id`),
  CONSTRAINT `FK96D387E47D4477DB` FOREIGN KEY (`Application_Id`) REFERENCES `Application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyStatus`
--

LOCK TABLES `PolicyStatus` WRITE;
/*!40000 ALTER TABLE `PolicyStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `PolicyStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyStatusEmailAddress`
--

DROP TABLE IF EXISTS `PolicyStatusEmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PolicyStatusEmailAddress` (
  `PolicyStatusId` int(11) NOT NULL,
  `emailAddress` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FK416906BC6E262BC2` (`PolicyStatusId`),
  CONSTRAINT `FK416906BC6E262BC2` FOREIGN KEY (`PolicyStatusId`) REFERENCES `PolicyStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyStatusEmailAddress`
--

LOCK TABLES `PolicyStatusEmailAddress` WRITE;
/*!40000 ALTER TABLE `PolicyStatusEmailAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `PolicyStatusEmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyStatus_EmailList`
--

DROP TABLE IF EXISTS `PolicyStatus_EmailList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PolicyStatus_EmailList` (
  `PolicyStatus_id` int(11) NOT NULL,
  `emailLists_id` int(11) NOT NULL,
  KEY `FK3E18579F9C458799` (`PolicyStatus_id`),
  KEY `FK3E18579F603FA01C` (`emailLists_id`),
  CONSTRAINT `FK3E18579F603FA01C` FOREIGN KEY (`emailLists_id`) REFERENCES `EmailList` (`id`),
  CONSTRAINT `FK3E18579F9C458799` FOREIGN KEY (`PolicyStatus_id`) REFERENCES `PolicyStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyStatus_EmailList`
--

LOCK TABLES `PolicyStatus_EmailList` WRITE;
/*!40000 ALTER TABLE `PolicyStatus_EmailList` DISABLE KEYS */;
/*!40000 ALTER TABLE `PolicyStatus_EmailList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy_EmailList`
--

DROP TABLE IF EXISTS `Policy_EmailList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Policy_EmailList` (
  `Policy_id` int(11) NOT NULL,
  `emailLists_id` int(11) NOT NULL,
  KEY `FK87E4EF8DB96DE3F9` (`Policy_id`),
  KEY `FK87E4EF8D603FA01C` (`emailLists_id`),
  CONSTRAINT `FK87E4EF8D603FA01C` FOREIGN KEY (`emailLists_id`) REFERENCES `EmailList` (`id`),
  CONSTRAINT `FK87E4EF8DB96DE3F9` FOREIGN KEY (`Policy_id`) REFERENCES `Policy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy_EmailList`
--

LOCK TABLES `Policy_EmailList` WRITE;
/*!40000 ALTER TABLE `Policy_EmailList` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy_EmailList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemoteProviderApplication`
--

DROP TABLE IF EXISTS `RemoteProviderApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RemoteProviderApplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `customName` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastImportTime` datetime DEFAULT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reportUrl` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `applicationChannel_id` int(11) DEFAULT NULL,
  `remoteProviderTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4EE0459844BD9B9` (`applicationChannel_id`),
  KEY `FKE4EE0459C96E039C` (`applicationId`),
  KEY `FKE4EE04599D3715FC` (`remoteProviderTypeId`),
  CONSTRAINT `FKE4EE04599D3715FC` FOREIGN KEY (`remoteProviderTypeId`) REFERENCES `RemoteProviderType` (`id`),
  CONSTRAINT `FKE4EE0459844BD9B9` FOREIGN KEY (`applicationChannel_id`) REFERENCES `ApplicationChannel` (`id`),
  CONSTRAINT `FKE4EE0459C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemoteProviderApplication`
--

LOCK TABLES `RemoteProviderApplication` WRITE;
/*!40000 ALTER TABLE `RemoteProviderApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `RemoteProviderApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemoteProviderAuthenticationField`
--

DROP TABLE IF EXISTS `RemoteProviderAuthenticationField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RemoteProviderAuthenticationField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encryptedValue` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `secret` bit(1) DEFAULT NULL,
  `value` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDF097F6B4E5D4B9B` (`applicationId`),
  CONSTRAINT `FKDF097F6B4E5D4B9B` FOREIGN KEY (`applicationId`) REFERENCES `RemoteProviderType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemoteProviderAuthenticationField`
--

LOCK TABLES `RemoteProviderAuthenticationField` WRITE;
/*!40000 ALTER TABLE `RemoteProviderAuthenticationField` DISABLE KEYS */;
INSERT INTO `RemoteProviderAuthenticationField` VALUES (1,NULL,'Username',NULL,'','\0',NULL,4),(2,NULL,'API Key',NULL,'','',NULL,4),(3,NULL,'Service Key',NULL,'','',NULL,4),(4,NULL,'URL','http://api.cs.sonatype.com:8070','','\0',NULL,5),(5,NULL,'Username',NULL,'','\0',NULL,5),(6,NULL,'Password',NULL,'','',NULL,5),(7,NULL,'Client Secret',NULL,'\0','\0',NULL,6),(8,NULL,'Access Token',NULL,'\0','\0',NULL,6),(9,NULL,'URL','http://appscan.threadfix.com:8080','','\0',NULL,7),(10,NULL,'Username',NULL,'','\0',NULL,7),(11,NULL,'Password',NULL,'','',NULL,7),(12,NULL,'API Key',NULL,'','',NULL,8);
/*!40000 ALTER TABLE `RemoteProviderAuthenticationField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RemoteProviderType`
--

DROP TABLE IF EXISTS `RemoteProviderType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RemoteProviderType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypted` bit(1) NOT NULL,
  `encryptedApiKey` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedPassword` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryptedUsername` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasApiKey` bit(1) NOT NULL,
  `hasUserNamePassword` bit(1) NOT NULL,
  `isEuropean` bit(1) NOT NULL,
  `matchSourceNumbers` bit(1) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channelTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2DFF785147A56B56` (`channelTypeId`),
  CONSTRAINT `FK2DFF785147A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RemoteProviderType`
--

LOCK TABLES `RemoteProviderType` WRITE;
/*!40000 ALTER TABLE `RemoteProviderType` DISABLE KEYS */;
INSERT INTO `RemoteProviderType` VALUES (1,'\0',NULL,NULL,NULL,'','\0','\0','\0','WhiteHat Sentinel',NULL,19),(2,'\0',NULL,NULL,NULL,'\0','','\0','\0','Veracode',NULL,22),(3,'\0',NULL,NULL,NULL,'\0','','\0','\0','QualysGuard WAS',NULL,17),(4,'\0',NULL,NULL,NULL,'\0','','\0','\0','Contrast',NULL,27),(5,'\0',NULL,NULL,NULL,'\0','','\0','\0','Sonatype',NULL,32),(6,'\0',NULL,NULL,NULL,'\0','','\0','\0','Trustwave Hailstorm',NULL,24),(7,'\0',NULL,NULL,NULL,'\0','','\0','\0','IBM Security AppScan Enterprise',NULL,7),(8,'\0',NULL,NULL,NULL,'\0','\0','\0','\0','WhiteHat Sentinel Source',NULL,33);
/*!40000 ALTER TABLE `RemoteProviderType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `displayName` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jsFilePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jspFilePath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(11) DEFAULT NULL,
  `nativeReport` bit(1) DEFAULT NULL,
  `shortName` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (1,'','Vulnerability Trending','/scripts/left-report-controller.js','/WEB-INF/views/applications/widgets/vulnerabilityTrending.jsp',0,'','vulnerabilityTrending'),(2,'','Most Vulnerable Applications','/scripts/right-report-controller.js','/WEB-INF/views/applications/widgets/mostVulnerableApps.jsp',0,'','mostVulnerableApps'),(3,'','Vulnerability Trending','/scripts/left-report-controller.js','/WEB-INF/views/applications/widgets/vulnerabilityTrending.jsp',1,'','vulnerabilityTrending'),(4,'','Most Vulnerable Applications','/scripts/right-report-controller.js','/WEB-INF/views/applications/widgets/mostVulnerableApps.jsp',1,'','mostVulnerableApps'),(5,'','Vulnerability Trending','/scripts/left-report-controller.js','/WEB-INF/views/applications/widgets/vulnerabilityTrending.jsp',2,'','vulnerabilityTrending'),(6,'','Most Vulnerable Applications','/scripts/right-report-controller.js','/WEB-INF/views/applications/widgets/mostVulnerableApps.jsp',2,'','mostVulnerableApps'),(7,'','Vulnerability Trending','/scripts/left-report-controller.js','/WEB-INF/views/applications/widgets/vulnerabilityTrending.jsp',3,'','vulnerabilityTrending'),(8,'','Most Vulnerable Applications','/scripts/right-report-controller.js','/WEB-INF/views/applications/widgets/mostVulnerableApps.jsp',3,'','mostVulnerableApps'),(9,'','Recent Uploads',NULL,'/WEB-INF/views/applications/widgets/recentUploads.jsp',0,'','recentUploads'),(10,'','Recent Comments',NULL,'/WEB-INF/views/applications/widgets/recentComments.jsp',0,'','recentComments');
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportEmailAddress`
--

DROP TABLE IF EXISTS `ReportEmailAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportEmailAddress` (
  `ScheduledEmailReportId` int(11) NOT NULL,
  `emailAddress` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FKE1CC182CF92BB3A0` (`ScheduledEmailReportId`),
  CONSTRAINT `FKE1CC182CF92BB3A0` FOREIGN KEY (`ScheduledEmailReportId`) REFERENCES `ScheduledEmailReport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportEmailAddress`
--

LOCK TABLES `ReportEmailAddress` WRITE;
/*!40000 ALTER TABLE `ReportEmailAddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportEmailAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `canGenerateReports` bit(1) DEFAULT NULL,
  `canGenerateWafRules` bit(1) DEFAULT NULL,
  `canManageApiKeys` bit(1) DEFAULT NULL,
  `canManageApplications` bit(1) DEFAULT NULL,
  `canManageCustomCweText` bit(1) DEFAULT NULL,
  `canManageDefectTrackers` bit(1) DEFAULT NULL,
  `canManageEmailReports` bit(1) DEFAULT NULL,
  `canManageGrcTools` bit(1) DEFAULT NULL,
  `canManageGroups` bit(1) DEFAULT NULL,
  `canManagePolicies` bit(1) DEFAULT NULL,
  `canManageRemoteProviders` bit(1) DEFAULT NULL,
  `canManageRoles` bit(1) DEFAULT NULL,
  `canManageScanAgents` bit(1) DEFAULT NULL,
  `canManageScanResultFilters` bit(1) DEFAULT NULL,
  `canManageSystemSettings` bit(1) DEFAULT NULL,
  `canManageTags` bit(1) DEFAULT NULL,
  `canManageTeams` bit(1) DEFAULT NULL,
  `canManageUsers` bit(1) DEFAULT NULL,
  `canManageVulnFilters` bit(1) DEFAULT NULL,
  `canManageWafs` bit(1) DEFAULT NULL,
  `canModifyVulnerabilities` bit(1) DEFAULT NULL,
  `canSubmitComments` bit(1) DEFAULT NULL,
  `canSubmitDefects` bit(1) DEFAULT NULL,
  `canUploadScans` bit(1) DEFAULT NULL,
  `canViewErrorLogs` bit(1) DEFAULT NULL,
  `canViewJobStatuses` bit(1) DEFAULT NULL,
  `displayName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enterprise` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'','2015-11-10 19:07:12','2015-11-10 19:07:12','','','','','','','','','','','','','','','','','','','','','','','','','','\0','Administrator','\0'),(2,'','2015-11-10 19:07:12','2015-11-10 19:07:12','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','User','\0');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scan`
--

DROP TABLE IF EXISTS `Scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filePathRoot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `importTime` datetime DEFAULT NULL,
  `lockedMetadata` bit(1) DEFAULT NULL,
  `numberAuditedCriticalVulnerabilities` bigint(20) DEFAULT NULL,
  `numberAuditedHighVulnerabilities` bigint(20) DEFAULT NULL,
  `numberAuditedInfoVulnerabilities` bigint(20) DEFAULT NULL,
  `numberAuditedLowVulnerabilities` bigint(20) DEFAULT NULL,
  `numberAuditedMediumVulnerabilities` bigint(20) DEFAULT NULL,
  `numberClosedVulnerabilities` int(11) DEFAULT NULL,
  `numberCriticalVulnerabilities` bigint(20) DEFAULT NULL,
  `numberHiddenVulnerabilities` int(11) DEFAULT NULL,
  `numberHighVulnerabilities` bigint(20) DEFAULT NULL,
  `numberInfoVulnerabilities` bigint(20) DEFAULT NULL,
  `numberLowVulnerabilities` bigint(20) DEFAULT NULL,
  `numberMediumVulnerabilities` bigint(20) DEFAULT NULL,
  `numberNewVulnerabilities` int(11) DEFAULT NULL,
  `numberOldVulnerabilities` int(11) DEFAULT NULL,
  `numberOldVulnerabilitiesInitiallyFromThisChannel` int(11) DEFAULT NULL,
  `numberRepeatFindings` int(11) DEFAULT NULL,
  `numberRepeatResults` int(11) DEFAULT NULL,
  `numberResurfacedVulnerabilities` int(11) DEFAULT NULL,
  `numberTotalAuditedVulnerabilities` bigint(20) DEFAULT NULL,
  `numberTotalVulnerabilities` int(11) DEFAULT NULL,
  `urlPathRoot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `applicationChannelId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `importTime` (`importTime`),
  KEY `FK273A9DD1ED50A0` (`applicationChannelId`),
  KEY `FK273A9DC96E039C` (`applicationId`),
  KEY `FK273A9DD593C930` (`userId`),
  CONSTRAINT `FK273A9DD593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK273A9DC96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FK273A9DD1ED50A0` FOREIGN KEY (`applicationChannelId`) REFERENCES `ApplicationChannel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scan`
--

LOCK TABLES `Scan` WRITE;
/*!40000 ALTER TABLE `Scan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanCloseVulnerabilityMap`
--

DROP TABLE IF EXISTS `ScanCloseVulnerabilityMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanCloseVulnerabilityMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scanId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK799EF2BBDFCC92B4` (`vulnerabilityId`),
  KEY `FK799EF2BBD1459A14` (`scanId`),
  CONSTRAINT `FK799EF2BBD1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`),
  CONSTRAINT `FK799EF2BBDFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanCloseVulnerabilityMap`
--

LOCK TABLES `ScanCloseVulnerabilityMap` WRITE;
/*!40000 ALTER TABLE `ScanCloseVulnerabilityMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanCloseVulnerabilityMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanFileNames`
--

DROP TABLE IF EXISTS `ScanFileNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanFileNames` (
  `scanId` int(11) NOT NULL,
  `originalFileNames` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FKD869850FD1459A14` (`scanId`),
  CONSTRAINT `FKD869850FD1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanFileNames`
--

LOCK TABLES `ScanFileNames` WRITE;
/*!40000 ALTER TABLE `ScanFileNames` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanFileNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanQueueTask`
--

DROP TABLE IF EXISTS `ScanQueueTask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanQueueTask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `scanAgentInfo` longtext COLLATE utf8mb4_unicode_ci,
  `scanAgentInstanceSecureKey` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scanner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secureKey` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `targetUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeoutTime` datetime DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `scanConfig_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC0285819F80B0A35` (`scanConfig_id`),
  KEY `FKC0285819C96E039C` (`applicationId`),
  CONSTRAINT `FKC0285819C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKC0285819F80B0A35` FOREIGN KEY (`scanConfig_id`) REFERENCES `Document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanQueueTask`
--

LOCK TABLES `ScanQueueTask` WRITE;
/*!40000 ALTER TABLE `ScanQueueTask` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanQueueTask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanReopenVulnerabilityMap`
--

DROP TABLE IF EXISTS `ScanReopenVulnerabilityMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanReopenVulnerabilityMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scanId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB2D9E75ADFCC92B4` (`vulnerabilityId`),
  KEY `FKB2D9E75AD1459A14` (`scanId`),
  CONSTRAINT `FKB2D9E75AD1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`),
  CONSTRAINT `FKB2D9E75ADFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanReopenVulnerabilityMap`
--

LOCK TABLES `ScanReopenVulnerabilityMap` WRITE;
/*!40000 ALTER TABLE `ScanReopenVulnerabilityMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanReopenVulnerabilityMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanRepeatFindingMap`
--

DROP TABLE IF EXISTS `ScanRepeatFindingMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanRepeatFindingMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `findingId` int(11) DEFAULT NULL,
  `scanId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK69D6A1CBD1459A14` (`scanId`),
  KEY `FK69D6A1CB14599E4E` (`findingId`),
  CONSTRAINT `FK69D6A1CB14599E4E` FOREIGN KEY (`findingId`) REFERENCES `Finding` (`id`),
  CONSTRAINT `FK69D6A1CBD1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanRepeatFindingMap`
--

LOCK TABLES `ScanRepeatFindingMap` WRITE;
/*!40000 ALTER TABLE `ScanRepeatFindingMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanRepeatFindingMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanResultFilter`
--

DROP TABLE IF EXISTS `ScanResultFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanResultFilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `channelTypeId` int(11) NOT NULL,
  `genericSeverityId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF1A0C13247A56B56` (`channelTypeId`),
  KEY `FKF1A0C132AD661F44` (`genericSeverityId`),
  CONSTRAINT `FKF1A0C132AD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`),
  CONSTRAINT `FKF1A0C13247A56B56` FOREIGN KEY (`channelTypeId`) REFERENCES `ChannelType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanResultFilter`
--

LOCK TABLES `ScanResultFilter` WRITE;
/*!40000 ALTER TABLE `ScanResultFilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanResultFilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanSavedFileNames`
--

DROP TABLE IF EXISTS `ScanSavedFileNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanSavedFileNames` (
  `scanId` int(11) NOT NULL,
  `savedFileNames` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FK7AE9C862D1459A14` (`scanId`),
  CONSTRAINT `FK7AE9C862D1459A14` FOREIGN KEY (`scanId`) REFERENCES `Scan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanSavedFileNames`
--

LOCK TABLES `ScanSavedFileNames` WRITE;
/*!40000 ALTER TABLE `ScanSavedFileNames` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanSavedFileNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScanStatus`
--

DROP TABLE IF EXISTS `ScanStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `timestamp` datetime NOT NULL,
  `scanQueueTaskId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK35B8CCEFA32C2AEE` (`scanQueueTaskId`),
  CONSTRAINT `FK35B8CCEFA32C2AEE` FOREIGN KEY (`scanQueueTaskId`) REFERENCES `ScanQueueTask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScanStatus`
--

LOCK TABLES `ScanStatus` WRITE;
/*!40000 ALTER TABLE `ScanStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScanStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledDefectTrackerUpdate`
--

DROP TABLE IF EXISTS `ScheduledDefectTrackerUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledDefectTrackerUpdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledDefectTrackerUpdate`
--

LOCK TABLES `ScheduledDefectTrackerUpdate` WRITE;
/*!40000 ALTER TABLE `ScheduledDefectTrackerUpdate` DISABLE KEYS */;
INSERT INTO `ScheduledDefectTrackerUpdate` VALUES (1,'','2015-11-10 19:07:10','2015-11-10 19:07:10',NULL,'Daily',6,0,'AM');
/*!40000 ALTER TABLE `ScheduledDefectTrackerUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledEmailReport`
--

DROP TABLE IF EXISTS `ScheduledEmailReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledEmailReport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `severityLevelId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB4934523A0ABF57` (`severityLevelId`),
  CONSTRAINT `FKB4934523A0ABF57` FOREIGN KEY (`severityLevelId`) REFERENCES `GenericSeverity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledEmailReport`
--

LOCK TABLES `ScheduledEmailReport` WRITE;
/*!40000 ALTER TABLE `ScheduledEmailReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledEmailReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledEmailReport_EmailList`
--

DROP TABLE IF EXISTS `ScheduledEmailReport_EmailList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledEmailReport_EmailList` (
  `scheduledEmailReportId` int(11) NOT NULL,
  `emailListId` int(11) NOT NULL,
  KEY `FKF557D21E2034FB50` (`emailListId`),
  KEY `FKF557D21EF92BB3A0` (`scheduledEmailReportId`),
  CONSTRAINT `FKF557D21EF92BB3A0` FOREIGN KEY (`scheduledEmailReportId`) REFERENCES `ScheduledEmailReport` (`id`),
  CONSTRAINT `FKF557D21E2034FB50` FOREIGN KEY (`emailListId`) REFERENCES `EmailList` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledEmailReport_EmailList`
--

LOCK TABLES `ScheduledEmailReport_EmailList` WRITE;
/*!40000 ALTER TABLE `ScheduledEmailReport_EmailList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledEmailReport_EmailList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledEmailReport_Organization`
--

DROP TABLE IF EXISTS `ScheduledEmailReport_Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledEmailReport_Organization` (
  `scheduledEmailReportId` int(11) NOT NULL,
  `organizationId` int(11) NOT NULL,
  KEY `FKDA716EF88316300` (`organizationId`),
  KEY `FKDA716EFF92BB3A0` (`scheduledEmailReportId`),
  CONSTRAINT `FKDA716EFF92BB3A0` FOREIGN KEY (`scheduledEmailReportId`) REFERENCES `ScheduledEmailReport` (`id`),
  CONSTRAINT `FKDA716EF88316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledEmailReport_Organization`
--

LOCK TABLES `ScheduledEmailReport_Organization` WRITE;
/*!40000 ALTER TABLE `ScheduledEmailReport_Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledEmailReport_Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledGRCToolUpdate`
--

DROP TABLE IF EXISTS `ScheduledGRCToolUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledGRCToolUpdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledGRCToolUpdate`
--

LOCK TABLES `ScheduledGRCToolUpdate` WRITE;
/*!40000 ALTER TABLE `ScheduledGRCToolUpdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledGRCToolUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledRemoteProviderImport`
--

DROP TABLE IF EXISTS `ScheduledRemoteProviderImport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledRemoteProviderImport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledRemoteProviderImport`
--

LOCK TABLES `ScheduledRemoteProviderImport` WRITE;
/*!40000 ALTER TABLE `ScheduledRemoteProviderImport` DISABLE KEYS */;
INSERT INTO `ScheduledRemoteProviderImport` VALUES (1,'','2015-11-10 19:07:10','2015-11-10 19:07:10',NULL,'Daily',6,0,'AM');
/*!40000 ALTER TABLE `ScheduledRemoteProviderImport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledScan`
--

DROP TABLE IF EXISTS `ScheduledScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduledScan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scanner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `targetUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `scanConfig_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93D80CAAF80B0A35` (`scanConfig_id`),
  KEY `FK93D80CAAC96E039C` (`applicationId`),
  CONSTRAINT `FK93D80CAAC96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FK93D80CAAF80B0A35` FOREIGN KEY (`scanConfig_id`) REFERENCES `Document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledScan`
--

LOCK TABLES `ScheduledScan` WRITE;
/*!40000 ALTER TABLE `ScheduledScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecurityEvent`
--

DROP TABLE IF EXISTS `SecurityEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attackType` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attackerIP` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backupWafRuleId` int(11) DEFAULT NULL,
  `importTime` datetime DEFAULT NULL,
  `logText` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nativeId` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wafRuleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK438C31A94602B4C` (`wafRuleId`),
  CONSTRAINT `FK438C31A94602B4C` FOREIGN KEY (`wafRuleId`) REFERENCES `WafRule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecurityEvent`
--

LOCK TABLES `SecurityEvent` WRITE;
/*!40000 ALTER TABLE `SecurityEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `SecurityEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeverityFilter`
--

DROP TABLE IF EXISTS `SeverityFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeverityFilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `global` bit(1) NOT NULL,
  `showCritical` bit(1) NOT NULL,
  `showHigh` bit(1) NOT NULL,
  `showInfo` bit(1) NOT NULL,
  `showLow` bit(1) NOT NULL,
  `showMedium` bit(1) NOT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7C4A4F588316300` (`organizationId`),
  KEY `FKC7C4A4F5C96E039C` (`applicationId`),
  CONSTRAINT `FKC7C4A4F5C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKC7C4A4F588316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeverityFilter`
--

LOCK TABLES `SeverityFilter` WRITE;
/*!40000 ALTER TABLE `SeverityFilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeverityFilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeverityMap`
--

DROP TABLE IF EXISTS `SeverityMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeverityMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelSeverityId` int(11) DEFAULT NULL,
  `genericSeverityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK42CF84FFAD661F44` (`genericSeverityId`),
  KEY `FK42CF84FF4BC6129C` (`channelSeverityId`),
  CONSTRAINT `FK42CF84FF4BC6129C` FOREIGN KEY (`channelSeverityId`) REFERENCES `ChannelSeverity` (`id`),
  CONSTRAINT `FK42CF84FFAD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeverityMap`
--

LOCK TABLES `SeverityMap` WRITE;
/*!40000 ALTER TABLE `SeverityMap` DISABLE KEYS */;
INSERT INTO `SeverityMap` VALUES (1,1,3),(2,2,1),(3,3,5),(4,4,2),(5,5,4),(6,6,5),(7,7,2),(8,8,3),(9,9,1),(10,10,4),(11,11,3),(12,12,1),(13,13,5),(14,14,2),(15,15,1),(16,16,3),(17,17,5),(18,18,1),(19,19,3),(20,20,2),(21,21,5),(22,22,4),(23,23,1),(24,24,3),(25,25,2),(26,26,5),(27,27,1),(28,28,3),(29,29,2),(30,30,5),(31,31,5),(32,34,4),(33,33,3),(34,32,2),(35,39,4),(36,38,1),(37,37,3),(38,36,2),(39,35,5),(40,41,2),(41,40,1),(42,42,5),(43,43,2),(44,44,3),(45,45,1),(46,46,4),(47,47,4),(48,48,1),(49,49,3),(50,50,2),(51,51,5),(52,52,4),(53,53,1),(54,54,3),(55,55,2),(56,57,5),(57,58,2),(58,59,3),(59,60,1),(60,61,4),(61,62,5),(62,63,3),(63,64,1),(64,65,2),(65,66,5),(66,67,3),(67,68,1),(68,69,2),(69,70,4),(70,71,5),(71,72,2),(72,73,3),(73,74,1),(74,77,1),(75,75,3),(76,76,2),(77,78,1),(78,80,2),(79,81,3),(80,82,1),(81,83,4),(82,84,4),(83,85,1),(84,86,3),(85,87,2),(86,88,5),(87,89,3),(88,91,1),(89,90,2),(90,92,5),(91,93,5),(92,94,2),(93,95,3),(94,98,3),(95,99,5),(96,100,2),(97,101,5),(98,102,1),(99,103,3),(100,104,2),(101,105,4),(102,106,2),(103,107,5),(104,108,1),(105,109,3),(106,56,5),(107,110,5),(108,111,1),(109,112,3),(110,113,2),(111,114,5),(112,115,1),(113,116,3),(114,117,2),(115,118,5),(116,119,2),(117,120,3),(118,79,5),(119,97,4),(120,96,1),(121,121,3),(122,122,5),(123,123,5),(124,124,4),(125,125,1),(126,126,3),(127,127,2),(128,128,4),(129,129,1),(130,130,3),(131,131,2),(132,132,5),(133,133,5),(134,134,4),(135,135,1),(136,136,3),(137,137,2),(138,138,5),(139,139,5),(140,140,4),(141,141,1),(142,142,3),(143,143,5),(144,144,1),(145,145,3),(146,146,2),(147,147,2),(148,148,2),(149,149,5),(150,150,5),(151,151,4),(152,152,1),(153,153,3),(154,154,2),(155,155,3);
/*!40000 ALTER TABLE `SeverityMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaticPathInformation`
--

DROP TABLE IF EXISTS `StaticPathInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaticPathInformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaticPathInformation`
--

LOCK TABLES `StaticPathInformation` WRITE;
/*!40000 ALTER TABLE `StaticPathInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaticPathInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticsCounter`
--

DROP TABLE IF EXISTS `StatisticsCounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticsCounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelSeverityId` int(11) DEFAULT NULL,
  `channelVulnerabilityId` int(11) DEFAULT NULL,
  `currentGenericSeverityId` int(11) DEFAULT NULL,
  `genericVulnerabilityId` int(11) DEFAULT NULL,
  `originalGenericSeverityId` int(11) DEFAULT NULL,
  `scanId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  `findingId` int(11) DEFAULT NULL,
  `scanRepeatFindingMapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vulnerabilityId` (`vulnerabilityId`),
  KEY `originalGenericSeverityId` (`originalGenericSeverityId`),
  KEY `scanId` (`scanId`),
  KEY `currentChannelSeverityId` (`channelSeverityId`),
  KEY `findingId` (`findingId`),
  KEY `scanRepeatFindingMapId` (`scanRepeatFindingMapId`),
  KEY `genericVulnerabilityId` (`genericVulnerabilityId`),
  KEY `currentChannelVulnerabilityId` (`channelVulnerabilityId`),
  KEY `currentGenericSeverityId` (`currentGenericSeverityId`),
  KEY `FK51077F39DDFB56D0` (`scanRepeatFindingMapId`),
  KEY `FK51077F3914599E4E` (`findingId`),
  CONSTRAINT `FK51077F3914599E4E` FOREIGN KEY (`findingId`) REFERENCES `Finding` (`id`),
  CONSTRAINT `FK51077F39DDFB56D0` FOREIGN KEY (`scanRepeatFindingMapId`) REFERENCES `ScanRepeatFindingMap` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticsCounter`
--

LOCK TABLES `StatisticsCounter` WRITE;
/*!40000 ALTER TABLE `StatisticsCounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `StatisticsCounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurfaceLocation`
--

DROP TABLE IF EXISTS `SurfaceLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurfaceLocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `httpMethod` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL,
  `protocol` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurfaceLocation`
--

LOCK TABLES `SurfaceLocation` WRITE;
/*!40000 ALTER TABLE `SurfaceLocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurfaceLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey`
--

DROP TABLE IF EXISTS `Survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey`
--

LOCK TABLES `Survey` WRITE;
/*!40000 ALTER TABLE `Survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyAnswer`
--

DROP TABLE IF EXISTS `SurveyAnswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyAnswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` bit(1) NOT NULL,
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyAssertionId` int(11) DEFAULT NULL,
  `surveyQuestionId` int(11) DEFAULT NULL,
  `surveyResultId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1D35BBD86C81E42C` (`surveyAssertionId`),
  KEY `FK1D35BBD81760DC3A` (`surveyQuestionId`),
  KEY `FK1D35BBD89173DBA8` (`surveyResultId`),
  CONSTRAINT `FK1D35BBD89173DBA8` FOREIGN KEY (`surveyResultId`) REFERENCES `SurveyResult` (`id`),
  CONSTRAINT `FK1D35BBD81760DC3A` FOREIGN KEY (`surveyQuestionId`) REFERENCES `SurveyQuestion` (`id`),
  CONSTRAINT `FK1D35BBD86C81E42C` FOREIGN KEY (`surveyAssertionId`) REFERENCES `SurveyAssertion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyAnswer`
--

LOCK TABLES `SurveyAnswer` WRITE;
/*!40000 ALTER TABLE `SurveyAnswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyAnswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyAssertion`
--

DROP TABLE IF EXISTS `SurveyAssertion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyAssertion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyAnswerId` int(11) DEFAULT NULL,
  `surveyQuestionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1976ECA81760DC3A` (`surveyQuestionId`),
  KEY `FK1976ECA86B2D66AA` (`surveyAnswerId`),
  CONSTRAINT `FK1976ECA86B2D66AA` FOREIGN KEY (`surveyAnswerId`) REFERENCES `SurveyAnswer` (`id`),
  CONSTRAINT `FK1976ECA81760DC3A` FOREIGN KEY (`surveyQuestionId`) REFERENCES `SurveyQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyAssertion`
--

LOCK TABLES `SurveyAssertion` WRITE;
/*!40000 ALTER TABLE `SurveyAssertion` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyAssertion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyLevel`
--

DROP TABLE IF EXISTS `SurveyLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyLevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL,
  `surveyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK85A9342A6CEEC4CE` (`surveyId`),
  CONSTRAINT `FK85A9342A6CEEC4CE` FOREIGN KEY (`surveyId`) REFERENCES `Survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyLevel`
--

LOCK TABLES `SurveyLevel` WRITE;
/*!40000 ALTER TABLE `SurveyLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyObjective`
--

DROP TABLE IF EXISTS `SurveyObjective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyObjective` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `levelNumber` int(11) NOT NULL,
  `surveyPracticeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72558EDF6A1365A4` (`surveyPracticeId`),
  CONSTRAINT `FK72558EDF6A1365A4` FOREIGN KEY (`surveyPracticeId`) REFERENCES `SurveyPractice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyObjective`
--

LOCK TABLES `SurveyObjective` WRITE;
/*!40000 ALTER TABLE `SurveyObjective` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyObjective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyPractice`
--

DROP TABLE IF EXISTS `SurveyPractice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyPractice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyRankingId` int(11) DEFAULT NULL,
  `surveySectionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK70B65ED5DCA7D0D4` (`surveyRankingId`),
  KEY `FK70B65ED5150B4672` (`surveySectionId`),
  CONSTRAINT `FK70B65ED5150B4672` FOREIGN KEY (`surveySectionId`) REFERENCES `SurveySection` (`id`),
  CONSTRAINT `FK70B65ED5DCA7D0D4` FOREIGN KEY (`surveyRankingId`) REFERENCES `SurveyRanking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyPractice`
--

LOCK TABLES `SurveyPractice` WRITE;
/*!40000 ALTER TABLE `SurveyPractice` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyPractice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyQuestion`
--

DROP TABLE IF EXISTS `SurveyQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyQuestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyQuestion` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyObjectiveId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7EFF1980611F76DA` (`surveyObjectiveId`),
  CONSTRAINT `FK7EFF1980611F76DA` FOREIGN KEY (`surveyObjectiveId`) REFERENCES `SurveyObjective` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyQuestion`
--

LOCK TABLES `SurveyQuestion` WRITE;
/*!40000 ALTER TABLE `SurveyQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyRanking`
--

DROP TABLE IF EXISTS `SurveyRanking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyRanking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `plus` bit(1) NOT NULL,
  `surveyPracticeId` int(11) DEFAULT NULL,
  `surveyResultId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF650D35C6A1365A4` (`surveyPracticeId`),
  KEY `FKF650D35C9173DBA8` (`surveyResultId`),
  CONSTRAINT `FKF650D35C9173DBA8` FOREIGN KEY (`surveyResultId`) REFERENCES `SurveyResult` (`id`),
  CONSTRAINT `FKF650D35C6A1365A4` FOREIGN KEY (`surveyPracticeId`) REFERENCES `SurveyPractice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyRanking`
--

LOCK TABLES `SurveyRanking` WRITE;
/*!40000 ALTER TABLE `SurveyRanking` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyRanking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveyResult`
--

DROP TABLE IF EXISTS `SurveyResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyResult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `user` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  `surveyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39B9443788316300` (`organizationId`),
  KEY `FK39B944376CEEC4CE` (`surveyId`),
  CONSTRAINT `FK39B944376CEEC4CE` FOREIGN KEY (`surveyId`) REFERENCES `Survey` (`id`),
  CONSTRAINT `FK39B9443788316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveyResult`
--

LOCK TABLES `SurveyResult` WRITE;
/*!40000 ALTER TABLE `SurveyResult` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveyResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SurveySection`
--

DROP TABLE IF EXISTS `SurveySection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveySection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lightColor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sectionName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3173860B6CEEC4CE` (`surveyId`),
  CONSTRAINT `FK3173860B6CEEC4CE` FOREIGN KEY (`surveyId`) REFERENCES `Survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SurveySection`
--

LOCK TABLES `SurveySection` WRITE;
/*!40000 ALTER TABLE `SurveySection` DISABLE KEYS */;
/*!40000 ALTER TABLE `SurveySection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `defaultJsonFilter` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterpriseTag` bit(1) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagForComment` bit(1) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `approved` bit(1) NOT NULL,
  `displayName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failedPasswordAttemptWindowStart` datetime NOT NULL,
  `failedPasswordAttempts` int(11) NOT NULL,
  `hasChangedInitialPassword` bit(1) DEFAULT NULL,
  `hasGlobalGroupAccess` bit(1) DEFAULT NULL,
  `isLdapUser` bit(1) DEFAULT NULL,
  `lastLoginDate` datetime NOT NULL,
  `lastPasswordChangedDate` datetime NOT NULL,
  `locked` bit(1) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userEventNotificationMapsInitialized` bit(1) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK285FEBD03E73C6` (`roleId`),
  CONSTRAINT `FK285FEBD03E73C6` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'','2015-11-10 19:07:12','2015-11-10 19:07:12','',NULL,'2015-11-10 19:07:12',0,'\0','','\0','2015-11-10 19:07:12','2015-11-10 19:07:12','\0','user','448f42d8b2e43ef6091a6e23d0cff9fc2c5bfdbb73c1d2e6bc9c66c07aff8be7','a9e2446b-aa36-4c86-977c-68d970156177','\0',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserEventNotificationMap`
--

DROP TABLE IF EXISTS `UserEventNotificationMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserEventNotificationMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `eventAction` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCC8F6702D593C930` (`userId`),
  CONSTRAINT `FKCC8F6702D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserEventNotificationMap`
--

LOCK TABLES `UserEventNotificationMap` WRITE;
/*!40000 ALTER TABLE `UserEventNotificationMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserEventNotificationMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Group`
--

DROP TABLE IF EXISTS `User_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Group` (
  `User_Id` int(11) NOT NULL,
  `Group_Id` int(11) NOT NULL,
  KEY `FKE7B7ED0B25970DE5` (`Group_Id`),
  KEY `FKE7B7ED0BDC1FA12F` (`User_Id`),
  CONSTRAINT `FKE7B7ED0BDC1FA12F` FOREIGN KEY (`User_Id`) REFERENCES `Groups` (`id`),
  CONSTRAINT `FKE7B7ED0B25970DE5` FOREIGN KEY (`Group_Id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Group`
--

LOCK TABLES `User_Group` WRITE;
/*!40000 ALTER TABLE `User_Group` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vulnerability`
--

DROP TABLE IF EXISTS `Vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `authenticationRequired` int(11) DEFAULT NULL,
  `calculatedFilePath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculatedUrlPath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closeTime` datetime DEFAULT NULL,
  `defectClosedTime` datetime DEFAULT NULL,
  `defectSubmittedTime` datetime DEFAULT NULL,
  `expired` bit(1) NOT NULL,
  `foundByScanner` bit(1) NOT NULL,
  `foundHAMEndpoint` bit(1) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `isFalsePositive` bit(1) NOT NULL,
  `locationHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locationVariableHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openTime` datetime DEFAULT NULL,
  `variableHash` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vulnerabilityDefectConsistencyState` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wafRuleGeneratedTime` datetime DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `defectId` int(11) DEFAULT NULL,
  `genericSeverityId` int(11) DEFAULT NULL,
  `genericVulnerabilityId` int(11) DEFAULT NULL,
  `originalGenericSeverityId` int(11) DEFAULT NULL,
  `surfaceLocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE5F6445CAD661F44` (`genericSeverityId`),
  KEY `FKE5F6445C1DDA9D04` (`genericVulnerabilityId`),
  KEY `FKE5F6445CD86EDF3C` (`defectId`),
  KEY `FKE5F6445C4E2A66E0` (`surfaceLocationId`),
  KEY `FKE5F6445CC96E039C` (`applicationId`),
  KEY `FKE5F6445C52905193` (`originalGenericSeverityId`),
  CONSTRAINT `FKE5F6445C52905193` FOREIGN KEY (`originalGenericSeverityId`) REFERENCES `GenericSeverity` (`id`),
  CONSTRAINT `FKE5F6445C1DDA9D04` FOREIGN KEY (`genericVulnerabilityId`) REFERENCES `GenericVulnerability` (`id`),
  CONSTRAINT `FKE5F6445C4E2A66E0` FOREIGN KEY (`surfaceLocationId`) REFERENCES `SurfaceLocation` (`id`),
  CONSTRAINT `FKE5F6445CAD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`),
  CONSTRAINT `FKE5F6445CC96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKE5F6445CD86EDF3C` FOREIGN KEY (`defectId`) REFERENCES `Defect` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vulnerability`
--

LOCK TABLES `Vulnerability` WRITE;
/*!40000 ALTER TABLE `Vulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VulnerabilityComment`
--

DROP TABLE IF EXISTS `VulnerabilityComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VulnerabilityComment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletedVulnerabilityId` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK59FFE263DFCC92B4` (`vulnerabilityId`),
  KEY `FK59FFE263D593C930` (`userId`),
  CONSTRAINT `FK59FFE263D593C930` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK59FFE263DFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VulnerabilityComment`
--

LOCK TABLES `VulnerabilityComment` WRITE;
/*!40000 ALTER TABLE `VulnerabilityComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `VulnerabilityComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VulnerabilityComment_Tag`
--

DROP TABLE IF EXISTS `VulnerabilityComment_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VulnerabilityComment_Tag` (
  `VulnerabilityComment_Id` int(11) NOT NULL,
  `Tag_Id` int(11) NOT NULL,
  KEY `FKB8DE6F9E4FD7845B` (`Tag_Id`),
  KEY `FKB8DE6F9E4C7097F9` (`VulnerabilityComment_Id`),
  CONSTRAINT `FKB8DE6F9E4C7097F9` FOREIGN KEY (`VulnerabilityComment_Id`) REFERENCES `VulnerabilityComment` (`id`),
  CONSTRAINT `FKB8DE6F9E4FD7845B` FOREIGN KEY (`Tag_Id`) REFERENCES `Tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VulnerabilityComment_Tag`
--

LOCK TABLES `VulnerabilityComment_Tag` WRITE;
/*!40000 ALTER TABLE `VulnerabilityComment_Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `VulnerabilityComment_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VulnerabilityFilter`
--

DROP TABLE IF EXISTS `VulnerabilityFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VulnerabilityFilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `global` bit(1) DEFAULT NULL,
  `hide` bit(1) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL,
  `organizationId` int(11) DEFAULT NULL,
  `genericVulnerabilityId` int(11) DEFAULT NULL,
  `genericSeverityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBD5E46F488316300` (`organizationId`),
  KEY `FKBD5E46F4AD661F44` (`genericSeverityId`),
  KEY `FKBD5E46F41DDA9D04` (`genericVulnerabilityId`),
  KEY `FKBD5E46F4C96E039C` (`applicationId`),
  CONSTRAINT `FKBD5E46F4C96E039C` FOREIGN KEY (`applicationId`) REFERENCES `Application` (`id`),
  CONSTRAINT `FKBD5E46F41DDA9D04` FOREIGN KEY (`genericVulnerabilityId`) REFERENCES `GenericVulnerability` (`id`),
  CONSTRAINT `FKBD5E46F488316300` FOREIGN KEY (`organizationId`) REFERENCES `Organization` (`id`),
  CONSTRAINT `FKBD5E46F4AD661F44` FOREIGN KEY (`genericSeverityId`) REFERENCES `GenericSeverity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VulnerabilityFilter`
--

LOCK TABLES `VulnerabilityFilter` WRITE;
/*!40000 ALTER TABLE `VulnerabilityFilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `VulnerabilityFilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VulnerabilityMap`
--

DROP TABLE IF EXISTS `VulnerabilityMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VulnerabilityMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mappable` bit(1) NOT NULL,
  `channelVulnerabilityId` int(11) DEFAULT NULL,
  `genericVulnerabilityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED5E3B60E2A500AC` (`channelVulnerabilityId`),
  KEY `FKED5E3B601DDA9D04` (`genericVulnerabilityId`),
  CONSTRAINT `FKED5E3B601DDA9D04` FOREIGN KEY (`genericVulnerabilityId`) REFERENCES `GenericVulnerability` (`id`),
  CONSTRAINT `FKED5E3B60E2A500AC` FOREIGN KEY (`channelVulnerabilityId`) REFERENCES `ChannelVulnerability` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12934 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VulnerabilityMap`
--

LOCK TABLES `VulnerabilityMap` WRITE;
/*!40000 ALTER TABLE `VulnerabilityMap` DISABLE KEYS */;
INSERT INTO `VulnerabilityMap` VALUES (1,'',1,95),(2,'',2,434),(3,'',3,200),(4,'',4,552),(5,'',5,200),(6,'',6,284),(7,'',7,200),(8,'',8,552),(9,'',9,89),(10,'',10,552),(11,'',11,284),(12,'',12,22),(13,'',13,552),(14,'',14,235),(15,'',15,22),(16,'',16,311),(17,'',17,89),(18,'',18,120),(19,'',19,16),(20,'',20,124),(21,'',21,95),(22,'',22,754),(23,'',23,284),(24,'',24,89),(25,'',25,552),(26,'',26,552),(27,'',27,320),(28,'',28,434),(29,'',29,77),(30,'',30,284),(31,'',31,284),(32,'',32,98),(33,'',33,521),(34,'',34,91),(35,'',35,307),(36,'',36,327),(37,'',37,200),(38,'',38,284),(39,'',39,89),(40,'',40,284),(41,'',41,284),(42,'',42,284),(43,'',43,200),(44,'',44,200),(45,'',45,284),(46,'',46,79),(47,'',47,200),(48,'',48,95),(49,'',49,79),(50,'',50,552),(51,'',51,284),(52,'',52,120),(53,'',53,284),(54,'',54,4),(55,'',55,473),(56,'',56,754),(57,'',57,507),(58,'',58,77),(59,'',59,120),(60,'',60,215),(61,'',61,754),(62,'',62,200),(63,'',63,284),(64,'',64,90),(65,'',65,200),(66,'',66,77),(67,'',67,284),(68,'',68,327),(69,'',69,94),(70,'',70,284),(71,'',71,284),(72,'',72,284),(73,'',73,754),(74,'',74,79),(75,'',75,200),(76,'',76,120),(77,'',77,120),(78,'',78,200),(79,'',79,434),(80,'',80,200),(81,'',81,552),(82,'',82,552),(83,'',83,79),(84,'',84,11),(85,'',85,200),(86,'',86,285),(87,'',87,285),(88,'',88,200),(89,'',89,754),(90,'',90,352),(91,'',91,548),(92,'',92,16),(93,'',93,319),(94,'',94,122),(95,'',95,200),(96,'',96,113),(97,'',97,209),(98,'',98,200),(99,'',99,324),(100,'',100,200),(101,'',101,303),(102,'',102,384),(103,'',103,552),(104,'',104,261),(105,'',105,200),(106,'',106,200),(107,'',107,200),(108,'',108,95),(109,'',109,200),(110,'',110,287),(111,'',111,472),(112,'',112,95),(113,'',113,287),(114,'',114,320),(115,'',115,285),(116,'',116,434),(117,'',117,89),(118,'',118,200),(119,'',119,79),(120,'',120,94),(121,'',121,200),(122,'',122,200),(123,'',123,525),(124,'',124,552),(125,'',125,89),(126,'',126,89),(127,'',127,200),(128,'',128,200),(129,'',129,284),(130,'',130,89),(131,'',131,98),(132,'',132,312),(133,'',133,521),(134,'',134,89),(135,'',135,285),(136,'',136,200),(137,'',137,95),(138,'',138,113),(139,'',139,22),(140,'',140,79),(141,'',141,94),(142,'',142,77),(143,'',143,78),(144,'',144,200),(145,'',145,120),(146,'',146,77),(147,'',147,200),(148,'',148,284),(149,'',149,552),(150,'',150,311),(151,'',151,200),(152,'',152,521),(153,'',153,284),(154,'',154,89),(155,'',155,400),(156,'',156,209),(157,'',157,200),(158,'',158,16),(159,'',159,522),(160,'',160,284),(161,'',161,200),(162,'',162,311),(163,'',163,552),(164,'',164,89),(165,'',165,507),(166,'',166,22),(167,'',167,352),(168,'',168,346),(169,'',169,400),(170,'',170,89),(171,'',171,200),(172,'',172,200),(173,'',173,200),(174,'',174,400),(175,'',175,521),(176,'',176,200),(177,'',177,79),(178,'',178,89),(179,'',179,77),(180,'',180,523),(181,'',181,441),(182,'',182,434),(183,'',183,79),(184,'',184,200),(185,'',185,79),(186,'',186,89),(187,'',187,352),(188,'',188,77),(189,'',189,95),(190,'',190,200),(191,'',191,523),(192,'',192,200),(193,'',193,200),(194,'',194,284),(195,'',195,200),(196,'',196,521),(197,'',197,78),(198,'',198,552),(199,'',199,320),(200,'',200,209),(201,'',201,77),(202,'',202,200),(203,'',203,521),(204,'',204,22),(205,'',205,327),(206,'',206,552),(207,'',207,16),(208,'',208,284),(209,'',209,284),(210,'',210,521),(211,'',211,95),(212,'',212,540),(213,'',213,200),(214,'',214,284),(215,'',215,89),(216,'',216,284),(217,'',217,200),(218,'',218,548),(219,'',219,200),(220,'',220,200),(221,'',221,22),(222,'',222,94),(223,'',223,284),(224,'',224,79),(225,'',225,200),(226,'',226,79),(227,'',227,284),(228,'',228,284),(229,'',229,320),(230,'',230,548),(231,'',231,120),(232,'',232,209),(233,'',233,200),(234,'',234,200),(235,'',235,284),(236,'',236,22),(237,'',237,434),(238,'',238,79),(239,'',239,95),(240,'',240,384),(241,'',241,200),(242,'',242,200),(243,'',243,312),(244,'',244,22),(245,'',245,400),(246,'',246,200),(247,'',247,532),(248,'',248,200),(249,'',249,79),(250,'',250,89),(251,'',251,89),(252,'',252,200),(253,'',253,400),(254,'',254,95),(255,'',255,98),(256,'',256,91),(257,'',257,400),(258,'',258,441),(259,'',259,521),(260,'',260,614),(261,'',261,552),(262,'',262,284),(263,'',263,89),(264,'',264,79),(265,'',265,200),(266,'',266,525),(267,'',267,89),(268,'',268,472),(269,'',269,209),(270,'',270,319),(271,'',271,200),(272,'',272,95),(273,'',273,307),(274,'',274,59),(275,'',275,614),(276,'',276,134),(277,'',277,89),(278,'',278,200),(279,'',279,200),(280,'',280,95),(281,'',281,200),(282,'',282,540),(283,'',283,16),(284,'',284,89),(285,'',285,77),(286,'',286,552),(287,'',287,200),(288,'',288,200),(289,'',289,209),(290,'',290,352),(291,'',291,552),(292,'',292,95),(293,'',293,200),(294,'',294,284),(295,'',295,754),(296,'',296,540),(297,'',297,77),(298,'',298,346),(299,'',299,521),(300,'',300,98),(301,'',301,352),(302,'',302,285),(303,'',303,16),(304,'',304,434),(305,'',305,284),(306,'',306,698),(307,'',307,285),(308,'',308,312),(309,'',309,261),(310,'',310,754),(311,'',311,284),(312,'',312,472),(313,'',313,120),(314,'',314,269),(315,'',315,79),(316,'',316,615),(317,'',317,95),(318,'',318,73),(319,'',319,284),(320,'',320,22),(321,'',321,200),(322,'',322,521),(323,'',323,94),(324,'',324,22),(325,'',325,521),(326,'',326,284),(327,'',327,79),(328,'',328,200),(329,'',329,287),(330,'',330,285),(331,'',331,200),(332,'',332,200),(333,'',333,384),(334,'',334,95),(335,'',335,95),(336,'',336,94),(337,'',337,95),(338,'',338,200),(339,'',339,330),(340,'',340,200),(341,'',341,754),(342,'',342,200),(343,'',343,643),(344,'',344,287),(345,'',345,311),(346,'',346,16),(347,'',347,601),(348,'',348,200),(349,'',349,521),(350,'',350,319),(351,'',NULL,400),(352,'',NULL,538),(353,'',NULL,524),(354,'',354,79),(355,'',355,22),(356,'',356,20),(357,'',357,20),(358,'',358,79),(359,'',359,89),(360,'',360,20),(361,'',361,79),(362,'',362,79),(363,'',363,120),(364,'',364,22),(365,'',365,89),(366,'',366,79),(367,'',367,79),(368,'',368,22),(369,'',369,77),(370,'',370,89),(371,'',371,94),(372,'',372,79),(373,'',373,79),(374,'',374,79),(375,'',375,200),(376,'',376,548),(377,'',377,89),(378,'',378,94),(379,'',379,189),(380,'',380,20),(381,'',381,89),(382,'',382,79),(383,'',383,77),(384,'',384,119),(385,'',385,119),(386,'',386,565),(387,'',387,89),(388,'',388,22),(389,'',389,489),(390,'',390,94),(391,'',391,16),(392,'',392,307),(393,'',393,22),(394,'',394,79),(395,'',395,79),(396,'',396,22),(397,'',397,16),(398,'',398,79),(399,'',399,79),(400,'',400,307),(401,'',401,79),(402,'',402,16),(403,'',403,119),(404,'',404,79),(405,'',405,79),(406,'',406,200),(407,'',407,89),(408,'',408,79),(409,'',409,472),(410,'',410,79),(411,'',411,22),(412,'',412,79),(413,'',413,79),(414,'',414,16),(415,'',415,20),(416,'',416,79),(417,'',417,74),(418,'',418,89),(419,'',419,119),(420,'',420,89),(421,'',421,189),(422,'',422,79),(423,'',423,134),(424,'',424,89),(425,'',425,119),(426,'',426,189),(427,'',427,22),(428,'',428,16),(429,'',429,79),(430,'',430,120),(431,'',431,307),(432,'',432,89),(433,'',433,79),(434,'',434,22),(435,'',435,79),(436,'',436,79),(437,'',437,79),(438,'',438,548),(439,'',439,525),(440,'',440,20),(441,'',441,89),(442,'',442,89),(443,'',443,472),(444,'',444,89),(445,'',445,79),(446,'',446,94),(447,'',447,79),(448,'',448,89),(449,'',449,200),(450,'',450,79),(451,'',451,89),(452,'',452,79),(453,'',453,601),(454,'',454,79),(455,'',455,16),(456,'',456,89),(457,'',457,22),(458,'',458,79),(459,'',459,89),(460,'',460,79),(461,'',461,94),(462,'',462,89),(463,'',463,79),(464,'',464,79),(465,'',465,472),(466,'',466,74),(467,'',467,79),(468,'',468,20),(469,'',469,89),(470,'',470,79),(471,'',471,89),(472,'',472,22),(473,'',473,113),(474,'',474,20),(475,'',475,79),(476,'',476,90),(477,'',477,489),(478,'',478,89),(479,'',479,89),(480,'',480,20),(481,'',481,79),(482,'',482,22),(483,'',483,89),(484,'',484,99),(485,'',485,79),(486,'',486,89),(487,'',487,89),(488,'',488,77),(489,'',489,89),(490,'',490,20),(491,'',491,22),(492,'',492,79),(493,'',493,89),(494,'',494,22),(495,'',495,79),(496,'',496,79),(497,'',497,79),(498,'',498,79),(499,'',499,79),(500,'',500,189),(501,'',501,89),(502,'',502,287),(503,'',503,79),(504,'',504,89),(505,'',505,20),(506,'',506,565),(507,'',507,20),(508,'',508,20),(509,'',509,22),(510,'',510,79),(511,'',511,119),(512,'',512,22),(513,'',513,79),(514,'',514,77),(515,'',515,79),(516,'',516,200),(517,'',517,359),(518,'',518,79),(519,'',519,20),(520,'',520,89),(521,'',521,89),(522,'',522,16),(523,'',523,79),(524,'',524,311),(525,'',525,79),(526,'',526,94),(527,'',527,16),(528,'',528,119),(529,'',529,89),(530,'',530,20),(531,'',531,79),(532,'',532,22),(533,'',533,22),(534,'',534,79),(535,'',535,97),(536,'',536,79),(537,'',537,119),(538,'',538,22),(539,'',539,89),(540,'',540,20),(541,'',541,611),(542,'',542,307),(543,'',543,565),(544,'',544,129),(545,'',545,89),(546,'',546,89),(547,'',547,307),(548,'',548,22),(549,'',549,79),(550,'',550,79),(551,'',551,548),(552,'',552,94),(553,'',553,77),(554,'',554,89),(555,'',555,79),(556,'',556,384),(557,'',557,79),(558,'',558,79),(559,'',559,20),(560,'',560,77),(561,'',561,119),(562,'',562,89),(563,'',563,89),(564,'',564,20),(565,'',565,89),(566,'',566,79),(567,'',567,89),(568,'',568,119),(569,'',569,79),(570,'',570,189),(571,'',571,20),(572,'',572,22),(573,'',573,22),(574,'',574,189),(575,'',575,20),(576,'',576,307),(577,'',577,307),(578,'',578,441),(579,'',579,79),(580,'',580,531),(581,'',581,189),(582,'',582,94),(583,'',583,79),(584,'',584,22),(585,'',585,89),(586,'',586,20),(587,'',587,565),(588,'',588,89),(589,'',589,79),(590,'',590,79),(591,'',591,89),(592,'',592,59),(593,'',593,565),(594,'',594,79),(595,'',595,307),(596,'',596,77),(597,'',597,550),(598,'',598,550),(599,'',599,20),(600,'',600,22),(601,'',601,89),(602,'',602,20),(603,'',603,548),(604,'',604,538),(605,'',605,79),(606,'',606,89),(607,'',607,77),(608,'',608,20),(609,'',609,79),(610,'',610,20),(611,'',611,79),(612,'',612,79),(613,'',613,311),(614,'',614,119),(615,'',615,22),(616,'',616,22),(617,'',617,22),(618,'',618,77),(619,'',619,16),(620,'',620,79),(621,'',621,79),(622,'',622,77),(623,'',623,16),(624,'',624,79),(625,'',625,79),(626,'',626,20),(627,'',627,189),(628,'',628,79),(629,'',629,79),(630,'',630,79),(631,'',631,548),(632,'',632,89),(633,'',633,601),(634,'',634,89),(635,'',635,22),(636,'',636,94),(637,'',637,189),(638,'',638,89),(639,'',639,565),(640,'',640,22),(641,'',641,89),(642,'',642,601),(643,'',643,89),(644,'',644,22),(645,'',645,613),(646,'',646,20),(647,'',647,489),(648,'',648,77),(649,'',649,79),(650,'',650,89),(651,'',651,79),(652,'',652,550),(653,'',653,307),(654,'',654,79),(655,'',655,79),(656,'',656,77),(657,'',657,79),(658,'',658,550),(659,'',659,307),(660,'',660,79),(661,'',661,89),(662,'',662,22),(663,'',663,79),(664,'',664,79),(665,'',665,16),(666,'',666,79),(667,'',667,79),(668,'',668,565),(669,'',669,16),(670,'',670,89),(671,'',671,79),(672,'',672,79),(673,'',673,189),(674,'',674,20),(675,'',675,74),(676,'',676,20),(677,'',677,79),(678,'',678,79),(679,'',679,89),(680,'',680,22),(681,'',681,20),(682,'',682,22),(683,'',683,489),(684,'',684,20),(685,'',685,565),(686,'',686,79),(687,'',687,89),(688,'',688,525),(689,'',689,89),(690,'',690,79),(691,'',691,79),(692,'',692,79),(693,'',693,79),(694,'',694,89),(695,'',695,20),(696,'',696,89),(697,'',697,89),(698,'',698,79),(699,'',699,20),(700,'',700,550),(701,'',701,20),(702,'',702,565),(703,'',703,22),(704,'',704,79),(705,'',705,470),(706,'',706,79),(707,'',707,79),(708,'',708,89),(709,'',709,79),(710,'',710,20),(711,'',711,22),(712,'',712,79),(713,'',713,79),(714,'',714,89),(715,'',715,22),(716,'',716,79),(717,'',717,311),(718,'',718,16),(719,'',719,79),(720,'',720,189),(721,'',721,531),(722,'',722,79),(723,'',723,79),(724,'',724,189),(725,'',725,16),(726,'',726,79),(727,'',727,301),(728,'',728,94),(729,'',729,77),(730,'',730,79),(731,'',731,79),(732,'',732,79),(733,'',733,89),(734,'',734,204),(735,'',735,307),(736,'',736,16),(737,'',737,77),(738,'',738,89),(739,'',739,22),(740,'',740,22),(741,'',741,89),(742,'',742,79),(743,'',743,79),(744,'',744,79),(745,'',745,79),(746,'',746,89),(747,'',747,79),(748,'',748,77),(749,'',749,489),(750,'',750,94),(751,'',751,79),(752,'',752,615),(753,'',753,89),(754,'',754,79),(755,'',755,22),(756,'',756,22),(757,'',757,79),(758,'',758,79),(759,'',759,16),(760,'',760,79),(761,'',761,352),(762,'',762,189),(763,'',763,79),(764,'',764,525),(765,'',765,22),(766,'',766,22),(767,'',767,22),(768,'',768,539),(769,'',769,456),(770,'',770,189),(771,'',771,77),(772,'',772,79),(773,'',773,311),(774,'',774,22),(775,'',775,307),(776,'',776,200),(777,'',777,565),(778,'',778,89),(779,'',779,22),(780,'',780,16),(781,'',781,79),(782,'',782,89),(783,'',783,89),(784,'',784,89),(785,'',785,79),(786,'',786,91),(787,'',787,22),(788,'',788,77),(789,'',789,79),(790,'',790,79),(791,'',791,89),(792,'',792,311),(793,'',793,79),(794,'',794,16),(795,'',795,565),(796,'',796,79),(797,'',797,340),(798,'',798,22),(799,'',799,311),(800,'',800,307),(801,'',801,307),(802,'',802,79),(803,'',803,20),(804,'',804,89),(805,'',805,79),(806,'',806,79),(807,'',807,94),(808,'',808,16),(809,'',809,79),(810,'',810,20),(811,'',811,20),(812,'',812,79),(813,'',813,79),(814,'',814,119),(815,'',815,89),(816,'',816,601),(817,'',817,77),(818,'',818,79),(819,'',819,22),(820,'',820,79),(821,'',821,79),(822,'',822,20),(823,'',823,79),(824,'',824,119),(825,'',825,79),(826,'',826,79),(827,'',827,119),(828,'',828,79),(829,'',829,79),(830,'',830,525),(831,'',831,307),(832,'',832,89),(833,'',833,89),(834,'',834,79),(835,'',835,79),(836,'',836,119),(837,'',837,89),(838,'',838,79),(839,'',839,20),(840,'',840,89),(841,'',841,79),(842,'',842,20),(843,'',843,22),(844,'',844,20),(845,'',845,311),(846,'',846,79),(847,'',847,79),(848,'',848,22),(849,'',849,200),(850,'',850,311),(851,'',851,79),(852,'',852,20),(853,'',853,89),(854,'',854,20),(855,'',855,89),(856,'',856,79),(857,'',857,20),(858,'',858,79),(859,'',859,79),(860,'',860,79),(861,'',861,94),(862,'',862,113),(863,'',863,79),(864,'',864,20),(865,'',865,20),(866,'',866,77),(867,'',867,113),(868,'',868,20),(869,'',869,79),(870,'',870,16),(871,'',871,531),(872,'',872,79),(873,'',873,20),(874,'',874,79),(875,'',875,79),(876,'',876,89),(877,'',877,489),(878,'',878,89),(879,'',879,119),(880,'',880,79),(881,'',881,79),(882,'',882,77),(883,'',883,94),(884,'',884,489),(885,'',885,89),(886,'',886,22),(887,'',887,20),(888,'',888,79),(889,'',889,22),(890,'',890,189),(891,'',891,22),(892,'',892,16),(893,'',893,89),(894,'',894,79),(895,'',895,89),(896,'',896,601),(897,'',897,89),(898,'',898,22),(899,'',899,89),(900,'',900,565),(901,'',901,79),(902,'',902,79),(903,'',903,79),(904,'',904,565),(905,'',905,79),(906,'',906,22),(907,'',907,89),(908,'',908,550),(909,'',909,79),(910,'',910,79),(911,'',911,79),(912,'',912,22),(913,'',913,119),(914,'',914,20),(915,'',915,79),(916,'',916,189),(917,'',917,22),(918,'',918,264),(919,'',919,79),(920,'',920,89),(921,'',921,89),(922,'',922,22),(923,'',923,79),(924,'',924,22),(925,'',925,79),(926,'',926,20),(927,'',927,79),(928,'',928,20),(929,'',929,79),(930,'',930,89),(931,'',931,79),(932,'',932,20),(933,'',933,79),(934,'',934,79),(935,'',935,89),(936,'',936,89),(937,'',937,22),(938,'',938,79),(939,'',939,89),(940,'',940,16),(941,'',941,264),(942,'',942,79),(943,'',943,22),(944,'',944,22),(945,'',945,311),(946,'',946,79),(947,'',947,79),(948,'',948,200),(949,'',949,79),(950,'',950,89),(951,'',951,730),(952,'',952,89),(953,'',953,540),(954,'',954,89),(955,'',955,189),(956,'',956,489),(957,'',957,312),(958,'',958,20),(959,'',959,89),(960,'',960,189),(961,'',961,89),(962,'',962,77),(963,'',963,79),(964,'',964,89),(965,'',965,307),(966,'',966,89),(967,'',967,400),(968,'',968,74),(969,'',969,22),(970,'',970,89),(971,'',971,89),(972,'',972,79),(973,'',973,20),(974,'',974,77),(975,'',975,79),(976,'',976,89),(977,'',977,79),(978,'',978,20),(979,'',979,307),(980,'',980,16),(981,'',981,89),(982,'',982,94),(983,'',983,77),(984,'',984,79),(985,'',985,79),(986,'',986,16),(987,'',987,79),(988,'',988,79),(989,'',989,119),(990,'',990,22),(991,'',991,384),(992,'',992,20),(993,'',993,79),(994,'',994,89),(995,'',995,22),(996,'',996,89),(997,'',997,79),(998,'',998,22),(999,'',999,89),(1000,'',1000,89),(1001,'',1001,119),(1002,'',1002,89),(1003,'',1003,200),(1004,'',1004,79),(1005,'',1005,89),(1006,'',1006,20),(1007,'',1007,489),(1008,'',1008,79),(1009,'',1009,20),(1010,'',1010,77),(1011,'',1011,565),(1012,'',1012,79),(1013,'',1013,22),(1014,'',1014,89),(1015,'',1015,307),(1016,'',1016,307),(1017,'',1017,79),(1018,'',1018,79),(1019,'',1019,89),(1020,'',1020,525),(1021,'',1021,22),(1022,'',1022,89),(1023,'',1023,119),(1024,'',1024,548),(1025,'',1025,548),(1026,'',1026,89),(1027,'',1027,79),(1028,'',1028,79),(1029,'',1029,89),(1030,'',1030,22),(1031,'',1031,601),(1032,'',1032,79),(1033,'',1033,89),(1034,'',1034,79),(1035,'',1035,489),(1036,'',1036,89),(1037,'',1037,79),(1038,'',1038,79),(1039,'',1039,79),(1040,'',1040,200),(1041,'',1041,89),(1042,'',1042,79),(1043,'',1043,79),(1044,'',1044,77),(1045,'',1045,79),(1046,'',1046,99),(1047,'',1047,89),(1048,'',1048,79),(1049,'',1049,20),(1050,'',1050,89),(1051,'',1051,22),(1052,'',1052,89),(1053,'',1053,79),(1054,'',1054,79),(1055,'',1055,79),(1056,'',1056,94),(1057,'',1057,489),(1058,'',1058,22),(1059,'',1059,22),(1060,'',1060,22),(1061,'',1061,79),(1062,'',1062,22),(1063,'',1063,113),(1064,'',1064,79),(1065,'',1065,79),(1066,'',1066,94),(1067,'',1067,16),(1068,'',1068,89),(1069,'',1069,565),(1070,'',1070,612),(1071,'',1071,89),(1072,'',1072,79),(1073,'',1073,79),(1074,'',1074,89),(1075,'',1075,20),(1076,'',1076,548),(1077,'',1077,189),(1078,'',1078,79),(1079,'',1079,94),(1080,'',1080,89),(1081,'',1081,89),(1082,'',1082,79),(1083,'',1083,91),(1084,'',1084,89),(1085,'',1085,77),(1086,'',1086,89),(1087,'',1087,79),(1088,'',1088,89),(1089,'',1089,20),(1090,'',1090,89),(1091,'',1091,565),(1092,'',1092,89),(1093,'',1093,565),(1094,'',1094,16),(1095,'',1095,16),(1096,'',1096,16),(1097,'',1097,79),(1098,'',1098,79),(1099,'',1099,22),(1100,'',1100,548),(1101,'',1101,20),(1102,'',1102,79),(1103,'',1103,22),(1104,'',1104,89),(1105,'',1105,79),(1106,'',1106,74),(1107,'',1107,22),(1108,'',1108,189),(1109,'',1109,525),(1110,'',1110,548),(1111,'',1111,79),(1112,'',1112,79),(1113,'',1113,79),(1114,'',1114,20),(1115,'',1115,89),(1116,'',1116,22),(1117,'',1117,89),(1118,'',1118,189),(1119,'',1119,89),(1120,'',1120,489),(1121,'',1121,22),(1122,'',1122,89),(1123,'',1123,89),(1124,'',1124,79),(1125,'',1125,20),(1126,'',1126,16),(1127,'',1127,79),(1128,'',1128,89),(1129,'',1129,89),(1130,'',1130,22),(1131,'',1131,89),(1132,'',1132,20),(1133,'',1133,307),(1134,'',1134,79),(1135,'',1135,20),(1136,'',1136,89),(1137,'',1137,79),(1138,'',1138,89),(1139,'',1139,16),(1140,'',1140,89),(1141,'',1141,425),(1142,'',1142,79),(1143,'',1143,89),(1144,'',1144,89),(1145,'',1145,22),(1146,'',1146,311),(1147,'',1147,311),(1148,'',1148,489),(1149,'',1149,20),(1150,'',1150,89),(1151,'',1151,89),(1152,'',1152,22),(1153,'',1153,79),(1154,'',1154,264),(1155,'',1155,22),(1156,'',1156,548),(1157,'',1157,20),(1158,'',1158,200),(1159,'',1159,307),(1160,'',1160,94),(1161,'',1161,89),(1162,'',1162,20),(1163,'',1163,79),(1164,'',1164,79),(1165,'',1165,89),(1166,'',1166,89),(1167,'',1167,22),(1168,'',1168,89),(1169,'',1169,707),(1170,'',1170,79),(1171,'',1171,79),(1172,'',1172,89),(1173,'',1173,22),(1174,'',1174,22),(1175,'',1175,89),(1176,'',1176,79),(1177,'',1177,565),(1178,'',1178,77),(1179,'',1179,79),(1180,'',1180,79),(1181,'',1181,20),(1182,'',1182,77),(1183,'',1183,89),(1184,'',1184,20),(1185,'',1185,22),(1186,'',1186,20),(1187,'',1187,89),(1188,'',1188,89),(1189,'',1189,77),(1190,'',1190,119),(1191,'',1191,79),(1192,'',1192,89),(1193,'',1193,311),(1194,'',1194,89),(1195,'',1195,79),(1196,'',1196,97),(1197,'',1197,79),(1198,'',1198,89),(1199,'',1199,22),(1200,'',1200,79),(1201,'',1201,79),(1202,'',1202,489),(1203,'',1203,89),(1204,'',1204,89),(1205,'',1205,189),(1206,'',1206,22),(1207,'',1207,89),(1208,'',1208,89),(1209,'',1209,20),(1210,'',1210,79),(1211,'',1211,20),(1212,'',1212,77),(1213,'',1213,79),(1214,'',1214,94),(1215,'',1215,119),(1216,'',1216,79),(1217,'',1217,612),(1218,'',1218,77),(1219,'',1219,89),(1220,'',1220,189),(1221,'',1221,89),(1222,'',1222,20),(1223,'',1223,20),(1224,'',1224,307),(1225,'',1225,79),(1226,'',1226,89),(1227,'',1227,20),(1228,'',1228,79),(1229,'',1229,79),(1230,'',1230,489),(1231,'',1231,79),(1232,'',1232,119),(1233,'',1233,307),(1234,'',1234,79),(1235,'',1235,20),(1236,'',1236,189),(1237,'',1237,89),(1238,'',1238,16),(1239,'',1239,77),(1240,'',1240,311),(1241,'',1241,20),(1242,'',1242,74),(1243,'',1243,307),(1244,'',1244,79),(1245,'',1245,89),(1246,'',1246,20),(1247,'',1247,550),(1248,'',1248,89),(1249,'',1249,89),(1250,'',1250,79),(1251,'',1251,20),(1252,'',1252,89),(1253,'',1253,489),(1254,'',1254,89),(1255,'',1255,79),(1256,'',1256,75),(1257,'',1257,79),(1258,'',1258,79),(1259,'',1259,79),(1260,'',1260,89),(1261,'',1261,79),(1262,'',1262,94),(1263,'',1263,20),(1264,'',1264,89),(1265,'',1265,89),(1266,'',1266,311),(1267,'',1267,89),(1268,'',1268,20),(1269,'',1269,79),(1270,'',1270,79),(1271,'',1271,20),(1272,'',1272,119),(1273,'',1273,89),(1274,'',1274,311),(1275,'',1275,79),(1276,'',1276,22),(1277,'',1277,79),(1278,'',1278,79),(1279,'',1279,94),(1280,'',1280,22),(1281,'',1281,79),(1282,'',1282,89),(1283,'',1283,79),(1284,'',1284,89),(1285,'',1285,89),(1286,'',1286,89),(1287,'',1287,79),(1288,'',1288,22),(1289,'',1289,119),(1290,'',1290,565),(1291,'',1291,79),(1292,'',1292,22),(1293,'',1293,89),(1294,'',1294,89),(1295,'',1295,565),(1296,'',1296,79),(1297,'',1297,79),(1298,'',1298,489),(1299,'',1299,79),(1300,'',1300,16),(1301,'',1301,16),(1302,'',1302,359),(1303,'',1303,298),(1304,'',1304,79),(1305,'',1305,601),(1306,'',1306,79),(1307,'',1307,89),(1308,'',1308,20),(1309,'',1309,699),(1310,'',1310,79),(1311,'',1311,22),(1312,'',1312,548),(1313,'',1313,548),(1314,'',1314,200),(1315,'',1315,22),(1316,'',1316,79),(1317,'',1317,79),(1318,'',1318,79),(1319,'',1319,89),(1320,'',1320,22),(1321,'',1321,119),(1322,'',1322,89),(1323,'',1323,79),(1324,'',1324,79),(1325,'',1325,79),(1326,'',1326,565),(1327,'',1327,79),(1328,'',1328,77),(1329,'',1329,22),(1330,'',1330,16),(1331,'',1331,79),(1332,'',1332,20),(1333,'',1333,79),(1334,'',1334,20),(1335,'',1335,22),(1336,'',1336,79),(1337,'',1337,77),(1338,'',1338,119),(1339,'',1339,298),(1340,'',1340,79),(1341,'',1341,89),(1342,'',1342,77),(1343,'',1343,79),(1344,'',1344,74),(1345,'',1345,89),(1346,'',1346,20),(1347,'',1347,79),(1348,'',1348,89),(1349,'',1349,89),(1350,'',1350,22),(1351,'',1351,79),(1352,'',1352,20),(1353,'',1353,89),(1354,'',1354,79),(1355,'',1355,615),(1356,'',1356,89),(1357,'',1357,79),(1358,'',1358,189),(1359,'',1359,89),(1360,'',1360,79),(1361,'',1361,117),(1362,'',1362,22),(1363,'',1363,311),(1364,'',1364,89),(1365,'',1365,20),(1366,'',1366,79),(1367,'',1367,89),(1368,'',1368,79),(1369,'',1369,16),(1370,'',1370,20),(1371,'',1371,200),(1372,'',1372,94),(1373,'',1373,456),(1374,'',1374,79),(1375,'',1375,94),(1376,'',1376,79),(1377,'',1377,22),(1378,'',1378,79),(1379,'',1379,472),(1380,'',1380,89),(1381,'',1381,74),(1382,'',1382,20),(1383,'',1383,89),(1384,'',1384,20),(1385,'',1385,548),(1386,'',1386,22),(1387,'',1387,89),(1388,'',1388,77),(1389,'',1389,79),(1390,'',1390,20),(1391,'',1391,89),(1392,'',1392,79),(1393,'',1393,548),(1394,'',1394,489),(1395,'',1395,538),(1396,'',1396,531),(1397,'',1397,89),(1398,'',1398,20),(1399,'',1399,20),(1400,'',1400,79),(1401,'',1401,79),(1402,'',1402,79),(1403,'',1403,89),(1404,'',1404,307),(1405,'',1405,89),(1406,'',1406,79),(1407,'',1407,20),(1408,'',1408,79),(1409,'',1409,89),(1410,'',1410,79),(1411,'',1411,91),(1412,'',1412,16),(1413,'',1413,352),(1414,'',1414,79),(1415,'',1415,79),(1416,'',1416,79),(1417,'',1417,79),(1418,'',1418,79),(1419,'',1419,22),(1420,'',1420,20),(1421,'',1421,79),(1422,'',1422,79),(1423,'',1423,79),(1424,'',1424,20),(1425,'',1425,79),(1426,'',1426,79),(1427,'',1427,89),(1428,'',1428,79),(1429,'',1429,22),(1430,'',1430,79),(1431,'',1431,531),(1432,'',1432,119),(1433,'',1433,22),(1434,'',1434,89),(1435,'',1435,22),(1436,'',1436,20),(1437,'',1437,89),(1438,'',1438,20),(1439,'',1439,89),(1440,'',1440,89),(1441,'',1441,79),(1442,'',1442,89),(1443,'',1443,489),(1444,'',1444,79),(1445,'',1445,22),(1446,'',1446,79),(1447,'',1447,79),(1448,'',1448,79),(1449,'',1449,89),(1450,'',1450,22),(1451,'',1451,16),(1452,'',1452,89),(1453,'',1453,79),(1454,'',1454,525),(1455,'',1455,16),(1456,'',1456,77),(1457,'',1457,79),(1458,'',1458,525),(1459,'',1459,89),(1460,'',1460,79),(1461,'',1461,79),(1462,'',1462,89),(1463,'',1463,79),(1464,'',1464,89),(1465,'',1465,79),(1466,'',1466,94),(1467,'',1467,94),(1468,'',1468,523),(1469,'',1469,79),(1470,'',1470,89),(1471,'',1471,22),(1472,'',1472,89),(1473,'',1473,89),(1474,'',1474,94),(1475,'',1475,79),(1476,'',1476,16),(1477,'',1477,22),(1478,'',1478,79),(1479,'',1479,79),(1480,'',1480,22),(1481,'',1481,20),(1482,'',1482,79),(1483,'',1483,489),(1484,'',1484,89),(1485,'',1485,204),(1486,'',1486,307),(1487,'',1487,79),(1488,'',1488,20),(1489,'',1489,89),(1490,'',1490,79),(1491,'',1491,89),(1492,'',1492,79),(1493,'',1493,89),(1494,'',1494,89),(1495,'',1495,89),(1496,'',1496,22),(1497,'',1497,20),(1498,'',1498,89),(1499,'',1499,20),(1500,'',1500,613),(1501,'',1501,89),(1502,'',1502,79),(1503,'',1503,489),(1504,'',1504,189),(1505,'',1505,89),(1506,'',1506,79),(1507,'',1507,89),(1508,'',1508,22),(1509,'',1509,209),(1510,'',1510,79),(1511,'',1511,94),(1512,'',1512,79),(1513,'',1513,79),(1514,'',1514,89),(1515,'',1515,79),(1516,'',1516,79),(1517,'',1517,79),(1518,'',1518,79),(1519,'',1519,22),(1520,'',1520,20),(1521,'',1521,565),(1522,'',1522,626),(1523,'',1523,89),(1524,'',1524,77),(1525,'',1525,94),(1526,'',1526,89),(1527,'',1527,287),(1528,'',1528,77),(1529,'',1529,189),(1530,'',1530,79),(1531,'',1531,79),(1532,'',1532,22),(1533,'',1533,89),(1534,'',1534,189),(1535,'',1535,89),(1536,'',1536,20),(1537,'',1537,89),(1538,'',1538,77),(1539,'',1539,79),(1540,'',1540,200),(1541,'',1541,79),(1542,'',1542,79),(1543,'',1543,94),(1544,'',1544,189),(1545,'',1545,16),(1546,'',1546,89),(1547,'',1547,79),(1548,'',1548,565),(1549,'',1549,550),(1550,'',1550,79),(1551,'',1551,307),(1552,'',1552,20),(1553,'',1553,22),(1554,'',1554,565),(1555,'',1555,79),(1556,'',1556,79),(1557,'',1557,264),(1558,'',1558,79),(1559,'',1559,89),(1560,'',1560,307),(1561,'',1561,79),(1562,'',1562,94),(1563,'',1563,79),(1564,'',1564,307),(1565,'',1565,79),(1566,'',1566,20),(1567,'',1567,22),(1568,'',1568,79),(1569,'',1569,16),(1570,'',1570,89),(1571,'',1571,79),(1572,'',1572,89),(1573,'',1573,79),(1574,'',1574,22),(1575,'',1575,89),(1576,'',1576,79),(1577,'',1577,79),(1578,'',1578,20),(1579,'',1579,20),(1580,'',1580,79),(1581,'',1581,16),(1582,'',1582,79),(1583,'',1583,79),(1584,'',1584,79),(1585,'',1585,77),(1586,'',1586,89),(1587,'',1587,79),(1588,'',1588,79),(1589,'',1589,22),(1590,'',1590,89),(1591,'',1591,489),(1592,'',1592,20),(1593,'',1593,22),(1594,'',1594,16),(1595,'',1595,16),(1596,'',1596,22),(1597,'',1597,89),(1598,'',1598,20),(1599,'',1599,79),(1600,'',1600,548),(1601,'',1601,79),(1602,'',1602,77),(1603,'',1603,74),(1604,'',1604,94),(1605,'',1605,565),(1606,'',1606,79),(1607,'',1607,565),(1608,'',1608,20),(1609,'',1609,548),(1610,'',1610,89),(1611,'',1611,79),(1612,'',1612,22),(1613,'',1613,94),(1614,'',1614,16),(1615,'',1615,16),(1616,'',1616,189),(1617,'',1617,16),(1618,'',1618,307),(1619,'',1619,200),(1620,'',1620,79),(1621,'',1621,20),(1622,'',1622,89),(1623,'',1623,79),(1624,'',1624,79),(1625,'',1625,79),(1626,'',1626,20),(1627,'',1627,79),(1628,'',1628,79),(1629,'',1629,288),(1630,'',1630,79),(1631,'',1631,79),(1632,'',1632,79),(1633,'',1633,79),(1634,'',1634,79),(1635,'',1635,89),(1636,'',1636,79),(1637,'',1637,79),(1638,'',1638,94),(1639,'',1639,79),(1640,'',1640,94),(1641,'',1641,89),(1642,'',1642,22),(1643,'',1643,89),(1644,'',1644,189),(1645,'',1645,20),(1646,'',1646,89),(1647,'',1647,384),(1648,'',1648,79),(1649,'',1649,16),(1650,'',1650,16),(1651,'',1651,79),(1652,'',1652,22),(1653,'',1653,307),(1654,'',1654,200),(1655,'',1655,89),(1656,'',1656,565),(1657,'',1657,548),(1658,'',1658,79),(1659,'',1659,89),(1660,'',1660,20),(1661,'',1661,601),(1662,'',1662,79),(1663,'',1663,89),(1664,'',1664,77),(1665,'',1665,89),(1666,'',1666,22),(1667,'',1667,307),(1668,'',1668,79),(1669,'',1669,79),(1670,'',1670,79),(1671,'',1671,79),(1672,'',1672,79),(1673,'',1673,79),(1674,'',1674,601),(1675,'',1675,22),(1676,'',1676,94),(1677,'',1677,20),(1678,'',1678,79),(1679,'',1679,77),(1680,'',1680,89),(1681,'',1681,79),(1682,'',1682,79),(1683,'',1683,79),(1684,'',1684,79),(1685,'',1685,189),(1686,'',1686,79),(1687,'',1687,489),(1688,'',1688,89),(1689,'',1689,79),(1690,'',1690,79),(1691,'',1691,89),(1692,'',1692,699),(1693,'',1693,79),(1694,'',1694,79),(1695,'',1695,307),(1696,'',1696,22),(1697,'',1697,94),(1698,'',1698,22),(1699,'',1699,79),(1700,'',1700,89),(1701,'',1701,565),(1702,'',1702,79),(1703,'',1703,598),(1704,'',1704,79),(1705,'',1705,16),(1706,'',1706,20),(1707,'',1707,89),(1708,'',1708,189),(1709,'',1709,22),(1710,'',1710,79),(1711,'',1711,79),(1712,'',1712,307),(1713,'',1713,79),(1714,'',1714,20),(1715,'',1715,79),(1716,'',1716,89),(1717,'',1717,79),(1718,'',1718,79),(1719,'',1719,20),(1720,'',1720,119),(1721,'',1721,22),(1722,'',1722,20),(1723,'',1723,22),(1724,'',1724,89),(1725,'',1725,79),(1726,'',1726,79),(1727,'',1727,79),(1728,'',1728,79),(1729,'',1729,89),(1730,'',1730,79),(1731,'',1731,89),(1732,'',1732,79),(1733,'',1733,22),(1734,'',1734,89),(1735,'',1735,20),(1736,'',1736,94),(1737,'',1737,548),(1738,'',1738,79),(1739,'',1739,22),(1740,'',1740,79),(1741,'',1741,79),(1742,'',1742,79),(1743,'',1743,79),(1744,'',1744,16),(1745,'',1745,119),(1746,'',1746,79),(1747,'',1747,20),(1748,'',1748,79),(1749,'',1749,117),(1750,'',1750,307),(1751,'',1751,79),(1752,'',1752,189),(1753,'',1753,548),(1754,'',1754,89),(1755,'',1755,79),(1756,'',1756,89),(1757,'',1757,89),(1758,'',1758,16),(1759,'',1759,20),(1760,'',1760,20),(1761,'',1761,79),(1762,'',1762,79),(1763,'',1763,77),(1764,'',1764,22),(1765,'',1765,550),(1766,'',1766,20),(1767,'',1767,79),(1768,'',1768,489),(1769,'',1769,89),(1770,'',1770,79),(1771,'',1771,22),(1772,'',1772,20),(1773,'',1773,79),(1774,'',1774,79),(1775,'',1775,79),(1776,'',1776,16),(1777,'',1777,79),(1778,'',1778,22),(1779,'',1779,550),(1780,'',1780,20),(1781,'',1781,22),(1782,'',1782,264),(1783,'',1783,79),(1784,'',1784,352),(1785,'',1785,77),(1786,'',1786,89),(1787,'',1787,77),(1788,'',1788,120),(1789,'',1789,79),(1790,'',1790,22),(1791,'',1791,79),(1792,'',1792,79),(1793,'',1793,22),(1794,'',1794,89),(1795,'',1795,22),(1796,'',1796,311),(1797,'',1797,614),(1798,'',1798,22),(1799,'',1799,89),(1800,'',1800,79),(1801,'',1801,489),(1802,'',1802,22),(1803,'',1803,20),(1804,'',1804,99),(1805,'',1805,94),(1806,'',1806,89),(1807,'',1807,79),(1808,'',1808,189),(1809,'',1809,79),(1810,'',1810,20),(1811,'',1811,22),(1812,'',1812,79),(1813,'',1813,79),(1814,'',1814,77),(1815,'',1815,264),(1816,'',1816,79),(1817,'',1817,79),(1818,'',1818,22),(1819,'',1819,79),(1820,'',1820,189),(1821,'',1821,20),(1822,'',1822,79),(1823,'',1823,77),(1824,'',1824,79),(1825,'',1825,20),(1826,'',1826,89),(1827,'',1827,489),(1828,'',1828,22),(1829,'',1829,525),(1830,'',1830,79),(1831,'',1831,119),(1832,'',1832,79),(1833,'',1833,79),(1834,'',1834,79),(1835,'',1835,79),(1836,'',1836,22),(1837,'',1837,20),(1838,'',1838,89),(1839,'',1839,79),(1840,'',1840,22),(1841,'',1841,89),(1842,'',1842,311),(1843,'',1843,79),(1844,'',1844,79),(1845,'',1845,89),(1846,'',1846,20),(1847,'',1847,89),(1848,'',1848,79),(1849,'',1849,94),(1850,'',1850,89),(1851,'',1851,79),(1852,'',1852,456),(1853,'',1853,565),(1854,'',1854,22),(1855,'',1855,79),(1856,'',1856,384),(1857,'',1857,22),(1858,'',1858,74),(1859,'',1859,565),(1860,'',1860,79),(1861,'',1861,307),(1862,'',1862,89),(1863,'',1863,20),(1864,'',1864,79),(1865,'',1865,77),(1866,'',1866,550),(1867,'',1867,20),(1868,'',1868,79),(1869,'',1869,79),(1870,'',1870,539),(1871,'',1871,20),(1872,'',1872,89),(1873,'',1873,119),(1874,'',1874,20),(1875,'',1875,20),(1876,'',1876,89),(1877,'',1877,79),(1878,'',1878,89),(1879,'',1879,79),(1880,'',1880,20),(1881,'',1881,89),(1882,'',1882,400),(1883,'',1883,22),(1884,'',1884,79),(1885,'',1885,89),(1886,'',1886,20),(1887,'',1887,20),(1888,'',1888,79),(1889,'',1889,77),(1890,'',1890,22),(1891,'',1891,79),(1892,'',1892,20),(1893,'',1893,297),(1894,'',1894,79),(1895,'',1895,16),(1896,'',1896,94),(1897,'',1897,134),(1898,'',1898,79),(1899,'',1899,16),(1900,'',1900,79),(1901,'',1901,79),(1902,'',1902,79),(1903,'',1903,79),(1904,'',1904,79),(1905,'',1905,79),(1906,'',1906,79),(1907,'',1907,540),(1908,'',1908,22),(1909,'',1909,20),(1910,'',1910,20),(1911,'',1911,20),(1912,'',1912,22),(1913,'',1913,22),(1914,'',1914,20),(1915,'',1915,94),(1916,'',1916,79),(1917,'',1917,79),(1918,'',1918,79),(1919,'',1919,22),(1920,'',1920,601),(1921,'',1921,79),(1922,'',1922,352),(1923,'',1923,119),(1924,'',1924,79),(1925,'',1925,79),(1926,'',1926,79),(1927,'',1927,79),(1928,'',1928,311),(1929,'',1929,79),(1930,'',1930,307),(1931,'',1931,74),(1932,'',1932,307),(1933,'',1933,74),(1934,'',1934,20),(1935,'',1935,22),(1936,'',1936,79),(1937,'',1937,79),(1938,'',1938,79),(1939,'',1939,307),(1940,'',1940,20),(1941,'',1941,22),(1942,'',1942,22),(1943,'',1943,89),(1944,'',1944,94),(1945,'',1945,79),(1946,'',1946,79),(1947,'',1947,79),(1948,'',1948,79),(1949,'',1949,22),(1950,'',1950,79),(1951,'',1951,89),(1952,'',1952,89),(1953,'',1953,565),(1954,'',1954,89),(1955,'',1955,16),(1956,'',1956,565),(1957,'',1957,79),(1958,'',1958,119),(1959,'',1959,310),(1960,'',1960,77),(1961,'',1961,79),(1962,'',1962,79),(1963,'',1963,16),(1964,'',1964,22),(1965,'',1965,79),(1966,'',1966,79),(1967,'',1967,79),(1968,'',1968,20),(1969,'',1969,22),(1970,'',1970,79),(1971,'',1971,22),(1972,'',1972,89),(1973,'',1973,77),(1974,'',1974,89),(1975,'',1975,79),(1976,'',1976,20),(1977,'',1977,16),(1978,'',1978,89),(1979,'',1979,94),(1980,'',1980,79),(1981,'',1981,20),(1982,'',1982,22),(1983,'',1983,79),(1984,'',1984,89),(1985,'',1985,89),(1986,'',1986,189),(1987,'',1987,16),(1988,'',1988,79),(1989,'',1989,89),(1990,'',1990,20),(1991,'',1991,89),(1992,'',1992,20),(1993,'',1993,89),(1994,'',1994,20),(1995,'',1995,489),(1996,'',1996,88),(1997,'',1997,20),(1998,'',1998,525),(1999,'',1999,79),(2000,'',2000,79),(2001,'',2001,79),(2002,'',2002,259),(2003,'',2003,22),(2004,'',2004,79),(2005,'',2005,550),(2006,'',2006,79),(2007,'',2007,89),(2008,'',2008,20),(2009,'',2009,79),(2010,'',2010,79),(2011,'',2011,565),(2012,'',2012,79),(2013,'',2013,94),(2014,'',2014,79),(2015,'',2015,441),(2016,'',2016,79),(2017,'',2017,134),(2018,'',2018,307),(2019,'',2019,22),(2020,'',2020,79),(2021,'',2021,79),(2022,'',2022,89),(2023,'',2023,94),(2024,'',2024,20),(2025,'',2025,209),(2026,'',2026,200),(2027,'',2027,20),(2028,'',2028,20),(2029,'',2029,79),(2030,'',2030,22),(2031,'',2031,22),(2032,'',2032,89),(2033,'',2033,79),(2034,'',2034,307),(2035,'',2035,16),(2036,'',2036,79),(2037,'',2037,20),(2038,'',2038,79),(2039,'',2039,94),(2040,'',2040,20),(2041,'',2041,89),(2042,'',2042,119),(2043,'',2043,89),(2044,'',2044,79),(2045,'',2045,79),(2046,'',2046,89),(2047,'',2047,89),(2048,'',2048,79),(2049,'',2049,94),(2050,'',2050,89),(2051,'',2051,89),(2052,'',2052,119),(2053,'',2053,94),(2054,'',2054,77),(2055,'',2055,79),(2056,'',2056,79),(2057,'',2057,79),(2058,'',2058,20),(2059,'',2059,20),(2060,'',2060,89),(2061,'',2061,20),(2062,'',2062,77),(2063,'',2063,79),(2064,'',2064,22),(2065,'',2065,548),(2066,'',2066,22),(2067,'',2067,22),(2068,'',2068,189),(2069,'',2069,89),(2070,'',2070,16),(2071,'',2071,79),(2072,'',2072,20),(2073,'',2073,79),(2074,'',2074,79),(2075,'',2075,79),(2076,'',2076,77),(2077,'',2077,189),(2078,'',2078,79),(2079,'',2079,89),(2080,'',2080,79),(2081,'',2081,79),(2082,'',2082,22),(2083,'',2083,79),(2084,'',2084,20),(2085,'',2085,565),(2086,'',2086,22),(2087,'',2087,548),(2088,'',2088,79),(2089,'',2089,307),(2090,'',2090,434),(2091,'',2091,74),(2092,'',2092,79),(2093,'',2093,470),(2094,'',2094,89),(2095,'',2095,89),(2096,'',2096,79),(2097,'',2097,79),(2098,'',2098,89),(2099,'',2099,119),(2100,'',2100,79),(2101,'',2101,359),(2102,'',2102,79),(2103,'',2103,89),(2104,'',2104,79),(2105,'',2105,20),(2106,'',2106,89),(2107,'',2107,22),(2108,'',2108,79),(2109,'',2109,89),(2110,'',2110,22),(2111,'',2111,22),(2112,'',2112,16),(2113,'',2113,550),(2114,'',2114,79),(2115,'',2115,22),(2116,'',2116,79),(2117,'',2117,311),(2118,'',2118,20),(2119,'',2119,79),(2120,'',2120,79),(2121,'',2121,20),(2122,'',2122,16),(2123,'',2123,79),(2124,'',2124,489),(2125,'',2125,20),(2126,'',2126,79),(2127,'',2127,20),(2128,'',2128,89),(2129,'',2129,22),(2130,'',2130,79),(2131,'',2131,89),(2132,'',2132,456),(2133,'',2133,94),(2134,'',2134,489),(2135,'',2135,20),(2136,'',2136,264),(2137,'',2137,79),(2138,'',2138,22),(2139,'',2139,22),(2140,'',2140,79),(2141,'',2141,20),(2142,'',2142,200),(2143,'',2143,79),(2144,'',2144,189),(2145,'',2145,89),(2146,'',2146,89),(2147,'',2147,20),(2148,'',2148,489),(2149,'',2149,22),(2150,'',2150,79),(2151,'',2151,22),(2152,'',2152,89),(2153,'',2153,79),(2154,'',2154,20),(2155,'',2155,77),(2156,'',2156,16),(2157,'',2157,16),(2158,'',2158,79),(2159,'',2159,89),(2160,'',2160,22),(2161,'',2161,20),(2162,'',2162,79),(2163,'',2163,16),(2164,'',2164,94),(2165,'',2165,22),(2166,'',2166,16),(2167,'',2167,89),(2168,'',2168,548),(2169,'',2169,89),(2170,'',2170,89),(2171,'',2171,22),(2172,'',2172,22),(2173,'',2173,89),(2174,'',2174,307),(2175,'',2175,79),(2176,'',2176,79),(2177,'',2177,119),(2178,'',2178,89),(2179,'',2179,89),(2180,'',2180,89),(2181,'',2181,89),(2182,'',2182,16),(2183,'',2183,79),(2184,'',2184,20),(2185,'',2185,79),(2186,'',2186,200),(2187,'',2187,79),(2188,'',2188,89),(2189,'',2189,89),(2190,'',2190,16),(2191,'',2191,189),(2192,'',2192,79),(2193,'',2193,20),(2194,'',2194,565),(2195,'',2195,307),(2196,'',2196,120),(2197,'',2197,189),(2198,'',2198,79),(2199,'',2199,79),(2200,'',2200,79),(2201,'',2201,89),(2202,'',2202,22),(2203,'',2203,89),(2204,'',2204,79),(2205,'',2205,79),(2206,'',2206,79),(2207,'',2207,94),(2208,'',2208,548),(2209,'',2209,538),(2210,'',2210,89),(2211,'',2211,94),(2212,'',2212,79),(2213,'',2213,79),(2214,'',2214,79),(2215,'',2215,307),(2216,'',2216,89),(2217,'',2217,79),(2218,'',2218,79),(2219,'',2219,79),(2220,'',2220,89),(2221,'',2221,20),(2222,'',2222,89),(2223,'',2223,79),(2224,'',2224,89),(2225,'',2225,22),(2226,'',2226,264),(2227,'',2227,16),(2228,'',2228,89),(2229,'',2229,189),(2230,'',2230,20),(2231,'',2231,89),(2232,'',2232,189),(2233,'',2233,352),(2234,'',2234,89),(2235,'',2235,89),(2236,'',2236,89),(2237,'',2237,22),(2238,'',2238,22),(2239,'',2239,89),(2240,'',2240,89),(2241,'',2241,77),(2242,'',2242,77),(2243,'',2243,89),(2244,'',2244,89),(2245,'',2245,79),(2246,'',2246,79),(2247,'',2247,79),(2248,'',2248,79),(2249,'',2249,79),(2250,'',2250,79),(2251,'',2251,79),(2252,'',2252,79),(2253,'',2253,89),(2254,'',2254,531),(2255,'',2255,307),(2256,'',2256,119),(2257,'',2257,548),(2258,'',2258,89),(2259,'',2259,75),(2260,'',2260,134),(2261,'',2261,489),(2262,'',2262,89),(2263,'',2263,525),(2264,'',2264,307),(2265,'',2265,79),(2266,'',2266,200),(2267,'',2267,16),(2268,'',2268,20),(2269,'',2269,89),(2270,'',2270,20),(2271,'',2271,79),(2272,'',2272,89),(2273,'',2273,119),(2274,'',2274,22),(2275,'',2275,79),(2276,'',2276,489),(2277,'',2277,79),(2278,'',2278,79),(2279,'',2279,79),(2280,'',2280,200),(2281,'',2281,79),(2282,'',2282,22),(2283,'',2283,79),(2284,'',2284,89),(2285,'',2285,77),(2286,'',2286,94),(2287,'',2287,22),(2288,'',2288,565),(2289,'',2289,98),(2290,'',2290,79),(2291,'',2291,22),(2292,'',2292,89),(2293,'',2293,79),(2294,'',2294,79),(2295,'',2295,16),(2296,'',2296,16),(2297,'',2297,489),(2298,'',2298,119),(2299,'',2299,20),(2300,'',2300,79),(2301,'',2301,307),(2302,'',2302,20),(2303,'',2303,472),(2304,'',2304,79),(2305,'',2305,94),(2306,'',2306,489),(2307,'',2307,89),(2308,'',2308,20),(2309,'',2309,77),(2310,'',2310,79),(2311,'',2311,89),(2312,'',2312,565),(2313,'',2313,79),(2314,'',2314,22),(2315,'',2315,79),(2316,'',2316,79),(2317,'',2317,22),(2318,'',2318,79),(2319,'',2319,20),(2320,'',2320,90),(2321,'',2321,89),(2322,'',2322,22),(2323,'',2323,200),(2324,'',2324,20),(2325,'',2325,22),(2326,'',2326,79),(2327,'',2327,89),(2328,'',2328,22),(2329,'',2329,489),(2330,'',2330,89),(2331,'',2331,16),(2332,'',2332,79),(2333,'',2333,16),(2334,'',2334,89),(2335,'',2335,89),(2336,'',2336,79),(2337,'',2337,89),(2338,'',2338,79),(2339,'',2339,94),(2340,'',2340,540),(2341,'',2341,550),(2342,'',2342,20),(2343,'',2343,79),(2344,'',2344,565),(2345,'',2345,22),(2346,'',2346,22),(2347,'',2347,94),(2348,'',2348,200),(2349,'',2349,601),(2350,'',2350,189),(2351,'',2351,79),(2352,'',2352,94),(2353,'',2353,89),(2354,'',2354,601),(2355,'',2355,22),(2356,'',2356,22),(2357,'',2357,89),(2358,'',2358,119),(2359,'',2359,79),(2360,'',2360,79),(2361,'',2361,79),(2362,'',2362,119),(2363,'',2363,16),(2364,'',2364,94),(2365,'',2365,22),(2366,'',2366,79),(2367,'',2367,89),(2368,'',2368,611),(2369,'',2369,550),(2370,'',2370,79),(2371,'',2371,94),(2372,'',2372,119),(2373,'',2373,79),(2374,'',2374,22),(2375,'',2375,79),(2376,'',2376,77),(2377,'',2377,626),(2378,'',2378,79),(2379,'',2379,79),(2380,'',2380,79),(2381,'',2381,79),(2382,'',2382,22),(2383,'',2383,79),(2384,'',2384,89),(2385,'',2385,20),(2386,'',2386,601),(2387,'',2387,77),(2388,'',2388,89),(2389,'',2389,89),(2390,'',2390,89),(2391,'',2391,16),(2392,'',2392,22),(2393,'',2393,189),(2394,'',2394,77),(2395,'',2395,489),(2396,'',2396,94),(2397,'',2397,79),(2398,'',2398,79),(2399,'',2399,307),(2400,'',2400,91),(2401,'',2401,74),(2402,'',2402,16),(2403,'',2403,189),(2404,'',2404,565),(2405,'',2405,79),(2406,'',2406,22),(2407,'',2407,489),(2408,'',2408,77),(2409,'',2409,550),(2410,'',2410,77),(2411,'',2411,20),(2412,'',2412,79),(2413,'',2413,565),(2414,'',2414,89),(2415,'',2415,79),(2416,'',2416,79),(2417,'',2417,79),(2418,'',2418,79),(2419,'',2419,20),(2420,'',2420,79),(2421,'',2421,400),(2422,'',2422,79),(2423,'',2423,79),(2424,'',2424,20),(2425,'',2425,97),(2426,'',2426,565),(2427,'',2427,79),(2428,'',2428,119),(2429,'',2429,22),(2430,'',2430,548),(2431,'',2431,22),(2432,'',2432,311),(2433,'',2433,89),(2434,'',2434,189),(2435,'',2435,89),(2436,'',2436,79),(2437,'',2437,89),(2438,'',2438,119),(2439,'',2439,89),(2440,'',2440,307),(2441,'',2441,89),(2442,'',2442,89),(2443,'',2443,79),(2444,'',2444,22),(2445,'',2445,22),(2446,'',2446,89),(2447,'',2447,22),(2448,'',2448,22),(2449,'',2449,79),(2450,'',2450,79),(2451,'',2451,362),(2452,'',2452,22),(2453,'',2453,77),(2454,'',2454,89),(2455,'',2455,89),(2456,'',2456,74),(2457,'',2457,20),(2458,'',2458,89),(2459,'',2459,22),(2460,'',2460,531),(2461,'',2461,22),(2462,'',2462,22),(2463,'',2463,77),(2464,'',2464,79),(2465,'',2465,77),(2466,'',2466,200),(2467,'',2467,130),(2468,'',2468,470),(2469,'',2469,477),(2470,'',2470,643),(2471,'',2471,359),(2472,'',2472,404),(2473,'',2473,390),(2474,'',2474,20),(2475,'',2475,497),(2476,'',2476,190),(2477,'',2477,434),(2478,'',2478,242),(2479,'',2479,390),(2480,'',2480,400),(2481,'',2481,615),(2482,'',2482,287),(2483,'',2483,327),(2484,'',2484,117),(2485,'',2485,200),(2486,'',2486,73),(2487,'',2487,242),(2488,'',2488,390),(2489,'',2489,546),(2490,'',2490,98),(2491,'',2491,511),(2492,'',2492,547),(2493,'',2493,116),(2494,'',2494,20),(2495,'',2495,645),(2496,'',2496,521),(2497,'',2497,120),(2498,'',2498,804),(2499,'',2499,477),(2500,'',2500,91),(2501,'',2501,311),(2502,'',2502,266),(2503,'',2503,201),(2504,'',2504,242),(2505,'',2505,522),(2506,'',2506,79),(2507,'',2507,20),(2508,'',2508,74),(2509,'',2509,74),(2510,'',2510,327),(2511,'',2511,74),(2512,'',2512,489),(2513,'',2513,242),(2514,'',2514,398),(2515,'',2515,79),(2516,'',2516,109),(2517,'',2517,388),(2518,'',2518,15),(2519,'',2519,120),(2520,'',2520,112),(2521,'',2521,472),(2522,'',2522,565),(2523,'',2523,507),(2524,'',2524,295),(2525,'',2525,407),(2526,'',2526,264),(2527,'',2527,447),(2528,'',2528,425),(2529,'',2529,331),(2530,'',2530,20),(2531,'',2531,319),(2532,'',2532,74),(2533,'',2533,134),(2534,'',2534,565),(2535,'',2535,89),(2536,'',2536,520),(2537,'',2537,16),(2538,'',2538,525),(2539,'',2539,400),(2540,'',2540,543),(2541,'',2541,74),(2542,'',2542,20),(2543,'',2543,15),(2544,'',2544,20),(2545,'',2545,367),(2546,'',2546,312),(2547,'',2547,613),(2548,'',2548,544),(2549,'',2549,538),(2550,'',2550,250),(2551,'',2551,524),(2552,'',2552,113),(2553,'',2553,79),(2554,'',2554,209),(2555,'',2555,470),(2556,'',2556,79),(2557,'',2557,201),(2558,'',2558,400),(2559,'',2559,77),(2560,'',2560,257),(2561,'',2561,615),(2562,'',2562,523),(2563,'',2563,185),(2564,'',2564,242),(2565,'',2565,116),(2566,'',2566,352),(2567,'',2567,131),(2568,'',2568,511),(2569,'',2569,20),(2570,'',2570,74),(2571,'',2571,586),(2572,'',2572,129),(2573,'',2573,74),(2574,'',2574,506),(2575,'',2575,489),(2576,'',2576,310),(2577,'',2577,470),(2578,'',2578,335),(2579,'',2579,507),(2580,'',2580,267),(2581,'',2581,288),(2582,'',2582,400),(2583,'',2583,601),(2584,'',2584,79),(2585,'',2585,382),(2586,'',2586,345),(2587,'',2587,532),(2588,'',2588,507),(2589,'',2589,398),(2590,'',2590,95),(2591,'',2591,90),(2592,'',2592,20),(2593,'',2593,470),(2594,'',2594,517),(2595,'',2595,89),(2596,'',2596,650),(2597,'',2597,548),(2598,'',2598,538),(2599,'',2599,200),(2600,'',2600,79),(2601,'',2601,79),(2602,'',2602,90),(2603,'',2603,200),(2604,'',2604,79),(2605,'',2605,20),(2606,'',2606,601),(2607,'',2607,200),(2608,'',2608,427),(2609,'',2609,352),(2610,'',2610,200),(2611,'',2611,79),(2612,'',2612,530),(2613,'',2613,78),(2614,'',2614,89),(2615,'',2615,91),(2616,'',2616,200),(2617,'',NULL,94),(2618,'',2618,650),(2619,'',2619,200),(2620,'',2620,22),(2621,'',2621,89),(2622,'',2622,94),(2623,'',2623,693),(2624,'',2624,79),(2625,'',2625,94),(2626,'',2626,79),(2627,'',2627,319),(2628,'',2628,78),(2629,'',2629,79),(2630,'',NULL,16),(2631,'',2631,200),(2632,'',2632,200),(2633,'',2633,16),(2634,'',NULL,94),(2635,'',NULL,98),(2636,'',NULL,94),(2637,'',NULL,384),(2638,'',NULL,540),(2639,'',NULL,89),(2640,'',NULL,79),(2641,'',NULL,79),(2642,'',NULL,79),(2643,'',NULL,79),(2644,'',NULL,200),(2645,'',NULL,530),(2646,'',NULL,538),(2647,'',NULL,200),(2648,'',NULL,548),(2649,'',NULL,650),(2650,'',NULL,650),(2651,'',NULL,204),(2652,'',NULL,204),(2653,'',NULL,200),(2654,'',NULL,285),(2655,'',NULL,693),(2656,'',NULL,16),(2657,'',NULL,311),(2658,'',NULL,200),(2659,'',NULL,200),(2660,'',NULL,200),(2661,'',NULL,200),(2662,'',NULL,200),(2663,'',NULL,200),(2664,'',NULL,200),(2665,'',NULL,16),(2666,'',NULL,525),(2667,'',NULL,200),(2668,'',NULL,200),(2669,'',NULL,311),(2670,'',2668,614),(2671,'',NULL,200),(2672,'',NULL,200),(2673,'',NULL,311),(2674,'',2671,384),(2675,'',2672,88),(2676,'',2673,352),(2677,'',2674,601),(2678,'',2675,400),(2679,'',2676,89),(2680,'',2677,78),(2681,'',2678,95),(2682,'',2679,73),(2683,'',2680,79),(2684,'',2681,472),(2685,'',2682,113),(2686,'',2683,94),(2687,'',2684,472),(2688,'',2685,311),(2689,'',2686,73),(2690,'',2687,472),(2691,'',2688,79),(2692,'',2689,77),(2693,'',2690,425),(2694,'',2691,287),(2695,'',2692,78),(2696,'',2693,173),(2697,'',2694,91),(2698,'',2695,434),(2699,'',2696,89),(2700,'',2697,212),(2701,'',2698,79),(2702,'',2699,22),(2703,'',2700,79),(2704,'',2701,650),(2705,'',2702,525),(2706,'',2703,79),(2707,'',2704,523),(2708,'',2705,614),(2709,'',2706,79),(2710,'',2707,807),(2711,'',2708,319),(2712,'',2709,523),(2713,'',2710,173),(2714,'',2711,200),(2715,'',2712,523),(2716,'',2713,525),(2717,'',2714,89),(2718,'',2715,79),(2719,'',2716,200),(2720,'',2717,173),(2721,'',2718,693),(2722,'',2719,384),(2723,'',2720,90),(2724,'',2721,643),(2725,'',2722,74),(2726,'',2723,200),(2727,'',2724,200),(2728,'',2725,200),(2729,'',2726,642),(2730,'',2727,540),(2731,'',2728,807),(2732,'',2729,79),(2733,'',2730,523),(2734,'',2731,173),(2735,'',2732,11),(2736,'',2733,79),(2737,'',2734,173),(2738,'',2735,601),(2739,'',2736,79),(2740,'',2737,212),(2741,'',2738,548),(2742,'',2739,200),(2743,'',2740,10),(2744,'',2741,79),(2745,'',2742,611),(2746,'',NULL,94),(2747,'',NULL,807),(2748,'',NULL,776),(2749,'',NULL,601),(2750,'',NULL,312),(2751,'',NULL,20),(2752,'',NULL,298),(2753,'',NULL,16),(2754,'',2751,77),(2755,'',2752,79),(2756,'',2753,90),(2757,'',2754,643),(2758,'',2755,89),(2759,'',2756,209),(2760,'',2757,180),(2761,'',2758,601),(2762,'',NULL,388),(2763,'',NULL,388),(2764,'',NULL,200),(2765,'',NULL,89),(2766,'',NULL,285),(2767,'',NULL,89),(2768,'',NULL,89),(2769,'',NULL,200),(2770,'',NULL,521),(2771,'',NULL,120),(2772,'',NULL,120),(2773,'',NULL,200),(2774,'',NULL,650),(2775,'',NULL,539),(2776,'',NULL,359),(2777,'',NULL,293),(2778,'',NULL,79),(2779,'',NULL,200),(2780,'',NULL,673),(2781,'',NULL,548),(2782,'',NULL,525),(2783,'',NULL,673),(2784,'',NULL,552),(2785,'',NULL,525),(2786,'',NULL,134),(2787,'',NULL,134),(2788,'',NULL,20),(2789,'',NULL,615),(2790,'',NULL,113),(2791,'',NULL,613),(2792,'',NULL,190),(2793,'',NULL,6),(2794,'',NULL,90),(2795,'',NULL,90),(2796,'',NULL,521),(2797,'',NULL,525),(2798,'',NULL,549),(2799,'',NULL,201),(2800,'',NULL,201),(2801,'',NULL,601),(2802,'',NULL,20),(2803,'',NULL,525),(2804,'',NULL,521),(2805,'',NULL,293),(2806,'',NULL,94),(2807,'',NULL,209),(2808,'',NULL,359),(2809,'',NULL,264),(2810,'',NULL,521),(2811,'',NULL,98),(2812,'',NULL,384),(2813,'',NULL,264),(2814,'',NULL,334),(2815,'',NULL,359),(2816,'',NULL,359),(2817,'',NULL,566),(2818,'',NULL,566),(2819,'',NULL,209),(2820,'',NULL,209),(2821,'',NULL,97),(2822,'',NULL,78),(2823,'',NULL,78),(2824,'',NULL,22),(2825,'',NULL,22),(2826,'',NULL,598),(2827,'',NULL,200),(2828,'',NULL,521),(2829,'',NULL,552),(2830,'',NULL,200),(2831,'',NULL,200),(2832,'',NULL,200),(2833,'',NULL,78),(2834,'',NULL,78),(2835,'',NULL,22),(2836,'',NULL,22),(2837,'',NULL,352),(2838,'',NULL,116),(2839,'',NULL,99),(2840,'',NULL,327),(2841,'',NULL,120),(2842,'',NULL,190),(2843,'',NULL,658),(2844,'',NULL,193),(2845,'',NULL,275),(2846,'',NULL,89),(2847,'',NULL,201),(2848,'',NULL,311),(2849,'',NULL,693),(2850,'',NULL,200),(2851,'',NULL,201),(2852,'',NULL,477),(2853,'',NULL,398),(2854,'',NULL,730),(2855,'',NULL,284),(2856,'',NULL,311),(2857,'',NULL,785),(2858,'',NULL,79),(2859,'',NULL,643),(2860,'',NULL,477),(2861,'',NULL,665),(2862,'',NULL,658),(2863,'',NULL,134),(2864,'',NULL,477),(2865,'',NULL,665),(2866,'',NULL,284),(2867,'',NULL,398),(2868,'',NULL,398),(2869,'',NULL,398),(2870,'',NULL,398),(2871,'',NULL,398),(2872,'',NULL,477),(2873,'',NULL,398),(2874,'',NULL,398),(2875,'',NULL,398),(2876,'',NULL,398),(2877,'',NULL,398),(2878,'',NULL,661),(2879,'',NULL,661),(2880,'',NULL,661),(2881,'',NULL,352),(2882,'',NULL,89),(2883,'',NULL,89),(2884,'',NULL,89),(2885,'',NULL,89),(2886,'',NULL,89),(2887,'',NULL,477),(2888,'',NULL,477),(2889,'',NULL,477),(2890,'',NULL,477),(2891,'',NULL,477),(2892,'',NULL,201),(2893,'',NULL,730),(2894,'',NULL,547),(2895,'',NULL,644),(2896,'',NULL,98),(2897,'',NULL,398),(2898,'',NULL,398),(2899,'',NULL,398),(2900,'',NULL,398),(2901,'',NULL,398),(2902,'',NULL,398),(2903,'',NULL,398),(2904,'',NULL,398),(2905,'',NULL,398),(2906,'',NULL,398),(2907,'',NULL,398),(2908,'',NULL,398),(2909,'',NULL,398),(2910,'',NULL,398),(2911,'',NULL,398),(2912,'',NULL,398),(2913,'',NULL,398),(2914,'',NULL,398),(2915,'',NULL,398),(2916,'',NULL,398),(2917,'',NULL,659),(2918,'',NULL,659),(2919,'',NULL,659),(2920,'',NULL,659),(2921,'',NULL,659),(2922,'',NULL,659),(2923,'',NULL,659),(2924,'',NULL,659),(2925,'',NULL,659),(2926,'',NULL,659),(2927,'',NULL,659),(2928,'',NULL,659),(2929,'',NULL,659),(2930,'',NULL,659),(2931,'',NULL,659),(2932,'',NULL,659),(2933,'',NULL,659),(2934,'',NULL,659),(2935,'',NULL,659),(2936,'',NULL,659),(2937,'',NULL,659),(2938,'',NULL,659),(2939,'',NULL,659),(2940,'',NULL,659),(2941,'',NULL,659),(2942,'',NULL,659),(2943,'',NULL,659),(2944,'',NULL,659),(2945,'',NULL,659),(2946,'',NULL,659),(2947,'',NULL,659),(2948,'',NULL,658),(2949,'',NULL,658),(2950,'',NULL,658),(2951,'',NULL,658),(2952,'',NULL,658),(2953,'',NULL,658),(2954,'',NULL,658),(2955,'',NULL,658),(2956,'',NULL,658),(2957,'',NULL,658),(2958,'',NULL,658),(2959,'',NULL,658),(2960,'',NULL,658),(2961,'',NULL,658),(2962,'',NULL,658),(2963,'',NULL,658),(2964,'',NULL,658),(2965,'',NULL,658),(2966,'',NULL,658),(2967,'',NULL,658),(2968,'',NULL,658),(2969,'',NULL,658),(2970,'',NULL,658),(2971,'',NULL,658),(2972,'',NULL,658),(2973,'',NULL,658),(2974,'',NULL,658),(2975,'',NULL,658),(2976,'',NULL,658),(2977,'',NULL,658),(2978,'',NULL,658),(2979,'',NULL,658),(2980,'',NULL,658),(2981,'',NULL,658),(2982,'',NULL,658),(2983,'',NULL,658),(2984,'',NULL,658),(2985,'',NULL,658),(2986,'',NULL,658),(2987,'',NULL,658),(2988,'',NULL,658),(2989,'',NULL,658),(2990,'',NULL,658),(2991,'',NULL,658),(2992,'',NULL,658),(2993,'',NULL,658),(2994,'',NULL,658),(2995,'',NULL,658),(2996,'',NULL,658),(2997,'',NULL,658),(2998,'',NULL,658),(2999,'',NULL,658),(3000,'',NULL,658),(3001,'',NULL,658),(3002,'',NULL,658),(3003,'',NULL,658),(3004,'',NULL,658),(3005,'',NULL,658),(3006,'',NULL,658),(3007,'',NULL,658),(3008,'',NULL,658),(3009,'',NULL,658),(3010,'',NULL,658),(3011,'',NULL,658),(3012,'',NULL,658),(3013,'',NULL,658),(3014,'',NULL,658),(3015,'',NULL,658),(3016,'',NULL,658),(3017,'',NULL,658),(3018,'',NULL,658),(3019,'',NULL,659),(3020,'',NULL,659),(3021,'',NULL,659),(3022,'',NULL,659),(3023,'',NULL,659),(3024,'',NULL,659),(3025,'',NULL,659),(3026,'',NULL,659),(3027,'',NULL,659),(3028,'',NULL,659),(3029,'',NULL,659),(3030,'',NULL,659),(3031,'',NULL,659),(3032,'',NULL,659),(3033,'',NULL,659),(3034,'',NULL,659),(3035,'',NULL,659),(3036,'',NULL,659),(3037,'',NULL,659),(3038,'',NULL,659),(3039,'',NULL,659),(3040,'',NULL,659),(3041,'',NULL,659),(3042,'',NULL,659),(3043,'',NULL,659),(3044,'',NULL,659),(3045,'',NULL,659),(3046,'',NULL,659),(3047,'',NULL,659),(3048,'',NULL,659),(3049,'',NULL,659),(3050,'',NULL,659),(3051,'',NULL,659),(3052,'',NULL,659),(3053,'',NULL,659),(3054,'',NULL,659),(3055,'',NULL,659),(3056,'',NULL,659),(3057,'',NULL,659),(3058,'',NULL,659),(3059,'',NULL,659),(3060,'',NULL,659),(3061,'',NULL,659),(3062,'',NULL,659),(3063,'',NULL,659),(3064,'',NULL,659),(3065,'',NULL,659),(3066,'',NULL,659),(3067,'',NULL,659),(3068,'',NULL,659),(3069,'',NULL,659),(3070,'',NULL,659),(3071,'',NULL,659),(3072,'',NULL,659),(3073,'',NULL,659),(3074,'',NULL,659),(3075,'',NULL,659),(3076,'',NULL,659),(3077,'',NULL,659),(3078,'',NULL,659),(3079,'',NULL,659),(3080,'',NULL,659),(3081,'',NULL,659),(3082,'',NULL,659),(3083,'',NULL,659),(3084,'',NULL,659),(3085,'',NULL,659),(3086,'',NULL,659),(3087,'',NULL,659),(3088,'',NULL,843),(3089,'',NULL,417),(3090,'',NULL,417),(3091,'',NULL,16),(3092,'',NULL,398),(3093,'',NULL,398),(3094,'',NULL,398),(3095,'',NULL,398),(3096,'',NULL,398),(3097,'',NULL,398),(3098,'',NULL,16),(3099,'',NULL,521),(3100,'',NULL,521),(3101,'',NULL,16),(3102,'',NULL,16),(3103,'',NULL,16),(3104,'',NULL,16),(3105,'',NULL,315),(3106,'',NULL,315),(3107,'',NULL,315),(3108,'',NULL,79),(3109,'',NULL,16),(3110,'',NULL,16),(3111,'',NULL,829),(3112,'',NULL,829),(3113,'',NULL,615),(3114,'',NULL,398),(3115,'',NULL,398),(3116,'',NULL,532),(3117,'',NULL,16),(3118,'',NULL,16),(3119,'',NULL,491),(3120,'',NULL,491),(3121,'',NULL,491),(3122,'',NULL,16),(3123,'',NULL,94),(3124,'',NULL,398),(3125,'',NULL,398),(3126,'',NULL,398),(3127,'',NULL,398),(3128,'',NULL,398),(3129,'',NULL,398),(3130,'',NULL,398),(3131,'',NULL,547),(3132,'',NULL,398),(3133,'',NULL,398),(3134,'',NULL,398),(3135,'',NULL,398),(3136,'',NULL,398),(3137,'',NULL,398),(3138,'',NULL,547),(3139,'',NULL,547),(3140,'',NULL,547),(3141,'',NULL,398),(3142,'',NULL,398),(3143,'',NULL,398),(3144,'',NULL,398),(3145,'',NULL,601),(3146,'',NULL,601),(3147,'',NULL,567),(3148,'',NULL,567),(3149,'',NULL,398),(3150,'',NULL,352),(3151,'',NULL,352),(3152,'',NULL,94),(3153,'',NULL,94),(3154,'',NULL,79),(3155,'',NULL,79),(3156,'',NULL,730),(3157,'',NULL,398),(3158,'',NULL,459),(3159,'',NULL,171),(3160,'',NULL,171),(3161,'',NULL,544),(3162,'',NULL,520),(3163,'',NULL,398),(3164,'',NULL,398),(3165,'',NULL,398),(3166,'',NULL,476),(3167,'',NULL,398),(3168,'',NULL,398),(3169,'',NULL,798),(3170,'',NULL,472),(3171,'',NULL,398),(3172,'',NULL,89),(3173,'',NULL,20),(3174,'',NULL,622),(3175,'',NULL,398),(3176,'',NULL,398),(3177,'',NULL,99),(3178,'',3170,16),(3179,'',NULL,79),(3180,'',NULL,89),(3181,'',3173,16),(3182,'',3174,16),(3183,'',NULL,79),(3184,'',NULL,79),(3185,'',3177,16),(3186,'',NULL,79),(3187,'',NULL,89),(3188,'',NULL,89),(3189,'',NULL,36),(3190,'',NULL,23),(3191,'',3181,287),(3192,'',3182,556),(3193,'',3183,248),(3194,'',3184,254),(3195,'',3185,411),(3196,'',3186,345),(3197,'',3187,90),(3198,'',3188,566),(3199,'',3189,400),(3200,'',3190,265),(3201,'',3191,345),(3202,'',3192,101),(3203,'',3193,571),(3204,'',3194,311),(3205,'',3195,16),(3206,'',3196,325),(3207,'',3197,111),(3208,'',3198,79),(3209,'',3199,579),(3210,'',3200,265),(3211,'',3201,285),(3212,'',3202,311),(3213,'',3203,560),(3214,'',3204,11),(3215,'',3205,134),(3216,'',3206,397),(3217,'',3207,255),(3218,'',3208,16),(3219,'',3209,20),(3220,'',3210,101),(3221,'',3211,384),(3222,'',3212,16),(3223,'',3213,398),(3224,'',3214,383),(3225,'',3215,265),(3226,'',3216,345),(3227,'',3217,345),(3228,'',3218,311),(3229,'',3219,552),(3230,'',3220,7),(3231,'',3221,582),(3232,'',3222,497),(3233,'',3223,404),(3234,'',3224,113),(3235,'',3225,250),(3236,'',3226,311),(3237,'',3227,730),(3238,'',3228,5),(3239,'',3229,16),(3240,'',3230,254),(3241,'',3231,398),(3242,'',3232,311),(3243,'',3233,305),(3244,'',3234,311),(3245,'',3235,591),(3246,'',3236,565),(3247,'',3237,311),(3248,'',3238,265),(3249,'',3239,778),(3250,'',3240,501),(3251,'',3241,473),(3252,'',3242,243),(3253,'',3243,404),(3254,'',3244,639),(3255,'',3245,302),(3256,'',3246,311),(3257,'',3247,16),(3258,'',3248,79),(3259,'',3249,581),(3260,'',3250,388),(3261,'',3251,807),(3262,'',3252,259),(3263,'',3253,754),(3264,'',3254,16),(3265,'',3255,539),(3266,'',3256,117),(3267,'',3257,345),(3268,'',3258,730),(3269,'',3259,364),(3270,'',3260,477),(3271,'',3261,388),(3272,'',3262,730),(3273,'',3263,265),(3274,'',3264,373),(3275,'',3265,16),(3276,'',3266,614),(3277,'',3267,311),(3278,'',3268,90),(3279,'',3269,101),(3280,'',3270,730),(3281,'',3271,215),(3282,'',3272,251),(3283,'',3273,16),(3284,'',3274,16),(3285,'',3275,359),(3286,'',3276,567),(3287,'',3277,11),(3288,'',3278,5),(3289,'',3279,474),(3290,'',3280,7),(3291,'',3281,563),(3292,'',3282,730),(3293,'',3283,398),(3294,'',3284,552),(3295,'',3285,94),(3296,'',3286,552),(3297,'',3287,89),(3298,'',3288,254),(3299,'',3289,577),(3300,'',3290,327),(3301,'',3291,260),(3302,'',3292,245),(3303,'',3293,12),(3304,'',3294,254),(3305,'',3295,311),(3306,'',3296,416),(3307,'',3297,473),(3308,'',3298,95),(3309,'',3299,106),(3310,'',3300,362),(3311,'',3301,401),(3312,'',3302,16),(3313,'',3303,285),(3314,'',3304,260),(3315,'',3305,311),(3316,'',3306,398),(3317,'',3307,259),(3318,'',3308,486),(3319,'',3309,401),(3320,'',3310,584),(3321,'',3311,285),(3322,'',3312,396),(3323,'',3313,398),(3324,'',3314,193),(3325,'',3315,489),(3326,'',3316,359),(3327,'',3317,16),(3328,'',3318,730),(3329,'',3319,272),(3330,'',3320,89),(3331,'',3321,285),(3332,'',3322,195),(3333,'',3323,79),(3334,'',3324,345),(3335,'',3325,20),(3336,'',3326,258),(3337,'',3327,195),(3338,'',3328,284),(3339,'',3329,15),(3340,'',3330,609),(3341,'',3331,522),(3342,'',3332,539),(3343,'',3333,495),(3344,'',3334,472),(3345,'',3335,807),(3346,'',3336,613),(3347,'',3337,730),(3348,'',3338,391),(3349,'',3339,16),(3350,'',3340,398),(3351,'',3341,259),(3352,'',3342,254),(3353,'',3343,522),(3354,'',3344,9),(3355,'',3345,352),(3356,'',3346,260),(3357,'',3347,254),(3358,'',3348,94),(3359,'',3349,400),(3360,'',3350,254),(3361,'',3351,398),(3362,'',3352,395),(3363,'',3353,105),(3364,'',3354,581),(3365,'',3355,345),(3366,'',3356,20),(3367,'',3357,311),(3368,'',3358,404),(3369,'',3359,395),(3370,'',3360,574),(3371,'',3361,404),(3372,'',3362,384),(3373,'',3363,561),(3374,'',3364,16),(3375,'',3365,787),(3376,'',3366,560),(3377,'',3367,601),(3378,'',3368,79),(3379,'',3369,113),(3380,'',3370,120),(3381,'',3371,99),(3382,'',3372,497),(3383,'',3373,254),(3384,'',3374,362),(3385,'',3375,730),(3386,'',3376,16),(3387,'',3377,615),(3388,'',3378,522),(3389,'',3379,311),(3390,'',3380,562),(3391,'',3381,730),(3392,'',3382,560),(3393,'',3383,101),(3394,'',3384,20),(3395,'',3385,170),(3396,'',3386,265),(3397,'',3387,190),(3398,'',3388,493),(3399,'',3389,358),(3400,'',3390,345),(3401,'',3391,112),(3402,'',3392,554),(3403,'',3393,16),(3404,'',3394,265),(3405,'',3395,7),(3406,'',3396,560),(3407,'',3397,11),(3408,'',3398,787),(3409,'',3399,578),(3410,'',3400,5),(3411,'',3401,493),(3412,'',3402,730),(3413,'',3403,580),(3414,'',3404,20),(3415,'',3405,471),(3416,'',3406,16),(3417,'',3407,254),(3418,'',3408,89),(3419,'',3409,8),(3420,'',3410,91),(3421,'',3411,6),(3422,'',3412,470),(3423,'',3413,107),(3424,'',3414,285),(3425,'',3415,242),(3426,'',3416,398),(3427,'',3417,16),(3428,'',3418,264),(3429,'',3419,104),(3430,'',3420,676),(3431,'',3421,586),(3432,'',3422,265),(3433,'',3423,311),(3434,'',3424,16),(3435,'',3425,245),(3436,'',3426,244),(3437,'',3427,101),(3438,'',3428,109),(3439,'',3429,95),(3440,'',3430,384),(3441,'',3431,346),(3442,'',3432,89),(3443,'',3433,345),(3444,'',3434,388),(3445,'',3435,362),(3446,'',3436,311),(3447,'',3437,471),(3448,'',3438,345),(3449,'',3439,391),(3450,'',3440,311),(3451,'',3441,353),(3452,'',3442,475),(3453,'',3443,457),(3454,'',3444,16),(3455,'',3445,497),(3456,'',3446,215),(3457,'',3447,398),(3458,'',3448,311),(3459,'',3449,195),(3460,'',3450,730),(3461,'',3451,265),(3462,'',3452,285),(3463,'',3453,248),(3464,'',3454,613),(3465,'',3455,245),(3466,'',3456,597),(3467,'',3457,101),(3468,'',3458,226),(3469,'',3459,252),(3470,'',3460,497),(3471,'',3461,77),(3472,'',3462,261),(3473,'',3463,89),(3474,'',3464,254),(3475,'',3465,565),(3476,'',3466,643),(3477,'',3467,94),(3478,'',3468,89),(3479,'',3469,384),(3480,'',3470,311),(3481,'',3471,476),(3482,'',3472,311),(3483,'',3473,651),(3484,'',3474,113),(3485,'',3475,254),(3486,'',3476,473),(3487,'',3477,246),(3488,'',3478,89),(3489,'',3479,287),(3490,'',3480,195),(3491,'',3481,170),(3492,'',3482,563),(3493,'',3483,265),(3494,'',3484,311),(3495,'',3485,285),(3496,'',3486,248),(3497,'',3487,101),(3498,'',3488,16),(3499,'',3489,359),(3500,'',3490,94),(3501,'',3491,345),(3502,'',3492,254),(3503,'',3493,415),(3504,'',3494,265),(3505,'',3495,566),(3506,'',3496,125),(3507,'',3497,732),(3508,'',3498,5),(3509,'',3499,311),(3510,'',3500,242),(3511,'',3501,7),(3512,'',3502,311),(3513,'',3503,79),(3514,'',3504,103),(3515,'',3505,16),(3516,'',3506,311),(3517,'',3507,285),(3518,'',3508,285),(3519,'',3509,345),(3520,'',3510,724),(3521,'',3511,311),(3522,'',3512,384),(3523,'',3513,398),(3524,'',3514,285),(3525,'',3515,398),(3526,'',3516,398),(3527,'',3517,254),(3528,'',3518,16),(3529,'',3519,480),(3530,'',3520,346),(3531,'',3521,553),(3532,'',3522,485),(3533,'',3523,651),(3534,'',3524,359),(3535,'',3525,733),(3536,'',3526,583),(3537,'',3527,311),(3538,'',3528,16),(3539,'',3529,285),(3540,'',3530,7),(3541,'',3531,311),(3542,'',3532,285),(3543,'',3533,404),(3544,'',3534,108),(3545,'',3535,398),(3546,'',3536,311),(3547,'',3537,102),(3548,'',3538,250),(3549,'',3539,575),(3550,'',3540,311),(3551,'',3541,694),(3552,'',3542,398),(3553,'',3543,215),(3554,'',3544,305),(3555,'',3545,20),(3556,'',3546,16),(3557,'',3547,585),(3558,'',3548,16),(3559,'',3549,497),(3560,'',3550,285),(3561,'',3551,20),(3562,'',3552,89),(3563,'',3553,16),(3564,'',3554,261),(3565,'',3555,215),(3566,'',3556,16),(3567,'',3557,311),(3568,'',3558,285),(3569,'',3559,311),(3570,'',3560,619),(3571,'',3561,691),(3572,'',3562,520),(3573,'',3563,265),(3574,'',3564,16),(3575,'',3565,302),(3576,'',3566,126),(3577,'',3567,492),(3578,'',3568,353),(3579,'',3569,311),(3580,'',3570,265),(3581,'',3571,247),(3582,'',3572,254),(3583,'',3573,567),(3584,'',3574,254),(3585,'',3575,377),(3586,'',3576,95),(3587,'',3577,497),(3588,'',3578,265),(3589,'',3579,82),(3590,'',3580,16),(3591,'',3581,345),(3592,'',3582,302),(3593,'',3583,560),(3594,'',3584,398),(3595,'',3585,345),(3596,'',3586,471),(3597,'',3587,16),(3598,'',3588,561),(3599,'',3589,11),(3600,'',3590,552),(3601,'',3591,391),(3602,'',3592,254),(3603,'',3593,113),(3604,'',3594,254),(3605,'',3595,345),(3606,'',3596,579),(3607,'',3597,310),(3608,'',3598,434),(3609,'',3599,215),(3610,'',3600,311),(3611,'',3601,254),(3612,'',3602,552),(3613,'',3603,497),(3614,'',3604,89),(3615,'',3605,561),(3616,'',3606,398),(3617,'',3607,265),(3618,'',3608,557),(3619,'',3609,345),(3620,'',3610,473),(3621,'',3611,690),(3622,'',3612,94),(3623,'',3613,311),(3624,'',3614,345),(3625,'',3615,404),(3626,'',3616,398),(3627,'',3617,434),(3628,'',3618,497),(3629,'',3619,16),(3630,'',3620,16),(3631,'',3621,431),(3632,'',3622,215),(3633,'',3623,311),(3634,'',3624,14),(3635,'',3625,476),(3636,'',3626,117),(3637,'',3627,326),(3638,'',3628,398),(3639,'',3629,254),(3640,'',3630,566),(3641,'',3631,265),(3642,'',3632,94),(3643,'',3633,787),(3644,'',3634,382),(3645,'',3635,22),(3646,'',3636,730),(3647,'',3637,310),(3648,'',3638,16),(3649,'',3639,398),(3650,'',3640,498),(3651,'',3641,285),(3652,'',3642,254),(3653,'',3643,362),(3654,'',3644,254),(3655,'',3645,311),(3656,'',3646,615),(3657,'',3647,89),(3658,'',3648,110),(3659,'',3649,16),(3660,'',3650,572),(3661,'',3651,358),(3662,'',3652,311),(3663,'',3653,639),(3664,'',3654,730),(3665,'',3655,358),(3666,'',3656,114),(3667,'',3657,576),(3668,'',3658,215),(3669,'',3659,330),(3670,'',3660,501),(3671,'',3661,522),(3672,'',3662,730),(3673,'',3663,345),(3674,'',3664,288),(3675,'',3665,254),(3676,'',3666,730),(3677,'',3667,311),(3678,'',3668,521),(3679,'',3669,398),(3680,'',3670,639),(3681,'',3671,398),(3682,'',3672,112),(3683,'',3673,568),(3684,'',3674,16),(3685,'',3675,251),(3686,'',3676,16),(3687,'',3677,398),(3688,'',3678,89),(3689,'',3679,319),(3690,'',3680,16),(3691,'',3681,112),(3692,'',3682,296),(3693,'',3683,497),(3694,'',3684,20),(3695,'',3685,554),(3696,'',3686,101),(3697,'',3687,79),(3698,'',3688,119),(3699,'',3689,570),(3700,'',3690,373),(3701,'',3691,16),(3702,'',3692,489),(3703,'',3693,285),(3704,'',3694,94),(3705,'',3695,561),(3706,'',3696,16),(3707,'',3697,20),(3708,'',NULL,592),(3709,'',3699,830),(3710,'',3700,396),(3711,'',3701,373),(3712,'',3702,297),(3713,'',3703,397),(3714,'',3704,405),(3715,'',3705,666),(3716,'',3706,667),(3717,'',3707,728),(3718,'',3708,783),(3719,'',3709,79),(3720,'',3710,18),(3721,'',3711,258),(3722,'',3712,248),(3723,'',3713,256),(3724,'',3714,354),(3725,'',3715,466),(3726,'',3716,70),(3727,'',3717,464),(3728,'',3718,492),(3729,'',3719,227),(3730,'',3720,871),(3731,'',3721,731),(3732,'',3722,751),(3733,'',3723,90),(3734,'',3724,885),(3735,'',3725,858),(3736,'',3726,506),(3737,'',3727,496),(3738,'',3728,313),(3739,'',3729,669),(3740,'',3730,934),(3741,'',3731,774),(3742,'',3732,872),(3743,'',3733,480),(3744,'',3734,649),(3745,'',3735,65),(3746,'',3736,42),(3747,'',3737,828),(3748,'',3738,32),(3749,'',3739,575),(3750,'',3740,638),(3751,'',3741,770),(3752,'',3742,834),(3753,'',3743,541),(3754,'',3744,488),(3755,'',3745,913),(3756,'',3746,471),(3757,'',3747,646),(3758,'',3748,428),(3759,'',3749,460),(3760,'',3750,907),(3761,'',3751,798),(3762,'',3752,601),(3763,'',3753,88),(3764,'',3754,503),(3765,'',3755,344),(3766,'',3756,450),(3767,'',3757,216),(3768,'',3758,361),(3769,'',3759,138),(3770,'',3760,866),(3771,'',3761,393),(3772,'',3762,158),(3773,'',3763,219),(3774,'',3764,161),(3775,'',3765,565),(3776,'',3766,832),(3777,'',3767,192),(3778,'',3768,691),(3779,'',3769,865),(3780,'',3770,911),(3781,'',3771,870),(3782,'',3772,889),(3783,'',3773,855),(3784,'',3774,204),(3785,'',3775,57),(3786,'',3776,388),(3787,'',3777,635),(3788,'',3778,346),(3789,'',3779,793),(3790,'',3780,671),(3791,'',3781,356),(3792,'',3782,422),(3793,'',3783,133),(3794,'',3784,747),(3795,'',3785,62),(3796,'',3786,49),(3797,'',3787,392),(3798,'',3788,518),(3799,'',3789,266),(3800,'',3790,930),(3801,'',3791,119),(3802,'',3792,837),(3803,'',3793,456),(3804,'',3794,755),(3805,'',3795,26),(3806,'',3796,287),(3807,'',3797,317),(3808,'',3798,250),(3809,'',3799,591),(3810,'',3800,73),(3811,'',3801,673),(3812,'',3802,806),(3813,'',3803,432),(3814,'',3804,817),(3815,'',3805,78),(3816,'',3806,877),(3817,'',3807,48),(3818,'',3808,576),(3819,'',3809,501),(3820,'',3810,4),(3821,'',3811,876),(3822,'',3812,275),(3823,'',3813,724),(3824,'',3814,818),(3825,'',3815,777),(3826,'',3816,104),(3827,'',3817,284),(3828,'',3818,639),(3829,'',3819,410),(3830,'',3820,463),(3831,'',3821,190),(3832,'',3822,617),(3833,'',3823,761),(3834,'',3824,607),(3835,'',3825,206),(3836,'',3826,222),(3837,'',3827,841),(3838,'',3828,797),(3839,'',3829,303),(3840,'',3830,615),(3841,'',3831,38),(3842,'',3832,94),(3843,'',3833,264),(3844,'',3834,557),(3845,'',3835,622),(3846,'',3836,901),(3847,'',3837,334),(3848,'',3838,330),(3849,'',3839,444),(3850,'',3840,31),(3851,'',3841,812),(3852,'',3842,527),(3853,'',3843,694),(3854,'',3844,536),(3855,'',3845,538),(3856,'',3846,695),(3857,'',3847,757),(3858,'',3848,52),(3859,'',3849,145),(3860,'',3850,535),(3861,'',3851,743),(3862,'',3852,534),(3863,'',3853,792),(3864,'',3854,504),(3865,'',3855,166),(3866,'',3856,886),(3867,'',3857,84),(3868,'',3858,732),(3869,'',3859,738),(3870,'',3860,165),(3871,'',3861,849),(3872,'',3862,97),(3873,'',3863,581),(3874,'',3864,595),(3875,'',3865,75),(3876,'',3866,12),(3877,'',3867,593),(3878,'',3868,359),(3879,'',3869,826),(3880,'',3870,522),(3881,'',3871,590),(3882,'',3872,440),(3883,'',3873,387),(3884,'',3874,916),(3885,'',3875,890),(3886,'',3876,553),(3887,'',3877,224),(3888,'',3878,223),(3889,'',3879,497),(3890,'',3880,131),(3891,'',3881,626),(3892,'',3882,349),(3893,'',3883,910),(3894,'',3884,879),(3895,'',3885,856),(3896,'',3886,451),(3897,'',3887,240),(3898,'',3888,577),(3899,'',3889,348),(3900,'',3890,563),(3901,'',3891,55),(3902,'',3892,894),(3903,'',3893,683),(3904,'',3894,367),(3905,'',3895,902),(3906,'',3896,543),(3907,'',3897,800),(3908,'',3898,81),(3909,'',3899,416),(3910,'',3900,470),(3911,'',3901,345),(3912,'',3902,25),(3913,'',3903,357),(3914,'',3904,10),(3915,'',3905,461),(3916,'',3906,211),(3917,'',3907,296),(3918,'',3908,83),(3919,'',3909,604),(3920,'',3910,776),(3921,'',3911,72),(3922,'',3912,881),(3923,'',3913,810),(3924,'',3914,365),(3925,'',3915,338),(3926,'',3916,570),(3927,'',3917,144),(3928,'',3918,115),(3929,'',3919,343),(3930,'',3920,103),(3931,'',3921,529),(3932,'',3922,785),(3933,'',3923,511),(3934,'',3924,281),(3935,'',3925,811),(3936,'',3926,315),(3937,'',3927,236),(3938,'',3928,154),(3939,'',3929,647),(3940,'',3930,685),(3941,'',3931,272),(3942,'',3932,407),(3943,'',3933,326),(3944,'',3934,267),(3945,'',3935,707),(3946,'',3936,123),(3947,'',3937,558),(3948,'',3938,91),(3949,'',3939,413),(3950,'',3940,582),(3951,'',3941,696),(3952,'',3942,726),(3953,'',3943,544),(3954,'',3944,3),(3955,'',3945,521),(3956,'',3946,310),(3957,'',3947,189),(3958,'',3948,434),(3959,'',3949,459),(3960,'',3950,379),(3961,'',3951,164),(3962,'',3952,618),(3963,'',3953,242),(3964,'',3954,583),(3965,'',3955,925),(3966,'',3956,807),(3967,'',3957,903),(3968,'',3958,758),(3969,'',3959,588),(3970,'',3960,603),(3971,'',3961,719),(3972,'',3962,566),(3973,'',3963,835),(3974,'',3964,831),(3975,'',3965,515),(3976,'',3966,723),(3977,'',3967,645),(3978,'',3968,169),(3979,'',3969,445),(3980,'',3970,47),(3981,'',3971,353),(3982,'',3972,486),(3983,'',3973,478),(3984,'',3974,226),(3985,'',3975,485),(3986,'',3976,887),(3987,'',3977,852),(3988,'',3978,294),(3989,'',3979,661),(3990,'',3980,149),(3991,'',3981,766),(3992,'',3982,922),(3993,'',3983,717),(3994,'',3984,547),(3995,'',3985,629),(3996,'',3986,399),(3997,'',3987,838),(3998,'',3988,276),(3999,'',3989,34),(4000,'',3990,611),(4001,'',3991,106),(4002,'',3992,20),(4003,'',3993,217),(4004,'',3994,510),(4005,'',3995,105),(4006,'',3996,816),(4007,'',3997,96),(4008,'',3998,441),(4009,'',3999,769),(4010,'',4000,771),(4011,'',4001,87),(4012,'',4002,143),(4013,'',4003,453),(4014,'',4004,574),(4015,'',4005,159),(4016,'',4006,137),(4017,'',4007,528),(4018,'',4008,923),(4019,'',4009,561),(4020,'',4010,15),(4021,'',4011,163),(4022,'',4012,383),(4023,'',4013,11),(4024,'',4014,286),(4025,'',4015,101),(4026,'',4016,289),(4027,'',4017,854),(4028,'',4018,787),(4029,'',4019,350),(4030,'',4020,493),(4031,'',4021,386),(4032,'',4022,491),(4033,'',4023,446),(4034,'',4024,929),(4035,'',4025,442),(4036,'',4026,630),(4037,'',4027,113),(4038,'',4028,458),(4039,'',4029,8),(4040,'',4030,744),(4041,'',4031,473),(4042,'',4032,740),(4043,'',4033,199),(4044,'',4034,259),(4045,'',4035,531),(4046,'',4036,265),(4047,'',4037,22),(4048,'',4038,663),(4049,'',4039,474),(4050,'',4040,127),(4051,'',4041,850),(4052,'',4042,882),(4053,'',4043,699),(4054,'',4044,904),(4055,'',4045,111),(4056,'',4046,33),(4057,'',4047,112),(4058,'',4048,560),(4059,'',4049,625),(4060,'',4050,380),(4061,'',4051,654),(4062,'',4052,715),(4063,'',4053,340),(4064,'',4054,412),(4065,'',4055,369),(4066,'',4056,273),(4067,'',4057,820),(4068,'',4058,67),(4069,'',4059,429),(4070,'',4060,905),(4071,'',4061,892),(4072,'',4062,619),(4073,'',4063,633),(4074,'',4064,578),(4075,'',4065,524),(4076,'',4066,494),(4077,'',4067,341),(4078,'',4068,888),(4079,'',4069,564),(4080,'',4070,701),(4081,'',4071,711),(4082,'',4072,423),(4083,'',4073,684),(4084,'',4074,931),(4085,'',4075,6),(4086,'',4076,185),(4087,'',4077,371),(4088,'',4078,664),(4089,'',4079,936),(4090,'',4080,875),(4091,'',4081,271),(4092,'',4082,61),(4093,'',4083,107),(4094,'',4084,833),(4095,'',4085,414),(4096,'',4086,249),(4097,'',4087,745),(4098,'',4088,316),(4099,'',4089,605),(4100,'',4090,802),(4101,'',4091,786),(4102,'',4092,484),(4103,'',4093,183),(4104,'',4094,897),(4105,'',4095,188),(4106,'',4096,329),(4107,'',4097,606),(4108,'',4098,677),(4109,'',4099,320),(4110,'',4100,85),(4111,'',4101,567),(4112,'',4102,596),(4113,'',4103,68),(4114,'',4104,80),(4115,'',4105,809),(4116,'',4106,129),(4117,'',4107,71),(4118,'',4108,878),(4119,'',4109,230),(4120,'',4110,93),(4121,'',4111,193),(4122,'',4112,829),(4123,'',4113,262),(4124,'',4114,672),(4125,'',4115,631),(4126,'',4116,395),(4127,'',4117,255),(4128,'',4118,572),(4129,'',4119,624),(4130,'',4120,233),(4131,'',4121,733),(4132,'',4122,109),(4133,'',4123,658),(4134,'',4124,278),(4135,'',4125,384),(4136,'',4126,54),(4137,'',4127,125),(4138,'',4128,58),(4139,'',4129,162),(4140,'',4130,507),(4141,'',4131,634),(4142,'',4132,713),(4143,'',4133,238),(4144,'',4134,718),(4145,'',4135,846),(4146,'',4136,499),(4147,'',4137,140),(4148,'',4138,173),(4149,'',4139,355),(4150,'',4140,586),(4151,'',4141,389),(4152,'',4142,279),(4153,'',4143,739),(4154,'',4144,207),(4155,'',4145,9),(4156,'',4146,690),(4157,'',4147,705),(4158,'',4148,234),(4159,'',4149,612),(4160,'',4150,759),(4161,'',4151,467),(4162,'',4152,120),(4163,'',4153,362),(4164,'',4154,526),(4165,'',4155,366),(4166,'',4156,358),(4167,'',4157,336),(4168,'',4158,46),(4169,'',4159,157),(4170,'',4160,545),(4171,'',4161,821),(4172,'',4162,516),(4173,'',4163,128),(4174,'',4164,862),(4175,'',4165,768),(4176,'',4166,92),(4177,'',4167,636),(4178,'',4168,179),(4179,'',4169,375),(4180,'',4170,89),(4181,'',4171,548),(4182,'',4172,325),(4183,'',4173,282),(4184,'',4174,419),(4185,'',4175,252),(4186,'',4176,873),(4187,'',4177,424),(4188,'',4178,642),(4189,'',4179,767),(4190,'',4180,874),(4191,'',4181,270),(4192,'',4182,86),(4193,'',4183,239),(4194,'',4184,408),(4195,'',4185,483),(4196,'',4186,722),(4197,'',4187,378),(4198,'',4188,508),(4199,'',4189,398),(4200,'',4190,848),(4201,'',4191,532),(4202,'',4192,627),(4203,'',4193,298),(4204,'',4194,19),(4205,'',4195,623),(4206,'',4196,53),(4207,'',4197,280),(4208,'',4198,231),(4209,'',4199,293),(4210,'',4200,402),(4211,'',4201,746),(4212,'',4202,891),(4213,'',4203,656),(4214,'',4204,409),(4215,'',4205,390),(4216,'',4206,505),(4217,'',4207,208),(4218,'',4208,454),(4219,'',4209,181),(4220,'',4210,426),(4221,'',4211,213),(4222,'',4212,657),(4223,'',4213,554),(4224,'',4214,237),(4225,'',4215,641),(4226,'',4216,764),(4227,'',4217,364),(4228,'',4218,14),(4229,'',4219,205),(4230,'',4220,928),(4231,'',4221,324),(4232,'',4222,431),(4233,'',4223,675),(4234,'',4224,823),(4235,'',4225,742),(4236,'',4226,301),(4237,'',4227,893),(4238,'',4228,457),(4239,'',4229,539),(4240,'',4230,175),(4241,'',4231,790),(4242,'',4232,415),(4243,'',4233,487),(4244,'',4234,472),(4245,'',4235,76),(4246,'',4236,502),(4247,'',4237,700),(4248,'',4238,789),(4249,'',4239,292),(4250,'',4240,693),(4251,'',4241,7),(4252,'',4242,520),(4253,'',4243,117),(4254,'',4244,191),(4255,'',4245,549),(4256,'',4246,118),(4257,'',4247,469),(4258,'',4248,489),(4259,'',4249,868),(4260,'',4250,857),(4261,'',4251,753),(4262,'',4252,418),(4263,'',4253,130),(4264,'',4254,455),(4265,'',4255,585),(4266,'',4256,141),(4267,'',4257,318),(4268,'',4258,600),(4269,'',4259,763),(4270,'',4260,306),(4271,'',4261,709),(4272,'',4262,703),(4273,'',4263,773),(4274,'',4264,552),(4275,'',4265,898),(4276,'',4266,938),(4277,'',4267,337),(4278,'',4268,650),(4279,'',4269,706),(4280,'',4270,328),(4281,'',4271,178),(4282,'',4272,490),(4283,'',4273,896),(4284,'',4274,702),(4285,'',4275,263),(4286,'',4276,156),(4287,'',4277,210),(4288,'',4278,212),(4289,'',4279,653),(4290,'',4280,551),(4291,'',4281,687),(4292,'',4282,804),(4293,'',4283,232),(4294,'',4284,126),(4295,'',4285,550),(4296,'',4286,620),(4297,'',4287,228),(4298,'',4288,609),(4299,'',4289,660),(4300,'',4290,762),(4301,'',4291,95),(4302,'',4292,312),(4303,'',4293,404),(4304,'',4294,559),(4305,'',4295,698),(4306,'',4296,822),(4307,'',4297,782),(4308,'',4298,805),(4309,'',4299,122),(4310,'',4300,686),(4311,'',4301,300),(4312,'',4302,779),(4313,'',4303,342),(4314,'',4304,277),(4315,'',4305,229),(4316,'',4306,927),(4317,'',4307,443),(4318,'',4308,861),(4319,'',4309,824),(4320,'',4310,688),(4321,'',4311,697),(4322,'',4312,108),(4323,'',4313,247),(4324,'',4314,555),(4325,'',4315,859),(4326,'',4316,102),(4327,'',4317,184),(4328,'',4318,285),(4329,'',4319,836),(4330,'',4320,791),(4331,'',4321,523),(4332,'',4322,269),(4333,'',4323,556),(4334,'',4324,331),(4335,'',4325,288),(4336,'',4326,136),(4337,'',4327,142),(4338,'',4328,147),(4339,'',4329,260),(4340,'',4330,448),(4341,'',4331,778),(4342,'',4332,23),(4343,'',4333,304),(4344,'',4334,569),(4345,'',4335,799),(4346,'',4336,307),(4347,'',4337,194),(4348,'',4338,261),(4349,'',4339,13),(4350,'',4340,525),(4351,'',4341,884),(4352,'',4342,880),(4353,'',4343,351),(4354,'',4344,174),(4355,'',4345,468),(4356,'',4346,420),(4357,'',4347,198),(4358,'',4348,435),(4359,'',4349,385),(4360,'',4350,160),(4361,'',4351,283),(4362,'',4352,168),(4363,'',4353,720),(4364,'',4354,39),(4365,'',4355,498),(4366,'',4356,132),(4367,'',4357,35),(4368,'',4358,756),(4369,'',4359,580),(4370,'',4360,594),(4371,'',4361,579),(4372,'',4362,176),(4373,'',4363,465),(4374,'',4364,546),(4375,'',4365,914),(4376,'',4366,608),(4377,'',4367,376),(4378,'',4368,36),(4379,'',4369,796),(4380,'',4370,794),(4381,'',4371,729),(4382,'',4372,475),(4383,'',4373,29),(4384,'',4374,519),(4385,'',4375,659),(4386,'',4376,801),(4387,'',4377,644),(4388,'',4378,368),(4389,'',4379,476),(4390,'',4380,932),(4391,'',4381,725),(4392,'',4382,146),(4393,'',4383,933),(4394,'',4384,295),(4395,'',4385,203),(4396,'',4386,196),(4397,'',4387,153),(4398,'',4388,372),(4399,'',4389,530),(4400,'',4390,716),(4401,'',4391,750),(4402,'',4392,788),(4403,'',4393,2),(4404,'',4394,363),(4405,'',4395,533),(4406,'',4396,268),(4407,'',4397,411),(4408,'',4398,860),(4409,'',4399,895),(4410,'',4400,869),(4411,'',4401,124),(4412,'',4402,840),(4413,'',4403,780),(4414,'',4404,41),(4415,'',4405,610),(4416,'',4406,45),(4417,'',4407,749),(4418,'',4408,721),(4419,'',4409,803),(4420,'',4410,274),(4421,'',4411,74),(4422,'',4412,381),(4423,'',4413,500),(4424,'',4414,44),(4425,'',4415,513),(4426,'',4416,148),(4427,'',4417,741),(4428,'',4418,377),(4429,'',4419,253),(4430,'',4420,808),(4431,'',4421,845),(4432,'',4422,197),(4433,'',4423,225),(4434,'',4424,215),(4435,'',4425,912),(4436,'',4426,900),(4437,'',4427,254),(4438,'',4428,509),(4439,'',4429,614),(4440,'',4430,863),(4441,'',4431,514),(4442,'',4432,655),(4443,'',4433,218),(4444,'',4434,795),(4445,'',4435,56),(4446,'',4436,847),(4447,'',4437,899),(4448,'',4438,37),(4449,'',4439,853),(4450,'',4440,920),(4451,'',4441,182),(4452,'',4442,202),(4453,'',4443,421),(4454,'',4444,651),(4455,'',4445,430),(4456,'',4446,382),(4457,'',4447,1),(4458,'',4448,195),(4459,'',4449,314),(4460,'',4450,781),(4461,'',4451,59),(4462,'',4452,681),(4463,'',4453,245),(4464,'',4454,692),(4465,'',4455,772),(4466,'',4456,765),(4467,'',4457,784),(4468,'',4458,155),(4469,'',4459,602),(4470,'',4460,921),(4471,'',4461,438),(4472,'',4462,209),(4473,'',4463,704),(4474,'',4464,244),(4475,'',4465,134),(4476,'',4466,584),(4477,'',4467,542),(4478,'',4468,406),(4479,'',4469,150),(4480,'',4470,481),(4481,'',4471,775),(4482,'',4472,64),(4483,'',4473,935),(4484,'',4474,335),(4485,'',4475,613),(4486,'',4476,5),(4487,'',4477,151),(4488,'',4478,592),(4489,'',4479,712),(4490,'',4480,374),(4491,'',4481,28),(4492,'',4482,512),(4493,'',4483,171),(4494,'',4484,40),(4495,'',4485,814),(4496,'',4486,400),(4497,'',4487,827),(4498,'',4488,69),(4499,'',4489,246),(4500,'',4490,734),(4501,'',4491,937),(4502,'',4492,571),(4503,'',4493,311),(4504,'',4494,180),(4505,'',4495,427),(4506,'',4496,632),(4507,'',4497,628),(4508,'',4498,760),(4509,'',4499,668),(4510,'',4500,479),(4511,'',4501,597),(4512,'',4502,43),(4513,'',4503,339),(4514,'',4504,243),(4515,'',4505,99),(4516,'',4506,200),(4517,'',4507,77),(4518,'',4508,908),(4519,'',4509,309),(4520,'',4510,674),(4521,'',4511,915),(4522,'',4512,477),(4523,'',4513,562),(4524,'',4514,391),(4525,'',4515,736),(4526,'',4516,813),(4527,'',4517,172),(4528,'',4518,436),(4529,'',4519,30),(4530,'',4520,537),(4531,'',4521,66),(4532,'',4522,680),(4533,'',4523,27),(4534,'',4524,401),(4535,'',4525,370),(4536,'',4526,589),(4537,'',4527,201),(4538,'',4528,323),(4539,'',4529,662),(4540,'',4530,754),(4541,'',4531,135),(4542,'',4532,327),(4543,'',4533,214),(4544,'',4534,352),(4545,'',4535,573),(4546,'',4536,621),(4547,'',4537,917),(4548,'',4538,60),(4549,'',4539,100),(4550,'',4540,648),(4551,'',4541,51),(4552,'',4542,599),(4553,'',4543,21),(4554,'',4544,587),(4555,'',4545,110),(4556,'',4546,670),(4557,'',4547,737),(4558,'',4548,752),(4559,'',4549,730),(4560,'',4550,187),(4561,'',4551,825),(4562,'',4552,540),(4563,'',4553,568),(4564,'',4554,906),(4565,'',4555,425),(4566,'',4556,924),(4567,'',4557,305),(4568,'',4558,676),(4569,'',4559,308),(4570,'',4560,98),(4571,'',4561,679),(4572,'',4562,114),(4573,'',4563,437),(4574,'',4564,819),(4575,'',4565,299),(4576,'',4566,16),(4577,'',4567,116),(4578,'',4568,864),(4579,'',4569,637),(4580,'',4570,616),(4581,'',4571,170),(4582,'',4572,186),(4583,'',4573,883),(4584,'',4574,439),(4585,'',4575,918),(4586,'',4576,220),(4587,'',4577,139),(4588,'',4578,844),(4589,'',4579,433),(4590,'',4580,394),(4591,'',4581,748),(4592,'',4582,682),(4593,'',4583,452),(4594,'',4584,665),(4595,'',4585,926),(4596,'',4586,360),(4597,'',4587,403),(4598,'',4588,678),(4599,'',4589,241),(4600,'',4590,322),(4601,'',4591,447),(4602,'',4592,347),(4603,'',4593,867),(4604,'',4594,290),(4605,'',4595,815),(4606,'',4596,482),(4607,'',4597,714),(4608,'',4598,291),(4609,'',4599,121),(4610,'',4600,417),(4611,'',4601,152),(4612,'',4602,177),(4613,'',4603,708),(4614,'',4604,842),(4615,'',4605,24),(4616,'',4606,710),(4617,'',4607,598),(4618,'',4608,727),(4619,'',4609,221),(4620,'',4610,321),(4621,'',4611,332),(4622,'',4612,257),(4623,'',4613,63),(4624,'',4614,167),(4625,'',4615,235),(4626,'',4616,652),(4627,'',4617,251),(4628,'',4618,517),(4629,'',4619,333),(4630,'',4620,462),(4631,'',4621,689),(4632,'',4622,640),(4633,'',4623,319),(4634,'',4624,302),(4635,'',4625,839),(4636,'',4626,449),(4637,'',4627,919),(4638,'',4628,495),(4639,'',4629,82),(4640,'',4630,843),(4641,'',4631,643),(4642,'',4632,851),(4643,'',4633,909),(4644,'',4634,17),(4645,'',4635,735),(4646,'',4636,50),(4647,'',4637,327),(4648,'',4638,78),(4649,'',4639,79),(4650,'',4640,425),(4651,'',4641,89),(4652,'',4642,22),(4653,'',4643,97),(4654,'',4644,327),(4655,'',4645,89),(4656,'',4646,327),(4657,'',4647,22),(4658,'',4648,327),(4659,'',4649,97),(4660,'',4650,78),(4661,'',4651,89),(4662,'',4652,113),(4663,'',4653,352),(4664,'',4654,79),(4665,'',4655,79),(4666,'',4656,98),(4667,'',4657,327),(4668,'',4658,89),(4669,'',4659,89),(4670,'',4660,89),(4671,'',4661,79),(4672,'',4662,73),(4673,'',4663,425),(4674,'',4664,601),(4675,'',4665,89),(4676,'',4666,79),(4677,'',4667,134),(4678,'',4668,22),(4679,'',4669,78),(4680,'',4670,79),(4681,'',4671,79),(4682,'',4672,91),(4683,'',4673,22),(4684,'',4674,79),(4685,'',4675,643),(4686,'',4676,327),(4687,'',4677,79),(4688,'',4678,79),(4689,'',4679,319),(4690,'',4680,352),(4691,'',4681,89),(4692,'',4682,310),(4693,'',4683,79),(4694,'',4684,134),(4695,'',4685,327),(4696,'',4686,89),(4697,'',4687,548),(4698,'',4688,98),(4699,'',4689,384),(4700,'',NULL,74),(4701,'',4691,200),(4702,'',4692,16),(4703,'',4693,200),(4704,'',4694,99),(4705,'',4695,200),(4706,'',4696,89),(4707,'',4697,548),(4708,'',4698,425),(4709,'',4699,79),(4710,'',4700,16),(4711,'',4701,78),(4712,'',4702,16),(4713,'',4703,78),(4714,'',4704,16),(4715,'',4705,200),(4716,'',4706,16),(4717,'',4707,16),(4718,'',4708,98),(4719,'',4709,16),(4720,'',4710,99),(4721,'',4711,548),(4722,'',4712,16),(4723,'',4713,89),(4724,'',4714,78),(4725,'',4715,425),(4726,'',4716,200),(4727,'',4717,16),(4728,'',4718,200),(4729,'',4719,200),(4730,'',4720,209),(4731,'',NULL,79),(4732,'',4722,541),(4733,'',4723,425),(4734,'',4724,200),(4735,'',4725,16),(4736,'',4726,200),(4737,'',4727,79),(4738,'',4728,550),(4739,'',4729,16),(4740,'',4730,94),(4741,'',4731,89),(4742,'',4732,425),(4743,'',4733,200),(4744,'',4734,425),(4745,'',4735,99),(4746,'',4736,16),(4747,'',4737,89),(4748,'',4738,16),(4749,'',4739,16),(4750,'',4740,200),(4751,'',4741,16),(4752,'',4742,16),(4753,'',4743,209),(4754,'',4744,16),(4755,'',4745,16),(4756,'',NULL,16),(4757,'',NULL,79),(4758,'',4748,200),(4759,'',4749,601),(4760,'',4750,541),(4761,'',4751,200),(4762,'',4752,16),(4763,'',4753,311),(4764,'',4754,200),(4765,'',4755,200),(4766,'',4756,16),(4767,'',NULL,16),(4768,'',4758,16),(4769,'',4759,311),(4770,'',4760,16),(4771,'',4761,200),(4772,'',4762,16),(4773,'',4763,200),(4774,'',4764,113),(4775,'',4765,94),(4776,'',4766,326),(4777,'',4767,79),(4778,'',4768,16),(4779,'',4769,548),(4780,'',4770,16),(4781,'',4771,16),(4782,'',4772,94),(4783,'',4773,16),(4784,'',4774,16),(4785,'',4775,200),(4786,'',4776,16),(4787,'',4777,200),(4788,'',4778,94),(4789,'',4779,16),(4790,'',4780,614),(4791,'',4781,425),(4792,'',4782,89),(4793,'',4783,16),(4794,'',4784,94),(4795,'',4785,16),(4796,'',4786,200),(4797,'',4787,200),(4798,'',4788,200),(4799,'',4789,200),(4800,'',4790,89),(4801,'',4791,298),(4802,'',4792,209),(4803,'',4793,209),(4804,'',4794,209),(4805,'',4795,200),(4806,'',4796,200),(4807,'',4797,16),(4808,'',4798,16),(4809,'',4799,16),(4810,'',4800,16),(4811,'',4801,425),(4812,'',4802,16),(4813,'',4803,209),(4814,'',4804,200),(4815,'',4805,326),(4816,'',4806,99),(4817,'',4807,16),(4818,'',4808,200),(4819,'',4809,200),(4820,'',4810,209),(4821,'',4811,16),(4822,'',4812,200),(4823,'',4813,311),(4824,'',NULL,16),(4825,'',4815,16),(4826,'',4816,425),(4827,'',4817,16),(4828,'',4818,425),(4829,'',4819,16),(4830,'',4820,79),(4831,'',4821,89),(4832,'',4822,16),(4833,'',4823,89),(4834,'',4824,209),(4835,'',4825,200),(4836,'',4826,541),(4837,'',4827,311),(4838,'',4828,16),(4839,'',4829,541),(4840,'',4830,425),(4841,'',4831,16),(4842,'',4832,16),(4843,'',4833,548),(4844,'',4834,16),(4845,'',4814,16),(4846,'',4835,200),(4847,'',4836,312),(4848,'',4837,99),(4849,'',4838,79),(4850,'',4839,89),(4851,'',4840,16),(4852,'',4841,287),(4853,'',4842,78),(4854,'',4843,16),(4855,'',4844,548),(4856,'',4845,16),(4857,'',4846,200),(4858,'',4847,16),(4859,'',4848,79),(4860,'',4849,200),(4861,'',4850,16),(4862,'',4851,541),(4863,'',4852,79),(4864,'',NULL,425),(4865,'',NULL,287),(4866,'',NULL,209),(4867,'',NULL,540),(4868,'',NULL,200),(4869,'',NULL,425),(4870,'',NULL,540),(4871,'',NULL,209),(4872,'',NULL,425),(4873,'',NULL,79),(4874,'',NULL,200),(4875,'',NULL,548),(4876,'',NULL,548),(4877,'',NULL,548),(4878,'',NULL,425),(4879,'',NULL,79),(4880,'',NULL,200),(4881,'',NULL,540),(4882,'',NULL,209),(4883,'',NULL,818),(4884,'',NULL,425),(4885,'',NULL,200),(4886,'',NULL,200),(4887,'',NULL,200),(4888,'',NULL,298),(4889,'',NULL,200),(4890,'',NULL,425),(4891,'',NULL,425),(4892,'',NULL,200),(4893,'',NULL,200),(4894,'',4883,672),(4895,'',NULL,400),(4896,'',NULL,672),(4897,'',NULL,200),(4898,'',NULL,201),(4899,'',NULL,540),(4900,'',NULL,672),(4901,'',NULL,200),(4902,'',NULL,425),(4903,'',NULL,94),(4904,'',NULL,89),(4905,'',NULL,200),(4906,'',NULL,425),(4907,'',NULL,200),(4908,'',NULL,200),(4909,'',NULL,425),(4910,'',NULL,731),(4911,'',NULL,200),(4912,'',NULL,200),(4913,'',NULL,200),(4914,'',4903,525),(4915,'',4904,330),(4916,'',4905,287),(4917,'',4906,116),(4918,'',4907,200),(4919,'',4908,201),(4920,'',4909,757),(4921,'',4910,523),(4922,'',4911,384),(4923,'',4912,209),(4924,'',4913,434),(4925,'',4914,312),(4926,'',4915,80),(4927,'',4916,200),(4928,'',4917,16),(4929,'',4918,307),(4930,'',4919,79),(4931,'',4920,16),(4932,'',4921,200),(4933,'',4922,601),(4934,'',4923,16),(4935,'',4924,540),(4936,'',4925,200),(4937,'',4926,119),(4938,'',4927,89),(4939,'',4928,16),(4940,'',4929,16),(4941,'',4930,74),(4942,'',4931,190),(4943,'',4932,16),(4944,'',4933,200),(4945,'',4934,359),(4946,'',4935,16),(4947,'',4936,548),(4948,'',4937,530),(4949,'',4938,384),(4950,'',4939,287),(4951,'',4940,259),(4952,'',4941,319),(4953,'',4942,77),(4954,'',4943,89),(4955,'',4944,326),(4956,'',4945,840),(4957,'',4946,16),(4958,'',4947,89),(4959,'',4948,425),(4960,'',4949,89),(4961,'',4950,79),(4962,'',4951,200),(4963,'',4952,74),(4964,'',4953,200),(4965,'',4954,78),(4966,'',4955,530),(4967,'',4956,307),(4968,'',4957,16),(4969,'',4958,434),(4970,'',4959,98),(4971,'',4960,648),(4972,'',4961,319),(4973,'',4962,215),(4974,'',4963,326),(4975,'',4964,16),(4976,'',NULL,16),(4977,'',4966,524),(4978,'',4967,614),(4979,'',4968,326),(4980,'',4969,352),(4981,'',4970,16),(4982,'',4971,200),(4983,'',4972,200),(4984,'',4973,526),(4985,'',4974,113),(4986,'',4965,16),(4987,'',4975,16),(4988,'',4976,16),(4989,'',4977,79),(4990,'',4978,16),(4991,'',4979,16),(4992,'',4980,201),(4993,'',4981,16),(4994,'',4982,16),(4995,'',4983,16),(4996,'',4984,79),(4997,'',4985,16),(4998,'',4986,78),(4999,'',4987,16),(5000,'',4988,285),(5001,'',4989,16),(5002,'',4990,201),(5003,'',4991,79),(5004,'',4992,16),(5005,'',4993,79),(5006,'',4994,79),(5007,'',4995,16),(5008,'',4996,16),(5009,'',4997,201),(5010,'',4998,16),(5011,'',4999,16),(5012,'',5000,22),(5013,'',5001,16),(5014,'',5002,16),(5015,'',5003,16),(5016,'',5004,113),(5017,'',5005,16),(5018,'',5006,79),(5019,'',5007,16),(5020,'',5008,16),(5021,'',5009,601),(5022,'',5010,98),(5023,'',5011,16),(5024,'',5012,16),(5025,'',5013,16),(5026,'',5014,16),(5027,'',5015,16),(5028,'',5016,16),(5029,'',5017,16),(5030,'',5018,601),(5031,'',5019,201),(5032,'',5020,89),(5033,'',5021,16),(5034,'',5022,16),(5035,'',5023,16),(5036,'',5024,16),(5037,'',5025,16),(5038,'',5026,16),(5039,'',5027,79),(5040,'',5028,89),(5041,'',5029,352),(5042,'',5030,16),(5043,'',5031,16),(5044,'',5032,16),(5045,'',5033,16),(5046,'',5034,89),(5047,'',5035,311),(5048,'',5036,16),(5049,'',5037,16),(5050,'',5038,16),(5051,'',5039,16),(5052,'',5040,79),(5053,'',5041,16),(5054,'',5042,16),(5055,'',5043,22),(5056,'',5044,311),(5057,'',5045,79),(5058,'',5046,16),(5059,'',5047,16),(5060,'',5048,676),(5061,'',5049,22),(5062,'',5050,16),(5063,'',5051,113),(5064,'',5052,230),(5065,'',5053,16),(5066,'',5054,230),(5067,'',5055,298),(5068,'',5056,16),(5069,'',5057,610),(5070,'',NULL,16),(5071,'',5059,16),(5072,'',5060,16),(5073,'',5061,16),(5074,'',5062,16),(5075,'',5063,16),(5076,'',NULL,16),(5077,'',5065,16),(5078,'',NULL,16),(5079,'',5067,16),(5080,'',5068,548),(5081,'',5069,16),(5082,'',NULL,16),(5083,'',5071,22),(5084,'',5072,550),(5085,'',5073,89),(5086,'',5074,601),(5087,'',5075,650),(5088,'',5076,297),(5089,'',5077,16),(5090,'',5078,16),(5091,'',5079,79),(5092,'',5080,16),(5093,'',5081,113),(5094,'',5082,524),(5095,'',NULL,16),(5096,'',5084,16),(5097,'',5085,522),(5098,'',5086,16),(5099,'',5087,89),(5100,'',5088,16),(5101,'',5089,16),(5102,'',5090,78),(5103,'',NULL,16),(5104,'',5092,190),(5105,'',5093,79),(5106,'',NULL,16),(5107,'',5095,16),(5108,'',5096,548),(5109,'',5097,16),(5110,'',5098,113),(5111,'',5099,610),(5112,'',5100,425),(5113,'',5101,16),(5114,'',5102,311),(5115,'',5103,16),(5116,'',5104,548),(5117,'',5105,16),(5118,'',5106,548),(5119,'',5107,16),(5120,'',5108,352),(5121,'',5109,16),(5122,'',5110,16),(5123,'',5111,16),(5124,'',5112,327),(5125,'',5113,16),(5126,'',5114,16),(5127,'',NULL,16),(5128,'',5116,16),(5129,'',5117,16),(5130,'',5118,16),(5131,'',5119,524),(5132,'',5120,16),(5133,'',5121,643),(5134,'',NULL,16),(5135,'',5123,134),(5136,'',NULL,79),(5137,'',NULL,16),(5138,'',NULL,16),(5139,'',NULL,16),(5140,'',NULL,16),(5141,'',NULL,16),(5142,'',NULL,16),(5143,'',NULL,16),(5144,'',NULL,16),(5145,'',NULL,16),(5146,'',5125,776),(5147,'',5126,590),(5148,'',5127,470),(5149,'',5128,479),(5150,'',5129,485),(5151,'',5130,365),(5152,'',5131,188),(5153,'',5132,683),(5154,'',5133,869),(5155,'',5134,392),(5156,'',5135,578),(5157,'',5136,782),(5158,'',5137,797),(5159,'',5138,677),(5160,'',5139,204),(5161,'',5140,860),(5162,'',5141,194),(5163,'',5142,755),(5164,'',5143,90),(5165,'',5144,303),(5166,'',5145,111),(5167,'',5146,272),(5168,'',5147,99),(5169,'',5148,807),(5170,'',5149,662),(5171,'',5150,167),(5172,'',5151,210),(5173,'',5152,881),(5174,'',5153,57),(5175,'',5154,875),(5176,'',5155,219),(5177,'',5156,584),(5178,'',5157,84),(5179,'',5158,318),(5180,'',5159,293),(5181,'',5160,287),(5182,'',5161,173),(5183,'',5162,491),(5184,'',5163,501),(5185,'',5164,386),(5186,'',5165,906),(5187,'',5166,78),(5188,'',5167,896),(5189,'',5168,761),(5190,'',5169,600),(5191,'',5170,609),(5192,'',5171,464),(5193,'',5172,599),(5194,'',5173,854),(5195,'',5174,708),(5196,'',5175,371),(5197,'',5176,402),(5198,'',5177,563),(5199,'',5178,698),(5200,'',5179,63),(5201,'',5180,266),(5202,'',5181,105),(5203,'',5182,836),(5204,'',5183,149),(5205,'',5184,30),(5206,'',5185,494),(5207,'',5186,353),(5208,'',5187,488),(5209,'',5188,347),(5210,'',5189,45),(5211,'',5190,39),(5212,'',5191,863),(5213,'',5192,197),(5214,'',5193,248),(5215,'',5194,380),(5216,'',5195,566),(5217,'',5196,452),(5218,'',5197,275),(5219,'',5198,155),(5220,'',5199,665),(5221,'',5200,374),(5222,'',5201,368),(5223,'',5202,692),(5224,'',5203,572),(5225,'',5204,587),(5226,'',5205,446),(5227,'',5206,467),(5228,'',5207,281),(5229,'',5208,785),(5230,'',5209,650),(5231,'',5210,686),(5232,'',5211,545),(5233,'',5212,66),(5234,'',5213,935),(5235,'',5214,743),(5236,'',5215,593),(5237,'',5216,644),(5238,'',5217,758),(5239,'',5218,296),(5240,'',5219,161),(5241,'',5220,671),(5242,'',5221,857),(5243,'',5222,51),(5244,'',5223,260),(5245,'',5224,87),(5246,'',5225,884),(5247,'',5226,2),(5248,'',5227,770),(5249,'',5228,764),(5250,'',5229,269),(5251,'',5230,779),(5252,'',5231,659),(5253,'',5232,473),(5254,'',5233,842),(5255,'',5234,176),(5256,'',5235,182),(5257,'',5236,878),(5258,'',5237,551),(5259,'',5238,737),(5260,'',5239,72),(5261,'',5240,389),(5262,'',5241,395),(5263,'',5242,254),(5264,'',5243,263),(5265,'',5244,5),(5266,'',5245,824),(5267,'',5246,158),(5268,'',5247,668),(5269,'',5248,527),(5270,'',5249,362),(5271,'',5250,48),(5272,'',5251,731),(5273,'',5252,917),(5274,'',5253,257),(5275,'',5254,236),(5276,'',5255,626),(5277,'',5256,575),(5278,'',5257,830),(5279,'',5258,278),(5280,'',5259,143),(5281,'',5260,329),(5282,'',5261,845),(5283,'',5262,839),(5284,'',5263,33),(5285,'',5264,242),(5286,'',5265,69),(5287,'',5266,428),(5288,'',5267,752),(5289,'',5268,938),(5290,'',5269,137),(5291,'',5270,320),(5292,'',5271,455),(5293,'',5272,27),(5294,'',5273,164),(5295,'',5274,719),(5296,'',5275,674),(5297,'',5276,554),(5298,'',5277,54),(5299,'',5278,377),(5300,'',5279,923),(5301,'',5280,449),(5302,'',5281,818),(5303,'',5282,440),(5304,'',5283,632),(5305,'',5284,767),(5306,'',5285,12),(5307,'',5286,476),(5308,'',5287,341),(5309,'',5288,335),(5310,'',5289,179),(5311,'',5290,725),(5312,'',5291,434),(5313,'',5292,548),(5314,'',5293,461),(5315,'',5294,653),(5316,'',5295,533),(5317,'',5296,647),(5318,'',5297,356),(5319,'',5298,851),(5320,'',5299,170),(5321,'',5300,866),(5322,'',5301,560),(5323,'',5302,746),(5324,'',5303,569),(5325,'',5304,60),(5326,'',5305,323),(5327,'',5306,437),(5328,'',5307,641),(5329,'',5308,350),(5330,'',5309,656),(5331,'',5310,536),(5332,'',5311,542),(5333,'',5312,401),(5334,'',5313,911),(5335,'',5314,749),(5336,'',5315,500),(5337,'',5316,614),(5338,'',5317,458),(5339,'',5318,509),(5340,'',5319,152),(5341,'',5320,8),(5342,'',5321,848),(5343,'',5322,713),(5344,'',5323,707),(5345,'',5324,416),(5346,'',5325,740),(5347,'',5326,926),(5348,'',5327,620),(5349,'',5328,125),(5350,'',5329,635),(5351,'',5330,629),(5352,'',5331,515),(5353,'',5332,15),(5354,'',5333,833),(5355,'',5334,338),(5356,'',5335,218),(5357,'',5336,728),(5358,'',5337,42),(5359,'',5338,251),(5360,'',5339,245),(5361,'',5340,110),(5362,'',5341,131),(5363,'',5342,806),(5364,'',5343,146),(5365,'',5344,344),(5366,'',5345,36),(5367,'',5346,359),(5368,'',5347,905),(5369,'',5348,239),(5370,'',5349,608),(5371,'',5350,422),(5372,'',5351,557),(5373,'',5352,302),(5374,'',5353,932),(5375,'',5354,98),(5376,'',5355,812),(5377,'',5356,317),(5378,'',5357,827),(5379,'',5358,521),(5380,'',5359,21),(5381,'',5360,230),(5382,'',5361,224),(5383,'',5362,119),(5384,'',5363,734),(5385,'',5364,443),(5386,'',5365,311),(5387,'',5366,821),(5388,'',5367,206),(5389,'',5368,410),(5390,'',5369,920),(5391,'',5370,92),(5392,'',5371,71),(5393,'',5372,233),(5394,'',5373,113),(5395,'',5374,419),(5396,'',5375,929),(5397,'',5376,809),(5398,'',5377,784),(5399,'',5378,128),(5400,'',5379,623),(5401,'',5380,332),(5402,'',5381,326),(5403,'',5382,518),(5404,'',5383,18),(5405,'',5384,701),(5406,'',5385,196),(5407,'',5386,691),(5408,'',5387,394),(5409,'',5388,404),(5410,'',5389,86),(5411,'',5390,503),(5412,'',5391,638),(5413,'',5392,799),(5414,'',5393,493),(5415,'',5394,530),(5416,'',5395,602),(5417,'',5396,716),(5418,'',5397,425),(5419,'',5398,305),(5420,'',5399,815),(5421,'',5400,524),(5422,'',5401,24),(5423,'',5402,914),(5424,'',5403,883),(5425,'',5404,227),(5426,'',5405,592),(5427,'',5406,586),(5428,'',5407,431),(5429,'',5408,800),(5430,'',5409,140),(5431,'',5410,790),(5432,'',5411,134),(5433,'',5412,295),(5434,'',5413,685),(5435,'',5414,212),(5436,'',5415,539),(5437,'',5416,908),(5438,'',5417,722),(5439,'',5418,898),(5440,'',5419,107),(5441,'',5420,617),(5442,'',5421,481),(5443,'',5422,595),(5444,'',5423,667),(5445,'',5424,184),(5446,'',5425,694),(5447,'',5426,74),(5448,'',5427,902),(5449,'',5428,101),(5450,'',5429,89),(5451,'',5430,803),(5452,'',5431,793),(5453,'',5432,200),(5454,'',5433,496),(5455,'',5434,710),(5456,'',5435,871),(5457,'',5436,215),(5458,'',5437,865),(5459,'',5438,209),(5460,'',5439,199),(5461,'',5440,574),(5462,'',5441,413),(5463,'',5442,95),(5464,'',5443,122),(5465,'',5444,308),(5466,'',5445,277),(5467,'',5446,787),(5468,'',5447,53),(5469,'',5448,376),(5470,'',5449,190),(5471,'',5450,68),(5472,'',5451,886),(5473,'',5452,580),(5474,'',5453,80),(5475,'',5454,589),(5476,'',5455,283),(5477,'',5456,475),(5478,'',5457,298),(5479,'',5458,178),(5480,'',5459,512),(5481,'',5460,506),(5482,'',5461,688),(5483,'',5462,407),(5484,'',5463,397),(5485,'',5464,766),(5486,'',5465,605),(5487,'',5466,611),(5488,'',5467,314),(5489,'',5468,704),(5490,'',5469,673),(5491,'',5470,382),(5492,'',5471,568),(5493,'',5472,221),(5494,'',5473,892),(5495,'',5474,772),(5496,'',5475,116),(5497,'',5476,463),(5498,'',5477,41),(5499,'',5478,35),(5500,'',5479,499),(5501,'',5480,364),(5502,'',5481,358),(5503,'',5482,682),(5504,'',5483,562),(5505,'',5484,271),(5506,'',5485,577),(5507,'',5486,598),(5508,'',5487,457),(5509,'',5488,781),(5510,'',5489,490),(5511,'',5490,484),(5512,'',5491,379),(5513,'',5492,874),(5514,'',5493,193),(5515,'',5494,697),(5516,'',5495,583),(5517,'',5496,748),(5518,'',5497,769),(5519,'',5498,83),(5520,'',5499,286),(5521,'',5500,151),(5522,'',5501,796),(5523,'',5502,661),(5524,'',5503,847),(5525,'',5504,655),(5526,'',5505,556),(5527,'',5506,203),(5528,'',5507,895),(5529,'',5508,104),(5530,'',5509,754),(5531,'',5510,760),(5532,'',5511,649),(5533,'',5512,166),(5534,'',5513,172),(5535,'',5514,868),(5536,'',5515,676),(5537,'',5516,370),(5538,'',5517,62),(5539,'',5518,56),(5540,'',5519,880),(5541,'',5520,385),(5542,'',5521,265),(5543,'',5522,889),(5544,'',5523,775),(5545,'',5524,7),(5546,'',5525,292),(5547,'',5526,478),(5548,'',5527,853),(5549,'',5528,187),(5550,'',5529,391),(5551,'',5530,250),(5552,'',5531,77),(5553,'',5532,259),(5554,'',5533,820),(5555,'',5534,274),(5556,'',5535,268),(5557,'',5536,133),(5558,'',5537,643),(5559,'',5538,829),(5560,'',5539,538),(5561,'',5540,181),(5562,'',5541,487),(5563,'',5542,232),(5564,'',5543,59),(5565,'',5544,877),(5566,'',5545,742),(5567,'',5546,928),(5568,'',5547,445),(5569,'',5548,1),(5570,'',5549,289),(5571,'',5550,17),(5572,'',5551,835),(5573,'',5552,154),(5574,'',5553,148),(5575,'',5554,352),(5576,'',5555,50),(5577,'',5556,44),(5578,'',5557,367),(5579,'',5558,253),(5580,'',5559,388),(5581,'',5560,247),(5582,'',5561,571),(5583,'',5562,280),(5584,'',5563,466),(5585,'',5564,169),(5586,'',5565,664),(5587,'',5566,670),(5588,'',5567,679),(5589,'',5568,373),(5590,'',5569,559),(5591,'',5570,934),(5592,'',5571,778),(5593,'',5572,451),(5594,'',5573,331),(5595,'',5574,637),(5596,'',5575,23),(5597,'',5576,346),(5598,'',5577,841),(5599,'',5578,550),(5600,'',5579,544),(5601,'',5580,736),(5602,'',5581,439),(5603,'',5582,763),(5604,'',5583,472),(5605,'',5584,658),(5606,'',5585,160),(5607,'',5586,38),(5608,'',5587,862),(5609,'',5588,175),(5610,'',5589,856),(5611,'',5590,721),(5612,'',5591,430),(5613,'',5592,565),(5614,'',5593,757),(5615,'',5594,65),(5616,'',5595,142),(5617,'',5596,652),(5618,'',5597,838),(5619,'',5598,511),(5620,'',5599,220),(5621,'',5600,412),(5622,'',5601,547),(5623,'',5602,916),(5624,'',5603,47),(5625,'',5604,751),(5626,'',5605,610),(5627,'',5606,619),(5628,'',5607,328),(5629,'',5608,454),(5630,'',5609,823),(5631,'',5610,163),(5632,'',5611,859),(5633,'',5612,532),(5634,'',5613,718),(5635,'',5614,922),(5636,'',5615,121),(5637,'',5616,631),(5638,'',5617,745),(5639,'',5618,817),(5640,'',5619,334),(5641,'',5620,4),(5642,'',5621,26),(5643,'',5622,844),(5644,'',5623,157),(5645,'',5624,703),(5646,'',5625,229),(5647,'',5626,361),(5648,'',5627,256),(5649,'',5628,802),(5650,'',5629,115),(5651,'',5630,460),(5652,'',5631,646),(5653,'',5632,11),(5654,'',5633,469),(5655,'',5634,901),(5656,'',5635,355),(5657,'',5636,349),(5658,'',5637,214),(5659,'',5638,724),(5660,'',5639,241),(5661,'',5640,433),(5662,'',5641,313),(5663,'',5642,427),(5664,'',5643,937),(5665,'',5644,136),(5666,'',5645,340),(5667,'',5646,32),(5668,'',5647,526),(5669,'',5648,235),(5670,'',5649,850),(5671,'',5650,730),(5672,'',5651,553),(5673,'',5652,739),(5674,'',5653,625),(5675,'',5654,262),(5676,'',5655,448),(5677,'',5656,322),(5678,'',5657,316),(5679,'',5658,520),(5680,'',5659,535),(5681,'',5660,415),(5682,'',5661,925),(5683,'',5662,238),(5684,'',5663,894),(5685,'',5664,442),(5686,'',5665,628),(5687,'',5666,14),(5688,'',5667,337),(5689,'',5668,202),(5690,'',5669,541),(5691,'',5670,400),(5692,'',5671,696),(5693,'',5672,82),(5694,'',5673,97),(5695,'',5674,805),(5696,'',5675,613),(5697,'',5676,795),(5698,'',5677,139),(5699,'',5678,508),(5700,'',5679,514),(5701,'',5680,832),(5702,'',5681,712),(5703,'',5682,421),(5704,'',5683,727),(5705,'',5684,607),(5706,'',5685,931),(5707,'',5686,130),(5708,'',5687,124),(5709,'',5688,640),(5710,'',5689,826),(5711,'',5690,634),(5712,'',5691,529),(5713,'',5692,498),(5714,'',5693,20),(5715,'',5694,343),(5716,'',5695,223),(5717,'',5696,29),(5718,'',5697,733),(5719,'',5698,888),(5720,'',5699,118),(5721,'',5700,597),(5722,'',5701,436),(5723,'',5702,301),(5724,'',5703,811),(5725,'',5704,145),(5726,'',5705,706),(5727,'',5706,910),(5728,'',5707,904),(5729,'',5708,244),(5730,'',5709,217),(5731,'',5710,103),(5732,'',5711,409),(5733,'',5712,399),(5734,'',5713,919),(5735,'',5714,486),(5736,'',5715,814),(5737,'',5716,700),(5738,'',5717,690),(5739,'',5718,189),(5740,'',5719,709),(5741,'',5720,699),(5742,'',5721,913),(5743,'',5722,85),(5744,'',5723,79),(5745,'',5724,112),(5746,'',5725,808),(5747,'',5726,798),(5748,'',5727,310),(5749,'',5728,502),(5750,'',5729,325),(5751,'',5730,211),(5752,'',5731,205),(5753,'',5732,180),(5754,'',5733,907),(5755,'',5734,876),(5756,'',5735,70),(5757,'',5736,393),(5758,'',5737,418),(5759,'',5738,424),(5760,'',5739,319),(5761,'',5740,127),(5762,'',5741,288),(5763,'',5742,523),(5764,'',5743,492),(5765,'',5744,64),(5766,'',5745,882),(5767,'',5746,195),(5768,'',5747,387),(5769,'',5748,91),(5770,'',5749,585),(5771,'',5750,304),(5772,'',5751,294),(5773,'',5752,622),(5774,'',5753,403),(5775,'',5754,517),(5776,'',5755,106),(5777,'',5756,570),(5778,'',5757,616),(5779,'',5758,471),(5780,'',5759,715),(5781,'',5760,684),(5782,'',5761,678),(5783,'',5762,579),(5784,'',5763,226),(5785,'',5764,897),(5786,'',5765,601),(5787,'',5766,783),(5788,'',5767,777),(5789,'',5768,591),(5790,'',5769,651),(5791,'',5770,505),(5792,'',5771,474),(5793,'',5772,360),(5794,'',5773,46),(5795,'',5774,369),(5796,'',5775,864),(5797,'',5776,208),(5798,'',5777,687),(5799,'',5778,567),(5800,'',5779,573),(5801,'',5780,786),(5802,'',5781,672),(5803,'',5782,495),(5804,'',5783,885),(5805,'',5784,198),(5806,'',5785,453),(5807,'',5786,588),(5808,'',5787,94),(5809,'',5788,771),(5810,'',5789,297),(5811,'',5790,666),(5812,'',5791,52),(5813,'',5792,870),(5814,'',5793,183),(5815,'',5794,879),(5816,'',5795,109),(5817,'',5796,765),(5818,'',5797,759),(5819,'',5798,282),(5820,'',5799,468),(5821,'',5800,792),(5822,'',5801,177),(5823,'',5802,381),(5824,'',5803,375),(5825,'',5804,73),(5826,'',5805,891),(5827,'',5806,67),(5828,'',5807,276),(5829,'',5808,750),(5830,'',5809,604),(5831,'',5810,594),(5832,'',5811,480),(5833,'',5812,307),(5834,'',5813,489),(5835,'',5814,162),(5836,'',5815,858),(5837,'',5816,693),(5838,'',5817,552),(5839,'',5818,406),(5840,'',5819,261),(5841,'',5820,396),(5842,'',5821,88),(5843,'',5822,100),(5844,'',5823,279),(5845,'',5824,789),(5846,'',5825,483),(5847,'',5826,342),(5848,'',5827,34),(5849,'',5828,852),(5850,'',5829,192),(5851,'',5830,378),(5852,'',5831,747),(5853,'',5832,561),(5854,'',5833,441),(5855,'',5834,264),(5856,'',5835,150),(5857,'',5836,6),(5858,'',5837,28),(5859,'',5838,159),(5860,'',5839,40),(5861,'',5840,363),(5862,'',5841,669),(5863,'',5842,549),(5864,'',5843,55),(5865,'',5844,873),(5866,'',5845,258),(5867,'',5846,576),(5868,'',5847,582),(5869,'',5848,462),(5870,'',5849,831),(5871,'',5850,285),(5872,'',5851,780),(5873,'',5852,165),(5874,'',5853,540),(5875,'',5854,675),(5876,'',5855,534),(5877,'',5856,243),(5878,'',5857,753),(5879,'',5858,633),(5880,'',5859,456),(5881,'',5860,648),(5882,'',5861,291),(5883,'',5862,846),(5884,'',5863,186),(5885,'',5864,660),(5886,'',5865,555),(5887,'',5866,144),(5888,'',5867,774),(5889,'',5868,654),(5890,'',5869,768),(5891,'',5870,477),(5892,'',5871,171),(5893,'',5872,357),(5894,'',5873,49),(5895,'',5874,681),(5896,'',5875,867),(5897,'',5876,732),(5898,'',5877,435),(5899,'',5878,61),(5900,'',5879,390),(5901,'',5880,384),(5902,'',5881,930),(5903,'',5882,270),(5904,'',5883,76),(5905,'',5884,147),(5906,'',5885,9),(5907,'',5886,663),(5908,'',5887,657),(5909,'',5888,522),(5910,'',5889,417),(5911,'',5890,43),(5912,'',5891,861),(5913,'',5892,366),(5914,'',5893,174),(5915,'',5894,912),(5916,'',5895,621),(5917,'',5896,735),(5918,'',5897,756),(5919,'',5898,615),(5920,'',5899,273),(5921,'',5900,324),(5922,'',5901,834),(5923,'',5902,828),(5924,'',5903,168),(5925,'',5904,729),(5926,'',5905,231),(5927,'',5906,933),(5928,'',5907,927),(5929,'',5908,246),(5930,'',5909,126),(5931,'',5910,636),(5932,'',5911,450),(5933,'',5912,22),(5934,'',5913,345),(5935,'',5914,153),(5936,'',5915,459),(5937,'',5916,339),(5938,'',5917,849),(5939,'',5918,714),(5940,'',5919,372),(5941,'',5920,558),(5942,'',5921,252),(5943,'',5922,58),(5944,'',5923,813),(5945,'',5924,267),(5946,'',5925,762),(5947,'',5926,330),(5948,'',5927,465),(5949,'',5928,516),(5950,'',5929,840),(5951,'',5930,16),(5952,'',5931,225),(5953,'',5932,720),(5954,'',5933,543),(5955,'',5934,423),(5956,'',5935,438),(5957,'',5936,132),(5958,'',5937,642),(5959,'',5938,351),(5960,'',5939,537),(5961,'',5940,37),(5962,'',5941,855),(5963,'',5942,741),(5964,'',5943,564),(5965,'',5944,444),(5966,'',5945,432),(5967,'',5946,618),(5968,'',5947,141),(5969,'',5948,327),(5970,'',5949,19),(5971,'',5950,531),(5972,'',5951,717),(5973,'',5952,900),(5974,'',5953,354),(5975,'',5954,426),(5976,'',5955,249),(5977,'',5956,744),(5978,'',5957,312),(5979,'',5958,639),(5980,'',5959,207),(5981,'',5960,3),(5982,'',5961,843),(5983,'',5962,156),(5984,'',5963,702),(5985,'',5964,525),(5986,'',5965,546),(5987,'',5966,411),(5988,'',5967,738),(5989,'',5968,255),(5990,'',5969,630),(5991,'',5970,510),(5992,'',5971,624),(5993,'',5972,519),(5994,'',5973,10),(5995,'',5974,213),(5996,'',5975,837),(5997,'',5976,723),(5998,'',5977,909),(5999,'',5978,240),(6000,'',5979,936),(6001,'',5980,822),(6002,'',5981,801),(6003,'',5982,135),(6004,'',5983,791),(6005,'',5984,129),(6006,'',5985,645),(6007,'',5986,504),(6008,'',5987,25),(6009,'',5988,31),(6010,'',5989,348),(6011,'',5990,890),(6012,'',5991,234),(6013,'',5992,603),(6014,'',5993,899),(6015,'',5994,921),(6016,'',5995,93),(6017,'',5996,120),(6018,'',5997,447),(6019,'',5998,306),(6020,'',5999,816),(6021,'',6000,333),(6022,'',6001,405),(6023,'',6002,915),(6024,'',6003,228),(6025,'',6004,108),(6026,'',6005,114),(6027,'',6006,336),(6028,'',6007,315),(6029,'',6008,191),(6030,'',6009,705),(6031,'',6010,222),(6032,'',6011,924),(6033,'',6012,918),(6034,'',6013,804),(6035,'',6014,123),(6036,'',6015,773),(6037,'',6016,117),(6038,'',6017,321),(6039,'',6018,627),(6040,'',6019,290),(6041,'',6020,13),(6042,'',6021,507),(6043,'',6022,872),(6044,'',6023,216),(6045,'',6024,185),(6046,'',6025,887),(6047,'',6026,695),(6048,'',6027,81),(6049,'',6028,75),(6050,'',6029,429),(6051,'',6030,284),(6052,'',6031,398),(6053,'',6032,528),(6054,'',6033,201),(6055,'',6034,497),(6056,'',6035,383),(6057,'',6036,711),(6058,'',6037,420),(6059,'',6038,300),(6060,'',6039,414),(6061,'',6040,606),(6062,'',6041,596),(6063,'',6042,96),(6064,'',6043,309),(6065,'',6044,299),(6066,'',6045,810),(6067,'',6046,819),(6068,'',6047,513),(6069,'',6048,482),(6070,'',6049,408),(6071,'',6050,726),(6072,'',6051,581),(6073,'',6052,612),(6074,'',6053,825),(6075,'',6054,794),(6076,'',6055,138),(6077,'',6056,680),(6078,'',6057,689),(6079,'',6058,903),(6080,'',6059,893),(6081,'',6060,237),(6082,'',6061,102),(6083,'',6062,788),(6084,'',6063,113),(6085,'',6064,693),(6086,'',6065,16),(6087,'',6066,425),(6088,'',6067,79),(6089,'',6068,79),(6090,'',6069,540),(6091,'',6070,527),(6092,'',6071,79),(6093,'',6072,16),(6094,'',6073,16),(6095,'',6074,540),(6096,'',6075,16),(6097,'',6076,16),(6098,'',6077,16),(6099,'',6078,16),(6100,'',6079,23),(6101,'',6080,16),(6102,'',6081,16),(6103,'',6082,16),(6104,'',6083,98),(6105,'',6084,319),(6106,'',6085,95),(6107,'',6086,284),(6108,'',6087,200),(6109,'',6088,98),(6110,'',6089,79),(6111,'',6090,319),(6112,'',6091,540),(6113,'',6092,89),(6114,'',6093,16),(6115,'',6094,200),(6116,'',6095,16),(6117,'',6096,16),(6118,'',6097,16),(6119,'',6098,98),(6120,'',6099,352),(6121,'',6100,601),(6122,'',6101,643),(6123,'',6102,16),(6124,'',6103,16),(6125,'',6104,527),(6126,'',6105,287),(6127,'',6106,16),(6128,'',6107,16),(6129,'',6108,540),(6130,'',6109,16),(6131,'',6110,16),(6132,'',6111,78),(6133,'',6112,16),(6134,'',6113,16),(6135,'',6114,540),(6136,'',6115,200),(6137,'',6116,90),(6138,'',6117,16),(6139,'',6118,120),(6140,'',6119,98),(6141,'',6120,540),(6142,'',6121,601),(6143,'',6122,16),(6144,'',6123,16),(6145,'',6124,527),(6146,'',6125,16),(6147,'',6126,16),(6148,'',6127,548),(6149,'',6128,134),(6150,'',6129,16),(6151,'',6130,16),(6152,'',6131,16),(6153,'',6132,16),(6154,'',6133,89),(6155,'',6134,16),(6156,'',6135,16),(6157,'',NULL,209),(6158,'',6137,16),(6159,'',6138,287),(6160,'',6139,284),(6161,'',6140,79),(6162,'',6141,200),(6163,'',6142,548),(6164,'',6143,200),(6165,'',6144,22),(6166,'',6145,200),(6167,'',6146,548),(6168,'',6147,22),(6169,'',6148,79),(6170,'',6149,434),(6171,'',6150,548),(6172,'',6151,98),(6173,'',6152,79),(6174,'',6153,89),(6175,'',6154,79),(6176,'',6155,79),(6177,'',6156,200),(6178,'',6157,89),(6179,'',6158,200),(6180,'',6159,78),(6181,'',6160,548),(6182,'',6161,200),(6183,'',6162,284),(6184,'',6163,200),(6185,'',6164,78),(6186,'',6165,79),(6187,'',6166,284),(6188,'',6167,79),(6189,'',6168,548),(6190,'',6169,548),(6191,'',6170,284),(6192,'',6171,200),(6193,'',6172,548),(6194,'',6173,200),(6195,'',6174,22),(6196,'',6175,79),(6197,'',6176,200),(6198,'',6177,200),(6199,'',6178,200),(6200,'',6179,200),(6201,'',6180,400),(6202,'',6181,548),(6203,'',6182,200),(6204,'',6183,78),(6205,'',6184,548),(6206,'',6185,548),(6207,'',6186,79),(6208,'',6187,200),(6209,'',6188,79),(6210,'',6189,200),(6211,'',6190,79),(6212,'',6191,22),(6213,'',6192,79),(6214,'',6193,200),(6215,'',6194,548),(6216,'',6195,643),(6217,'',6196,548),(6218,'',6197,548),(6219,'',6198,120),(6220,'',6199,89),(6221,'',6200,200),(6222,'',6201,548),(6223,'',6202,548),(6224,'',6203,497),(6225,'',6204,284),(6226,'',6205,548),(6227,'',6206,548),(6228,'',6207,79),(6229,'',6208,200),(6230,'',6209,200),(6231,'',6210,548),(6232,'',6211,548),(6233,'',6212,284),(6234,'',6213,548),(6235,'',6214,548),(6236,'',6215,200),(6237,'',6216,78),(6238,'',6217,287),(6239,'',6218,200),(6240,'',6219,22),(6241,'',6220,287),(6242,'',6221,200),(6243,'',6222,548),(6244,'',6223,548),(6245,'',6224,548),(6246,'',6225,284),(6247,'',6226,90),(6248,'',6227,78),(6249,'',6228,200),(6250,'',6229,548),(6251,'',6230,200),(6252,'',6231,200),(6253,'',6232,287),(6254,'',6233,425),(6255,'',6234,548),(6256,'',6235,200),(6257,'',6236,548),(6258,'',6237,548),(6259,'',6238,79),(6260,'',6239,200),(6261,'',6240,548),(6262,'',6241,441),(6263,'',6242,200),(6264,'',6243,548),(6265,'',6244,79),(6266,'',6245,79),(6267,'',6246,287),(6268,'',6247,200),(6269,'',6248,200),(6270,'',6249,200),(6271,'',6250,200),(6272,'',6251,200),(6273,'',6252,548),(6274,'',6253,200),(6275,'',6254,79),(6276,'',6255,22),(6277,'',6256,200),(6278,'',6257,200),(6279,'',6258,200),(6280,'',6259,79),(6281,'',6260,200),(6282,'',6261,89),(6283,'',6262,41),(6284,'',6263,200),(6285,'',6264,548),(6286,'',6265,120),(6287,'',6266,548),(6288,'',6267,548),(6289,'',6268,200),(6290,'',6269,200),(6291,'',6270,200),(6292,'',6271,89),(6293,'',6272,548),(6294,'',6273,400),(6295,'',6274,200),(6296,'',6275,200),(6297,'',6276,79),(6298,'',6277,78),(6299,'',6278,400),(6300,'',6279,548),(6301,'',6280,89),(6302,'',6281,78),(6303,'',6282,284),(6304,'',6283,79),(6305,'',6284,200),(6306,'',6285,284),(6307,'',6286,548),(6308,'',6287,22),(6309,'',6288,400),(6310,'',6289,200),(6311,'',6290,78),(6312,'',6291,200),(6313,'',6292,548),(6314,'',6293,79),(6315,'',6294,200),(6316,'',6295,548),(6317,'',6296,200),(6318,'',6297,120),(6319,'',6298,79),(6320,'',6299,79),(6321,'',6300,200),(6322,'',6301,78),(6323,'',6302,200),(6324,'',6303,284),(6325,'',6304,200),(6326,'',6305,400),(6327,'',6306,200),(6328,'',6307,79),(6329,'',6308,79),(6330,'',6309,200),(6331,'',6310,200),(6332,'',6311,79),(6333,'',6312,434),(6334,'',6313,548),(6335,'',6314,79),(6336,'',6315,548),(6337,'',6316,548),(6338,'',6317,200),(6339,'',6318,284),(6340,'',6319,200),(6341,'',6320,200),(6342,'',6321,548),(6343,'',6322,284),(6344,'',6323,548),(6345,'',6324,200),(6346,'',6325,200),(6347,'',6326,287),(6348,'',6327,120),(6349,'',6328,200),(6350,'',6329,200),(6351,'',6330,79),(6352,'',6331,200),(6353,'',6332,79),(6354,'',6333,200),(6355,'',6334,120),(6356,'',6335,200),(6357,'',6336,200),(6358,'',6337,284),(6359,'',6338,548),(6360,'',6339,120),(6361,'',6340,200),(6362,'',6341,78),(6363,'',6342,200),(6364,'',6343,200),(6365,'',6344,284),(6366,'',6345,200),(6367,'',6346,79),(6368,'',6347,548),(6369,'',6348,200),(6370,'',6349,284),(6371,'',6350,79),(6372,'',6351,200),(6373,'',6352,79),(6374,'',6353,548),(6375,'',6354,79),(6376,'',6355,548),(6377,'',6356,548),(6378,'',6357,79),(6379,'',6358,200),(6380,'',6359,78),(6381,'',6360,200),(6382,'',6361,284),(6383,'',6362,400),(6384,'',6363,78),(6385,'',6364,79),(6386,'',6365,548),(6387,'',6366,22),(6388,'',6367,22),(6389,'',6368,548),(6390,'',6369,79),(6391,'',6370,79),(6392,'',6371,200),(6393,'',6372,200),(6394,'',6373,22),(6395,'',6374,200),(6396,'',6375,284),(6397,'',6376,287),(6398,'',6377,79),(6399,'',6378,200),(6400,'',6379,200),(6401,'',6380,287),(6402,'',6381,548),(6403,'',6382,79),(6404,'',6383,200),(6405,'',6384,200),(6406,'',6385,548),(6407,'',6386,548),(6408,'',6387,79),(6409,'',6388,78),(6410,'',6389,98),(6411,'',6390,200),(6412,'',6391,200),(6413,'',6392,200),(6414,'',6393,200),(6415,'',6394,548),(6416,'',6395,78),(6417,'',6396,284),(6418,'',6397,284),(6419,'',6398,200),(6420,'',6399,200),(6421,'',6400,22),(6422,'',6401,200),(6423,'',6402,200),(6424,'',6403,79),(6425,'',6404,548),(6426,'',6405,548),(6427,'',6406,284),(6428,'',6407,78),(6429,'',6408,79),(6430,'',6409,22),(6431,'',6410,200),(6432,'',6411,548),(6433,'',6412,548),(6434,'',6413,89),(6435,'',6414,78),(6436,'',6415,79),(6437,'',6416,22),(6438,'',6417,287),(6439,'',6418,287),(6440,'',6419,78),(6441,'',6420,548),(6442,'',6421,200),(6443,'',6422,548),(6444,'',6423,200),(6445,'',6424,200),(6446,'',6425,200),(6447,'',6426,200),(6448,'',6427,200),(6449,'',6428,200),(6450,'',6429,78),(6451,'',6430,548),(6452,'',6431,79),(6453,'',6432,200),(6454,'',6433,287),(6455,'',6434,78),(6456,'',6435,22),(6457,'',6436,548),(6458,'',6437,284),(6459,'',6438,548),(6460,'',6439,79),(6461,'',6440,548),(6462,'',6441,79),(6463,'',6442,548),(6464,'',6443,200),(6465,'',6444,284),(6466,'',6445,548),(6467,'',6446,548),(6468,'',6447,89),(6469,'',6448,200),(6470,'',6449,548),(6471,'',6450,79),(6472,'',6451,548),(6473,'',6452,200),(6474,'',6453,548),(6475,'',6454,89),(6476,'',6455,200),(6477,'',6456,200),(6478,'',6457,200),(6479,'',6458,78),(6480,'',6459,284),(6481,'',6460,548),(6482,'',6461,548),(6483,'',6462,284),(6484,'',6463,548),(6485,'',6464,113),(6486,'',6465,548),(6487,'',6466,200),(6488,'',6467,284),(6489,'',6468,287),(6490,'',6469,200),(6491,'',6470,425),(6492,'',6471,89),(6493,'',6472,89),(6494,'',6473,200),(6495,'',6474,200),(6496,'',6475,79),(6497,'',6476,548),(6498,'',6477,548),(6499,'',6478,79),(6500,'',6479,434),(6501,'',6480,287),(6502,'',6481,200),(6503,'',6482,284),(6504,'',6483,200),(6505,'',6484,79),(6506,'',6485,548),(6507,'',6486,22),(6508,'',6487,548),(6509,'',6488,79),(6510,'',6489,89),(6511,'',6490,200),(6512,'',6491,200),(6513,'',6492,548),(6514,'',6493,200),(6515,'',6494,287),(6516,'',6495,120),(6517,'',6496,548),(6518,'',6497,79),(6519,'',6498,548),(6520,'',6499,79),(6521,'',6500,78),(6522,'',6501,200),(6523,'',6502,79),(6524,'',6503,89),(6525,'',6504,548),(6526,'',6505,79),(6527,'',6506,120),(6528,'',6507,78),(6529,'',6508,79),(6530,'',6509,79),(6531,'',6510,284),(6532,'',6511,79),(6533,'',6512,79),(6534,'',NULL,79),(6535,'',6514,200),(6536,'',6515,284),(6537,'',6516,200),(6538,'',6517,78),(6539,'',6518,200),(6540,'',6519,200),(6541,'',6520,287),(6542,'',6521,89),(6543,'',6522,200),(6544,'',6523,200),(6545,'',6524,113),(6546,'',6525,548),(6547,'',6526,200),(6548,'',6527,200),(6549,'',6528,200),(6550,'',6529,284),(6551,'',6530,22),(6552,'',6531,287),(6553,'',6532,287),(6554,'',6533,89),(6555,'',6534,284),(6556,'',6535,79),(6557,'',6536,548),(6558,'',6537,548),(6559,'',6538,200),(6560,'',6539,78),(6561,'',6540,200),(6562,'',6541,200),(6563,'',6542,200),(6564,'',6543,284),(6565,'',6544,79),(6566,'',6545,287),(6567,'',6546,78),(6568,'',6547,79),(6569,'',6548,79),(6570,'',6549,200),(6571,'',6550,79),(6572,'',6551,548),(6573,'',6552,200),(6574,'',6553,548),(6575,'',6554,200),(6576,'',6555,284),(6577,'',6556,284),(6578,'',6557,79),(6579,'',6558,548),(6580,'',6559,548),(6581,'',6560,548),(6582,'',6561,548),(6583,'',6562,79),(6584,'',6563,548),(6585,'',6564,200),(6586,'',6565,22),(6587,'',6566,200),(6588,'',6567,200),(6589,'',6568,200),(6590,'',6569,284),(6591,'',6570,120),(6592,'',6571,548),(6593,'',6572,200),(6594,'',6573,79),(6595,'',6574,200),(6596,'',6575,200),(6597,'',6576,284),(6598,'',6577,548),(6599,'',6578,79),(6600,'',6579,200),(6601,'',6580,79),(6602,'',6581,548),(6603,'',6582,548),(6604,'',6583,200),(6605,'',6584,78),(6606,'',6585,200),(6607,'',6586,79),(6608,'',6587,200),(6609,'',6588,89),(6610,'',6589,78),(6611,'',6590,400),(6612,'',6591,200),(6613,'',6592,548),(6614,'',6593,200),(6615,'',6594,200),(6616,'',6595,78),(6617,'',NULL,79),(6618,'',6597,548),(6619,'',6598,548),(6620,'',6599,200),(6621,'',6600,200),(6622,'',6601,548),(6623,'',6602,79),(6624,'',6603,79),(6625,'',6604,548),(6626,'',6605,548),(6627,'',6606,200),(6628,'',6607,200),(6629,'',6608,89),(6630,'',6609,548),(6631,'',6610,79),(6632,'',6611,78),(6633,'',6612,548),(6634,'',6613,200),(6635,'',6614,79),(6636,'',6615,548),(6637,'',6616,22),(6638,'',6617,79),(6639,'',6618,200),(6640,'',6619,287),(6641,'',6620,284),(6642,'',6621,200),(6643,'',6622,200),(6644,'',6623,284),(6645,'',6624,548),(6646,'',6625,200),(6647,'',6626,78),(6648,'',6627,79),(6649,'',6628,548),(6650,'',6629,89),(6651,'',6630,89),(6652,'',6631,548),(6653,'',6632,548),(6654,'',6633,200),(6655,'',6634,78),(6656,'',6635,200),(6657,'',6636,548),(6658,'',6637,16),(6659,'',6638,22),(6660,'',6639,79),(6661,'',6640,134),(6662,'',6641,120),(6663,'',6642,200),(6664,'',6643,200),(6665,'',6644,200),(6666,'',6645,284),(6667,'',6646,284),(6668,'',6647,548),(6669,'',6648,400),(6670,'',6649,200),(6671,'',6650,200),(6672,'',6651,284),(6673,'',6652,425),(6674,'',6653,548),(6675,'',6654,79),(6676,'',6655,548),(6677,'',6656,89),(6678,'',6657,548),(6679,'',6658,548),(6680,'',6659,284),(6681,'',6660,79),(6682,'',6661,284),(6683,'',6662,98),(6684,'',6663,400),(6685,'',6664,548),(6686,'',6665,548),(6687,'',6666,79),(6688,'',6667,79),(6689,'',6668,200),(6690,'',6669,89),(6691,'',6670,200),(6692,'',6671,89),(6693,'',6672,284),(6694,'',6673,284),(6695,'',6674,548),(6696,'',6675,548),(6697,'',6676,548),(6698,'',6677,548),(6699,'',6678,79),(6700,'',6679,79),(6701,'',6680,548),(6702,'',6681,22),(6703,'',6682,548),(6704,'',6683,548),(6705,'',6684,200),(6706,'',6685,200),(6707,'',6686,284),(6708,'',6687,200),(6709,'',6688,22),(6710,'',6689,200),(6711,'',6690,200),(6712,'',6691,78),(6713,'',6692,22),(6714,'',6693,548),(6715,'',6694,548),(6716,'',6695,284),(6717,'',6696,78),(6718,'',6697,200),(6719,'',6698,548),(6720,'',6699,548),(6721,'',6700,548),(6722,'',6701,548),(6723,'',6702,548),(6724,'',6703,548),(6725,'',6704,200),(6726,'',6705,284),(6727,'',6706,200),(6728,'',6707,200),(6729,'',6708,200),(6730,'',6709,200),(6731,'',6710,200),(6732,'',6711,548),(6733,'',6712,200),(6734,'',6713,548),(6735,'',6714,400),(6736,'',6715,200),(6737,'',6716,548),(6738,'',6717,79),(6739,'',6718,548),(6740,'',6719,78),(6741,'',6720,284),(6742,'',6721,548),(6743,'',6722,200),(6744,'',6723,79),(6745,'',6724,548),(6746,'',6725,548),(6747,'',6726,434),(6748,'',6727,548),(6749,'',6728,284),(6750,'',6729,548),(6751,'',6730,284),(6752,'',6731,400),(6753,'',6732,215),(6754,'',6733,548),(6755,'',6734,312),(6756,'',6735,548),(6757,'',6736,548),(6758,'',6737,200),(6759,'',6738,78),(6760,'',6739,22),(6761,'',6740,400),(6762,'',6741,79),(6763,'',6742,79),(6764,'',6743,200),(6765,'',6744,89),(6766,'',6745,200),(6767,'',6746,79),(6768,'',6747,200),(6769,'',6748,79),(6770,'',6749,200),(6771,'',6750,89),(6772,'',6751,548),(6773,'',6752,548),(6774,'',NULL,287),(6775,'',6754,287),(6776,'',6755,89),(6777,'',6756,200),(6778,'',6757,200),(6779,'',6758,78),(6780,'',6759,548),(6781,'',6760,287),(6782,'',6761,548),(6783,'',6762,200),(6784,'',6763,200),(6785,'',6764,287),(6786,'',6765,79),(6787,'',6766,89),(6788,'',6767,79),(6789,'',6768,548),(6790,'',6769,200),(6791,'',6770,472),(6792,'',6771,548),(6793,'',6772,200),(6794,'',6773,548),(6795,'',6774,284),(6796,'',6775,200),(6797,'',6776,284),(6798,'',6777,548),(6799,'',6778,200),(6800,'',6779,79),(6801,'',6780,548),(6802,'',6781,200),(6803,'',6782,200),(6804,'',6783,200),(6805,'',6784,78),(6806,'',6785,200),(6807,'',6786,79),(6808,'',6787,548),(6809,'',6788,548),(6810,'',6789,548),(6811,'',6790,548),(6812,'',6791,79),(6813,'',6792,90),(6814,'',6793,79),(6815,'',6794,548),(6816,'',6795,284),(6817,'',6796,200),(6818,'',6797,548),(6819,'',6798,284),(6820,'',6799,200),(6821,'',6800,79),(6822,'',6801,22),(6823,'',6802,89),(6824,'',6803,89),(6825,'',6804,284),(6826,'',6805,548),(6827,'',6806,200),(6828,'',6807,89),(6829,'',6808,79),(6830,'',6809,79),(6831,'',6810,284),(6832,'',6811,200),(6833,'',6812,200),(6834,'',6813,548),(6835,'',6814,548),(6836,'',6815,284),(6837,'',6816,548),(6838,'',6817,200),(6839,'',6818,200),(6840,'',6819,200),(6841,'',6820,79),(6842,'',6821,200),(6843,'',6822,89),(6844,'',6823,79),(6845,'',6824,79),(6846,'',6825,548),(6847,'',6826,200),(6848,'',6827,548),(6849,'',6828,284),(6850,'',6829,89),(6851,'',6830,200),(6852,'',6831,79),(6853,'',NULL,79),(6854,'',6833,548),(6855,'',6834,287),(6856,'',6835,548),(6857,'',6836,200),(6858,'',6837,287),(6859,'',6838,284),(6860,'',6839,120),(6861,'',6840,548),(6862,'',6841,78),(6863,'',6842,200),(6864,'',6843,521),(6865,'',6844,400),(6866,'',6845,200),(6867,'',6846,78),(6868,'',6847,200),(6869,'',6848,200),(6870,'',6849,79),(6871,'',6850,79),(6872,'',6851,22),(6873,'',6852,200),(6874,'',6853,200),(6875,'',6854,522),(6876,'',6855,79),(6877,'',6856,200),(6878,'',6857,200),(6879,'',6858,98),(6880,'',6859,79),(6881,'',6860,79),(6882,'',6861,548),(6883,'',6862,548),(6884,'',6863,287),(6885,'',6864,79),(6886,'',6865,79),(6887,'',6866,548),(6888,'',6867,548),(6889,'',6868,548),(6890,'',6869,200),(6891,'',6870,200),(6892,'',6871,200),(6893,'',6872,200),(6894,'',6873,548),(6895,'',6874,425),(6896,'',6875,548),(6897,'',6876,284),(6898,'',6877,200),(6899,'',6878,548),(6900,'',6879,89),(6901,'',6880,89),(6902,'',6881,78),(6903,'',6882,548),(6904,'',6883,548),(6905,'',6884,548),(6906,'',6885,548),(6907,'',6886,200),(6908,'',6887,89),(6909,'',6888,200),(6910,'',6889,22),(6911,'',6890,548),(6912,'',6891,548),(6913,'',6892,548),(6914,'',6893,200),(6915,'',6894,284),(6916,'',6895,200),(6917,'',6896,548),(6918,'',6897,287),(6919,'',6898,79),(6920,'',6899,200),(6921,'',6900,200),(6922,'',6901,434),(6923,'',6902,425),(6924,'',6903,548),(6925,'',6904,548),(6926,'',6905,200),(6927,'',6906,200),(6928,'',6907,548),(6929,'',6908,200),(6930,'',6909,79),(6931,'',6910,200),(6932,'',6911,548),(6933,'',6912,79),(6934,'',6913,200),(6935,'',6914,22),(6936,'',6915,521),(6937,'',6916,200),(6938,'',6917,79),(6939,'',6918,89),(6940,'',6919,16),(6941,'',6920,425),(6942,'',6921,200),(6943,'',6922,78),(6944,'',6923,78),(6945,'',6924,200),(6946,'',6925,200),(6947,'',6926,548),(6948,'',6927,79),(6949,'',6928,22),(6950,'',6929,548),(6951,'',6930,548),(6952,'',6931,400),(6953,'',6932,548),(6954,'',6933,79),(6955,'',6934,79),(6956,'',6935,548),(6957,'',6936,548),(6958,'',6937,548),(6959,'',6938,548),(6960,'',6939,425),(6961,'',6940,200),(6962,'',6941,200),(6963,'',6942,200),(6964,'',6943,284),(6965,'',6944,200),(6966,'',6945,548),(6967,'',NULL,79),(6968,'',6947,548),(6969,'',6948,548),(6970,'',6949,22),(6971,'',6950,200),(6972,'',6951,200),(6973,'',6952,78),(6974,'',6953,16),(6975,'',6954,548),(6976,'',6955,79),(6977,'',6956,200),(6978,'',6957,79),(6979,'',6958,200),(6980,'',6959,22),(6981,'',6960,200),(6982,'',NULL,79),(6983,'',6962,22),(6984,'',6963,548),(6985,'',6964,548),(6986,'',6965,548),(6987,'',6966,79),(6988,'',6967,200),(6989,'',6968,200),(6990,'',6969,89),(6991,'',6970,78),(6992,'',6971,200),(6993,'',6972,79),(6994,'',6973,548),(6995,'',6974,287),(6996,'',6975,22),(6997,'',6976,200),(6998,'',6977,200),(6999,'',6978,200),(7000,'',6979,200),(7001,'',6980,79),(7002,'',6981,79),(7003,'',6982,200),(7004,'',6983,200),(7005,'',6984,548),(7006,'',6985,284),(7007,'',6986,284),(7008,'',6987,548),(7009,'',6988,89),(7010,'',6989,548),(7011,'',6990,548),(7012,'',6991,200),(7013,'',6992,200),(7014,'',6993,548),(7015,'',6994,200),(7016,'',6995,89),(7017,'',6996,548),(7018,'',6997,548),(7019,'',6998,200),(7020,'',6999,200),(7021,'',7000,200),(7022,'',7001,200),(7023,'',7002,78),(7024,'',7003,548),(7025,'',7004,548),(7026,'',7005,284),(7027,'',NULL,79),(7028,'',7007,200),(7029,'',7008,400),(7030,'',7009,200),(7031,'',7010,548),(7032,'',7011,284),(7033,'',7012,200),(7034,'',7013,548),(7035,'',7014,548),(7036,'',7015,89),(7037,'',7016,284),(7038,'',7017,284),(7039,'',7018,548),(7040,'',7019,548),(7041,'',7020,200),(7042,'',7021,284),(7043,'',7022,79),(7044,'',7023,548),(7045,'',7024,79),(7046,'',7025,89),(7047,'',7026,548),(7048,'',7027,79),(7049,'',7028,200),(7050,'',7029,548),(7051,'',7030,200),(7052,'',7031,78),(7053,'',7032,79),(7054,'',7033,78),(7055,'',7034,16),(7056,'',7035,284),(7057,'',7036,79),(7058,'',7037,284),(7059,'',7038,548),(7060,'',7039,200),(7061,'',7040,548),(7062,'',7041,120),(7063,'',7042,200),(7064,'',7043,200),(7065,'',7044,284),(7066,'',7045,22),(7067,'',7046,548),(7068,'',7047,79),(7069,'',7048,79),(7070,'',7049,200),(7071,'',7050,89),(7072,'',7051,287),(7073,'',7052,200),(7074,'',7053,22),(7075,'',7054,79),(7076,'',7055,89),(7077,'',7056,200),(7078,'',7057,79),(7079,'',7058,548),(7080,'',7059,200),(7081,'',7060,89),(7082,'',7061,548),(7083,'',7062,79),(7084,'',7063,22),(7085,'',7064,200),(7086,'',7065,79),(7087,'',7066,78),(7088,'',7067,287),(7089,'',7068,200),(7090,'',7069,22),(7091,'',7070,200),(7092,'',7071,548),(7093,'',7072,425),(7094,'',7073,548),(7095,'',7074,548),(7096,'',7075,284),(7097,'',7076,548),(7098,'',7077,548),(7099,'',7078,548),(7100,'',7079,548),(7101,'',7080,79),(7102,'',7081,200),(7103,'',7082,200),(7104,'',7083,78),(7105,'',7084,400),(7106,'',7085,284),(7107,'',7086,548),(7108,'',7087,200),(7109,'',7088,79),(7110,'',7089,200),(7111,'',7090,200),(7112,'',7091,89),(7113,'',7092,284),(7114,'',7093,200),(7115,'',7094,548),(7116,'',7095,79),(7117,'',7096,548),(7118,'',7097,200),(7119,'',7098,200),(7120,'',7099,548),(7121,'',7100,200),(7122,'',7101,150),(7123,'',7102,548),(7124,'',7103,548),(7125,'',7104,79),(7126,'',7105,548),(7127,'',7106,79),(7128,'',7107,22),(7129,'',7108,548),(7130,'',7109,284),(7131,'',7110,79),(7132,'',7111,548),(7133,'',7112,200),(7134,'',7113,284),(7135,'',7114,22),(7136,'',7115,548),(7137,'',7116,548),(7138,'',7117,200),(7139,'',7118,284),(7140,'',7119,89),(7141,'',7120,200),(7142,'',7121,548),(7143,'',7122,548),(7144,'',7123,284),(7145,'',7124,287),(7146,'',7125,120),(7147,'',7126,284),(7148,'',7127,79),(7149,'',7128,200),(7150,'',7129,284),(7151,'',7130,284),(7152,'',7131,22),(7153,'',7132,78),(7154,'',7133,200),(7155,'',NULL,79),(7156,'',7135,200),(7157,'',NULL,79),(7158,'',7137,200),(7159,'',7138,200),(7160,'',7139,200),(7161,'',NULL,79),(7162,'',7141,548),(7163,'',7142,548),(7164,'',7143,80),(7165,'',7144,200),(7166,'',7145,548),(7167,'',7146,79),(7168,'',7147,120),(7169,'',7148,78),(7170,'',7149,200),(7171,'',7150,79),(7172,'',7151,78),(7173,'',7152,200),(7174,'',7153,200),(7175,'',7154,200),(7176,'',NULL,200),(7177,'',7156,548),(7178,'',7157,200),(7179,'',7158,548),(7180,'',7159,200),(7181,'',7160,284),(7182,'',7161,548),(7183,'',7162,548),(7184,'',7163,287),(7185,'',7164,200),(7186,'',7165,548),(7187,'',7166,200),(7188,'',7167,548),(7189,'',7168,521),(7190,'',7169,89),(7191,'',7170,200),(7192,'',7171,79),(7193,'',7172,200),(7194,'',7173,89),(7195,'',7174,548),(7196,'',7175,89),(7197,'',7176,200),(7198,'',7177,284),(7199,'',7178,284),(7200,'',7179,89),(7201,'',7180,284),(7202,'',7181,89),(7203,'',7182,200),(7204,'',7183,200),(7205,'',7184,79),(7206,'',7185,287),(7207,'',7186,200),(7208,'',7187,78),(7209,'',7188,497),(7210,'',7189,79),(7211,'',7190,548),(7212,'',7191,284),(7213,'',7192,78),(7214,'',7193,200),(7215,'',7194,548),(7216,'',7195,200),(7217,'',7196,548),(7218,'',7197,548),(7219,'',7198,200),(7220,'',7199,425),(7221,'',7200,548),(7222,'',7201,548),(7223,'',7202,200),(7224,'',7203,215),(7225,'',7204,284),(7226,'',7205,78),(7227,'',7206,287),(7228,'',7207,79),(7229,'',7208,79),(7230,'',7209,548),(7231,'',7210,284),(7232,'',7211,200),(7233,'',7212,200),(7234,'',7213,284),(7235,'',7214,200),(7236,'',7215,548),(7237,'',7216,200),(7238,'',7217,548),(7239,'',7218,89),(7240,'',7219,79),(7241,'',7220,200),(7242,'',7221,200),(7243,'',7222,548),(7244,'',7223,548),(7245,'',7224,548),(7246,'',7225,284),(7247,'',7226,548),(7248,'',7227,548),(7249,'',7228,16),(7250,'',7229,548),(7251,'',7230,548),(7252,'',7231,548),(7253,'',7232,284),(7254,'',7233,79),(7255,'',7234,548),(7256,'',7235,78),(7257,'',7236,548),(7258,'',7237,78),(7259,'',7238,284),(7260,'',7239,200),(7261,'',7240,287),(7262,'',7241,548),(7263,'',7242,200),(7264,'',7243,548),(7265,'',7244,200),(7266,'',7245,284),(7267,'',7246,548),(7268,'',7247,79),(7269,'',7248,200),(7270,'',7249,287),(7271,'',7250,548),(7272,'',7251,287),(7273,'',7252,200),(7274,'',7253,548),(7275,'',7254,548),(7276,'',7255,548),(7277,'',7256,200),(7278,'',7257,78),(7279,'',7258,284),(7280,'',7259,284),(7281,'',7260,79),(7282,'',7261,78),(7283,'',7262,98),(7284,'',7263,79),(7285,'',7264,120),(7286,'',7265,200),(7287,'',7266,548),(7288,'',7267,200),(7289,'',7268,78),(7290,'',7269,78),(7291,'',7270,284),(7292,'',7271,548),(7293,'',7272,79),(7294,'',7273,548),(7295,'',7274,548),(7296,'',7275,548),(7297,'',7276,78),(7298,'',7277,200),(7299,'',7278,200),(7300,'',7279,79),(7301,'',7280,200),(7302,'',7281,79),(7303,'',7282,79),(7304,'',7283,89),(7305,'',7284,200),(7306,'',7285,548),(7307,'',7286,548),(7308,'',7287,200),(7309,'',7288,200),(7310,'',7289,79),(7311,'',7290,548),(7312,'',7291,200),(7313,'',7292,79),(7314,'',7293,79),(7315,'',7294,200),(7316,'',7295,548),(7317,'',7296,548),(7318,'',7297,79),(7319,'',7298,200),(7320,'',7299,200),(7321,'',7300,548),(7322,'',7301,200),(7323,'',7302,200),(7324,'',7303,200),(7325,'',7304,79),(7326,'',7305,79),(7327,'',7306,548),(7328,'',7307,400),(7329,'',7308,548),(7330,'',7309,287),(7331,'',7310,200),(7332,'',7311,548),(7333,'',7312,284),(7334,'',7313,200),(7335,'',7314,284),(7336,'',7315,548),(7337,'',7316,79),(7338,'',7317,89),(7339,'',7318,548),(7340,'',7319,548),(7341,'',7320,78),(7342,'',7321,548),(7343,'',7322,89),(7344,'',7323,200),(7345,'',7324,284),(7346,'',7325,200),(7347,'',7326,200),(7348,'',7327,78),(7349,'',7328,200),(7350,'',7329,548),(7351,'',7330,200),(7352,'',7331,284),(7353,'',7332,287),(7354,'',7333,548),(7355,'',7334,89),(7356,'',7335,548),(7357,'',7336,284),(7358,'',7337,200),(7359,'',7338,200),(7360,'',7339,400),(7361,'',7340,79),(7362,'',NULL,200),(7363,'',7342,200),(7364,'',7343,22),(7365,'',7344,287),(7366,'',7345,200),(7367,'',7346,79),(7368,'',7347,79),(7369,'',7348,79),(7370,'',7349,200),(7371,'',7350,548),(7372,'',7351,548),(7373,'',7352,200),(7374,'',7353,22),(7375,'',7354,548),(7376,'',7355,78),(7377,'',7356,79),(7378,'',7357,200),(7379,'',7358,548),(7380,'',7359,548),(7381,'',7360,98),(7382,'',7361,548),(7383,'',7362,548),(7384,'',7363,89),(7385,'',7364,22),(7386,'',7365,200),(7387,'',7366,78),(7388,'',7367,200),(7389,'',7368,78),(7390,'',7369,200),(7391,'',7370,16),(7392,'',7371,200),(7393,'',7372,89),(7394,'',7373,548),(7395,'',7374,548),(7396,'',7375,200),(7397,'',7376,548),(7398,'',7377,548),(7399,'',7378,89),(7400,'',7379,284),(7401,'',7380,548),(7402,'',7381,284),(7403,'',7382,79),(7404,'',7383,548),(7405,'',7384,200),(7406,'',7385,548),(7407,'',7386,200),(7408,'',7387,79),(7409,'',7388,200),(7410,'',7389,22),(7411,'',7390,120),(7412,'',7391,200),(7413,'',7392,548),(7414,'',7393,22),(7415,'',7394,200),(7416,'',7395,200),(7417,'',7396,134),(7418,'',7397,548),(7419,'',7398,200),(7420,'',7399,200),(7421,'',7400,200),(7422,'',7401,200),(7423,'',7402,548),(7424,'',7403,89),(7425,'',7404,200),(7426,'',7405,200),(7427,'',7406,200),(7428,'',7407,200),(7429,'',7408,548),(7430,'',7409,200),(7431,'',7410,287),(7432,'',7411,200),(7433,'',7412,79),(7434,'',7413,200),(7435,'',7414,548),(7436,'',7415,79),(7437,'',7416,200),(7438,'',7417,200),(7439,'',7418,548),(7440,'',7419,548),(7441,'',7420,200),(7442,'',7421,89),(7443,'',7422,284),(7444,'',7423,548),(7445,'',7424,22),(7446,'',7425,548),(7447,'',7426,548),(7448,'',7427,200),(7449,'',7428,79),(7450,'',7429,22),(7451,'',7430,200),(7452,'',7431,284),(7453,'',7432,78),(7454,'',7433,79),(7455,'',7434,548),(7456,'',7435,200),(7457,'',7436,425),(7458,'',7437,79),(7459,'',7438,200),(7460,'',7439,79),(7461,'',7440,79),(7462,'',7441,548),(7463,'',7442,548),(7464,'',7443,200),(7465,'',7444,78),(7466,'',7445,548),(7467,'',7446,79),(7468,'',7447,200),(7469,'',7448,200),(7470,'',7449,284),(7471,'',7450,200),(7472,'',7451,89),(7473,'',7452,16),(7474,'',7453,287),(7475,'',7454,22),(7476,'',7455,548),(7477,'',7456,22),(7478,'',7457,200),(7479,'',7458,548),(7480,'',7459,79),(7481,'',7460,548),(7482,'',7461,200),(7483,'',7462,78),(7484,'',7463,548),(7485,'',7464,548),(7486,'',7465,548),(7487,'',7466,79),(7488,'',7467,548),(7489,'',7468,200),(7490,'',7469,79),(7491,'',7470,548),(7492,'',7471,22),(7493,'',7472,548),(7494,'',7473,548),(7495,'',7474,200),(7496,'',7475,548),(7497,'',7476,497),(7498,'',7477,79),(7499,'',7478,548),(7500,'',7479,200),(7501,'',7480,548),(7502,'',7481,78),(7503,'',7482,287),(7504,'',7483,548),(7505,'',7484,287),(7506,'',7485,78),(7507,'',7486,16),(7508,'',7487,78),(7509,'',7488,548),(7510,'',7489,548),(7511,'',7490,548),(7512,'',7491,425),(7513,'',7492,548),(7514,'',7493,200),(7515,'',7494,548),(7516,'',7495,78),(7517,'',7496,79),(7518,'',7497,200),(7519,'',7498,79),(7520,'',7499,548),(7521,'',7500,548),(7522,'',7501,78),(7523,'',7502,548),(7524,'',7503,98),(7525,'',7504,548),(7526,'',7505,548),(7527,'',7506,79),(7528,'',7507,79),(7529,'',7508,284),(7530,'',7509,284),(7531,'',7510,548),(7532,'',7511,22),(7533,'',7512,200),(7534,'',NULL,79),(7535,'',7514,79),(7536,'',7515,200),(7537,'',7516,78),(7538,'',7517,284),(7539,'',7518,388),(7540,'',7519,89),(7541,'',7520,78),(7542,'',7521,200),(7543,'',7522,22),(7544,'',7523,79),(7545,'',7524,425),(7546,'',7525,79),(7547,'',7526,548),(7548,'',7527,89),(7549,'',7528,200),(7550,'',7529,548),(7551,'',7530,200),(7552,'',7531,200),(7553,'',7532,78),(7554,'',7533,98),(7555,'',7534,548),(7556,'',7535,89),(7557,'',7536,79),(7558,'',7537,548),(7559,'',7538,200),(7560,'',7539,200),(7561,'',7540,16),(7562,'',7541,79),(7563,'',7542,200),(7564,'',7543,548),(7565,'',7544,548),(7566,'',7545,200),(7567,'',7546,284),(7568,'',7547,548),(7569,'',7548,200),(7570,'',7549,284),(7571,'',7550,22),(7572,'',7551,548),(7573,'',7552,79),(7574,'',7553,284),(7575,'',7554,79),(7576,'',7555,79),(7577,'',7556,434),(7578,'',7557,284),(7579,'',7558,548),(7580,'',7559,548),(7581,'',7560,284),(7582,'',7561,434),(7583,'',7562,200),(7584,'',7563,548),(7585,'',7564,548),(7586,'',7565,200),(7587,'',7566,120),(7588,'',7567,200),(7589,'',7568,78),(7590,'',7569,521),(7591,'',7570,287),(7592,'',7571,79),(7593,'',7572,200),(7594,'',7573,548),(7595,'',7574,200),(7596,'',7575,79),(7597,'',7576,287),(7598,'',7577,79),(7599,'',7578,200),(7600,'',7579,287),(7601,'',7580,548),(7602,'',7581,200),(7603,'',7582,79),(7604,'',7583,548),(7605,'',7584,548),(7606,'',7585,200),(7607,'',7586,200),(7608,'',7587,200),(7609,'',7588,79),(7610,'',7589,79),(7611,'',7590,284),(7612,'',7591,548),(7613,'',7592,548),(7614,'',7593,548),(7615,'',7594,89),(7616,'',7595,200),(7617,'',7596,79),(7618,'',7597,200),(7619,'',7598,284),(7620,'',7599,284),(7621,'',7600,400),(7622,'',7601,548),(7623,'',7602,78),(7624,'',7603,548),(7625,'',7604,200),(7626,'',7605,22),(7627,'',7606,200),(7628,'',7607,548),(7629,'',7608,200),(7630,'',7609,548),(7631,'',7610,548),(7632,'',7611,521),(7633,'',7612,200),(7634,'',7613,287),(7635,'',7614,79),(7636,'',7615,22),(7637,'',7616,200),(7638,'',7617,200),(7639,'',7618,284),(7640,'',NULL,79),(7641,'',7620,78),(7642,'',7621,284),(7643,'',7622,200),(7644,'',7623,489),(7645,'',7624,548),(7646,'',7625,22),(7647,'',7626,200),(7648,'',7627,22),(7649,'',7628,200),(7650,'',7629,548),(7651,'',7630,200),(7652,'',7631,200),(7653,'',7632,284),(7654,'',7633,22),(7655,'',7634,22),(7656,'',7635,79),(7657,'',7636,548),(7658,'',7637,284),(7659,'',7638,22),(7660,'',7639,548),(7661,'',7640,548),(7662,'',7641,79),(7663,'',7642,200),(7664,'',7643,548),(7665,'',7644,548),(7666,'',7645,548),(7667,'',7646,548),(7668,'',7647,200),(7669,'',7648,89),(7670,'',7649,78),(7671,'',7650,79),(7672,'',7651,548),(7673,'',7652,548),(7674,'',7653,200),(7675,'',7654,200),(7676,'',7655,78),(7677,'',7656,548),(7678,'',7657,284),(7679,'',7658,200),(7680,'',7659,548),(7681,'',7660,200),(7682,'',7661,287),(7683,'',7662,548),(7684,'',7663,200),(7685,'',7664,200),(7686,'',7665,78),(7687,'',7666,200),(7688,'',7667,284),(7689,'',7668,200),(7690,'',7669,200),(7691,'',7670,89),(7692,'',7671,425),(7693,'',7672,200),(7694,'',7673,22),(7695,'',7674,200),(7696,'',7675,548),(7697,'',7676,78),(7698,'',7677,200),(7699,'',7678,548),(7700,'',7679,287),(7701,'',7680,200),(7702,'',7681,548),(7703,'',7682,78),(7704,'',7683,284),(7705,'',7684,287),(7706,'',7685,200),(7707,'',7686,284),(7708,'',7687,79),(7709,'',7688,200),(7710,'',7689,200),(7711,'',7690,200),(7712,'',7691,200),(7713,'',7692,200),(7714,'',7693,200),(7715,'',7694,548),(7716,'',7695,200),(7717,'',7696,548),(7718,'',7697,548),(7719,'',7698,548),(7720,'',7699,79),(7721,'',7700,548),(7722,'',7701,548),(7723,'',7702,78),(7724,'',7703,200),(7725,'',7704,78),(7726,'',7705,548),(7727,'',7706,200),(7728,'',7707,200),(7729,'',7708,200),(7730,'',7709,89),(7731,'',7710,79),(7732,'',7711,79),(7733,'',7712,548),(7734,'',7713,200),(7735,'',7714,79),(7736,'',7715,78),(7737,'',7716,548),(7738,'',7717,89),(7739,'',7718,78),(7740,'',7719,200),(7741,'',7720,200),(7742,'',7721,548),(7743,'',7722,200),(7744,'',7723,200),(7745,'',7724,548),(7746,'',7725,200),(7747,'',7726,200),(7748,'',7727,79),(7749,'',7728,200),(7750,'',7729,200),(7751,'',7730,548),(7752,'',7731,200),(7753,'',7732,200),(7754,'',7733,548),(7755,'',7734,200),(7756,'',7735,548),(7757,'',7736,548),(7758,'',7737,200),(7759,'',7738,200),(7760,'',7739,78),(7761,'',7740,284),(7762,'',7741,78),(7763,'',7742,284),(7764,'',7743,89),(7765,'',7744,200),(7766,'',7745,284),(7767,'',7746,200),(7768,'',7747,78),(7769,'',7748,548),(7770,'',7749,200),(7771,'',7750,22),(7772,'',7751,548),(7773,'',7752,425),(7774,'',7753,284),(7775,'',7754,79),(7776,'',7755,200),(7777,'',7756,79),(7778,'',7757,200),(7779,'',7758,548),(7780,'',7759,200),(7781,'',7760,79),(7782,'',7761,79),(7783,'',7762,200),(7784,'',7763,548),(7785,'',7764,200),(7786,'',7765,89),(7787,'',7766,287),(7788,'',7767,434),(7789,'',7768,200),(7790,'',7769,79),(7791,'',7770,200),(7792,'',7771,200),(7793,'',7772,200),(7794,'',7773,200),(7795,'',7774,79),(7796,'',7775,200),(7797,'',7776,548),(7798,'',7777,548),(7799,'',7778,89),(7800,'',7779,548),(7801,'',7780,200),(7802,'',7781,284),(7803,'',7782,200),(7804,'',7783,79),(7805,'',7784,79),(7806,'',7785,284),(7807,'',7786,548),(7808,'',7787,284),(7809,'',7788,548),(7810,'',7789,89),(7811,'',7790,284),(7812,'',7791,120),(7813,'',7792,284),(7814,'',7793,284),(7815,'',7794,200),(7816,'',7795,548),(7817,'',7796,79),(7818,'',7797,287),(7819,'',7798,79),(7820,'',7799,22),(7821,'',7800,200),(7822,'',7801,200),(7823,'',7802,548),(7824,'',7803,200),(7825,'',7804,548),(7826,'',7805,22),(7827,'',7806,548),(7828,'',7807,287),(7829,'',7808,200),(7830,'',7809,287),(7831,'',7810,120),(7832,'',7811,78),(7833,'',7812,200),(7834,'',7813,200),(7835,'',7814,79),(7836,'',7815,548),(7837,'',7816,200),(7838,'',7817,548),(7839,'',7818,78),(7840,'',7819,200),(7841,'',7820,200),(7842,'',7821,548),(7843,'',7822,79),(7844,'',7823,79),(7845,'',7824,284),(7846,'',7825,79),(7847,'',7826,200),(7848,'',7827,548),(7849,'',7828,284),(7850,'',7829,200),(7851,'',7830,548),(7852,'',7831,78),(7853,'',7832,200),(7854,'',7833,287),(7855,'',7834,200),(7856,'',7835,548),(7857,'',7836,287),(7858,'',7837,548),(7859,'',7838,89),(7860,'',7839,98),(7861,'',7840,548),(7862,'',7841,89),(7863,'',7842,400),(7864,'',7843,79),(7865,'',7844,79),(7866,'',7845,200),(7867,'',7846,548),(7868,'',7847,79),(7869,'',7848,79),(7870,'',7849,89),(7871,'',7850,548),(7872,'',7851,79),(7873,'',7852,22),(7874,'',7853,434),(7875,'',7854,79),(7876,'',7855,548),(7877,'',7856,200),(7878,'',7857,400),(7879,'',7858,548),(7880,'',7859,548),(7881,'',7860,548),(7882,'',7861,200),(7883,'',7862,425),(7884,'',7863,548),(7885,'',7864,89),(7886,'',7865,388),(7887,'',7866,287),(7888,'',7867,548),(7889,'',7868,548),(7890,'',7869,79),(7891,'',7870,200),(7892,'',7871,287),(7893,'',7872,78),(7894,'',7873,120),(7895,'',7874,79),(7896,'',7875,200),(7897,'',7876,284),(7898,'',7877,548),(7899,'',7878,548),(7900,'',7879,79),(7901,'',7880,78),(7902,'',7881,548),(7903,'',7882,79),(7904,'',7883,200),(7905,'',7884,548),(7906,'',7885,200),(7907,'',7886,425),(7908,'',7887,22),(7909,'',7888,548),(7910,'',7889,200),(7911,'',7890,79),(7912,'',7891,79),(7913,'',7892,441),(7914,'',7893,78),(7915,'',7894,548),(7916,'',7895,434),(7917,'',7896,548),(7918,'',7897,79),(7919,'',7898,200),(7920,'',7899,79),(7921,'',7900,78),(7922,'',7901,79),(7923,'',7902,548),(7924,'',7903,78),(7925,'',7904,548),(7926,'',7905,79),(7927,'',7906,200),(7928,'',7907,79),(7929,'',7908,284),(7930,'',7909,548),(7931,'',7910,548),(7932,'',7911,548),(7933,'',7912,548),(7934,'',7913,89),(7935,'',7914,78),(7936,'',7915,79),(7937,'',7916,200),(7938,'',7917,200),(7939,'',7918,548),(7940,'',7919,548),(7941,'',7920,400),(7942,'',7921,79),(7943,'',7922,200),(7944,'',7923,200),(7945,'',7924,548),(7946,'',7925,89),(7947,'',7926,548),(7948,'',7927,548),(7949,'',7928,78),(7950,'',7929,22),(7951,'',7930,200),(7952,'',7931,120),(7953,'',7932,548),(7954,'',7933,284),(7955,'',7934,200),(7956,'',7935,284),(7957,'',7936,200),(7958,'',7937,79),(7959,'',7938,548),(7960,'',7939,200),(7961,'',7940,284),(7962,'',7941,548),(7963,'',7942,548),(7964,'',7943,89),(7965,'',7944,200),(7966,'',7945,200),(7967,'',7946,22),(7968,'',7947,548),(7969,'',7948,548),(7970,'',7949,548),(7971,'',7950,548),(7972,'',7951,200),(7973,'',7952,284),(7974,'',7953,200),(7975,'',7954,200),(7976,'',7955,548),(7977,'',7956,200),(7978,'',7957,120),(7979,'',7958,79),(7980,'',7959,287),(7981,'',7960,548),(7982,'',7961,284),(7983,'',7962,200),(7984,'',7963,200),(7985,'',7964,79),(7986,'',7965,89),(7987,'',7966,548),(7988,'',7967,548),(7989,'',7968,22),(7990,'',7969,400),(7991,'',7970,200),(7992,'',7971,79),(7993,'',7972,548),(7994,'',7973,548),(7995,'',7974,200),(7996,'',7975,79),(7997,'',7976,548),(7998,'',7977,548),(7999,'',7978,284),(8000,'',7979,200),(8001,'',7980,548),(8002,'',7981,89),(8003,'',7982,78),(8004,'',7983,78),(8005,'',7984,89),(8006,'',7985,200),(8007,'',7986,79),(8008,'',7987,548),(8009,'',7988,79),(8010,'',7989,284),(8011,'',7990,200),(8012,'',7991,548),(8013,'',7992,22),(8014,'',7993,22),(8015,'',7994,425),(8016,'',7995,200),(8017,'',7996,284),(8018,'',7997,548),(8019,'',7998,78),(8020,'',7999,548),(8021,'',8000,89),(8022,'',8001,548),(8023,'',8002,200),(8024,'',8003,400),(8025,'',8004,284),(8026,'',8005,548),(8027,'',8006,78),(8028,'',8007,200),(8029,'',8008,200),(8030,'',8009,79),(8031,'',8010,548),(8032,'',8011,79),(8033,'',8012,200),(8034,'',8013,78),(8035,'',8014,79),(8036,'',8015,548),(8037,'',8016,434),(8038,'',8017,200),(8039,'',8018,200),(8040,'',8019,548),(8041,'',8020,200),(8042,'',8021,548),(8043,'',8022,200),(8044,'',8023,200),(8045,'',8024,548),(8046,'',8025,284),(8047,'',8026,79),(8048,'',8027,388),(8049,'',8028,548),(8050,'',8029,200),(8051,'',8030,79),(8052,'',8031,548),(8053,'',8032,200),(8054,'',8033,284),(8055,'',8034,200),(8056,'',8035,89),(8057,'',8036,548),(8058,'',8037,548),(8059,'',8038,548),(8060,'',8039,79),(8061,'',8040,200),(8062,'',8041,78),(8063,'',8042,400),(8064,'',8043,200),(8065,'',8044,548),(8066,'',8045,200),(8067,'',8046,284),(8068,'',8047,200),(8069,'',NULL,200),(8070,'',8049,200),(8071,'',8050,200),(8072,'',8051,89),(8073,'',8052,78),(8074,'',8053,548),(8075,'',8054,79),(8076,'',8055,400),(8077,'',8056,548),(8078,'',8057,200),(8079,'',8058,200),(8080,'',8059,79),(8081,'',8060,200),(8082,'',8061,79),(8083,'',8062,79),(8084,'',8063,79),(8085,'',8064,200),(8086,'',8065,79),(8087,'',8066,548),(8088,'',8067,548),(8089,'',8068,548),(8090,'',8069,98),(8091,'',8070,200),(8092,'',8071,79),(8093,'',8072,200),(8094,'',8073,284),(8095,'',8074,89),(8096,'',8075,284),(8097,'',8076,98),(8098,'',8077,200),(8099,'',8078,79),(8100,'',8079,200),(8101,'',8080,200),(8102,'',8081,120),(8103,'',8082,200),(8104,'',8083,78),(8105,'',8084,548),(8106,'',8085,79),(8107,'',8086,548),(8108,'',8087,287),(8109,'',8088,548),(8110,'',8089,548),(8111,'',8090,78),(8112,'',8091,78),(8113,'',8092,89),(8114,'',8093,200),(8115,'',8094,79),(8116,'',8095,548),(8117,'',8096,548),(8118,'',8097,200),(8119,'',8098,548),(8120,'',8099,78),(8121,'',8100,284),(8122,'',8101,200),(8123,'',8102,388),(8124,'',8103,79),(8125,'',8104,548),(8126,'',8105,200),(8127,'',8106,89),(8128,'',8107,120),(8129,'',8108,287),(8130,'',8109,200),(8131,'',8110,79),(8132,'',8111,89),(8133,'',8112,548),(8134,'',8113,200),(8135,'',8114,89),(8136,'',8115,548),(8137,'',8116,284),(8138,'',8117,548),(8139,'',8118,79),(8140,'',8119,200),(8141,'',8120,548),(8142,'',8121,79),(8143,'',8122,79),(8144,'',8123,89),(8145,'',8124,548),(8146,'',8125,548),(8147,'',8126,78),(8148,'',8127,200),(8149,'',8128,89),(8150,'',8129,548),(8151,'',8130,287),(8152,'',8131,200),(8153,'',8132,79),(8154,'',8133,287),(8155,'',8134,548),(8156,'',8135,548),(8157,'',8136,548),(8158,'',8137,548),(8159,'',8138,200),(8160,'',8139,79),(8161,'',8140,200),(8162,'',8141,548),(8163,'',8142,200),(8164,'',8143,284),(8165,'',8144,79),(8166,'',8145,79),(8167,'',8146,548),(8168,'',8147,200),(8169,'',8148,284),(8170,'',8149,521),(8171,'',8150,548),(8172,'',8151,284),(8173,'',8152,200),(8174,'',8153,548),(8175,'',8154,200),(8176,'',8155,78),(8177,'',8156,79),(8178,'',8157,548),(8179,'',8158,79),(8180,'',8159,16),(8181,'',8160,79),(8182,'',8161,22),(8183,'',8162,200),(8184,'',8163,200),(8185,'',8164,284),(8186,'',8165,78),(8187,'',8166,79),(8188,'',8167,113),(8189,'',8168,548),(8190,'',8169,548),(8191,'',8170,284),(8192,'',8171,200),(8193,'',8172,79),(8194,'',8173,287),(8195,'',8174,200),(8196,'',8175,79),(8197,'',8176,548),(8198,'',8177,200),(8199,'',8178,200),(8200,'',8179,548),(8201,'',8180,200),(8202,'',8181,548),(8203,'',8182,548),(8204,'',8183,548),(8205,'',8184,79),(8206,'',8185,548),(8207,'',8186,200),(8208,'',8187,79),(8209,'',8188,200),(8210,'',8189,78),(8211,'',8190,200),(8212,'',8191,200),(8213,'',8192,548),(8214,'',8193,284),(8215,'',8194,89),(8216,'',8195,200),(8217,'',8196,79),(8218,'',8197,200),(8219,'',8198,89),(8220,'',8199,287),(8221,'',8200,284),(8222,'',8201,79),(8223,'',8202,78),(8224,'',8203,284),(8225,'',8204,548),(8226,'',8205,79),(8227,'',8206,200),(8228,'',8207,200),(8229,'',8208,78),(8230,'',8209,548),(8231,'',8210,200),(8232,'',8211,284),(8233,'',8212,89),(8234,'',8213,22),(8235,'',8214,287),(8236,'',8215,78),(8237,'',8216,548),(8238,'',8217,200),(8239,'',8218,284),(8240,'',8219,89),(8241,'',8220,548),(8242,'',8221,200),(8243,'',8222,548),(8244,'',8223,548),(8245,'',8224,200),(8246,'',8225,548),(8247,'',8226,548),(8248,'',8227,548),(8249,'',8228,79),(8250,'',8229,79),(8251,'',8230,284),(8252,'',8231,79),(8253,'',8232,200),(8254,'',8233,78),(8255,'',8234,548),(8256,'',8235,200),(8257,'',8236,548),(8258,'',8237,200),(8259,'',8238,548),(8260,'',8239,78),(8261,'',8240,200),(8262,'',8241,284),(8263,'',8242,89),(8264,'',8243,548),(8265,'',8244,200),(8266,'',8245,548),(8267,'',8246,200),(8268,'',8247,548),(8269,'',8248,284),(8270,'',8249,200),(8271,'',8250,548),(8272,'',8251,22),(8273,'',8252,200),(8274,'',8253,78),(8275,'',8254,79),(8276,'',8255,134),(8277,'',8256,200),(8278,'',8257,78),(8279,'',8258,284),(8280,'',8259,200),(8281,'',8260,284),(8282,'',8261,89),(8283,'',8262,548),(8284,'',8263,548),(8285,'',NULL,284),(8286,'',8265,89),(8287,'',8266,200),(8288,'',8267,200),(8289,'',8268,359),(8290,'',8269,200),(8291,'',8270,79),(8292,'',8271,284),(8293,'',8272,284),(8294,'',8273,22),(8295,'',8274,284),(8296,'',8275,284),(8297,'',8276,548),(8298,'',8277,434),(8299,'',8278,200),(8300,'',8279,78),(8301,'',8280,548),(8302,'',8281,548),(8303,'',8282,200),(8304,'',8283,79),(8305,'',8284,200),(8306,'',8285,284),(8307,'',8286,548),(8308,'',8287,79),(8309,'',8288,284),(8310,'',8289,200),(8311,'',8290,548),(8312,'',NULL,79),(8313,'',8292,284),(8314,'',8293,548),(8315,'',8294,200),(8316,'',8295,79),(8317,'',8296,200),(8318,'',8297,78),(8319,'',8298,548),(8320,'',8299,548),(8321,'',8300,200),(8322,'',8301,200),(8323,'',8302,200),(8324,'',8303,200),(8325,'',8304,200),(8326,'',8305,548),(8327,'',8306,200),(8328,'',8307,200),(8329,'',8308,200),(8330,'',8309,548),(8331,'',8310,200),(8332,'',8311,284),(8333,'',8312,200),(8334,'',8313,79),(8335,'',8314,200),(8336,'',8315,200),(8337,'',8316,400),(8338,'',8317,200),(8339,'',8318,200),(8340,'',8319,548),(8341,'',8320,200),(8342,'',8321,284),(8343,'',8322,89),(8344,'',8323,120),(8345,'',8324,22),(8346,'',8325,548),(8347,'',8326,200),(8348,'',8327,200),(8349,'',8328,548),(8350,'',8329,89),(8351,'',8330,548),(8352,'',8331,284),(8353,'',8332,284),(8354,'',8333,89),(8355,'',8334,200),(8356,'',8335,78),(8357,'',8336,80),(8358,'',8337,548),(8359,'',8338,548),(8360,'',8339,200),(8361,'',8340,78),(8362,'',8341,79),(8363,'',8342,548),(8364,'',8343,284),(8365,'',8344,287),(8366,'',8345,548),(8367,'',8346,284),(8368,'',8347,284),(8369,'',8348,548),(8370,'',8349,200),(8371,'',8350,200),(8372,'',8351,16),(8373,'',8352,79),(8374,'',8353,400),(8375,'',8354,200),(8376,'',8355,200),(8377,'',8356,284),(8378,'',8357,200),(8379,'',8358,200),(8380,'',8359,200),(8381,'',8360,22),(8382,'',8361,79),(8383,'',8362,79),(8384,'',8363,284),(8385,'',8364,200),(8386,'',8365,200),(8387,'',8366,425),(8388,'',8367,80),(8389,'',8368,200),(8390,'',8369,89),(8391,'',8370,200),(8392,'',8371,200),(8393,'',8372,200),(8394,'',8373,22),(8395,'',8374,78),(8396,'',8375,548),(8397,'',8376,79),(8398,'',8377,200),(8399,'',8378,548),(8400,'',8379,79),(8401,'',8380,200),(8402,'',8381,78),(8403,'',8382,548),(8404,'',8383,79),(8405,'',8384,78),(8406,'',8385,200),(8407,'',8386,284),(8408,'',8387,200),(8409,'',8388,200),(8410,'',8389,548),(8411,'',8390,79),(8412,'',8391,400),(8413,'',8392,548),(8414,'',8393,200),(8415,'',8394,548),(8416,'',8395,200),(8417,'',8396,548),(8418,'',8397,22),(8419,'',8398,200),(8420,'',8399,425),(8421,'',8400,548),(8422,'',8401,200),(8423,'',8402,548),(8424,'',8403,287),(8425,'',8404,284),(8426,'',8405,200),(8427,'',8406,284),(8428,'',8407,200),(8429,'',8408,200),(8430,'',8409,16),(8431,'',8410,79),(8432,'',8411,200),(8433,'',8412,80),(8434,'',8413,200),(8435,'',8414,548),(8436,'',8415,548),(8437,'',8416,89),(8438,'',8417,89),(8439,'',8418,548),(8440,'',8419,548),(8441,'',8420,200),(8442,'',8421,287),(8443,'',8422,200),(8444,'',8423,548),(8445,'',8424,200),(8446,'',8425,287),(8447,'',8426,284),(8448,'',8427,548),(8449,'',8428,89),(8450,'',8429,78),(8451,'',8430,200),(8452,'',8431,200),(8453,'',8432,548),(8454,'',8433,548),(8455,'',8434,200),(8456,'',8435,79),(8457,'',8436,548),(8458,'',8437,548),(8459,'',8438,548),(8460,'',8439,98),(8461,'',8440,200),(8462,'',8441,79),(8463,'',8442,89),(8464,'',8443,284),(8465,'',8444,79),(8466,'',8445,78),(8467,'',8446,78),(8468,'',8447,78),(8469,'',8448,284),(8470,'',8449,89),(8471,'',8450,284),(8472,'',8451,78),(8473,'',8452,200),(8474,'',8453,200),(8475,'',8454,548),(8476,'',8455,200),(8477,'',8456,78),(8478,'',8457,200),(8479,'',8458,200),(8480,'',8459,89),(8481,'',8460,200),(8482,'',8461,200),(8483,'',8462,79),(8484,'',8463,548),(8485,'',8464,548),(8486,'',8465,200),(8487,'',8466,79),(8488,'',8467,89),(8489,'',8468,548),(8490,'',8469,284),(8491,'',8470,284),(8492,'',8471,78),(8493,'',8472,89),(8494,'',8473,200),(8495,'',8474,200),(8496,'',8475,200),(8497,'',8476,548),(8498,'',8477,548),(8499,'',8478,548),(8500,'',8479,200),(8501,'',8480,200),(8502,'',8481,200),(8503,'',8482,22),(8504,'',8483,200),(8505,'',8484,79),(8506,'',8485,548),(8507,'',8486,287),(8508,'',8487,78),(8509,'',8488,78),(8510,'',8489,200),(8511,'',8490,284),(8512,'',8491,89),(8513,'',8492,548),(8514,'',8493,200),(8515,'',8494,548),(8516,'',8495,548),(8517,'',8496,200),(8518,'',8497,200),(8519,'',8498,79),(8520,'',8499,548),(8521,'',8500,200),(8522,'',8501,287),(8523,'',8502,79),(8524,'',8503,284),(8525,'',8504,548),(8526,'',8505,79),(8527,'',8506,79),(8528,'',8507,200),(8529,'',8508,548),(8530,'',8509,287),(8531,'',8510,200),(8532,'',8511,22),(8533,'',8512,79),(8534,'',8513,200),(8535,'',8514,200),(8536,'',8515,78),(8537,'',8516,200),(8538,'',8517,79),(8539,'',8518,78),(8540,'',8519,284),(8541,'',8520,78),(8542,'',8521,548),(8543,'',8522,548),(8544,'',8523,200),(8545,'',8524,22),(8546,'',8525,78),(8547,'',8526,548),(8548,'',8527,79),(8549,'',8528,548),(8550,'',8529,78),(8551,'',8530,89),(8552,'',8531,548),(8553,'',8532,548),(8554,'',8533,200),(8555,'',8534,200),(8556,'',8535,284),(8557,'',8536,548),(8558,'',8537,200),(8559,'',8538,548),(8560,'',8539,548),(8561,'',8540,200),(8562,'',8541,287),(8563,'',8542,78),(8564,'',8543,79),(8565,'',8544,284),(8566,'',8545,287),(8567,'',8546,200),(8568,'',8547,284),(8569,'',8548,548),(8570,'',8549,79),(8571,'',8550,200),(8572,'',8551,79),(8573,'',8552,79),(8574,'',8553,287),(8575,'',8554,548),(8576,'',8555,200),(8577,'',8556,22),(8578,'',8557,284),(8579,'',8558,200),(8580,'',8559,284),(8581,'',8560,548),(8582,'',8561,200),(8583,'',8562,200),(8584,'',8563,200),(8585,'',8564,89),(8586,'',8565,548),(8587,'',8566,200),(8588,'',8567,22),(8589,'',8568,200),(8590,'',8569,287),(8591,'',8570,89),(8592,'',8571,200),(8593,'',8572,287),(8594,'',8573,89),(8595,'',8574,200),(8596,'',8575,200),(8597,'',8576,22),(8598,'',8577,548),(8599,'',8578,284),(8600,'',8579,79),(8601,'',8580,200),(8602,'',8581,200),(8603,'',8582,78),(8604,'',8583,548),(8605,'',8584,200),(8606,'',8585,548),(8607,'',8586,200),(8608,'',8587,78),(8609,'',8588,200),(8610,'',8589,548),(8611,'',8590,200),(8612,'',8591,284),(8613,'',8592,284),(8614,'',8593,200),(8615,'',8594,548),(8616,'',8595,548),(8617,'',8596,400),(8618,'',8597,287),(8619,'',8598,22),(8620,'',8599,200),(8621,'',8600,89),(8622,'',8601,200),(8623,'',8602,22),(8624,'',8603,200),(8625,'',8604,200),(8626,'',8605,79),(8627,'',8606,284),(8628,'',8607,548),(8629,'',8608,287),(8630,'',8609,22),(8631,'',8610,79),(8632,'',8611,89),(8633,'',8612,200),(8634,'',8613,287),(8635,'',8614,340),(8636,'',8615,89),(8637,'',8616,200),(8638,'',8617,79),(8639,'',8618,200),(8640,'',8619,78),(8641,'',8620,200),(8642,'',8621,79),(8643,'',8622,284),(8644,'',8623,200),(8645,'',8624,284),(8646,'',8625,89),(8647,'',8626,78),(8648,'',8627,79),(8649,'',8628,548),(8650,'',8629,200),(8651,'',8630,200),(8652,'',8631,78),(8653,'',8632,200),(8654,'',8633,400),(8655,'',8634,78),(8656,'',8635,89),(8657,'',8636,200),(8658,'',8637,400),(8659,'',8638,200),(8660,'',8639,79),(8661,'',8640,200),(8662,'',8641,22),(8663,'',8642,548),(8664,'',8643,548),(8665,'',8644,284),(8666,'',8645,548),(8667,'',8646,284),(8668,'',8647,89),(8669,'',8648,548),(8670,'',8649,89),(8671,'',8650,79),(8672,'',8651,79),(8673,'',8652,548),(8674,'',8653,200),(8675,'',8654,22),(8676,'',8655,548),(8677,'',8656,548),(8678,'',8657,120),(8679,'',8658,79),(8680,'',8659,78),(8681,'',8660,78),(8682,'',8661,89),(8683,'',8662,284),(8684,'',8663,79),(8685,'',8664,548),(8686,'',8665,548),(8687,'',8666,200),(8688,'',8667,120),(8689,'',8668,400),(8690,'',8669,548),(8691,'',8670,548),(8692,'',8671,200),(8693,'',8672,78),(8694,'',8673,79),(8695,'',8674,548),(8696,'',8675,284),(8697,'',8676,79),(8698,'',8677,22),(8699,'',8678,89),(8700,'',8679,79),(8701,'',8680,200),(8702,'',8681,200),(8703,'',8682,548),(8704,'',8683,79),(8705,'',8684,200),(8706,'',8685,79),(8707,'',8686,78),(8708,'',8687,79),(8709,'',8688,200),(8710,'',8689,78),(8711,'',8690,284),(8712,'',8691,22),(8713,'',8692,548),(8714,'',8693,89),(8715,'',8694,548),(8716,'',8695,89),(8717,'',8696,79),(8718,'',8697,284),(8719,'',8698,79),(8720,'',8699,548),(8721,'',8700,200),(8722,'',8701,89),(8723,'',8702,400),(8724,'',8703,287),(8725,'',8704,200),(8726,'',8705,548),(8727,'',8706,79),(8728,'',8707,200),(8729,'',8708,548),(8730,'',8709,78),(8731,'',8710,284),(8732,'',8711,200),(8733,'',8712,200),(8734,'',8713,200),(8735,'',8714,200),(8736,'',8715,78),(8737,'',8716,89),(8738,'',8717,548),(8739,'',8718,284),(8740,'',8719,548),(8741,'',8720,89),(8742,'',8721,284),(8743,'',8722,89),(8744,'',8723,89),(8745,'',8724,200),(8746,'',8725,89),(8747,'',8726,284),(8748,'',8727,79),(8749,'',8728,22),(8750,'',8729,78),(8751,'',8730,200),(8752,'',8731,79),(8753,'',8732,80),(8754,'',8733,200),(8755,'',8734,548),(8756,'',8735,200),(8757,'',8736,79),(8758,'',8737,22),(8759,'',8738,284),(8760,'',8739,200),(8761,'',8740,22),(8762,'',8741,548),(8763,'',8742,548),(8764,'',8743,79),(8765,'',8744,200),(8766,'',8745,548),(8767,'',8746,548),(8768,'',8747,548),(8769,'',8748,548),(8770,'',8749,548),(8771,'',8750,79),(8772,'',8751,79),(8773,'',8752,78),(8774,'',8753,200),(8775,'',8754,78),(8776,'',8755,434),(8777,'',8756,16),(8778,'',8757,548),(8779,'',8758,548),(8780,'',8759,548),(8781,'',8760,548),(8782,'',8761,400),(8783,'',8762,548),(8784,'',8763,548),(8785,'',8764,548),(8786,'',8765,548),(8787,'',8766,200),(8788,'',8767,200),(8789,'',8768,79),(8790,'',8769,79),(8791,'',NULL,89),(8792,'',8771,89),(8793,'',8772,200),(8794,'',8773,200),(8795,'',8774,548),(8796,'',8775,200),(8797,'',8776,548),(8798,'',8777,548),(8799,'',8778,400),(8800,'',8779,287),(8801,'',8780,89),(8802,'',8781,539),(8803,'',8782,284),(8804,'',8783,120),(8805,'',8784,548),(8806,'',8785,200),(8807,'',8786,200),(8808,'',8787,548),(8809,'',8788,548),(8810,'',8789,200),(8811,'',8790,548),(8812,'',8791,79),(8813,'',8792,200),(8814,'',8793,548),(8815,'',8794,79),(8816,'',8795,78),(8817,'',8796,200),(8818,'',8797,79),(8819,'',8798,548),(8820,'',8799,200),(8821,'',8800,548),(8822,'',8801,200),(8823,'',8802,548),(8824,'',8803,548),(8825,'',8804,79),(8826,'',8805,200),(8827,'',8806,200),(8828,'',8807,22),(8829,'',8808,284),(8830,'',8809,200),(8831,'',8810,284),(8832,'',8811,200),(8833,'',8812,548),(8834,'',8813,200),(8835,'',8814,79),(8836,'',8815,200),(8837,'',8816,548),(8838,'',8817,200),(8839,'',8818,200),(8840,'',8819,287),(8841,'',8820,284),(8842,'',8821,78),(8843,'',8822,79),(8844,'',8823,89),(8845,'',8824,284),(8846,'',8825,78),(8847,'',8826,284),(8848,'',8827,284),(8849,'',8828,548),(8850,'',8829,200),(8851,'',8830,200),(8852,'',8831,548),(8853,'',8832,284),(8854,'',8833,89),(8855,'',8834,548),(8856,'',8835,200),(8857,'',8836,89),(8858,'',8837,548),(8859,'',8838,89),(8860,'',8839,22),(8861,'',8840,200),(8862,'',8841,548),(8863,'',8842,200),(8864,'',8843,200),(8865,'',8844,79),(8866,'',8845,200),(8867,'',8846,287),(8868,'',8847,284),(8869,'',8848,284),(8870,'',8849,200),(8871,'',8850,200),(8872,'',8851,548),(8873,'',8852,548),(8874,'',8853,200),(8875,'',8854,200),(8876,'',8855,200),(8877,'',8856,400),(8878,'',8857,78),(8879,'',8858,79),(8880,'',8859,200),(8881,'',8860,89),(8882,'',8861,78),(8883,'',8862,548),(8884,'',8863,548),(8885,'',8864,548),(8886,'',8865,287),(8887,'',8866,200),(8888,'',8867,79),(8889,'',8868,200),(8890,'',8869,200),(8891,'',8870,200),(8892,'',8871,200),(8893,'',8872,200),(8894,'',8873,78),(8895,'',8874,548),(8896,'',8875,200),(8897,'',8876,284),(8898,'',8877,79),(8899,'',8878,78),(8900,'',8879,79),(8901,'',8880,79),(8902,'',8881,200),(8903,'',8882,284),(8904,'',8883,200),(8905,'',8884,548),(8906,'',8885,89),(8907,'',8886,79),(8908,'',8887,79),(8909,'',8888,284),(8910,'',8889,548),(8911,'',8890,284),(8912,'',8891,89),(8913,'',8892,200),(8914,'',8893,22),(8915,'',8894,359),(8916,'',8895,434),(8917,'',8896,22),(8918,'',8897,79),(8919,'',8898,287),(8920,'',8899,200),(8921,'',8900,548),(8922,'',8901,548),(8923,'',8902,79),(8924,'',8903,79),(8925,'',8904,200),(8926,'',8905,79),(8927,'',8906,79),(8928,'',8907,200),(8929,'',8908,78),(8930,'',8909,200),(8931,'',8910,79),(8932,'',8911,200),(8933,'',8912,200),(8934,'',8913,200),(8935,'',8914,200),(8936,'',8915,79),(8937,'',8916,548),(8938,'',8917,200),(8939,'',8918,200),(8940,'',8919,89),(8941,'',8920,79),(8942,'',8921,548),(8943,'',8922,79),(8944,'',8923,79),(8945,'',8924,200),(8946,'',8925,200),(8947,'',8926,200),(8948,'',8927,200),(8949,'',8928,548),(8950,'',8929,200),(8951,'',8930,89),(8952,'',8931,200),(8953,'',8932,22),(8954,'',8933,200),(8955,'',8934,78),(8956,'',8935,89),(8957,'',8936,200),(8958,'',8937,200),(8959,'',8938,200),(8960,'',8939,284),(8961,'',8940,78),(8962,'',8941,548),(8963,'',8942,425),(8964,'',NULL,22),(8965,'',8944,78),(8966,'',8945,548),(8967,'',8946,89),(8968,'',8947,200),(8969,'',8948,89),(8970,'',8949,548),(8971,'',8950,89),(8972,'',8951,284),(8973,'',8952,200),(8974,'',8953,79),(8975,'',8954,200),(8976,'',8955,548),(8977,'',8956,548),(8978,'',8957,79),(8979,'',8958,200),(8980,'',8959,548),(8981,'',8960,120),(8982,'',8961,284),(8983,'',8962,22),(8984,'',8963,200),(8985,'',8964,78),(8986,'',8965,200),(8987,'',8966,200),(8988,'',8967,200),(8989,'',8968,200),(8990,'',8969,200),(8991,'',8970,79),(8992,'',8971,22),(8993,'',8972,200),(8994,'',8973,548),(8995,'',8974,200),(8996,'',8975,284),(8997,'',8976,284),(8998,'',8977,79),(8999,'',8978,200),(9000,'',8979,79),(9001,'',8980,284),(9002,'',8981,79),(9003,'',8982,284),(9004,'',8983,200),(9005,'',8984,548),(9006,'',8985,200),(9007,'',8986,548),(9008,'',8987,284),(9009,'',8988,200),(9010,'',8989,22),(9011,'',8990,548),(9012,'',8991,89),(9013,'',8992,200),(9014,'',8993,548),(9015,'',8994,284),(9016,'',8995,200),(9017,'',8996,78),(9018,'',8997,200),(9019,'',8998,78),(9020,'',8999,548),(9021,'',9000,400),(9022,'',9001,284),(9023,'',9002,548),(9024,'',9003,89),(9025,'',9004,548),(9026,'',9005,548),(9027,'',9006,284),(9028,'',9007,200),(9029,'',9008,79),(9030,'',9009,78),(9031,'',9010,200),(9032,'',9011,79),(9033,'',9012,200),(9034,'',9013,287),(9035,'',9014,284),(9036,'',9015,89),(9037,'',9016,548),(9038,'',9017,548),(9039,'',9018,548),(9040,'',9019,548),(9041,'',9020,548),(9042,'',9021,548),(9043,'',9022,200),(9044,'',9023,200),(9045,'',9024,79),(9046,'',9025,200),(9047,'',9026,200),(9048,'',9027,200),(9049,'',9028,330),(9050,'',9029,200),(9051,'',9030,287),(9052,'',9031,434),(9053,'',9032,78),(9054,'',9033,548),(9055,'',9034,22),(9056,'',9035,200),(9057,'',9036,548),(9058,'',9037,200),(9059,'',9038,287),(9060,'',9039,200),(9061,'',9040,425),(9062,'',9041,200),(9063,'',9042,284),(9064,'',9043,200),(9065,'',9044,548),(9066,'',9045,548),(9067,'',9046,120),(9068,'',9047,388),(9069,'',9048,548),(9070,'',9049,200),(9071,'',9050,200),(9072,'',9051,200),(9073,'',9052,548),(9074,'',9053,200),(9075,'',9054,548),(9076,'',9055,548),(9077,'',9056,284),(9078,'',9057,548),(9079,'',9058,79),(9080,'',9059,200),(9081,'',9060,200),(9082,'',9061,287),(9083,'',9062,200),(9084,'',9063,78),(9085,'',9064,200),(9086,'',9065,78),(9087,'',9066,200),(9088,'',9067,497),(9089,'',9068,79),(9090,'',9069,78),(9091,'',9070,548),(9092,'',9071,200),(9093,'',9072,200),(9094,'',9073,548),(9095,'',9074,200),(9096,'',9075,548),(9097,'',9076,548),(9098,'',9077,89),(9099,'',9078,79),(9100,'',9079,200),(9101,'',9080,548),(9102,'',9081,200),(9103,'',9082,16),(9104,'',9083,78),(9105,'',9084,200),(9106,'',9085,200),(9107,'',9086,284),(9108,'',9087,200),(9109,'',9088,200),(9110,'',9089,79),(9111,'',9090,200),(9112,'',9091,548),(9113,'',9092,200),(9114,'',9093,89),(9115,'',9094,287),(9116,'',9095,200),(9117,'',9096,120),(9118,'',NULL,200),(9119,'',9098,200),(9120,'',9099,548),(9121,'',9100,89),(9122,'',9101,284),(9123,'',9102,548),(9124,'',9103,200),(9125,'',9104,200),(9126,'',9105,287),(9127,'',9106,548),(9128,'',9107,200),(9129,'',9108,78),(9130,'',9109,200),(9131,'',9110,200),(9132,'',9111,78),(9133,'',9112,548),(9134,'',9113,284),(9135,'',9114,200),(9136,'',9115,200),(9137,'',9116,548),(9138,'',9117,548),(9139,'',9118,79),(9140,'',9119,200),(9141,'',9120,200),(9142,'',9121,89),(9143,'',9122,548),(9144,'',9123,200),(9145,'',9124,200),(9146,'',9125,200),(9147,'',9126,548),(9148,'',9127,548),(9149,'',9128,200),(9150,'',9129,548),(9151,'',9130,284),(9152,'',9131,548),(9153,'',9132,94),(9154,'',9133,200),(9155,'',9134,200),(9156,'',9135,284),(9157,'',9136,120),(9158,'',9137,548),(9159,'',9138,200),(9160,'',9139,548),(9161,'',9140,78),(9162,'',9141,548),(9163,'',9142,78),(9164,'',9143,425),(9165,'',9144,548),(9166,'',9145,200),(9167,'',9146,287),(9168,'',9147,200),(9169,'',9148,120),(9170,'',9149,200),(9171,'',9150,287),(9172,'',9151,548),(9173,'',9152,200),(9174,'',9153,548),(9175,'',9154,200),(9176,'',9155,200),(9177,'',9156,79),(9178,'',9157,78),(9179,'',9158,200),(9180,'',9159,89),(9181,'',9160,79),(9182,'',9161,548),(9183,'',9162,548),(9184,'',9163,284),(9185,'',9164,425),(9186,'',9165,200),(9187,'',9166,79),(9188,'',9167,284),(9189,'',9168,79),(9190,'',9169,120),(9191,'',9170,284),(9192,'',9171,79),(9193,'',9172,200),(9194,'',9173,200),(9195,'',9174,548),(9196,'',9175,79),(9197,'',9176,425),(9198,'',9177,79),(9199,'',9178,79),(9200,'',9179,284),(9201,'',9180,79),(9202,'',9181,200),(9203,'',9182,200),(9204,'',9183,79),(9205,'',9184,79),(9206,'',9185,548),(9207,'',9186,78),(9208,'',9187,89),(9209,'',9188,79),(9210,'',9189,89),(9211,'',9190,548),(9212,'',9191,548),(9213,'',9192,548),(9214,'',9193,200),(9215,'',9194,200),(9216,'',9195,79),(9217,'',9196,548),(9218,'',9197,200),(9219,'',9198,287),(9220,'',9199,89),(9221,'',9200,548),(9222,'',9201,200),(9223,'',9202,287),(9224,'',9203,89),(9225,'',9204,78),(9226,'',9205,79),(9227,'',9206,284),(9228,'',9207,200),(9229,'',9208,79),(9230,'',9209,200),(9231,'',9210,200),(9232,'',9211,79),(9233,'',9212,287),(9234,'',9213,548),(9235,'',9214,548),(9236,'',9215,120),(9237,'',9216,200),(9238,'',9217,200),(9239,'',9218,79),(9240,'',9219,200),(9241,'',9220,548),(9242,'',9221,287),(9243,'',9222,89),(9244,'',9223,425),(9245,'',9224,89),(9246,'',9225,200),(9247,'',9226,79),(9248,'',9227,78),(9249,'',9228,200),(9250,'',9229,78),(9251,'',9230,79),(9252,'',9231,79),(9253,'',9232,200),(9254,'',9233,284),(9255,'',9234,200),(9256,'',9235,548),(9257,'',9236,548),(9258,'',9237,200),(9259,'',9238,548),(9260,'',9239,548),(9261,'',9240,200),(9262,'',9241,200),(9263,'',9242,89),(9264,'',9243,548),(9265,'',9244,200),(9266,'',9245,79),(9267,'',9246,200),(9268,'',9247,78),(9269,'',9248,89),(9270,'',9249,200),(9271,'',9250,548),(9272,'',9251,548),(9273,'',9252,200),(9274,'',9253,200),(9275,'',9254,200),(9276,'',9255,200),(9277,'',9256,259),(9278,'',9257,548),(9279,'',9258,200),(9280,'',9259,548),(9281,'',9260,200),(9282,'',9261,79),(9283,'',9262,200),(9284,'',9263,200),(9285,'',9264,200),(9286,'',9265,120),(9287,'',9266,79),(9288,'',9267,284),(9289,'',9268,79),(9290,'',9269,79),(9291,'',9270,200),(9292,'',9271,548),(9293,'',9272,548),(9294,'',9273,548),(9295,'',9274,79),(9296,'',9275,78),(9297,'',9276,548),(9298,'',9277,284),(9299,'',9278,79),(9300,'',9279,80),(9301,'',9280,548),(9302,'',9281,79),(9303,'',9282,79),(9304,'',9283,200),(9305,'',9284,548),(9306,'',9285,78),(9307,'',9286,548),(9308,'',9287,548),(9309,'',9288,79),(9310,'',9289,287),(9311,'',9290,200),(9312,'',9291,284),(9313,'',9292,200),(9314,'',9293,200),(9315,'',9294,284),(9316,'',9295,200),(9317,'',9296,78),(9318,'',9297,22),(9319,'',9298,200),(9320,'',9299,548),(9321,'',9300,548),(9322,'',9301,200),(9323,'',9302,79),(9324,'',9303,200),(9325,'',9304,89),(9326,'',9305,548),(9327,'',9306,200),(9328,'',9307,200),(9329,'',9308,79),(9330,'',9309,22),(9331,'',9310,79),(9332,'',9311,78),(9333,'',9312,22),(9334,'',9313,284),(9335,'',9314,200),(9336,'',9315,200),(9337,'',9316,79),(9338,'',9317,78),(9339,'',9318,79),(9340,'',9319,200),(9341,'',9320,22),(9342,'',9321,89),(9343,'',9322,200),(9344,'',9323,200),(9345,'',9324,284),(9346,'',9325,548),(9347,'',9326,79),(9348,'',9327,200),(9349,'',9328,79),(9350,'',9329,200),(9351,'',9330,548),(9352,'',9331,548),(9353,'',9332,548),(9354,'',9333,548),(9355,'',9334,548),(9356,'',9335,287),(9357,'',9336,22),(9358,'',9337,79),(9359,'',9338,79),(9360,'',9339,79),(9361,'',9340,200),(9362,'',9341,89),(9363,'',9342,548),(9364,'',9343,200),(9365,'',9344,120),(9366,'',9345,200),(9367,'',9346,548),(9368,'',9347,548),(9369,'',9348,78),(9370,'',9349,548),(9371,'',9350,89),(9372,'',9351,284),(9373,'',9352,89),(9374,'',9353,200),(9375,'',9354,200),(9376,'',9355,78),(9377,'',9356,200),(9378,'',9357,200),(9379,'',9358,89),(9380,'',9359,200),(9381,'',9360,120),(9382,'',9361,200),(9383,'',9362,200),(9384,'',9363,400),(9385,'',9364,434),(9386,'',9365,90),(9387,'',9366,548),(9388,'',9367,200),(9389,'',9368,400),(9390,'',9369,200),(9391,'',9370,89),(9392,'',9371,200),(9393,'',9372,89),(9394,'',9373,200),(9395,'',9374,200),(9396,'',9375,548),(9397,'',9376,548),(9398,'',9377,548),(9399,'',9378,200),(9400,'',9379,548),(9401,'',9380,200),(9402,'',9381,287),(9403,'',9382,200),(9404,'',9383,79),(9405,'',9384,548),(9406,'',9385,548),(9407,'',9386,79),(9408,'',9387,284),(9409,'',9388,200),(9410,'',9389,400),(9411,'',9390,79),(9412,'',9391,548),(9413,'',9392,425),(9414,'',9393,78),(9415,'',9394,284),(9416,'',9395,548),(9417,'',9396,548),(9418,'',9397,89),(9419,'',9398,284),(9420,'',9399,548),(9421,'',9400,200),(9422,'',9401,120),(9423,'',9402,78),(9424,'',9403,200),(9425,'',9404,548),(9426,'',9405,284),(9427,'',9406,79),(9428,'',9407,548),(9429,'',9408,89),(9430,'',9409,548),(9431,'',9410,200),(9432,'',9411,548),(9433,'',9412,79),(9434,'',9413,200),(9435,'',9414,22),(9436,'',9415,284),(9437,'',9416,548),(9438,'',9417,200),(9439,'',9418,200),(9440,'',9419,284),(9441,'',9420,79),(9442,'',9421,548),(9443,'',9422,79),(9444,'',9423,79),(9445,'',9424,548),(9446,'',9425,78),(9447,'',9426,200),(9448,'',9427,548),(9449,'',9428,284),(9450,'',9429,548),(9451,'',9430,200),(9452,'',9431,548),(9453,'',9432,200),(9454,'',9433,89),(9455,'',9434,200),(9456,'',9435,287),(9457,'',9436,200),(9458,'',9437,548),(9459,'',9438,548),(9460,'',9439,548),(9461,'',9440,548),(9462,'',9441,200),(9463,'',9442,79),(9464,'',9443,200),(9465,'',9444,287),(9466,'',9445,548),(9467,'',9446,200),(9468,'',9447,22),(9469,'',9448,78),(9470,'',9449,200),(9471,'',9450,200),(9472,'',9451,548),(9473,'',9452,548),(9474,'',9453,78),(9475,'',9454,79),(9476,'',9455,548),(9477,'',9456,548),(9478,'',9457,200),(9479,'',9458,79),(9480,'',9459,79),(9481,'',9460,548),(9482,'',9461,548),(9483,'',9462,548),(9484,'',9463,200),(9485,'',9464,200),(9486,'',9465,79),(9487,'',9466,79),(9488,'',9467,200),(9489,'',9468,200),(9490,'',9469,89),(9491,'',9470,79),(9492,'',9471,287),(9493,'',9472,200),(9494,'',9473,284),(9495,'',9474,200),(9496,'',9475,200),(9497,'',9476,284),(9498,'',9477,79),(9499,'',9478,548),(9500,'',9479,284),(9501,'',9480,79),(9502,'',9481,548),(9503,'',9482,548),(9504,'',9483,548),(9505,'',9484,200),(9506,'',9485,200),(9507,'',9486,200),(9508,'',9487,287),(9509,'',9488,78),(9510,'',9489,284),(9511,'',9490,200),(9512,'',9491,200),(9513,'',9492,79),(9514,'',9493,22),(9515,'',9494,548),(9516,'',9495,16),(9517,'',9496,120),(9518,'',9497,200),(9519,'',9498,284),(9520,'',9499,200),(9521,'',9500,548),(9522,'',9501,548),(9523,'',9502,284),(9524,'',9503,79),(9525,'',9504,548),(9526,'',9505,79),(9527,'',9506,200),(9528,'',9507,200),(9529,'',9508,22),(9530,'',9509,200),(9531,'',9510,79),(9532,'',9511,284),(9533,'',9512,200),(9534,'',9513,79),(9535,'',9514,200),(9536,'',9515,16),(9537,'',9516,79),(9538,'',9517,134),(9539,'',9518,200),(9540,'',9519,200),(9541,'',9520,79),(9542,'',9521,548),(9543,'',9522,200),(9544,'',9523,548),(9545,'',9524,287),(9546,'',9525,200),(9547,'',9526,284),(9548,'',9527,89),(9549,'',9528,548),(9550,'',9529,284),(9551,'',9530,284),(9552,'',9531,284),(9553,'',9532,79),(9554,'',9533,284),(9555,'',9534,548),(9556,'',9535,79),(9557,'',9536,79),(9558,'',9537,548),(9559,'',9538,548),(9560,'',9539,548),(9561,'',9540,200),(9562,'',9541,79),(9563,'',9542,548),(9564,'',9543,548),(9565,'',9544,284),(9566,'',9545,548),(9567,'',9546,200),(9568,'',9547,548),(9569,'',9548,200),(9570,'',9549,200),(9571,'',9550,330),(9572,'',9551,200),(9573,'',9552,548),(9574,'',9553,287),(9575,'',9554,89),(9576,'',9555,548),(9577,'',9556,200),(9578,'',9557,200),(9579,'',9558,200),(9580,'',9559,287),(9581,'',9560,548),(9582,'',9561,200),(9583,'',9562,548),(9584,'',9563,548),(9585,'',9564,79),(9586,'',9565,284),(9587,'',9566,284),(9588,'',9567,548),(9589,'',9568,548),(9590,'',9569,548),(9591,'',9570,287),(9592,'',9571,200),(9593,'',9572,78),(9594,'',9573,400),(9595,'',9574,287),(9596,'',9575,548),(9597,'',9576,548),(9598,'',9577,200),(9599,'',9578,200),(9600,'',9579,78),(9601,'',9580,548),(9602,'',9581,200),(9603,'',9582,400),(9604,'',9583,200),(9605,'',9584,548),(9606,'',9585,200),(9607,'',9586,548),(9608,'',9587,78),(9609,'',9588,548),(9610,'',9589,200),(9611,'',9590,400),(9612,'',NULL,287),(9613,'',9592,200),(9614,'',9593,200),(9615,'',9594,120),(9616,'',9595,200),(9617,'',9596,200),(9618,'',9597,548),(9619,'',9598,548),(9620,'',9599,78),(9621,'',9600,548),(9622,'',9601,548),(9623,'',9602,287),(9624,'',9603,200),(9625,'',9604,287),(9626,'',9605,89),(9627,'',9606,79),(9628,'',9607,284),(9629,'',9608,548),(9630,'',9609,200),(9631,'',9610,22),(9632,'',9611,200),(9633,'',9612,79),(9634,'',9613,548),(9635,'',9614,548),(9636,'',9615,79),(9637,'',9616,79),(9638,'',9617,548),(9639,'',9618,200),(9640,'',9619,120),(9641,'',9620,200),(9642,'',9621,200),(9643,'',9622,80),(9644,'',9623,89),(9645,'',9624,284),(9646,'',9625,548),(9647,'',9626,548),(9648,'',9627,548),(9649,'',9628,79),(9650,'',9629,79),(9651,'',9630,200),(9652,'',9631,548),(9653,'',9632,79),(9654,'',9633,200),(9655,'',9634,548),(9656,'',9635,548),(9657,'',9636,200),(9658,'',9637,284),(9659,'',9638,400),(9660,'',9639,548),(9661,'',9640,548),(9662,'',9641,79),(9663,'',9642,200),(9664,'',9643,78),(9665,'',9644,548),(9666,'',9645,200),(9667,'',9646,548),(9668,'',9647,78),(9669,'',9648,78),(9670,'',9649,284),(9671,'',9650,548),(9672,'',9651,548),(9673,'',9652,89),(9674,'',9653,548),(9675,'',9654,548),(9676,'',9655,548),(9677,'',9656,287),(9678,'',9657,200),(9679,'',9658,200),(9680,'',9659,22),(9681,'',9660,200),(9682,'',9661,78),(9683,'',9662,200),(9684,'',9663,2),(9685,'',9664,287),(9686,'',9665,548),(9687,'',9666,200),(9688,'',9667,548),(9689,'',9668,22),(9690,'',9669,22),(9691,'',9670,78),(9692,'',9671,89),(9693,'',9672,548),(9694,'',9673,79),(9695,'',9674,120),(9696,'',9675,200),(9697,'',9676,200),(9698,'',9677,287),(9699,'',9678,200),(9700,'',9679,548),(9701,'',9680,79),(9702,'',9681,200),(9703,'',9682,200),(9704,'',9683,548),(9705,'',9684,78),(9706,'',9685,200),(9707,'',9686,78),(9708,'',9687,200),(9709,'',9688,548),(9710,'',9689,548),(9711,'',9690,79),(9712,'',9691,287),(9713,'',9692,79),(9714,'',9693,200),(9715,'',9694,548),(9716,'',9695,548),(9717,'',9696,548),(9718,'',9697,548),(9719,'',9698,548),(9720,'',9699,287),(9721,'',9700,200),(9722,'',9701,548),(9723,'',9702,200),(9724,'',9703,79),(9725,'',9704,548),(9726,'',9705,79),(9727,'',9706,548),(9728,'',9707,643),(9729,'',9708,79),(9730,'',9709,200),(9731,'',9710,425),(9732,'',9711,200),(9733,'',9712,200),(9734,'',9713,548),(9735,'',9714,200),(9736,'',9715,200),(9737,'',9716,548),(9738,'',9717,79),(9739,'',9718,425),(9740,'',9719,200),(9741,'',9720,548),(9742,'',9721,79),(9743,'',9722,200),(9744,'',9723,548),(9745,'',9724,200),(9746,'',9725,78),(9747,'',9726,90),(9748,'',9727,200),(9749,'',9728,200),(9750,'',9729,200),(9751,'',9730,284),(9752,'',9731,284),(9753,'',9732,548),(9754,'',9733,79),(9755,'',9734,120),(9756,'',9735,287),(9757,'',9736,284),(9758,'',9737,79),(9759,'',9738,284),(9760,'',9739,548),(9761,'',9740,79),(9762,'',9741,548),(9763,'',9742,548),(9764,'',9743,200),(9765,'',9744,79),(9766,'',9745,200),(9767,'',9746,89),(9768,'',9747,78),(9769,'',9748,284),(9770,'',9749,200),(9771,'',9750,200),(9772,'',9751,200),(9773,'',9752,16),(9774,'',9753,89),(9775,'',9754,200),(9776,'',9755,200),(9777,'',9756,200),(9778,'',9757,284),(9779,'',9758,200),(9780,'',9759,548),(9781,'',9760,548),(9782,'',9761,200),(9783,'',9762,200),(9784,'',9763,284),(9785,'',9764,521),(9786,'',9765,200),(9787,'',9766,284),(9788,'',9767,548),(9789,'',9768,22),(9790,'',9769,200),(9791,'',9770,284),(9792,'',9771,548),(9793,'',9772,200),(9794,'',9773,79),(9795,'',9774,287),(9796,'',9775,79),(9797,'',9776,548),(9798,'',9777,548),(9799,'',9778,548),(9800,'',9779,548),(9801,'',9780,284),(9802,'',9781,79),(9803,'',9782,799),(9804,'',9783,200),(9805,'',9784,79),(9806,'',9785,78),(9807,'',9786,200),(9808,'',9787,287),(9809,'',9788,78),(9810,'',9789,200),(9811,'',9790,200),(9812,'',9791,200),(9813,'',9792,79),(9814,'',9793,200),(9815,'',9794,120),(9816,'',9795,200),(9817,'',9796,548),(9818,'',9797,16),(9819,'',9798,284),(9820,'',9799,548),(9821,'',9800,548),(9822,'',9801,200),(9823,'',9802,200),(9824,'',9803,89),(9825,'',9804,548),(9826,'',9805,200),(9827,'',9806,200),(9828,'',9807,287),(9829,'',9808,548),(9830,'',9809,79),(9831,'',9810,548),(9832,'',9811,200),(9833,'',9812,22),(9834,'',9813,200),(9835,'',9814,548),(9836,'',9815,200),(9837,'',9816,200),(9838,'',9817,22),(9839,'',9818,548),(9840,'',9819,16),(9841,'',9820,94),(9842,'',9821,434),(9843,'',9822,284),(9844,'',9823,284),(9845,'',9824,200),(9846,'',9825,200),(9847,'',9826,89),(9848,'',9827,548),(9849,'',9828,79),(9850,'',9829,200),(9851,'',9830,79),(9852,'',9831,79),(9853,'',9832,89),(9854,'',9833,548),(9855,'',9834,78),(9856,'',9835,284),(9857,'',9836,200),(9858,'',9837,200),(9859,'',9838,548),(9860,'',9839,200),(9861,'',9840,78),(9862,'',9841,200),(9863,'',9842,200),(9864,'',9843,89),(9865,'',9844,200),(9866,'',9845,16),(9867,'',9846,22),(9868,'',9847,548),(9869,'',9848,200),(9870,'',9849,548),(9871,'',9850,200),(9872,'',9851,200),(9873,'',9852,79),(9874,'',9853,287),(9875,'',9854,284),(9876,'',9855,548),(9877,'',9856,548),(9878,'',9857,548),(9879,'',9858,287),(9880,'',9859,79),(9881,'',9860,287),(9882,'',9861,79),(9883,'',9862,284),(9884,'',9863,89),(9885,'',9864,548),(9886,'',9865,400),(9887,'',9866,548),(9888,'',9867,425),(9889,'',9868,284),(9890,'',9869,548),(9891,'',9870,22),(9892,'',9871,78),(9893,'',9872,548),(9894,'',9873,200),(9895,'',9874,200),(9896,'',9875,548),(9897,'',9876,548),(9898,'',9877,78),(9899,'',9878,22),(9900,'',9879,89),(9901,'',9880,78),(9902,'',9881,548),(9903,'',9882,200),(9904,'',9883,78),(9905,'',9884,200),(9906,'',9885,200),(9907,'',9886,284),(9908,'',9887,200),(9909,'',9888,79),(9910,'',9889,120),(9911,'',9890,200),(9912,'',9891,548),(9913,'',9892,548),(9914,'',9893,79),(9915,'',9894,200),(9916,'',9895,548),(9917,'',9896,548),(9918,'',9897,78),(9919,'',9898,425),(9920,'',9899,200),(9921,'',9900,200),(9922,'',9901,548),(9923,'',9902,284),(9924,'',9903,89),(9925,'',9904,548),(9926,'',9905,200),(9927,'',9906,200),(9928,'',9907,200),(9929,'',9908,200),(9930,'',9909,200),(9931,'',9910,79),(9932,'',9911,548),(9933,'',9912,548),(9934,'',9913,22),(9935,'',9914,78),(9936,'',9915,284),(9937,'',9916,200),(9938,'',9917,78),(9939,'',9918,521),(9940,'',9919,548),(9941,'',9920,200),(9942,'',9921,200),(9943,'',9922,548),(9944,'',9923,79),(9945,'',9924,22),(9946,'',9925,284),(9947,'',9926,79),(9948,'',9927,200),(9949,'',9928,548),(9950,'',9929,200),(9951,'',9930,548),(9952,'',9931,22),(9953,'',9932,200),(9954,'',9933,89),(9955,'',9934,548),(9956,'',9935,548),(9957,'',9936,284),(9958,'',9937,425),(9959,'',9938,79),(9960,'',9939,548),(9961,'',9940,200),(9962,'',9941,548),(9963,'',9942,200),(9964,'',9943,200),(9965,'',9944,79),(9966,'',9945,548),(9967,'',9946,79),(9968,'',9947,200),(9969,'',9948,89),(9970,'',9949,89),(9971,'',9950,200),(9972,'',9951,284),(9973,'',9952,200),(9974,'',9953,200),(9975,'',9954,548),(9976,'',9955,89),(9977,'',9956,284),(9978,'',9957,548),(9979,'',9958,287),(9980,'',9959,284),(9981,'',9960,200),(9982,'',9961,548),(9983,'',9962,200),(9984,'',9963,200),(9985,'',9964,287),(9986,'',9965,200),(9987,'',9966,200),(9988,'',9967,548),(9989,'',9968,200),(9990,'',9969,200),(9991,'',9970,98),(9992,'',9971,359),(9993,'',9972,287),(9994,'',9973,79),(9995,'',9974,89),(9996,'',9975,284),(9997,'',9976,548),(9998,'',9977,89),(9999,'',9978,79),(10000,'',9979,548),(10001,'',9980,200),(10002,'',9981,548),(10003,'',9982,22),(10004,'',9983,200),(10005,'',9984,400),(10006,'',9985,200),(10007,'',9986,200),(10008,'',9987,200),(10009,'',9988,22),(10010,'',9989,284),(10011,'',9990,548),(10012,'',9991,22),(10013,'',9992,548),(10014,'',9993,284),(10015,'',9994,548),(10016,'',9995,16),(10017,'',9996,287),(10018,'',9997,284),(10019,'',9998,200),(10020,'',9999,78),(10021,'',10000,548),(10022,'',10001,400),(10023,'',10002,200),(10024,'',10003,548),(10025,'',10004,79),(10026,'',10005,284),(10027,'',10006,548),(10028,'',10007,200),(10029,'',10008,284),(10030,'',10009,79),(10031,'',10010,22),(10032,'',10011,434),(10033,'',10012,548),(10034,'',10013,200),(10035,'',10014,548),(10036,'',10015,78),(10037,'',10016,78),(10038,'',10017,89),(10039,'',NULL,200),(10040,'',10019,89),(10041,'',10020,287),(10042,'',10021,89),(10043,'',10022,548),(10044,'',10023,79),(10045,'',10024,200),(10046,'',10025,79),(10047,'',10026,79),(10048,'',10027,200),(10049,'',10028,548),(10050,'',10029,200),(10051,'',10030,548),(10052,'',10031,22),(10053,'',10032,200),(10054,'',10033,284),(10055,'',10034,287),(10056,'',10035,548),(10057,'',10036,200),(10058,'',10037,548),(10059,'',10038,79),(10060,'',10039,287),(10061,'',10040,548),(10062,'',10041,548),(10063,'',10042,78),(10064,'',10043,287),(10065,'',10044,200),(10066,'',10045,200),(10067,'',10046,79),(10068,'',10047,22),(10069,'',10048,548),(10070,'',10049,200),(10071,'',10050,200),(10072,'',10051,548),(10073,'',10052,89),(10074,'',10053,16),(10075,'',10054,79),(10076,'',10055,200),(10077,'',10056,548),(10078,'',10057,284),(10079,'',10058,200),(10080,'',10059,548),(10081,'',10060,425),(10082,'',10061,200),(10083,'',10062,287),(10084,'',10063,200),(10085,'',10064,548),(10086,'',10065,22),(10087,'',10066,89),(10088,'',10067,287),(10089,'',10068,200),(10090,'',10069,79),(10091,'',10070,548),(10092,'',10071,200),(10093,'',10072,284),(10094,'',10073,400),(10095,'',10074,89),(10096,'',10075,287),(10097,'',10076,200),(10098,'',10077,548),(10099,'',10078,200),(10100,'',10079,548),(10101,'',10080,548),(10102,'',10081,548),(10103,'',10082,79),(10104,'',10083,548),(10105,'',10084,79),(10106,'',10085,79),(10107,'',10086,548),(10108,'',10087,548),(10109,'',10088,200),(10110,'',10089,78),(10111,'',10090,78),(10112,'',10091,548),(10113,'',10092,200),(10114,'',10093,200),(10115,'',10094,200),(10116,'',10095,284),(10117,'',10096,78),(10118,'',10097,287),(10119,'',10098,200),(10120,'',10099,548),(10121,'',10100,200),(10122,'',10101,284),(10123,'',10102,200),(10124,'',10103,548),(10125,'',10104,200),(10126,'',10105,79),(10127,'',10106,79),(10128,'',10107,200),(10129,'',10108,284),(10130,'',10109,79),(10131,'',10110,284),(10132,'',10111,200),(10133,'',10112,200),(10134,'',10113,200),(10135,'',10114,79),(10136,'',10115,79),(10137,'',10116,78),(10138,'',10117,89),(10139,'',10118,16),(10140,'',10119,22),(10141,'',10120,548),(10142,'',10121,78),(10143,'',10122,200),(10144,'',10123,78),(10145,'',10124,200),(10146,'',10125,200),(10147,'',10126,79),(10148,'',10127,200),(10149,'',10128,287),(10150,'',10129,78),(10151,'',10130,78),(10152,'',10131,548),(10153,'',10132,548),(10154,'',10133,200),(10155,'',10134,79),(10156,'',10135,78),(10157,'',10136,89),(10158,'',10137,200),(10159,'',10138,548),(10160,'',10139,548),(10161,'',10140,200),(10162,'',10141,548),(10163,'',10142,601),(10164,'',10143,22),(10165,'',10144,200),(10166,'',10145,200),(10167,'',10146,79),(10168,'',10147,79),(10169,'',10148,548),(10170,'',10149,200),(10171,'',10150,284),(10172,'',10151,89),(10173,'',10152,548),(10174,'',10153,16),(10175,'',10154,79),(10176,'',10155,548),(10177,'',10156,78),(10178,'',10157,200),(10179,'',10158,79),(10180,'',10159,400),(10181,'',10160,79),(10182,'',10161,548),(10183,'',10162,284),(10184,'',10163,284),(10185,'',10164,200),(10186,'',10165,284),(10187,'',10166,200),(10188,'',10167,22),(10189,'',10168,200),(10190,'',NULL,79),(10191,'',10170,78),(10192,'',10171,200),(10193,'',10172,79),(10194,'',10173,22),(10195,'',10174,548),(10196,'',10175,200),(10197,'',10176,79),(10198,'',10177,79),(10199,'',10178,425),(10200,'',10179,200),(10201,'',10180,78),(10202,'',10181,200),(10203,'',10182,79),(10204,'',10183,287),(10205,'',10184,200),(10206,'',10185,284),(10207,'',10186,78),(10208,'',10187,200),(10209,'',10188,200),(10210,'',10189,79),(10211,'',10190,287),(10212,'',10191,200),(10213,'',10192,200),(10214,'',10193,120),(10215,'',10194,79),(10216,'',10195,79),(10217,'',10196,548),(10218,'',10197,287),(10219,'',10198,200),(10220,'',10199,548),(10221,'',10200,79),(10222,'',10201,200),(10223,'',10202,200),(10224,'',10203,548),(10225,'',10204,79),(10226,'',10205,78),(10227,'',10206,200),(10228,'',10207,200),(10229,'',10208,548),(10230,'',10209,200),(10231,'',10210,548),(10232,'',10211,200),(10233,'',10212,79),(10234,'',10213,89),(10235,'',10214,548),(10236,'',10215,79),(10237,'',10216,79),(10238,'',10217,89),(10239,'',10218,284),(10240,'',10219,22),(10241,'',10220,548),(10242,'',10221,434),(10243,'',10222,425),(10244,'',10223,200),(10245,'',10224,200),(10246,'',10225,200),(10247,'',10226,79),(10248,'',10227,200),(10249,'',10228,78),(10250,'',10229,120),(10251,'',10230,79),(10252,'',10231,284),(10253,'',10232,200),(10254,'',10233,200),(10255,'',10234,200),(10256,'',10235,497),(10257,'',10236,200),(10258,'',10237,79),(10259,'',10238,22),(10260,'',10239,284),(10261,'',10240,200),(10262,'',10241,388),(10263,'',NULL,284),(10264,'',10243,284),(10265,'',10244,200),(10266,'',10245,284),(10267,'',10246,78),(10268,'',10247,22),(10269,'',10248,200),(10270,'',10249,79),(10271,'',10250,200),(10272,'',10251,284),(10273,'',10252,78),(10274,'',10253,200),(10275,'',10254,548),(10276,'',10255,548),(10277,'',10256,548),(10278,'',10257,548),(10279,'',10258,200),(10280,'',10259,22),(10281,'',10260,78),(10282,'',10261,548),(10283,'',10262,548),(10284,'',10263,200),(10285,'',10264,200),(10286,'',10265,200),(10287,'',10266,200),(10288,'',10267,89),(10289,'',10268,200),(10290,'',10269,79),(10291,'',10270,22),(10292,'',10271,89),(10293,'',10272,284),(10294,'',10273,200),(10295,'',10274,79),(10296,'',NULL,79),(10297,'',10276,200),(10298,'',10277,79),(10299,'',10278,79),(10300,'',10279,200),(10301,'',10280,22),(10302,'',10281,200),(10303,'',10282,548),(10304,'',10283,548),(10305,'',10284,200),(10306,'',10285,89),(10307,'',10286,287),(10308,'',10287,548),(10309,'',10288,284),(10310,'',10289,120),(10311,'',10290,89),(10312,'',10291,78),(10313,'',10292,548),(10314,'',10293,200),(10315,'',10294,79),(10316,'',10295,200),(10317,'',10296,200),(10318,'',10297,16),(10319,'',10298,287),(10320,'',10299,79),(10321,'',10300,89),(10322,'',10301,200),(10323,'',10302,79),(10324,'',10303,284),(10325,'',10304,548),(10326,'',10305,284),(10327,'',10306,78),(10328,'',10307,200),(10329,'',10308,89),(10330,'',10309,79),(10331,'',10310,89),(10332,'',10311,287),(10333,'',10312,200),(10334,'',10313,89),(10335,'',10314,400),(10336,'',10315,548),(10337,'',10316,89),(10338,'',10317,89),(10339,'',10318,200),(10340,'',10319,200),(10341,'',10320,200),(10342,'',10321,548),(10343,'',10322,548),(10344,'',10323,548),(10345,'',10324,548),(10346,'',10325,200),(10347,'',10326,548),(10348,'',10327,548),(10349,'',10328,521),(10350,'',10329,79),(10351,'',10330,79),(10352,'',10331,200),(10353,'',10332,79),(10354,'',10333,284),(10355,'',10334,548),(10356,'',10335,200),(10357,'',10336,548),(10358,'',10337,98),(10359,'',10338,79),(10360,'',10339,548),(10361,'',10340,548),(10362,'',10341,200),(10363,'',10342,78),(10364,'',10343,79),(10365,'',10344,548),(10366,'',10345,200),(10367,'',10346,22),(10368,'',10347,284),(10369,'',10348,200),(10370,'',10349,89),(10371,'',10350,548),(10372,'',10351,284),(10373,'',10352,78),(10374,'',10353,79),(10375,'',10354,89),(10376,'',10355,200),(10377,'',10356,79),(10378,'',10357,22),(10379,'',10358,200),(10380,'',10359,79),(10381,'',10360,284),(10382,'',10361,79),(10383,'',10362,200),(10384,'',10363,284),(10385,'',10364,287),(10386,'',10365,200),(10387,'',10366,434),(10388,'',10367,548),(10389,'',10368,200),(10390,'',10369,548),(10391,'',10370,78),(10392,'',10371,79),(10393,'',10372,89),(10394,'',10373,284),(10395,'',10374,548),(10396,'',10375,78),(10397,'',10376,200),(10398,'',10377,200),(10399,'',10378,79),(10400,'',10379,79),(10401,'',10380,22),(10402,'',10381,79),(10403,'',10382,200),(10404,'',10383,22),(10405,'',10384,200),(10406,'',10385,284),(10407,'',10386,548),(10408,'',10387,79),(10409,'',10388,284),(10410,'',10389,548),(10411,'',10390,78),(10412,'',10391,200),(10413,'',10392,200),(10414,'',10393,284),(10415,'',10394,548),(10416,'',10395,287),(10417,'',10396,548),(10418,'',10397,79),(10419,'',10398,79),(10420,'',10399,200),(10421,'',10400,79),(10422,'',10401,79),(10423,'',10402,200),(10424,'',10403,284),(10425,'',10404,200),(10426,'',10405,200),(10427,'',10406,22),(10428,'',10407,548),(10429,'',10408,284),(10430,'',10409,79),(10431,'',10410,89),(10432,'',10411,548),(10433,'',10412,79),(10434,'',10413,79),(10435,'',10414,548),(10436,'',10415,548),(10437,'',10416,200),(10438,'',10417,200),(10439,'',10418,425),(10440,'',10419,284),(10441,'',10420,284),(10442,'',10421,200),(10443,'',10422,287),(10444,'',NULL,90),(10445,'',NULL,601),(10446,'',10425,640),(10447,'',NULL,97),(10448,'',NULL,120),(10449,'',10428,78),(10450,'',NULL,425),(10451,'',NULL,384),(10452,'',NULL,89),(10453,'',10432,716),(10454,'',10433,34),(10455,'',NULL,22),(10456,'',NULL,79),(10457,'',NULL,98),(10458,'',NULL,200),(10459,'',NULL,78),(10460,'',NULL,287),(10461,'',NULL,307),(10462,'',NULL,290),(10463,'',10442,134),(10464,'',NULL,613),(10465,'',NULL,285),(10466,'',10445,400),(10467,'',NULL,113),(10468,'',NULL,284),(10469,'',NULL,284),(10470,'',NULL,311),(10471,'',NULL,16),(10472,'',NULL,16),(10473,'',NULL,287),(10474,'',NULL,287),(10475,'',NULL,592),(10476,'',NULL,327),(10477,'',NULL,312),(10478,'',NULL,90),(10479,'',NULL,480),(10480,'',NULL,79),(10481,'',NULL,312),(10482,'',NULL,326),(10483,'',NULL,327),(10484,'',NULL,327),(10485,'',NULL,111),(10486,'',NULL,489),(10487,'',NULL,400),(10488,'',NULL,400),(10489,'',NULL,400),(10490,'',NULL,74),(10491,'',NULL,276),(10492,'',NULL,74),(10493,'',NULL,388),(10494,'',NULL,321),(10495,'',NULL,321),(10496,'',NULL,321),(10497,'',NULL,547),(10498,'',NULL,547),(10499,'',NULL,259),(10500,'',NULL,113),(10501,'',NULL,113),(10502,'',NULL,113),(10503,'',NULL,113),(10504,'',NULL,295),(10505,'',NULL,66),(10506,'',NULL,200),(10507,'',NULL,200),(10508,'',NULL,200),(10509,'',NULL,200),(10510,'',NULL,200),(10511,'',NULL,200),(10512,'',NULL,200),(10513,'',NULL,200),(10514,'',NULL,200),(10515,'',NULL,74),(10516,'',NULL,78),(10517,'',NULL,74),(10518,'',NULL,74),(10519,'',NULL,74),(10520,'',NULL,74),(10521,'',NULL,74),(10522,'',NULL,91),(10523,'',NULL,74),(10524,'',NULL,74),(10525,'',NULL,89),(10526,'',NULL,89),(10527,'',NULL,91),(10528,'',NULL,74),(10529,'',NULL,74),(10530,'',NULL,74),(10531,'',NULL,74),(10532,'',NULL,74),(10533,'',NULL,327),(10534,'',NULL,327),(10535,'',NULL,327),(10536,'',NULL,327),(10537,'',NULL,327),(10538,'',NULL,327),(10539,'',NULL,327),(10540,'',NULL,285),(10541,'',NULL,285),(10542,'',NULL,285),(10543,'',NULL,613),(10544,'',NULL,311),(10545,'',NULL,506),(10546,'',NULL,94),(10547,'',NULL,601),(10548,'',NULL,506),(10549,'',NULL,94),(10550,'',NULL,601),(10551,'',NULL,862),(10552,'',NULL,565),(10553,'',NULL,78),(10554,'',NULL,264),(10555,'',NULL,22),(10556,'',NULL,530),(10557,'',NULL,352),(10558,'',NULL,79),(10559,'',NULL,352),(10560,'',NULL,565),(10561,'',NULL,352),(10562,'',NULL,352),(10563,'',NULL,79),(10564,'',NULL,352),(10565,'',NULL,565),(10566,'',NULL,352),(10567,'',NULL,98),(10568,'',NULL,79),(10569,'',NULL,532),(10570,'',NULL,532),(10571,'',NULL,532),(10572,'',NULL,200),(10573,'',NULL,311),(10574,'',NULL,311),(10575,'',NULL,311),(10576,'',NULL,311),(10577,'',NULL,311),(10578,'',NULL,327),(10579,'',NULL,470),(10580,'',NULL,759),(10581,'',NULL,614),(10582,'',NULL,470),(10583,'',NULL,319),(10584,'',NULL,601),(10585,'',10558,840),(10586,'',NULL,307),(10587,'',10559,384),(10588,'',NULL,352),(10589,'',NULL,400),(10590,'',NULL,548),(10591,'',NULL,799),(10592,'',NULL,287),(10593,'',NULL,285),(10594,'',NULL,640),(10595,'',10565,841),(10596,'',NULL,613),(10597,'',NULL,384),(10598,'',NULL,16),(10599,'',NULL,120),(10600,'',NULL,290),(10601,'',NULL,79),(10602,'',10567,548),(10603,'',NULL,205),(10604,'',NULL,134),(10605,'',NULL,444),(10606,'',NULL,113),(10607,'',NULL,444),(10608,'',NULL,113),(10609,'',NULL,280),(10610,'',NULL,20),(10611,'',NULL,116),(10612,'',NULL,200),(10613,'',NULL,311),(10614,'',NULL,190),(10615,'',NULL,90),(10616,'',NULL,88),(10617,'',NULL,158),(10618,'',NULL,78),(10619,'',NULL,22),(10620,'',NULL,425),(10621,'',NULL,73),(10622,'',NULL,441),(10623,'',NULL,16),(10624,'',NULL,789),(10625,'',NULL,89),(10626,'',NULL,97),(10627,'',NULL,601),(10628,'',NULL,91),(10629,'',NULL,91),(10630,'',NULL,91),(10631,'',NULL,91),(10632,'',10586,91),(10633,'',NULL,91),(10634,'',NULL,525),(10635,'',NULL,263),(10636,'',NULL,565),(10637,'',NULL,209),(10638,'',NULL,285),(10639,'',NULL,521),(10640,'',NULL,539),(10641,'',NULL,352),(10642,'',NULL,16),(10643,'',NULL,359),(10644,'',10598,79),(10645,'',10599,601),(10646,'',10600,200),(10647,'',10601,209),(10648,'',10602,200),(10649,'',10603,327),(10650,'',10604,200),(10651,'',10605,632),(10652,'',10606,400),(10653,'',10607,691),(10654,'',10608,632),(10655,'',10609,300),(10656,'',10610,90),(10657,'',10611,16),(10658,'',10612,200),(10659,'',10613,444),(10660,'',10614,601),(10661,'',10615,548),(10662,'',10616,79),(10663,'',10617,326),(10664,'',10618,311),(10665,'',10619,158),(10666,'',10620,16),(10667,'',10621,280),(10668,'',10622,22),(10669,'',10623,632),(10670,'',10624,97),(10671,'',10625,79),(10672,'',10626,89),(10673,'',10627,632),(10674,'',10628,120),(10675,'',10629,400),(10676,'',10630,326),(10677,'',10631,190),(10678,'',10632,116),(10679,'',10633,116),(10680,'',10634,134),(10681,'',10635,632),(10682,'',10636,91),(10683,'',10637,436),(10684,'',10638,548),(10685,'',10639,89),(10686,'',10640,425),(10687,'',10641,384),(10688,'',10642,311),(10689,'',10643,200),(10690,'',10644,632),(10691,'',10645,525),(10692,'',10646,16),(10693,'',10647,16),(10694,'',10648,20),(10695,'',10649,643),(10696,'',10650,352),(10697,'',10651,89),(10698,'',10652,307),(10699,'',10653,77),(10700,'',10654,16),(10701,'',10655,227),(10702,'',10656,16),(10703,'',10657,611),(10704,'',10658,16),(10705,'',10659,640),(10706,'',10660,22),(10707,'',10661,79),(10708,'',10662,330),(10709,'',10663,79),(10710,'',10664,632),(10711,'',10665,98),(10712,'',10666,776),(10713,'',10667,650),(10714,'',10668,548),(10715,'',10669,200),(10716,'',10670,612),(10717,'',10671,287),(10718,'',10672,78),(10719,'',10673,89),(10720,'',10674,352),(10721,'',10675,632),(10722,'',10676,525),(10723,'',10677,200),(10724,'',10678,89),(10725,'',10679,525),(10726,'',10680,632),(10727,'',10681,425),(10728,'',10682,79),(10729,'',10683,97),(10730,'',10684,345),(10731,'',10685,525),(10732,'',10686,789),(10733,'',10687,472),(10734,'',10688,200),(10735,'',10689,632),(10736,'',10690,97),(10737,'',10691,88),(10738,'',10692,79),(10739,'',10693,16),(10740,'',10694,613),(10741,'',10695,200),(10742,'',10696,632),(10743,'',10697,16),(10744,'',10698,284),(10745,'',10699,89),(10746,'',10700,16),(10747,'',10701,134),(10748,'',10702,200),(10749,'',10703,200),(10750,'',10704,205),(10751,'',10705,799),(10752,'',10706,652),(10753,'',10707,93),(10754,'',10708,113),(10755,'',10709,113),(10756,'',10710,326),(10757,'',10711,941),(10758,'',10712,942),(10759,'',10713,943),(10760,'',10714,944),(10761,'',10715,945),(10762,'',10716,946),(10763,'',10717,947),(10764,'',10718,948),(10765,'',10719,949),(10766,'',10720,950),(10767,'',10721,951),(10768,'',10722,952),(10769,'',10723,953),(10770,'',10724,954),(10771,'',10725,955),(10772,'',10726,956),(10773,'',10727,957),(10774,'',10728,958),(10775,'',10729,959),(10776,'',10730,960),(10777,'',10731,961),(10778,'',10732,962),(10779,'',10733,963),(10780,'',10734,964),(10781,'',10735,965),(10782,'',10736,966),(10783,'',10737,967),(10784,'',10738,968),(10785,'',10739,969),(10786,'',10740,970),(10787,'',10741,971),(10788,'',10742,972),(10789,'',10743,973),(10790,'',10744,974),(10791,'',10745,975),(10792,'',10746,976),(10793,'',10747,977),(10794,'',10748,978),(10795,'',10749,979),(10796,'',10750,980),(10797,'',10751,981),(10798,'',10752,982),(10799,'',10753,983),(10800,'',10754,984),(10801,'',10755,985),(10802,'',10756,986),(10803,'',10757,987),(10804,'',10758,988),(10805,'',10759,989),(10806,'',10760,990),(10807,'',10761,991),(10808,'',10762,992),(10809,'',10763,993),(10810,'',10764,994),(10811,'',10765,995),(10812,'',10766,996),(10813,'',10767,997),(10814,'',10768,998),(10815,'',10769,999),(10816,'',6136,209),(10817,'',10770,16),(10818,'',10771,16),(10819,'',10772,16),(10820,'',10773,16),(10821,'',10774,284),(10822,'',10775,284),(10823,'',10776,284),(10824,'',10777,284),(10825,'',10778,352),(10826,'',10779,16),(10827,'',10780,16),(10828,'',10781,274),(10829,'',10782,16),(10830,'',10783,434),(10831,'',10784,242),(10832,'',10785,16),(10833,'',10786,94),(10834,'',10787,73),(10835,'',10788,73),(10836,'',10789,89),(10837,'',10790,79),(10838,'',10791,326),(10839,'',10792,295),(10840,'',10793,295),(10841,'',10794,295),(10842,'',10795,295),(10843,'',10796,79),(10844,'',10797,113),(10845,'',10798,95),(10846,'',10799,494),(10847,'',10800,20),(10848,'',10801,16),(10849,'',10802,16),(10850,'',10803,16),(10851,'',10804,16),(10852,'',10805,16),(10853,'',10806,16),(10854,'',10807,16),(10855,'',10808,16),(10856,'',10809,16),(10857,'',10810,16),(10858,'',10811,16),(10859,'',10812,16),(10860,'',10813,16),(10861,'',10814,16),(10862,'',10815,16),(10863,'',10816,16),(10864,'',10817,16),(10865,'',10818,16),(10866,'',10819,16),(10867,'',10820,16),(10868,'',10821,16),(10869,'',10822,16),(10870,'',10823,16),(10871,'',10824,16),(10872,'',10825,16),(10873,'',10826,99),(10874,'',10827,538),(10875,'',10828,200),(10876,'',10829,16),(10877,'',10830,538),(10878,'',10831,16),(10879,'',10832,284),(10880,'',10833,489),(10881,'',10834,804),(10882,'',NULL,16),(10883,'',10836,538),(10884,'',10837,16),(10885,'',10838,16),(10886,'',10839,538),(10887,'',10840,16),(10888,'',10841,16),(10889,'',10842,16),(10890,'',10843,16),(10891,'',10844,200),(10892,'',10845,200),(10893,'',10846,16),(10894,'',10847,16),(10895,'',10848,538),(10896,'',10849,79),(10897,'',10850,598),(10898,'',10851,540),(10899,'',10852,540),(10900,'',10853,287),(10901,'',10854,287),(10902,'',10855,287),(10903,'',10856,200),(10904,'',10857,200),(10905,'',10858,200),(10906,'',10859,200),(10907,'',10860,200),(10908,'',10861,200),(10909,'',10862,693),(10910,'',10863,16),(10911,'',10864,444),(10912,'',10865,444),(10913,'',10866,525),(10914,'',10867,200),(10915,'',10868,668),(10916,'',10869,668),(10917,'',10870,352),(10918,'',10871,200),(10919,'',10872,200),(10920,'',10835,16),(10921,'',10873,113),(10922,'',10874,113),(10923,'',10875,16),(10924,'',10876,16),(10925,'',10877,200),(10926,'',10878,200),(10927,'',10879,200),(10928,'',10880,393),(10929,'',10881,434),(10930,'',10882,79),(10931,'',10883,16),(10932,'',10884,710),(10933,'',10885,16),(10934,'',10886,200),(10935,'',10887,79),(10936,'',10888,16),(10937,'',10889,209),(10938,'',10890,200),(10939,'',10891,113),(10940,'',10892,200),(10941,'',10893,200),(10942,'',10894,261),(10943,'',10895,16),(10944,'',10896,16),(10945,'',10897,16),(10946,'',10898,200),(10947,'',10899,261),(10948,'',10900,79),(10949,'',10901,16),(10950,'',10902,16),(10951,'',10903,200),(10952,'',10904,200),(10953,'',10905,200),(10954,'',10906,200),(10955,'',10907,16),(10956,'',10908,16),(10957,'',10909,16),(10958,'',10910,16),(10959,'',10911,16),(10960,'',10912,200),(10961,'',10913,200),(10962,'',10914,200),(10963,'',10915,16),(10964,'',10916,16),(10965,'',10917,16),(10966,'',10918,200),(10967,'',10919,16),(10968,'',10920,16),(10969,'',10921,113),(10970,'',10922,113),(10971,'',10923,113),(10972,'',10924,16),(10973,'',10925,16),(10974,'',10926,200),(10975,'',10927,200),(10976,'',10928,200),(10977,'',10929,89),(10978,'',10930,16),(10979,'',10931,16),(10980,'',10932,434),(10981,'',10933,77),(10982,'',10934,94),(10983,'',10935,89),(10984,'',10936,434),(10985,'',10937,16),(10986,'',4853,425),(10987,'',4854,287),(10988,'',4855,209),(10989,'',4856,540),(10990,'',4857,200),(10991,'',4858,425),(10992,'',4859,540),(10993,'',4860,209),(10994,'',4861,425),(10995,'',4862,79),(10996,'',4863,200),(10997,'',4864,548),(10998,'',4865,548),(10999,'',4866,548),(11000,'',4867,425),(11001,'',4868,79),(11002,'',4869,200),(11003,'',4870,540),(11004,'',4871,209),(11005,'',4872,818),(11006,'',4873,425),(11007,'',4874,200),(11008,'',4875,200),(11009,'',4876,200),(11010,'',4877,298),(11011,'',4878,200),(11012,'',4879,425),(11013,'',4880,425),(11014,'',4881,200),(11015,'',4882,200),(11016,'',4884,400),(11017,'',4885,672),(11018,'',4886,200),(11019,'',4887,201),(11020,'',4888,540),(11021,'',4889,672),(11022,'',4890,200),(11023,'',4891,425),(11024,'',4892,94),(11025,'',4893,89),(11026,'',4894,200),(11027,'',4895,425),(11028,'',4896,200),(11029,'',4897,200),(11030,'',4898,425),(11031,'',4899,731),(11032,'',4900,200),(11033,'',4901,200),(11034,'',4902,200),(11035,'',4746,16),(11036,'',4747,79),(11037,'',10938,200),(11038,'',4721,79),(11039,'',4757,16),(11040,'',10939,16),(11041,'',NULL,352),(11042,'',NULL,16),(11043,'',10942,209),(11044,'',10943,425),(11045,'',10944,200),(11046,'',10945,78),(11047,'',10946,540),(11048,'',10947,77),(11049,'',10948,539),(11050,'',10940,352),(11051,'',10949,352),(11052,'',10950,200),(11053,'',10951,79),(11054,'',10952,200),(11055,'',10953,672),(11056,'',10954,917),(11057,'',10955,200),(11058,'',10956,200),(11059,'',10957,200),(11060,'',10958,818),(11061,'',10959,818),(11062,'',10960,818),(11063,'',10961,818),(11064,'',10962,818),(11065,'',10941,16),(11066,'',10963,540),(11067,'',10964,532),(11068,'',10965,200),(11069,'',10966,672),(11070,'',10967,538),(11071,'',10968,200),(11072,'',10969,538),(11073,'',10970,200),(11074,'',10971,672),(11075,'',10972,200),(11076,'',10973,16),(11077,'',10974,200),(11078,'',10975,672),(11079,'',10976,400),(11080,'',10977,538),(11081,'',10978,200),(11082,'',10979,672),(11083,'',10980,672),(11084,'',10981,200),(11085,'',10982,16),(11086,'',10983,672),(11087,'',10984,16),(11088,'',10985,200),(11089,'',10986,672),(11090,'',10987,16),(11091,'',10988,540),(11092,'',10989,200),(11093,'',10990,672),(11094,'',10991,200),(11095,'',10992,200),(11096,'',10993,77),(11097,'',10994,200),(11098,'',10995,917),(11099,'',10996,94),(11100,'',10997,94),(11101,'',10998,94),(11102,'',10999,540),(11103,'',11000,94),(11104,'',11001,94),(11105,'',11002,94),(11106,'',11003,540),(11107,'',11004,200),(11108,'',11005,200),(11109,'',11006,200),(11110,'',11007,818),(11111,'',11008,16),(11112,'',11009,200),(11113,'',11010,672),(11114,'',11011,200),(11115,'',11012,200),(11116,'',11013,200),(11117,'',11014,200),(11118,'',11015,16),(11119,'',11016,200),(11120,'',11017,200),(11121,'',11018,284),(11122,'',11019,538),(11123,'',11020,16),(11124,'',11021,200),(11125,'',11022,200),(11126,'',11023,200),(11127,'',11024,672),(11128,'',11025,532),(11129,'',2838,120),(11130,'',2839,190),(11131,'',2840,658),(11132,'',2841,193),(11133,'',2842,275),(11134,'',2843,89),(11135,'',2844,201),(11136,'',2845,311),(11137,'',2846,693),(11138,'',2847,200),(11139,'',2848,201),(11140,'',2849,477),(11141,'',2850,398),(11142,'',2851,730),(11143,'',2852,284),(11144,'',2853,311),(11145,'',2854,785),(11146,'',2855,79),(11147,'',2856,643),(11148,'',NULL,477),(11149,'',NULL,665),(11150,'',2859,658),(11151,'',2860,134),(11152,'',2857,477),(11153,'',2858,665),(11154,'',2861,284),(11155,'',2862,398),(11156,'',2863,398),(11157,'',2864,398),(11158,'',2865,398),(11159,'',2866,398),(11160,'',2867,477),(11161,'',2868,398),(11162,'',2869,398),(11163,'',2870,398),(11164,'',2871,398),(11165,'',2872,398),(11166,'',2873,661),(11167,'',2874,661),(11168,'',2875,661),(11169,'',2876,352),(11170,'',2877,89),(11171,'',2878,89),(11172,'',2879,89),(11173,'',2880,89),(11174,'',2881,89),(11175,'',2882,477),(11176,'',2883,477),(11177,'',2884,477),(11178,'',2885,477),(11179,'',2886,477),(11180,'',2887,201),(11181,'',2888,730),(11182,'',2889,547),(11183,'',2890,644),(11184,'',2891,98),(11185,'',2892,398),(11186,'',2893,398),(11187,'',2894,398),(11188,'',2895,398),(11189,'',2896,398),(11190,'',2897,398),(11191,'',2898,398),(11192,'',2899,398),(11193,'',2900,398),(11194,'',2901,398),(11195,'',2902,398),(11196,'',2903,398),(11197,'',2904,398),(11198,'',2905,398),(11199,'',2906,398),(11200,'',2907,398),(11201,'',2908,398),(11202,'',2909,398),(11203,'',2910,398),(11204,'',2911,398),(11205,'',2912,659),(11206,'',2913,659),(11207,'',2914,659),(11208,'',2915,659),(11209,'',2916,659),(11210,'',2917,659),(11211,'',2918,659),(11212,'',2919,659),(11213,'',2920,659),(11214,'',2921,659),(11215,'',2922,659),(11216,'',2923,659),(11217,'',2924,659),(11218,'',2925,659),(11219,'',2926,659),(11220,'',2927,659),(11221,'',2928,659),(11222,'',2929,659),(11223,'',2930,659),(11224,'',2931,659),(11225,'',2932,659),(11226,'',2933,659),(11227,'',2934,659),(11228,'',2935,659),(11229,'',2936,659),(11230,'',2937,659),(11231,'',2938,659),(11232,'',2939,659),(11233,'',2940,659),(11234,'',2941,659),(11235,'',2942,659),(11236,'',2943,658),(11237,'',2944,658),(11238,'',2945,658),(11239,'',2946,658),(11240,'',2947,658),(11241,'',2948,658),(11242,'',2949,658),(11243,'',2950,658),(11244,'',2951,658),(11245,'',2952,658),(11246,'',2953,658),(11247,'',2954,658),(11248,'',2955,658),(11249,'',2956,658),(11250,'',2957,658),(11251,'',2958,658),(11252,'',2959,658),(11253,'',2960,658),(11254,'',2961,658),(11255,'',2962,658),(11256,'',2963,658),(11257,'',2964,658),(11258,'',2965,658),(11259,'',2966,658),(11260,'',2967,658),(11261,'',2968,658),(11262,'',2969,658),(11263,'',2970,658),(11264,'',2971,658),(11265,'',2972,658),(11266,'',2973,658),(11267,'',2974,658),(11268,'',2975,658),(11269,'',2976,658),(11270,'',2977,658),(11271,'',2978,658),(11272,'',2979,658),(11273,'',2980,658),(11274,'',2981,658),(11275,'',2982,658),(11276,'',2983,658),(11277,'',2984,658),(11278,'',2985,658),(11279,'',2986,658),(11280,'',2987,658),(11281,'',2988,658),(11282,'',2989,658),(11283,'',2990,658),(11284,'',2991,658),(11285,'',2992,658),(11286,'',2993,658),(11287,'',2994,658),(11288,'',2995,658),(11289,'',2996,658),(11290,'',2997,658),(11291,'',2998,658),(11292,'',2999,658),(11293,'',3000,658),(11294,'',3001,658),(11295,'',3002,658),(11296,'',3003,658),(11297,'',3004,658),(11298,'',3005,658),(11299,'',3006,658),(11300,'',3007,658),(11301,'',3008,658),(11302,'',3009,658),(11303,'',3010,658),(11304,'',3011,658),(11305,'',3012,658),(11306,'',3013,658),(11307,'',3014,659),(11308,'',3015,659),(11309,'',3016,659),(11310,'',3017,659),(11311,'',3018,659),(11312,'',3019,659),(11313,'',3020,659),(11314,'',3021,659),(11315,'',3022,659),(11316,'',3023,659),(11317,'',3024,659),(11318,'',3025,659),(11319,'',3026,659),(11320,'',3027,659),(11321,'',3028,659),(11322,'',3029,659),(11323,'',3030,659),(11324,'',3031,659),(11325,'',3032,659),(11326,'',3033,659),(11327,'',3034,659),(11328,'',3035,659),(11329,'',3036,659),(11330,'',3037,659),(11331,'',3038,659),(11332,'',3039,659),(11333,'',3040,659),(11334,'',3041,659),(11335,'',3042,659),(11336,'',3043,659),(11337,'',3044,659),(11338,'',3045,659),(11339,'',3046,659),(11340,'',3047,659),(11341,'',3048,659),(11342,'',3049,659),(11343,'',3050,659),(11344,'',3051,659),(11345,'',3052,659),(11346,'',3053,659),(11347,'',3054,659),(11348,'',3055,659),(11349,'',3056,659),(11350,'',3057,659),(11351,'',3058,659),(11352,'',3059,659),(11353,'',3060,659),(11354,'',3061,659),(11355,'',3062,659),(11356,'',3063,659),(11357,'',3064,659),(11358,'',3065,659),(11359,'',3066,659),(11360,'',3067,659),(11361,'',3068,659),(11362,'',3069,659),(11363,'',3070,659),(11364,'',3071,659),(11365,'',3072,659),(11366,'',3073,659),(11367,'',3074,659),(11368,'',3075,659),(11369,'',3076,659),(11370,'',3077,659),(11371,'',3078,659),(11372,'',3079,659),(11373,'',3080,659),(11374,'',3081,659),(11375,'',3082,659),(11376,'',3083,843),(11377,'',3084,417),(11378,'',3085,417),(11379,'',3086,16),(11380,'',3087,398),(11381,'',3088,398),(11382,'',3089,398),(11383,'',3090,398),(11384,'',3091,398),(11385,'',3092,398),(11386,'',3093,16),(11387,'',3094,521),(11388,'',3095,521),(11389,'',NULL,16),(11390,'',3097,16),(11391,'',3096,16),(11392,'',3098,16),(11393,'',NULL,315),(11394,'',3100,315),(11395,'',3099,315),(11396,'',3101,79),(11397,'',3102,16),(11398,'',3103,16),(11399,'',3104,829),(11400,'',3105,829),(11401,'',3106,615),(11402,'',3107,398),(11403,'',3108,398),(11404,'',3109,532),(11405,'',3110,16),(11406,'',3111,16),(11407,'',NULL,491),(11408,'',3113,491),(11409,'',3112,491),(11410,'',3114,16),(11411,'',3115,94),(11412,'',3116,398),(11413,'',3117,398),(11414,'',3118,398),(11415,'',3119,398),(11416,'',3120,398),(11417,'',3121,398),(11418,'',3122,398),(11419,'',3123,547),(11420,'',3124,398),(11421,'',3125,398),(11422,'',3126,398),(11423,'',3127,398),(11424,'',3128,398),(11425,'',3129,398),(11426,'',3130,547),(11427,'',3131,547),(11428,'',3132,547),(11429,'',3133,398),(11430,'',3134,398),(11431,'',3135,398),(11432,'',3136,398),(11433,'',3137,601),(11434,'',3138,601),(11435,'',3139,567),(11436,'',3140,567),(11437,'',3141,398),(11438,'',3142,352),(11439,'',3143,352),(11440,'',3144,94),(11441,'',3145,94),(11442,'',3146,79),(11443,'',3147,79),(11444,'',3148,730),(11445,'',3149,398),(11446,'',3150,459),(11447,'',3151,171),(11448,'',3152,171),(11449,'',3153,544),(11450,'',3154,520),(11451,'',3155,398),(11452,'',3156,398),(11453,'',3157,398),(11454,'',3158,476),(11455,'',3159,398),(11456,'',3160,398),(11457,'',3161,798),(11458,'',3162,472),(11459,'',3163,398),(11460,'',3164,89),(11461,'',3165,20),(11462,'',3166,622),(11463,'',3167,398),(11464,'',3168,398),(11465,'',3169,99),(11466,'',10447,284),(11467,'',10448,284),(11468,'',10449,311),(11469,'',NULL,16),(11470,'',10451,16),(11471,'',10452,287),(11472,'',10453,287),(11473,'',10454,592),(11474,'',10455,327),(11475,'',10456,312),(11476,'',10457,90),(11477,'',10458,480),(11478,'',10435,79),(11479,'',10459,312),(11480,'',10460,326),(11481,'',10461,327),(11482,'',10462,327),(11483,'',10463,111),(11484,'',10464,489),(11485,'',10465,400),(11486,'',10466,400),(11487,'',10467,400),(11488,'',10468,74),(11489,'',10469,276),(11490,'',10470,74),(11491,'',10471,388),(11492,'',10472,321),(11493,'',10473,321),(11494,'',10474,321),(11495,'',10475,547),(11496,'',10476,547),(11497,'',10477,259),(11498,'',10478,113),(11499,'',10479,113),(11500,'',NULL,113),(11501,'',NULL,113),(11502,'',10481,295),(11503,'',10482,66),(11504,'',10483,200),(11505,'',10484,200),(11506,'',10485,200),(11507,'',10486,200),(11508,'',10487,200),(11509,'',10488,200),(11510,'',10489,200),(11511,'',10490,200),(11512,'',10491,200),(11513,'',10492,74),(11514,'',10493,78),(11515,'',10494,74),(11516,'',10495,74),(11517,'',10496,74),(11518,'',10497,74),(11519,'',10498,74),(11520,'',10499,91),(11521,'',10500,74),(11522,'',10501,74),(11523,'',10502,89),(11524,'',10503,89),(11525,'',10504,91),(11526,'',10505,74),(11527,'',10506,74),(11528,'',10507,74),(11529,'',10508,74),(11530,'',10509,74),(11531,'',10510,327),(11532,'',10511,327),(11533,'',10512,327),(11534,'',10513,327),(11535,'',10514,327),(11536,'',10515,327),(11537,'',10516,327),(11538,'',10517,285),(11539,'',10518,285),(11540,'',10519,285),(11541,'',NULL,613),(11542,'',NULL,311),(11543,'',10521,506),(11544,'',10522,94),(11545,'',10523,601),(11546,'',10524,506),(11547,'',10525,94),(11548,'',10526,601),(11549,'',10527,862),(11550,'',10528,565),(11551,'',NULL,78),(11552,'',10529,264),(11553,'',NULL,22),(11554,'',10530,530),(11555,'',10531,352),(11556,'',10532,79),(11557,'',10533,352),(11558,'',10534,565),(11559,'',10535,352),(11560,'',10536,352),(11561,'',10537,79),(11562,'',10538,352),(11563,'',10539,565),(11564,'',10540,352),(11565,'',10436,98),(11566,'',10541,79),(11567,'',10542,532),(11568,'',10543,532),(11569,'',10544,532),(11570,'',10545,200),(11571,'',10546,311),(11572,'',10547,311),(11573,'',10548,311),(11574,'',10549,311),(11575,'',10550,311),(11576,'',10551,327),(11577,'',10552,470),(11578,'',10553,759),(11579,'',10554,614),(11580,'',10555,470),(11581,'',10556,319),(11582,'',10557,601),(11583,'',10440,307),(11584,'',10560,352),(11585,'',10561,400),(11586,'',10562,548),(11587,'',10563,799),(11588,'',10439,287),(11589,'',10444,285),(11590,'',10564,640),(11591,'',10443,613),(11592,'',10430,384),(11593,'',10450,16),(11594,'',10427,120),(11595,'',10441,290),(11596,'',10566,79),(11597,'',10568,205),(11598,'',10569,134),(11599,'',10570,444),(11600,'',10480,113),(11601,'',10571,444),(11602,'',10446,113),(11603,'',10572,280),(11604,'',10573,20),(11605,'',10574,116),(11606,'',10437,200),(11607,'',10520,311),(11608,'',10575,190),(11609,'',10423,90),(11610,'',10576,88),(11611,'',10577,158),(11612,'',10438,78),(11613,'',10434,22),(11614,'',10429,425),(11615,'',10578,73),(11616,'',10579,441),(11617,'',10580,16),(11618,'',10581,789),(11619,'',10431,89),(11620,'',10426,97),(11621,'',10424,601),(11622,'',10582,91),(11623,'',10583,91),(11624,'',10584,91),(11625,'',10585,91),(11626,'',10587,91),(11627,'',10588,525),(11628,'',10589,263),(11629,'',10590,565),(11630,'',10591,209),(11631,'',10592,285),(11632,'',10593,521),(11633,'',10594,539),(11634,'',10595,352),(11635,'',10596,16),(11636,'',10597,359),(11637,'',11026,311),(11638,'',11027,311),(11639,'',11028,259),(11640,'',11029,74),(11641,'',11030,113),(11642,'',11031,327),(11643,'',11032,311),(11644,'',11033,327),(11645,'',11034,88),(11646,'',11035,592),(11647,'',11036,312),(11648,'',11037,388),(11649,'',11038,16),(11650,'',351,400),(11651,'',352,538),(11652,'',353,524),(11653,'',11039,269),(11654,'',11040,264),(11655,'',11041,20),(11656,'',11042,20),(11657,'',11043,16),(11658,'',11044,264),(11659,'',11045,20),(11660,'',11046,264),(11661,'',11047,189),(11662,'',11048,20),(11663,'',11049,20),(11664,'',11050,264),(11665,'',11051,264),(11666,'',11052,79),(11667,'',11053,79),(11668,'',11054,16),(11669,'',11055,80),(11670,'',11056,310),(11671,'',11057,16),(11672,'',11058,79),(11673,'',11059,693),(11674,'',11060,79),(11675,'',11061,80),(11676,'',11062,22),(11677,'',11063,255),(11678,'',11064,287),(11679,'',11065,200),(11680,'',11066,200),(11681,'',11067,200),(11682,'',11068,200),(11683,'',11069,310),(11684,'',11070,20),(11685,'',11071,287),(11686,'',11072,200),(11687,'',11073,79),(11688,'',11074,79),(11689,'',11075,264),(11690,'',11076,200),(11691,'',11077,264),(11692,'',11078,89),(11693,'',11079,434),(11694,'',11080,20),(11695,'',11081,16),(11696,'',11082,78),(11697,'',11083,20),(11698,'',11084,200),(11699,'',11085,80),(11700,'',11086,79),(11701,'',11087,284),(11702,'',11088,16),(11703,'',11089,20),(11704,'',11090,20),(11705,'',NULL,80),(11706,'',NULL,80),(11707,'',NULL,80),(11708,'',11091,80),(11709,'',11092,80),(11710,'',11093,200),(11711,'',11094,20),(11712,'',11095,94),(11713,'',NULL,20),(11714,'',NULL,20),(11715,'',NULL,20),(11716,'',11096,20),(11717,'',11097,80),(11718,'',11098,22),(11719,'',11099,264),(11720,'',11100,538),(11721,'',11101,538),(11722,'',11102,20),(11723,'',11103,16),(11724,'',11104,20),(11725,'',11105,16),(11726,'',11106,16),(11727,'',11107,611),(11728,'',11108,200),(11729,'',11109,287),(11730,'',11110,20),(11731,'',11111,94),(11732,'',11112,89),(11733,'',11113,89),(11734,'',11114,89),(11735,'',11115,79),(11736,'',11116,287),(11737,'',11117,79),(11738,'',11118,287),(11739,'',11119,89),(11740,'',11120,79),(11741,'',11121,79),(11742,'',11122,434),(11743,'',11123,20),(11744,'',11124,538),(11745,'',11125,434),(11746,'',11126,16),(11747,'',11127,287),(11748,'',11128,79),(11749,'',11129,264),(11750,'',11130,538),(11751,'',11131,538),(11752,'',11132,538),(11753,'',11133,89),(11754,'',11134,189),(11755,'',11135,122),(11756,'',11136,399),(11757,'',11137,434),(11758,'',11138,95),(11759,'',11139,89),(11760,'',11140,22),(11761,'',11141,20),(11762,'',11142,94),(11763,'',11143,16),(11764,'',11144,95),(11765,'',11145,538),(11766,'',11146,399),(11767,'',11147,16),(11768,'',11148,89),(11769,'',11149,611),(11770,'',11150,79),(11771,'',11151,200),(11772,'',11152,200),(11773,'',11153,284),(11774,'',11154,538),(11775,'',11155,89),(11776,'',11156,20),(11777,'',11157,538),(11778,'',11158,20),(11779,'',11159,22),(11780,'',11160,22),(11781,'',11161,16),(11782,'',11162,384),(11783,'',11163,200),(11784,'',11164,16),(11785,'',11165,310),(11786,'',11166,119),(11787,'',11167,918),(11788,'',NULL,701),(11789,'',NULL,701),(11790,'',NULL,701),(11791,'',11168,701),(11792,'',11169,20),(11793,'',11170,16),(11794,'',11171,79),(11795,'',11172,16),(11796,'',11173,89),(11797,'',11174,16),(11798,'',11175,16),(11799,'',11176,94),(11800,'',11177,94),(11801,'',11178,134),(11802,'',11179,176),(11803,'',11180,20),(11804,'',11181,79),(11805,'',11182,20),(11806,'',11183,94),(11807,'',11184,89),(11808,'',11185,264),(11809,'',11186,915),(11810,'',11187,16),(11811,'',11188,538),(11812,'',11189,16),(11813,'',11190,16),(11814,'',11191,200),(11815,'',11192,200),(11816,'',11193,16),(11817,'',11194,538),(11818,'',11195,16),(11819,'',11196,94),(11820,'',11197,16),(11821,'',11198,20),(11822,'',11199,918),(11823,'',11200,200),(11824,'',11201,200),(11825,'',11202,434),(11826,'',11203,521),(11827,'',11204,287),(11828,'',11205,352),(11829,'',11206,95),(11830,'',11207,287),(11831,'',11208,400),(11832,'',11209,79),(11833,'',11210,611),(11834,'',11211,89),(11835,'',11212,538),(11836,'',11213,611),(11837,'',2759,388),(11838,'',2760,388),(11839,'',2761,200),(11840,'',2762,89),(11841,'',2763,285),(11842,'',2764,89),(11843,'',2765,89),(11844,'',2766,200),(11845,'',2767,521),(11846,'',2768,120),(11847,'',2769,120),(11848,'',2770,200),(11849,'',2771,650),(11850,'',2772,539),(11851,'',2773,359),(11852,'',2774,293),(11853,'',2775,79),(11854,'',2776,200),(11855,'',2777,673),(11856,'',2778,548),(11857,'',2779,525),(11858,'',2780,673),(11859,'',2781,552),(11860,'',2782,525),(11861,'',2783,134),(11862,'',2784,134),(11863,'',2785,20),(11864,'',2786,615),(11865,'',2787,113),(11866,'',2788,613),(11867,'',2789,190),(11868,'',2790,6),(11869,'',2791,90),(11870,'',2792,90),(11871,'',2793,521),(11872,'',2794,525),(11873,'',2795,549),(11874,'',2796,201),(11875,'',2797,201),(11876,'',2798,601),(11877,'',2799,20),(11878,'',2800,525),(11879,'',2801,521),(11880,'',2802,293),(11881,'',2803,94),(11882,'',2804,209),(11883,'',2805,359),(11884,'',2806,264),(11885,'',2807,521),(11886,'',2808,98),(11887,'',2809,384),(11888,'',2810,264),(11889,'',2811,334),(11890,'',2812,359),(11891,'',2813,359),(11892,'',2814,566),(11893,'',2815,566),(11894,'',2816,209),(11895,'',2817,209),(11896,'',2818,97),(11897,'',2819,78),(11898,'',2820,78),(11899,'',2821,22),(11900,'',2822,22),(11901,'',2823,598),(11902,'',2824,200),(11903,'',2825,521),(11904,'',2826,552),(11905,'',2827,200),(11906,'',2828,200),(11907,'',2829,200),(11908,'',2830,78),(11909,'',2831,78),(11910,'',2832,22),(11911,'',2833,22),(11912,'',2834,352),(11913,'',2835,116),(11914,'',2836,99),(11915,'',2837,327),(11916,'',11214,295),(11917,'',11215,477),(11918,'',11216,200),(11919,'',11217,502),(11920,'',11218,601),(11921,'',11219,94),(11922,'',11220,79),(11923,'',11221,77),(11924,'',11222,79),(11925,'',11223,73),(11926,'',11224,79),(11927,'',11225,601),(11928,'',11226,698),(11929,'',11227,79),(11930,'',11228,78),(11931,'',11229,125),(11932,'',11230,550),(11933,'',11231,89),(11934,'',11232,601),(11935,'',11233,319),(11936,'',11234,78),(11937,'',11235,601),(11938,'',11236,327),(11939,'',11237,91),(11940,'',11238,89),(11941,'',11239,79),(11942,'',11240,89),(11943,'',11241,73),(11944,'',11242,598),(11945,'',11243,94),(11946,'',11244,456),(11947,'',11245,79),(11948,'',11246,77),(11949,'',11247,284),(11950,'',11248,284),(11951,'',11249,284),(11952,'',11250,16),(11953,'',11251,16),(11954,'',11252,16),(11955,'',11253,16),(11956,'',11254,16),(11957,'',11255,16),(11958,'',11256,16),(11959,'',11257,16),(11960,'',11258,16),(11961,'',11259,16),(11962,'',11260,16),(11963,'',11261,327),(11964,'',11262,89),(11965,'',11263,693),(11966,'',11264,73),(11967,'',11265,79),(11968,'',11266,456),(11969,'',11267,306),(11970,'',11268,601),(11971,'',11269,615),(11972,'',11270,531),(11973,'',NULL,200),(11974,'',11272,79),(11975,'',11273,209),(11976,'',11274,626),(11977,'',11275,89),(11978,'',11276,523),(11979,'',11277,550),(11980,'',11278,359),(11981,'',11279,525),(11982,'',11280,79),(11983,'',11281,376),(11984,'',11282,533),(11985,'',11283,530),(11986,'',11284,693),(11987,'',11285,327),(11988,'',11286,200),(11989,'',11287,434),(11990,'',11288,472),(11991,'',11289,548),(11992,'',11290,79),(11993,'',11291,11),(11994,'',11292,200),(11995,'',11293,200),(11996,'',11294,200),(11997,'',11295,200),(11998,'',11296,200),(11999,'',11297,200),(12000,'',11298,200),(12001,'',11299,200),(12002,'',11300,200),(12003,'',11301,16),(12004,'',11302,22),(12005,'',11303,602),(12006,'',11304,456),(12007,'',11305,89),(12008,'',11306,352),(12009,'',11307,74),(12010,'',11308,548),(12011,'',11309,22),(12012,'',11310,598),(12013,'',11311,200),(12014,'',11312,79),(12015,'',11313,79),(12016,'',11314,79),(12017,'',11315,22),(12018,'',11316,614),(12019,'',11317,30),(12020,'',11318,200),(12021,'',11319,200),(12022,'',11320,16),(12023,'',11321,653),(12024,'',11322,539),(12025,'',11323,522),(12026,'',11324,540),(12027,'',11271,200),(12028,'',11325,540),(12029,'',11326,264),(12030,'',11327,200),(12031,'',11328,200),(12032,'',11329,200),(12033,'',11330,311),(12034,'',11331,264),(12035,'',11332,16),(12036,'',11333,16),(12037,'',11334,79),(12038,'',11335,425),(12039,'',11336,693),(12040,'',11337,88),(12041,'',11338,525),(12042,'',11339,384),(12043,'',11340,524),(12044,'',11341,89),(12045,'',11342,501),(12046,'',11343,327),(12047,'',11344,327),(12048,'',11345,200),(12049,'',11346,79),(12050,'',11347,200),(12051,'',11348,200),(12052,'',11349,200),(12053,'',11350,89),(12054,'',11351,89),(12055,'',11352,327),(12056,'',11353,16),(12057,'',11354,200),(12058,'',11355,200),(12059,'',11356,200),(12060,'',11357,200),(12061,'',11358,200),(12062,'',11359,359),(12063,'',11360,94),(12064,'',11361,200),(12065,'',11362,200),(12066,'',11363,327),(12067,'',11364,384),(12068,'',11365,359),(12069,'',11366,79),(12070,'',11367,200),(12071,'',11368,89),(12072,'',11369,16),(12073,'',11370,116),(12074,'',11371,200),(12075,'',11372,79),(12076,'',7140,79),(12077,'',11373,79),(12078,'',11374,78),(12079,'',11375,284),(12080,'',11376,79),(12081,'',11377,79),(12082,'',11378,79),(12083,'',11379,200),(12084,'',11380,200),(12085,'',11381,359),(12086,'',11382,79),(12087,'',10242,284),(12088,'',11383,79),(12089,'',11384,200),(12090,'',11385,79),(12091,'',11386,79),(12092,'',11387,200),(12093,'',11388,200),(12094,'',11389,79),(12095,'',11390,3),(12096,'',11391,361),(12097,'',11392,200),(12098,'',11393,16),(12099,'',11394,16),(12100,'',11395,89),(12101,'',11396,87),(12102,'',11397,200),(12103,'',11398,16),(12104,'',11399,16),(12105,'',11400,284),(12106,'',11401,16),(12107,'',11402,89),(12108,'',11403,79),(12109,'',11404,89),(12110,'',11405,89),(12111,'',11406,22),(12112,'',11407,22),(12113,'',11408,116),(12114,'',11409,79),(12115,'',11410,79),(12116,'',11411,326),(12117,'',11412,79),(12118,'',11413,200),(12119,'',11414,79),(12120,'',11415,119),(12121,'',11416,352),(12122,'',11417,284),(12123,'',6513,79),(12124,'',11418,16),(12125,'',11419,284),(12126,'',11420,79),(12127,'',11421,200),(12128,'',11422,89),(12129,'',11423,200),(12130,'',10018,200),(12131,'',11424,200),(12132,'',11425,79),(12133,'',7513,79),(12134,'',11426,79),(12135,'',11427,79),(12136,'',8048,200),(12137,'',11428,200),(12138,'',11429,200),(12139,'',11430,16),(12140,'',11431,200),(12141,'',6961,79),(12142,'',11432,79),(12143,'',11433,16),(12144,'',11434,79),(12145,'',11435,16),(12146,'',11436,284),(12147,'',11437,200),(12148,'',11438,79),(12149,'',11439,16),(12150,'',11440,200),(12151,'',11441,200),(12152,'',11442,79),(12153,'',11443,79),(12154,'',11444,470),(12155,'',11445,79),(12156,'',11446,79),(12157,'',11447,79),(12158,'',11448,287),(12159,'',11449,16),(12160,'',11450,79),(12161,'',11451,94),(12162,'',11452,200),(12163,'',11453,16),(12164,'',11454,89),(12165,'',11455,265),(12166,'',11456,732),(12167,'',11457,79),(12168,'',11458,525),(12169,'',11459,200),(12170,'',11460,200),(12171,'',11461,284),(12172,'',11462,359),(12173,'',11463,200),(12174,'',11464,79),(12175,'',6596,79),(12176,'',11465,22),(12177,'',11466,16),(12178,'',11467,78),(12179,'',11468,79),(12180,'',11469,16),(12181,'',11470,16),(12182,'',11471,79),(12183,'',11472,89),(12184,'',11473,89),(12185,'',11474,79),(12186,'',11475,227),(12187,'',11476,79),(12188,'',11477,200),(12189,'',11478,78),(12190,'',11479,200),(12191,'',11480,22),(12192,'',11481,200),(12193,'',11482,16),(12194,'',11483,489),(12195,'',11484,200),(12196,'',11485,200),(12197,'',11486,319),(12198,'',11487,200),(12199,'',11488,79),(12200,'',11489,16),(12201,'',11490,79),(12202,'',11491,200),(12203,'',11492,89),(12204,'',11493,79),(12205,'',6946,79),(12206,'',11494,200),(12207,'',11495,200),(12208,'',11496,89),(12209,'',11497,200),(12210,'',11498,321),(12211,'',11499,200),(12212,'',8291,79),(12213,'',11500,319),(12214,'',6832,79),(12215,'',7341,200),(12216,'',11501,812),(12217,'',11502,200),(12218,'',11503,22),(12219,'',11504,79),(12220,'',6753,287),(12221,'',11505,20),(12222,'',11506,359),(12223,'',11507,79),(12224,'',11508,89),(12225,'',11509,200),(12226,'',11510,200),(12227,'',11511,78),(12228,'',11512,16),(12229,'',11513,89),(12230,'',11514,16),(12231,'',11515,361),(12232,'',11516,79),(12233,'',11517,227),(12234,'',11518,89),(12235,'',11519,538),(12236,'',11520,79),(12237,'',11521,79),(12238,'',11522,200),(12239,'',11523,200),(12240,'',11524,87),(12241,'',11525,78),(12242,'',11526,89),(12243,'',11527,79),(12244,'',11528,79),(12245,'',11529,319),(12246,'',11530,200),(12247,'',11531,200),(12248,'',11532,22),(12249,'',11533,200),(12250,'',11534,327),(12251,'',11535,78),(12252,'',11536,79),(12253,'',10169,79),(12254,'',7136,79),(12255,'',11537,79),(12256,'',11538,200),(12257,'',11539,16),(12258,'',9591,287),(12259,'',11540,200),(12260,'',11541,79),(12261,'',11542,310),(12262,'',11543,79),(12263,'',11544,525),(12264,'',7006,79),(12265,'',11545,310),(12266,'',11546,384),(12267,'',11547,79),(12268,'',11548,77),(12269,'',11549,89),(12270,'',11550,16),(12271,'',8770,89),(12272,'',11551,799),(12273,'',11552,16),(12274,'',8264,284),(12275,'',11553,200),(12276,'',11554,200),(12277,'',11555,79),(12278,'',11556,16),(12279,'',7155,200),(12280,'',11557,200),(12281,'',11558,89),(12282,'',11559,227),(12283,'',11560,16),(12284,'',11561,359),(12285,'',11562,319),(12286,'',11563,359),(12287,'',11564,78),(12288,'',11565,16),(12289,'',11566,200),(12290,'',11567,284),(12291,'',11568,200),(12292,'',11569,16),(12293,'',11570,79),(12294,'',11571,89),(12295,'',11572,200),(12296,'',11573,79),(12297,'',11574,79),(12298,'',11575,79),(12299,'',11576,79),(12300,'',11577,79),(12301,'',11578,79),(12302,'',11579,812),(12303,'',11580,79),(12304,'',7134,79),(12305,'',11581,20),(12306,'',11582,79),(12307,'',11583,284),(12308,'',11584,79),(12309,'',11585,87),(12310,'',11586,200),(12311,'',9097,200),(12312,'',11587,16),(12313,'',11588,200),(12314,'',11589,79),(12315,'',8943,22),(12316,'',11590,708),(12317,'',11591,200),(12318,'',11592,254),(12319,'',11593,79),(12320,'',11594,16),(12321,'',11595,730),(12322,'',11596,16),(12323,'',11597,78),(12324,'',11598,89),(12325,'',11599,200),(12326,'',11600,601),(12327,'',11601,200),(12328,'',11602,89),(12329,'',11603,200),(12330,'',11604,200),(12331,'',11605,200),(12332,'',11606,359),(12333,'',11607,79),(12334,'',11608,227),(12335,'',11609,361),(12336,'',11610,200),(12337,'',11611,327),(12338,'',10275,79),(12339,'',11612,79),(12340,'',11613,20),(12341,'',11614,200),(12342,'',11615,79),(12343,'',11616,200),(12344,'',11617,16),(12345,'',11618,79),(12346,'',11619,200),(12347,'',11620,79),(12348,'',11621,11),(12349,'',11622,359),(12350,'',11623,200),(12351,'',11624,200),(12352,'',11625,287),(12353,'',11626,200),(12354,'',11627,200),(12355,'',11628,16),(12356,'',7619,79),(12357,'',11629,352),(12358,'',11630,200),(12359,'',11631,200),(12360,'',11632,200),(12361,'',11633,79),(12362,'',11634,79),(12363,'',11635,200),(12364,'',11636,200),(12365,'',11637,472),(12366,'',11638,355),(12367,'',11639,89),(12368,'',11640,89),(12369,'',11641,89),(12370,'',11642,89),(12371,'',11643,89),(12372,'',11644,89),(12373,'',11645,89),(12374,'',11646,89),(12375,'',11647,89),(12376,'',11648,353),(12377,'',11649,287),(12378,'',11650,16),(12379,'',11651,200),(12380,'',11652,89),(12381,'',2634,94),(12382,'',2635,98),(12383,'',2617,94),(12384,'',2636,384),(12385,'',2637,540),(12386,'',2638,89),(12387,'',2639,79),(12388,'',2640,79),(12389,'',2641,79),(12390,'',2642,79),(12391,'',2643,200),(12392,'',2644,530),(12393,'',2645,538),(12394,'',2646,200),(12395,'',2647,548),(12396,'',2648,650),(12397,'',2649,650),(12398,'',2650,204),(12399,'',2651,204),(12400,'',2652,200),(12401,'',2653,285),(12402,'',2654,693),(12403,'',2630,16),(12404,'',2655,311),(12405,'',2656,200),(12406,'',2657,200),(12407,'',2658,200),(12408,'',2659,200),(12409,'',2660,200),(12410,'',2661,200),(12411,'',2662,200),(12412,'',2663,16),(12413,'',2664,525),(12414,'',NULL,200),(12415,'',2666,200),(12416,'',2667,311),(12417,'',2669,200),(12418,'',2665,200),(12419,'',2670,311),(12420,'',11653,89),(12421,'',11654,89),(12422,'',11655,79),(12423,'',11656,79),(12424,'',11657,79),(12425,'',11658,79),(12426,'',11659,79),(12427,'',11660,530),(12428,'',11661,200),(12429,'',11662,200),(12430,'',11663,16),(12431,'',3698,592),(12432,'',11664,522),(12433,'',11665,352),(12434,'',11666,598),(12435,'',11667,614),(12436,'',11668,398),(12437,'',11669,300),(12438,'',11670,398),(12439,'',11671,265),(12440,'',11672,265),(12441,'',11673,434),(12442,'',11674,111),(12443,'',11675,359),(12444,'',11676,565),(12445,'',11677,296),(12446,'',11678,359),(12447,'',11679,359),(12448,'',11680,581),(12449,'',11681,676),(12450,'',11682,754),(12451,'',11683,754),(12452,'',11684,20),(12453,'',11685,652),(12454,'',11686,226),(12455,'',11687,330),(12456,'',11688,20),(12457,'',11689,345),(12458,'',11690,20),(12459,'',11691,722),(12460,'',11692,259),(12461,'',11693,704),(12462,'',11694,248),(12463,'',11695,265),(12464,'',11696,20),(12465,'',11697,297),(12466,'',11698,619),(12467,'',11699,259),(12468,'',11700,20),(12469,'',11701,384),(12470,'',11702,798),(12471,'',11703,296),(12472,'',11704,287),(12473,'',11705,311),(12474,'',11706,275),(12475,'',11707,611),(12476,'',11708,474),(12477,'',11709,730),(12478,'',11710,251),(12479,'',11711,20),(12480,'',11712,275),(12481,'',11713,416),(12482,'',11714,404),(12483,'',11715,613),(12484,'',11716,770),(12485,'',11717,20),(12486,'',11718,20),(12487,'',11719,20),(12488,'',11720,690),(12489,'',11721,359),(12490,'',11722,404),(12491,'',11723,94),(12492,'',11724,299),(12493,'',11725,330),(12494,'',11726,560),(12495,'',11727,20),(12496,'',11728,235),(12497,'',11729,113),(12498,'',11730,730),(12499,'',11731,676),(12500,'',11732,311),(12501,'',11733,265),(12502,'',11734,416),(12503,'',11735,11),(12504,'',11736,265),(12505,'',11737,297),(12506,'',11738,20),(12507,'',11739,388),(12508,'',11740,91),(12509,'',11741,20),(12510,'',11742,690),(12511,'',11743,416),(12512,'',11744,11),(12513,'',11745,554),(12514,'',11746,311),(12515,'',11747,131),(12516,'',11748,404),(12517,'',11749,359),(12518,'',11750,265),(12519,'',11751,359),(12520,'',11752,776),(12521,'',11753,798),(12522,'',11754,287),(12523,'',11755,113),(12524,'',11756,359),(12525,'',11757,631),(12526,'',11758,311),(12527,'',11759,265),(12528,'',11760,933),(12529,'',11761,384),(12530,'',11762,16),(12531,'',11763,16),(12532,'',11764,269),(12533,'',11765,16),(12534,'',11766,16),(12535,'',11767,16),(12536,'',11768,511),(12537,'',11769,665),(12538,'',11770,95),(12539,'',11771,16),(12540,'',11772,16),(12541,'',11773,16),(12542,'',11774,200),(12543,'',11775,200),(12544,'',11776,200),(12545,'',11777,284),(12546,'',11778,272),(12547,'',11779,398),(12548,'',11780,382),(12549,'',11781,474),(12550,'',11782,185),(12551,'',11783,358),(12552,'',11784,915),(12553,'',11785,358),(12554,'',11786,398),(12555,'',11787,129),(12556,'',11788,129),(12557,'',11789,704),(12558,'',11790,569),(12559,'',11791,704),(12560,'',11792,704),(12561,'',11793,125),(12562,'',11794,843),(12563,'',11795,843),(12564,'',11796,783),(12565,'',11797,783),(12566,'',11798,783),(12567,'',11799,570),(12568,'',11800,570),(12569,'',11801,227),(12570,'',11802,416),(12571,'',11803,415),(12572,'',11804,415),(12573,'',11805,398),(12574,'',11806,252),(12575,'',11807,571),(12576,'',11808,704),(12577,'',11809,686),(12578,'',11810,686),(12579,'',11811,686),(12580,'',11812,686),(12581,'',11813,686),(12582,'',11814,686),(12583,'',11815,686),(12584,'',11816,686),(12585,'',11817,686),(12586,'',11818,686),(12587,'',11819,401),(12588,'',11820,252),(12589,'',11821,401),(12590,'',11822,401),(12591,'',11823,686),(12592,'',11824,686),(12593,'',11825,686),(12594,'',11826,456),(12595,'',11827,876),(12596,'',11828,476),(12597,'',11829,457),(12598,'',11830,561),(12599,'',11831,871),(12600,'',11832,401),(12601,'',11833,563),(12602,'',11834,563),(12603,'',11835,563),(12604,'',11836,563),(12605,'',11837,401),(12606,'',11838,606),(12607,'',11839,874),(12608,'',11840,571),(12609,'',11841,484),(12610,'',11842,469),(12611,'',11843,456),(12612,'',11844,457),(12613,'',11845,561),(12614,'',11846,563),(12615,'',11847,563),(12616,'',11848,561),(12617,'',11849,561),(12618,'',11850,563),(12619,'',11851,563),(12620,'',11852,563),(12621,'',11853,870),(12622,'',11854,563),(12623,'',11855,563),(12624,'',11856,252),(12625,'',11857,870),(12626,'',11858,122),(12627,'',11859,369),(12628,'',11860,369),(12629,'',5124,79),(12630,'',5115,16),(12631,'',5066,16),(12632,'',5058,16),(12633,'',5091,16),(12634,'',5094,16),(12635,'',5122,16),(12636,'',5083,16),(12637,'',5070,16),(12638,'',5064,16),(12639,'',3171,79),(12640,'',3178,89),(12641,'',3172,89),(12642,'',3179,36),(12643,'',3180,23),(12644,'',11861,36),(12645,'',11862,23),(12646,'',3176,79),(12647,'',3175,79),(12648,'',2743,94),(12649,'',2744,807),(12650,'',2745,776),(12651,'',2746,601),(12652,'',2747,312),(12653,'',2748,20),(12654,'',2749,298),(12655,'',NULL,601),(12656,'',11864,73),(12657,'',11865,94),(12658,'',11866,94),(12659,'',11867,94),(12660,'',11868,94),(12661,'',11869,94),(12662,'',11870,79),(12663,'',11871,94),(12664,'',11872,89),(12665,'',11873,352),(12666,'',11874,73),(12667,'',11875,643),(12668,'',11876,79),(12669,'',11877,352),(12670,'',11878,200),(12671,'',11863,601),(12672,'',11879,565),(12673,'',11880,79),(12674,'',11881,400),(12675,'',11882,346),(12676,'',11883,99),(12677,'',11884,73),(12678,'',11885,99),(12679,'',11886,99),(12680,'',2750,16),(12681,'',11887,94),(12682,'',11888,94),(12683,'',11889,73),(12684,'',11890,435),(12685,'',11891,435),(12686,'',11892,16),(12687,'',11893,359),(12688,'',11894,79),(12689,'',11895,400),(12690,'',11896,285),(12691,'',11897,16),(12692,'',11898,242),(12693,'',11899,389),(12694,'',11900,862),(12695,'',11901,862),(12696,'',11902,89),(12697,'',11903,185),(12698,'',11904,639),(12699,'',11905,99),(12700,'',11906,22),(12701,'',11907,182),(12702,'',11908,242),(12703,'',11909,95),(12704,'',11910,200),(12705,'',11911,398),(12706,'',11912,442),(12707,'',11913,863),(12708,'',11914,96),(12709,'',11915,95),(12710,'',11916,242),(12711,'',11917,89),(12712,'',11918,78),(12713,'',11919,442),(12714,'',11920,398),(12715,'',11921,265),(12716,'',11922,95),(12717,'',11923,434),(12718,'',11924,494),(12719,'',11925,78),(12720,'',11926,398),(12721,'',11927,398),(12722,'',11928,22),(12723,'',11929,89),(12724,'',11930,89),(12725,'',11931,862),(12726,'',11932,503),(12727,'',11933,16),(12728,'',11934,639),(12729,'',11935,639),(12730,'',11936,639),(12731,'',11937,863),(12732,'',11938,99),(12733,'',11939,470),(12734,'',11940,863),(12735,'',11941,99),(12736,'',11942,99),(12737,'',11943,259),(12738,'',11944,400),(12739,'',11945,863),(12740,'',11946,863),(12741,'',11947,863),(12742,'',11948,265),(12743,'',11949,863),(12744,'',11950,89),(12745,'',11951,78),(12746,'',11952,78),(12747,'',11953,22),(12748,'',11954,200),(12749,'',11955,78),(12750,'',11956,22),(12751,'',11957,78),(12752,'',11958,22),(12753,'',11959,639),(12754,'',11960,639),(12755,'',11961,89),(12756,'',11962,389),(12757,'',11963,398),(12758,'',11964,389),(12759,'',11965,548),(12760,'',11966,242),(12761,'',11967,863),(12762,'',11968,863),(12763,'',11969,863),(12764,'',11970,863),(12765,'',11971,398),(12766,'',11972,16),(12767,'',11973,265),(12768,'',11974,78),(12769,'',11975,863),(12770,'',11976,89),(12771,'',11977,89),(12772,'',11978,398),(12773,'',11979,78),(12774,'',11980,200),(12775,'',11981,863),(12776,'',11982,389),(12777,'',11983,863),(12778,'',11984,242),(12779,'',11985,242),(12780,'',11986,389),(12781,'',11987,265),(12782,'',11988,265),(12783,'',11989,265),(12784,'',11990,863),(12785,'',11991,863),(12786,'',11992,248),(12787,'',11993,248),(12788,'',11994,628),(12789,'',11995,128),(12790,'',11996,227),(12791,'',11997,227),(12792,'',11998,227),(12793,'',11999,628),(12794,'',12000,710),(12795,'',12001,710),(12796,'',12002,476),(12797,'',12003,476),(12798,'',12004,129),(12799,'',12005,573),(12800,'',12006,676),(12801,'',12007,676),(12802,'',12008,561),(12803,'',12009,563),(12804,'',12010,563),(12805,'',12011,563),(12806,'',12012,119),(12807,'',12013,119),(12808,'',12014,667),(12809,'',12015,764),(12810,'',12016,765),(12811,'',12017,667),(12812,'',12018,667),(12813,'',12019,667),(12814,'',12020,457),(12815,'',12021,457),(12816,'',12022,704),(12817,'',12023,658),(12818,'',12024,465),(12819,'',12025,824),(12820,'',12026,476),(12821,'',12027,398),(12822,'',12028,468),(12823,'',12029,129),(12824,'',12030,476),(12825,'',12031,822),(12826,'',12032,369),(12827,'',12033,672),(12828,'',12034,685),(12829,'',12035,457),(12830,'',12036,398),(12831,'',12037,398),(12832,'',12038,398),(12833,'',12039,734),(12834,'',12040,667),(12835,'',12041,658),(12836,'',12042,126),(12837,'',12043,788),(12838,'',12044,789),(12839,'',12045,126),(12840,'',12046,129),(12841,'',12047,129),(12842,'',12048,469),(12843,'',12049,467),(12844,'',12050,824),(12845,'',12051,457),(12846,'',12052,457),(12847,'',12053,775),(12848,'',12054,457),(12849,'',12055,562),(12850,'',12056,466),(12851,'',12057,690),(12852,'',12058,562),(12853,'',12059,824),(12854,'',12060,457),(12855,'',12061,667),(12856,'',12062,457),(12857,'',12063,587),(12858,'',12064,398),(12859,'',12065,485),(12860,'',12066,119),(12861,'',12067,404),(12862,'',12068,401),(12863,'',12069,401),(12864,'',12070,401),(12865,'',12071,762),(12866,'',12072,762),(12867,'',12073,415),(12868,'',12074,415),(12869,'',12075,401),(12870,'',12076,762),(12871,'',12077,416),(12872,'',12078,563),(12873,'',12079,739),(12874,'',12080,377),(12875,'',12081,477),(12876,'',12082,242),(12877,'',12083,242),(12878,'',12084,119),(12879,'',12085,119),(12880,'',12086,377),(12881,'',12087,338),(12882,'',12088,131),(12883,'',12089,119),(12884,'',12090,628),(12885,'',12091,227),(12886,'',12092,227),(12887,'',12093,131),(12888,'',12094,131),(12889,'',12095,119),(12890,'',12096,672),(12891,'',12097,775),(12892,'',12098,349),(12893,'',4690,74),(12894,'',12099,319),(12895,'',12100,319),(12896,'',12101,89),(12897,'',12102,200),(12898,'',12103,384),(12899,'',12104,319),(12900,'',12105,693),(12901,'',12106,79),(12902,'',12107,79),(12903,'',12108,89),(12904,'',12109,16),(12905,'',12110,16),(12906,'',12111,16),(12907,'',12112,16),(12908,'',12113,16),(12909,'',12114,16),(12910,'',12115,16),(12911,'',12116,319),(12912,'',12117,200),(12913,'',12118,200),(12914,'',12119,16),(12915,'',12120,16),(12916,'',12121,16),(12917,'',12122,16),(12918,'',12123,16),(12919,'',12124,525),(12920,'',12125,434),(12921,'',12126,16),(12922,'',12127,16),(12923,'',12128,285),(12924,'',12129,614),(12925,'',12130,614),(12926,'',12131,614),(12927,'',12132,614),(12928,'',12133,693),(12929,'',12134,16),(12930,'',12135,20),(12931,'',12136,319),(12932,'',12137,613),(12933,'',12138,78);
/*!40000 ALTER TABLE `VulnerabilityMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vulnerability_Tag`
--

DROP TABLE IF EXISTS `Vulnerability_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vulnerability_Tag` (
  `Vulnerability_Id` int(11) NOT NULL,
  `Tag_Id` int(11) NOT NULL,
  KEY `FKBE712D178282DBDB` (`Vulnerability_Id`),
  KEY `FKBE712D174FD7845B` (`Tag_Id`),
  CONSTRAINT `FKBE712D174FD7845B` FOREIGN KEY (`Tag_Id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `FKBE712D178282DBDB` FOREIGN KEY (`Vulnerability_Id`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vulnerability_Tag`
--

LOCK TABLES `Vulnerability_Tag` WRITE;
/*!40000 ALTER TABLE `Vulnerability_Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vulnerability_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waf`
--

DROP TABLE IF EXISTS `Waf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Waf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `currentId` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wafRuleDirectiveId` int(11) DEFAULT NULL,
  `wafTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK152BC91C1AEC8` (`wafRuleDirectiveId`),
  KEY `FK152BC98050448` (`wafTypeId`),
  CONSTRAINT `FK152BC98050448` FOREIGN KEY (`wafTypeId`) REFERENCES `WafType` (`id`),
  CONSTRAINT `FK152BC91C1AEC8` FOREIGN KEY (`wafRuleDirectiveId`) REFERENCES `WafRuleDirective` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waf`
--

LOCK TABLES `Waf` WRITE;
/*!40000 ALTER TABLE `Waf` DISABLE KEYS */;
/*!40000 ALTER TABLE `Waf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WafRule`
--

DROP TABLE IF EXISTS `WafRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WafRule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `isNormalRule` bit(1) NOT NULL,
  `nativeId` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vulnerabilityDesc` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vulnerabilityId` int(11) DEFAULT NULL,
  `wafId` int(11) DEFAULT NULL,
  `wafRuleDirectiveId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA5889FD8DFCC92B4` (`vulnerabilityId`),
  KEY `FKA5889FD891C1AEC8` (`wafRuleDirectiveId`),
  KEY `FKA5889FD88B18CCB4` (`wafId`),
  CONSTRAINT `FKA5889FD88B18CCB4` FOREIGN KEY (`wafId`) REFERENCES `Waf` (`id`),
  CONSTRAINT `FKA5889FD891C1AEC8` FOREIGN KEY (`wafRuleDirectiveId`) REFERENCES `WafRuleDirective` (`id`),
  CONSTRAINT `FKA5889FD8DFCC92B4` FOREIGN KEY (`vulnerabilityId`) REFERENCES `Vulnerability` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WafRule`
--

LOCK TABLES `WafRule` WRITE;
/*!40000 ALTER TABLE `WafRule` DISABLE KEYS */;
/*!40000 ALTER TABLE `WafRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WafRuleDirective`
--

DROP TABLE IF EXISTS `WafRuleDirective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WafRuleDirective` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directive` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wafTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCC3DB5798050448` (`wafTypeId`),
  CONSTRAINT `FKCC3DB5798050448` FOREIGN KEY (`wafTypeId`) REFERENCES `WafType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WafRuleDirective`
--

LOCK TABLES `WafRuleDirective` WRITE;
/*!40000 ALTER TABLE `WafRuleDirective` DISABLE KEYS */;
INSERT INTO `WafRuleDirective` VALUES (1,'alert',1),(2,'log',1),(3,'pass',1),(4,'activate',1),(5,'dynamic',1),(6,'drop',1),(7,'reject',1),(8,'sdrop',1),(9,'-',2),(10,'transparent',3),(11,'blocking',3),(12,'deny',4),(13,'drop',4),(14,'pass',4),(15,'allow',4),(16,'deny',5),(17,'deny',6),(18,'warning',6);
/*!40000 ALTER TABLE `WafRuleDirective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WafType`
--

DROP TABLE IF EXISTS `WafType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WafType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initialId` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WafType`
--

LOCK TABLES `WafType` WRITE;
/*!40000 ALTER TABLE `WafType` DISABLE KEYS */;
INSERT INTO `WafType` VALUES (1,100000,'Snort'),(2,100000,'Imperva SecureSphere'),(3,100000,'BIG-IP ASM'),(4,100000,'mod_security'),(5,100000,'SteelApp Web App Firewall'),(6,100000,'DenyAll rWeb');
/*!40000 ALTER TABLE `WafType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-10 19:20:54