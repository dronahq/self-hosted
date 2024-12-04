-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: dronahq_internal
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_manager`
--

DROP TABLE IF EXISTS `account_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_manager` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `created_on` datetime NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_manager`
--

LOCK TABLES `account_manager` WRITE;
/*!40000 ALTER TABLE `account_manager` DISABLE KEYS */;
INSERT INTO `account_manager` VALUES (1,'','','0000-00-00 00:00:00','','',0);
/*!40000 ALTER TABLE `account_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actionbutton`
--

DROP TABLE IF EXISTS `actionbutton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actionbutton` (
  `abid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `dispindex` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `actionposition` varchar(45) NOT NULL DEFAULT 'below',
  `action_tile_img` varchar(200) NOT NULL DEFAULT '',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `grid_xhdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_hdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_mdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_ldpi` varchar(200) NOT NULL DEFAULT '',
  `tile_xhdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_hdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_mdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_ldpi` varchar(200) NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is not default action button',
  `is_hidden` tinyint DEFAULT '0',
  `is_active` tinyint DEFAULT '1',
  PRIMARY KEY (`abid`),
  KEY `FK_actionbutton_1` (`dispindex`) USING BTREE,
  KEY `FK_actionbutton_2` (`channelid`),
  KEY `idx_actser` (`searchable`,`is_active`,`is_hidden`),
  CONSTRAINT `FK_actionbutton_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actionbutton`
--

LOCK TABLES `actionbutton` WRITE;
/*!40000 ALTER TABLE `actionbutton` DISABLE KEYS */;
/*!40000 ALTER TABLE `actionbutton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_feed`
--

DROP TABLE IF EXISTS `activity_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_feed` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `activity_subject_id` int DEFAULT NULL COMMENT 'The one who is performing the activity',
  `activity_object_id` int DEFAULT NULL COMMENT 'The one on whom the activity is being performed. Can be a user, content, category or nothing',
  `activity_object_type` char(5) DEFAULT NULL COMMENT 'Type of the object. ICON, USER, CONT etc.',
  `activity_verb` varchar(20) DEFAULT NULL COMMENT 'What exact activity was performed',
  `activity_date` datetime DEFAULT NULL COMMENT 'DateTime stamp when the activity happened',
  `activity_channelid` int unsigned DEFAULT NULL,
  `activity_subject_type` char(5) DEFAULT 'USER' COMMENT 'Who is doing the activity. User, Admin, Plugin',
  `activity_data` varchar(150) DEFAULT '' COMMENT 'Any extra meta data associated with this activity',
  PRIMARY KEY (`activity_id`),
  KEY `FK_activity_feed_1` (`activity_channelid`),
  CONSTRAINT `FK_activity_feed_1` FOREIGN KEY (`activity_channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store channel activites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_feed`
--

LOCK TABLES `activity_feed` WRITE;
/*!40000 ALTER TABLE `activity_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_account_locked`
--

DROP TABLE IF EXISTS `admin_account_locked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_account_locked` (
  `admin_id` int unsigned NOT NULL,
  `last_login` datetime NOT NULL,
  `failed_login_counter` int unsigned NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_account_locked`
--

LOCK TABLES `admin_account_locked` WRITE;
/*!40000 ALTER TABLE `admin_account_locked` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_account_locked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_view_access`
--

DROP TABLE IF EXISTS `admin_view_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_view_access` (
  `admin_id` int unsigned DEFAULT NULL,
  `viewid` int unsigned DEFAULT NULL,
  KEY `FK_admin_view_access_1` (`admin_id`),
  KEY `FK_admin_view_access_2` (`viewid`),
  CONSTRAINT `FK_admin_view_access_1` FOREIGN KEY (`admin_id`) REFERENCES `adminuser` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_admin_view_access_2` FOREIGN KEY (`viewid`) REFERENCES `categorytemplate` (`viewid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Which Admin can access which View';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_view_access`
--

LOCK TABLES `admin_view_access` WRITE;
/*!40000 ALTER TABLE `admin_view_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_view_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_view_role_access`
--

DROP TABLE IF EXISTS `admin_view_role_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_view_role_access` (
  `admin_view_role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(245) DEFAULT NULL,
  `is_visible` tinyint DEFAULT '1',
  `view_type` varchar(45) DEFAULT 'c',
  `view_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_view_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_view_role_access`
--

LOCK TABLES `admin_view_role_access` WRITE;
/*!40000 ALTER TABLE `admin_view_role_access` DISABLE KEYS */;
INSERT INTO `admin_view_role_access` VALUES (1,'Apps',1,'c',''),(2,'Sheets',1,'c',''),(3,'Automations',1,'c',''),(4,'PDF Creator',1,'c',''),(5,'Connectors',1,'c',''),(6,'Functions Editor',1,'d',''),(7,'Control Editor',1,'d',''),(8,'Control Designer',1,'d',''),(9,'Workflow Analytics',1,'a',''),(10,'App Analytics',1,'a',''),(11,'Users',1,'s',''),(12,'App Catalogs',1,'s',''),(13,'General',1,'s',''),(14,'Branding',1,'s',''),(15,'Security',1,'s',''),(16,'Admin',1,'s',''),(17,'integrations',1,'s',''),(18,'Billing',1,'s',''),(19,'usage',1,'s',''),(20,'Automation Analytics',1,'a',''),(21,'Analytics',1,'a',NULL),(22,'Account Settings',1,'a',NULL);
/*!40000 ALTER TABLE `admin_view_role_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_view_role_access_map`
--

DROP TABLE IF EXISTS `admin_view_role_access_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_view_role_access_map` (
  `uid` int DEFAULT NULL,
  `map_id` text,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_view_role_access_map`
--

LOCK TABLES `admin_view_role_access_map` WRITE;
/*!40000 ALTER TABLE `admin_view_role_access_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_view_role_access_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admininvites`
--

DROP TABLE IF EXISTS `admininvites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admininvites` (
  `adminId` int unsigned NOT NULL AUTO_INCREMENT,
  `emailId` text NOT NULL,
  `invitedOn` datetime NOT NULL,
  `inviteAcceptedOn` datetime NOT NULL,
  `verificationCode` varchar(200) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `UserName` text,
  `Password` text,
  `companyName` text,
  `phoneNo` text,
  `res_type` varchar(45) DEFAULT 'dronahq',
  `admin_address` text,
  `admin_website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admininvites`
--

LOCK TABLES `admininvites` WRITE;
/*!40000 ALTER TABLE `admininvites` DISABLE KEYS */;
/*!40000 ALTER TABLE `admininvites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminremember`
--

DROP TABLE IF EXISTS `adminremember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminremember` (
  `uid` int unsigned NOT NULL,
  `cookie_hash` varchar(450) NOT NULL,
  `cookie_salt` varchar(450) NOT NULL,
  `token_create_date` datetime NOT NULL,
  `cookie_expire_after_day` int NOT NULL,
  KEY `FK_adminremember_1` (`uid`),
  CONSTRAINT `FK_adminremember_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminremember`
--

LOCK TABLES `adminremember` WRITE;
/*!40000 ALTER TABLE `adminremember` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminremember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminuser` (
  `admin_id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned DEFAULT NULL,
  `channelid` int unsigned DEFAULT NULL,
  `last_login_time` datetime DEFAULT '0000-00-00 00:00:00',
  `roleid` int unsigned NOT NULL,
  `exp_level` int unsigned NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT '1',
  `is_creator` tinyint DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `FK_adminuser_1` (`channelid`),
  KEY `FK_adminuser_2` (`userid`),
  KEY `FK_adminuser_3` (`roleid`),
  CONSTRAINT `FK_adminuser_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_adminuser_2` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_adminuser_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES (1,1,1,'2022-03-22 12:57:39',1,0,1,0);
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminusersignup`
--

DROP TABLE IF EXISTS `adminusersignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminusersignup` (
  `signup_id` int NOT NULL AUTO_INCREMENT,
  `signup_email_id` varchar(145) DEFAULT NULL,
  `signup_date` datetime DEFAULT NULL,
  PRIMARY KEY (`signup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminusersignup`
--

LOCK TABLES `adminusersignup` WRITE;
/*!40000 ALTER TABLE `adminusersignup` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminusersignup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `androidpushtokens`
--

DROP TABLE IF EXISTS `androidpushtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `androidpushtokens` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(100) NOT NULL,
  `push_token` text,
  `push_type` char(4) DEFAULT 'GCM',
  `modified_date` datetime DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT '1',
  `app_status` varchar(45) DEFAULT 'Active',
  `app_status_modified_date` datetime DEFAULT NULL,
  UNIQUE KEY `Unique` (`uid`,`deviceid`),
  KEY `FK_androidpushtokens_1` (`uid`),
  KEY `FK_androidpushtokens_2` (`deviceid`),
  KEY `Index_4` (`is_valid`),
  CONSTRAINT `FK_androidpushtokens_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_androidpushtokens_2` FOREIGN KEY (`deviceid`) REFERENCES `deviceinfo` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `androidpushtokens`
--

LOCK TABLES `androidpushtokens` WRITE;
/*!40000 ALTER TABLE `androidpushtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `androidpushtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_category`
--

DROP TABLE IF EXISTS `api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_category` (
  `api_category_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) DEFAULT NULL,
  `cat_desc` varchar(200) DEFAULT NULL,
  `cat_image_url` varchar(200) DEFAULT NULL,
  `cat_oauth_type` varchar(45) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `create_on` datetime DEFAULT NULL,
  `created_by` varchar(200) DEFAULT '',
  `updated_on` datetime DEFAULT NULL,
  `oauth_is_set` int DEFAULT '0',
  `oauth_grant_type` varchar(205) DEFAULT '',
  `oauth_callback_url` varchar(205) DEFAULT '',
  `oauth_auth_url` varchar(205) DEFAULT '',
  `oauth_access_token_url` varchar(205) DEFAULT '',
  `oauth_client_id` varchar(205) DEFAULT '',
  `oauth_client_secret` varchar(205) DEFAULT '',
  `oauth_scope` varchar(200) DEFAULT '',
  `oauth_state` varchar(200) DEFAULT '',
  `oauth_client_auth_target` varchar(45) DEFAULT '',
  `oauth_username` varchar(45) DEFAULT '',
  `oauth_password` varchar(45) DEFAULT '',
  `oauth_show` int DEFAULT '0',
  `scheme_type` varchar(45) DEFAULT 'no_auth',
  `mongo_doc_id` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT '',
  `isDeleted` int DEFAULT '0',
  `isCatPublic` int DEFAULT '0',
  `cat_type` varchar(45) DEFAULT '',
  `format_id` varchar(128) DEFAULT NULL,
  `isInstalled` int DEFAULT '0',
  PRIMARY KEY (`api_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_category`
--

LOCK TABLES `api_category` WRITE;
/*!40000 ALTER TABLE `api_category` DISABLE KEYS */;
INSERT INTO `api_category` VALUES (1,'OpenAI','Connecting DronaHQ to OpenAI to leverage AI and machine learning in your applications','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Y6Ghi572bn.jpeg',NULL,1,'2023-06-20 10:24:38','ramanuj@dronamobile.com','2024-04-19 12:45:24',0,'','','','','','','','','','','',0,'api_key','64917e66bf1eb6395843a6ed','ramanuj@dronamobile.com',0,1,'','a92cab2d-0f54-11ee-b65f-0e71b101e9a3',0),(2,'OpenAI Advanced','Connecting DronaHQ to OpenAI to leverage AI and machine learning in your applications','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Y6Ghi572bn.jpeg',NULL,1,'2023-04-06 14:04:18','ramanuj@dronamobile.com','2023-06-27 13:45:22',0,'','','','','','','','','','','',0,'api_key','642ed162bf1eb639589b67e3','ramanuj@dronamobile.com',0,1,'','ec0dd6e0-d483-11ed-a12c-0a62665f1d4f2',0),(3,'Xano','Connect your Xano backend with DronaHQ','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/m46PjHihXX.png',NULL,1,'2023-07-12 10:37:41','ramanuj@dronamobile.com','2023-07-18 09:13:28',0,'','','','','','','','','','','',0,'api_key','64ae8275bf1eb6395888aadb','ramanuj@dronamobile.com',0,1,'','20fdc5cc-20a0-11ee-b65f-0e71b101e9a3',0),(4,'Airtable','Integrate Airtable bases with DronaHQ','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/FTSNPOTyE8.png',NULL,1,'2023-08-21 15:39:26','ramanuj@dronamobile.com','2023-09-26 10:32:00',0,'','','','','','','','','','','',0,'api_key','64e3852ebf1eb639585eb6f9','ramanuj@dronamobile.com',0,1,'','e930a934-4038-11ee-b65f-0e71b101e9a3',0),(5,'AzureStorage','list containers, list blobs, upload blob and get signed url','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/GEZKgNtUn4.jpeg',NULL,1,'2023-11-27 04:53:40','ramanuj@dronamobile.com','2023-12-12 14:20:15',0,'','','','','','','','','','','',0,'api_key','656420d4bf1eb63958ccb7f4','ramanuj@dronamobile.com',0,1,'','ef083566-8ce0-11ee-95d9-0e71b101e9a3',0),(6,'DronaHQ File Storage','Access your S3 files, upload to your bucket','/static/images/Console/file-storage-circle.svg',NULL,1,'2023-12-04 11:20:24','ramanuj@dronamobile.com','2024-11-07 08:26:32',0,'','','','','','','','','','','',0,'aws_auth','61168ec20e58daded7e583b8','ramanuj@dronamobile.com',0,1,'','0348a8b5-a8ee-11ec-8a6a-0242ac120002',0),(7,'PDFCreator','REST API Connector for generating pdf files either as file in base64 encoded string or as public file url uploaded on S3 storage.','./Images/dblogos/restapi.png',NULL,1,'2024-03-28 06:56:51','ramanuj@dronamobile.com','2024-07-01 09:17:07',0,'','','','','','','','','','','',0,'api_key','660514b3bf1eb63958e52318','ramanuj@dronamobile.com',0,1,'','5aa66338-ecd0-11ee-aa73-0affc745b639',0),(8,'Notion','Notion API connector','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Vdk59qGnkD.png',NULL,1,'2024-09-26 05:48:34','ramanuj@dronamobile.com','2024-11-04 06:17:41',0,'','','','','','','','','','','',0,'api_key','66f4f5b2bf1eb639583a8cf2','ramanuj@dronamobile.com',0,1,'','f7dbbcc0-7bca-11ef-b858-0affc745b639',0),(197,'Trello','Manage your work and task on Trello','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/TA5N9HFGI6.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5e845f869131ae8d8ba2324f','ramanuj@dronamobile.com',0,1,'','4bb27adb-c236-11ec-a3c7-0a62665f1d4f',0),(198,'Slack','Send message in your Slack Workspace','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/OtVpnXSTSx.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-11-15 09:46:38',0,'','','','','','','','','','','',0,'oauth_v2','5e847ddd9131ae8d8ba495e3','ramanuj@dronamobile.com',0,1,'','4bb27b4f-c236-11ec-a3c7-0a62665f1d4f',0),(199,'SendGrid','Send and Manage your emails with SendGrid','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/LbKOnG5wo6.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-04-13 06:13:41',0,'','','','','','','','','','','',0,'api_key','5e84863f9131ae8d8ba535eb','ramanuj@dronamobile.com',0,1,'','034895d2-a8ee-11ec-8a6a-0242ac120002',0),(202,'Twillio','Send Text Messages to any phone number using Twillio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/YEX4tTG4EG.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-04-30 15:31:55',0,'','','','','','','','','','','',0,'basic_auth','5e859b739131ae8d8bbfa289','ramanuj@dronamobile.com',0,1,'','4bb27c4e-c236-11ec-a3c7-0a62665f1d4f',0),(205,'Clearbit','You can use this API to access all our API endpoints, such as the Person API to look up email addresses, or the Company API to look up company information related to a domain name.','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/tOANVCKnaL.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5e86e9959131ae8d8be2eb88','ramanuj@dronamobile.com',0,1,'','4bb27e10-c236-11ec-a3c7-0a62665f1d4f',0),(209,'Google Sheets','Create, Update Google Sheets','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/AxD3IMQv1Y.png',NULL,1,NULL,'ramanuj@dronamobile.com','2021-07-30 09:38:41',0,'','','','','','','','','','','',0,'oauth_v2','5e8c753d9131ae8d8b70ff63','ramanuj@dronamobile.com',0,1,'','034897e6-a8ee-11ec-8a6a-0242ac120002',0),(210,'Intercom','You can Create/Update Users & Leads','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/i7pCfw3xac.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-12-18 16:15:45',0,'','','','','','','','','','','',0,'oauth_v2','5e8ca18d9131ae8d8b722293','ramanuj@dronamobile.com',0,1,'','4bb27f0f-c236-11ec-a3c7-0a62665f1d4f',0),(213,'Bitly','Generate Short Url Links','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/mBHXLnSybD.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-04-09 14:32:22',0,'','','','','','','','','','','',0,'oauth_v2','5e8ebc019131ae8d8b8761d1','ramanuj@dronamobile.com',0,1,'','4bb28084-c236-11ec-a3c7-0a62665f1d4f',0),(214,'Proxy Crawl','Crawl websites and Scrape data using Proxy Crawl','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/4V4gxOHinG.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5e8f206f9131ae8d8b89bfa3','ramanuj@dronamobile.com',0,1,'','4bb2810c-c236-11ec-a3c7-0a62665f1d4f',0),(215,'Diffbot','Extract structured data from any URL','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/wQbhjX2W4K.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5e8f23b59131ae8d8b89d908','ramanuj@dronamobile.com',0,1,'','4bb28174-c236-11ec-a3c7-0a62665f1d4f',0),(219,'What 3 Words','Get Any Location in 3 words','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/rPIvrKwmeK.undefined',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5e9052749131ae8d8b9329f9','ramanuj@dronamobile.com',0,1,'','4bb282e9-c236-11ec-a3c7-0a62665f1d4f',0),(220,'Zoom','Create Zoom Meeting','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/HGcSX23LnE.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'oauth_v2','5e9069ab9131ae8d8b93a87c','ramanuj@dronamobile.com',0,1,'','4bb28353-c236-11ec-a3c7-0a62665f1d4f',0),(222,'OCRSpace','OCR - Convert images and PDF to text','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/YUa7VP7gX1.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com','2021-08-26 08:07:20',0,'','','','','','','','','','','',0,'api_key','5e9591599131ae8d8bc51158','ramanuj@dronamobile.com',0,1,'','4bb283b2-c236-11ec-a3c7-0a62665f1d4f',0),(223,'Jira Software Cloud','Manage Issues of Jira Software Cloud','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Wui4XvZyb5.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-04-15 05:26:53',0,'','','','','','','','','','','',0,'oauth_v2','5e959dca9131ae8d8bc5dc55','ramanuj@dronamobile.com',0,1,'','4bb28521-c236-11ec-a3c7-0a62665f1d4f',0),(224,'Typeform','Get Typeform forms and User responses','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/7d1HB2Jcbo.png',NULL,1,NULL,'ramanuj@dronamobile.com','2022-07-14 08:12:09',0,'','','','','','','','','','','',0,'oauth_v2','5e99b9d79131ae8d8be8f2a7','ramanuj@dronamobile.com',0,1,'','4bb2858c-c236-11ec-a3c7-0a62665f1d4f',0),(227,'Zendesk','Manage your Zendesk Support Tickets','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/GXsq4w8rpZ.png',NULL,1,NULL,'ramanuj@dronamobile.com','2022-06-24 09:45:28',0,'','','','','','','','','','','',0,'basic_auth','5e9dba2c9131ae8d8b249c39','ramanuj@dronamobile.com',0,1,'','4bb285f0-c236-11ec-a3c7-0a62665f1d4f',0),(231,'HackerRank','Manage your HackerRank tests and interviews','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/FTqJIrpsiG.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5ea697cf9131ae8d8b9ebb00','ramanuj@dronamobile.com',0,1,'','4bb28768-c236-11ec-a3c7-0a62665f1d4f',0),(233,'Freshdesk','Manage you Freshdesk support tickets','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/MpGg6jT4Rx.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'basic_auth','5eb009839131ae8d8b89f34b','ramanuj@dronamobile.com',0,1,'','4bb287d1-c236-11ec-a3c7-0a62665f1d4f',0),(234,'WhatsApp','Send WhatsApp messages using  Gupshup - WhatsApp For Business Partner - https://www.gupshup.io','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/ZHg6NgyZ2K.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-05-05 14:05:49',0,'','','','','','','','','','','',0,'api_key','5eb14fea9131ae8d8b957473','ramanuj@dronamobile.com',0,1,'','4bb28949-c236-11ec-a3c7-0a62665f1d4f',0),(235,'Clarifai','Gather valuable business insights from images, data and text using machine learning, image recognition and computer vision.','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/EGHkjuw8Ho.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5eb2a82d9131ae8d8b9ea6f3','ramanuj@dronamobile.com',0,1,'','4bb289be-c236-11ec-a3c7-0a62665f1d4f',0),(237,'Shopify','Manage your Shopify Customers, Inventory and Product listings','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Wa3A1T5FlB.png',NULL,1,NULL,'ramanuj@dronamobile.com','2021-05-27 09:08:37',0,'','','','','','','','','','','',0,'basic_auth','5eb7b8349131ae8d8bbc2952','ramanuj@dronamobile.com',0,1,'','4bb28b33-c236-11ec-a3c7-0a62665f1d4f',0),(239,'QuickBooks Online','Manage your QuickBook online accounting','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/8EMocbd2Wn.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'oauth_v2','5ebadc9a9131ae8d8bd4edba','ramanuj@dronamobile.com',0,1,'','4bb28bba-c236-11ec-a3c7-0a62665f1d4f',0),(241,'MyMemory','Translate using MyMemory. More info at - https://mymemory.translated.net/','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Mlu4dtB9CU.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','5ebd5f319131ae8d8be320d4','ramanuj@dronamobile.com',0,1,'','4bb28d46-c236-11ec-a3c7-0a62665f1d4f',0),(247,'Gmail','Manage your Gmail Inbox','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/rj11x5DFMa.webp',NULL,1,NULL,'ramanuj@dronamobile.com','2021-04-05 13:22:42',0,'','','','','','','','','','','',0,'oauth_v2','5ec28da09131ae8d8b069ae6','ramanuj@dronamobile.com',0,1,'','4bb28dba-c236-11ec-a3c7-0a62665f1d4f',0),(248,'Google Calendar','Create and Manage Google Calendar Events','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/fSIDfvP9jB.png',NULL,1,NULL,'ramanuj@dronamobile.com','2021-04-05 13:22:54',0,'','','','','','','','','','','',0,'oauth_v2','5ec2a68f9131ae8d8b073d14','ramanuj@dronamobile.com',0,1,'','4bb28e23-c236-11ec-a3c7-0a62665f1d4f',0),(254,'Asana','Manage your Asana projects using DronaHQ Studio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/VF5JRHx59I.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com','2023-10-13 06:00:59',0,'','','','','','','','','','','',0,'oauth_v2','5ecbd7499131ae8d8b6dca25','ramanuj@dronamobile.com',0,1,'','4bb2908b-c236-11ec-a3c7-0a62665f1d4f',0),(256,'BOX','Manage you BOX files using DronaHQ Studio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/KmKXHkHZYO.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'oauth_v2','5ecd01ed9131ae8d8b7570df','ramanuj@dronamobile.com',0,1,'','4bb290f5-c236-11ec-a3c7-0a62665f1d4f',0),(257,'Cloud Convert','Convert your files using Cloud Convert.','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/KnH6ysEN8c.jpeg',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'oauth_v2','5ecd32de9131ae8d8b77745c','ramanuj@dronamobile.com',0,1,'','4bb29273-c236-11ec-a3c7-0a62665f1d4f',0),(265,'Github','Manage your github account using DronaHQ Studio platform','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/JFSsB68QLY.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-05-29 15:00:04',0,'','','','','','','','','','','',0,'oauth_v2','5ed1211f9131ae8d8b9e8770','ramanuj@dronamobile.com',0,1,'','4bb29340-c236-11ec-a3c7-0a62665f1d4f',0),(341,'Microsoft Outlook','Microsoft Outlook Integration with DronaHQ Studio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/ch974brOsC.png',NULL,1,NULL,'ramanuj@dronamobile.com','2020-09-28 09:58:59',0,'','','','','','','','','','','',0,'oauth_v2','5f6f674b9131ae8d8b4632f7','ramanuj@dronamobile.com',0,1,'','0348a0df-a8ee-11ec-8a6a-0242ac120002',0),(370,'Razorpay','Collect your payment using Razorpay','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Sr73dCFPUG.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-02-08 11:29:20',0,'','','','','','','','','','','',0,'basic_auth','5f92de33c26127a8b835839a','ramanuj@dronamobile.com',0,1,'','4bb295ce-c236-11ec-a3c7-0a62665f1d4f',0),(392,'Airtable (Deprecated)','Add/update your rows in Airtable','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/ggFoa8WQfl.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-09-26 10:23:33',0,'','','','','','','','','','','',0,'api_key','5fcdc57f3d877fef61d352f9','ramanuj@dronamobile.com',0,1,'','0348a255-a8ee-11ec-8a6a-0242ac120002',0),(393,'DronaHQ','DronaHQ In-House Connectors','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/EusZud7uTb.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'no_auth','5fcdfef43d877fef61deb205','ramanuj@dronamobile.com',0,1,'','0348a294-a8ee-11ec-8a6a-0242ac120002',0),(483,'HubSpot','HubSpot integration with DronaHQ','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/I7wlEYsaIP.png',NULL,1,NULL,'ramanuj@dronamobile.com','2024-01-25 09:19:45',0,'','','','','','','','','','','',0,'oauth_v2','609aae0a8f493d71c7c60ae1','ramanuj@dronamobile.com',0,1,'','4bb29aaa-c236-11ec-a3c7-0a62665f1d4f',0),(497,'Instamojo','Integrate Instamojo with DronaHQ studio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/LLPw3e78xr.png',NULL,1,NULL,'ramanuj@dronamobile.com','2021-05-18 10:23:21',0,'','','','','','','','','','','',0,'api_key','60a391d68f493d71c74a6001','ramanuj@dronamobile.com',0,1,'','4bb29b11-c236-11ec-a3c7-0a62665f1d4f',0),(509,'Stripe','Integrate Stripe with DronaHQ Studio','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/ATqQIDwZIc.png',NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'api_key','60ad1f978f493d71c7f412c9','ramanuj@dronamobile.com',0,1,'','4bb29cd7-c236-11ec-a3c7-0a62665f1d4f',0),(639,'AWS_S3','Access your S3 files, upload to your bucket','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/1pnK2NO4yW.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-07-08 09:55:58',0,'','','','','','','','','','','',0,'aws_auth','61168ec20e58daded7e583b8','ramanuj@dronamobile.com',0,1,'','0348a8b5-a8ee-11ec-8a6a-0242ac120002',0),(663,'AWS_Lambda','Execute functions on your AWS machine','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/F2RMeJ96yj.png',NULL,1,NULL,'ramanuj@dronamobile.com','2024-04-18 10:34:24',0,'','','','','','','','','','','',0,'aws_auth','6123b5f80e58daded7de294b','ramanuj@dronamobile.com',0,1,'','4bb29dc6-c236-11ec-a3c7-0a62665f1d4f',0),(696,'Google Cloud Storage','Access your files and upload new ones to Google Cloud Storage','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/1mDBQxmQTY.png',NULL,1,NULL,'ramanuj@dronamobile.com','2021-09-07 05:55:49',0,'','','','','','','','','','','',0,'api_key','6132f90318c479b45abf0a80','ramanuj@dronamobile.com',0,1,'','0348aa28-a8ee-11ec-8a6a-0242ac120002',0),(2062,'SMTP','SMTP connector for+sending+email','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/iLmHAGFMQP.png',NULL,1,NULL,'ramanuj@dronamobile.com','2023-03-10 07:18:10',0,'','','','','','','','','','','',0,'basic_auth','6267c51ef92f73267f134784','ramanuj@dronamobile.com',0,1,'','3fa1e64c-39c3-11ed-af73-0a62665f1d4f',0),(4424,'RandomDogs','get images of dogs','https://dronamobilepublic.s3.amazonaws.com/1349/dhqstudio/api/images/Z5aiiNtljI.jpeg',NULL,1,'2023-01-24 11:28:12','ramanuj@dronamobile.com','2023-01-24 11:30:27',0,'','','','','','','','','','','',0,'no_auth','63cfc0ccbf1eb6395870ee37','ramanuj@dronamobile.com',0,1,'','2fde5c31-9bda-11ed-b4b1-0a62665f1d4f',0),(100000,'dummy',NULL,NULL,NULL,1,NULL,'ramanuj@dronamobile.com',NULL,0,'','','','','','','','','','','',0,'no_auth',NULL,'ramanuj@dronamobile.com',1,0,'',NULL,0);
/*!40000 ALTER TABLE `api_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_sub_category`
--

DROP TABLE IF EXISTS `api_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_sub_category` (
  `sub_category_id` int NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(100) DEFAULT NULL,
  `sub_category_desc` varchar(200) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sub_created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `sub_modify_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `sub_category_method` varchar(10) DEFAULT 'GET',
  `isDeleted` int DEFAULT '0',
  `isSubCatPublic` int DEFAULT '0',
  `plugin_id` int DEFAULT '0',
  `format_id` varchar(128) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `isSubCatInstalled` int DEFAULT '0',
  PRIMARY KEY (`sub_category_id`),
  KEY `cat_for_idx` (`category_id`),
  CONSTRAINT `cat_for` FOREIGN KEY (`category_id`) REFERENCES `api_category` (`api_category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_sub_category`
--

LOCK TABLES `api_sub_category` WRITE;
/*!40000 ALTER TABLE `api_sub_category` DISABLE KEYS */;
INSERT INTO `api_sub_category` VALUES (3,'GenerateImage',NULL,1,'2023-06-26 10:07:46','2023-06-27 13:48:47','POST',0,1,0,'4cbc23bd-1409-11ee-b65f-0e71b101e9a3','0',0),(4,'EditImage',NULL,1,'2023-06-26 10:31:47','2023-06-27 13:48:49','POST',0,1,0,'a740cf74-140c-11ee-b65f-0e71b101e9a3','0',0),(5,'GenerateImageVariations',NULL,1,'2023-06-26 10:39:42','2023-07-04 10:50:01','POST',0,1,0,'c252696f-140d-11ee-b65f-0e71b101e9a3','0',0),(6,'GenerateChatGPTResponse',NULL,1,'2023-06-26 11:21:23','2024-04-19 12:54:21','POST',0,1,0,'94ffeacf-1413-11ee-b65f-0e71b101e9a3','0',0),(9,'TextModeration',NULL,1,'2023-06-26 12:41:54','2024-04-19 12:56:00','POST',0,1,0,'d4a295c7-141e-11ee-b65f-0e71b101e9a3','0',0),(10,'TranscribeAudioTotext',NULL,1,'2023-06-26 12:55:57','2023-06-27 13:48:57','POST',0,1,0,'cb3f03e1-1420-11ee-b65f-0e71b101e9a3','0',0),(11,'GenerateTextEmbedding',NULL,1,'2023-06-26 13:07:04','2023-06-27 13:48:59','POST',0,1,0,'58b23a3c-1422-11ee-b65f-0e71b101e9a3','0',0),(12,'GetModels',NULL,2,'2023-04-06 14:08:05','2024-04-19 13:02:21','GET',0,1,0,'736b7c91-d484-11ed-a12c-0a62665f1d4f2','0',0),(14,'CreateChatCompletion',NULL,2,'2023-04-06 15:29:32','2024-04-19 13:03:21','POST',0,1,0,'d4197cca-d48f-11ed-a12c-0a62665f1d4f2','0',0),(16,'CreateImage',NULL,2,'2023-04-06 15:55:09','2024-04-19 17:41:00','POST',0,1,0,'6892ff94-d493-11ed-a12c-0a62665f1d4f2','0',0),(17,'CreateImageEdit',NULL,2,'2023-04-06 17:05:15','2023-06-27 12:33:25','POST',0,1,0,'331cfa09-d49d-11ed-a12c-0a62665f1d4f2','0',0),(18,'CreateImageVariation',NULL,2,'2023-04-06 17:52:01','2023-06-27 12:33:25','POST',0,1,0,'bb99cbad-d4a3-11ed-a12c-0a62665f1d4f2','0',0),(19,'CreateEmbeddings',NULL,2,'2023-04-06 17:58:57','2024-04-19 18:48:41','POST',0,1,0,'b3904e5f-d4a4-11ed-a12c-0a62665f1d4f2','0',0),(20,'CreateTranscription',NULL,2,'2023-04-06 18:06:26','2023-06-27 12:33:25','POST',0,1,0,'bf3a4794-d4a5-11ed-a12c-0a62665f1d4f2','0',0),(21,'CreateTranslation',NULL,2,'2023-04-06 18:14:54','2023-06-27 12:33:25','POST',0,1,0,'edfc0522-d4a6-11ed-a12c-0a62665f1d4f2','0',0),(22,'ListFiles',NULL,2,'2023-04-06 18:17:58','2023-06-27 12:33:25','GET',0,1,0,'5bb93563-d4a7-11ed-a12c-0a62665f1d4f2','0',0),(23,'UploadFile',NULL,2,'2023-04-06 18:26:52','2023-06-27 12:33:25','POST',0,1,0,'9a57882e-d4a8-11ed-a12c-0a62665f1d4f2','0',0),(24,'DeleteFile',NULL,2,'2023-04-06 18:30:03','2023-06-27 12:33:25','DELETE',0,1,0,'0c46e1a9-d4a9-11ed-a12c-0a62665f1d4f2','0',0),(25,'RetrieveFile',NULL,2,'2023-04-06 18:32:21','2024-04-19 19:03:46','GET',0,1,0,'5e1112f9-d4a9-11ed-a12c-0a62665f1d4f2','0',0),(26,'RetrieveFileContent',NULL,2,'2023-04-06 18:33:21','2024-04-19 19:05:46','GET',0,1,0,'820794aa-d4a9-11ed-a12c-0a62665f1d4f2','0',0),(27,'CreateFineTune',NULL,2,'2023-04-06 18:36:10','2024-04-23 06:47:32','POST',0,1,0,'e6d23275-d4a9-11ed-a12c-0a62665f1d4f2','0',0),(28,'ListFineTunes',NULL,2,'2023-04-06 18:50:13','2024-04-23 06:52:08','GET',0,1,0,'dd3e21d3-d4ab-11ed-a12c-0a62665f1d4f2','0',0),(29,'RetrieveFineTune',NULL,2,'2023-04-06 18:52:56','2024-04-23 07:30:00','GET',0,1,0,'3e5c397f-d4ac-11ed-a12c-0a62665f1d4f2','0',0),(30,'CancelFineTune',NULL,2,'2023-04-06 18:54:39','2024-04-23 07:33:38','POST',0,1,0,'7bde1536-d4ac-11ed-a12c-0a62665f1d4f2','0',0),(31,'ListFineTuneEvents',NULL,2,'2023-04-06 18:55:44','2024-04-23 08:01:05','GET',0,1,0,'a2434780-d4ac-11ed-a12c-0a62665f1d4f2','0',0),(32,'DeleteFineTunedModel',NULL,2,'2023-04-06 18:58:42','2024-04-23 08:11:57','DELETE',0,1,0,'0c8a247d-d4ad-11ed-a12c-0a62665f1d4f2','0',0),(33,'CreateModeration',NULL,2,'2023-04-06 19:04:17','2023-06-27 12:33:25','POST',0,1,0,'d46d963f-d4ad-11ed-a12c-0a62665f1d4f2','0',0),(36,'GetAllRowsV2',NULL,209,'2023-06-30 04:41:53','2023-07-07 10:53:00','GET',0,1,0,'6fc46c07-1700-11ee-b65f-0e71b101e9a3','0',0),(37,'FindRowsV2',NULL,209,'2023-06-30 04:53:34','2023-07-07 10:53:01','GET',0,1,0,'1184bc8a-1702-11ee-b65f-0e71b101e9a3','0',0),(39,'Auth',NULL,3,'2023-07-12 18:19:27','2023-07-18 09:13:31','GET',0,1,0,'a31349fd-20e0-11ee-b65f-0e71b101e9a3','0',0),(40,'GetAllInstances',NULL,3,'2023-07-12 18:21:11','2023-07-18 09:13:32','GET',0,1,0,'e0c54240-20e0-11ee-b65f-0e71b101e9a3','0',0),(41,'GetAllWorkspaces',NULL,3,'2023-07-12 18:27:47','2023-07-18 09:13:33','GET',0,1,0,'ccefedee-20e1-11ee-b65f-0e71b101e9a3','0',0),(42,'GetAllTables',NULL,3,'2023-07-12 18:57:42','2023-07-18 09:13:34','GET',0,1,0,'faad4e30-20e5-11ee-b65f-0e71b101e9a3','0',0),(43,'GetTableContent',NULL,3,'2023-07-12 19:04:42','2023-07-18 09:13:35','GET',0,1,0,'f56937df-20e6-11ee-b65f-0e71b101e9a3','0',0),(44,'SearchTableContent',NULL,3,'2023-07-12 19:31:13','2023-07-18 09:13:36','POST',0,1,0,'a9709b50-20ea-11ee-b65f-0e71b101e9a3','0',0),(45,'GetTableSchema',NULL,3,'2023-07-12 19:50:50','2023-07-18 09:13:37','GET',0,1,0,'6760d433-20ed-11ee-b65f-0e71b101e9a3','0',0),(46,'CreateTableContent',NULL,3,'2023-07-12 19:54:13','2023-07-18 09:13:37','POST',0,1,0,'dffaf69d-20ed-11ee-b65f-0e71b101e9a3','0',0),(47,'UpdateTableContent',NULL,3,'2023-07-13 06:50:17','2023-07-18 09:13:39','PUT',0,1,0,'86ae08c7-2149-11ee-b65f-0e71b101e9a3','0',0),(48,'DeleteTableContent',NULL,3,'2023-07-13 06:54:27','2023-07-18 09:13:39','DELETE',0,1,0,'1beaf785-214a-11ee-b65f-0e71b101e9a3','0',0),(49,'TruncateTable',NULL,3,'2023-07-13 07:00:41','2023-07-18 09:13:40','DELETE',0,1,0,'fae869f5-214a-11ee-b65f-0e71b101e9a3','0',0),(50,'ListBases',NULL,4,'2023-08-21 15:41:17','2023-09-26 10:32:04','GET',0,1,0,'2b422f76-4039-11ee-b65f-0e71b101e9a3','0',0),(51,'ListBaseSchema',NULL,4,'2023-08-21 15:44:20','2023-09-26 10:44:04','GET',0,1,0,'9815a319-4039-11ee-b65f-0e71b101e9a3','0',0),(52,'FindRows',NULL,4,'2023-08-21 15:51:00','2023-09-26 10:32:13','GET',0,1,0,'8699357a-403a-11ee-b65f-0e71b101e9a3','0',0),(53,'FindRowById',NULL,4,'2023-08-21 16:22:18','2023-09-26 11:56:12','GET',0,1,0,'e6021825-403e-11ee-b65f-0e71b101e9a3','0',0),(54,'CreateRow',NULL,4,'2023-08-21 16:39:56','2023-09-26 11:14:37','POST',0,1,0,'5c766c99-4041-11ee-b65f-0e71b101e9a3','0',0),(85,'UpdateRow',NULL,4,'2023-08-21 16:47:30','2023-09-26 10:32:16','PATCH',0,1,0,'6b5828d2-4042-11ee-b65f-0e71b101e9a3','0',0),(182,'DeleteRow',NULL,4,'2023-08-21 16:52:51','2023-09-26 10:32:18','DELETE',0,1,0,'2a897e59-4043-11ee-b65f-0e71b101e9a3','0',0),(241,'FindARow',NULL,4,'2023-08-21 17:22:44','2023-09-26 10:32:20','GET',0,1,0,'5751670f-4047-11ee-b65f-0e71b101e9a3','0',0),(254,'ListContainers',NULL,5,'2023-11-27 04:58:14','2023-12-12 14:20:08','GET',0,1,0,'9294ef65-8ce1-11ee-95d9-0e71b101e9a3','0',0),(287,'GetMyBoards',NULL,197,'2020-04-01 09:34:07','2020-04-05 04:00:26','GET',0,1,0,'1ee23c47-c237-11ec-a3c7-0a62665f1d4f','0',0),(288,'GetBoardLists',NULL,197,'2020-04-01 09:45:10','2020-12-22 10:55:32','GET',0,1,0,'1ee23ca6-c237-11ec-a3c7-0a62665f1d4f','0',0),(289,'AddCard',NULL,197,'2020-04-01 09:52:17','2020-12-22 10:56:52','POST',0,1,0,'1ee23cf4-c237-11ec-a3c7-0a62665f1d4f','0',0),(290,'GetChannelList',NULL,198,'2020-04-01 11:47:08','2021-09-02 10:47:50','GET',0,1,0,'1ee23d4a-c237-11ec-a3c7-0a62665f1d4f','0',0),(291,'SendMessageToChannel',NULL,198,'2020-04-01 12:09:38','2020-04-01 13:52:47','POST',0,1,0,'1ee23d96-c237-11ec-a3c7-0a62665f1d4f','0',0),(292,'GetUserList',NULL,198,'2020-04-01 12:13:13','2024-04-19 10:19:53','GET',0,1,0,'1ee23deb-c237-11ec-a3c7-0a62665f1d4f','0',0),(294,'MailSend (deprecated)',NULL,199,'2020-04-01 12:29:20','2021-02-24 10:15:15','POST',0,1,0,'1ee23efa-c237-11ec-a3c7-0a62665f1d4f','0',0),(295,'SendMessage',NULL,198,'2020-04-01 13:19:56','2020-04-13 07:15:45','POST',0,1,0,'1ee23e40-c237-11ec-a3c7-0a62665f1d4f','0',0),(296,'SendMessage',NULL,202,'2020-04-02 08:04:15','2020-04-30 15:36:55','POST',0,1,0,'1ee240eb-c237-11ec-a3c7-0a62665f1d4f','0',0),(297,'GetMessages',NULL,199,'2020-04-02 08:17:17','2020-04-17 11:39:47','GET',0,1,0,'1ee23f54-c237-11ec-a3c7-0a62665f1d4f','0',0),(304,'LookupPersonByEmail',NULL,205,'2020-04-03 07:47:45','2020-05-19 09:54:02','GET',0,1,0,'1ee25136-c237-11ec-a3c7-0a62665f1d4f','0',0),(305,'LookupCompanyByDomain',NULL,205,'2020-04-03 07:52:43','2020-04-03 07:52:43','GET',0,1,0,'1ee25182-c237-11ec-a3c7-0a62665f1d4f','0',0),(306,'LookupDomainByCompany',NULL,205,'2020-04-03 09:33:57','2020-04-03 09:33:57','GET',0,1,0,'1ee25338-c237-11ec-a3c7-0a62665f1d4f','0',0),(307,'CompanyAutocompleteByName',NULL,205,'2020-04-03 09:36:19','2020-04-03 09:36:19','GET',0,1,0,'1ee25393-c237-11ec-a3c7-0a62665f1d4f','0',0),(308,'CompanyLogoByDomain',NULL,205,'2020-04-03 09:39:00','2023-09-25 07:12:32','GET',0,1,0,'1ee253dc-c237-11ec-a3c7-0a62665f1d4f','0',0),(320,'GetSheetDetails',NULL,209,'2020-04-07 12:46:43','2021-12-08 11:58:06','GET',0,1,0,'1ee25488-c237-11ec-a3c7-0a62665f1d4f','0',0),(321,'CreateSheet',NULL,209,'2020-04-07 14:30:15','2020-04-07 14:30:15','POST',0,1,0,'1ee25854-c237-11ec-a3c7-0a62665f1d4f','0',0),(325,'CreateUser',NULL,210,'2020-04-08 11:36:48','2023-12-18 16:17:32','POST',0,1,0,'1ee25acb-c237-11ec-a3c7-0a62665f1d4f','0',0),(326,'CreateLead',NULL,210,'2020-04-08 11:44:58','2020-04-10 10:33:23','POST',0,1,0,'1ee25b59-c237-11ec-a3c7-0a62665f1d4f','0',0),(327,'GetContactById',NULL,210,'2020-04-08 11:49:19','2023-12-18 16:21:08','GET',0,1,0,'1ee25bbd-c237-11ec-a3c7-0a62665f1d4f','0',0),(328,'GetAllContacts',NULL,210,'2020-04-08 11:53:09','2023-12-18 16:20:27','GET',0,1,0,'1ee25c1b-c237-11ec-a3c7-0a62665f1d4f','0',0),(329,'UpdateUser',NULL,210,'2020-04-08 12:27:11','2023-12-18 16:21:37','PUT',0,1,0,'1ee25e6e-c237-11ec-a3c7-0a62665f1d4f','0',0),(330,'UpdateLead',NULL,210,'2020-04-08 12:58:51','2020-04-10 10:48:22','PUT',0,1,0,'1ee25fda-c237-11ec-a3c7-0a62665f1d4f','0',0),(331,'SearchByEmail',NULL,210,'2020-04-08 13:48:57','2023-12-18 16:21:58','POST',0,1,0,'1ee26072-c237-11ec-a3c7-0a62665f1d4f','0',0),(332,'ScrapeUrl',NULL,214,'2020-04-09 13:19:44','2020-04-10 10:21:16','GET',0,1,0,'1ee266f9-c237-11ec-a3c7-0a62665f1d4f','0',0),(333,'ScapeUrlUsingJavascript',NULL,214,'2020-04-09 13:24:59','2020-04-10 10:22:28','GET',0,1,0,'1ee26948-c237-11ec-a3c7-0a62665f1d4f','0',0),(334,'GetGroups',NULL,213,'2020-04-09 14:33:35','2020-04-09 14:33:35','GET',0,1,0,'1ee2642e-c237-11ec-a3c7-0a62665f1d4f','0',0),(335,'GenerateShortLink',NULL,213,'2020-04-09 14:36:40','2020-04-09 14:39:33','POST',0,1,0,'1ee2649e-c237-11ec-a3c7-0a62665f1d4f','0',0),(338,'ExtractArticle',NULL,215,'2020-04-10 09:52:46','2020-04-10 10:14:23','GET',0,1,0,'1ee26cbc-c237-11ec-a3c7-0a62665f1d4f','0',0),(339,'AnalyzeWebpage',NULL,215,'2020-04-10 09:53:54','2020-04-10 10:24:32','GET',0,1,0,'1ee30767-c237-11ec-a3c7-0a62665f1d4f','0',0),(340,'ExtractDiscussionThreads',NULL,215,'2020-04-10 09:56:56','2020-04-10 10:24:51','GET',0,1,0,'1ee30a28-c237-11ec-a3c7-0a62665f1d4f','0',0),(341,'ExtractImageInfo',NULL,215,'2020-04-10 10:01:59','2020-04-10 10:25:08','GET',0,1,0,'1ee30ade-c237-11ec-a3c7-0a62665f1d4f','0',0),(342,'ExtractVideoInfo',NULL,215,'2020-04-10 10:04:55','2020-04-10 10:25:22','GET',0,1,0,'1ee30b70-c237-11ec-a3c7-0a62665f1d4f','0',0),(345,'GetLocationFrom3Words',NULL,219,'2020-04-10 11:05:59','2020-04-16 06:39:55','GET',0,1,0,'1ee30c54-c237-11ec-a3c7-0a62665f1d4f','0',0),(346,'Get3WordsFromLocation',NULL,219,'2020-04-10 11:08:11','2020-04-10 11:08:11','GET',0,1,0,'1ee30ce0-c237-11ec-a3c7-0a62665f1d4f','0',0),(347,'GetProfile',NULL,220,'2020-04-10 12:46:29','2020-07-17 05:36:11','GET',0,1,0,'1ee310a6-c237-11ec-a3c7-0a62665f1d4f','0',0),(348,'GetUpcomingMeetings',NULL,220,'2020-04-10 12:52:00','2020-04-10 12:56:45','GET',0,1,0,'1ee31103-c237-11ec-a3c7-0a62665f1d4f','0',0),(349,'CreateMeeting',NULL,220,'2020-04-10 14:42:24','2020-04-10 15:08:48','POST',0,1,0,'1ee31149-c237-11ec-a3c7-0a62665f1d4f','0',0),(353,'DetectText',NULL,222,'2020-04-14 10:37:35','2022-05-10 11:47:31','POST',0,1,0,'1ee311a3-c237-11ec-a3c7-0a62665f1d4f','0',0),(354,'DetectTextV2',NULL,222,'2020-04-14 10:40:04','2022-05-10 11:36:04','POST',0,1,0,'1ee311e5-c237-11ec-a3c7-0a62665f1d4f','0',0),(355,'GetResources',NULL,223,'2020-04-14 11:28:51','2020-04-14 13:42:27','GET',0,1,0,'1ee3122d-c237-11ec-a3c7-0a62665f1d4f','0',0),(356,'GetProfile',NULL,223,'2020-04-14 11:39:14','2020-04-14 13:42:55','GET',0,1,0,'1ee3126d-c237-11ec-a3c7-0a62665f1d4f','0',0),(357,'GetProjects',NULL,223,'2020-04-14 14:06:23','2020-04-14 15:57:38','GET',0,1,0,'1ee312ad-c237-11ec-a3c7-0a62665f1d4f','0',0),(358,'GetAllIssueTypes',NULL,223,'2020-04-14 14:25:10','2020-04-14 15:57:53','GET',0,1,0,'1ee312ef-c237-11ec-a3c7-0a62665f1d4f','0',0),(359,'GetUsers',NULL,223,'2020-04-14 14:33:14','2020-04-14 15:58:10','GET',0,1,0,'1ee31334-c237-11ec-a3c7-0a62665f1d4f','0',0),(360,'GetAllPriorities',NULL,223,'2020-04-14 14:51:30','2020-04-14 15:58:28','GET',0,1,0,'1ee3136d-c237-11ec-a3c7-0a62665f1d4f','0',0),(361,'CreateIssue',NULL,223,'2020-04-14 15:26:26','2020-04-16 06:49:06','POST',0,1,0,'1ee313ab-c237-11ec-a3c7-0a62665f1d4f','0',0),(363,'GetProfile',NULL,224,'2020-04-17 14:15:31','2020-04-17 14:15:31','GET',0,1,0,'1ee313f3-c237-11ec-a3c7-0a62665f1d4f','0',0),(364,'GetForms',NULL,224,'2020-04-17 14:15:49','2020-04-17 14:53:01','GET',0,1,0,'1ee31430-c237-11ec-a3c7-0a62665f1d4f','0',0),(365,'GetFormResponse',NULL,224,'2020-04-17 14:41:28','2020-04-17 14:53:12','GET',0,1,0,'1ee3146a-c237-11ec-a3c7-0a62665f1d4f','0',0),(368,'GetTickets',NULL,227,'2020-04-20 15:07:13','2021-03-16 10:09:30','GET',0,1,0,'1ee314c0-c237-11ec-a3c7-0a62665f1d4f','0',0),(369,'GetProfile',NULL,227,'2020-04-20 15:08:20','2020-04-20 15:08:20','GET',0,1,0,'1ee31500-c237-11ec-a3c7-0a62665f1d4f','0',0),(371,'GetGroups',NULL,227,'2020-04-20 15:11:12','2020-04-20 15:11:12','GET',0,1,0,'1ee31579-c237-11ec-a3c7-0a62665f1d4f','0',0),(372,'GetUsers',NULL,227,'2020-04-20 15:16:47','2020-04-20 15:16:47','GET',0,1,0,'1ee315b6-c237-11ec-a3c7-0a62665f1d4f','0',0),(373,'CreateTicket',NULL,227,'2020-04-20 15:24:11','2022-06-23 05:46:50','POST',0,1,0,'1ee315f1-c237-11ec-a3c7-0a62665f1d4f','0',0),(380,'ViewAllTests',NULL,231,'2020-04-27 08:31:40','2020-04-27 10:13:39','GET',0,1,0,'1ee317cf-c237-11ec-a3c7-0a62665f1d4f','0',0),(381,'GetTestDetails',NULL,231,'2020-04-27 08:36:07','2020-04-27 10:54:23','GET',0,1,0,'1ee3181b-c237-11ec-a3c7-0a62665f1d4f','0',0),(382,'GetAllTemplates',NULL,231,'2020-04-27 10:03:08','2020-04-27 10:06:22','GET',0,1,0,'1ee31870-c237-11ec-a3c7-0a62665f1d4f','0',0),(383,'InviteCandidate',NULL,231,'2020-04-27 10:14:06','2020-04-27 10:27:21','POST',0,1,0,'1ee318b3-c237-11ec-a3c7-0a62665f1d4f','0',0),(389,'CreateTicket',NULL,233,'2020-05-04 13:11:57','2020-09-14 18:07:05','POST',0,1,0,'1ee319e3-c237-11ec-a3c7-0a62665f1d4f','0',0),(390,'SendTextMessage',NULL,234,'2020-05-05 13:59:58','2020-05-05 14:21:54','POST',0,1,0,'1ee33837-c237-11ec-a3c7-0a62665f1d4f','0',0),(391,'GetModels',NULL,235,'2020-05-06 13:02:24','2020-05-06 13:02:24','GET',0,1,0,'1ee338cd-c237-11ec-a3c7-0a62665f1d4f','0',0),(392,'PredictImage',NULL,235,'2020-05-06 13:05:30','2020-05-06 13:05:30','POST',0,1,0,'1ee33912-c237-11ec-a3c7-0a62665f1d4f','0',0),(393,'PredictVideo',NULL,235,'2020-05-06 13:11:47','2020-05-06 13:11:47','POST',0,1,0,'1ee33b20-c237-11ec-a3c7-0a62665f1d4f','0',0),(398,'CreateProduct',NULL,237,'2020-05-11 08:33:20','2020-09-11 17:10:34','POST',0,1,0,'1ee33b8c-c237-11ec-a3c7-0a62665f1d4f','0',0),(399,'GetProductList',NULL,237,'2020-05-11 09:21:37','2022-08-03 10:46:43','GET',0,1,0,'1ee33bd4-c237-11ec-a3c7-0a62665f1d4f','0',0),(400,'GetProductDetails',NULL,237,'2020-05-11 09:26:08','2020-09-11 17:14:01','GET',0,1,0,'1ee33f3c-c237-11ec-a3c7-0a62665f1d4f','0',0),(402,'UpdateProduct',NULL,237,'2020-05-11 12:35:04','2020-09-11 17:14:56','PUT',0,1,0,'1ee33f89-c237-11ec-a3c7-0a62665f1d4f','0',0),(403,'CreateProductVariant',NULL,237,'2020-05-11 13:15:21','2020-09-11 17:17:50','POST',0,1,0,'1ee34010-c237-11ec-a3c7-0a62665f1d4f','0',0),(406,'GetCompanyInfo',NULL,239,'2020-05-13 06:03:54','2020-05-13 06:03:54','GET',0,1,0,'1ee34167-c237-11ec-a3c7-0a62665f1d4f','0',0),(407,'CreateCustomer',NULL,239,'2020-05-13 11:47:33','2020-05-14 07:16:01','POST',0,1,0,'1ee341c7-c237-11ec-a3c7-0a62665f1d4f','0',0),(408,'GetSalesTerms',NULL,239,'2020-05-13 12:52:26','2020-05-13 13:05:20','GET',0,1,0,'1ee34409-c237-11ec-a3c7-0a62665f1d4f','0',0),(409,'FindCustomer',NULL,239,'2020-05-13 13:02:26','2020-05-13 13:02:26','GET',0,1,0,'1ee3454a-c237-11ec-a3c7-0a62665f1d4f','0',0),(410,'RunQuery',NULL,239,'2020-05-13 13:10:45','2020-05-14 09:40:16','GET',0,1,0,'1ee345b1-c237-11ec-a3c7-0a62665f1d4f','0',0),(411,'GetCompanyList',NULL,239,'2020-05-13 13:47:20','2020-05-13 14:25:03','GET',0,1,0,'1ee34911-c237-11ec-a3c7-0a62665f1d4f','0',0),(412,'GetVendorList',NULL,239,'2020-05-13 14:59:16','2020-05-13 15:52:36','GET',0,1,0,'1ee3497d-c237-11ec-a3c7-0a62665f1d4f','0',0),(413,'CreateVendor',NULL,239,'2020-05-13 15:48:49','2020-05-13 15:51:59','POST',0,1,0,'1ee34bb1-c237-11ec-a3c7-0a62665f1d4f','0',0),(414,'CreateAccount',NULL,239,'2020-05-14 07:30:03','2020-05-14 07:37:16','POST',0,1,0,'1ee34dea-c237-11ec-a3c7-0a62665f1d4f','0',0),(415,'GetAccountList',NULL,239,'2020-05-14 07:39:50','2020-05-14 07:39:50','GET',0,1,0,'1ee350a5-c237-11ec-a3c7-0a62665f1d4f','0',0),(416,'GetInvoiceList',NULL,239,'2020-05-14 09:43:46','2020-05-14 09:43:46','GET',0,1,0,'1ee3bb7a-c237-11ec-a3c7-0a62665f1d4f','0',0),(417,'SendInvoice',NULL,239,'2020-05-14 09:51:20','2020-05-14 09:51:20','POST',0,1,0,'1ee3bc0d-c237-11ec-a3c7-0a62665f1d4f','0',0),(418,'GetSalesReceipt',NULL,239,'2020-05-14 09:58:17','2020-05-14 09:58:17','GET',0,1,0,'1ee3bc6b-c237-11ec-a3c7-0a62665f1d4f','0',0),(419,'SendSalesReceipt',NULL,239,'2020-05-14 10:04:44','2020-05-14 10:04:44','POST',0,1,0,'1ee3bcb2-c237-11ec-a3c7-0a62665f1d4f','0',0),(421,'TranslateText',NULL,241,'2020-05-14 15:13:19','2020-05-14 15:27:10','GET',0,1,0,'1ee3bd1d-c237-11ec-a3c7-0a62665f1d4f','0',0),(434,'GetCalendarList',NULL,248,'2020-05-18 15:16:19','2020-05-18 15:16:19','GET',0,1,0,'1ee3c00a-c237-11ec-a3c7-0a62665f1d4f','0',0),(435,'GetPrimaryCalendar',NULL,248,'2020-05-18 15:19:32','2020-05-18 15:21:03','GET',0,1,0,'1ee3c057-c237-11ec-a3c7-0a62665f1d4f','0',0),(436,'AddQuickEvent',NULL,248,'2020-05-18 15:27:35','2020-05-18 15:27:35','POST',0,1,0,'1ee3c095-c237-11ec-a3c7-0a62665f1d4f','0',0),(438,'AddDetailedEvent',NULL,248,'2020-05-18 16:04:48','2020-05-19 09:44:05','POST',0,1,0,'1ee3c111-c237-11ec-a3c7-0a62665f1d4f','0',0),(453,'GetProjectList',NULL,254,'2020-05-25 14:35:12','2021-12-27 12:56:11','GET',0,1,0,'1ee3c245-c237-11ec-a3c7-0a62665f1d4f','0',0),(454,'GetWorkspaces',NULL,254,'2020-05-25 14:38:34','2020-05-25 14:38:34','GET',0,1,0,'1ee3c287-c237-11ec-a3c7-0a62665f1d4f','0',0),(455,'GetWorkspaceDetails',NULL,254,'2020-05-25 14:42:21','2020-05-25 14:57:34','GET',0,1,0,'1ee3c2c5-c237-11ec-a3c7-0a62665f1d4f','0',0),(456,'CreateProject',NULL,254,'2020-05-25 15:03:38','2023-10-12 18:54:58','POST',0,1,0,'1ee3c304-c237-11ec-a3c7-0a62665f1d4f','0',0),(457,'GetUsers',NULL,254,'2020-05-25 15:08:53','2020-05-25 15:08:53','GET',0,1,0,'1ee3c341-c237-11ec-a3c7-0a62665f1d4f','0',0),(458,'GetSections',NULL,254,'2020-05-25 15:11:52','2020-05-25 15:11:52','GET',0,1,0,'1ee3c386-c237-11ec-a3c7-0a62665f1d4f','0',0),(459,'GetProjectStatus',NULL,254,'2020-05-25 15:16:47','2020-05-25 15:16:47','GET',0,1,0,'1ee3c3c5-c237-11ec-a3c7-0a62665f1d4f','0',0),(460,'GetTags',NULL,254,'2020-05-25 16:25:58','2020-05-25 16:27:17','GET',0,1,0,'1ee3c404-c237-11ec-a3c7-0a62665f1d4f','0',0),(461,'CreateTask',NULL,254,'2020-05-25 16:36:05','2020-05-25 16:42:03','POST',0,1,0,'1ee3c442-c237-11ec-a3c7-0a62665f1d4f','0',0),(462,'AddTaskToSection',NULL,254,'2020-05-26 05:34:39','2020-05-26 08:00:37','POST',0,1,0,'1ee3c47d-c237-11ec-a3c7-0a62665f1d4f','0',0),(463,'GetTasksByProjects',NULL,254,'2020-05-26 07:58:05','2021-12-27 16:23:20','GET',0,1,0,'1ee3c4bb-c237-11ec-a3c7-0a62665f1d4f','0',0),(475,'AllSupportedFormats',NULL,257,'2020-05-26 15:23:47','2020-05-26 15:24:54','GET',0,1,0,'1ee3c840-c237-11ec-a3c7-0a62665f1d4f','0',0),(476,'FilterFormatsByInput',NULL,257,'2020-05-26 15:26:28','2020-05-26 15:37:47','GET',0,1,0,'1ee3c87e-c237-11ec-a3c7-0a62665f1d4f','0',0),(479,'CreateConvertFileJob',NULL,257,'2020-05-28 16:20:50','2020-05-29 08:24:40','POST',0,1,0,'1ee3c8bf-c237-11ec-a3c7-0a62665f1d4f','0',0),(480,'ShowJob',NULL,257,'2020-05-28 16:24:31','2020-05-29 08:57:02','GET',0,1,0,'1ee3c911-c237-11ec-a3c7-0a62665f1d4f','0',0),(481,'WaitForAJob',NULL,257,'2020-05-28 16:26:41','2020-05-28 16:33:42','GET',0,1,0,'1ee3c95e-c237-11ec-a3c7-0a62665f1d4f','0',0),(482,'ListJobs',NULL,257,'2020-05-28 16:27:29','2020-05-28 16:31:52','GET',0,1,0,'1ee3c9ea-c237-11ec-a3c7-0a62665f1d4f','0',0),(484,'CaptureWebsiteJob',NULL,257,'2020-05-29 08:46:15','2020-05-29 08:56:21','POST',0,1,0,'1ee3ca55-c237-11ec-a3c7-0a62665f1d4f','0',0),(489,'GetProfile',NULL,265,'2020-05-29 14:51:14','2020-05-30 15:39:23','GET',0,1,0,'1ee3cdbc-c237-11ec-a3c7-0a62665f1d4f','0',0),(490,'GetUserRepos',NULL,265,'2020-05-29 15:20:09','2020-05-29 15:24:57','GET',0,1,0,'1ee3ce1e-c237-11ec-a3c7-0a62665f1d4f','0',0),(491,'ListAllOrganizations',NULL,265,'2020-05-29 15:29:31','2020-05-29 15:30:33','GET',0,1,0,'1ee3ce80-c237-11ec-a3c7-0a62665f1d4f','0',0),(492,'CreateGist',NULL,265,'2020-05-29 15:42:10','2020-05-29 15:42:10','POST',0,1,0,'1ee3cee6-c237-11ec-a3c7-0a62665f1d4f','0',0),(493,'GetRepoUsers',NULL,265,'2020-05-30 15:40:18','2023-10-05 07:23:33','GET',0,1,0,'1ee3cf46-c237-11ec-a3c7-0a62665f1d4f','0',0),(494,'CreateIssue',NULL,265,'2020-05-30 15:52:37','2023-10-05 09:59:54','POST',0,1,0,'1ee3cfac-c237-11ec-a3c7-0a62665f1d4f','0',0),(495,'GetAllLabels',NULL,265,'2020-05-30 15:56:12','2023-10-05 10:01:26','GET',0,1,0,'1ee3d00e-c237-11ec-a3c7-0a62665f1d4f','0',0),(496,'GetIssueList',NULL,265,'2020-06-01 08:19:45','2023-10-05 10:02:18','GET',0,1,0,'1ee3d06e-c237-11ec-a3c7-0a62665f1d4f','0',0),(497,'UpdateIssue',NULL,265,'2020-06-01 08:29:01','2023-10-05 10:04:11','POST',0,1,0,'1ee3d0ac-c237-11ec-a3c7-0a62665f1d4f','0',0),(498,'CreateComment',NULL,265,'2020-06-01 11:21:49','2023-10-05 10:05:12','POST',0,1,0,'1ee3d0e8-c237-11ec-a3c7-0a62665f1d4f','0',0),(511,'SendWhatsappTextMessage',NULL,202,'2020-06-15 11:24:09','2020-06-16 13:10:35','POST',0,1,0,'1ee24f39-c237-11ec-a3c7-0a62665f1d4f','0',0),(512,'SendWhatsappMediaMessage',NULL,202,'2020-06-15 11:29:03','2020-06-15 11:29:03','POST',0,1,0,'1ee24fa0-c237-11ec-a3c7-0a62665f1d4f','0',0),(584,'SendMessageWithBlocks',NULL,198,'2020-08-13 14:17:21','2020-08-13 15:03:31','POST',0,1,0,'1ee23e97-c237-11ec-a3c7-0a62665f1d4f','0',0),(685,'ViewTicketById',NULL,233,'2020-09-14 11:38:06','2020-09-14 11:44:41','GET',0,1,0,'1ee326b3-c237-11ec-a3c7-0a62665f1d4f','0',0),(686,'ListConversationOfATicket',NULL,233,'2020-09-14 11:50:38','2020-09-14 11:51:37','GET',0,1,0,'1ee3272a-c237-11ec-a3c7-0a62665f1d4f','0',0),(687,'AddNotesToATicket',NULL,233,'2020-09-14 11:59:35','2020-09-14 12:08:23','POST',0,1,0,'1ee3277f-c237-11ec-a3c7-0a62665f1d4f','0',0),(689,'UpdateTicket',NULL,233,'2020-09-14 12:25:04','2020-09-14 12:36:55','PUT',0,1,0,'1ee327ca-c237-11ec-a3c7-0a62665f1d4f','0',0),(691,'ViewAllContacts',NULL,233,'2020-09-14 14:04:37','2020-09-14 14:04:37','GET',0,1,0,'1ee32812-c237-11ec-a3c7-0a62665f1d4f','0',0),(692,'ViewContactById',NULL,233,'2020-09-14 14:17:08','2020-09-14 14:17:08','GET',0,1,0,'1ee3285b-c237-11ec-a3c7-0a62665f1d4f','0',0),(693,'CreateReply',NULL,233,'2020-09-14 17:56:55','2020-09-17 16:40:55','POST',0,1,0,'1ee328af-c237-11ec-a3c7-0a62665f1d4f','0',0),(702,'GetAllRows',NULL,209,'2020-09-26 10:13:52','2022-01-11 04:11:33','GET',0,1,0,'e2cea3d4-a8ee-11ec-8a6a-0242ac120002','0',0),(703,'SendEmail',NULL,341,'2020-09-26 16:45:49','2020-09-30 12:30:08','POST',0,1,0,'e2cea3fc-a8ee-11ec-8a6a-0242ac120002','0',0),(705,'SendMail',NULL,247,'2020-09-29 07:14:53','2020-10-13 14:58:56','POST',0,1,0,'e2cea424-a8ee-11ec-8a6a-0242ac120002','0',0),(779,'AddRows',NULL,209,'2020-10-20 09:28:26','2021-12-08 15:08:02','POST',0,1,0,'e2cea44c-a8ee-11ec-8a6a-0242ac120002','0',0),(792,'CreatePaymentLink',NULL,370,'2020-10-23 13:47:55','2020-12-16 12:28:09','POST',0,1,0,'1ee3d25e-c237-11ec-a3c7-0a62665f1d4f','0',0),(808,'GetFiles',NULL,5,'2023-11-27 05:14:25','2023-12-12 14:20:09','POST',0,1,0,'d4f71e50-8ce3-11ee-95d9-0e71b101e9a3','0',0),(809,'UploadFile',NULL,5,'2023-11-27 07:34:48','2023-12-12 14:20:10','POST',0,1,0,'71d7ab26-8cf7-11ee-95d9-0e71b101e9a3','0',0),(817,'Get All Templates',NULL,199,'2020-11-11 06:39:25','2020-11-11 06:40:46','GET',0,1,0,'1ee23fab-c237-11ec-a3c7-0a62665f1d4f','0',0),(818,'Send Mail',NULL,199,'2020-11-11 06:50:08','2021-04-15 09:28:54','POST',0,1,0,'e2cea4ee-a8ee-11ec-8a6a-0242ac120002','0',0),(819,'Send Mail With Legacy Templates',NULL,199,'2020-11-11 09:49:28','2020-12-22 11:46:18','POST',0,1,0,'e2cea516-a8ee-11ec-8a6a-0242ac120002','0',0),(820,'Get Template By ID',NULL,199,'2020-11-11 09:51:07','2020-11-11 09:51:07','GET',0,1,0,'1ee2408f-c237-11ec-a3c7-0a62665f1d4f','0',0),(821,'Find Rows',NULL,209,'2020-11-11 09:58:47','2021-10-22 11:44:46','GET',0,1,0,'e2cea567-a8ee-11ec-8a6a-0242ac120002','0',0),(822,'UpdateRow',NULL,209,'2020-11-11 10:01:15','2021-12-08 15:42:12','PUT',0,1,0,'e2cea591-a8ee-11ec-8a6a-0242ac120002','0',0),(823,'Clear Row',NULL,209,'2020-11-11 10:03:14','2020-12-04 12:41:35','POST',0,1,0,'e2cea5bb-a8ee-11ec-8a6a-0242ac120002','0',0),(825,'Find a Row',NULL,209,'2020-11-11 10:05:03','2022-02-01 12:06:56','GET',0,1,0,'e2cea5e5-a8ee-11ec-8a6a-0242ac120002','0',0),(849,'GetSignedUrl',NULL,5,'2023-11-27 07:38:36','2023-12-12 14:20:12','POST',0,1,0,'f92c461b-8cf7-11ee-95d9-0e71b101e9a3','0',0),(906,'Find Rows',NULL,392,'2020-12-07 06:07:18','2023-07-12 06:42:05','GET',0,1,0,'e2cea60d-a8ee-11ec-8a6a-0242ac120002','0',0),(907,'Find a Row',NULL,392,'2020-12-07 06:25:18','2022-02-01 12:15:26','GET',0,1,0,'e2cea634-a8ee-11ec-8a6a-0242ac120002','0',0),(908,'Create Row',NULL,392,'2020-12-07 06:39:30','2020-12-08 04:22:57','POST',0,1,0,'e2cea65d-a8ee-11ec-8a6a-0242ac120002','0',0),(909,'Update Row',NULL,392,'2020-12-07 06:47:45','2020-12-07 06:52:04','PATCH',0,1,0,'1ee3dd40-c237-11ec-a3c7-0a62665f1d4f','0',0),(910,'Delete Row',NULL,392,'2020-12-07 06:54:36','2020-12-07 06:54:36','DELETE',0,1,0,'1ee3dd81-c237-11ec-a3c7-0a62665f1d4f','0',0),(912,'Generate PDF',NULL,393,'2020-12-07 10:12:46','2021-01-28 12:04:25','POST',0,1,0,'1ee3ddd8-c237-11ec-a3c7-0a62665f1d4f','0',0),(916,'UploadFile','',6,'2021-08-13 15:25:27','2024-11-22 06:35:42','PUT',0,1,0,'e2ceb296-a8ee-11ec-8a6a-0242ac120002','0',0),(917,'GetPreSignedUrl','',6,'2021-08-13 15:25:08','2024-07-11 05:55:42','GET',0,1,0,'e2ceb26d-a8ee-11ec-8a6a-0242ac120002','0',0),(918,'ListObjects','',6,'2021-08-16 04:58:43','2024-07-11 05:55:43','GET',0,1,0,'1ee40dcc-c237-11ec-a3c7-0a62665f1d4f','0',0),(919,'DeleteObjects','',6,'2023-02-15 14:29:10','2024-07-11 05:55:43','GET',0,1,0,'1cb353a8-ad3d-11ed-9c66-0a62665f1d4f','0',0),(922,'CopyObject','',6,'2023-03-08 15:42:54','2024-07-11 05:55:43','GET',0,1,0,'e465e637-bdc7-11ed-9c66-0a62665f1d4f','0',0),(932,'ReadFile',NULL,639,'2024-03-20 15:53:45','2024-03-26 12:00:55','GET',0,1,0,'08a256be-e6d2-11ee-aa73-0affc745b639','0',0),(933,'DownloadFile',NULL,639,'2024-03-20 16:10:31','2024-03-26 12:00:57','GET',0,1,0,'604faebc-e6d4-11ee-aa73-0affc745b639','0',0),(941,'Call Workflow from Another App',NULL,393,'2020-12-17 15:04:42','2021-03-17 13:10:33','POST',0,1,0,'1ee3de19-c237-11ec-a3c7-0a62665f1d4f','0',0),(969,'File Upload',NULL,393,'2020-12-28 06:49:32','2021-01-29 04:59:46','POST',0,1,0,'1ee3e11b-c237-11ec-a3c7-0a62665f1d4f','0',0),(1036,'SearchTickets',NULL,233,'2021-01-08 15:17:29','2021-01-27 14:12:27','GET',0,1,0,'1ee33695-c237-11ec-a3c7-0a62665f1d4f','0',0),(1050,'GetPDF',NULL,7,'2024-03-28 07:09:15','2024-07-25 13:55:45','POST',0,1,0,'164063e9-ecd2-11ee-aa73-0affc745b639','0',0),(1085,'GetOrderDetails',NULL,237,'2021-01-20 16:26:52','2021-05-26 13:46:07','GET',0,1,0,'1ee3407e-c237-11ec-a3c7-0a62665f1d4f','0',0),(1087,'ViewAllTickets',NULL,233,'2021-01-21 05:13:23','2021-01-27 14:22:56','GET',0,1,0,'1ee337c7-c237-11ec-a3c7-0a62665f1d4f','0',0),(1098,'Push Notification',NULL,393,'2021-01-22 07:40:30','2021-01-29 10:57:18','PUT',0,1,0,'1ee3e179-c237-11ec-a3c7-0a62665f1d4f','0',0),(1188,'GetPDFURL',NULL,7,'2024-03-28 07:13:13','2024-07-01 09:17:02','POST',0,1,0,'a40d10cd-ecd2-11ee-aa73-0affc745b639','0',0),(1239,'UpdateTicket',NULL,227,'2021-02-27 14:27:22','2021-02-27 14:52:44','PUT',0,1,0,'1ee31647-c237-11ec-a3c7-0a62665f1d4f','0',0),(1240,'AddTagsToTicket',NULL,227,'2021-02-27 14:48:34','2021-02-27 14:48:57','PUT',0,1,0,'1ee3169e-c237-11ec-a3c7-0a62665f1d4f','0',0),(1242,'AddCommentToTicket',NULL,227,'2021-02-27 15:01:47','2021-02-27 15:01:47','PUT',0,1,0,'1ee316df-c237-11ec-a3c7-0a62665f1d4f','0',0),(1244,'FindTicket',NULL,227,'2021-02-27 15:48:07','2021-02-27 15:51:05','GET',0,1,0,'1ee31726-c237-11ec-a3c7-0a62665f1d4f','0',0),(1256,'RetrieveBotUserInfo',NULL,8,'2024-09-26 08:17:48','2024-10-03 04:52:09','GET',0,1,0,'d10a02fc-7bdf-11ef-b858-0affc745b639','0',0),(1317,'CreateTicketWithRequester',NULL,227,'2021-03-16 15:01:29','2021-03-17 05:32:17','POST',0,1,0,'1ee31771-c237-11ec-a3c7-0a62665f1d4f','0',0),(1374,'ListAllUsers',NULL,8,'2024-09-26 08:22:29','2024-10-03 04:52:11','GET',0,1,0,'786ee967-7be0-11ef-b858-0affc745b639','0',0),(1404,'RetrieveAUser',NULL,8,'2024-09-26 08:24:23','2024-10-03 04:52:13','GET',0,1,0,'bc6c2772-7be0-11ef-b858-0affc745b639','0',0),(1417,'SendVerify',NULL,202,'2021-04-15 10:59:02','2021-04-15 13:14:01','POST',0,1,0,'1ee25005-c237-11ec-a3c7-0a62665f1d4f','0',0),(1418,'SendVerifyWithConfiguration',NULL,202,'2021-04-15 11:29:20','2021-04-15 13:17:42','POST',0,1,0,'1ee25057-c237-11ec-a3c7-0a62665f1d4f','0',0),(1419,'VerifyCode',NULL,202,'2021-04-15 11:36:38','2021-04-15 13:18:22','POST',0,1,0,'1ee250c7-c237-11ec-a3c7-0a62665f1d4f','0',0),(1454,'RetrieveADatabase',NULL,8,'2024-09-26 08:38:12','2024-10-03 04:52:14','GET',0,1,0,'aa7ff616-7be2-11ef-b858-0affc745b639','0',0),(1455,'CreateADatabase',NULL,8,'2024-09-26 08:56:21','2024-10-03 04:52:19','POST',0,1,0,'33d45dbb-7be5-11ef-b858-0affc745b639','0',0),(1530,'UpdateADatabase',NULL,8,'2024-09-26 11:26:46','2024-10-03 04:52:20','PATCH',0,1,0,'37089c96-7bfa-11ef-b858-0affc745b639','0',0),(1532,'QueryADatabase',NULL,8,'2024-09-26 11:37:43','2024-10-03 04:52:21','POST',0,1,0,'bec8ded6-7bfb-11ef-b858-0affc745b639','0',0),(1535,'RetrieveAPage',NULL,8,'2024-09-26 11:41:53','2024-10-03 04:52:23','GET',0,1,0,'53a2740b-7bfc-11ef-b858-0affc745b639','0',0),(1540,'RetrieveAPagePropertyItem',NULL,8,'2024-09-26 11:45:48','2024-10-03 04:52:24','GET',0,1,0,'df6c9454-7bfc-11ef-b858-0affc745b639','0',0),(1554,'CreateAPage',NULL,8,'2024-09-26 11:52:04','2024-10-03 04:52:26','POST',0,1,0,'bf9ddf1a-7bfd-11ef-b858-0affc745b639','0',0),(1555,'UpdatePageProperties',NULL,8,'2024-09-26 12:00:53','2024-10-03 06:31:02','PATCH',0,1,0,'fb09b073-7bfe-11ef-b858-0affc745b639','0',0),(1556,'SearchByTitle',NULL,8,'2024-09-26 12:07:44','2024-10-03 04:52:31','POST',0,1,0,'efd826f0-7bff-11ef-b858-0affc745b639','0',0),(1557,'RetrieveComments',NULL,8,'2024-09-26 12:14:54','2024-10-03 04:52:33','GET',0,1,0,'f04214d8-7c00-11ef-b858-0affc745b639','0',0),(1562,'CreateComment',NULL,8,'2024-09-26 12:19:40','2024-10-03 04:52:34','POST',0,1,0,'9ae4e77e-7c01-11ef-b858-0affc745b639','0',0),(1568,'RetrieveABlock',NULL,8,'2024-09-26 12:31:01','2024-10-03 04:52:39','GET',0,1,0,'30970a20-7c03-11ef-b858-0affc745b639','0',0),(1572,'RetrieveBlockChildren',NULL,8,'2024-09-26 12:38:22','2024-10-03 04:52:41','GET',0,1,0,'37657ac8-7c04-11ef-b858-0affc745b639','0',0),(1573,'DeleteABlock',NULL,8,'2024-09-26 12:42:26','2024-10-03 04:52:43','DELETE',0,1,0,'c93fe39b-7c04-11ef-b858-0affc745b639','0',0),(1574,'UpdateABlock',NULL,8,'2024-09-26 12:46:50','2024-10-03 04:52:44','PATCH',0,1,0,'6656c8b0-7c05-11ef-b858-0affc745b639','0',0),(1575,'AppendBlockChildren',NULL,8,'2024-09-26 12:53:08','2024-10-03 04:52:46','PATCH',0,1,0,'4797bb87-7c06-11ef-b858-0affc745b639','0',0),(1604,'GetContacts',NULL,483,'2021-05-11 16:18:01','2024-02-09 14:45:54','GET',0,1,0,'1ee3f95e-c237-11ec-a3c7-0a62665f1d4f','0',0),(1609,'CreateContact',NULL,483,'2021-05-12 14:04:47','2024-01-25 09:41:00','POST',0,1,0,'1ee3f9b8-c237-11ec-a3c7-0a62665f1d4f','0',0),(1610,'GetOwners',NULL,483,'2021-05-12 14:51:38','2021-05-12 14:56:35','GET',0,1,0,'1ee3fa07-c237-11ec-a3c7-0a62665f1d4f','0',0),(1611,'SearchContacts',NULL,483,'2021-05-12 15:45:56','2021-05-12 18:41:13','POST',0,1,0,'1ee3fa49-c237-11ec-a3c7-0a62665f1d4f','0',0),(1612,'ListObjectsAdvanced',NULL,639,'2024-11-06 08:25:36','2024-11-12 09:33:26','GET',0,1,0,'b28a9e4e-9c18-11ef-b858-0affc745b639','0',0),(1613,'GetDeals',NULL,483,'2021-05-12 17:06:18','2021-05-12 18:53:03','GET',0,1,0,'1ee3fa8d-c237-11ec-a3c7-0a62665f1d4f','0',0),(1632,'GetPaymentRequests',NULL,497,'2021-05-18 10:08:29','2021-05-18 10:36:49','GET',0,1,0,'1ee3faf9-c237-11ec-a3c7-0a62665f1d4f','0',0),(1634,'CreatePaymentRequest',NULL,497,'2021-05-18 10:26:28','2021-05-18 11:02:50','POST',0,1,0,'1ee3fb4e-c237-11ec-a3c7-0a62665f1d4f','0',0),(1635,'GetPaymentDetails',NULL,497,'2021-05-18 10:42:13','2021-05-18 10:42:13','GET',0,1,0,'1ee3fb9d-c237-11ec-a3c7-0a62665f1d4f','0',0),(1636,'GetPaymentRequestDetails',NULL,497,'2021-05-18 10:43:45','2021-05-18 10:43:45','GET',0,1,0,'1ee3fbee-c237-11ec-a3c7-0a62665f1d4f','0',0),(1637,'InitiateRefund',NULL,497,'2021-05-18 10:56:44','2021-05-18 10:56:44','POST',0,1,0,'1ee3fc43-c237-11ec-a3c7-0a62665f1d4f','0',0),(1638,'GetRefundsList',NULL,497,'2021-05-18 10:58:33','2021-05-18 10:58:33','GET',0,1,0,'1ee409a1-c237-11ec-a3c7-0a62665f1d4f','0',0),(1639,'GetRefundDetails',NULL,497,'2021-05-18 11:00:06','2021-05-18 11:00:06','GET',0,1,0,'1ee409f3-c237-11ec-a3c7-0a62665f1d4f','0',0),(1743,'GetAccount',NULL,509,'2021-05-25 16:03:15','2021-05-25 16:03:15','GET',0,1,0,'1ee40a61-c237-11ec-a3c7-0a62665f1d4f','0',0),(1744,'GetCustomerList',NULL,509,'2021-05-25 16:16:24','2021-05-25 16:23:00','GET',0,1,0,'1ee40ac7-c237-11ec-a3c7-0a62665f1d4f','0',0),(1752,'CreateCustomer',NULL,509,'2021-05-26 10:33:17','2021-05-26 10:33:17','POST',0,1,0,'1ee40b60-c237-11ec-a3c7-0a62665f1d4f','0',0),(1753,'UpdateCustomer',NULL,509,'2021-05-26 10:38:54','2021-05-26 11:04:23','POST',0,1,0,'1ee40bae-c237-11ec-a3c7-0a62665f1d4f','0',0),(1754,'GetAllCharges',NULL,509,'2021-05-26 10:54:46','2021-05-26 10:57:26','GET',0,1,0,'1ee40bfd-c237-11ec-a3c7-0a62665f1d4f','0',0),(1760,'InitiateRefund',NULL,509,'2021-05-26 12:02:56','2021-05-26 12:04:02','POST',0,1,0,'1ee40c4b-c237-11ec-a3c7-0a62665f1d4f','0',0),(1768,'GetAllOrders',NULL,237,'2021-05-26 14:18:52','2021-05-26 15:50:56','GET',0,1,0,'1ee340eb-c237-11ec-a3c7-0a62665f1d4f','0',0),(2201,'GetPreSignedUrl',NULL,639,'2021-08-13 15:25:08','2023-05-13 10:44:24','GET',0,1,0,'e2ceb26d-a8ee-11ec-8a6a-0242ac120002','0',0),(2202,'UploadFile',NULL,639,'2021-08-13 15:25:27','2023-05-13 10:44:50','PUT',0,1,0,'e2ceb296-a8ee-11ec-8a6a-0242ac120002','0',0),(2224,'ListBuckets',NULL,639,'2021-08-16 04:56:04','2023-05-13 10:45:19','GET',0,1,0,'1ee40d72-c237-11ec-a3c7-0a62665f1d4f','0',0),(2225,'ListObjects',NULL,639,'2021-08-16 04:58:43','2023-07-08 12:14:36','GET',0,1,0,'1ee40dcc-c237-11ec-a3c7-0a62665f1d4f','0',0),(2344,'GetFunctionDetails',NULL,663,'2021-08-23 14:53:47','2024-04-19 11:27:09','GET',0,1,0,'1ee40e84-c237-11ec-a3c7-0a62665f1d4f','0',0),(2345,'InvokeFunction',NULL,663,'2021-08-23 15:01:08','2024-04-18 13:50:46','POST',0,1,0,'1ee40ee2-c237-11ec-a3c7-0a62665f1d4f','0',0),(2346,'ListFunctions',NULL,663,'2021-08-23 17:29:55','2024-04-18 10:35:07','GET',0,1,0,'1ee40f33-c237-11ec-a3c7-0a62665f1d4f','0',0),(2478,'GetBuckets',NULL,696,'2021-09-04 04:45:12','2021-09-04 04:47:03','GET',0,1,0,'e2ceb42d-a8ee-11ec-8a6a-0242ac120002','0',0),(2479,'GetFiles',NULL,696,'2021-09-04 04:49:30','2021-09-07 12:48:51','POST',0,1,0,'e2ceb456-a8ee-11ec-8a6a-0242ac120002','0',0),(2480,'GetSignedUrl',NULL,696,'2021-09-04 04:55:56','2021-09-07 13:05:56','POST',0,1,0,'e2ceb47e-a8ee-11ec-8a6a-0242ac120002','0',0),(2481,'UploadFile',NULL,696,'2021-09-04 05:07:59','2021-09-07 12:45:31','POST',0,1,0,'e2ceb4a9-a8ee-11ec-8a6a-0242ac120002','0',0),(3431,'GetTaskDetails',NULL,254,'2021-12-27 12:59:11','2021-12-27 13:00:28','GET',0,1,0,'1ee3c50a-c237-11ec-a3c7-0a62665f1d4f','0',0),(3432,'DeleteTask',NULL,254,'2021-12-27 13:04:49','2021-12-27 13:04:49','DELETE',0,1,0,'1ee3c573-c237-11ec-a3c7-0a62665f1d4f','0',0),(3433,'UpdateTask',NULL,254,'2021-12-27 13:08:37','2021-12-27 13:20:21','PUT',0,1,0,'1ee3c5ba-c237-11ec-a3c7-0a62665f1d4f','0',0),(5792,'sendMail',NULL,2062,'2022-04-26 12:20:41','2023-03-10 07:19:28','POST',0,1,0,'46da153a-39c3-11ed-af73-0a62665f1d4f','0',0),(5848,'AddMultipleRows',NULL,209,'2022-05-02 13:39:53','2022-08-26 11:19:57','POST',0,1,0,'4e0dfb19-39c3-11ed-af73-0a62665f1d4f','0',0),(6279,'FindRowById',NULL,392,'2022-05-30 10:43:12','2022-05-30 10:43:12','GET',0,1,0,NULL,'0',0),(6668,'CreateProduct',NULL,509,'2022-06-20 18:21:07','2022-06-20 18:35:56','POST',0,1,0,NULL,'0',0),(6669,'GetProductDetails',NULL,509,'2022-06-20 18:27:08','2022-06-20 19:40:06','GET',0,1,0,NULL,'0',0),(6670,'ListAllProducts',NULL,509,'2022-06-20 18:30:31','2022-06-20 18:31:58','GET',0,1,0,NULL,'0',0),(6671,'DeleteProduct',NULL,509,'2022-06-20 18:37:02','2022-06-20 18:37:02','DELETE',0,1,0,NULL,'0',0),(6672,'ListAllPrices',NULL,509,'2022-06-20 18:49:45','2022-06-20 20:09:29','GET',0,1,0,NULL,'0',0),(6673,'CreatePrice',NULL,509,'2022-06-20 19:42:23','2022-06-20 20:01:09','POST',0,1,0,NULL,'0',0),(6674,'CreatePriceRecurring',NULL,509,'2022-06-20 20:00:38','2022-06-20 20:44:39','POST',0,1,0,NULL,'0',0),(6675,'GetPriceDetails',NULL,509,'2022-06-20 20:23:15','2022-06-20 20:23:15','GET',0,1,0,NULL,'0',0),(6676,'CreatePaymentLink',NULL,509,'2022-06-20 20:29:35','2022-06-20 20:46:26','POST',0,1,0,NULL,'0',0),(6677,'ListAllPaymentLinks',NULL,509,'2022-06-20 20:46:05','2022-06-20 20:48:50','GET',0,1,0,NULL,'0',0),(6678,'GetPaymentLinkDetails',NULL,509,'2022-06-20 20:53:55','2022-06-20 20:53:55','GET',0,1,0,NULL,'0',0),(7642,'CreatePriceRule',NULL,237,'2022-08-03 11:38:40','2022-08-03 15:01:13','POST',0,1,0,NULL,'0',0),(7643,'GetPriceRules',NULL,237,'2022-08-03 11:48:26','2022-08-03 12:02:22','GET',0,1,0,NULL,'0',0),(7644,'GetSinglePriceRule',NULL,237,'2022-08-03 12:14:06','2022-08-03 12:14:06','GET',0,1,0,NULL,'0',0),(7647,'DeletePriceRule',NULL,237,'2022-08-03 13:59:10','2022-08-03 13:59:10','DELETE',0,1,0,NULL,'0',0),(7653,'CreateDiscountCode',NULL,237,'2022-08-03 15:07:01','2022-08-03 15:16:50','POST',0,1,0,NULL,'0',0),(7654,'GetAllDiscountCodes',NULL,237,'2022-08-03 15:09:54','2022-08-03 15:09:54','GET',0,1,0,NULL,'0',0),(7655,'GetSingleDiscountCodes',NULL,237,'2022-08-03 15:15:11','2022-08-03 15:15:11','GET',0,1,0,NULL,'0',0),(7656,'DeleteDiscountCode',NULL,237,'2022-08-03 15:17:10','2022-08-03 15:17:10','DELETE',0,1,0,NULL,'0',0),(7660,'GetAllCustomers',NULL,237,'2022-08-03 16:21:05','2022-08-03 16:24:12','GET',0,1,0,NULL,'0',0),(7661,'GetSingleCustomer',NULL,237,'2022-08-03 16:29:29','2022-08-03 16:29:29','GET',0,1,0,NULL,'0',0),(7662,'RetrieveOrdersByCustomer',NULL,237,'2022-08-03 16:36:34','2022-08-03 16:36:34','GET',0,1,0,NULL,'0',0),(7663,'SearchCustomerByQuery',NULL,237,'2022-08-03 16:41:55','2022-08-03 16:55:50','GET',0,1,0,NULL,'0',0),(7664,'CreateCustomer',NULL,237,'2022-08-03 17:22:59','2022-08-04 17:01:52','POST',0,1,0,NULL,'0',0),(7691,'SendInviteToCustomer',NULL,237,'2022-08-04 17:07:38','2022-08-04 17:07:38','POST',0,1,0,NULL,'0',0),(7692,'UpdateCustomer',NULL,237,'2022-08-04 17:13:17','2022-08-04 17:18:27','PUT',0,1,0,NULL,'0',0),(8242,'GetSingleRow',NULL,209,'2022-08-26 11:22:08','2022-09-02 05:04:47','GET',0,1,0,'598866ce-39c3-11ed-af73-0a62665f1d4f','0',0),(8297,'GetCardsInList',NULL,197,'2022-08-30 06:35:54','2022-08-30 06:35:54','GET',0,1,0,NULL,'0',0),(8298,'GetAllOpenCardsInBoard',NULL,197,'2022-08-30 06:40:46','2022-08-30 06:40:46','GET',0,1,0,NULL,'0',0),(12122,'ClearMultipleRows',NULL,209,'2023-01-17 13:19:58','2023-02-20 19:20:32','POST',0,1,0,'f6ee6fd2-9bdb-11ed-b4b1-0a62665f1d4f','0',0),(12127,'UpdateMultipleRows',NULL,209,'2023-01-17 13:37:52','2023-02-21 12:21:39','POST',0,1,0,'93e67b87-9bdb-11ed-b4b1-0a62665f1d4f','0',0),(12370,'TestAPI',NULL,4424,'2023-01-24 11:28:13','2023-01-24 11:30:29','GET',0,1,0,'30373ff1-9bda-11ed-b4b1-0a62665f1d4f','0',0),(13119,'DeleteObjects',NULL,639,'2023-02-15 14:29:10','2023-05-13 10:46:14','GET',0,1,0,'1cb353a8-ad3d-11ed-9c66-0a62665f1d4f','0',0),(13839,'CopyObject',NULL,639,'2023-03-08 15:42:54','2023-05-13 10:46:40','GET',0,1,0,'e465e637-bdc7-11ed-9c66-0a62665f1d4f','0',0),(14859,'DeleteFile',NULL,696,'2023-04-11 04:55:55','2023-04-30 18:10:21','POST',0,1,0,'24a10a0e-d825-11ed-a12c-0a62665f1d4f','0',0),(14860,'CopyFile',NULL,696,'2023-04-11 05:00:04','2023-04-30 18:10:23','POST',0,1,0,'b8e46553-d825-11ed-a12c-0a62665f1d4f','0',0),(21298,'CreateProjectInOrganizationWorkspace',NULL,254,'2023-10-13 06:14:07','2023-10-13 06:14:28','POST',0,1,0,'b7505c25-698f-11ee-b65f-0e71b101e9a3','0',0),(22508,'GetProducts',NULL,483,'2023-11-22 17:03:38','2023-11-22 18:22:47','GET',0,1,0,'147b5239-8959-11ee-95d9-0e71b101e9a3','0',0),(22509,'GetProductById',NULL,483,'2023-11-22 18:10:39','2023-11-22 18:22:48','GET',0,1,0,'718d1cca-8962-11ee-95d9-0e71b101e9a3','0',0),(22510,'UpdateProduct',NULL,483,'2023-11-22 18:22:15','2023-11-22 18:22:49','PATCH',0,1,0,'102e84bb-8964-11ee-95d9-0e71b101e9a3','0',0),(27398,'UpdateContact',NULL,483,'2024-02-09 11:23:23','2024-02-09 14:44:41','PATCH',0,1,0,'a2d56ec4-c73d-11ee-95d9-0e71b101e9a3','0',0),(30514,'ListAllPlans',NULL,370,'2024-03-14 17:45:17','2024-03-14 18:08:43','GET',0,1,0,'9efa2725-e22a-11ee-aa73-0affc745b639','0',0),(30515,'CreateSubscriptionLink',NULL,370,'2024-03-14 18:07:49','2024-03-14 18:30:59','POST',0,1,0,'c49355fd-e22d-11ee-aa73-0affc745b639','0',0),(100000,'dummy',NULL,100000,'2024-12-02 13:02:56','2024-12-02 13:02:56','GET',1,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `api_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_custom_view`
--

DROP TABLE IF EXISTS `app_custom_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_custom_view` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned NOT NULL,
  `view_code` varchar(100) NOT NULL,
  `channelid` int unsigned NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_app_custom_view_1` (`plugin_id`),
  KEY `FK_app_custom_view_2` (`channelid`),
  KEY `Index_4` (`view_code`),
  CONSTRAINT `FK_app_custom_view_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_app_custom_view_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_custom_view`
--

LOCK TABLES `app_custom_view` WRITE;
/*!40000 ALTER TABLE `app_custom_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_custom_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_custom_view_history`
--

DROP TABLE IF EXISTS `app_custom_view_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_custom_view_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned NOT NULL,
  `view_code` varchar(100) NOT NULL,
  `channelid` int unsigned NOT NULL,
  `modified_date` datetime NOT NULL,
  `removed_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_app_custom_view_1` (`plugin_id`),
  KEY `FK_app_custom_view_2` (`channelid`),
  CONSTRAINT `FK_app_custom_view_history_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_app_custom_view_history_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_custom_view_history`
--

LOCK TABLES `app_custom_view_history` WRITE;
/*!40000 ALTER TABLE `app_custom_view_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_custom_view_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_login_session`
--

DROP TABLE IF EXISTS `app_login_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_login_session` (
  `uid` int unsigned NOT NULL,
  `device_id` varchar(45) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_login_active` tinyint(1) NOT NULL,
  `last_logout` datetime NOT NULL,
  KEY `FK_app_login_session_1` (`uid`),
  KEY `Index_2` (`device_id`),
  CONSTRAINT `FK_app_login_session_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_login_session`
--

LOCK TABLES `app_login_session` WRITE;
/*!40000 ALTER TABLE `app_login_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_login_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applinks`
--

DROP TABLE IF EXISTS `applinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applinks` (
  `appid` int unsigned NOT NULL AUTO_INCREMENT,
  `ioslink` varchar(200) NOT NULL,
  `androidlink` varchar(200) NOT NULL,
  `androidmktlink` varchar(200) NOT NULL,
  `bb05link` varchar(200) NOT NULL,
  `bb06link` varchar(200) NOT NULL,
  `bb10link` varchar(200) NOT NULL,
  `windowsphonelink` varchar(200) NOT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `appname` varchar(200) NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applinks`
--

LOCK TABLES `applinks` WRITE;
/*!40000 ALTER TABLE `applinks` DISABLE KEYS */;
INSERT INTO `applinks` VALUES (1,'https://itunes.apple.com/us/app/dronahq/id905354460','https://play.google.com/store/apps/details?id=com.drona5','market://details?id=com.drona5','http://drona.deltecs.com/clientbuilds/dronahq/bb/5.0/dronahq.jad','http://drona.deltecs.com/clientbuilds/dronahq/bb/6.0/dronahq.jad','https://appworld.blackberry.com/webstore/content/59937260/','http://www.windowsphone.com/en-gb/store/app/dronahq/e309e724-a60f-4498-9f93-409414abb885',1,'DronaHQ');
/*!40000 ALTER TABLE `applinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appmetajson`
--

DROP TABLE IF EXISTS `appmetajson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appmetajson` (
  `channelid` int unsigned NOT NULL,
  `app_meta_json` text NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`channelid`),
  UNIQUE KEY `channelid_UNIQUE` (`channelid`),
  CONSTRAINT `FK_appmetajson_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appmetajson`
--

LOCK TABLES `appmetajson` WRITE;
/*!40000 ALTER TABLE `appmetajson` DISABLE KEYS */;
INSERT INTO `appmetajson` VALUES (1,'{\"app_meta\":{\"app_module\":{\"allow_social\":true,\"allow_download\":true,\"allow_profile\":true},\"top_bar_icon\":{\"img_xxhdpi\":\"\",\"img_xhdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_hdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_mdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_ldpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\"},\"spalsh_logo_img\":{\"img_xxhdpi\":null,\"img_xhdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_hdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_mdpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\",\"img_ldpi\":\"https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png\"},\"splash_image\":{\"img_xxhdpi\":\"\",\"img_xhdpi\":\"\",\"img_hdpi\":\"\",\"img_mdpi\":\"\",\"img_ldpi\":\"\"},\"cat_list_type\":\"Grid\",\"splash_bg_color\":\"#ffffff\",\"modify_date\":\"2021-11-29 08:26:33\",\"top_bar_text\":\"onprem\",\"kf_enable\":\"1\",\"kb_enable\":\"1\",\"launch_screen\":\"KF\",\"banner_url\":\"\",\"about_us\":\"\",\"support_url\":\"\",\"support_email\":\"\",\"privacy_url\":\"\",\"header_color\":\"F5F5F5\",\"header_style\":\"LIGHT\",\"statusbar_color\":\"F5F5F5\",\"statusbar_style\":\"LIGHT\",\"disable_screenshot\":false,\"enable_screenshot_log\":true,\"enable_screenshot_log_image\":false,\"mpin_enable\":false,\"biometric_enable\":false,\"mpin_timeout_interval\":0,\"biological_characteristics\":null,\"is_oem\":false,\"status_app\":true,\"status_app_color\":\"26bc6a\"}}','2021-12-02 05:43:16',0);
/*!40000 ALTER TABLE `appmetajson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apppushdetail`
--

DROP TABLE IF EXISTS `apppushdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apppushdetail` (
  `appid` int unsigned NOT NULL AUTO_INCREMENT,
  `appname` text NOT NULL,
  `devicetype` text NOT NULL,
  `apnfile` text NOT NULL,
  `apnpwd` text NOT NULL,
  `bbappid` text NOT NULL,
  `bbapppwd` text NOT NULL,
  `bbpushurl` text NOT NULL,
  `ios_certificate_expiration` datetime DEFAULT CURRENT_TIMESTAMP,
  `ios_last_updated_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apppushdetail`
--

LOCK TABLES `apppushdetail` WRITE;
/*!40000 ALTER TABLE `apppushdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `apppushdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apptimespent`
--

DROP TABLE IF EXISTS `apptimespent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apptimespent` (
  `uid` int unsigned NOT NULL,
  `timespent` bigint unsigned NOT NULL COMMENT 'mins spent by user on app on his cell',
  `modifieddate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL DEFAULT '1',
  KEY `FK_apptimespent_1` (`channelid`),
  KEY `FK_apptimespent_2` (`uid`),
  KEY `idx_apptimespent` (`modifieddate`),
  CONSTRAINT `FK_apptimespent_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_apptimespent_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='time spent by user on app';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apptimespent`
--

LOCK TABLES `apptimespent` WRITE;
/*!40000 ALTER TABLE `apptimespent` DISABLE KEYS */;
/*!40000 ALTER TABLE `apptimespent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apptimespenthist`
--

DROP TABLE IF EXISTS `apptimespenthist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apptimespenthist` (
  `uid` int unsigned NOT NULL,
  `timespent` bigint unsigned NOT NULL COMMENT 'in seconds',
  `modifieddate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  KEY `FK_apptimespenthist_1` (`uid`),
  KEY `FK_apptimespenthist_2` (`channelid`),
  CONSTRAINT `FK_apptimespenthist_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_apptimespenthist_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apptimespenthist`
--

LOCK TABLES `apptimespenthist` WRITE;
/*!40000 ALTER TABLE `apptimespenthist` DISABLE KEYS */;
/*!40000 ALTER TABLE `apptimespenthist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appupgrade`
--

DROP TABLE IF EXISTS `appupgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appupgrade` (
  `uid` int unsigned NOT NULL,
  `device_id` text NOT NULL,
  `device_type` varchar(200) NOT NULL,
  `app_name` varchar(200) NOT NULL,
  `app_version` varchar(200) NOT NULL,
  `channelId` int unsigned NOT NULL,
  KEY `FK_appupgrade_1` (`uid`),
  KEY `FK_appupgrade_2` (`channelId`),
  KEY `idx_appupgrade` (`app_name`,`device_id`(255)),
  CONSTRAINT `FK_appupgrade_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_appupgrade_2` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appupgrade`
--

LOCK TABLES `appupgrade` WRITE;
/*!40000 ALTER TABLE `appupgrade` DISABLE KEYS */;
INSERT INTO `appupgrade` VALUES (1,'0000000000','WebApp','DronaHQ','',1);
/*!40000 ALTER TABLE `appupgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appupgradestatus`
--

DROP TABLE IF EXISTS `appupgradestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appupgradestatus` (
  `uid` int unsigned NOT NULL,
  `upgrade_type` varchar(100) NOT NULL,
  `latest_version` varchar(100) NOT NULL,
  `upgrade_sent_on` datetime NOT NULL,
  `upgraded_on` datetime NOT NULL,
  `channelId` int unsigned NOT NULL,
  `app_name` varchar(100) NOT NULL,
  `upgrade_status` int unsigned NOT NULL DEFAULT '0',
  `device_type` varchar(100) NOT NULL,
  KEY `FK_userforupgrade_1` (`uid`),
  KEY `FK_userforupgrade_2` (`channelId`),
  KEY `idx_appupgradestatus` (`app_name`,`device_type`,`upgrade_status`),
  CONSTRAINT `FK_userforupgrade_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userforupgrade_2` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appupgradestatus`
--

LOCK TABLES `appupgradestatus` WRITE;
/*!40000 ALTER TABLE `appupgradestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `appupgradestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `cid` int unsigned NOT NULL AUTO_INCREMENT,
  `conttype` varchar(45) NOT NULL,
  `mid` int unsigned NOT NULL,
  `aid` int unsigned NOT NULL,
  `isVisible` tinyint(1) NOT NULL,
  `expirydate` varchar(100) NOT NULL,
  `isUgc` tinyint(1) NOT NULL,
  `recAllowed` tinyint unsigned NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `channelId` int unsigned NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''0:is not deleted and 1:is deleted content''',
  `tags` varchar(999) DEFAULT '',
  `adminMsg` varchar(999) NOT NULL DEFAULT '',
  `oldcid` int unsigned NOT NULL DEFAULT '0',
  `isExtract` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:mean No extract content',
  `hide_in_console` int unsigned NOT NULL DEFAULT '0' COMMENT '0:means show in console',
  PRIMARY KEY (`cid`),
  KEY `FK_knowledgebase_1` (`channelId`),
  KEY `Index_3` (`aid`,`conttype`),
  KEY `Index_4` (`mid`,`aid`,`conttype`),
  CONSTRAINT `FK_knowledgebase_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigncampaign`
--

DROP TABLE IF EXISTS `assigncampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigncampaign` (
  `gid` int unsigned NOT NULL COMMENT 'group id',
  `campId` int unsigned NOT NULL COMMENT 'campaign id',
  `sid` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sid`),
  KEY `FK_assigncampaign_2` (`campId`),
  KEY `FK_assigncampaign_1` (`gid`),
  CONSTRAINT `FK_assigncampaign_2` FOREIGN KEY (`campId`) REFERENCES `campaign` (`campId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='video grouping, 1 grp - 1 campaign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigncampaign`
--

LOCK TABLES `assigncampaign` WRITE;
/*!40000 ALTER TABLE `assigncampaign` DISABLE KEYS */;
INSERT INTO `assigncampaign` VALUES (1,1,1);
/*!40000 ALTER TABLE `assigncampaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `authorid` int unsigned NOT NULL AUTO_INCREMENT,
  `authorname` text NOT NULL,
  `authordesg` text NOT NULL,
  `authordesc` text NOT NULL,
  `authorimage` text NOT NULL,
  `channelid` int unsigned NOT NULL,
  `isSearchable` tinyint unsigned NOT NULL DEFAULT '1',
  `defaultAuthor` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awscredentials`
--

DROP TABLE IF EXISTS `awscredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awscredentials` (
  `channelid` int unsigned NOT NULL,
  `accesskey` text NOT NULL,
  `secretkey` text NOT NULL,
  KEY `FK_awscredentials_1` (`channelid`),
  CONSTRAINT `FK_awscredentials_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awscredentials`
--

LOCK TABLES `awscredentials` WRITE;
/*!40000 ALTER TABLE `awscredentials` DISABLE KEYS */;
INSERT INTO `awscredentials` VALUES (1,'81D60125802A917287298EAE43EA6316','81D60125802A917287298EAE43EA6316');
/*!40000 ALTER TABLE `awscredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `campId` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'campaign id',
  `campName` text NOT NULL COMMENT 'campaign name',
  `campDesc` text,
  `startDate` datetime NOT NULL COMMENT 'start date for campaign delivery',
  `status` tinyint(1) NOT NULL COMMENT 'On / Off',
  `channelid` int unsigned NOT NULL DEFAULT '0',
  `campaignCreationDate` datetime NOT NULL,
  `deliveries` int DEFAULT '0',
  `views` int unsigned NOT NULL DEFAULT '0',
  `interactions` int unsigned NOT NULL DEFAULT '0',
  `oldcampid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`campId`),
  KEY `FK_campaign_1` (`channelid`),
  CONSTRAINT `FK_campaign_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='bundle of campaigns. campaign will consist multiple contents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,'Default Campaign','Default Campaign','2021-11-29 08:26:33',0,1,'2021-11-29 08:26:33',0,0,0,0);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campstyling`
--

DROP TABLE IF EXISTS `campstyling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campstyling` (
  `campId` int unsigned NOT NULL,
  `styId` int unsigned NOT NULL,
  KEY `FK_campStyling_1` (`styId`),
  KEY `FK_campStyling_2` (`campId`),
  CONSTRAINT `FK_campStyling_1` FOREIGN KEY (`styId`) REFERENCES `schedulestyling` (`styId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_campStyling_2` FOREIGN KEY (`campId`) REFERENCES `campaign` (`campId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campstyling`
--

LOCK TABLES `campstyling` WRITE;
/*!40000 ALTER TABLE `campstyling` DISABLE KEYS */;
INSERT INTO `campstyling` VALUES (1,1);
/*!40000 ALTER TABLE `campstyling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `catId` int unsigned NOT NULL AUTO_INCREMENT,
  `catName` text NOT NULL,
  `catDescp` text NOT NULL,
  `searchable` tinyint(1) NOT NULL,
  `channelid` int unsigned DEFAULT NULL,
  `catImg` text,
  `isvisible` tinyint(1) NOT NULL DEFAULT '0',
  `isnotify` tinyint(1) NOT NULL DEFAULT '0',
  `indexing` int unsigned DEFAULT '1',
  `cat_tile_Img` varchar(200) NOT NULL DEFAULT '',
  `Modify_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_new_con_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `grid_xhdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_hdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_mdpi` varchar(200) NOT NULL DEFAULT '',
  `grid_ldpi` varchar(200) NOT NULL DEFAULT '',
  `tile_xhdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_hdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_mdpi` varchar(200) NOT NULL DEFAULT '',
  `tile_ldpi` varchar(200) NOT NULL DEFAULT '',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is not default cat',
  `is_active` int DEFAULT '1',
  `is_hidden` tinyint DEFAULT '0',
  PRIMARY KEY (`catId`),
  KEY `FK_category_1` (`channelid`),
  KEY `idx_category` (`searchable`,`is_active`,`is_hidden`,`isvisible`),
  CONSTRAINT `FK_category_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryaccessed`
--

DROP TABLE IF EXISTS `categoryaccessed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryaccessed` (
  `uid` int unsigned NOT NULL,
  `catid` int unsigned NOT NULL,
  `accessedOn` datetime DEFAULT NULL,
  `accessedTime` double DEFAULT NULL COMMENT 'Timespent',
  `channelId` int unsigned NOT NULL,
  `accessedType` int unsigned DEFAULT '0' COMMENT 'Click counter',
  `actBtnId` int unsigned NOT NULL,
  `plugin_ver` varchar(45) NOT NULL DEFAULT '' COMMENT 'If this is a plugin app, the version of that app',
  KEY `FK_categoryaccessed_1` (`uid`),
  KEY `FK_categoryaccessed_3` (`channelId`),
  KEY `Index_4` (`actBtnId`),
  KEY `Index_5` (`catid`),
  CONSTRAINT `FK_categoryaccessed_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_categoryaccessed_3` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Record for icon accessed by user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryaccessed`
--

LOCK TABLES `categoryaccessed` WRITE;
/*!40000 ALTER TABLE `categoryaccessed` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoryaccessed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryaccessed_history`
--

DROP TABLE IF EXISTS `categoryaccessed_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryaccessed_history` (
  `uid` int unsigned NOT NULL,
  `catid` int unsigned NOT NULL,
  `accessedOn` datetime DEFAULT NULL,
  `accessedTime` double DEFAULT NULL COMMENT 'Timespent',
  `channelId` int unsigned NOT NULL,
  `actBtnId` int unsigned NOT NULL,
  `plugin_ver` varchar(45) NOT NULL DEFAULT '' COMMENT 'If this is a plugin app, the version of that app',
  KEY `Index_3` (`catid`),
  KEY `Index_4` (`actBtnId`),
  KEY `FK_categoryaccessed_history_1` (`channelId`),
  KEY `FK_categoryaccessed_history_2` (`uid`),
  CONSTRAINT `FK_categoryaccessed_history_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_categoryaccessed_history_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Historical record for icon accessed by user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryaccessed_history`
--

LOCK TABLES `categoryaccessed_history` WRITE;
/*!40000 ALTER TABLE `categoryaccessed_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoryaccessed_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorytemplate`
--

DROP TABLE IF EXISTS `categorytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorytemplate` (
  `viewid` int unsigned NOT NULL AUTO_INCREMENT,
  `viewname` varchar(200) NOT NULL,
  `ismaster` tinyint(1) NOT NULL DEFAULT '0',
  `channelId` int unsigned NOT NULL,
  `dispindex` int DEFAULT '0',
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`viewid`),
  KEY `FK_categoryparentview_1` (`channelId`),
  KEY `Index_3` (`ismaster`),
  KEY `idx_dispindex` (`dispindex`),
  CONSTRAINT `FK_categoryparentview_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorytemplate`
--

LOCK TABLES `categorytemplate` WRITE;
/*!40000 ALTER TABLE `categorytemplate` DISABLE KEYS */;
INSERT INTO `categorytemplate` VALUES (1,'Master Template',1,1,1,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categorytemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `channelid` int unsigned NOT NULL AUTO_INCREMENT,
  `channelname` text NOT NULL,
  `channelinfo` text NOT NULL,
  `channelimg` text NOT NULL,
  `noofusers` int unsigned NOT NULL DEFAULT '0',
  `noofdeliveries` int unsigned NOT NULL DEFAULT '0',
  `registrationDateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `display` int unsigned NOT NULL COMMENT '0: public, 1: private',
  `contactmail` varchar(100) NOT NULL,
  `channelwebsite` text,
  `apnFileName` varchar(100) NOT NULL DEFAULT 'nil',
  `bannerimg` text,
  `channCode` text,
  `downloadLink` varchar(255) DEFAULT 'http://www.dronamobile.com/download',
  `app_name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `signup_code` varchar(255) NOT NULL DEFAULT '',
  `signup_type` varchar(255) DEFAULT 'i',
  `signup_status` varchar(10) DEFAULT '3',
  `is_oem` tinyint(1) NOT NULL DEFAULT '0',
  `am_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'Account Manager',
  `is_seller` tinyint DEFAULT '0',
  `is_auditlogs` tinyint DEFAULT '0',
  `is_auditlogs_admin` tinyint DEFAULT '0',
  `is_auditlogs_runlevel` tinyint DEFAULT '0',
  `is_devloper_account` tinyint DEFAULT '0',
  `dev_create_date` datetime DEFAULT NULL,
  `is_sheet_access` tinyint DEFAULT '0',
  `is_automation_access` tinyint DEFAULT '0',
  `is_workflow_access` tinyint DEFAULT '0',
  `is_pdf_access` tinyint DEFAULT '0',
  PRIMARY KEY (`channelid`),
  UNIQUE KEY `idx_chnname` (`channelname`(100)),
  KEY `FK_channel_1` (`am_id`),
  CONSTRAINT `FK_channel_1` FOREIGN KEY (`am_id`) REFERENCES `account_manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'DRONA5_Team1','','NA',0,0,'2021-11-29 08:26:33',1,'rahul@dronamobile.com','NA','nil','NA','TCbvC','','','onprem','drona5_team1','i','3',0,1,0,0,0,0,1,NULL,0,0,0,0);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_app_module`
--

DROP TABLE IF EXISTS `channel_app_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_app_module` (
  `channelid` int unsigned NOT NULL AUTO_INCREMENT,
  `allowSocial` tinyint(1) NOT NULL DEFAULT '1',
  `allowDownload` tinyint(1) NOT NULL DEFAULT '1',
  `allowProfile` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`channelid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_app_module`
--

LOCK TABLES `channel_app_module` WRITE;
/*!40000 ALTER TABLE `channel_app_module` DISABLE KEYS */;
INSERT INTO `channel_app_module` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `channel_app_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_custom_domain`
--

DROP TABLE IF EXISTS `channel_custom_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_custom_domain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_domain` varchar(200) NOT NULL,
  `domain_arm_id` varchar(1000) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `dist_id` varchar(450) DEFAULT '',
  `cust_status` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_custom_domain`
--

LOCK TABLES `channel_custom_domain` WRITE;
/*!40000 ALTER TABLE `channel_custom_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_custom_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_custom_sso_credential`
--

DROP TABLE IF EXISTS `channel_custom_sso_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_custom_sso_credential` (
  `channelid` int unsigned NOT NULL,
  `sso_id` varchar(99) NOT NULL,
  `sso_secret` varchar(99) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`channelid`),
  CONSTRAINT `FK_channel_custom_sso_credential_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store JWT credential for Custom SSO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_custom_sso_credential`
--

LOCK TABLES `channel_custom_sso_credential` WRITE;
/*!40000 ALTER TABLE `channel_custom_sso_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_custom_sso_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_email_config`
--

DROP TABLE IF EXISTS `channel_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_email_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `from_name` varchar(250) DEFAULT NULL,
  `from_email` varchar(250) DEFAULT NULL,
  `host_name` varchar(250) DEFAULT NULL,
  `host_port` int DEFAULT NULL,
  `host_username` varchar(250) DEFAULT NULL,
  `host_pass` varchar(250) DEFAULT NULL,
  `ishost_ssl` tinyint DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `config_type` varchar(45) DEFAULT NULL,
  `con_api_key` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_email_config`
--

LOCK TABLES `channel_email_config` WRITE;
/*!40000 ALTER TABLE `channel_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_external_idp`
--

DROP TABLE IF EXISTS `channel_external_idp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_external_idp` (
  `channelid` int NOT NULL,
  `idp_type` varchar(45) NOT NULL,
  `login_url` varchar(450) NOT NULL,
  `callback_url` varchar(450) NOT NULL,
  `idp_code` varchar(45) NOT NULL,
  `access_type` char(3) NOT NULL COMMENT 'O: Open for all, R: Restricted by pre-defined list',
  `domain_name` varchar(45) DEFAULT NULL,
  `limited_access` tinyint(1) NOT NULL DEFAULT '0',
  `s_type` varchar(45) DEFAULT 'S',
  `external_id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='External IdP details, if any of a channel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_external_idp`
--

LOCK TABLES `channel_external_idp` WRITE;
/*!40000 ALTER TABLE `channel_external_idp` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_external_idp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_oauth_sso_config`
--

DROP TABLE IF EXISTS `channel_oauth_sso_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_oauth_sso_config` (
  `oauth_id` int NOT NULL AUTO_INCREMENT,
  `oauth_provider_id` varchar(100) DEFAULT NULL,
  `oauth_name` varchar(45) DEFAULT NULL,
  `oauth_client_id` varchar(200) DEFAULT NULL,
  `oauth_client_secret` varchar(200) DEFAULT NULL,
  `oauth_scope` mediumtext,
  `oauth_restricted_domain` varchar(100) DEFAULT NULL,
  `oauth_auth_request` longtext,
  `oauth_access_request` longtext,
  `oauth_refres_request` longtext,
  `oauth_created_date` datetime DEFAULT NULL,
  `oauth_updated_date` datetime DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `oauth_status` tinyint DEFAULT '0',
  `oauth_type` int DEFAULT '2',
  `oauth_jit_access` tinyint DEFAULT '0',
  `oauth_attar_list` longtext,
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_oauth_sso_config`
--

LOCK TABLES `channel_oauth_sso_config` WRITE;
/*!40000 ALTER TABLE `channel_oauth_sso_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_oauth_sso_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_oauth_sso_jwtgoogle_config`
--

DROP TABLE IF EXISTS `channel_oauth_sso_jwtgoogle_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_oauth_sso_jwtgoogle_config` (
  `jwtoauth_id` int NOT NULL AUTO_INCREMENT,
  `jwtoauth_provider_id` varchar(100) DEFAULT NULL,
  `jwtoauth_name` varchar(45) DEFAULT NULL,
  `jwtoauth_client_id` varchar(200) DEFAULT NULL,
  `jwtoauth_client_secret` varchar(200) DEFAULT NULL,
  `jwtoauth_scope` mediumtext,
  `jwtoauth_restricted_domain` longtext,
  `jwtoauth_auth_request` longtext,
  `jwtoauth_access_request` longtext,
  `jwtoauth_refres_request` longtext,
  `jwtoauth_login_url` longtext,
  `jwtoauth_redirect_url` longtext,
  `jwtoauth_created_date` datetime DEFAULT NULL,
  `jwtoauth_updated_date` datetime DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `jwtoauth_status` tinyint DEFAULT '0',
  `jwtoauth_type` int DEFAULT '2',
  `jwtoauth_jit_access` tinyint DEFAULT '0',
  `jwtoauth_attar_list` longtext,
  PRIMARY KEY (`jwtoauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_oauth_sso_jwtgoogle_config`
--

LOCK TABLES `channel_oauth_sso_jwtgoogle_config` WRITE;
/*!40000 ALTER TABLE `channel_oauth_sso_jwtgoogle_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_oauth_sso_jwtgoogle_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_setting`
--

DROP TABLE IF EXISTS `channel_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_setting` (
  `channelid` int unsigned NOT NULL AUTO_INCREMENT,
  `device_limit` int unsigned NOT NULL DEFAULT '0' COMMENT '0: Infinite',
  `allow_rooted_device` tinyint(1) NOT NULL DEFAULT '1',
  `refresh_expires_in` int unsigned NOT NULL DEFAULT '0' COMMENT 'in days; 0: never',
  `user_profile_readonly` tinyint unsigned NOT NULL DEFAULT '0',
  `valid_console_ip` varchar(9999) DEFAULT '',
  `disable_screenshot` tinyint(1) DEFAULT '0',
  `mpin_enabled` tinyint DEFAULT '0',
  `mpin_timeout_interval` int DEFAULT '0',
  `biometric_enabled` tinyint DEFAULT '0',
  `biological_characteristics` varchar(45) DEFAULT '',
  `enable_logging` tinyint DEFAULT '1',
  `logging_with_screenshot` tinyint DEFAULT '0',
  `status_app` tinyint DEFAULT '0',
  `status_app_color` varchar(45) DEFAULT '#26bc6a',
  `is_base_sheet_synced` tinyint DEFAULT '0',
  `channel_settingcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`channelid`),
  CONSTRAINT `FK_channel_setting_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_setting`
--

LOCK TABLES `channel_setting` WRITE;
/*!40000 ALTER TABLE `channel_setting` DISABLE KEYS */;
INSERT INTO `channel_setting` VALUES (1,0,1,0,0,'',0,0,0,0,'fingerprint,iris,faceid',0,0,0,'#26BC6A',0,NULL);
/*!40000 ALTER TABLE `channel_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelapplinks`
--

DROP TABLE IF EXISTS `channelapplinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channelapplinks` (
  `channelid` int unsigned NOT NULL,
  `appid` int unsigned NOT NULL,
  KEY `FK_channelapplinks_1` (`channelid`),
  KEY `FK_channelapplinks_2` (`appid`),
  CONSTRAINT `FK_channelapplinks_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_channelapplinks_2` FOREIGN KEY (`appid`) REFERENCES `applinks` (`appid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelapplinks`
--

LOCK TABLES `channelapplinks` WRITE;
/*!40000 ALTER TABLE `channelapplinks` DISABLE KEYS */;
INSERT INTO `channelapplinks` VALUES (1,1);
/*!40000 ALTER TABLE `channelapplinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelowner`
--

DROP TABLE IF EXISTS `channelowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channelowner` (
  `channelid` int unsigned NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `contactPhone` text NOT NULL,
  `contactEmail` text NOT NULL,
  `companyname` varchar(145) DEFAULT '',
  PRIMARY KEY (`channelid`),
  CONSTRAINT `FK_channelowner_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelowner`
--

LOCK TABLES `channelowner` WRITE;
/*!40000 ALTER TABLE `channelowner` DISABLE KEYS */;
INSERT INTO `channelowner` VALUES (1,'rahul@dronamobile.com','NA','NA','rahul@dronamobile.com','');
/*!40000 ALTER TABLE `channelowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelrights`
--

DROP TABLE IF EXISTS `channelrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channelrights` (
  `channelId` int unsigned NOT NULL,
  `launchscreen` varchar(45) NOT NULL,
  `switchchannelflag` tinyint(1) NOT NULL,
  `subscriptionflag` tinyint(1) NOT NULL,
  `categorytitle` varchar(100) NOT NULL DEFAULT 'Category',
  `authortitle` varchar(100) NOT NULL DEFAULT 'Author',
  `modifieddate` datetime NOT NULL,
  `splash_bg_url` text,
  `splash_logo_url` text,
  `splash_logo_text` varchar(100) DEFAULT NULL,
  `splash_text` varchar(100) DEFAULT NULL,
  `recommendation_Allowed` tinyint(1) DEFAULT '1',
  `IsCollabrationSuits` tinyint(1) DEFAULT '0',
  `isPublicRead` tinyint(1) NOT NULL DEFAULT '1',
  `splash_bg_bb_url` text,
  `chan_Cat_Listing` varchar(100) DEFAULT 'Grid',
  `splash_bg_color` varchar(100) DEFAULT NULL,
  `img_xhdpi` varchar(200) DEFAULT NULL,
  `img_hdpi` varchar(200) DEFAULT NULL,
  `img_mdpi` varchar(200) DEFAULT NULL,
  `img_ldpi` varchar(200) DEFAULT NULL,
  `chantype` int unsigned DEFAULT '0',
  `img_top_bar_xxhdpi` varchar(200) NOT NULL DEFAULT '' COMMENT 'Image for splash icon. 256x256',
  `img_top_bar_xhdpi` varchar(200) DEFAULT '',
  `img_top_bar_hdpi` varchar(200) DEFAULT '',
  `img_top_bar_mdpi` varchar(200) DEFAULT '',
  `img_top_bar_ldpi` varchar(200) DEFAULT '',
  `splash_img_xxhdpi` varchar(200) NOT NULL DEFAULT '',
  `splash_img_xhdpi` varchar(200) NOT NULL DEFAULT '',
  `splash_img_hdpi` varchar(200) NOT NULL DEFAULT '',
  `splash_img_mdpi` varchar(200) NOT NULL DEFAULT '',
  `splash_img_ldpi` varchar(200) NOT NULL DEFAULT '',
  `banner_url` varchar(255) DEFAULT '',
  `support_url` varchar(100) DEFAULT '',
  `privacy_url` varchar(100) DEFAULT '',
  `about_us` varchar(500) DEFAULT '',
  `support_email` varchar(100) DEFAULT '',
  `header_color` varchar(6) NOT NULL DEFAULT 'F5F5F5',
  `header_style` varchar(6) NOT NULL DEFAULT 'LIGHT',
  `statusbar_color` varchar(6) NOT NULL DEFAULT 'F5F5F5',
  `statusbar_style` varchar(6) DEFAULT 'LIGHT',
  PRIMARY KEY (`channelId`),
  KEY `FK_channelrights_1` (`channelId`),
  KEY `FK_channelrights_3` (`chantype`),
  CONSTRAINT `FK_channelrights_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_channelrights_2` FOREIGN KEY (`chantype`) REFERENCES `channeltype` (`chantype`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_channelrights_3` FOREIGN KEY (`chantype`) REFERENCES `channeltype` (`chantype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelrights`
--

LOCK TABLES `channelrights` WRITE;
/*!40000 ALTER TABLE `channelrights` DISABLE KEYS */;
INSERT INTO `channelrights` VALUES (1,'category',1,0,'Category','Author','2022-03-02 10:45:28','','','','',1,1,1,'','Grid','#ffffff','','','','',1,'','https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png','https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png','https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png','https://drona5public.s3.amazonaws.com/assets/drona_app_48x48.png','','','','','','','','','migrating C# to nodejs','','f5f5f5','DARK','f5f5f5','DARK');
/*!40000 ALTER TABLE `channelrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelsec`
--

DROP TABLE IF EXISTS `channelsec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channelsec` (
  `channelid` int unsigned NOT NULL,
  `seclevel` int unsigned NOT NULL,
  `secdata` text NOT NULL,
  PRIMARY KEY (`channelid`),
  CONSTRAINT `FK_channelsec_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelsec`
--

LOCK TABLES `channelsec` WRITE;
/*!40000 ALTER TABLE `channelsec` DISABLE KEYS */;
INSERT INTO `channelsec` VALUES (1,0,'');
/*!40000 ALTER TABLE `channelsec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channelsubdomain`
--

DROP TABLE IF EXISTS `channelsubdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channelsubdomain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subdo_name` varchar(45) DEFAULT NULL,
  `is_subdo_brand` tinyint DEFAULT '0',
  `subdo_backcolor` varchar(45) DEFAULT NULL,
  `subdo_title` varchar(45) DEFAULT NULL,
  `subdo_description` varchar(245) DEFAULT NULL,
  `subdo_fevicon` varchar(450) DEFAULT NULL,
  `channelid` int DEFAULT NULL,
  `subdo_fontcolor` varchar(45) DEFAULT '#ffffff',
  `subdo_primarycolor` varchar(45) DEFAULT '#26404e',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channelsubdomain`
--

LOCK TABLES `channelsubdomain` WRITE;
/*!40000 ALTER TABLE `channelsubdomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `channelsubdomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channeltimezone`
--

DROP TABLE IF EXISTS `channeltimezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channeltimezone` (
  `channelid` int unsigned NOT NULL,
  `tzonedname` text NOT NULL,
  `tzoneid` text NOT NULL,
  PRIMARY KEY (`channelid`),
  CONSTRAINT `FK_channeltimezone_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channeltimezone`
--

LOCK TABLES `channeltimezone` WRITE;
/*!40000 ALTER TABLE `channeltimezone` DISABLE KEYS */;
INSERT INTO `channeltimezone` VALUES (1,'(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi','India Standard Time');
/*!40000 ALTER TABLE `channeltimezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channeltype`
--

DROP TABLE IF EXISTS `channeltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channeltype` (
  `chantype` int unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(200) NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `classid` varchar(100) DEFAULT NULL,
  `icontype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chantype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channeltype`
--

LOCK TABLES `channeltype` WRITE;
/*!40000 ALTER TABLE `channeltype` DISABLE KEYS */;
INSERT INTO `channeltype` VALUES (1,'Engagement','btn btn1-circle-Red btn-circle','engradio','icon-gittip');
/*!40000 ALTER TABLE `channeltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurrent_access`
--

DROP TABLE IF EXISTS `concurrent_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concurrent_access` (
  `channel_id` varchar(45) NOT NULL,
  `plugin_id` int NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `accessed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurrent_access`
--

LOCK TABLES `concurrent_access` WRITE;
/*!40000 ALTER TABLE `concurrent_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `concurrent_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `cid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'content id',
  `contentType` text NOT NULL COMMENT 'v OR e OR q OR n',
  `title` varchar(200) NOT NULL COMMENT 'title of content',
  `channelid` int unsigned NOT NULL DEFAULT '0',
  `contentCreationDate` datetime DEFAULT NULL,
  `deliveries` int unsigned NOT NULL DEFAULT '0',
  `views` int unsigned NOT NULL DEFAULT '0',
  `interactions` int unsigned NOT NULL DEFAULT '0',
  `catId` int unsigned NOT NULL DEFAULT '0',
  `searchable` tinyint(1) DEFAULT '1',
  `tags` text,
  `isPublic` tinyint(1) DEFAULT '0' COMMENT '0: private content, 1: Public content',
  `isImported` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: my content, 1: Exported from others library',
  `likeCount` int unsigned NOT NULL DEFAULT '0' COMMENT 'content like count',
  `expirydate` varchar(100) NOT NULL DEFAULT 'NA',
  `authorid` int unsigned NOT NULL,
  `sharable` varchar(1) NOT NULL DEFAULT 'N',
  `ispaid` tinyint(1) NOT NULL DEFAULT '0',
  `isUgc` tinyint unsigned NOT NULL DEFAULT '0',
  `recFlag` tinyint(1) NOT NULL DEFAULT '0',
  `isRss` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: default, 1: rss',
  PRIMARY KEY (`cid`),
  KEY `FK_content_1` (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='a content is a video, quiz, survey, ppt, newsletter, event, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentmeta`
--

DROP TABLE IF EXISTS `contentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentmeta` (
  `mid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '',
  `desc` text,
  `authorId` int unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_pauthorId` (`authorId`),
  KEY `idx_ptitle` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentmeta`
--

LOCK TABLES `contentmeta` WRITE;
/*!40000 ALTER TABLE `contentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentprioritypush`
--

DROP TABLE IF EXISTS `contentprioritypush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentprioritypush` (
  `pushid` int NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `mode` char(2) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `sched_date` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  `send_email` tinyint DEFAULT '0',
  `sender_type` varchar(10) NOT NULL DEFAULT '',
  `sender_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pushid`),
  KEY `FK_contentprioritypush_1` (`cid`),
  KEY `FK_contentprioritypush_2` (`channelid`),
  CONSTRAINT `FK_contentprioritypush_1` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_contentprioritypush_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentprioritypush`
--

LOCK TABLES `contentprioritypush` WRITE;
/*!40000 ALTER TABLE `contentprioritypush` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentprioritypush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentviewed`
--

DROP TABLE IF EXISTS `contentviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentviewed` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `vieweddate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  `counts` int unsigned NOT NULL DEFAULT '1',
  KEY `FK_contentviewed_1` (`uid`),
  KEY `FK_contentviewed_2` (`cid`),
  CONSTRAINT `FK_contentviewed_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_contentviewed_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentviewed`
--

LOCK TABLES `contentviewed` WRITE;
/*!40000 ALTER TABLE `contentviewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentviewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentviewhistory`
--

DROP TABLE IF EXISTS `contentviewhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentviewhistory` (
  `cid` int unsigned NOT NULL,
  `uid` int unsigned NOT NULL,
  `viewon` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  KEY `FK_contentviewhistory_2` (`uid`),
  KEY `FK_contentviewhistory_3` (`channelid`),
  KEY `FK_contentviewhistory_1` (`cid`),
  CONSTRAINT `FK_contentviewhistory_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_contentviewhistory_3` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_contentviewhistory_4` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentviewhistory`
--

LOCK TABLES `contentviewhistory` WRITE;
/*!40000 ALTER TABLE `contentviewhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentviewhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contfeedbackresponse`
--

DROP TABLE IF EXISTS `contfeedbackresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contfeedbackresponse` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `respdate` datetime NOT NULL,
  `resptype` varchar(10) NOT NULL,
  `is_app_instll` tinyint(1) NOT NULL,
  `collg_name` varchar(100) NOT NULL,
  `is_client_new` tinyint(1) NOT NULL,
  `arn_no` varchar(50) NOT NULL,
  `branch` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `persons_met` varchar(100) NOT NULL,
  `designation` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contfeedbackresponse`
--

LOCK TABLES `contfeedbackresponse` WRITE;
/*!40000 ALTER TABLE `contfeedbackresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `contfeedbackresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couchdb_data`
--

DROP TABLE IF EXISTS `couchdb_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couchdb_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel_id` int NOT NULL,
  `server_endpoint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci NOT NULL,
  `database_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci DEFAULT NULL,
  `wipe_data` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `couchdb_token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci,
  `is_active` tinyint DEFAULT '1',
  `is_onprime` tinyint DEFAULT '0',
  `couchdb_secretkey` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_danish_ci DEFAULT '08b7c14d-e156-4d38-bf87-7e8cb4614f61',
  PRIMARY KEY (`id`),
  KEY `couchdb_channel_FK` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couchdb_data`
--

LOCK TABLES `couchdb_data` WRITE;
/*!40000 ALTER TABLE `couchdb_data` DISABLE KEYS */;
INSERT INTO `couchdb_data` VALUES (1,1,'http://localhost:9591','cdb1','dhq-admin','AwFkoWIE+DaQHUhaTc1ojrLmFi+XMo31AuQfhzutigvtSzCygE4BSE6CSuIvEiY2/8qwXz267TYpM87bFaLuFUJo9x9xEOlAg+jhh35UgEgoSVWxJpERo2zP5Sk1vZ+z+Ko=',0,'2021-11-29 08:26:35','109055fb-50ee-11ec-9df4-0242ac120006',1,0,'08b7c14d-e156-4d38-bf87-7e8cb4614f61');
/*!40000 ALTER TABLE `couchdb_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultcategories`
--

DROP TABLE IF EXISTS `defaultcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defaultcategories` (
  `dcid` int unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(200) NOT NULL,
  `gridicon` varchar(200) NOT NULL,
  `tileicon` varchar(200) NOT NULL,
  `cattype` varchar(10) NOT NULL COMMENT 'c: cat, a: action, cc: custom cat, ca: custom act',
  `chantype` int unsigned NOT NULL COMMENT 'category or action button',
  `displayflag` varchar(10) NOT NULL DEFAULT 'g' COMMENT 'g: global',
  `description` text NOT NULL,
  `grid_xhdpi` varchar(200) NOT NULL,
  `grid_hdpi` varchar(200) NOT NULL,
  `grid_mdpi` varchar(200) NOT NULL,
  `grid_ldpi` varchar(200) NOT NULL,
  `tile_xhdpi` varchar(200) NOT NULL,
  `tile_hdpi` varchar(200) NOT NULL,
  `tile_mdpi` varchar(200) NOT NULL,
  `tile_ldpi` varchar(200) NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''0 is not dummy cat''',
  `url` varchar(255) DEFAULT '',
  PRIMARY KEY (`dcid`),
  KEY `FK_defaultcategories_1` (`chantype`),
  CONSTRAINT `FK_defaultcategories_1` FOREIGN KEY (`chantype`) REFERENCES `channeltype` (`chantype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcategories`
--

LOCK TABLES `defaultcategories` WRITE;
/*!40000 ALTER TABLE `defaultcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `defaultcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliciousinfo`
--

DROP TABLE IF EXISTS `deliciousinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliciousinfo` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT,
  `UserName` text NOT NULL,
  `Password` varchar(45) NOT NULL,
  `channelid` int unsigned NOT NULL,
  `createddate` datetime DEFAULT NULL,
  KEY `FK_deliciousinfo_1` (`uid`),
  KEY `FK_deliciousinfo_2` (`channelid`),
  CONSTRAINT `FK_deliciousinfo_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_deliciousinfo_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliciousinfo`
--

LOCK TABLES `deliciousinfo` WRITE;
/*!40000 ALTER TABLE `deliciousinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliciousinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryrange`
--

DROP TABLE IF EXISTS `deliveryrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryrange` (
  `fromRange` time NOT NULL,
  `toRange` time NOT NULL,
  `did` int unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL,
  PRIMARY KEY (`did`),
  KEY `FK_deliveryrange_1` (`gid`),
  CONSTRAINT `FK_deliveryrange_1` FOREIGN KEY (`gid`) REFERENCES `usergroup` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryrange`
--

LOCK TABLES `deliveryrange` WRITE;
/*!40000 ALTER TABLE `deliveryrange` DISABLE KEYS */;
INSERT INTO `deliveryrange` VALUES ('00:00:00','00:00:00',1,1);
/*!40000 ALTER TABLE `deliveryrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicehealth`
--

DROP TABLE IF EXISTS `devicehealth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devicehealth` (
  `uid` int unsigned NOT NULL,
  `device_id` varchar(200) NOT NULL,
  `device_type` varchar(200) NOT NULL,
  `app_name` varchar(200) NOT NULL,
  `os_version` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `free_memory` varchar(200) NOT NULL,
  `used_by_app` varchar(200) NOT NULL,
  `channelId` int unsigned NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_notification` char(1) DEFAULT '',
  KEY `FK_devicehealth_1` (`uid`),
  KEY `FK_devicehealth_2` (`channelId`),
  KEY `idx_devicehealth` (`app_name`),
  KEY `idx_devicehealth_device_id` (`device_id`),
  CONSTRAINT `FK_devicehealth_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_devicehealth_2` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicehealth`
--

LOCK TABLES `devicehealth` WRITE;
/*!40000 ALTER TABLE `devicehealth` DISABLE KEYS */;
/*!40000 ALTER TABLE `devicehealth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceinfo`
--

DROP TABLE IF EXISTS `deviceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deviceinfo` (
  `deviceid` varchar(100) NOT NULL,
  `devicetype` text NOT NULL,
  `deviceversion` text NOT NULL,
  `deviceregdate` datetime NOT NULL,
  `osname` text NOT NULL,
  `osversion` text NOT NULL,
  `freememory` double NOT NULL,
  `is_rooted` tinyint(1) NOT NULL DEFAULT '0',
  `devicename` text,
  PRIMARY KEY (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Device details irrespective of user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceinfo`
--

LOCK TABLES `deviceinfo` WRITE;
/*!40000 ALTER TABLE `deviceinfo` DISABLE KEYS */;
INSERT INTO `deviceinfo` VALUES ('0000000000','WebApp','','2021-12-02 05:28:49','','',0,0,'');
/*!40000 ALTER TABLE `deviceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhq_idp_mfa`
--

DROP TABLE IF EXISTS `dhq_idp_mfa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dhq_idp_mfa` (
  `uid` int unsigned NOT NULL,
  `totp_secret` varchar(450) NOT NULL,
  `last_modify_date` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `FK_dhq_idp_mfa_2` (`channelid`),
  CONSTRAINT `FK_dhq_idp_mfa_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dhq_idp_mfa_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store MFA related details for user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhq_idp_mfa`
--

LOCK TABLES `dhq_idp_mfa` WRITE;
/*!40000 ALTER TABLE `dhq_idp_mfa` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhq_idp_mfa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhq_idp_mfa_totpcode`
--

DROP TABLE IF EXISTS `dhq_idp_mfa_totpcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dhq_idp_mfa_totpcode` (
  `uid` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `timeindex` bigint unsigned NOT NULL,
  KEY `FK_dhq_idp_mfa_totpcode_2` (`channelid`),
  KEY `Index_3` (`uid`,`channelid`,`timeindex`),
  CONSTRAINT `FK_dhq_idp_mfa_totpcode_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dhq_idp_mfa_totpcode_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store used TOTP codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhq_idp_mfa_totpcode`
--

LOCK TABLES `dhq_idp_mfa_totpcode` WRITE;
/*!40000 ALTER TABLE `dhq_idp_mfa_totpcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhq_idp_mfa_totpcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhq_idp_saml_app`
--

DROP TABLE IF EXISTS `dhq_idp_saml_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dhq_idp_saml_app` (
  `app_id` int unsigned NOT NULL AUTO_INCREMENT,
  `channelid` int unsigned NOT NULL,
  `app_name` varchar(45) NOT NULL,
  `sp_entityid` varchar(145) NOT NULL,
  `sp_acs_url` varchar(145) NOT NULL,
  `sp_certificate` varchar(450) NOT NULL,
  `created_on` datetime NOT NULL,
  `nameid_value` varchar(450) DEFAULT '',
  `provider_id` int unsigned NOT NULL,
  `should_sign_assertion` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `plugin_id` int unsigned DEFAULT '0',
  PRIMARY KEY (`app_id`),
  KEY `FK_dhq_idp_saml_app_1` (`channelid`),
  CONSTRAINT `FK_dhq_idp_saml_app_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Apps registered for SSO via DHQ IdP on SAML 2.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhq_idp_saml_app`
--

LOCK TABLES `dhq_idp_saml_app` WRITE;
/*!40000 ALTER TABLE `dhq_idp_saml_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhq_idp_saml_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhq_idp_saml_provider`
--

DROP TABLE IF EXISTS `dhq_idp_saml_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dhq_idp_saml_provider` (
  `provider_id` int unsigned NOT NULL AUTO_INCREMENT,
  `idp_id` varchar(145) NOT NULL,
  `channelid` int unsigned NOT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `Index_3` (`idp_id`),
  KEY `FK_dhq_idp_saml_provider_1` (`channelid`),
  CONSTRAINT `FK_dhq_idp_saml_provider_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Provider details for account';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhq_idp_saml_provider`
--

LOCK TABLES `dhq_idp_saml_provider` WRITE;
/*!40000 ALTER TABLE `dhq_idp_saml_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhq_idp_saml_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftcontent`
--

DROP TABLE IF EXISTS `draftcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `draftcontent` (
  `dcid` int unsigned NOT NULL AUTO_INCREMENT,
  `contenttype` varchar(45) NOT NULL,
  `title` text,
  `contentjson` longtext NOT NULL,
  `description` text NOT NULL,
  `issearchable` tinyint(1) NOT NULL,
  `modifieddate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  `extrastuff` varchar(200) NOT NULL,
  PRIMARY KEY (`dcid`),
  KEY `FK_draftcontent_1` (`channelid`),
  CONSTRAINT `FK_draftcontent_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftcontent`
--

LOCK TABLES `draftcontent` WRITE;
/*!40000 ALTER TABLE `draftcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draftformbuilder`
--

DROP TABLE IF EXISTS `draftformbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `draftformbuilder` (
  `dcid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `formcontent` longtext NOT NULL,
  `modifieddate` datetime NOT NULL,
  `channelId` int unsigned NOT NULL,
  `formhash` varchar(200) NOT NULL DEFAULT '',
  `formeditor` longtext NOT NULL,
  PRIMARY KEY (`dcid`),
  KEY `FK_draftformbuilder_1` (`channelId`),
  CONSTRAINT `FK_draftformbuilder_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draftformbuilder`
--

LOCK TABLES `draftformbuilder` WRITE;
/*!40000 ALTER TABLE `draftformbuilder` DISABLE KEYS */;
/*!40000 ALTER TABLE `draftformbuilder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drona_cron`
--

DROP TABLE IF EXISTS `drona_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drona_cron` (
  `cron_id` int NOT NULL AUTO_INCREMENT,
  `cron_type` varchar(50) NOT NULL,
  `cron_interval` int DEFAULT NULL,
  `last_success_run` datetime DEFAULT NULL,
  PRIMARY KEY (`cron_id`),
  UNIQUE KEY `cron_type` (`cron_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Record status of different CRONs running for dronamobile system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drona_cron`
--

LOCK TABLES `drona_cron` WRITE;
/*!40000 ALTER TABLE `drona_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `drona_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dummycontent`
--

DROP TABLE IF EXISTS `dummycontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dummycontent` (
  `cid` int NOT NULL,
  `app_temp_name` varchar(45) DEFAULT NULL,
  `content_json` text,
  `template_id` int DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dummycontent`
--

LOCK TABLES `dummycontent` WRITE;
/*!40000 ALTER TABLE `dummycontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dummycontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailnotification`
--

DROP TABLE IF EXISTS `emailnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailnotification` (
  `channelid` int unsigned NOT NULL,
  `emailtype` int unsigned NOT NULL,
  `emailsenton` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailnotification`
--

LOCK TABLES `emailnotification` WRITE;
/*!40000 ALTER TABLE `emailnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailsent`
--

DROP TABLE IF EXISTS `emailsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailsent` (
  `emailId` text NOT NULL,
  `emailSentdate` datetime DEFAULT NULL,
  `nxtMailDate` text NOT NULL,
  `channelId` int unsigned NOT NULL,
  KEY `FK_EmailSent_1` (`channelId`),
  CONSTRAINT `FK_EmailSent_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailsent`
--

LOCK TABLES `emailsent` WRITE;
/*!40000 ALTER TABLE `emailsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtemplate`
--

DROP TABLE IF EXISTS `emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplate` (
  `emailcontext` varchar(100) NOT NULL,
  `emailsubject` text NOT NULL,
  `emailhtmlbody` text NOT NULL,
  `emailbcc` text,
  PRIMARY KEY (`emailcontext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemplate`
--

LOCK TABLES `emailtemplate` WRITE;
/*!40000 ALTER TABLE `emailtemplate` DISABLE KEYS */;
INSERT INTO `emailtemplate` VALUES ('DRONAHQ_PUSH','%channel_name%: PUSH','ï»¿<!DOCTYPE html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <title></title>\r\n    <style type=\"text/css\">\r\n        h1, h2, h3, h4, h5, h6 {\r\n            margin: 0 0 5px;\r\n        }\r\n\r\n        p {\r\n            margin: 0 0 1.35em;\r\n        }\r\n\r\n        a {\r\n            color: rgb(88, 173, 105);\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n    <div style=\"width:100%;color:rgb(51, 51, 50);font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva, HelveticaNeue, Verdana,sans-serif;font-size:14px;max-width:640px;\">\r\n\r\n        <p style=\"color:rgb(179, 179, 177);line-height:1.1em;padding-top:15px;padding-bottom:5px;font-size:22px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\">\r\n            You have received a message on <strong>{{channel_name}}</strong>\r\n        </p>{{#with content_data}}\r\n        <div style=\"padding:0;line-height:25px;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;\">{{#eq type _article}}\r\n            from {{article_provider}}{{/eq}}{{#eq type _embed}}\r\n            from {{embed_data.embed_provider}}{{/eq}}\r\n            <h4>\r\n                <span style=\"color:rgb(51, 51, 50);line-height:1.2em;font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva, HelveticaNeue-Bold, Verdana,sans-serif;font-size:22px;font-weight:bold;text-decoration:none;display:block;\">{{title}}</span>\r\n            </h4>{{#eq type _text}}{{#else}}\r\n            <h5 style=\"color:rgb(179, 179, 177);line-height:1.3em;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;font-weight:normal;text-decoration:none;\">\r\n                {{#eq type _pdf}}{{#conlength type pdf_url.pdf_size}}{{#else}}{{#conlength type length}}{{/eq}}\r\n            </h5>{{#eq type _pdf}}{{#else}}{{#eq type _ig}}{{#else}}{{#eq type _n}}\r\n            <h5 style=\"color:rgb(179, 179, 177);line-height:1.3em;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;font-weight:normal;text-decoration:none;\">\r\n                <span style=\"color:rgb(51, 51, 50);line-height:1.5;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:14px;font-weight:normal;text-decoration:none;display:block;\">{{#if full_desc}}{{html_text}}{{#else}}{{#trim html_text _800}}{{/if}}</span>\r\n            </h5>{{#else}}\r\n            <h5 style=\"color:rgb(179, 179, 177);line-height:1.3em;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;font-weight:normal;text-decoration:none;\">\r\n                <span style=\"color:rgb(51, 51, 50);line-height:1.5;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:14px;font-weight:normal;text-decoration:none;display:block;\">{{#trim description _800}}</span>\r\n            </h5>{{/eq}}{{/eq}}{{/eq}}{{/eq}}\r\n            <span>NOTE: You can view this on your mobile app</span>\r\n        </div>{{/with}}{{#if enable_link}}{{#eq content_data.type _article}}\r\n        <div>\r\n            <a href=\"{{content_data.source_url}}\" style=\"border-width: 2px 10px; border-style: solid; border-color: #28bc6a; margin: 10px 5px 0 0; border-radius: 5px; text-align: center; color: rgb(255, 255, 255); line-height: 2; font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; font-weight: bold; text-decoration: none; display: inline-block; cursor: pointer; background-color: #28bc6a;\">Click to view</a>\r\n        </div>\r\n        <br>\r\n        <div>\r\n            <span style=\"font-size:12px\">Trouble with the above link? Copy and paste the following link into your browser:</span>\r\n        </div>\r\n        <div>\r\n            <a href=\"{{content_data.source_url}}\" style=\"font-size:12px\">{{content_data.source_url}}</a>\r\n        </div>{{/eq}}{{#eq content_data.type _embed}}\r\n        <div>\r\n            <a href=\"{{content_data.embed_data.embed_source_url}}\" style=\"border-width: 2px 10px; border-style: solid; border-color: #28bc6a; margin: 10px 5px 0 0; border-radius: 5px; text-align: center; color: rgb(255, 255, 255); line-height: 2; font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; font-weight: bold; text-decoration: none; display: inline-block; cursor: pointer; background-color: #28bc6a;\">Click to view</a>\r\n        </div>\r\n        <br>\r\n        <div>\r\n            <span style=\"font-size:12px\">Trouble with the above link? Copy and paste the following link into your browser:</span>\r\n        </div>\r\n        <div>\r\n            <a href=\"{{content_data.embed_data.embed_source_url}}\" style=\"font-size:12px\">{{content_data.embed_data.embed_source_url}}</a>\r\n        </div>{{/eq}}{{/if}}\r\n        <h2 style=\"padding:10px 0 7px;color:rgb(179, 179, 177);line-height:13px;letter-spacing:1px;font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva,Verdana,sans-serif;font-size:11px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\"></h2>\r\n        <div style=\"text-align:left;color:rgb(51, 51, 50);\">\r\n            <p>\r\n                Need help? Please send any feedback or bug reports to\r\n                <a style=\"color:rgb(88, 173, 105);\" href=\"mailto:friends@dronamobile.com\" target=\"_blank\">friends@dronamobile.com</a>\r\n            </p>\r\n        </div>\r\n\r\n    </div>\r\n</body>\r\n</html>\r\n','NA'),('DRONAMOBILE_MADE_ADMIN_USER','Access to admin console ','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns=\"http://www.w3.org/1999/xhtml\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n</head>\r\n<body bgcolor=\"#f6f6f6\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; margin: 0; padding: 0;\">\r\n    &#13;\r\n    &#13;\r\n    <!-- body -->&#13;\r\n    <table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 20px;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" bgcolor=\"#FFFFFF\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 20px; border: 1px solid #f0f0f0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Hi,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">You have been made admin for %channel_name%.</p>&#13;  \r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">You can manage content, users and analytics of %channel_name% by clicking below and logging in with your credentials.</p>&#13;\r\n                                                         \r\n                                <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                                    <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                        <td class=\"padding\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 10px 0;\">\r\n                                            &#13;\r\n                                            <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                                <a href=\"https://build.dronamobile.com/\" class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 2; color: #FFF; text-decoration: none; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 25px; background-color: #CE4D27; margin: 0 10px 0 0; padding: 0; border-color: #CE4D27; border-style: solid; border-width: 10px 20px;\">Console Login</a>\r\n                                            </p>&#13;\r\n                                        </td>&#13;\r\n                                    </tr>\r\n                                </table><p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">For any issues feel free to contact: <a href=\"mailto:friends@dronamobile.com\">friends@dronamobile.com</a></p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Best Regards,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\"> %admin_name%</p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div>&#13;\r\n                <!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table>\r\n    <!-- /body -->\r\n    <!-- footer --><table class=\"footer-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; clear: both !important; margin: 0; padding: 0;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td align=\"center\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    Trouble with the above link?  Copy and paste the following link into your browser:&#13;\r\n                                    <a href=\"https://build.dronamobile.com/\">https://build.dronamobile.com/</a>&#13;\r\n\r\n                                </p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    You\'re getting this email because you requested an account on dronamobile.com using this email address. If you didn\'t intend to do this, just ignore this email; no account has been created yet.&#13;\r\n                                </p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div><!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table><!-- /footer -->\r\n</body>\r\n</html>','NA'),('DRONAMOBILE_PUSH','%channel_name%: PUSH','<!DOCTYPE html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <title></title>\r\n    <style type=\"text/css\">\r\n        h1, h2, h3, h4, h5, h6 {\r\n            margin: 0 0 5px;\r\n        }\r\n\r\n        p {\r\n            margin: 0 0 1.35em;\r\n        }\r\n\r\n        a {\r\n            color: rgb(88, 173, 105);\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n    <div style=\"width:100%;color:rgb(51, 51, 50);font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva, HelveticaNeue, Verdana,sans-serif;font-size:14px;max-width:640px;\">        \r\n\r\n        <p style=\"color:rgb(179, 179, 177);line-height:1.1em;padding-top:15px;padding-bottom:5px;font-size:22px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\">\r\n            You have received a message on <strong>%channel_name%</strong>\r\n        </p>\r\n\r\n        <ul style=\"padding:0;line-height:25px;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;\">\r\n            %feed_template%\r\n        </ul>\r\n        <h2 style=\"padding:10px 0 7px;color:rgb(179, 179, 177);line-height:13px;letter-spacing:1px;font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva,Verdana,sans-serif;font-size:11px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\"></h2>\r\n\r\n        <div style=\"text-align:left;color:rgb(51, 51, 50);\">\r\n            <p>\r\n                Need help? Please send any feedback or bug reports to\r\n                <a style=\"color:rgb(88, 173, 105);\" href=\"mailto:friends@dronamobile.com\" target=\"_blank\">friends@dronamobile.com</a>\r\n            </p>\r\n        </div>\r\n\r\n    </div>\r\n</body>\r\n</html>','NA'),('DRONAMOBILE_SEND_APP_REMINDER','%channel_name%: Reminder','<!DOCTYPE html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <title></title>\r\n    <style type=\"text/css\">\r\n        h1, h2, h3, h4, h5, h6 {\r\n            margin: 0 0 5px;\r\n        }\r\n\r\n        p {\r\n            margin: 0 0 1.35em;\r\n        }\r\n\r\n        a {\r\n            color: rgb(88, 173, 105);\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n    <div style=\"width:100%;color:rgb(51, 51, 50);font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva, HelveticaNeue, Verdana,sans-serif;font-size:14px;max-width:640px;\">\r\n\r\n        <p style=\"color:rgb(179, 179, 177);line-height:1.1em;padding-top:15px;padding-bottom:5px;font-size:22px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\">\r\n            %channel_name%: App installation Reminder \r\n        </p>\r\n\r\n        <ul style=\"padding:0;line-height:25px;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;\">\r\n            You can download %channel_name% app from all major app stores or click on\r\n            <a href=\"%download_link%\"> %download_link% </a> from your mobile device\r\n        </ul>\r\n        <h2 style=\"padding:10px 0 7px;color:rgb(179, 179, 177);line-height:13px;letter-spacing:1px;font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva,Verdana,sans-serif;font-size:11px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\"></h2>\r\n\r\n        <div style=\"text-align:left;color:rgb(51, 51, 50);\">\r\n            <p>\r\n                Need help? Please send any feedback or bug reports to\r\n                <a style=\"color:rgb(88, 173, 105);\" href=\"mailto:friends@dronamobile.com\" target=\"_blank\">friends@dronamobile.com</a>\r\n            </p>\r\n        </div>\r\n\r\n    </div>\r\n</body>\r\n</html>','NA'),('DRONAMOBILE_USER_INVITE','Join %channel_name% on Dronamobile','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns=\"http://www.w3.org/1999/xhtml\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n</head>\r\n<body bgcolor=\"#f6f6f6\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; margin: 0; padding: 0;\">\r\n    &#13;\r\n    &#13;\r\n    <!-- body -->&#13;\r\n    <table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 20px;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" bgcolor=\"#FFFFFF\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 20px; border: 1px solid #f0f0f0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Hi,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">The official mobile app for %channel_name% is here!</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Register and download the app from all major Appstores, hit the button below to activate your account and start using.</p>&#13;                                \r\n                                <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                                    <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                        <td class=\"padding\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 10px 0;\">\r\n                                            &#13;\r\n                                            <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                                <a href=\"%active_link%\" class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 2; color: #FFF; text-decoration: none; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 25px; background-color: #CE4D27; margin: 0 10px 0 0; padding: 0; border-color: #CE4D27; border-style: solid; border-width: 10px 20px;\">Activate</a>\r\n                                            </p>&#13;\r\n                                        </td>&#13;\r\n                                    </tr>\r\n                                </table><p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">For any issues feel free to contact: <a href=\"mailto:friends@dronamobile.com\">friends@dronamobile.com</a></p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Best Regards,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\"> %admin_name%</p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div>&#13;\r\n                <!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table>\r\n    <!-- /body -->\r\n    <!-- footer --><table class=\"footer-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; clear: both !important; margin: 0; padding: 0;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td align=\"center\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    Trouble with the above link?  Copy and paste the following link into your browser:&#13;\r\n                                    <a href=\"%active_link%\">%active_link%</a>&#13;\r\n\r\n                                </p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    You\'re getting this email because you requested an account on dronamobile.com using this email address. If you didn\'t intend to do this, just ignore this email; no account has been created yet.&#13;\r\n                                </p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div><!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table><!-- /footer -->\r\n</body>\r\n</html>','NA'),('DRONAMOBILE_USER_WELCOME','%channel_name%: Welcome','<!DOCTYPE html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <title></title>\r\n    <style type=\"text/css\">\r\n        h1, h2, h3, h4, h5, h6 {\r\n            margin: 0 0 5px;\r\n        }\r\n\r\n        p {\r\n            margin: 0 0 1.35em;\r\n        }\r\n\r\n        a {\r\n            color: rgb(88, 173, 105);\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n    <div style=\"width:100%;color:rgb(51, 51, 50);font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva, HelveticaNeue, Verdana,sans-serif;font-size:14px;max-width:640px;\">\r\n\r\n        <p style=\"color:rgb(179, 179, 177);line-height:1.1em;padding-top:15px;padding-bottom:5px;font-size:22px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\">\r\n            Welcome to <strong>%channel_name%</strong>\r\n        </p>\r\n\r\n        <ul style=\"padding:0;line-height:25px;font-family:\'ff-tisa-web-pro\',Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:16px;\">\r\n            You can download the app from all major app stores or click on <a href=\"%download_link%\"> %download_link% </a> from your mobile device\r\n        </ul>\r\n        <h2 style=\"padding:10px 0 7px;color:rgb(179, 179, 177);line-height:13px;letter-spacing:1px;font-family:\'freight-sans-pro\',\'Myriad Pro\',\'Lucida Grande\',\'Lucida Sans Unicode\',\'Lucida Sans\',Geneva,Verdana,sans-serif;font-size:11px;border-top-color:rgb(204, 204, 204);border-bottom-color:rgb(204, 204, 204);border-top-width:0;border-bottom-width:1px;border-top-style:solid;border-bottom-style:solid;\"></h2>\r\n\r\n        <div style=\"text-align:left;color:rgb(51, 51, 50);\">\r\n            <p>\r\n                Need help? Please send any feedback or bug reports to\r\n                <a style=\"color:rgb(88, 173, 105);\" href=\"mailto:friends@dronamobile.com\" target=\"_blank\">friends@dronamobile.com</a>\r\n            </p>\r\n        </div>\r\n\r\n    </div>\r\n</body>\r\n</html>','NA'),('DRONA_CONT_CONV','Dronamobile content conversion','<!DOCTYPE html>\r \r <html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\">\r <head>\r     <meta charset=\"utf-8\" />\r     <meta name=\"viewport\" content=\"width=device-width\" />\r     <title></title>\r </head>\r <body>\r     <table style=\"width:600px;line-height:1.4;font-family:\'jaf-bernino-sans\' , \'Helvetica Neue\' , Helvetica , Lucida Grande , \'Lucida Sans Unicode\' , \'Lucida Sans\' , Geneva , Verdana , sans-serif;font-size:16px;font-weight:300;\">\r         <tbody>\r             <tr>\r                 <td style=\"padding:40px 5% 46px;color:rgb(51, 51, 50);\">\r                     <div>\r                         <div style=\"width: 80px; margin: 0 auto;\">\r                             <img style=\"width:80px;display:block;\" alt=\"Dronamobile Logo\" src=\"https://dronamobile.s3.amazonaws.com/drona5/image/drona_mob_logo_145x19.png\">\r                         </div>\r                     </div>\r                     <div>\r                         <span style=\"height:0px;text-indent:-1000px;overflow:hidden;font-size:0px;display:none !important;visibility:hidden;\">\r                             %content_title%\r                         </span>\r                         <div style=\"text-align:center;color:rgb(51, 51, 50);line-height:1.4;font-size:18px;\">\r                             %content_body%\r                         </div>                        \r                         <hr style=\"border-width:0px 0px 1px;border-style:none none solid;border-color:currentColor currentColor rgb(229, 229, 229);width:50px;\">\r                         \r                         <div style=\"color:rgb(51, 51, 50);padding-top:10px;font-size:16px;border-top-color:currentColor;border-top-width:0px;border-top-style:none;\">\r                             <h2 style=\"text-align:center;line-height:1.25;font-family:Georgia,Cambria,\'Times New Roman\',Times,serif;font-size:32px;font-weight:100;\">\r                                 <a style=\"color:rgb(51, 51, 50);text-decoration:none;\" href=\"%content_url%\" target=\"_blank\">\r                                     %content_title%\r                                 </a>\r                             </h2>                            \r                         </div>\r                         <div style=\"text-align:center;\">\r                             <a class=\"ecxemail-btn\" style=\"background:rgb(0, 140, 237);padding:0px 16px;border-radius:999em;border:0px currentColor;height:38px;text-align:center;color:rgb(255, 255, 255);line-height:39px;font-size:14px;font-style:normal;font-weight:400;text-decoration:none;vertical-align:bottom;display:inline-block;white-space:nowrap;cursor:pointer;box-sizing:border-box;-ms-user-select:none;text-rendering:optimizeLegibility;\" href=\"%content_url%\" target=\"_blank\">\r                                 Show me\r                             </a>\r                         </div>                        \r                     </div>\r                 </td>\r             </tr>\r         </tbody>\r     </table>\r </body>\r </html>','NA'),('TEAMGUM_ADMIN_VERIFY','Drona Account Activation','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns=\"http://www.w3.org/1999/xhtml\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n<head>\r\n    <meta name=\"viewport\" content=\"width=device-width\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n</head>\r\n<body bgcolor=\"#f6f6f6\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; margin: 0; padding: 0;\">\r\n    &#13;\r\n    &#13;\r\n    <!-- body -->&#13;\r\n    <table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 20px;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" bgcolor=\"#FFFFFF\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 20px; border: 1px solid #f0f0f0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Hi %admin_name%,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Welcome to DronaHQ!</p>&#13;\r\n                                <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                                    <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                        <td class=\"padding\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 10px 0;\">\r\n                                            &#13;\r\n                                            <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                                <a href=\"%verify_link%\" class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 2; color: #FFF; text-decoration: none; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 25px; background-color: #CE4D27; margin: 0 10px 0 0; padding: 0; border-color: #CE4D27; border-style: solid; border-width: 10px 20px;\">Click here to activate your DronaHQ account </a>\r\n                                            </p>&#13;\r\n                                        </td>&#13;\r\n                                    </tr>\r\n                                </table><p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">If you are facing any issues contact us at: <a href=\"mailto:friends@dronamobile.com\">friends@dronamobile.com</a></p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Best Regards,</p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\"> DronaHQ</p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div>&#13;\r\n                <!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table>\r\n    <!-- /body -->\r\n    <!-- footer --><table class=\"footer-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; clear: both !important; margin: 0; padding: 0;\">\r\n        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n            <td class=\"container\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 0;\">\r\n                &#13;\r\n                &#13;\r\n                <!-- content -->&#13;\r\n                <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                    &#13;\r\n                    <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                        <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                            <td align=\"center\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                &#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    Trouble with the above link?  Copy and paste the following link into your browser:&#13;\r\n                                    <a href=\"%verify_link%\">%verify_link%</a>&#13;\r\n\r\n                                </p>&#13;\r\n                                <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                    You\'re getting this email because you requested an account on dronahq.com using this email address. If you didn\'t intend to do this, just ignore this email; no account has been created yet.&#13;\r\n                                </p>\r\n                            </td>&#13;\r\n                        </tr>\r\n                    </table>\r\n                </div><!-- /content -->&#13;\r\n                &#13;\r\n            </td>&#13;\r\n            <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n        </tr>\r\n    </table><!-- /footer -->\r\n</body>\r\n</html>\r\n',NULL),('TEAMGUM_USER_RESET_PASSWORD','DronaHQ: Reset password','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n <html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns=\"http://www.w3.org/1999/xhtml\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n <head>\r\n     <meta name=\"viewport\" content=\"width=device-width\" />\r\n     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n     <title>Really Simple HTML Email Template</title>\r\n </head>\r\n <body bgcolor=\"#f6f6f6\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; margin: 0; padding: 0;\">\r\n     &#13;\r\n     &#13;\r\n     <!-- body -->&#13;\r\n     <table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 20px;\">\r\n         <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n             <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n             <td class=\"container\" bgcolor=\"#FFFFFF\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 20px; border: 1px solid #f0f0f0;\">\r\n                 &#13;\r\n                 &#13;\r\n                 <!-- content -->&#13;\r\n                 <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                     &#13;\r\n                     <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                         <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                             <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                 &#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Hi %user_name%,</p>&#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Please click on the link below to reset your password</p>&#13;\r\n                                 \r\n                                 <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                                     <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                         <td class=\"padding\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 10px 0;\">\r\n                                             &#13;\r\n                                             <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                                 <a href=\"%reset_link%\" class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 2; color: #FFF; text-decoration: none; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 25px; background-color: #CE4D27; margin: 0 10px 0 0; padding: 0; border-color: #CE4D27; border-style: solid; border-width: 10px 20px;\">Reset password</a>\r\n                                             </p>&#13;\r\n                                         </td>&#13;\r\n                                     </tr>\r\n                                 </table>\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\"><u>Note</u>: This link will expire within 2 hours and can only be used once.</p>&#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\">Best Regards,</p>&#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.6; font-weight: normal; margin: 0 0 10px; padding: 0;\"> DronaHQ</p>\r\n                             </td>&#13;\r\n                         </tr>\r\n                     </table>\r\n                 </div>&#13;\r\n                 <!-- /content -->&#13;\r\n                 &#13;\r\n             </td>&#13;\r\n             <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n         </tr>\r\n     </table>\r\n     <!-- /body -->\r\n     <!-- footer --><table class=\"footer-wrap\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; clear: both !important; margin: 0; padding: 0;\">\r\n         <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n             <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n             <td class=\"container\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto; padding: 0;\">\r\n                 &#13;\r\n                 &#13;\r\n                 <!-- content -->&#13;\r\n                 <div class=\"content\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; max-width: 600px; display: block; margin: 0 auto; padding: 0;\">\r\n                     &#13;\r\n                     <table style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; width: 100%; margin: 0; padding: 0;\">\r\n                         <tr style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                             <td align=\"center\" style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\">\r\n                                 &#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                     Trouble with the link?  Copy and paste the following link into your browser:&#13;\r\n                                     <a href=\"%reset_link%\">%reset_link%</a>&#13;\r\n \r\n                                 </p>&#13;\r\n                                 <p style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 12px; line-height: 1.6; color: #666; font-weight: normal; margin: 0 0 10px; padding: 0;\">\r\n                                     You\'re getting this email because you requested password reset for your account on dronamobile.com. If you didn\'t intend to do this, just ignore this email.&#13;\r\n                                 </p>\r\n                             </td>&#13;\r\n                         </tr>\r\n                     </table>\r\n                 </div><!-- /content -->&#13;\r\n                 &#13;\r\n             </td>&#13;\r\n             <td style=\"font-family: \'Helvetica Neue\', \'Helvetica\', Helvetica, Arial, sans-serif; font-size: 100%; line-height: 1.6; margin: 0; padding: 0;\"></td>&#13;\r\n         </tr>\r\n     </table><!-- /footer -->\r\n </body>\r\n </html>',NULL);
/*!40000 ALTER TABLE `emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtemplatecustom`
--

DROP TABLE IF EXISTS `emailtemplatecustom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplatecustom` (
  `email_context` varchar(255) NOT NULL,
  `channelid` int unsigned DEFAULT NULL,
  `email_body` text,
  `email_subject` varchar(255) DEFAULT NULL,
  `is_html` tinyint(1) DEFAULT NULL,
  `email_from_name` varchar(50) DEFAULT NULL,
  `template_id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`template_id`),
  KEY `FK_emailtemplatecustom_1` (`channelid`),
  CONSTRAINT `FK_emailtemplatecustom_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemplatecustom`
--

LOCK TABLES `emailtemplatecustom` WRITE;
/*!40000 ALTER TABLE `emailtemplatecustom` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailtemplatecustom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embedaccessed`
--

DROP TABLE IF EXISTS `embedaccessed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `embedaccessed` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `accessedDate` datetime NOT NULL,
  `timeSpent` int unsigned NOT NULL,
  `isBrowser` int unsigned NOT NULL,
  `readFrom` text NOT NULL,
  KEY `FK_embedaccessed_1` (`uid`),
  KEY `FK_embedaccessed_2` (`cid`),
  CONSTRAINT `FK_embedaccessed_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_embedaccessed_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embedaccessed`
--

LOCK TABLES `embedaccessed` WRITE;
/*!40000 ALTER TABLE `embedaccessed` DISABLE KEYS */;
/*!40000 ALTER TABLE `embedaccessed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embedaccessedhistory`
--

DROP TABLE IF EXISTS `embedaccessedhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `embedaccessedhistory` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `accessedDate` datetime NOT NULL,
  `timeSpent` int unsigned NOT NULL,
  `isBrowser` int unsigned NOT NULL,
  `readFrom` text NOT NULL,
  KEY `FK_embedaccessedhistory_1` (`uid`),
  KEY `FK_embedaccessedhistory_2` (`cid`),
  CONSTRAINT `FK_embedaccessedhistory_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_embedaccessedhistory_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embedaccessedhistory`
--

LOCK TABLES `embedaccessedhistory` WRITE;
/*!40000 ALTER TABLE `embedaccessedhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `embedaccessedhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embedattachment`
--

DROP TABLE IF EXISTS `embedattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `embedattachment` (
  `aid` int unsigned NOT NULL,
  `embedcode` text NOT NULL,
  `actualurl` varchar(1000) NOT NULL,
  `domainurl` varchar(1000) NOT NULL,
  `imageUrl` varchar(200) DEFAULT NULL,
  `short_url` varchar(450) DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embedattachment`
--

LOCK TABLES `embedattachment` WRITE;
/*!40000 ALTER TABLE `embedattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `embedattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterpriseprovision`
--

DROP TABLE IF EXISTS `enterpriseprovision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterpriseprovision` (
  `provision` varchar(10) NOT NULL DEFAULT 'np',
  `channelId` int unsigned NOT NULL,
  PRIMARY KEY (`channelId`),
  KEY `FK_enterpriseprovision_1` (`channelId`),
  CONSTRAINT `FK_enterpriseprovision_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterpriseprovision`
--

LOCK TABLES `enterpriseprovision` WRITE;
/*!40000 ALTER TABLE `enterpriseprovision` DISABLE KEYS */;
INSERT INTO `enterpriseprovision` VALUES ('N',1);
/*!40000 ALTER TABLE `enterpriseprovision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_logger`
--

DROP TABLE IF EXISTS `external_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_logger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `logger_type` varchar(255) DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `is_deleted` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logger_data` text,
  PRIMARY KEY (`id`),
  KEY `channelid_idx` (`channel_id`),
  CONSTRAINT `channelid` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_logger`
--

LOCK TABLES `external_logger` WRITE;
/*!40000 ALTER TABLE `external_logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fb_user_onboarding_status`
--

DROP TABLE IF EXISTS `fb_user_onboarding_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fb_user_onboarding_status` (
  `user_onboard_id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `channelid` int NOT NULL,
  `studio_status` tinyint NOT NULL DEFAULT '0',
  `app_listing_status` tinyint NOT NULL DEFAULT '0',
  `sheet_status` tinyint NOT NULL DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_onboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fb_user_onboarding_status`
--

LOCK TABLES `fb_user_onboarding_status` WRITE;
/*!40000 ALTER TABLE `fb_user_onboarding_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `fb_user_onboarding_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folderstructure`
--

DROP TABLE IF EXISTS `folderstructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folderstructure` (
  `f_id` int unsigned NOT NULL AUTO_INCREMENT,
  `actionId` int unsigned NOT NULL,
  `mapId` int unsigned DEFAULT NULL,
  `order_index` int unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `catType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `Index_2` (`mapId`,`catType`),
  KEY `FK_folderstructure_1` (`actionId`),
  CONSTRAINT `FK_folderstructure_1` FOREIGN KEY (`actionId`) REFERENCES `actionbutton` (`abid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folderstructure`
--

LOCK TABLES `folderstructure` WRITE;
/*!40000 ALTER TABLE `folderstructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `folderstructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder`
--

DROP TABLE IF EXISTS `formbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder` (
  `formid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `formcontent` longtext NOT NULL,
  `formhash` varchar(200) NOT NULL,
  `createdon` datetime NOT NULL,
  `channelId` int unsigned NOT NULL,
  `formeditor` longtext NOT NULL,
  `tytitle` text NOT NULL COMMENT 'ty: thankyou',
  `tytext` text NOT NULL COMMENT 'ty: thankyou',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formid`),
  UNIQUE KEY `Index_3` (`formhash`),
  KEY `FK_formbuilder_1` (`channelId`),
  CONSTRAINT `FK_formbuilder_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder`
--

LOCK TABLES `formbuilder` WRITE;
/*!40000 ALTER TABLE `formbuilder` DISABLE KEYS */;
/*!40000 ALTER TABLE `formbuilder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_controls`
--

DROP TABLE IF EXISTS `formbuilder_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_controls` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `control_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `control_coffee` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `control_version` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `control_handlebar` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `control_css` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `control_js` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_by` int DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `control_coffee_js` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `control_angular_ts` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `control_angular_html` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `control_angular_css` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `is_stable` tinyint DEFAULT '0',
  `control_display_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `control_tags` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `control_icon_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `control_groups` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `g_id` int DEFAULT '6',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_controls`
--

LOCK TABLES `formbuilder_controls` WRITE;
/*!40000 ALTER TABLE `formbuilder_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `formbuilder_controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_controls_category`
--

DROP TABLE IF EXISTS `formbuilder_controls_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_controls_category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_controls_category`
--

LOCK TABLES `formbuilder_controls_category` WRITE;
/*!40000 ALTER TABLE `formbuilder_controls_category` DISABLE KEYS */;
INSERT INTO `formbuilder_controls_category` VALUES (1,'Form'),(2,'Visual');
/*!40000 ALTER TABLE `formbuilder_controls_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_controls_group`
--

DROP TABLE IF EXISTS `formbuilder_controls_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_controls_group` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_name` varchar(200) DEFAULT NULL,
  `g_order` int DEFAULT NULL,
  `cat_id` int DEFAULT '2',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_controls_group`
--

LOCK TABLES `formbuilder_controls_group` WRITE;
/*!40000 ALTER TABLE `formbuilder_controls_group` DISABLE KEYS */;
INSERT INTO `formbuilder_controls_group` VALUES (1,'Button',4,1),(2,'Media',10,2),(3,'Native',5,1),(4,'Basic',2,1),(5,'Advance',6,1),(6,'Selection',3,1),(7,'Section Break',9,2),(8,'display',7,2),(9,'Navigation',14,2),(10,'Date & Time',5,1),(11,'Advance display',11,2),(13,'Container',8,2),(14,'Charts',12,2),(15,'Menu',15,2),(17,'Installed',13,2),(18,'Layouts',9,2),(19,'Custom',17,2),(20,'Dashboard',16,2),(21,'List',15,1),(22,'Featured',1,1);
/*!40000 ALTER TABLE `formbuilder_controls_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_download_publish`
--

DROP TABLE IF EXISTS `formbuilder_download_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_download_publish` (
  `fdp_id` int NOT NULL AUTO_INCREMENT,
  `fdp_secret_key` text,
  `form_id` int DEFAULT NULL,
  `plugin_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `form_editor` longtext,
  `created_date` datetime DEFAULT NULL,
  `fdp_type` varchar(45) DEFAULT NULL,
  `fdp_version` varchar(45) DEFAULT NULL,
  `release_notes` varchar(200) DEFAULT NULL,
  `environment_type` varchar(45) DEFAULT 'prod',
  `conditional_visibility_data` longtext,
  `validation_data` longtext,
  PRIMARY KEY (`fdp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_download_publish`
--

LOCK TABLES `formbuilder_download_publish` WRITE;
/*!40000 ALTER TABLE `formbuilder_download_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `formbuilder_download_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_embed`
--

DROP TABLE IF EXISTS `formbuilder_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_embed` (
  `embed_id` int NOT NULL AUTO_INCREMENT,
  `embedcode` varchar(45) NOT NULL,
  `plugin_id` int DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `ready_only` tinyint DEFAULT '0',
  `is_disable` tinyint DEFAULT '1',
  `frdname` varchar(45) DEFAULT '',
  `emdfavicom` varchar(450) DEFAULT '',
  `emdtitle` varchar(200) DEFAULT '',
  `emddecscription` varchar(450) DEFAULT '',
  `emdshortdescription` varchar(450) DEFAULT '',
  `is_private` tinyint DEFAULT '0',
  `pwa_manifest` text,
  PRIMARY KEY (`embed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_embed`
--

LOCK TABLES `formbuilder_embed` WRITE;
/*!40000 ALTER TABLE `formbuilder_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `formbuilder_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formbuilder_tool`
--

DROP TABLE IF EXISTS `formbuilder_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formbuilder_tool` (
  `formid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `formcontent` longtext NOT NULL,
  `formhash` varchar(200) NOT NULL,
  `createdon` datetime NOT NULL,
  `channelId` int unsigned NOT NULL,
  `formeditor` longtext NOT NULL,
  `tytitle` text NOT NULL COMMENT 'ty: thankyou',
  `tytext` text NOT NULL COMMENT 'ty: thankyou',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ab_id` int DEFAULT NULL,
  `plugin_id` int DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `last_updated_by` int DEFAULT '0',
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`formid`),
  KEY `FK_formbuilder1_1` (`channelId`),
  CONSTRAINT `FK_formbuilder1_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formbuilder_tool`
--

LOCK TABLES `formbuilder_tool` WRITE;
/*!40000 ALTER TABLE `formbuilder_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `formbuilder_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupcampaignhistory`
--

DROP TABLE IF EXISTS `groupcampaignhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupcampaignhistory` (
  `gid` int unsigned NOT NULL,
  `campId` int unsigned NOT NULL,
  `modifiedDate` datetime NOT NULL,
  KEY `FK_groupcampaignhistory_1` (`gid`),
  KEY `FK_groupcampaignhistory_2` (`campId`),
  CONSTRAINT `FK_groupcampaignhistory_1` FOREIGN KEY (`gid`) REFERENCES `usergroup` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_groupcampaignhistory_2` FOREIGN KEY (`campId`) REFERENCES `campaign` (`campId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupcampaignhistory`
--

LOCK TABLES `groupcampaignhistory` WRITE;
/*!40000 ALTER TABLE `groupcampaignhistory` DISABLE KEYS */;
INSERT INTO `groupcampaignhistory` VALUES (1,1,'2021-11-29 08:26:33');
/*!40000 ALTER TABLE `groupcampaignhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iphonepushtokens`
--

DROP TABLE IF EXISTS `iphonepushtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iphonepushtokens` (
  `uid` int unsigned NOT NULL,
  `tokenId` text NOT NULL,
  `appname` text NOT NULL,
  `appversion` text,
  `pushbadge` text NOT NULL,
  `pushalert` text NOT NULL,
  `pushsound` text NOT NULL,
  `deviceid` varchar(100) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  `app_status` varchar(45) DEFAULT 'Active',
  `app_status_modified_date` datetime DEFAULT NULL,
  KEY `FK_iphonepushtokens_1` (`uid`),
  KEY `FK_iphonepushtokens_2_idx` (`deviceid`),
  KEY `FK_iphonepushtokens_3` (`is_valid`),
  CONSTRAINT `FK_iphonepushtokens_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iphonepushtokens`
--

LOCK TABLES `iphonepushtokens` WRITE;
/*!40000 ALTER TABLE `iphonepushtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `iphonepushtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kftimespent`
--

DROP TABLE IF EXISTS `kftimespent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kftimespent` (
  `uid` int unsigned NOT NULL,
  `timespent` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `modifieddate` datetime NOT NULL,
  KEY `FK_kftimespent_1` (`uid`),
  KEY `FK_kftimespent_2` (`channelid`),
  CONSTRAINT `FK_kftimespent_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kftimespent_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kftimespent`
--

LOCK TABLES `kftimespent` WRITE;
/*!40000 ALTER TABLE `kftimespent` DISABLE KEYS */;
/*!40000 ALTER TABLE `kftimespent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lic_channel_limit`
--

DROP TABLE IF EXISTS `lic_channel_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lic_channel_limit` (
  `channelid` int unsigned NOT NULL,
  `template_count` int unsigned NOT NULL,
  PRIMARY KEY (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Record different parameters allowed or not in a channel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lic_channel_limit`
--

LOCK TABLES `lic_channel_limit` WRITE;
/*!40000 ALTER TABLE `lic_channel_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lic_channel_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_machine_mapping`
--

DROP TABLE IF EXISTS `license_machine_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_machine_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_key` varchar(100) NOT NULL,
  `machine_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_machine_mapping`
--

LOCK TABLES `license_machine_mapping` WRITE;
/*!40000 ALTER TABLE `license_machine_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_machine_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licensecounter`
--

DROP TABLE IF EXISTS `licensecounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licensecounter` (
  `channelid` int unsigned NOT NULL,
  `pushCount` int unsigned NOT NULL DEFAULT '0',
  `broadcastCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licensecounter`
--

LOCK TABLES `licensecounter` WRITE;
/*!40000 ALTER TABLE `licensecounter` DISABLE KEYS */;
INSERT INTO `licensecounter` VALUES (1,0,0);
/*!40000 ALTER TABLE `licensecounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapviewcat`
--

DROP TABLE IF EXISTS `mapviewcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapviewcat` (
  `viewid` int unsigned NOT NULL,
  `catid` int unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  KEY `Index_2` (`catid`,`type`),
  KEY `Index_3` (`catid`),
  KEY `Index_4` (`type`),
  KEY `idx_pviewname` (`viewid`),
  CONSTRAINT `FK_mapviewcat_1` FOREIGN KEY (`viewid`) REFERENCES `categorytemplate` (`viewid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapviewcat`
--

LOCK TABLES `mapviewcat` WRITE;
/*!40000 ALTER TABLE `mapviewcat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapviewcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapviewgrp`
--

DROP TABLE IF EXISTS `mapviewgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapviewgrp` (
  `viewid` int unsigned NOT NULL,
  `gid` int unsigned NOT NULL,
  KEY `FK_mapviewgrp_1` (`viewid`),
  KEY `FK_mapviewgrp_2` (`gid`),
  CONSTRAINT `FK_mapviewgrp_1` FOREIGN KEY (`viewid`) REFERENCES `categorytemplate` (`viewid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mapviewgrp_2` FOREIGN KEY (`gid`) REFERENCES `usergroup` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapviewgrp`
--

LOCK TABLES `mapviewgrp` WRITE;
/*!40000 ALTER TABLE `mapviewgrp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapviewgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationrange`
--

DROP TABLE IF EXISTS `notificationrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationrange` (
  `fromRange` time NOT NULL,
  `toRange` time NOT NULL,
  `nrid` int unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL,
  PRIMARY KEY (`nrid`),
  KEY `FK_notificationrange_1` (`gid`),
  CONSTRAINT `FK_notificationrange_1` FOREIGN KEY (`gid`) REFERENCES `usergroup` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationrange`
--

LOCK TABLES `notificationrange` WRITE;
/*!40000 ALTER TABLE `notificationrange` DISABLE KEYS */;
INSERT INTO `notificationrange` VALUES ('00:00:00','00:00:00',1,1);
/*!40000 ALTER TABLE `notificationrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_app`
--

DROP TABLE IF EXISTS `oauth_client_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_app` (
  `oauth_app_id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(150) DEFAULT NULL,
  `app_platform` varchar(255) DEFAULT NULL,
  `app_description` varchar(255) DEFAULT NULL,
  `app_create_date` datetime DEFAULT NULL,
  `app_modified_date` datetime DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`oauth_app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Client apps which will be allowed to use the OAuth api';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_app`
--

LOCK TABLES `oauth_client_app` WRITE;
/*!40000 ALTER TABLE `oauth_client_app` DISABLE KEYS */;
INSERT INTO `oauth_client_app` VALUES (1,'Drona HQ Web App','Web',NULL,'2018-04-03 06:46:42','2018-04-03 06:46:42','54674576dshfjsdhjhbewchgre7478438557873457','dhgfsuuweruy675263562354gsd6tr7483wgrf734',1),(2,'DronaHQ for iOS','iOS','','2015-11-04 12:29:17','2015-11-04 12:29:17','mhjgft6rtfgc65rtfrtde3w54dbnzxc67tgeretgf','qwecrefg65ytrgbmnklpoi89u8yhughzvxfdewyt3fdgvh',1),(3,'DronaHQ','Android','Production App ID for DronaHQ App','2015-12-21 06:38:51','2015-12-21 06:38:51','09fa8aaa2ddb1183983c5fd965c3cd3a3965e412','4aaec6c7c51e0ce3556b2fe57dddd985618d4129',1);
/*!40000 ALTER TABLE `oauth_client_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_expired_token`
--

DROP TABLE IF EXISTS `oauth_expired_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_expired_token` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `token_expiry_date` datetime DEFAULT NULL,
  `token_type` char(20) DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tokens which have expired. Use to make sure a expired token is not re-used, atleast for 3 months';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_expired_token`
--

LOCK TABLES `oauth_expired_token` WRITE;
/*!40000 ALTER TABLE `oauth_expired_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_expired_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_token` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `uid` int unsigned DEFAULT NULL,
  `channelid` int unsigned DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `app_id` int DEFAULT NULL COMMENT 'OAuth Client App Id',
  `access_token` varchar(255) DEFAULT NULL,
  `expire_on` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `ip_address` varchar(55) DEFAULT NULL,
  `ua_string` varchar(255) DEFAULT NULL COMMENT 'UserAgent string of the requester',
  `last_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`token_id`),
  KEY `FK_oauth_token_3` (`device_id`),
  KEY `idx_prefresh_token` (`refresh_token`),
  KEY `idx_access_token` (`access_token`),
  KEY `FK_oauth_token_1` (`uid`),
  KEY `FK_oauth_token_4` (`app_id`),
  KEY `FK_oauth_token_2` (`channelid`),
  CONSTRAINT `FK_oauth_token_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_oauth_token_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_oauth_token_4` FOREIGN KEY (`app_id`) REFERENCES `oauth_client_app` (`oauth_app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token`
--

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app`
--

DROP TABLE IF EXISTS `plugin_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app` (
  `plugin_id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(30) NOT NULL,
  `plugin_desc` varchar(160) NOT NULL,
  `plugin_type` char(5) NOT NULL COMMENT 'RU: Remote URL, ZP: Zip Package',
  `channelid` int unsigned NOT NULL,
  `plugin_url` varchar(145) NOT NULL,
  `plugin_icon_url_xhdpi` varchar(145) NOT NULL DEFAULT '',
  `plugin_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `plugin_icon_url_hdpi` varchar(145) NOT NULL DEFAULT '',
  `plugin_icon_url_mdpi` varchar(145) NOT NULL DEFAULT '',
  `plugin_icon_url_ldpi` varchar(145) NOT NULL DEFAULT '',
  `latest_version` int unsigned NOT NULL DEFAULT '0',
  `plugin_theme_color` varchar(10) NOT NULL DEFAULT '' COMMENT 'Theme color for the app. Used by iOS close button.',
  `plugin_statusbar` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: Hide statusbar, 1: Show statusbar',
  `plugin_statusbar_bgcolor` varchar(40) NOT NULL DEFAULT '' COMMENT 'Background color for the statusbar, if shown',
  `plugin_statusbar_style` varchar(10) NOT NULL DEFAULT 'DARK' COMMENT 'Dark/Light content text color',
  `plugin_hide_close_btn` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0: Show close. 1: Hide close',
  `plugin_install_type` char(9) NOT NULL DEFAULT 'OPT',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether this app is active or not',
  `beta_version` int unsigned NOT NULL DEFAULT '0',
  `is_draft` tinyint unsigned NOT NULL DEFAULT '0',
  `admin_url` text,
  `dev_version` int DEFAULT '0',
  `expiry_date` date DEFAULT NULL,
  `build_by` varchar(45) DEFAULT 'D',
  `owner_uid` int DEFAULT '0',
  `is_git` int DEFAULT '0',
  PRIMARY KEY (`plugin_id`),
  KEY `idx_plugin_app1` (`plugin_id`,`channelid`,`latest_version`,`beta_version`,`dev_version`),
  KEY `Index_3` (`is_active`),
  KEY `Index_4` (`is_draft`),
  KEY `idx_pplugin_app_env` (`latest_version`,`beta_version`,`dev_version`),
  KEY `FK_plugin_app_1` (`channelid`),
  CONSTRAINT `FK_plugin_app_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app`
--

LOCK TABLES `plugin_app` WRITE;
/*!40000 ALTER TABLE `plugin_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_environment_users`
--

DROP TABLE IF EXISTS `plugin_app_environment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_environment_users` (
  `plugin_id` int unsigned NOT NULL,
  `uid` int unsigned NOT NULL,
  `environment` varchar(5) NOT NULL DEFAULT 'prod',
  `added_on` datetime DEFAULT '0000-00-00 00:00:00',
  `id` int NOT NULL AUTO_INCREMENT,
  KEY `idx_plugin_app_environment_users1` (`id`,`environment`,`uid`,`plugin_id`),
  KEY `idx_pname_plugin_app_environment_users` (`uid`,`environment`,`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_environment_users`
--

LOCK TABLES `plugin_app_environment_users` WRITE;
/*!40000 ALTER TABLE `plugin_app_environment_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_environment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_permissions`
--

DROP TABLE IF EXISTS `plugin_app_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_permissions` (
  `plugin_id` int unsigned NOT NULL,
  `uid` int unsigned NOT NULL,
  `channel_id` int DEFAULT NULL,
  `permission` tinyint unsigned NOT NULL,
  UNIQUE KEY `permission_unique_combination` (`plugin_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_permissions`
--

LOCK TABLES `plugin_app_permissions` WRITE;
/*!40000 ALTER TABLE `plugin_app_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_rating`
--

DROP TABLE IF EXISTS `plugin_app_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_rating` (
  `rating_id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned NOT NULL,
  `plugin_ver_id` int unsigned NOT NULL,
  `ab_id` int unsigned NOT NULL,
  `uid` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `rating` int unsigned NOT NULL,
  `rated_on` datetime NOT NULL,
  `device_type` varchar(45) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `FK_plugin_app_rating_5` (`uid`),
  KEY `FK_plugin_app_rating_2` (`plugin_ver_id`),
  KEY `FK_plugin_app_rating_1` (`plugin_id`),
  KEY `FK_plugin_app_rating_4` (`channelid`),
  CONSTRAINT `FK_plugin_app_rating_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_plugin_app_rating_2` FOREIGN KEY (`plugin_ver_id`) REFERENCES `plugin_app_version` (`plugin_ver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_plugin_app_rating_4` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_plugin_app_rating_5` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_rating`
--

LOCK TABLES `plugin_app_rating` WRITE;
/*!40000 ALTER TABLE `plugin_app_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_setting`
--

DROP TABLE IF EXISTS `plugin_app_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_setting` (
  `plugin_id` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `plugin_allow_text_copy` tinyint(1) NOT NULL,
  `plugin_allow_screen_shot` tinyint(1) NOT NULL,
  `support_email` varchar(150) DEFAULT '',
  `support_phone` varchar(150) DEFAULT '',
  `is_hidden` tinyint unsigned NOT NULL COMMENT '1 : hidden',
  `is_phone_portrait` tinyint(1) NOT NULL DEFAULT '1',
  `is_phone_landscape` tinyint(1) NOT NULL DEFAULT '1',
  `is_tablet_portrait` tinyint(1) NOT NULL DEFAULT '1',
  `is_tablet_landscape` tinyint(1) NOT NULL DEFAULT '1',
  `allow_http` tinyint(1) DEFAULT '0',
  `on_ios_tablet` tinyint(1) NOT NULL DEFAULT '1',
  `on_android_mobile` tinyint(1) NOT NULL DEFAULT '1',
  `on_android_tablet` tinyint(1) NOT NULL DEFAULT '1',
  `on_windows_mobile` tinyint(1) NOT NULL DEFAULT '1',
  `on_windows_tablet` tinyint(1) NOT NULL DEFAULT '1',
  `on_windows_desktop` tinyint(1) NOT NULL DEFAULT '1',
  `on_web_browser` tinyint(1) NOT NULL DEFAULT '1',
  `allow_web_access` tinyint(1) NOT NULL DEFAULT '1',
  `app_min_width` int unsigned NOT NULL DEFAULT '0',
  `app_max_width` int unsigned NOT NULL DEFAULT '0',
  `app_min_width_msg` varchar(250) DEFAULT '',
  `on_mac_desktop` tinyint(1) NOT NULL DEFAULT '1',
  `on_ios_mobile` tinyint(1) NOT NULL DEFAULT '1',
  `is_phone_landscape_notch` tinyint DEFAULT '0',
  `ios_bottombar_color` varchar(45) DEFAULT 'f5f5f5,f5f5f5',
  `android_bottombar_color` varchar(45) DEFAULT 'f5f5f5',
  `enable_logging` tinyint(1) DEFAULT '1',
  `logging_with_screenshot` tinyint(1) DEFAULT '0',
  `verify_digest` tinyint DEFAULT '0',
  `show_multistep_auth_screen` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`plugin_id`),
  CONSTRAINT `FK_plugin_app_setting_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_setting`
--

LOCK TABLES `plugin_app_setting` WRITE;
/*!40000 ALTER TABLE `plugin_app_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_universal_link`
--

DROP TABLE IF EXISTS `plugin_app_universal_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_universal_link` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned NOT NULL,
  `app_prefix` text NOT NULL,
  `bundle_id` text NOT NULL,
  `absolute_url` text NOT NULL,
  `relative_url` text NOT NULL,
  `unique_key` text NOT NULL,
  `win_registry_key` varchar(250) DEFAULT '',
  `win_registry_location` varchar(250) DEFAULT '',
  `android_package_name` varchar(145) DEFAULT '' COMMENT 'for android package name',
  PRIMARY KEY (`id`),
  KEY `FK_plugin_app_universal_link_1` (`plugin_id`),
  CONSTRAINT `FK_plugin_app_universal_link_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_universal_link`
--

LOCK TABLES `plugin_app_universal_link` WRITE;
/*!40000 ALTER TABLE `plugin_app_universal_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_universal_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_app_version`
--

DROP TABLE IF EXISTS `plugin_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_app_version` (
  `plugin_ver_id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned NOT NULL,
  `version_code` varchar(15) NOT NULL,
  `whats_new` varchar(160) NOT NULL,
  `update_on` datetime NOT NULL,
  `plugin_url` varchar(145) NOT NULL COMMENT 'Actual URL of zip/link app',
  `plugin_web_url` varchar(145) NOT NULL COMMENT 'Web access URL for web packages',
  `update_type` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'OPT' COMMENT 'OPT: Optional, FORCE: Mandatory',
  `package_size` bigint unsigned NOT NULL COMMENT 'Package Size in bytes',
  `web_access` tinyint(1) NOT NULL COMMENT 'Whethere web access is enabled for Zip package',
  `package_checksum` varchar(145) NOT NULL COMMENT 'SHA1 checksum for the zip package',
  `download_url_na` text,
  `background_upgrade_only` tinyint unsigned NOT NULL DEFAULT '0',
  `updated_by` int unsigned NOT NULL DEFAULT '0',
  `environment` varchar(5) DEFAULT 'prod',
  PRIMARY KEY (`plugin_ver_id`),
  KEY `idx_plugin_app_version1` (`plugin_ver_id`,`plugin_id`),
  KEY `idx_pplugin_app_version` (`environment`,`plugin_id`,`version_code`),
  KEY `FK_plugin_app_version_1` (`plugin_id`),
  CONSTRAINT `FK_plugin_app_version_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Version history of plugin apps';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_app_version`
--

LOCK TABLES `plugin_app_version` WRITE;
/*!40000 ALTER TABLE `plugin_app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_template_map`
--

DROP TABLE IF EXISTS `plugin_template_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_template_map` (
  `plugin_id` int unsigned NOT NULL,
  `template_id` int unsigned NOT NULL,
  `ab_id` int unsigned NOT NULL COMMENT 'ID of the corresponsing action button',
  KEY `FK_plugin_template_map_1` (`plugin_id`),
  KEY `FK_plugin_template_map_2` (`template_id`),
  KEY `FK_plugin_template_map_3` (`ab_id`),
  CONSTRAINT `FK_plugin_template_map_1` FOREIGN KEY (`plugin_id`) REFERENCES `plugin_app` (`plugin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_plugin_template_map_2` FOREIGN KEY (`template_id`) REFERENCES `categorytemplate` (`viewid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_plugin_template_map_3` FOREIGN KEY (`ab_id`) REFERENCES `actionbutton` (`abid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_template_map`
--

LOCK TABLES `plugin_template_map` WRITE;
/*!40000 ALTER TABLE `plugin_template_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_template_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_token`
--

DROP TABLE IF EXISTS `plugin_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_token` (
  `channelid` int unsigned NOT NULL,
  `tokenkey` varchar(150) NOT NULL,
  `token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `token_type` char(5) NOT NULL COMMENT 'G: Global, P: Plugin',
  `plugin_id` int unsigned NOT NULL DEFAULT '0',
  KEY `idx_ptoken_id` (`token_id`),
  KEY `idx_ptokenkey` (`tokenkey`),
  KEY `idx_pplugin_id` (`plugin_id`),
  KEY `FK_plugin_token_1` (`channelid`),
  CONSTRAINT `FK_plugin_token_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_token`
--

LOCK TABLES `plugin_token` WRITE;
/*!40000 ALTER TABLE `plugin_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_token_expired`
--

DROP TABLE IF EXISTS `plugin_token_expired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_token_expired` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tokenkey` text NOT NULL,
  `token_type` varchar(5) NOT NULL,
  `plugin_id` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `expired_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plugin_token_expired_1` (`channelid`),
  CONSTRAINT `FK_plugin_token_expired_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_token_expired`
--

LOCK TABLES `plugin_token_expired` WRITE;
/*!40000 ALTER TABLE `plugin_token_expired` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_token_expired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_user_beta`
--

DROP TABLE IF EXISTS `plugin_user_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_user_beta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL,
  `plugin_id` int DEFAULT NULL,
  `plugin_ver_id` int unsigned NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_4` (`uid`,`plugin_id`,`plugin_ver_id`),
  KEY `FK_plugin_user_beta_2` (`plugin_ver_id`),
  CONSTRAINT `FK_plugin_user_beta_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_user_beta`
--

LOCK TABLES `plugin_user_beta` WRITE;
/*!40000 ALTER TABLE `plugin_user_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_user_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_whitelisted_ip`
--

DROP TABLE IF EXISTS `plugin_whitelisted_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_whitelisted_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channelid` int unsigned NOT NULL,
  `plugin_id` int unsigned NOT NULL,
  `ip` text NOT NULL,
  `action` varchar(50) DEFAULT '',
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plugin_whitelisted_ip_2` (`plugin_id`),
  KEY `FK_plugin_whitelisted_ip_1` (`channelid`),
  CONSTRAINT `FK_plugin_whitelisted_ip_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_whitelisted_ip`
--

LOCK TABLES `plugin_whitelisted_ip` WRITE;
/*!40000 ALTER TABLE `plugin_whitelisted_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_whitelisted_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releasenotes`
--

DROP TABLE IF EXISTS `releasenotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `releasenotes` (
  `channelId` int unsigned NOT NULL,
  `version` varchar(100) NOT NULL,
  `notes` text NOT NULL,
  `device_type` text NOT NULL,
  `rid` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`),
  KEY `FK_releaseNotes_1` (`channelId`),
  CONSTRAINT `FK_releaseNotes_1` FOREIGN KEY (`channelId`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releasenotes`
--

LOCK TABLES `releasenotes` WRITE;
/*!40000 ALTER TABLE `releasenotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `releasenotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rid` int unsigned NOT NULL AUTO_INCREMENT,
  `rolename` text NOT NULL,
  `usermanagement` tinyint(1) NOT NULL,
  `campaignmanagement` tinyint(1) NOT NULL,
  `analysis` tinyint(1) NOT NULL,
  `rolecreationdate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  `cmidbunch` text,
  `team_owner` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `FK_roles_1` (`channelid`),
  CONSTRAINT `FK_roles_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',1,1,1,'2021-11-29 08:26:33',1,NULL,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saaslicence_addons`
--

DROP TABLE IF EXISTS `saaslicence_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saaslicence_addons` (
  `addon_id` int NOT NULL,
  `addon_type` varchar(45) DEFAULT NULL,
  `addon_name` varchar(200) DEFAULT NULL,
  `addon_start` datetime DEFAULT NULL,
  `addon_duration` int DEFAULT NULL,
  `addon_recurring` datetime DEFAULT NULL,
  `addon_total_runs` int DEFAULT NULL,
  `addon_total_consume` int DEFAULT NULL,
  `addon_istrial` int DEFAULT NULL,
  `addon_isactive` int DEFAULT NULL,
  `addon_paymode` varchar(45) DEFAULT NULL,
  `channelid` int DEFAULT NULL,
  `addon_exceptions` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`addon_id`),
  UNIQUE KEY `ADDON_LOCAL_CK` (`addon_type`,`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saaslicence_addons`
--

LOCK TABLES `saaslicence_addons` WRITE;
/*!40000 ALTER TABLE `saaslicence_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `saaslicence_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saaslicence_addons_machine`
--

DROP TABLE IF EXISTS `saaslicence_addons_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saaslicence_addons_machine` (
  `addon_id` int NOT NULL,
  `addon_type` varchar(45) DEFAULT NULL,
  `addon_name` varchar(200) DEFAULT NULL,
  `addon_total_runs` int DEFAULT NULL,
  `addon_total_consume` int DEFAULT NULL,
  `channelid` int DEFAULT NULL,
  PRIMARY KEY (`addon_id`),
  UNIQUE KEY `ADDON_LOCALMACHINE_CK` (`addon_type`,`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saaslicence_addons_machine`
--

LOCK TABLES `saaslicence_addons_machine` WRITE;
/*!40000 ALTER TABLE `saaslicence_addons_machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `saaslicence_addons_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saaslicense`
--

DROP TABLE IF EXISTS `saaslicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saaslicense` (
  `channelid` int unsigned NOT NULL,
  `noitarud` text NOT NULL,
  `tratsfoetad` text NOT NULL,
  `yeklac` text NOT NULL,
  `yekdis` text NOT NULL,
  `planname` text NOT NULL,
  `tnuocresu` text NOT NULL,
  `tnuocyreviled` text NOT NULL,
  `ecapsksid` text NOT NULL,
  `tnuochsup` text NOT NULL,
  `abr` text NOT NULL,
  `lebaletihw` text NOT NULL,
  `yripxec` text NOT NULL,
  `etadrrucer` text NOT NULL,
  `ppsubId` text,
  `tnuocmcb` text,
  `tnuocgetac` text,
  `fin_status` varchar(5) NOT NULL DEFAULT 'PD' COMMENT 'Financial Status. PO, IN, PD',
  `grace_duration` int unsigned NOT NULL DEFAULT '0' COMMENT 'Grace in days',
  `lic_type` varchar(45) DEFAULT '',
  `lic_action` varchar(45) DEFAULT '',
  KEY `FK_saaslicense_1` (`channelid`),
  CONSTRAINT `FK_saaslicense_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saaslicense`
--

LOCK TABLES `saaslicense` WRITE;
/*!40000 ALTER TABLE `saaslicense` DISABLE KEYS */;
INSERT INTO `saaslicense` VALUES (1,'F6746CF9D2B2BF5CA0482AFF00872FE3','E5ADF7B005F674EA3FF18050633F241074D12A4D2A9494BBEEFE057BFFD50334','F37C90CE5D879905F861078E70C458152803DD66043A6704359FE1C09D8B96BB','FC8CC739A5994372CE0D0A9AA4B19B10D25DC786C44D31A7528A457D1AF80D37','Premium','37C60596F326CB528C7E64A8CD43B44F','62D4BBCBD9426E056CD91CCDFEE081C1','F6746CF9D2B2BF5CA0482AFF00872FE3','62D4BBCBD9426E056CD91CCDFEE081C1','EB2FCCFB80981DBDF4449A0D5318D066','F6746CF9D2B2BF5CA0482AFF00872FE3','F6746CF9D2B2BF5CA0482AFF00872FE3','13EABDD0C9E5EAE11FA6DCD953CFBB4674D6CCD018FE4335B7E2061ABF471038','12674D3FCC1FA2FA9677446F6CA94994','62D4BBCBD9426E056CD91CCDFEE081C1','82ECD8E6E0B097E6B5B66BE0A5595FDF','',0,'','');
/*!40000 ALTER TABLE `saaslicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saaslicensestatus`
--

DROP TABLE IF EXISTS `saaslicensestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saaslicensestatus` (
  `channelid` int unsigned NOT NULL,
  `status` int unsigned NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`channelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saaslicensestatus`
--

LOCK TABLES `saaslicensestatus` WRITE;
/*!40000 ALTER TABLE `saaslicensestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `saaslicensestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saasplan`
--

DROP TABLE IF EXISTS `saasplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saasplan` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_type` varchar(45) DEFAULT NULL,
  `payment_mode` varchar(45) DEFAULT NULL,
  `is_trial` tinyint DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `channelid` int DEFAULT NULL,
  `plan_mode` varchar(45) DEFAULT NULL,
  `plan_duration` char(1) DEFAULT NULL,
  `plan_amount` double DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saasplan`
--

LOCK TABLES `saasplan` WRITE;
/*!40000 ALTER TABLE `saasplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `saasplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulestyling`
--

DROP TABLE IF EXISTS `schedulestyling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedulestyling` (
  `styId` int unsigned NOT NULL AUTO_INCREMENT,
  `styling` text NOT NULL,
  PRIMARY KEY (`styId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulestyling`
--

LOCK TABLES `schedulestyling` WRITE;
/*!40000 ALTER TABLE `schedulestyling` DISABLE KEYS */;
INSERT INTO `schedulestyling` VALUES (1,'Pattern'),(2,'Day/Date');
/*!40000 ALTER TABLE `schedulestyling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selfhosted_license_register`
--

DROP TABLE IF EXISTS `selfhosted_license_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selfhosted_license_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `yekesnecil` text NOT NULL,
  `diliame` text NOT NULL,
  `niamodevitca` text NOT NULL,
  `sutatsstth` text NOT NULL,
  `sutats` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(45) DEFAULT NULL,
  `noisrevetadpu` text,
  `noisrevcnys` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selfhosted_license_register`
--

LOCK TABLES `selfhosted_license_register` WRITE;
/*!40000 ALTER TABLE `selfhosted_license_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `selfhosted_license_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliated_nalp_merpno`
--

DROP TABLE IF EXISTS `sliated_nalp_merpno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliated_nalp_merpno` (
  `channel_id` int unsigned NOT NULL,
  `lennahc_json` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sync_at` datetime DEFAULT NULL,
  `tnuoc_json` longtext,
  `noitpecxe_json` longtext,
  `kcol_operation` tinyint DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `channel_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliated_nalp_merpno`
--

LOCK TABLES `sliated_nalp_merpno` WRITE;
/*!40000 ALTER TABLE `sliated_nalp_merpno` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliated_nalp_merpno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_auth_config`
--

DROP TABLE IF EXISTS `sso_auth_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_auth_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_id` varchar(45) NOT NULL,
  `sso_name` varchar(150) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `email_id` varchar(150) DEFAULT NULL,
  `sso_type` int DEFAULT NULL COMMENT '1- SAML type\n2- OAuth type',
  `has_meta_file` varchar(20) DEFAULT NULL,
  `meta_file_data` longtext,
  `mf_attributes_list` longtext,
  `s_entity_id` varchar(100) DEFAULT NULL,
  `s_login_sso_url` varchar(200) DEFAULT NULL,
  `s_certificate_file_content` longtext,
  `s_binding_type` varchar(100) DEFAULT NULL,
  `s_auth_signed_request` tinyint DEFAULT '0' COMMENT 'Boolean value true/false',
  `domain_url` text,
  `status` int DEFAULT '0' COMMENT '0- draft\n1- activate\n2 - deactivate\n3 - deleted',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `saml_jit_access` tinyint DEFAULT '0',
  `saml_scim_access` text,
  `saml_scim_auth_token` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_auth_config`
--

LOCK TABLES `sso_auth_config` WRITE;
/*!40000 ALTER TABLE `sso_auth_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_auth_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_ai_keys`
--

DROP TABLE IF EXISTS `studio_ai_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_ai_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `key` longtext NOT NULL,
  `channel_id` int NOT NULL,
  `is_default` int NOT NULL DEFAULT '0',
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_ai_keys`
--

LOCK TABLES `studio_ai_keys` WRITE;
/*!40000 ALTER TABLE `studio_ai_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio_ai_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_controls`
--

DROP TABLE IF EXISTS `studio_controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_controls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `g_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int DEFAULT NULL,
  `current_version` varchar(12) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `is_deprecated` int DEFAULT '0',
  `is_from_designer` int DEFAULT '0',
  `is_on_marketplace` int DEFAULT '0',
  `dependencyJSON` longtext,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `release_note` mediumtext,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `GroupID` (`g_id`),
  CONSTRAINT `GroupID` FOREIGN KEY (`g_id`) REFERENCES `formbuilder_controls_group` (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_controls`
--

LOCK TABLES `studio_controls` WRITE;
/*!40000 ALTER TABLE `studio_controls` DISABLE KEYS */;
INSERT INTO `studio_controls` VALUES (1,5,'address',1,'0.2.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 07:30:12','New Feature : Integration for Themes.'),(2,3,'geofencing',1,'0.1.4','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"leaflet JS\",\r\n    \"esri-leaflet JS\",\r\n    \"esri-leaflet-geocoder JS\",\r\n    \"Leaflet CSS\",\r\n    \"esri-leaflet-geocoder CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(3,2,'multi_image',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:47:52','Enhancement : responsive width configuration for desktops'),(4,22,'text',1,'0.4.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-22 05:12:55','Bug Fix : an edge case when control is disabled via rules.'),(5,22,'dateandtimepicker',1,'0.3.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 14:04:42','Enhancement: responsive width configuration for desktops'),(6,11,'list2',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(7,6,'dropdown_multiselect',1,'0.2.3','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(8,6,'advance_multiselect',1,'0.2.0','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(9,6,'advance_dropdown',1,'0.1.4','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(10,4,'email',1,'0.0.6','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(11,4,'number',1,'0.1.6','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(12,5,'quantity',1,'0.2.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-04-25 10:13:21','Enhancement : Support for content alignment added when label position is left.'),(13,6,'radio',1,'0.3.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-10 12:28:01','Bug Fix: unable to write on others option issue fixed'),(14,13,'Wildcard_Product',1,'0.1.1','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(15,8,'dual_text',1,'0.1.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-05-24 15:15:12','New Feature : Integration for Themes.'),(16,6,'multi_select_bar',1,'0.0.6','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(17,14,'column_graph',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(18,9,'navigation_menu',1,'0.0.4','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(19,4,'input_label',1,'0.2.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-04-25 10:03:45','Enhancement : Support for content alignment added when label position is left.'),(20,11,'tabular_wildcard_list',1,'0.6.0','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(21,6,'checkboxes',1,'0.3.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-10 12:26:59','Bug Fix: unable to type on others option issue fixed'),(22,11,'master_lookup_dropdown',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(23,13,'list_selectable_4',1,'0.1.1','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(24,14,'area_chart',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(25,14,'line_chart',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(26,22,'Button1',1,'0.4.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-26 11:05:32','Enhancement: set the default name to \'Button\' and set default icon visibility'),(27,22,'Paragraph',1,'0.2.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-08-05 07:23:29','Enhancement : Minor changes for default line height.'),(28,14,'doughnut',1,'0.0.6','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(29,14,'bar_chart',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(30,8,'Separator',1,'0.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-04-17 10:32:28','Enhancement : min-height updated.'),(31,9,'Navigation_button',1,'0.1.0','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(32,22,'textarea',1,'0.3.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-26 12:12:54','Bug Fix: minor bug fix'),(33,1,'submit_button',1,'0.3.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:44:31','Enhancement: default grid configuration changes'),(34,8,'Header',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:42:58','New Feature : Integration for Themes.'),(35,4,'Toggle_Button',1,'0.2.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-18 09:51:00','Bug Fix: minor bug fix'),(36,8,'TitleSubtitle',1,'0.1.3','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(37,14,'PieChart',1,'0.0.7','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ApexChartsJS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(38,2,'Image_Box',1,'0.4.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"PanZoom js\",\r\n    \"ImageCacge JS\",\r\n    \"ImageCacge IndexDB JS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-25 11:38:55','Enhancement: image_click action added'),(39,10,'temperature',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(40,10,'liters',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(41,11,'search',1,'0.0.5','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(42,10,'volume',1,'0.1.0','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(43,5,'keywordBox',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:24:03','New Feature : Integration for Themes.'),(44,10,'speed',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(45,6,'toggle_text',1,'0.1.0','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(46,10,'bytes',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(47,10,'area',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(48,10,'distance',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(49,6,'dropdown',1,'0.1.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(50,6,'select_bar',1,'0.1.3','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(51,22,'image_upload',1,'0.9.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"mime_type_to_file_ext\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-05 12:50:41','Bug fix: minor ui fix in property section'),(52,10,'weight',1,'0.1.0','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(53,3,'GPS',1,'0.2.7','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"leaflet JS\",\r\n    \"esri-leaflet JS\",\r\n    \"esri-leaflet-geocoder JS\",\r\n    \"Leaflet CSS\",\r\n    \"esri-leaflet-geocoder CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(54,10,'timepicker',1,'0.3.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-09 13:04:16','Bug Fix: trigger action on clear option'),(55,3,'signature_pad',1,'0.3.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Signature Pad JS\",\r\n    \"mime_type_to_file_ext\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:38:59','Enhancement : responsive width configuration for desktops'),(56,10,'datepicker',1,'0.3.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 11:59:27','Enhancement : responsive width configuration for desktops and user-friendly defaults.'),(57,13,'Carousal_1',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(58,4,'url',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(59,13,'Carousal_2',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(60,5,'phone',1,'0.3.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-01 07:27:35','Bug Fix : Ui issue in package.'),(61,5,'name',1,'0.2.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 14:11:12','New Feature : Integration for Themes.'),(62,13,'list_selectable_2',1,'0.1.4','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(63,5,'decimal',1,'0.0.8','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(64,5,'currency',1,'0.2.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:01:42','Enhancement : responsive width configuration for desktops'),(65,13,'carousal_3',1,'0.1.0','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(66,8,'spacer',1,'0.1.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:03:10','Enhancement : responsive width configuration for desktops'),(67,13,'wildCard_list',1,'0.8.1','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\"\r\n  ]\r\n}','2022-05-16 08:57:40',NULL),(68,5,'percent',1,'0.0.9','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(69,5,'master_dummy',1,'0.2.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:54:01','New Feature : Integration for Themes.'),(70,13,'carousal_one',1,'0.0.1','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(71,13,'section_repeat',1,'0.5.0','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-05-28 07:23:29','Bug Fix: minor bug fix'),(75,9,'menubar',1,'0.1.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:05:16','Enhancement : responsive width configuration for desktops'),(76,9,'menu_list',1,'0.1.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-18 10:46:22','Enhancement: default width of control size is reduced'),(77,5,'value_picker',1,'0.2.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-03-20 12:46:03','Enhancement : changes related to themes.'),(89,22,'panel',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:25:19','New Feature : Integration for Themes.'),(96,4,'rating',1,'0.1.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 11:58:50','Enhancement : responsive width configuration for desktops'),(97,11,'timer',1,'0.0.1','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(98,11,'dhq_ocr',1,'0.0.5','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(99,11,'dhq_calendar',1,'0.0.6','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(100,5,'dummyJson',1,'0.0.5','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": []\r\n}','2022-05-16 08:57:40',NULL),(102,9,'grid_menu',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:06:49','Enhancement : responsive width configuration for desktops'),(130,4,'dhq_password',1,'0.0.1','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(135,2,'dhq_captureBiometric',1,'0.0.1','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(136,2,'dhq_validatebiometric',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(143,11,'dhq_markup',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:48:21','Enhancement: responsive width configuration for desktops'),(151,3,'DHQ_location',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:26:28','New Feature : Integration for Themes.'),(152,6,'dhq_colored_selectbar',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(153,4,'numeric',1,'0.4.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-08 11:50:18','Bug Fix: minor bug fix in data section when value is 0'),(193,5,'dhq_prefix_suffix',1,'0.0.4','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(194,5,'dhq_prefix_suffix_number',1,'0.0.4','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(195,2,'dhq_video_player',1,'0.2.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"DPlayer JS\",\r\n    \"hls JS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:46:29','Enhancement : responsive width configuration for desktops'),(196,2,'dhq_thermalsingleline',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(197,2,'dhq_tehermal_leftright',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(198,2,'dhq_thermal_printer',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,NULL,'2022-05-16 08:57:40',NULL),(211,4,'dhq_richtext',1,'0.2.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"SunEditor JS\",\r\n    \"SunEditor CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:36:12','Enhancement : responsive width configuration for desktops'),(212,22,'list',1,'5.9.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"leaflet JS\",\r\n    \"esri-leaflet JS\",\r\n    \"esri-leaflet-geocoder JS\",\r\n    \"Leaflet CSS\",\r\n    \"esri-leaflet-geocoder CSS\",\r\n    \"xlsx JS\",\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\",\r\n    \"jquery.json-viewer\",\r\n    \"jquery.json-viewer CSS\",\r\n    \"Codemirror Codemirror Js\",\r\n    \"Codemirror Closebrackets Js\",\r\n    \"Codemirror Jsonlint Js\",\r\n    \"Codemirror Lint Js\",\r\n    \"Codemirror Matchbrackets Js\",\r\n    \"Codemirror Brace-Fold Js\",\r\n    \"Codemirror Foldcode Js\",\r\n    \"Codemirror Foldgutter Js\",\r\n    \"Codemirror CSS\",\r\n    \"Codemirror Lint CSS\",\r\n    \"Codemirror Foldgutter CSS\",\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-29 10:22:53','Enhancement : new properties output add as isEditing.'),(226,13,'list_repeat',1,'0.5.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"lightslider\",\r\n    \"lightslider CSS\",\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-05-28 12:33:03','Bug Fix: Minor bug fix'),(231,22,'tray',1,'1.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"PanZoom js\",\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-12 05:54:47','Bug Fix : Minor Bug Fix for properties output.'),(233,8,'dhq_richtext_viewer',1,'0.2.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"SunEditor JS\",\r\n    \"SunEditor CSS\"\r\n  ]\r\n}','2022-09-16 13:45:52','css changes '),(234,5,'map',1,'0.3.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"leaflet JS\",\r\n    \"esri-leaflet JS\",\r\n    \"esri-leaflet-geocoder JS\",\r\n    \"Leaflet CSS\",\r\n    \"esri-leaflet-geocoder CSS\",\r\n    \"Leaflet Draw css\",\r\n    \"Leaflet Draw js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:37:35','Enhancement : responsive width configuration for desktops and user-friendly defaults.'),(235,8,'dhq_smart_label',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-30 07:09:23','Bug Fix: minor bug fix'),(237,2,'Image_slider',1,'0.1.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"lightslider\",\r\n    \"lightslider CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:40:32','Enhancement : responsive width configuration for desktops'),(238,6,'dhq_select_bar',1,'0.2.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-18 07:34:54','Bug Fix: background color not getting removed from unselected option issue fixed'),(239,22,'dhq_dropdown',1,'1.6.2','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-10 10:47:13','Deprecated: this has been deprecated'),(240,5,'prefixandsuffix',1,'0.3.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-18 07:38:03','Bug fix: minor ui fix'),(315,13,'dhq_form_json',1,'0.3.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-05-28 12:33:53','Bug Fix: Minor bug fix'),(391,2,'dhq_lottie_player',1,'0.1.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"lottie player JS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-03-20 11:20:22','Enhancement : changes related to themes.'),(697,5,'dhq_controlsdata',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,NULL,'2024-04-03 08:54:47','Bug Fix: Minor Bug Fix.'),(1007,18,'layout',1,'0.1.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 07:21:42','New Feature : Integration for Themes.'),(1008,18,'row',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:26:40','New Feature : Integration for Themes.'),(1009,18,'column',1,'0.1.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:25:58','New Feature : Integration for Themes.'),(1110,6,'dhq_tabs',1,'0.1.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:25:38','Enhancement: responsive width configuration for desktops'),(1111,6,'dhq_buttonbar',1,'0.0.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:28:47','New Feature : Integration for Themes.'),(1182,11,'dhq_breadcrumb',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 07:25:34','New Feature : Integration for Themes.'),(1183,11,'dhq_hrbreadcrumb',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 07:25:59','New Feature : Integration for Themes.'),(1206,5,'dhq_recapcha',1,'0.1.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:34:12','New Feature : Integration for Themes.'),(1349,11,'dhq_embed_pdf',1,'0.2.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:27:40','Enhancement: responsive width configuration for desktops'),(1350,11,'dhq_doc_viewer',1,'0.1.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 07:23:59','New Feature : Integration for Themes.'),(1363,6,'dhq_image_radio_btn',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"PanZoom js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:17:56','Enhancement: default grid configuration changes'),(1390,22,'dhq_grouped_menu',1,'0.1.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-18 10:43:56','Enhancement: default width of control size is reduced'),(1408,6,'dhq_radio_btn',1,'0.0.2','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": []\r\n}','2022-05-16 08:57:40',NULL),(1422,5,'dhq_stripe_payment',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:50:56','Enhancement : responsive width configuration for desktops'),(1436,22,'dhq_select_button',1,'0.2.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-04-25 09:55:50','Enhancement : Support for content alignment added when label position is left.'),(1438,5,'scan_barcode',1,'0.1.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 12:32:58','Enhancement : responsive width configuration for desktops'),(1439,6,'dhq_terms_condition',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-08 11:13:10','Bug Fix: minor bug fix'),(1447,6,'dhq_questionnaire',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": []\r\n}','2024-01-20 06:54:05','Enhancement : optimization and support for localization'),(1970,5,'dhq_OTP',1,'0.1.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 13:14:53','New Feature : Integration for Themes.'),(1973,6,'dhq_detailselect_button',1,'0.2.2','ramanujdemo@dronamobile.com',0,1,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-10 10:53:35','Deprecated: this control has been deprecated'),(2048,8,'dhq_progress_bar',1,'0.0.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:12:27','Enhancement : responsive width configuration for desktops'),(2049,8,'dhq_circular_progress_bar',1,'0.0.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:13:39','Enhancement : responsive width configuration for desktops'),(2050,8,'dhq_tagged_content',1,'0.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:59:38','Enhancement: responsive width configuration for desktops'),(2051,8,'dhq_tagged_images',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:32:10','New Feature : Integration for Themes.'),(2052,6,'dhq_range_picker',1,'0.1.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"noUIslider \",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-08-22 09:29:09','Bug Fix: minor bug fix'),(2053,14,'dhq_sparkline',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"sparkline Js\",\r\n    \"temp dependency\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 07:27:08','New Feature : Integration for Themes.'),(2054,6,'dhq_img_select_bar',1,'0.0.9','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:18:20','Enhancement: default grid configuration changes'),(2073,22,'dhq_dashboard',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:39:55','Enhancement: default grid configuration changes'),(2101,21,'dhq_card_grid',1,'1.9.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"clusterize JS\",\r\n    \"clusterize CSS\",\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:12:24','Enhancement: default grid configuration changes'),(2127,5,'back_next',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,1,0,'{\r\n  \"localDependencies\": []\r\n}','2022-05-16 08:57:40',NULL),(2138,1,'SampleButton31',1,'0.0.1','ramanujdemo@dronamobile.com',0,0,1,0,NULL,'2022-05-16 08:57:40',NULL),(2162,9,'dhq_Image_menu_grid',1,'0.0.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"PanZoom js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:57:47','Enhancement: responsive width configuration for desktops'),(2227,19,'dhq_listcard1',1,'0.0.1','ramanujdemo@dronamobile.com',0,0,1,1,'{\r\n  \"localDependencies\": []\r\n}','2022-05-16 08:57:40',NULL),(2228,19,'dhq_listcard2',1,'0.0.1','ramanujdemo@dronamobile.com',0,0,1,1,'{\r\n  \"localDependencies\": []\r\n}','2022-05-16 08:57:40',NULL),(2330,5,'dhq_query_builder',1,'0.2.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:42:11','Enhancement: default grid configuration changes'),(2369,8,'dhq_link',1,'0.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:29:57','Enhancement: responsive width configuration for desktops'),(2370,14,'dhq_graphs',1,'0.3.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Plotly Js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-03 15:46:37','bug fixed: layout can now be configured with dynamic values.'),(2377,10,'dhq_stopwatch',1,'0.0.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:52:49','Enhancement: responsive width configuration for desktops'),(2388,8,'dhq_json_viewer',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Codemirror Codemirror Js\",\r\n    \"Codemirror Autorefresh Js\",\r\n    \"Codemirror Closebrackets Js\",\r\n    \"Codemirror Javascript Js\",\r\n    \"Codemirror Json-Lint Js\",\r\n    \"Codemirror Jsonlint Js\",\r\n    \"Codemirror Lint Js\",\r\n    \"Codemirror Matchbrackets Js\",\r\n    \"Codemirror Brace-Fold Js\",\r\n    \"Codemirror Foldcode Js\",\r\n    \"Codemirror Foldgutter Js\",\r\n    \"Codemirror CSS\",\r\n    \"Codemirror Lint CSS\",\r\n    \"Codemirror Foldgutter CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-22 13:01:12','Bug Fix: minor ui fix'),(2389,11,'dhq_json_editor',1,'0.1.3','fenil@studio.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Codemirror Codemirror Js\",\r\n    \"Codemirror Autorefresh Js\",\r\n    \"Codemirror Closebrackets Js\",\r\n    \"Codemirror Javascript Js\",\r\n    \"Codemirror Json-Lint Js\",\r\n    \"Codemirror Jsonlint Js\",\r\n    \"Codemirror Lint Js\",\r\n    \"Codemirror Matchbrackets Js\",\r\n    \"Codemirror Brace-Fold Js\",\r\n    \"Codemirror Foldcode Js\",\r\n    \"Codemirror Foldgutter Js\",\r\n    \"Codemirror CSS\",\r\n    \"Codemirror Lint CSS\",\r\n    \"Codemirror Foldgutter CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-22 13:01:36','Bug Fix: minor ui fix'),(2407,19,'dhq_NFCreader',1,'0.0.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:25:46','New Feature : Integration for Themes.'),(2428,22,'grid_panel',1,'0.3.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-08-08 07:33:40','  '),(2529,8,'dhq_alert',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:34:43','Enhancement: responsive width configuration for desktops'),(2540,5,'dhq_pagination',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:35:46','Enhancement: responsive width configuration for desktops'),(2541,8,'dhq_user_details',1,'0.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:51:49','Enhancement: responsive width configuration for desktops'),(2566,5,'dhq_csvupload',1,'0.1.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"papa parser\",\r\n    \"XML to JSON Converter Js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 14:19:34','New Feature : Integration for Themes.'),(2591,5,'dhq_kanban',1,'0.3.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-08 11:34:24','Bug Fix : Minor bug fix for search.'),(2593,5,'dhq_cascader',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-28 10:47:42','Bug Fix : Control not working properly for ios devices.'),(2609,5,'dhq_checkbox_tree',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"checkbox tree\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-24 11:54:37','Enhancement: responsive width configuration for desktops'),(2613,11,'dhq_timeline',1,'0.1.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:38:04','Enhancement: responsive width configuration for desktops'),(2614,11,'dhq_studio_calender',1,'0.1.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"tui calendar css\",\r\n    \"tui calendar-date-picker css\",\r\n    \"tui calendar-time-picker.css css\",\r\n    \"tui-calendar-snippet.min.js\",\r\n    \"tui-calendar-date-picker js\",\r\n    \"tui-calendar-time-picker js\",\r\n    \"tui-calendar js\",\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-09-19 06:44:09','Enhancement : support for new ui of single tag and multi tag added.'),(2649,6,'dhq_switch_group',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-08 11:39:00','Enhancement: added json ui and value key in data bind section '),(2666,8,'dhq_statistics',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:41:47','Enhancement: responsive width configuration for desktops'),(2672,5,'dhq_color_picker',1,'0.0.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"ColorPicker js\",\r\n    \"ColorPicker nano theme\",\r\n    \"ColorPicker monolithic theme\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:39:05','Enhancement: responsive width configuration for desktops'),(2673,5,'dhq_sortable',1,'0.1.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Touch Punch js\",\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-28 13:03:23','Enhancement: default grid configuration changes'),(2679,8,'dhq_metric',1,'0.1.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:27:42','New Feature : Integration for Themes.'),(2745,5,'dhq_ad_map',1,'0.0.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"leaflet JS\",\r\n    \"esri-leaflet JS\",\r\n    \"esri-leaflet-geocoder JS\",\r\n    \"Leaflet CSS\",\r\n    \"esri-leaflet-geocoder CSS\",\r\n    \"Leaflet Draw css\",\r\n    \"Leaflet Draw js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:40:12','Enhancement: responsive width configuration for desktops'),(2757,9,'dhq_collapsible_menu',1,'0.1.8','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-20 16:41:13','Bug Fixed: get Value was returning wrong values.'),(2767,22,'dhq_advance_dropdown',1,'0.2.7','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-21 12:09:08','Bug Fix: minor bug fix'),(2790,1,'dhq_split_button',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-09 11:19:00','Enhacement: Added color, prefix,icon key in data bind ui json'),(2813,19,'Accordion',1,'0.0.2','ramanujdemo@dronamobile.com',0,0,1,0,'{\r\n  \"localDependencies\": []\r\n}','2022-11-01 17:04:11','r'),(2818,9,'dhq_nav_bar',1,'0.1.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-10-18 07:28:31','Bug Fix: options dropdown not opening issue fixed '),(2855,10,'dhq_date_range_picker',1,'0.1.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Date Range Picker js\",\r\n    \"Date Range Picker css\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 11:59:42','Enhancement : responsive width configuration for desktops and user-friendly defaults.'),(2864,4,'dhq_text_suggestion',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Typeahead js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-07 08:35:23','New Feature : Integration for Themes.'),(2898,11,'dhq_breadcrumbs',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 14:06:15','Enhancement: responsive width configuration for desktops'),(2983,19,'dhq_icon',1,'0.0.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:53:55','Enhancement: responsive width configuration for desktops'),(3045,19,'dhq_vertical_divider',1,'0.0.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:22:18','New Feature : Integration for Themes.'),(3046,19,'dhq_markdown_viewer',1,'0.0.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Pagedown js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-11-25 12:22:47','Bug Fix : preview issue fixed'),(3047,19,'dhq_markdown_editor',1,'0.0.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Pagedown js\",\r\n    \"SimpleMDE js\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:35:38','New Feature : Integration for Themes.'),(3093,19,'dhqWidgetGroup',1,'0.0.4','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:21:49','New Feature : Integration for Themes.'),(3151,17,'mkp_0_dhq_card',1,'0.0.1','ramanujdemo@dronamobile.com',0,0,1,0,NULL,'2023-07-17 13:24:36',''),(3206,19,'dhq_tags',1,'0.0.2','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-01-31 06:20:26','New Feature : Integration for Themes.'),(3233,5,'dhq_chat',1,'0.1.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Pagedown js\",\r\n    \"Marked js\",\r\n    \"Prism js\",\r\n    \"Prism CSS\",\r\n    \"Theme css\"\r\n  ]\r\n}','2024-07-09 13:55:30','Enhancement: responsive width configuration for desktops'),(3376,19,'dhq_zebra_barcode_scan',1,'0.0.5','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-05-24 16:12:44','enhancement: zebra barcode is made composite to return barcode data as well as it type'),(3406,19,'dhq_theme_switch',1,'0.0.1','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": [\r\n    \"Theme css\"\r\n  ]\r\n}','2024-02-26 07:37:52','New Control : To switch between light dark theme on single click.'),(3439,19,'dhq_custom_control',1,'0.0.6','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": []\r\n}','2024-07-12 12:03:26','Enhancement: new interface OnReload introduced'),(3447,22,'dhq_tabbed_container',1,'0.2.0','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": []\r\n}','2024-11-25 06:51:18','Bug Fix: minor bug fix'),(3566,6,'dhq_detailselect_btn',1,'0.0.3','ramanujdemo@dronamobile.com',0,0,0,0,'{\r\n  \"localDependencies\": []\r\n}','2024-10-28 13:34:39','Enhancement: default grid configuration changes'),(100000,1,'dummy',0,NULL,NULL,NULL,0,0,0,NULL,'2024-12-02 13:12:00',NULL);
/*!40000 ALTER TABLE `studio_controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_environments`
--

DROP TABLE IF EXISTS `studio_environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_environments` (
  `env_id` int NOT NULL AUTO_INCREMENT,
  `env_name` varchar(45) DEFAULT NULL,
  `channel_id` int NOT NULL,
  `sheet_env` varchar(45) DEFAULT 'prod',
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='studio_environments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_environments`
--

LOCK TABLES `studio_environments` WRITE;
/*!40000 ALTER TABLE `studio_environments` DISABLE KEYS */;
INSERT INTO `studio_environments` VALUES (1,'production',0,'prod'),(2,'staging',0,'beta'),(3,'development',0,'dev');
/*!40000 ALTER TABLE `studio_environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_functions`
--

DROP TABLE IF EXISTS `studio_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_functions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `channel_id` int DEFAULT NULL,
  `current_version` varchar(45) NOT NULL,
  `status` int DEFAULT '0',
  `function_type` int DEFAULT '0',
  `is_promiss` tinyint DEFAULT '1',
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `release_note` mediumtext,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_functions`
--

LOCK TABLES `studio_functions` WRITE;
/*!40000 ALTER TABLE `studio_functions` DISABLE KEYS */;
INSERT INTO `studio_functions` VALUES (1,'INSERTRECORD',1,'0.2.2',1,0,1,'2024-12-02 13:17:32',NULL),(2,'DELETERECORD',1,'0.1.2',1,1,1,'2024-12-02 13:17:32',NULL),(3,'UPDATERECORD',1,'0.2.1',1,1,1,'2024-12-02 13:17:32',NULL),(4,'NAVIGATE',1,'0.1.9',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5,'EXITAPP',1,'0.0.9',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(6,'CALL',1,'0.0.8',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(7,'SMS',1,'0.1.8',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(8,'EMAIL',1,'0.1.1',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(9,'BINDAPI',1,'0.7.1',1,0,1,'2024-12-02 13:17:32','Enhancement : support added for download as a file.'),(10,'CALLAPI',1,'0.0.5',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(11,'SETVALUE',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(12,'ISEMPTY',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(13,'ISNOTEMPTY',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(14,'MERGE',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(15,'DATESTR',1,'0.1.1',1,0,1,'2024-12-02 13:17:32',NULL),(16,'TIMESTR',1,'0.0.6',1,0,1,'2024-12-02 13:17:32',NULL),(17,'LOOKUP',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(18,'GETTABLESCHEMA',1,'0.0.3',1,0,1,'2024-12-02 13:17:32',NULL),(19,'MILITOTIME',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(30,'DATEDIF',1,'0.0.3',1,0,1,'2024-12-02 13:17:32',NULL),(31,'TIMEDIF',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(296,'INDEX',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(297,'UNIQUEOBJECTS',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(391,'NUMBER',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(392,'STRING',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(393,'EXCELTIME',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(394,'UNIXTIME',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(397,'SELECT',1,'0.0.4',1,0,1,'2024-12-02 13:17:32',NULL),(398,'SELECTANY',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(399,'RANGE',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','Enhancement: helper utility feature added'),(407,'INDEXVALUE',1,'0.0.4',1,0,1,'2024-12-02 13:17:32',NULL),(443,'DISTANCE',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(446,'ISPLACENEARBY',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(447,'PLACESNEARBY',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(628,'QUERYSTRING',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(665,'UNIQUEIDGENERATOR',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(928,'MAPKEYS',1,'0.1.2',1,0,1,'2024-12-02 13:17:32',NULL),(993,'DATETIMETODATE',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(1197,'LEFTJOIN',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(1198,'RIGHTJOIN',1,'0.0.3',1,0,1,'2024-12-02 13:17:32',NULL),(1199,'FULLJOIN',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(1202,'INNERJOIN',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(1291,'DLOOKUP',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(1292,'DAND',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(1293,'DOR',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(1903,'STRTODATE',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(1904,'STRTOUNIX',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(2040,'BINDAPIPRESELECT',1,'0.2.5',1,0,1,'2024-12-02 13:17:32','Handle currentEnvironment For automation'),(2125,'ParseWorldStats',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(2189,'OPENURL',1,'0.1.2',1,0,1,'2024-12-02 13:17:32','Enhancement : Functionality related to utility added.'),(2351,'SocialShare',1,'0.0.2',1,1,1,'2024-12-02 13:17:32',NULL),(2473,'ShareViaWhatsApp',1,'0.0.4',1,1,1,'2024-12-02 13:17:32',NULL),(2635,'TIMEOFFSET',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(2818,'LOGOUT',1,'0.0.8',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(2919,'CALLWORKFLOW',1,'0.0.7',1,0,1,'2024-12-02 13:17:32',NULL),(2920,'CONFIRM',1,'0.1.4',1,0,1,'2024-12-02 13:17:32','Bug Fix : stopped closing of confirm box when clicked outside.'),(2921,'DELAY',1,'0.0.7',1,0,1,'2024-12-02 13:17:32',NULL),(2922,'VALIDATEPAGES',1,'0.0.9',1,0,1,'2024-12-02 13:17:32','Bug Fix : When screen id is changed , validation was working as expected.'),(2923,'RESETPAGES',1,'0.1.1',1,0,1,'2024-12-02 13:17:32','reset pages supporting comma seperated value'),(4905,'GETCURRENTLOCATION',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(4978,'SETTOKV',1,'0.0.1',1,1,1,'2024-12-02 13:17:32',NULL),(4979,'GETFROMKV',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(4980,'DELETEFROMKV',1,'0.0.1',1,1,1,'2024-12-02 13:17:32',NULL),(4981,'CLEARKV',1,'0.0.1',1,1,1,'2024-12-02 13:17:32',NULL),(5104,'SETVARIABLE',1,'0.1.5',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(5137,'VARIABLES',1,'0.1.6',1,0,1,'2024-12-02 13:17:32','Deprecated : This action is now deprecated for cloud , soon will be deprecated for on-prem as well.'),(5139,'CALLSERVICE',1,'0.3.8',1,0,1,'2024-12-02 13:17:32','Added support for downoad file action in Multistep auth refresh flow'),(5140,'UPDATESHEETACTION',1,'0.0.3',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(5141,'VARIABLE',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(5144,'SHOWPAGELOADER',1,'0.0.3',1,0,1,'2024-12-02 13:17:32',NULL),(5145,'HIDEPAGELOADER',1,'0.0.4',1,0,1,'2024-12-02 13:17:32',NULL),(5146,'SHOWCTRL',1,'0.0.8',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5147,'HIDECTRL',1,'0.0.9',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5150,'EXTRACTFIELDSFORGOOGLESHEETS',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5154,'ALERT',1,'0.2.1',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(5155,'TOAST',1,'0.2.6',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(5161,'SHOWDYNAMICPRESELECTFORCHANNEL',1,'0.0.2',1,0,1,'2024-12-02 13:17:32',NULL),(5162,'SHOWDYNAMICPRESELECTFORPDFTEMPLATES',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','Pdf url path added for Automation'),(5163,'SHOWDYNAMICPRESELECTFORPDFFIELDS',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5164,'EXTRACTFIELDSFORAIRTABLE',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5165,'CHANGESTATE',1,'0.0.8',1,0,1,'2024-12-02 13:17:32',NULL),(5166,'SETCTRLVALUE',1,'0.2.6',1,0,1,'2024-12-02 13:17:32','Enhancement: handling added for list type control'),(5172,'WORKFLOWCONNECTOR',1,'0.1.5',1,0,1,'2024-12-02 13:17:32','origin added'),(5174,'EXTRACTDYNAMICFIELDSFORSENDGRID',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5175,'EXTRACTFIELDSFORSENDGRID',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5180,'GETDATAFROMSHEET',1,'0.1.2',1,0,1,'2024-12-02 13:17:32','Offline submission is not supported'),(5187,'microappNav',1,'0.1.5',1,0,1,'2024-12-02 13:17:32','Enhancement : Functionality related to utility added.'),(5192,'REFRESHCTRLDATA',1,'0.1.2',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5195,'FILTER',1,'0.0.4',1,0,1,'2024-12-02 13:17:32',NULL),(5200,'GETKEYVALUE',1,'0.0.8',1,0,1,'2024-12-02 13:17:32',NULL),(5209,'STRINGTOJSON',1,'0.0.3',1,0,1,'2024-12-02 13:17:32',NULL),(5211,'MERGEJSON',1,'0.0.4',1,0,1,'2024-12-02 13:17:32',NULL),(5215,'INSTALLMICROAPPS',1,'0.0.5',1,0,1,'2024-12-02 13:17:32',NULL),(5217,'FOCUSCONTROL',1,'0.0.6',1,0,1,'2024-12-02 13:17:32','Bug Fix: added  dropdown focusable on this action'),(5218,'DETECTENTERPRESS',1,'0.0.5',1,0,1,'2024-12-02 13:17:32',NULL),(5223,'WHATSAPPMSG',1,'0.0.7',1,0,1,'2024-12-02 13:17:32','field_type updated'),(5224,'COPYTOCLIPBOARD',1,'0.0.9',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5225,'ADDTOCALENDAR',1,'0.0.7',1,0,1,'2024-12-02 13:17:32','field_type updated'),(5226,'OPENDOCINPREVIEW',1,'0.0.6',1,0,1,'2024-12-02 13:17:32','Correction : spelling correction.'),(5227,'DOWNLOADFILE',1,'0.0.7',1,0,1,'2024-12-02 13:17:32','Enhancement : URL to download field now supports dynamic values.'),(5249,'Message',1,'0.0.6',1,0,0,'2024-12-02 13:17:32','Deprecated : This action is now deprecated for cloud , soon will be deprecated for on-prem as well.'),(5252,'SHOWDETAILS',1,'0.0.1',1,0,0,'2024-12-02 13:17:32',NULL),(5266,'OPENIMAGEINPREVIEW',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Correction : spelling correction.'),(5296,'ARRAYTOCSV',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Enhancement: helper utility feature added'),(5304,'ESCAPEDOUBLEQUOTE',1,'0.0.3',1,0,0,'2024-12-02 13:17:32',NULL),(5305,'CLOSEOVERLAYITEM',1,'0.0.1',1,0,0,'2024-12-02 13:17:32',NULL),(5306,'ESCAPESINGLEQUOTE',1,'0.0.2',1,0,0,'2024-12-02 13:17:32',NULL),(5309,'REDIRECTPARENTWINDOW',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','field_type updated \"singleLine_js\"'),(5324,'STRINGENCODE',1,'0.0.1',1,0,0,'2024-12-02 13:17:32',NULL),(5325,'WHATSAPPTEXT',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','field_type updated \"singleLine_js\"'),(5330,'CONFETTI',1,'0.0.4',1,0,0,'2024-12-02 13:17:32','Enhancement : Functionality related to utility added.'),(5387,'URLTOBASE64',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5398,'JSCODE',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','fu reference given in variable'),(5415,'CUSTOMJS',1,'0.0.7',1,0,1,'2024-12-02 13:17:32','Bug Fix : check for options key fixed.'),(5418,'DATABUILDER',1,'0.1.7',1,0,1,'2024-12-02 13:17:32','Code updated for live evolution output show'),(5458,'SETDATAENV',1,'0.0.4',1,0,0,'2024-12-02 13:17:32','Offline submission is not supported'),(5466,'JSONtoGraphQLMutation',1,'0.0.1',1,0,1,'2024-12-02 13:17:32',NULL),(5494,'FILEPARSER',1,'0.0.3',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5500,'ITERATETASKS',1,'0.1.3',1,0,0,'2024-12-02 13:17:32','Enhancement : Iterate tasks will now be executed sequentially.'),(5512,'invokeAction',1,'0.0.5',1,0,0,'2024-12-02 13:17:32','Enhancement : Functionality related to utility added.'),(5514,'NAVIGATETOAUTHSCREEN',1,'0.0.6',1,0,1,'2024-12-02 13:17:32','Enhancement: utility feature added'),(5516,'WRITENFCTAG',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5527,'ENDBRANCH',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5528,'ENDACTIONFLOW',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5531,'SETROUTINGURL',1,'0.0.1',1,1,0,'2024-12-02 13:17:32','New action related to routing '),(5533,'FILTEROBJECTS',1,'0.0.8',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5534,'QUERYJSONSQL',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5544,'REFRESHVARIABLEDATA',1,'0.0.4',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5548,'CHANGELANGUAGE',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Enhancement : action renamed and pushed to proper group.'),(5555,'CREATEANDDOWNLOADFILE',1,'0.0.4',1,0,0,'2024-12-02 13:17:32','createanddownloadfilefalse'),(5557,'EXTRACTFIELDSFORXANO',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','updated function'),(5562,'BINDAPIPRESELECTAIRTABLE',1,'0.0.3',1,0,1,'2024-12-02 13:17:32','stringified response handling'),(5563,'EXTRACTFIELDSFORAIRTABLE2',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','id and label both will return name of airtable column'),(5571,'SHOWCTRLLOADER',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Minor Fix in group name.'),(5572,'HIDECTRLLOADER',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Minor Fix in group name.'),(5573,'VARIABLEAPI',1,'0.1.0',1,0,0,'2024-12-02 13:17:32','Enhancement : support added for download as a file.'),(5582,'TRIGGERDATAQUERY',1,'0.0.6',1,0,1,'2024-12-02 13:17:32','Bug fixed: parameters passed were not getting replaced'),(5583,'SETTHEME',1,'0.0.1',1,0,0,'2024-12-02 13:17:32','New Action : for setting the default themes via action flow.'),(5584,'SHOWDYNAMICPRESELECTFORPDFTEMPLATESONPREM',1,'0.0.4',1,0,1,'2024-12-02 13:17:32','Made cloud compatible'),(5585,'SHOWDYNAMICPRESELECTFORPDFFIELDSONPREM',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','template id args issue fixed'),(5587,'PLAYSOUND',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','New Action: New Action added with utility feature '),(5588,'CALLRESTAPI',1,'0.0.1',1,0,1,'2024-12-02 13:17:32','New Action: New action added with utility feature'),(5589,'DOWNLOADFILEAS',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','small fix'),(5590,'TRANSFORMDATATOARRAY',1,'0.0.1',1,0,0,'2024-12-02 13:17:32','New Action: New action added with utility feature'),(5591,'TRANSFORMDATATOOBJECT',1,'0.0.3',1,0,0,'2024-12-02 13:17:32','Bug Fix: minor bug fix'),(5592,'INTERCHANGE',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','Bug fix: minor bug fix'),(5593,'MERGEARRAYS',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','Bug fix: minor bug fix'),(5594,'CONCAT',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','Bug fix: minor bug fix'),(5595,'FLATTENED',1,'0.0.2',1,0,0,'2024-12-02 13:17:32','Bug fix: minor bug fix'),(5605,'CLEARMULTISTEPAUTHCREDS',1,'0.0.1',1,0,1,'2024-12-02 13:17:32','New Action \"Clear multistep auth credentials\"'),(5611,'SETLOCALSTORAGE',1,'0.0.1',1,1,1,'2024-12-02 13:17:32','New Action : To store data to local storage.'),(5612,'GETLOCALSTORAGE',1,'0.0.2',1,0,1,'2024-12-02 13:17:32','New Action : To get data from local storage.'),(5613,'CLEARLOCALSTORAGE',1,'0.0.1',1,1,1,'2024-12-02 13:17:32','New Action : To clear data from local storage.'),(100000,'dummy',1,'',0,0,1,'2024-12-02 13:17:28',NULL);
/*!40000 ALTER TABLE `studio_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_gateway_key`
--

DROP TABLE IF EXISTS `studio_gateway_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_gateway_key` (
  `name` varchar(45) NOT NULL,
  `channel_id` int DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `keys` longtext,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_gateway_key`
--

LOCK TABLES `studio_gateway_key` WRITE;
/*!40000 ALTER TABLE `studio_gateway_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio_gateway_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_template_groups`
--

DROP TABLE IF EXISTS `studio_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_template_groups` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_name` varchar(200) DEFAULT NULL,
  `g_order` int DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_template_groups`
--

LOCK TABLES `studio_template_groups` WRITE;
/*!40000 ALTER TABLE `studio_template_groups` DISABLE KEYS */;
INSERT INTO `studio_template_groups` VALUES (1,'Dashboards',0),(2,'Admin panels',1),(3,'Mobile apps',2),(4,'',3),(5,'',4),(6,'',5),(7,'',6),(8,'',7),(9,'',8),(10,'',9),(11,'',10),(12,'',11),(13,'',12),(14,'',13),(15,'',14),(16,'',15),(17,'',16),(18,'',17),(19,'Forms',18),(20,'Public apps',19),(21,'Process apps',20),(22,'Internal apps',21);
/*!40000 ALTER TABLE `studio_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_template_keys`
--

DROP TABLE IF EXISTS `studio_template_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_template_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key_code` varchar(13) NOT NULL,
  `template_id` int NOT NULL,
  `is_expired` int NOT NULL,
  `for_plugin` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`key_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_template_keys`
--

LOCK TABLES `studio_template_keys` WRITE;
/*!40000 ALTER TABLE `studio_template_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio_template_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_templates`
--

DROP TABLE IF EXISTS `studio_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `plugin_id` int DEFAULT NULL,
  `is_premium` int DEFAULT '0',
  `is_showcase` int DEFAULT '0',
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id` (`id`,`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_templates`
--

LOCK TABLES `studio_templates` WRITE;
/*!40000 ALTER TABLE `studio_templates` DISABLE KEYS */;
INSERT INTO `studio_templates` VALUES (304,1,'ramanujdemo@dronamobile.com',0,0,0,1),(317,1,'ramanujdemo@dronamobile.com',0,0,0,1),(318,1,'ramanujdemo@dronamobile.com',0,0,0,1),(319,1,'ramanujdemo@dronamobile.com',0,0,0,1),(320,1,'ramanujdemo@dronamobile.com',0,0,0,1),(321,1,'ramanujdemo@dronamobile.com',0,0,0,1),(322,1,'ramanujdemo@dronamobile.com',0,0,0,1),(323,1,'ramanujdemo@dronamobile.com',0,0,0,1),(324,1,'ramanujdemo@dronamobile.com',0,0,0,1),(325,1,'ramanujdemo@dronamobile.com',0,0,0,1),(328,1,'ramanujdemo@dronamobile.com',0,0,0,1),(330,1,'ramanujdemo@dronamobile.com',0,0,0,1),(332,1,'ramanujdemo@dronamobile.com',0,0,0,1),(333,1,'ramanujdemo@dronamobile.com',0,0,0,1),(334,1,'ramanujdemo@dronamobile.com',0,0,0,1),(336,1,'ramanujdemo@dronamobile.com',0,0,0,1),(341,1,'ramanujdemo@dronamobile.com',0,0,0,1),(351,1,'ramanujdemo@dronamobile.com',0,0,0,1),(354,1,'ramanujdemo@dronamobile.com',0,0,0,1),(355,1,'ramanujdemo@dronamobile.com',0,0,0,1),(357,1,'ramanujdemo@dronamobile.com',0,0,0,1),(359,1,'ramanujdemo@dronamobile.com',0,0,0,1),(381,1,'ramanujdemo@dronamobile.com',0,0,0,1),(100000,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `studio_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_auth_token`
--

DROP TABLE IF EXISTS `temp_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_auth_token` (
  `token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `token_data` text NOT NULL,
  `token_create_date` datetime NOT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporarily store auth tokens fom providers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_auth_token`
--

LOCK TABLES `temp_auth_token` WRITE;
/*!40000 ALTER TABLE `temp_auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textaccessed`
--

DROP TABLE IF EXISTS `textaccessed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `textaccessed` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `accessedtime` datetime NOT NULL,
  `timespent` int unsigned NOT NULL DEFAULT '1',
  KEY `FK_textaccessed_1` (`uid`),
  KEY `FK_textaccessed_2` (`cid`),
  CONSTRAINT `FK_textaccessed_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_textaccessed_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textaccessed`
--

LOCK TABLES `textaccessed` WRITE;
/*!40000 ALTER TABLE `textaccessed` DISABLE KEYS */;
/*!40000 ALTER TABLE `textaccessed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textaccessedhistory`
--

DROP TABLE IF EXISTS `textaccessedhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `textaccessedhistory` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `accessedtime` datetime NOT NULL,
  `timespent` int unsigned NOT NULL DEFAULT '1',
  KEY `FK_textaccessedhistory_1` (`uid`),
  KEY `FK_textaccessedhistory_2` (`cid`),
  CONSTRAINT `FK_textaccessedhistory_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_textaccessedhistory_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textaccessedhistory`
--

LOCK TABLES `textaccessedhistory` WRITE;
/*!40000 ALTER TABLE `textaccessedhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `textaccessedhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_configuration`
--

DROP TABLE IF EXISTS `theme_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_configuration` (
  `name` text NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `attributes` text NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` text NOT NULL,
  `channel_id` int NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_dark` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_configuration`
--

LOCK TABLES `theme_configuration` WRITE;
/*!40000 ALTER TABLE `theme_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `UTCzone` varchar(100) NOT NULL,
  `UTCdiff` text NOT NULL,
  PRIMARY KEY (`UTCzone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uidgid`
--

DROP TABLE IF EXISTS `uidgid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uidgid` (
  `uid` int unsigned NOT NULL COMMENT 'user id',
  `gid` int unsigned NOT NULL COMMENT 'group id',
  KEY `FK_uidgid_2` (`gid`),
  KEY `FK_uidgid_1` (`uid`),
  CONSTRAINT `FK_uidgid_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_uidgid_2` FOREIGN KEY (`gid`) REFERENCES `usergroup` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='user group. 1 user - 1 group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uidgid`
--

LOCK TABLES `uidgid` WRITE;
/*!40000 ALTER TABLE `uidgid` DISABLE KEYS */;
INSERT INTO `uidgid` VALUES (1,1);
/*!40000 ALTER TABLE `uidgid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_app_lauch_activity`
--

DROP TABLE IF EXISTS `user_app_lauch_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_lauch_activity` (
  `uid` int unsigned NOT NULL,
  `login_on` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  KEY `FK_user_app_lauch_activity_2` (`uid`),
  KEY `FK_user_app_lauch_activity_1` (`channelid`),
  CONSTRAINT `FK_user_app_lauch_activity_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_app_lauch_activity_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_app_lauch_activity`
--

LOCK TABLES `user_app_lauch_activity` WRITE;
/*!40000 ALTER TABLE `user_app_lauch_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_app_lauch_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_external_auth`
--

DROP TABLE IF EXISTS `user_external_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_external_auth` (
  `userid` int unsigned NOT NULL,
  `access_token` varchar(1255) DEFAULT NULL,
  `refresh_token` text,
  `valid_till` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `oauth_provider` varchar(255) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `external_auth_resp` text COMMENT 'Response from the external provider',
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_user_external_auth_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store external auth details for external user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_external_auth`
--

LOCK TABLES `user_external_auth` WRITE;
/*!40000 ALTER TABLE `user_external_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_external_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fav_icon`
--

DROP TABLE IF EXISTS `user_fav_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fav_icon` (
  `uid` int unsigned NOT NULL,
  `icon_id` int unsigned NOT NULL,
  `icon_type` char(5) NOT NULL,
  `channelid` int unsigned NOT NULL,
  `fav_date` datetime NOT NULL,
  `fav_id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fav_id`),
  KEY `Index_1` (`icon_id`,`icon_type`),
  KEY `FK_user_fav_icon_1` (`uid`),
  KEY `FK_user_fav_icon_2` (`channelid`),
  CONSTRAINT `FK_user_fav_icon_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_fav_icon_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store favourite icons of users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fav_icon`
--

LOCK TABLES `user_fav_icon` WRITE;
/*!40000 ALTER TABLE `user_fav_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fav_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback_icon`
--

DROP TABLE IF EXISTS `user_feedback_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_feedback_icon` (
  `feedback_id` int unsigned NOT NULL AUTO_INCREMENT,
  `icon_id` int unsigned NOT NULL,
  `icon_type` varchar(10) NOT NULL,
  `uid` int unsigned NOT NULL,
  `feedback_text` text NOT NULL,
  `feedback_create_on` datetime NOT NULL,
  `feedback_update_on` datetime NOT NULL,
  `plugin_ver_id` int unsigned NOT NULL DEFAULT '0',
  `channelid` int unsigned NOT NULL,
  `device_type` varchar(45) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`feedback_id`),
  KEY `Index_2` (`icon_id`,`icon_type`),
  KEY `FK_user_feedback_icon_1` (`uid`),
  KEY `FK_user_feedback_icon_2` (`channelid`),
  CONSTRAINT `FK_user_feedback_icon_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_feedback_icon_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback_icon`
--

LOCK TABLES `user_feedback_icon` WRITE;
/*!40000 ALTER TABLE `user_feedback_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_feedback_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating_icon`
--

DROP TABLE IF EXISTS `user_rating_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating_icon` (
  `rating_id` int unsigned NOT NULL AUTO_INCREMENT,
  `icon_id` int unsigned NOT NULL,
  `plugin_ver_id` int unsigned NOT NULL DEFAULT '0',
  `icon_type` varchar(5) NOT NULL,
  `channelid` int unsigned NOT NULL,
  `rating` int unsigned NOT NULL,
  `rated_on` datetime NOT NULL,
  `device_type` varchar(45) NOT NULL,
  `uid` int unsigned NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `Index_2` (`icon_id`,`icon_type`),
  KEY `FK_user_rating_icon_1` (`uid`),
  KEY `FK_user_rating_icon_2` (`channelid`),
  CONSTRAINT `FK_user_rating_icon_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_rating_icon_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating_icon`
--

LOCK TABLES `user_rating_icon` WRITE;
/*!40000 ALTER TABLE `user_rating_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccountlock`
--

DROP TABLE IF EXISTS `useraccountlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraccountlock` (
  `uid` int unsigned NOT NULL,
  `msg` text NOT NULL,
  `url` varchar(445) NOT NULL,
  `lockdate` datetime DEFAULT '0000-00-00 00:00:00',
  `channelid` int unsigned DEFAULT NULL,
  `buttontext` varchar(45) DEFAULT '',
  `imageurl` varchar(445) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `idx_useraccountlock` (`lockdate`),
  CONSTRAINT `FK_useraccountlock_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccountlock`
--

LOCK TABLES `useraccountlock` WRITE;
/*!40000 ALTER TABLE `useraccountlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccountlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercomment`
--

DROP TABLE IF EXISTS `usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercomment` (
  `cmId` int unsigned NOT NULL AUTO_INCREMENT,
  `usercomment` text,
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`cmId`),
  KEY `FK_New Table_1` (`uid`),
  KEY `FK_New Table_2` (`cid`),
  KEY `FK_New Table_3` (`channelid`),
  CONSTRAINT `FK_New Table_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_New Table_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_New Table_3` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercomment`
--

LOCK TABLES `usercomment` WRITE;
/*!40000 ALTER TABLE `usercomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetails` (
  `uid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `userid` int unsigned NOT NULL COMMENT 'device identifier',
  `channelid` int unsigned NOT NULL DEFAULT '0',
  `registrationDate` datetime NOT NULL,
  `prioritypush` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true: pushed. false: not pushed',
  `wipe` int unsigned NOT NULL DEFAULT '0' COMMENT '0: default, 1: wipe n cont, 2: no more contents henceforth, 3: selective wipe',
  `reg_device` text NOT NULL COMMENT 'M: reg via mobile device, U: from UI',
  `audio_record` tinyint(1) DEFAULT '1',
  `video_record` tinyint unsigned DEFAULT '1',
  `is_active` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '1 means Active,0 means Deactive',
  `isRecommAllow` tinyint(1) NOT NULL DEFAULT '1',
  `appversion` varchar(45) NOT NULL DEFAULT 'NA',
  `appname` varchar(200) NOT NULL DEFAULT 'NA',
  `last_app_launch` datetime DEFAULT '0000-00-00 00:00:00',
  `signup_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'DateTime when user actually verified & signed up',
  `olduid` int unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `Index_4` (`last_app_launch`),
  KEY `IDX_userdetails_isactive` (`is_active`),
  KEY `FK_userdetails_1` (`userid`),
  KEY `FK_userdetails_2` (`channelid`),
  CONSTRAINT `FK_userdetails_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userdetails_2` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='user details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES (1,1,1,'2021-11-29 08:26:34',0,0,'w',1,1,1,1,'NA','DronaHQ','2022-03-05 14:43:00','2021-11-29 08:26:34',0);
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdevice`
--

DROP TABLE IF EXISTS `userdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdevice` (
  `userid` int unsigned NOT NULL,
  `deviceid` varchar(100) NOT NULL,
  KEY `FK_userdevice_1` (`userid`),
  KEY `FK_userdevice_2` (`deviceid`),
  CONSTRAINT `FK_userdevice_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userdevice_2` FOREIGN KEY (`deviceid`) REFERENCES `deviceinfo` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Device-User-Channel mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdevice`
--

LOCK TABLES `userdevice` WRITE;
/*!40000 ALTER TABLE `userdevice` DISABLE KEYS */;
INSERT INTO `userdevice` VALUES (1,'0000000000');
/*!40000 ALTER TABLE `userdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup` (
  `gid` int unsigned NOT NULL AUTO_INCREMENT,
  `gname` text NOT NULL,
  `details` text NOT NULL,
  `channelid` int unsigned NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `FK_usergroup_1` (`channelid`),
  CONSTRAINT `FK_usergroup_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'Default','All the users initially will register in this group',1,'2021-11-29 08:26:33',1);
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinbox`
--

DROP TABLE IF EXISTS `userinbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinbox` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `createddate` datetime NOT NULL,
  `modeType` text,
  `noti_id` int unsigned NOT NULL,
  `inbox_id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inbox_id`),
  KEY `ID_UserInbox_4` (`cid`),
  KEY `FK_UserInbox_1` (`uid`),
  KEY `FK_UserInbox_3` (`channelid`),
  CONSTRAINT `FK_UserInbox_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_UserInbox_3` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinbox`
--

LOCK TABLES `userinbox` WRITE;
/*!40000 ALTER TABLE `userinbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userid` int unsigned NOT NULL AUTO_INCREMENT,
  `uname` text NOT NULL,
  `udesg` text,
  `uemail` varchar(250) NOT NULL,
  `uorg` text,
  `upassword` text NOT NULL,
  `uimageurl` text,
  `empid` varchar(45) DEFAULT '0',
  `Usercode` varchar(100) DEFAULT NULL,
  `uhashcode` text,
  `usaltcode` text,
  `uiterations` varchar(200) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `currentcountry` varchar(200) DEFAULT NULL,
  `currentcity` varchar(200) DEFAULT NULL,
  `userabout` varchar(400) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `verify_via` varchar(45) DEFAULT '' COMMENT 'User verified via: Email, FB, LinkedIn, Google',
  `is_owner` tinyint(1) DEFAULT '0',
  `is_external_auth` tinyint(1) DEFAULT '0',
  `is_valid_id` tinyint(1) DEFAULT '1' COMMENT 'Sometime you jusr need a unique but invalid email',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `uemail_UNIQUE` (`uemail`),
  UNIQUE KEY `Usercode_UNIQUE` (`Usercode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'Rahul','','rahul@dronamobile.com','','',NULL,'0','QCcwNc8N8ycBDt74M3HHIu','pdxFGW3rBcUxMLxt7/BioqW/TPVA8jMw','8duWqJvdE9Wy+f911owIeEgaDppZ6nZD','1000',1,'','',NULL,1,'',1,0,1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotification`
--

DROP TABLE IF EXISTS `usernotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernotification` (
  `noti_id` int NOT NULL AUTO_INCREMENT,
  `noti_type` varchar(99) NOT NULL,
  `noti_json_data` varchar(900) NOT NULL COMMENT 'JSON data for the notification',
  `create_date` datetime NOT NULL,
  `uid` int unsigned NOT NULL,
  `channelid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `uid_from` int unsigned NOT NULL,
  `uid_recomm_to` int unsigned NOT NULL,
  `noti_for_comment` int DEFAULT '0',
  PRIMARY KEY (`noti_id`),
  KEY `FK_usernotification_2` (`uid`),
  KEY `FK_usernotification_1` (`channelid`),
  CONSTRAINT `FK_usernotification_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usernotification_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotification`
--

LOCK TABLES `usernotification` WRITE;
/*!40000 ALTER TABLE `usernotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpasswordrequest`
--

DROP TABLE IF EXISTS `userpasswordrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpasswordrequest` (
  `userid` int NOT NULL,
  `requesttoken` varchar(150) DEFAULT NULL,
  `requesttime` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `requesttoken_UNIQUE` (`requesttoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpasswordrequest`
--

LOCK TABLES `userpasswordrequest` WRITE;
/*!40000 ALTER TABLE `userpasswordrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpasswordrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpendingcontent`
--

DROP TABLE IF EXISTS `userpendingcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpendingcontent` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `expected_date` datetime DEFAULT NULL,
  `content_from` varchar(45) NOT NULL COMMENT 'Whether content from campaign OR push OR recommend OR UGC',
  `channelid` int unsigned NOT NULL,
  `content_mode` char(1) NOT NULL COMMENT 'mode: n OR d',
  `content_state` int DEFAULT '1' COMMENT '1: Ready to sent\n0: Process first, then send',
  KEY `FK_userpendingcontent_3` (`uid`),
  KEY `FK_userpendingcontent_1` (`channelid`),
  KEY `FK_userpendingcontent_2` (`cid`),
  CONSTRAINT `FK_userpendingcontent_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userpendingcontent_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userpendingcontent_3` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpendingcontent`
--

LOCK TABLES `userpendingcontent` WRITE;
/*!40000 ALTER TABLE `userpendingcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpendingcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpendingnotification`
--

DROP TABLE IF EXISTS `userpendingnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpendingnotification` (
  `uid` int unsigned NOT NULL,
  `noti_json` text,
  `noti_type` varchar(45) DEFAULT NULL,
  `noti_create_date` datetime DEFAULT NULL,
  `channelid` int unsigned DEFAULT NULL,
  `noti_id` int DEFAULT NULL,
  KEY `FK_userpendingnotification_2` (`uid`),
  KEY `FK_userpendingnotification_1` (`channelid`),
  CONSTRAINT `FK_userpendingnotification_1` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userpendingnotification_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpendingnotification`
--

LOCK TABLES `userpendingnotification` WRITE;
/*!40000 ALTER TABLE `userpendingnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpendingnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpushdetail`
--

DROP TABLE IF EXISTS `userpushdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpushdetail` (
  `uid` int unsigned NOT NULL,
  `pushid` text NOT NULL COMMENT 'for bb, iphone: pushid = appid',
  `pushType` tinyint DEFAULT '0',
  `deviceid` varchar(100) DEFAULT NULL,
  UNIQUE KEY `Index_1` (`uid`,`deviceid`),
  KEY `FK_userpushdetail_1` (`deviceid`),
  CONSTRAINT `FK_userpushdetail_1` FOREIGN KEY (`deviceid`) REFERENCES `deviceinfo` (`deviceid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userpushdetail_2` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpushdetail`
--

LOCK TABLES `userpushdetail` WRITE;
/*!40000 ALTER TABLE `userpushdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpushdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrecommendpush`
--

DROP TABLE IF EXISTS `userrecommendpush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrecommendpush` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `uidfrom` int unsigned NOT NULL,
  `modfieddate` datetime NOT NULL,
  `channelid` int unsigned NOT NULL,
  `status` int unsigned NOT NULL,
  KEY `FK_userrecommendpush_3` (`uidfrom`),
  KEY `FK_userrecommendpush_1` (`uid`),
  KEY `FK_userrecommendpush_2` (`cid`),
  KEY `FK_userrecommendpush_4` (`channelid`),
  CONSTRAINT `FK_userrecommendpush_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userrecommendpush_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userrecommendpush_3` FOREIGN KEY (`uidfrom`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userrecommendpush_4` FOREIGN KEY (`channelid`) REFERENCES `channel` (`channelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrecommendpush`
--

LOCK TABLES `userrecommendpush` WRITE;
/*!40000 ALTER TABLE `userrecommendpush` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrecommendpush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersentcontent`
--

DROP TABLE IF EXISTS `usersentcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersentcontent` (
  `uid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `sent_date` datetime DEFAULT NULL,
  `sent_via` varchar(45) NOT NULL COMMENT 'Sent via campaign OR push OR recommend OR UGC',
  `channelid` int NOT NULL,
  `sent_mode` char(1) NOT NULL,
  `noti_sent` tinyint(1) DEFAULT '1' COMMENT 'Whether a notification has been sent or not for this content',
  KEY `FK_usersentcontent_1` (`uid`),
  KEY `FK_usersentcontent_2` (`cid`),
  CONSTRAINT `FK_usersentcontent_1` FOREIGN KEY (`uid`) REFERENCES `userdetails` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usersentcontent_2` FOREIGN KEY (`cid`) REFERENCES `assets` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersentcontent`
--

LOCK TABLES `usersentcontent` WRITE;
/*!40000 ALTER TABLE `usersentcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersentcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dronahq_internal'
--

--
-- Dumping routines for database 'dronahq_internal'
--
/*!50003 DROP FUNCTION IF EXISTS `Dcr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `Dcr`(encString TEXT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE dKey, returnType TEXT;

SET dKey = '@1B2c3D4e5F6g7H8', returnType = '';

SELECT AES_DECRYPT(UnHex(encString), dKey) INTO returnType;

RETURN returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `diy_GetContentTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `diy_GetContentTitle`(contId INT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE contTitle TEXT DEFAULT '';

IF EXISTS (SELECT * FROM assets WHERE cid = contId) THEN
	SELECT title FROM contentmeta cm JOIN assets ast ON ast.mid = cm.mid WHERE ast.cid = contId INTO contTitle;
END IF;

RETURN contTitle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `diy_GetOrCreateDefaultTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `diy_GetOrCreateDefaultTemplate`(chanId INT) RETURNS int
BEGIN



DECLARE returnType INT;



IF EXISTS (SELECT * FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE) THEN



  SELECT viewid FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE INTO returnType;



ELSE



  INSERT INTO categorytemplate (viewname, ismaster, channelId) VALUES ('Master Template', TRUE, chanId);

  SELECT LAST_INSERT_ID() INTO returnType;



END IF;



RETURN returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `diy_GetUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `diy_GetUserName`(urId INT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE usrName TEXT DEFAULT '';

IF EXISTS (SELECT * FROM userdetails WHERE uid = urId) THEN
	SELECT uname FROM userinfo ui JOIN userdetails uds ON uds.userid = ui.userid WHERE uds.uid = urId INTO usrName;
END IF;
RETURN usrName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `diy_GetUserProfileImg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `diy_GetUserProfileImg`(urId INT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE usrImg TEXT DEFAULT '';

IF EXISTS (SELECT * FROM userdetails WHERE uid = urId) THEN
	SELECT uimageurl FROM userinfo ui JOIN userdetails uds ON uds.userid = ui.userid WHERE uds.uid = urId INTO usrImg;
END IF;
RETURN usrImg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Enc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `Enc`(someString TEXT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE eKey, returnType TEXT;

SET eKey = '@1B2c3D4e5F6g7H8', returnType = '';

SELECT HEX(AES_ENCRYPT(someString, ekey)) INTO returnType;

RETURN returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_diy_GetContConsumptionStat_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fn_diy_GetContConsumptionStat_User`(urId INT, chanId INT) RETURNS varchar(50) CHARSET utf8mb3
BEGIN

DECLARE totalContAvailable, totalContConsumed INT DEFAULT 0;
DECLARE yoloVal VARCHAR(50);

-- Available contents for consumption
BEGIN
  DROP TEMPORARY TABLE IF EXISTS tempAvailableUserCont;
  CREATE TEMPORARY TABLE tempAvailableUserCont(tCid INT, tChanId INT, tContType CHAR(5)) ENGINE = MEMORY;

  -- Sent via Push & Recommend
  INSERT INTO tempAvailableUserCont
   SELECT usc.cid, chanId, 'SENT' FROM usersentcontent usc WHERE usc.uid = urId AND usc.channelid = chanId;
  
  -- Available via knoweldgebase
  
  -- Get all my templates, and then get all contents in those templates
  -- Specially handle the case of folder?
  INSERT INTO tempAvailableUserCont
    SELECT
      DISTINCT kb.cid, chanId, 'KB' 
    FROM uidgid ugd
      LEFT JOIN mapviewgrp mvg ON mvg.gid = ugd.gid 
      LEFT JOIN categorytemplate ctm ON (ctm.viewid = mvg.viewid) OR (ctm.ismaster = 1 and ctm.channelid = chanId)
      JOIN mapviewcat mvc ON ctm.viewid = mvc.viewid AND type ='c' 
      JOIN category cat ON cat.catid = mvc.catid AND cat.channelid = chanId
      JOIN knowledgebase kb ON cat.catid = kb.catid 
    WHERE uid = urId;
  
  -- Unique contents (By aid, mid & type)
  SELECT COUNT(*) FROM
    (SELECT *
      FROM tempAvailableUserCont tauc
        JOIN assets ast ON tauc.tcid = ast.cid AND ast.channelid = tauc.tChanId
      GROUP by ast.aid, ast.mid, ast.conttype) sq INTO totalContAvailable;
END;

-- Total consumed contents
SELECT COUNT(*) FROM
  (SELECT cv.* FROM contentviewed cv
      JOIN assets ast ON cv.cid = ast.cid AND cv.channelid = ast.channelid
    WHERE cv.uid = urId AND cv.channelid = chanId
    GROUP BY ast.aid, ast.mid, ast.conttype) sq INTO totalContConsumed;

SELECT CONCAT(totalContConsumed, '|', totalContAvailable) INTO yoloVal;

RETURN yoloVal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_diy_GetUserActivityStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fn_diy_GetUserActivityStatus`(userId int) RETURNS char(1) CHARSET utf8mb3
BEGIN
  
  DECLARE stat CHAR(1) ;
  declare num int;
  
	select count(cid) from contentviewhistory where uid = userId AND datediff(now(),viewon)<=15 INTO num;
	
	IF (num <= 0) THEN 
	  SET stat = 'I'; -- Inactive
	END IF;

	IF (num > 0 && num <= 5) THEN SET stat = 'M'; -- Moderate
	END IF;

	IF (num > 5) THEN SET stat = 'A'; -- Active
	END IF;
	
	return stat;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getAppStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fn_getAppStatus`(activeStatus INT,searchableStatus INT) RETURNS varchar(10) CHARSET utf8mb3
BEGIN
	DECLARE tas VARCHAR(10) DEFAULT "";
	IF(activeStatus = 1) THEN
		IF(searchableStatus = 1) THEN
			SET tas = "live";
		ELSE
			SET tas = "draft";
		END IF;
	ELSE
		SET tas = "deleted";
	END IF;
	RETURN tas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getPluginVersions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fn_getPluginVersions`(pluginID INT) RETURNS text CHARSET utf8mb3
BEGIN
	DECLARE version_details TEXT DEFAULT '';
    select GROUP_CONCAT(baseTable.env_version , '') as version_details FROM (
		select pa.plugin_id,
		case 
			when pa.dev_version = pav.plugin_ver_id
			then CONCAT("Dev:",version_code) 
			when latest_version = plugin_ver_id 
			then CONCAT("Prod:",version_code) 
			when beta_version = plugin_ver_id
			then CONCAT("Beta:",version_code) 
			else null 
		end as env_version
		 from plugin_app pa
			left join plugin_app_version pav on pav.plugin_id = pa.plugin_id
			where pa.plugin_id= pluginID
			group by env_version) as baseTable INTO version_details;
	RETURN version_details;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_getUserGroupCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fn_getUserGroupCount`(chanId INT,filterType TEXT,filterValues TEXT) RETURNS int
BEGIN

DECLARE tCount INT DEFAULT 0;



IF(filterType = 'ALL') THEN

  SELECT COUNT(DISTINCT ug.gid)

  FROM usergroup ug

    LEFT JOIN uidgid udg ON udg.gid = ug.gid 

    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1

  WHERE ug.channelid = chanId INTO tCount;

ELSE IF(filterType = 'GRP_IDS') THEN

  SELECT COUNT(DISTINCT ug.gid)

  FROM usergroup ug

    LEFT JOIN uidgid udg ON udg.gid = ug.gid

    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1

  WHERE ug.channelid = chanId 

    AND FIND_IN_SET(ug.gid, filterValues) INTO tCount;

ELSE IF (filterType = 'PUSH') THEN

    SELECT COUNT(DISTINCT ug.gid) AS groupcount

    FROM usergroup ug

      JOIN uidgid udg ON udg.gid = ug.gid

      JOIN userdetails ud ON udg.uid = ud.uid

    WHERE

      ug.channelid = chanId

      AND ud.is_active = 1

      AND ud.last_app_launch <> '0000-00-00 00:00:00'

    HAVING groupcount > 0  INTO tCount;

ELSE IF(filterType = 'PUSH_GRP_IDS')THEN

  SELECT COUNT(DISTINCT ug.gid) AS groupcount

    FROM usergroup ug

      JOIN uidgid udg ON udg.gid = ug.gid

      JOIN userdetails ud ON udg.uid = ud.uid

    WHERE

      ug.channelid = chanId

      AND FIND_IN_SET(ug.gid, filterValues)

      AND ud.is_active = 1

      AND ud.last_app_launch <> '0000-00-00 00:00:00'

    HAVING groupcount > 0  INTO tCount;

ELSE IF (filterType = 'CAT_IDS') THEN

  SELECT COUNT(DISTINCT ug.gid)

  FROM usergroup ug

    LEFT JOIN uidgid udg ON udg.gid = ug.gid 

    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1

    LEFT JOIN mapviewgrp mavg ON mavg.gid = ug.gid

    left join categorytemplate cte on cte.viewid = mavg.viewid

  WHERE ug.channelid = chanId and FIND_IN_SET(cte.viewid, filterValues)  INTO tCount;

 ELSE IF (filterType = 'ADMN') THEN

  SELECT COUNT(DISTINCT ug.gid)

  FROM usergroup ug

    JOIN uidgid udg ON udg.gid = ug.gid

    JOIN mapviewgrp mvg ON mvg.gid = ug.gid

    JOIN admin_view_access ava ON ava.viewid = mvg.viewid

  WHERE ug.channelid = chanId

    AND ava.admin_id = filterValues  INTO tCount;

END IF;

END IF;

END IF;

END IF;

END IF;

END IF;



RETURN tCount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getgroupdeleveries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `getgroupdeleveries`(groupId int) RETURNS int
BEGIN

declare lastVal, counter, campaignId, campDels, summation int;

declare curGrpDel cursor for
  select campId from groupcampaignhistory where gid = groupId;

select count(campId) from groupcampaignhistory where gid = groupId into lastVal;

set counter = 0, campDels = 0, summation = 0;

if (lastVal > 0) then

  open curGrpDel;

  repeat

    set counter = counter + 1;

    fetch curGrpDel into campaignId;

    select deliveries from campaign where campId = campaignId into campDels;

    set summation = summation + campDels;

  until lastVal = counter
  end repeat;

  close curGrpDel;

end if;

return summation;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getgroupinteractions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `getgroupinteractions`(groupId int) RETURNS int
BEGIN

declare lastVal, counter, campaignId, campInters, summation int;

declare curGrpDel cursor for
  select campId from groupcampaignhistory where gid = groupId;

select count(campId) from groupcampaignhistory where gid = groupId into lastVal;

set counter = 0, campInters = 0, summation = 0;

if (lastVal > 0) then

  open curGrpDel;

  repeat

    set counter = counter + 1;

    fetch curGrpDel into campaignId;

    select interactions from campaign where campId = campaignId into campInters;

    set summation = summation + campInters;

  until lastVal = counter
  end repeat;

  close curGrpDel;

end if;

return summation;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getgroupviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `getgroupviews`(groupId int) RETURNS int
BEGIN

declare lastVal, counter, campaignId, campViews, summation int;

declare curGrpDel cursor for
  select campId from groupcampaignhistory where gid = groupId;

select count(campId) from groupcampaignhistory where gid = groupId into lastVal;

set counter = 0, campViews = 0, summation = 0;

if (lastVal > 0) then

  open curGrpDel;

  repeat

    set counter = counter + 1;

    fetch curGrpDel into campaignId;

    select views from campaign where campId = campaignId into campViews;

    set summation = summation + campViews;

  until lastVal = counter
  end repeat;

  close curGrpDel;

end if;

return summation;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetIndexForCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `GetIndexForCategory`(chanName text) RETURNS int
BEGIN

declare returnType, indx1, indx2 int default 1;
declare chanId int;

select channelId from channel where channelName = channame into chanId;
if exists (select * from category where channelId = chanId) then
	SELECT MAX(indexing) FROM category WHERE channelId = chanId INTO indx1;
end if;

if exists (select * from actionbutton where channelId = chanId) then
	SELECT MAX(dispindex) FROM actionbutton WHERE channelId = chanId into indx2;	
end if;

select GREATEST(indx1, indx2) + 1 into returnType;

RETURN returnType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetReleaseNotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `GetReleaseNotes`(chanId INT, appVersion TEXT, deviceType TEXT) RETURNS text CHARSET utf8mb3
BEGIN

DECLARE returnType TEXT DEFAULT '';

IF EXISTS (SELECT * FROM releasenotes WHERE channelId = chanId AND `version` = appVersion AND device_type = deviceType)  THEN
  SELECT notes FROM releasenotes WHERE channelId = chanId AND `version` = appVersion AND device_type = deviceType LIMIT 1 INTO returnType;
END IF;

RETURN returnType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetAppAverageRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetAppAverageRating`(pluginId INT) RETURNS double
BEGIN
DECLARE retVal DOUBLE;

SELECT COALESCE(FORMAT(SUM(uri.rating)/COUNT(*), 1), 0)
FROM user_rating_icon uri
JOIN plugin_template_map ptm
  ON ptm.ab_id = uri.icon_id AND uri.icon_type = 'a'
WHERE ptm.plugin_id = pluginId INTO retVal;

RETURN retVal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetAppAverageRatingUserCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetAppAverageRatingUserCount`(pluginId INT) RETURNS int
BEGIN

DECLARE retVal INT;



SELECT COUNT(DISTINCT uri.uid) AS average_rating

FROM user_rating_icon uri

JOIN plugin_template_map ptm

  ON ptm.ab_id = uri.icon_id WHERE ptm.plugin_id = pluginId INTO retVal;



RETURN retVal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetAppFavCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetAppFavCount`(pluginId INT) RETURNS int
BEGIN



DECLARE retVal DOUBLE;



SELECT COUNT(DISTINCT ufi.uid)

FROM user_fav_icon ufi

JOIN plugin_template_map ptm

  ON ufi.icon_id = ptm.ab_id AND ufi.icon_type = 'a'

JOIN plugin_app pa

  ON pa.plugin_id = ptm.plugin_id WHERE pa.plugin_id = pluginId INTO retVal;



RETURN retVal;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetAppFeedbackCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetAppFeedbackCount`(pluginId INT) RETURNS int
BEGIN

DECLARE retVal INT;

SELECT COUNT(ufi.uid)
FROM user_feedback_icon ufi
JOIN plugin_template_map ptm
  ON ptm.ab_id = ufi.icon_id WHERE ptm.plugin_id = pluginId INTO retVal;

RETURN retVal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetLatestVersionCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetLatestVersionCode`(pluginId INT) RETURNS text CHARSET utf8mb3
BEGIN



DECLARE retVal TEXT;



SELECT version_code

FROM plugin_app_version

WHERE plugin_id = pluginId

ORDER BY plugin_ver_id DESC

LIMIT 1 INTO retVal;



RETURN retVal;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `plugin_fnGetLatestVersionId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `plugin_fnGetLatestVersionId`(pluginId INT) RETURNS int
BEGIN

DECLARE retVal INT;



SELECT plugin_ver_id

FROM plugin_app_version

WHERE plugin_id = pluginId

ORDER BY plugin_ver_id DESC

LIMIT 1 INTO retVal;



RETURN retVal;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `strSplit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `strSplit`(x VARCHAR(5000), delim VARCHAR(100), pos int) RETURNS varchar(1000) CHARSET utf8mb3
return replace(substring(substring_index(x, delim, pos), char_length(substring_index(x, delim, pos - 1)) + 1), delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `substrCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE FUNCTION `substrCount`(s VARCHAR(50000), ss VARCHAR(50000)) RETURNS int unsigned
    READS SQL DATA
BEGIN
DECLARE count int(4) UNSIGNED;
DECLARE offset int(4) UNSIGNED;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET s = NULL;

SET count = 0;
SET offset = 1;

REPEAT
IF NOT ISNULL(s) AND offset > 0 THEN
SET offset = LOCATE(ss, s, offset);
IF offset > 0 THEN
SET count = count + 1;
SET offset = offset + 1;
END IF;
END IF;
UNTIL ISNULL(s) OR offset = 0 END REPEAT;

RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `V2_IsUserEmailExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `V2_IsUserEmailExists`(userMailId TEXT) RETURNS int
BEGIN

IF EXISTS (SELECT userid FROM userinfo WHERE uemail = userMailId AND is_verified = 1) THEN
	RETURN 1;
ELSE
	RETURN 0;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `v7_fnGetAppCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `v7_fnGetAppCount`(chanId INT ,catId INT) RETURNS int
BEGIN
	DECLARE cmsAppCount INT DEFAULT 0;
	DECLARE normalAppCount INT DEFAULT 0;
	SELECT COUNT(mp.catid) from mapviewcat mp
         JOIN category c
           ON mp.catid = c.catid AND mp.type = "c"
		WHERE 
			mp.viewid = catId
			AND c.channelid = chanId
			
		INTO cmsAppCount;

  SELECT COUNT(mp.catid) from mapviewcat mp
          left JOIN plugin_template_map ptm  ON mp.catid = ptm.ab_id 
         left JOIN actionbutton a  ON mp.catid = a.abid 
	
		left JOIN plugin_app pa
			ON pa.plugin_id = ptm.plugin_id
		WHERE 
			mp.viewid = catId AND mp.`type` = "a"
		AND a.channelid = chanId 
		INTO normalAppCount;
RETURN (cmsAppCount + normalAppCount);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addModifyInstalledCategoryMeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `addModifyInstalledCategoryMeta`(IN categoryId INT, IN channelId INT, IN catName TEXT,IN catDesc TEXT, IN catIcon TEXT, IN schemeType TEXT, IN updatedBy TEXT, IN catType TEXT, IN formatId TEXT, IN isInstalled INT)
BEGIN
	DECLARE resp INT DEFAULT 0;
	IF categoryId = 0 THEN
		IF NOT EXISTS(SELECT 1 FROM api_category WHERE LOWER(cat_name) = LOWER(catName) AND channel_id = channelId) THEN
			INSERT INTO `api_category` (`channel_id`, `cat_name`, `cat_desc`, `cat_image_url`, `scheme_type`, `created_by`, `updated_by`, `cat_type`, `format_id`, `isInstalled`)
            VALUES(channelId, catName, catDesc, catIcon, schemeType, updatedBy, updatedBy, catType, formatId, isInstalled);
			SELECT LAST_INSERT_ID() INTO resp;
		END IF;
    ELSE
		IF NOT EXISTS(SELECT 1 FROM api_category WHERE LOWER(cat_name) = LOWER(catName) AND channel_id = channelId AND api_category_id != categoryId) THEN
			UPDATE `api_category`
			SET `cat_name` = catName, `cat_desc` = catDesc, `cat_image_url` = catIcon, `scheme_type` = schemeType, `updated_by` = updatedBy, `updated_on` = CURRENT_TIMESTAMP, `cat_type` = catType, `format_id` = formatId
			WHERE `api_category_id` = categoryId AND `channel_id` = channelId;
			SET resp = categoryId;
		END IF;
    END IF;			
	SELECT resp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkonprimeLicenseLock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `checkonprimeLicenseLock`(IN useremail TEXT)
BEGIN
	select kcol_operation as licenselock from userinfo ui 
	join userdetails ud on ud.userid = ui.userid
	join sliated_nalp_merpno snm on snm.channel_id = ud.channelid
	where ui.uemail = useremail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteConnectorMetaInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `deleteConnectorMetaInfo`(IN channelid INT, IN catid INT)
BEGIN

	IF EXISTS (SELECT 1 FROM api_category WHERE channel_id = channelid AND api_category_id = catid) THEN
		
        DELETE FROM api_sub_category
		WHERE category_id = catid;
		
        DELETE FROM api_category
		WHERE channel_id = channelid AND api_category_id = catid;

		SELECT 1 AS 'Success', 'Meta Info Deleted' AS 'Message';

	ELSE

		SELECT 0 AS 'Success', 'Meta Info Not Found' AS 'Message';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_AssignGroupToUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_AssignGroupToUser`(IN urId INT, IN grpId INT)
BEGIN

  DECLARE urChanId, grpChanId INT DEFAULT 0;
  
  SELECT channelid FROM userdetails WHERE uid = urId INTO urChanId;
  SELECT channelid FROM usergroup WHERE gid = grpId INTO grpChanId;

  IF (urChanId = grpChanId) THEN
    IF NOT EXISTS (SELECT * FROM uidgid WHERE uid = urId AND gid = grpId) THEN
      INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_ChangeUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_ChangeUserPassword`(IN urId INT, IN hash_code TEXT, IN salt_code TEXT, IN u_iterations TEXT, IN chanId INT)
BEGIN

DECLARE respType, usrId INT DEFAULT 0;

IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId AND is_active = 1) THEN
		SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
		UPDATE userinfo SET
      uhashcode = hash_code,
      usaltcode = salt_code,
      uiterations = u_iterations
  	WHERE userid = usrId;
		SET respType = 1;
ELSE
		SET respType = 3;
END IF;

SELECT respType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CheckAppLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CheckAppLogin`(IN emailId TEXT, IN chanName TEXT)
BEGIN

DECLARE chanId, respType, userIteration INT DEFAULT 0;
DECLARE userHash, userSalt TEXT;
DECLARE usrId, urId INT DEFAULT 0;

IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
	
	IF EXISTS (SELECT * FROM userinfo ui JOIN userdetails ud ON ui.userid = ud.userid WHERE ui.uemail = emailId AND ud.channelid = chanId AND ud.is_active = 1) THEN
		IF EXISTS (SELECT * FROM userinfo WHERE uemail = emailId AND is_verified = 1) THEN
		  SELECT userid, uhashcode, usaltcode, uiterations FROM userinfo WHERE uemail = emailId INTO usrId, userHash, userSalt, userIteration;
		  SELECT uid FROM userdetails ud WHERE userid = usrId AND channelid = chanId INTO urId;
	  ELSE
		  SET respType = 10;
		END IF;
  ELSE
    IF EXISTS (SELECT * FROM userinfo ui JOIN userdetails ud ON ui.userid = ud.userid WHERE ui.uemail = emailId AND ud.channelid = chanId AND ud.is_active = 0 AND ui.is_external_auth=1) THEN
      SELECT userid, uhashcode, usaltcode, uiterations FROM userinfo WHERE uemail = emailId INTO usrId, userHash, userSalt, userIteration;
		  SELECT uid FROM userdetails ud WHERE userid = usrId AND channelid = chanId INTO urId;
    ELSE
	    SET respType = 7;
	  END IF;
	END IF;
ELSE
	SET respType = 2; 
END IF;

SELECT respType, userHash, userSalt, userIteration, urId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CheckConsoleLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CheckConsoleLogin`(IN userEmail TEXT)
BEGIN
  DECLARE respType, usrId, userIter, userAdmin, adminId, rlId, urId, urChanId INT DEFAULT 0;
  DECLARE userName, userHash, userSalt, urChanName,urImageUrl TEXT DEFAULT '';
  DECLARE lastLoginDt DATETIME DEFAULT NOW();
  DECLARE oauthProvider TEXT DEFAULT '';
   DECLARE isSeller INT DEFAULT 0;
  IF EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail AND is_verified = 1) THEN
    SELECT userid, uname, uhashcode, usaltcode, uiterations, isAdmin,uimageurl FROM userinfo WHERE uemail = userEmail INTO usrId, userName, userHash, userSalt, userIter, userAdmin,urImageUrl;
    SELECT uid, channelid FROM userdetails WHERE userid = usrId AND is_active = 1 ORDER BY uid DESC LIMIT 1 INTO urId, urChanId;
    IF(urId>0)then
    SELECT COALESCE(admin_id, 0), roleid, last_login_time FROM adminuser WHERE userid = usrId AND channelid = urChanId INTO adminId, rlId, lastLoginDt;
    SELECT channelname,is_seller FROM channel WHERE channelid = urChanId INTO urChanName,isSeller;
    IF EXISTS (SELECT * FROM user_external_auth WHERE userid = usrId) THEN
      SELECT oauth_provider FROM user_external_auth WHERE userid = usrId INTO oauthProvider;
      else
       IF EXISTS (SELECT * FROM userinfo WHERE userid = usrId and is_external_auth=1) THEN
         set oauthProvider="oauth";
       END IF;
    END IF;
	
    SET respType = 1;
    ELSE
       SET respType = -2;
    END IF;
  ELSE
    SET respType = -1;
  END IF;
  SELECT respType, usrId, userName, userHash, userSalt, userIter, userAdmin, urId, urChanId, adminId, rlId, lastLoginDt, urChanName,urImageUrl, oauthProvider,isSeller;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CheckIfUserLocked` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CheckIfUserLocked`(IN userId INT,IN chanId INT)
BEGIN

SELECT 
    msg, url,buttontext,imageurl
FROM
    useraccountlock
WHERE
    uid = userId AND channelid = chanId
ORDER BY lockdate DESC
LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CheckPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CheckPassword`(in urId int, in chanId int)
BEGIN
DECLARE thashcode,tsaltcode,titerations TEXT DEFAULT '';
DECLARE usrId INT;
DECLARE respType INT;
SET respType=0;

IF EXISTS(SELECT * FROM userdetails WHERE uid= urId AND channelid=chanId and is_active = 1)THEN
	SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
  SELECT uhashcode,usaltcode,uiterations FROM userinfo WHERE userid = usrId INTO thashcode,tsaltcode,titerations;
  SET respType=1;
ELSE
	SET respType=3;
END IF;

SELECT respType,thashcode,tsaltcode,titerations;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CheckUservarificationForchannel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CheckUservarificationForchannel`(in usercode text)
BEGIN

IF EXISTS(SELECT * FROM admininvites where verificationCode=usercode ) THEN

	SELECT adminId, emailId, invitedOn, inviteAcceptedOn, verificationCode, verified, UserName, Dcr(`Password`)as Password FROM admininvites where verificationCode=usercode and verified=0;

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_chkTokenExist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_chkTokenExist`(IN newTok TEXT)
BEGIN



DECLARE tokExist INT DEFAULT 1;



IF NOT EXISTS(SELECT * FROM plugin_token WHERE tokenkey = newTok)THEN

  IF NOT EXISTS(SELECT * FROM plugin_token_expired WHERE tokenkey = newTok)THEN

    SET tokExist = 0;

  END IF;

END IF;



SELECT tokExist AS token_exist;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateActionButton` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateActionButton`(IN actButTitle VARCHAR(45), IN actButAction VARCHAR(45), IN actButUrl VARCHAR(200), IN chanName TEXT,

IN gridxhdpi VARCHAR(200), IN gridhdpi VARCHAR(200), IN gridmdpi VARCHAR(200), IN gridldpi VARCHAR(200),

IN tilexhdpi VARCHAR(200), IN tilehdpi VARCHAR(200), IN tilemdpi VARCHAR(200), IN tileldpi VARCHAR(200),

IN templateId INT, OUT actionButtonId INT)
BEGIN



DECLARE chanId, indx INT;



SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;



SELECT GetIndexForCategory(chanName) INTO indx;



INSERT INTO actionbutton (title, `action`, url, image, dispindex, channelid, action_tile_img, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi)

VALUES (actButTitle, actButAction, actButUrl, gridxhdpi, indx, chanId, tilemdpi, gridxhdpi, gridhdpi, gridmdpi, gridldpi, tilexhdpi, tilehdpi, tilemdpi, tileldpi);



SELECT LAST_INSERT_ID() INTO actionButtonId;



IF(actButAction='folderview') THEN

    CALL diy_TrfCategoryToTemplate(actionButtonId, templateId, 'f', 'folder view');

ELSE

  IF(actButAction = 'Plugin') THEN

    CALL diy_TrfCategoryToTemplate(actionButtonId, templateId, 'a', 'plugin');

  ELSE

    CALL diy_TrfCategoryToTemplate(actionButtonId, templateId, 'a', 'web view');

  END IF;

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_createAdminViewRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_createAdminViewRole`(in adminId int,in accessText text)
BEGIN
if not exists(select * from admin_view_role_access_map where uid=adminId) then
	insert into admin_view_role_access_map(uid, map_id)Values(adminId,accessText);
else
   update admin_view_role_access_map set map_id=accessText where uid=adminId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateCategoryInFolder_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateCategoryInFolder_v2`(in categoryId int,in fId int,in stype text)
BEGIN

declare indx int default 1;

declare respType int  default 0;

declare templateId int default 0;

if exists (SELECT * FROM folderstructure where actionId=fId) then

	select MAX(order_index) from folderstructure where actionId=fId INTO indx;
end if;

if not exists(SELECT * FROM folderstructure where mapId=categoryId) then
	if not exists(SELECT * FROM folderstructure where actionId=fId and mapId=categoryId)then
	   insert into folderstructure(actionId, mapId, order_index, createddate, catType)
	   VALUES(fId,categoryId,indx,now(),stype);
	   select viewid from mapviewcat where  catid=fId and `type`='f'  into templateId;
	   Delete from mapviewcat where catid=categoryId and viewid=templateId;
	   set respType=1;

	end if;
    
 else
   
   if not exists(SELECT * FROM folderstructure where actionId=fId and mapId=categoryId)then
       DELETE FROM folderstructure WHERE  mapId=categoryId;
	   insert into folderstructure(actionId, mapId, order_index, createddate, catType)
	   VALUES(fId,categoryId,indx,now(),stype);
	   select viewid from mapviewcat where  catid=fId and `type`='f'  into templateId;
	   Delete from mapviewcat where catid=categoryId and viewid=templateId;
	   set respType=1;

	end if;
end if;


select respType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateCategoryTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateCategoryTemplate`(IN templateName TEXT, IN isMasterTemplate BOOL, IN groupCollection TEXT, IN chanId INT)
BEGIN

DECLARE lastVal, counter, groupId, templateId INT DEFAULT 0;
DECLARE returnType INT DEFAULT -1; -- CATEGORY TEMPLATE NAME ALREADY EXISTS.

  -- NOW YOU WILL ASK WHY WAS THIS VALIDATION DONE.
  -- IT IS JUST TO ALERT THE ADMIN TO AVOID CONFUSIONS BETWEEN THE TEMPLATE NAMES
  -- IF YOU STILL ARGUE THAT THIS VALIDATION IS NOT REQUIRED, THEN I JUST HAVE TO REMOVE THIS IF CLAUSE.

IF NOT EXISTS (SELECT * FROM categorytemplate WHERE viewname = templateName AND channelId = chanId) THEN

  INSERT INTO categorytemplate (viewname, ismaster, channelId, created_on)
    VALUES (templateName, isMasterTemplate, chanId, NOW());

  SELECT LAST_INSERT_ID() INTO templateId;

  IF (groupCollection <> '') THEN
    SELECT SUBSTRCOUNT(groupCollection, ',') + 1 INTO lastVal;
  
    REPEAT
      
      SET counter = counter + 1;
  
      SELECT STRSPLIT(groupCollection, ',', counter) INTO groupId;
      INSERT INTO mapviewgrp VALUES (templateId, groupId);
  
    UNTIL counter = lastVal
    END REPEAT;

  END IF;

  SET returnType = templateId;

END IF;

SELECT returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_createEmailconfig_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_createEmailconfig_v1`(
in fromname text,
in fromemail text,
in hostname text,
in hport int,
in huname text,
in hpass text,
in hssl int,
in chanId int,
in contype text,
in hApiKey text
)
BEGIN
declare respType  INT DEFAULT 0;
if not exists (select* from channel_email_config where channel_id=chanId and config_type= contype) Then
  insert into channel_email_config (from_name, from_email, host_name, host_port, host_username, host_pass, ishost_ssl, channel_id, created_on, updated_on, config_type, con_api_key)
         values(fromname,fromemail,hostname,hport,huname,hpass,hssl,chanId,now(),now(),contype,hApiKey);
         set respType=1;
else
	update channel_email_config
          set from_name=fromname,
              from_email=fromemail, 
              host_name=hostname,
              host_port=hport,
              host_username=huname,
              host_pass= hpass,
              ishost_ssl=hssl,
              updated_on=Now(),
              con_api_key=hApiKey where channel_id=chanId and config_type= contype;
              set respType=1;
end if;
 select respType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateGroup`(IN groupName TEXT, IN chanName TEXT)
BEGIN
DECLARE chanId, groupId, returnType INT;

START TRANSACTION;
SET returnType = 0;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF NOT EXISTS (SELECT * FROM usergroup WHERE gname = groupName AND channelid = chanId) THEN

  INSERT INTO usergroup (gname, details, channelid, creationdate) VALUES
  (groupName, 'NA', chanId, NOW());

  SELECT LAST_INSERT_ID() INTO groupId;

  SET returnType = groupId;

END IF;

COMMIT;

SELECT returnType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateUserBypass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateUserBypass`(IN userName TEXT, IN userEmail TEXT, IN hashCode TEXT,

  IN saltCode TEXT, IN iterations TEXT, IN chanName TEXT, IN isAdmin BOOL, IN isValidId BOOL, IN eCode VARCHAR(50))
BEGIN



    DECLARE chanId, usrId, urId, rlId, returnType INT DEFAULT 0;



  SELECT channelId FROM channel WHERE channelName = chanName INTO chanId;



  IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN

    INSERT INTO userinfo (uname, udesg, uemail, uorg, upassword, usercode, uhashcode, usaltcode, uiterations, is_verified, verify_via, is_valid_id, empid)

	  VALUES (userName, '', userEmail, '', '',userEmail, hashCode, saltCode, iterations, 1, 'manual', isValidId, eCode);



    SELECT LAST_INSERT_ID() INTO usrId;



    INSERT INTO userdetails (userid, channelId, registrationDate, reg_device, is_active,signup_date)

	  VALUES (usrId, chanId, now(), 'w', 1,now());



    SELECT LAST_INSERT_ID() INTO urId;



    IF (isAdmin = TRUE) THEN

        SELECT rid FROM roles WHERE rolename = 'Admin' AND channelid = chanId INTO rlId;

        CALL diy_MakeAdminUser(urId, rlId, chanName);

    END IF;



    SET returnType = 1;

  ELSE

     SET returnType = 2;

  END IF;



  SELECT returnType, urId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateUserFromWebsite_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateUserFromWebsite_v2`(in userName text, in userDesig text, in email text, in hashCode text, in saltCode text, in iterations text, in chanName text)
BEGIN
	declare chanId, returnType, usrId, groupId, urId, rlId int default 0;
	declare verifyCode text default UUID();

	select channelId from channel where channelName = chanName into chanId;

	if not exists (select * from userinfo ui join userdetails ud on ui.userid = ud.userid where ui.uemail = email and channelId = chanId) then
		if exists (select * from admininvites where emailId = email) then
			select verificationCode from admininvites where emailId = email into verifyCode;
		end if;
		insert into userinfo (uname, udesg, uemail, uorg, upassword, usercode, uhashcode, usaltcode, uiterations, is_verified, verify_via, is_owner)
		values (userName, userDesig, email, '', '',verifyCode, hashCode, saltCode, iterations, 1, '', 1);
		
		select LAST_INSERT_ID() into usrId;

		insert into userdetails (userid, channelId, registrationDate, reg_device, is_active,signup_date)
		values (usrId, chanId, now(), 'w', 1,now());

		select LAST_INSERT_ID() into urId;
		select gid from usergroup where channelId = chanId and isDefault = 1 into groupId;
		insert into uidgid (uid, gid) VALUES (urId, groupId);
		SELECT rid FROM roles WHERE rolename = 'Admin' AND channelid = chanId INTO rlId;
		
		CALL diy_MakeAdminUser(urId, rlId, chanName);

		set returnType = 1;

	else
	
		set returnType = 2;
	
	end if;

	select returnType, urId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateUserInpoxforNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateUserInpoxforNotification`(in urId int,in notiId int,in chanId int,in mType text,in pushDateTime DATETIME)
BEGIN

if not exists(select * from userinbox where uid=urId and noti_id=notiId and channelid=chanId and createddate=pushDateTime) then

  INSERT INTO userinbox(uid, cid, channelid, createddate, modeType, noti_id)

  VALUES(urId, 0,chanId,pushDateTime,mType,notiId);

 end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_CreateUserViaExternalAuth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_CreateUserViaExternalAuth`(IN userName TEXT,

        IN userEmail TEXT, IN chanName TEXT, IN regVia VARCHAR(10),

        IN accessToken VARCHAR(1255), IN refreshToken TEXT,

        IN validTill INT, IN oauthProvider VARCHAR(255), IN groupName VARCHAR(255))
BEGIN

  DECLARE chanId, returnType, usrId, urId, grpId INT DEFAULT 0;



  START TRANSACTION;



  SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;



  IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN

    INSERT INTO userinfo (uname, udesg, uemail, uorg, upassword, usercode, is_verified, verify_via, is_external_auth)

    VALUES (userName, '', userEmail, '', '', userEmail, 1, regVia, 1);



    SELECT LAST_INSERT_ID() INTO usrId;



    INSERT INTO userdetails (userid, channelId, registrationDate, reg_device, is_active,signup_date)

    VALUES (usrId, chanId, NOW(), 'ExtAuth', 1, NOW());



    SELECT LAST_INSERT_ID() INTO urId;



    -- Insert into external auth

    INSERT INTO user_external_auth (userid, access_token, refresh_token, valid_till, create_date, oauth_provider, last_update)

    VALUES (usrId, accessToken, refreshToken, validTill, NOW(), oauthProvider, NOW());

    

    IF (groupName <> '') THEN

      IF EXISTS (SELECT * FROM usergroup WHERE gname = groupName AND channelid = chanId) THEN

        SELECT gid FROM usergroup WHERE gname = groupName AND channelid = chanId INTO grpId;

      ELSE

        INSERT INTO usergroup (gname, details, channelid, creationdate, isDefault)

        VALUES (groupName, '', chanId, NOW(), 0);

        

        SELECT LAST_INSERT_ID() INTO grpId;

      END IF;

      

      IF (grpId > 0 ) THEN

        INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);

      END IF;

    END IF;



    SET returnType = 1;

  ELSE

       

    -- User in another channel

    IF (chanId = 727) THEN

      -- If channel is DHQ Life. Add them

      SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;

      

      INSERT INTO userdetails (userid, channelId, registrationDate, reg_device, is_active,signup_date)

      VALUES (usrId, chanId, NOW(), 'ExtAuth', 1, NOW());

      

      SELECT LAST_INSERT_ID() INTO urId;

      

      SET returnType = 1;

    ELSE

      -- Else error response

 

      IF EXISTS (SELECT * FROM userinfo ui JOIN userdetails ud ON ui.userid = ud.userid WHERE ui.uemail = userEmail AND ud.channelid = chanId AND ui.is_verified =1 AND ud.is_active=0) THEN

		  	SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;

		    SELECT uid FROM userdetails ud WHERE userid = usrId AND channelid = chanId INTO urId;

            UPDATE userdetails SET is_active=1 WHERE uid = urId AND channelid = chanId;

             SET returnType = 1;

        ELSE

        

        SET returnType = -1;

      END IF;

    END IF;

    

  END IF;



  COMMIT;



  SELECT returnType, urId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_Create_subdomain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_Create_subdomain`( in sname text,in isbrand int,
in stitle text,in sdescrtion text, in sfevicon text, in sbackcolor text,in chanId int)
BEGIN
declare respstatus int default 0;
if not exists(select * from channelsubdomain where subdo_name=sname)Then
  if not exists(select * from channelsubdomain where channelid=chanId)Then
	insert into channelsubdomain(subdo_name, is_subdo_brand, subdo_backcolor, subdo_title, subdo_description, subdo_fevicon, channelid)
    values(sname,isbrand,sbackcolor,stitle,sdescrtion,sfevicon,chanId);
    set respstatus=1;
   else
    update channelsubdomain set
        subdo_name=sname,
        is_subdo_brand=isbrand,
        subdo_backcolor=sbackcolor,
        subdo_title=stitle,
        subdo_description=sdescrtion,
        subdo_fevicon=sfevicon where channelid=chanId;
      set respstatus=2;
  end if;
 else
  if  exists(select * from channelsubdomain where subdo_name=sname and channelid=chanId)Then
   update channelsubdomain set
        subdo_name=sname,
        is_subdo_brand=isbrand,
        subdo_backcolor=sbackcolor,
        subdo_title=stitle,
        subdo_description=sdescrtion,
        subdo_fevicon=sfevicon where channelid=chanId;
      set respstatus=2;
  end if;
End if;
 select respstatus;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_DeleteEmailConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_DeleteEmailConfig`(in chanId int)
BEGIN
  Delete from channel_email_config where channel_id=chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_DeleteGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_DeleteGroup`(IN chanId INT, IN grpId INT)
BEGIN



DELETE FROM usergroup WHERE gid = grpId AND channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_DeletePendingNotificationForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_DeletePendingNotificationForUser`(IN urId INT, IN chanId INT, IN lastFetchOn DATETIME)
BEGIN

DELETE FROM userpendingnotification WHERE uid = urId AND channelid = chanId AND noti_create_date < lastFetchOn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_delete_meta_info_sso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_delete_meta_info_sso`(in chanId int,in dName text,in providerId text)
BEGIN
	DECLARE respStatus INT DEFAULT 0;
	SET respStatus=0;
	IF EXISTS(SELECT * FROM channel_external_idp where channelid=chanId and idp_code=providerId) THEN
		DELETE FROM channel_external_idp where channelid=chanId and idp_code=providerId;
		SET respStatus=1;
	END IF;
	SELECT respStatus;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_delete_OauthSsoConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_delete_OauthSsoConfig`(in chanId int,in ssoId int,in domainName text)
BEGIN
 IF EXISTS(select * from channel_oauth_sso_config where oauth_id=ssoId and channel_id=chanId and oauth_restricted_domain= domainName)THEN
	DELETE FROM channel_oauth_sso_config  where oauth_id=ssoId and channel_id=chanId and oauth_restricted_domain= domainName;
 END IF;
 
 SELECT ssoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_delete_samlSsoConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_delete_samlSsoConfig`(in chanId int,in ssoId int,in domainName text)
BEGIN
 IF EXISTS(select * from sso_auth_config where id=ssoId and channel_id=chanId and domain_url= domainName)THEN
	DELETE FROM sso_auth_config  where id=ssoId and channel_id=chanId and domain_url= domainName;
 END IF;
 
 SELECT ssoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_EditCategoryTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_EditCategoryTemplate`(in templateId int, 
  in groupCollection text, in templateName text, IN chanId INT)
BEGIN

declare lastVal, counter, groupId ,retValue int default 0;

-- Make sure this template belongs to this channel
IF EXISTS (SELECT * FROM categorytemplate WHERE viewid = templateId AND channelid = chanId) THEN
  -- Make sure this name does not exists for a another template in this channel
  if not exists(select * from categorytemplate where viewid <> templateId and viewname = templateName AND channelid = chanId)then
	  update categorytemplate set viewname = templateName where viewid = templateId;
    delete FROM mapviewgrp where viewid = templateId;
    if (groupCollection <> '') then

      select substrcount(groupCollection, ',') + 1 into lastVal;
  
      repeat
        set counter = counter + 1;
        select strsplit(groupCollection, ',', counter) into groupId;
        -- Make sure this groupId belongs in this channel
        IF EXISTS (SELECT * FROM usergroup WHERE gid = groupId AND channelid = chanId) THEN
          insert INTO mapviewgrp VALUES (templateId, groupId);
        END IF;
  
      until counter = lastVal
      end repeat;
      set retValue = 0;
    end if;
  else
    set retValue = 1;
  end if;
END IF;
select retValue;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_EditGroup_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_EditGroup_v2`(in grpId int, in grpName text,in templateCollection text, IN chanId INT)
BEGIN



declare lastVal, counter, templateId ,retValue int default 0;

SET retValue = -2;



-- Make sure this group exists and belongs to this channel

IF EXISTS (SELECT * FROM usergroup WHERE gid = grpId AND channelid = chanId) THEN

  -- Make sure no other group has same name

  IF NOT EXISTS (SELECT * FROM usergroup WHERE gname = grpName AND gid <> grpId AND channelId = chanId) THEN

    update usergroup set gname = grpName where gid = grpId AND channelid = chanId;

    delete FROM mapviewgrp where gid = grpId;

    if (templateCollection <> '') then

      SELECT substrcount(templateCollection, ',') + 1 into lastVal;

        REPEAT

          SET counter = counter + 1;

          

          SELECT strsplit(templateCollection, ',', counter) into templateId;

          

          -- Make sure this template belongs in this channel

          IF EXISTS (SELECT * FROM categorytemplate WHERE channelid = chanId and viewid=templateId) THEN

            INSERT INTO mapviewgrp VALUES (templateId, grpId);

          END IF;

        UNTIL counter = lastVal

        end repeat;

    end if;

    set retValue = 0;

  ELSE

    SET retValue = -1;

  END IF;

END IF;

select retValue;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetAdmin`(IN urId INT, IN chanId INT)
BEGIN



  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND chanId = channelId) THEN

    SELECT 

      au.admin_id,

      au.is_super,

      GROUP_CONCAT(ava.viewid) AS tmpl_id_bunch

    FROM adminuser au

      JOIN userdetails ud ON ud.userid = au.userid AND ud.channelid = au.channelid

      LEFT JOIN admin_view_access ava ON ava.admin_id = au.admin_id

    WHERE ud.uid = urId AND ud.channelid = chanId

    GROUP BY au.admin_id;

  END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetAdminDetailAfterLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetAdminDetailAfterLogin`(IN urId INT)
BEGIN

DECLARE returnType INT DEFAULT 0;
DECLARE userName, userEmail, chanName, chanDispName TEXT DEFAULT '';
DECLARE usrId, rolId, chanId, adminId, isOwner, ownerId, isSuper,isCreator INT DEFAULT 0;
DECLARE lastLoginDt, signUpDate DATETIME;

IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND is_active = 1) THEN
	SELECT userid, channelid, registrationdate FROM userdetails WHERE uid = urId INTO usrId, chanId, signUpDate;
    
  SELECT COALESCE(admin_id, 0), last_login_time, roleid, is_super,is_creator
  FROM adminuser WHERE userid = usrId AND channelid = chanId
  INTO adminId, lastLoginDt, rolId, isSuper,isCreator;
  
	SELECT channelname, display_name FROM channel WHERE channelid = chanId INTO chanName, chanDispName;
	SELECT uemail, uname, is_owner FROM userinfo WHERE userid = usrId INTO userEmail, userName, isOwner;

  IF (adminId > 0) THEN
    IF(isOwner = 1) THEN
        SELECT ai.adminId, ai.invitedOn FROM admininvites ai WHERE emailId = userEmail INTO ownerId, signUpDate;
    END IF;
    -- Update last_login data
	  UPDATE adminuser SET last_login_time = NOW() WHERE admin_id = adminId;
  END IF;
  
	SET returnType = 1;
ELSE
	SET returnType = -1;
END IF;

SELECT returnType, userName, userEmail, chanName, chanId, usrId, adminId, rolId, lastLoginDt, signUpDate, isOwner, ownerId, chanDispName, isSuper,isCreator;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetAllGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetAllGroups`(IN chanId INT, IN filterType TEXT, IN filterValues TEXT)
BEGIN

DECLARE groupCount INT DEFAULT 0;

SELECT 
  fn_getUserGroupCount(chanId,filterType,filterValues) 
INTO groupCount;

IF(filterType = 'ALL') THEN
  SELECT ug.*, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount,
  (SELECT GROUP_CONCAT(CONCAT(ct.viewid, '`', ct.viewname)) from mapviewgrp mvg left join categorytemplate ct on ct.viewid = mvg.viewid where mvg.gid = udg.gid group by ug.gid) as catalogue_name
  FROM usergroup ug
    LEFT JOIN uidgid udg ON udg.gid = ug.gid 
    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1
  WHERE ug.channelid = chanId 
  GROUP BY ug.gid;
ELSE IF(filterType = 'GRP_IDS') THEN
  SELECT ug.*, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount,
  (SELECT GROUP_CONCAT(CONCAT(ct.viewid, '`', ct.viewname)) from mapviewgrp mvg left join categorytemplate ct on ct.viewid = mvg.viewid where mvg.gid = udg.gid group by ug.gid) as catalogue_name
  FROM usergroup ug
    LEFT JOIN uidgid udg ON udg.gid = ug.gid
    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1
  WHERE ug.channelid = chanId 
    AND FIND_IN_SET(ug.gid, filterValues)
  GROUP BY ug.gid;
ELSE IF (filterType = 'PUSH') THEN
    SELECT ug.*, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount
    FROM usergroup ug
      JOIN uidgid udg ON udg.gid = ug.gid
      JOIN userdetails ud ON udg.uid = ud.uid
    WHERE
      ug.channelid = chanId
      AND ud.is_active = 1
      AND ud.last_app_launch <> '0000-00-00 00:00:00'
    GROUP BY ug.gid
    HAVING usercount > 0;
ELSE IF(filterType = 'PUSH_GRP_IDS')THEN
  SELECT ug.*, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount
    FROM usergroup ug
      JOIN uidgid udg ON udg.gid = ug.gid
      JOIN userdetails ud ON udg.uid = ud.uid
    WHERE
      ug.channelid = chanId
      AND FIND_IN_SET(ug.gid, filterValues)
      AND ud.is_active = 1
      AND ud.last_app_launch <> '0000-00-00 00:00:00'
    GROUP BY ug.gid
    HAVING usercount > 0;
ELSE IF (filterType = 'ADMN') THEN
  SELECT *, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount
  FROM usergroup ug
    JOIN uidgid udg ON udg.gid = ug.gid
    JOIN mapviewgrp mvg ON mvg.gid = ug.gid
    JOIN admin_view_access ava ON ava.viewid = mvg.viewid
  WHERE ug.channelid = chanId
    AND ava.admin_id = filterValues
  GROUP BY ug.gid;
ELSE IF (filterType = 'CAT_IDS') THEN
  SELECT ug.*, COALESCE(COUNT(udg.uid), 0) AS usercount, groupCount,
  (SELECT GROUP_CONCAT(CONCAT(ct.viewid, '`', ct.viewname)) 
      FROM mapviewgrp mvg 
        LEFT JOIN categorytemplate ct on ct.viewid = mvg.viewid 
      WHERE mvg.gid = udg.gid AND FIND_IN_SET(ct.viewid, filterValues)
      GROUP BY ug.gid) as catalogue_name
  FROM usergroup ug
    LEFT JOIN uidgid udg ON udg.gid = ug.gid 
    LEFT JOIN userdetails ud ON udg.uid = ud.uid AND ud.is_active = 1
    JOIN mapviewgrp mavg ON mavg.gid = ug.gid
    JOIN categorytemplate cte on cte.viewid = mavg.viewid
  WHERE ug.channelid = chanId and FIND_IN_SET(cte.viewid, filterValues)
  GROUP BY ug.gid;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getAppDevicesOfUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getAppDevicesOfUser`(IN urId INT, IN chanName TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

SELECT ot.token_id,
  ot.app_id,
  oca.app_name,
   au.app_version,
  ot.device_id,
  di.devicetype,
  ot.create_date AS last_login,
  ot.last_access_date,
  di.deviceversion AS device_version,
  COALESCE(di.devicename, '') AS device_name,
  di.osversion AS os_version
FROM oauth_token ot
  JOIN oauth_client_app oca
    ON oca.oauth_app_id = ot.app_id
  LEFT JOIN deviceinfo di
    ON di.deviceid = ot.device_id
    left join appupgrade au on au.device_id=di.deviceid and au.uid=urId
WHERE ot.channelid = chanId
  AND ot.uid = urId
 -- AND di.devicetype <> 'webapp'
 GROUP BY ot.app_id, ot.device_id
ORDER BY ot.device_id, ot.app_id, ot.token_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetAppMetaAPIJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetAppMetaAPIJSON`(IN chanId INT)
BEGIN

IF EXISTS (SELECT * FROM channel WHERE channelid = chanId) THEN
	SELECT app_meta_json FROM appmetajson WHERE channelid = chanId AND is_valid = 1;
ELSE
	SELECT -1 as app_meta_json;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetCategoryFolderApiList_V2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetCategoryFolderApiList_V2`(IN folderId Int, IN chanId INT,IN urId INT)
BEGIN
DROP TEMPORARY TABLE IF EXISTS temp_fcatList;
CREATE TEMPORARY TABLE temp_fcatList
  (kbId INT, kbName VARCHAR(200), kbDesc VARCHAR(200), kbImage VARCHAR(200), kbIndexing INT, kbTileImg VARCHAR(200),
   kbModifiedDate DATETIME, kbNewIconDate DATETIME, kbGridXhdpi VARCHAR(200), kbGridHdpi VARCHAR(200), kbGridMdpi VARCHAR(200),
   kbGridLdpi VARCHAR(200), kbTitleXhdpi VARCHAR(200), kbTitleHdpi VARCHAR(200), kbTitleMdpi VARCHAR(200), kbTitleLdpi VARCHAR(200),
   kbType VARCHAR(10), kbActionButtonUrl VARCHAR(200),
   
   tPluginId INT, tPluginDesc VARCHAR(250), tPluginVerCode VARCHAR(15), tPluginVerType CHAR(5), tPluginWebURL VARCHAR(145),
   
   tPluginSize BIGINT, tPluginWhatsNew VARCHAR(200), tPluginCheckSum VARCHAR(145), tPluginUpdateOn DATETIME,
   
   tPluginThemeColor VARCHAR(10), tPluginStatusbarShow TINYINT(1), tPluginStatusbarColor VARCHAR(10),
   
   tPluginStatusbarStyle VARCHAR(10), tPluginHideCloseButton TINYINT(1), tPluginAllowTextCopy TINYINT(1), tPluginAllowScreenShot TINYINT(1),
   tPluginInstallType VARCHAR(9), tSupportEmail VARCHAR(150), tSupportPhone VARCHAR(150), tAvgRat FLOAT, tTotalRat INT, tMyRat INT,
   tMyFavItIs INT, tPluginType VARCHAR(5), downloadUrlNA VARCHAR(1000), tUniversalLink VARCHAR(450),
   
   tIsHidden TINYINT(1),
   tPluginIsPhonePortrait TINYINT(1), tPluginIsPhoneLandscape TINYINT(1), 
   tPluginIsTabletPortrait TINYINT(1), tPluginIsTabletLandscape TINYINT(1),
   tBackgroundUpgradeOnly TINYINT(1),
   
   tAppCustomViewCode VARCHAR(200), 
   tIsDraft INT, tPluginIsActive INT,
   tPluginAllowHttp TINYINT(1),
   on_ios_mobile TINYINT(1),on_ios_tablet TINYINT(1),
   on_android_mobile TINYINT(1), on_android_tablet TINYINT(1), on_web_browser TINYINT(1),
   on_windows_mobile TINYINT(1), on_windows_tablet TINYINT(1), on_windows_desktop TINYINT(1),
   
   win_registry_key VARCHAR(250), win_registry_location VARCHAR(250),android_package_name VARCHAR(145),
   min_width INT,max_width INT,min_width_msg VARCHAR(250),
   
   ios_bottombar_color VARCHAR(20),android_bottombar_color VARCHAR(20),
   is_phone_landscape_notch TINYINT(1), status_bar_text_visibility TINYINT(1), 
   
   statusbar_visibility TINYINT(1),status_bar_gradient_color VARCHAR(20),plugin_statusbar_bgcolor VARCHAR(20),
   bottom_bar_visibility TINYINT(1),
   bottom_bar_gradient TINYINT(1),bottom_bar_color_left VARCHAR(20),bottom_bar_color_right VARCHAR(20),
    tEnableLogging TINYINT(1), tLoggingWithScreenShot TINYINT(1),
   tPlugin_al_env_type varchar(100), tPlugin_al_url VARCHAR(200), tPlugin_al_version VARCHAR(200), tPlugin_al_modifydate VARCHAR(200), tPlugin_al_checksum VARCHAR(200),tPlugin_al_versiontpye VARCHAR(200),tPlugin_al_size VARCHAR(200)
  )ENGINE=MEMORY;
DROP TEMPORARY TABLE IF EXISTS temp_fenvs;
CREATE TEMPORARY TABLE temp_fenvs (tePluginId INT, teEnvironment VARCHAR(5), tePlugin_url varchar(999), tePluginVerCode VARCHAR(15), tePluginVerType CHAR(5), tePluginWebURL VARCHAR(145),
   tePluginSize BIGINT,  tePluginCheckSum VARCHAR(145), tePluginUpdateOn DATETIME)ENGINE=MEMORY;
   
-- IF EXISTS(select * from plugin_app_environment_users where uid= urId)THEN
-- INSERT INTO temp_envs
-- select pu.plugin_id,pu.environment,pav1.plugin_url,pav1.version_code,pav1.update_type,pav1.plugin_web_url,pav1.package_size,pav1.package_checksum,pav1.update_on from plugin_app_environment_users pu 
-- JOIN plugin_app pac ON pac.plugin_id = pu.plugin_id 
-- JOIN plugin_app_version pav1  
       -- ON ((pav1.plugin_ver_id = pac.dev_version AND pu.environment='dev' AND pac.dev_version > 0)
         --  OR (pav1.plugin_ver_id = pac.beta_version AND pu.environment='beta' and pac.beta_version > 0))
--  where pu.uid = urId and pac.channelId = chanId;
-- END IF;
INSERT INTO temp_fcatList
  SELECT
    c.catId, c.catName, catDescp, catImg, f.order_index, cat_tile_Img,
    IF(Modify_date='0000-00-00 00:00:00',NOW(),Modify_date) as Modify_date,
    add_new_con_date, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, tile_xhdpi,
    tile_hdpi, tile_mdpi, tile_ldpi, 'c', '', 0, '', '', '', '',
    0, '', '', '0000-00-00 00:00:00', '', 1, '', '', 1, 1, 1,
    '', '', '', COALESCE(AVG(uri.rating), 0), COUNT(uri.rating), COALESCE(uri1.rating, 0),
    COALESCE(ufi.uid, 0) ,'', '', '',
    c.is_hidden,1,1,1,1,0,'',
    0,0,0,1,1,1,1,1,
    1,1,1,
    '','','',0,0,'','','',1,1,1,'','',1,1,'','',1,0,
    '','','','0000-00-00 00:00:00','','',''
    FROM category c
    Join folderstructure f on f.mapid=c.catId
    LEFT JOIN user_rating_icon uri ON uri.icon_id = c.catId
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = c.catId AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = c.catId AND ufi.icon_type = 'c' AND ufi.uid = urId
    WHERE
      c.channelId = chanId
      AND c.searchable = true
      AND f.catType='c'
      AND f.actionId=folderId
     GROUP BY c.catId;

INSERT INTO temp_fcatList
  SELECT
      abid, title, `action`, image, f.order_index, a.action_tile_img,
      IF(modify_date='0000-00-00 00:00:00',NOW(),modify_date),
      '0000-00-00 00:00:00', grid_xhdpi, grid_hdpi, grid_mdpi,
       grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi,
       'a', a.url, COALESCE(ptm.plugin_id, 0), pa.plugin_desc,
  	  pav.version_code, pav.update_type, pav.plugin_web_url,
  	  pav.package_size, pav.whats_new, pav.package_checksum,
  	  COALESCE(pav.update_on,NOW()), pa.plugin_theme_color, pa.plugin_statusbar,
  	  pa.plugin_statusbar_bgcolor, pa.plugin_statusbar_style, pa.plugin_hide_close_btn,
      COALESCE(pas.plugin_allow_text_copy, 1), COALESCE(pas.plugin_allow_screen_shot, 1),
      pa.plugin_install_type, COALESCE(pas.support_email, ''), COALESCE(pas.support_phone, ''),
      COALESCE(AVG(par.rating), 0), COUNT(par.rating), COALESCE(par1.rating, 0),
      COALESCE(ufi.uid, 0), pa.plugin_type, pav.download_url_na,
      COALESCE(CONCAT(paul.absolute_url, paul.relative_url), ''),
      
      COALESCE(pas.is_hidden, 0),
	  pas.is_phone_portrait, pas.is_phone_landscape, 
      
      pas.is_tablet_portrait, pas.is_tablet_landscape,
	  COALESCE(pav.background_upgrade_only,0),
      COALESCE(acv.view_code, ''), COALESCE(pa.is_draft, 0),COALESCE(pa.is_active, 1), COALESCE(pas.allow_http,0),
	  COALESCE(pas.on_ios_mobile,1), COALESCE(pas.on_ios_tablet,1), COALESCE(pas.on_android_mobile,1),
	  COALESCE(pas.on_android_tablet,1), COALESCE(pas.on_web_browser,1),
      COALESCE(pas.on_windows_mobile,1), COALESCE(pas.on_windows_tablet,1), COALESCE(pas.on_windows_desktop,1),
      
      paul.win_registry_key, paul.win_registry_location,
      paul.android_package_name,pas.app_min_width,
      pas.app_max_width,pas.app_min_width_msg,
      
      COALESCE(pas.ios_bottombar_color,''),COALESCE(pas.android_bottombar_color,''),COALESCE(pas.is_phone_landscape_notch,0),
      
	  IF(COALESCE(pa.plugin_statusbar_style, '')='', 0, 1),
      IF(COALESCE(pa.plugin_statusbar_bgcolor, '')='', 0, 1),
      IF(COALESCE(pa.plugin_statusbar_bgcolor, '')=SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', -1)),SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1),
      IF(COALESCE(pas.ios_bottombar_color, '')='', 0, 1),
      IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), 0, 1),SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1),
      IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', -1)),
		 COALESCE(pas.enable_logging, 1),
        COALESCE(pas.logging_with_screenshot, 0),
          COALESCE(  group_concat(tep.teEnvironment),''),
        COALESCE(  group_concat(tep.tePlugin_url),''),
        COALESCE(  group_concat(tep.tePluginVerCode ),''),
        COALESCE(  group_concat(tep.tePluginUpdateOn ),Now()),
         COALESCE( group_concat(tep.tePluginCheckSum ),''),
        COALESCE(  group_concat(tep.tePluginVerType ),''),
        COALESCE( group_concat(tep.tePluginSize ),'')
    FROM actionbutton a
    Join folderstructure f on f.mapid=a.abid
    LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid
  	LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id AND pa.is_active = 1
    LEFT JOIN temp_fenvs tep ON tep.tePluginId = pa.plugin_id 
  	LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN plugin_app_rating par ON pa.plugin_id = par.plugin_id
    LEFT JOIN plugin_app_rating par1 ON pa.plugin_id = par1.plugin_id AND par1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    LEFT JOIN app_custom_view acv ON acv.plugin_id = pa.plugin_id
    WHERE
      a.channelId = chanId
      AND a.searchable = true
      AND f.catType='a'
      AND f.actionId=folderId
      GROUP BY a.abid;


SELECT * FROM temp_fcatList ORDER BY  kbIndexing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getChanLicenseInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getChanLicenseInfo`(in chanId int)
BEGIN
select channelid, dcr(noitarud) as duration, dcr(tratsfoetad) as dateofstart, 
 dcr(yeklac) as calkey, dcr(yekdis) as sidkey,
 planname, dcr(tnuocresu) as usercount, tnuocyreviled, dcr(ecapsksid) as diskspace, tnuochsup, abr, 
 lebaletihw, yripxec,  dcr(etadrrucer) recurrdate, ppsubId, tnuocmcb, tnuocgetac, fin_status, grace_duration from saaslicense where channelid=chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelDetails`(in chanName text)
BEGIN



SELECT * 

FROM   channel ch 

       INNER JOIN channelrights chr 

               ON chr.channelid = ch.channelid 

       INNER JOIN channeltype cht 

               ON cht.chantype = chr.chantype 

       INNER JOIN channeltimezone chtz 

               ON chtz.channelid = chr.channelid

       LEFT JOIN channelapplinks app

               ON ch.channelid = app.channelid

       LEFT JOIN applinks ap

               ON app.appid = ap.appid

WHERE  ch.channelname = channame; 



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelDetailsFromId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelDetailsFromId`(in chanId int)
BEGIN



select * from channel ch

inner join channelrights chr on chr.channelid=ch.channelid

inner join channeltype cht on cht.chantype=chr.chantype

inner join channeltimezone chtz on chtz.channelid=chr.channelid where ch.channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_getChannelGlobalToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_getChannelGlobalToken`(IN chanId INT)
BEGIN

SELECT c.channelid, p.tokenkey, p.token_id, p.token_type, p.plugin_id

FROM channel c

LEFT JOIN plugin_token p

  ON p.channelid = c.channelid AND p.token_type = 'G'

WHERE c.channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelIdPForDomain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelIdPForDomain`(IN domainName TEXT)
BEGIN
    IF EXISTS (SELECT * FROM channel_external_idp WHERE domain_name = domainName) THEN
        SELECT 
            cei.channelid,
            cei.idp_type,
            cei.login_url,
            cei.callback_url,
            cei.idp_code,
            cei.access_type,
            c.channelname
        FROM
            channel_external_idp cei
            JOIN channel c ON cei.channelid = c.channelid
        WHERE domain_name = domainName LIMIT 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelIdPForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelIdPForUser`(IN chanName TEXT, IN urId INT)
BEGIN

  DECLARE chanId, isExtAuth INT;
  DECLARE authType CHAR(4) DEFAULT '';
  DECLARE loginUrl, callbackUrl, accessType VARCHAR(450) DEFAULT '';    
  
  IF EXISTS (SELECT channelid FROM channel WHERE channelname = chanName) THEN
      SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
      SET isExtAuth = -1;

      IF (urId > 0) THEN
          -- Check if this user is via IdP or not
          -- If not, then we will DHQ login only
          SELECT is_external_auth FROM userinfo ui
              JOIN userdetails ud ON ui.userid = ud.userid
          WHERE ud.uid = urId INTO isExtAuth;
      END IF;
      
      IF (isExtAuth = 0) THEN
          SET authType = 'DHQ';
      ELSE
          -- Check if this channel is via External IdP
          IF EXISTS (SELECT * FROM channel_external_idp WHERE channelid = chanId) THEN
              SET authType = 'EIDP';

              SELECT login_url, callback_url, access_type 
              FROM channel_external_idp WHERE channelid = chanId
              INTO loginUrl, callbackUrl, accessType;

              -- Check the if this IdP has open access or not
              IF (accessType = 'R') THEN
                  -- If urId > 0 then it means the user is already part of the team.
                  IF (urId = 0) THEN
                      SET authType = '';
                  END IF;
              END IF;
          ELSE
              SET authType = 'DHQ';
          END IF;
      END IF;        
  END IF;

  SELECT authType, loginUrl, callbackUrl, accessType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelIdPForUser_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelIdPForUser_v2`(IN chanName TEXT, IN urId INT)
BEGIN

  DECLARE chanId, isExtAuth INT;
  DECLARE authType CHAR(4) DEFAULT '';
 -- DECLARE loginUrl, callbackUrl, accessType VARCHAR(450) DEFAULT '';    
  DROP TEMPORARY TABLE IF EXISTS temp_idp_sso;
  CREATE TEMPORARY TABLE temp_idp_sso (authType VARCHAR(450),nameIdp VARCHAR(450), loginUrl VARCHAR(450),callbackUrl VARCHAR(450),accessType VARCHAR(450));
  IF EXISTS (SELECT channelid FROM channel WHERE channelname = chanName) THEN
      SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
      SET isExtAuth = -1;

      IF (urId > 0) THEN
          -- Check if this user is via IdP or not
          -- If not, then we will DHQ login only
          SELECT is_external_auth FROM userinfo ui
              JOIN userdetails ud ON ui.userid = ud.userid
          WHERE ud.uid = urId INTO isExtAuth;
      END IF;
      
      IF (isExtAuth = 0) THEN
          SET authType = 'DHQ';
          insert  into temp_idp_sso
          select authType,'','','','';
      ELSE
          -- Check if this channel is via External IdP
          IF EXISTS (SELECT * FROM channel_external_idp WHERE channelid = chanId) THEN
              -- SET authType = 'EIDP';
              insert  into temp_idp_sso
              SELECT 'EIDP', idp_type, login_url, callback_url, access_type 
              FROM channel_external_idp WHERE channelid = chanId;
             --  INTO loginUrl, callbackUrl, accessType;

              -- Check the if this IdP has open access or not
             --  IF (accessType = 'R') THEN
                  -- If urId > 0 then it means the user is already part of the team.
                 --  IF (urId = 0) THEN
                     -- SET authType = '';
                 -- END IF;
             --  END IF;
          ELSE
              SET authType = 'DHQ';
               insert into temp_idp_sso
               select authType,'','','','';
          END IF;
      END IF;        
  END IF;

 -- SELECT authType, loginUrl, callbackUrl, accessType;
 select * from temp_idp_sso;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelIdPForUser_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelIdPForUser_v3`(IN chanName TEXT, IN urId INT,in domain Text)
BEGIN

DECLARE chanId, isExtAuth INT;
  DECLARE authType CHAR(4) DEFAULT '';
 -- DECLARE loginUrl, callbackUrl, accessType VARCHAR(450) DEFAULT '';
  DROP TEMPORARY TABLE IF EXISTS temp_idp_sso;
  CREATE TEMPORARY TABLE temp_idp_sso (authType VARCHAR(450),nameIdp VARCHAR(450), loginUrl VARCHAR(450),callbackUrl VARCHAR(450),accessType VARCHAR(450));
  IF EXISTS (SELECT channelid FROM channel WHERE channelname = chanName) THEN
       SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
       SET isExtAuth = -1;
      IF (urId > 0) THEN
          -- Check if this user is via IdP or not
          -- If not, then we will DHQ login only
          SELECT is_external_auth FROM userinfo ui
              JOIN userdetails ud ON ui.userid = ud.userid
          WHERE ud.uid = urId INTO isExtAuth;
      END IF;
      IF (isExtAuth = 0) THEN
          SET authType = 'DHQ';
          insert  into temp_idp_sso
          select authType,'','','','';
      ELSE
          -- Check if this channel is via External IdP
          IF EXISTS (SELECT * FROM channel_external_idp WHERE channelid = chanId) THEN
              -- SET authType = 'EIDP';
              insert  into temp_idp_sso
              SELECT 'EIDP', idp_type, login_url, callback_url, access_type
              FROM channel_external_idp WHERE channelid = chanId and FIND_IN_SET(domain,domain_name);
             --  INTO loginUrl, callbackUrl, accessType;
              -- Check the if this IdP has open access or not
             --  IF (accessType = 'R') THEN
                  -- If urId > 0 then it means the user is already part of the team.
                 --  IF (urId = 0) THEN
                     -- SET authType = '';
                 -- END IF;
             --  END IF;
          ELSE
              SET authType = 'DHQ';
               insert into temp_idp_sso
               select authType,'','','','';
          END IF;
      END IF;
  END IF;
 -- SELECT authType, loginUrl, callbackUrl, accessType;
 select * from temp_idp_sso;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getChannelProgress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getChannelProgress`(IN chan_name TEXT,IN userId INT)
BEGIN

	DECLARE chanId, userCount INT;

	DECLARE app_branding,invite_user,download_app,cont_create,push_content TEXT default '0';

	SELECT channelid FROM channel WHERE channelname = chan_name INTO chanId;



	SELECT COUNT(uid) FROM userdetails WHERE channelid = chanId INTO userCount;

  IF (userCount > 1) THEN

		SET invite_user = '1'; 

	END IF;



		SET app_branding = '1'; 

	IF EXISTS(SELECT * FROM userdevice ud JOIN userdetails uds ON uds.userid = ud.userid 

            WHERE uds.uid = userId) THEN 

		SET download_app = '1';

	END IF;

			

	SET cont_create = '1'; 

	

	IF EXISTS(SELECT * FROM contentprioritypush WHERE channelid = chanId) THEN 

		SET push_content = '1'; 

	END IF;



SELECT app_branding,invite_user,download_app,cont_create,push_content;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_GetChannelSecuritySetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_GetChannelSecuritySetting`(IN chanId INT)
BEGIN

IF EXISTS(SELECT * FROM channel WHERE channelid = chanId) THEN
  SELECT c.channelid,
   cs.device_limit,
   COALESCE(cs.allow_rooted_device, 1) AS allow_rooted_device,
   COALESCE(cs.disable_screenshot, 0) AS disable_screenshot,
   COALESCE(cs.mpin_enabled, 0) AS mpin_enabled,
   COALESCE(cs.mpin_timeout_interval, 0) AS mpin_timeout_interval,
   COALESCE(cs.biometric_enabled, 0) AS biometric_enabled,
   cs.biological_characteristics,
   COALESCE(SUM(IF(di.is_rooted = 1, 1, 0)), 0) AS rooted_device_count,
   cs.refresh_expires_in
  FROM channel c
  LEFT JOIN userdetails ud
    ON ud.channelid = c.channelid
  LEFT JOIN userinfo ui
    ON ui.userid = ud.userid
  LEFT JOIN userdevice udev
    ON udev.userid = ui.userid
  LEFT JOIN deviceinfo di
    ON di.deviceid = udev.deviceid
  LEFT JOIN channel_setting cs
    ON c.channelid = cs.channelid
  WHERE c.channelid = chanId;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetChannelSetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetChannelSetting`(IN chanId INT)
BEGIN

  SELECT device_limit,
  allow_rooted_device, 
  user_profile_readonly, 
  valid_console_ip, 
  disable_screenshot, 
	mpin_enabled,
	mpin_timeout_interval,
	biometric_enabled,
	biological_characteristics,
	enable_logging,
 		logging_with_screenshot
  FROM channel_setting
    WHERE channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetConsumeapps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetConsumeapps`(in chanId Int)
BEGIN
select count(*)as totalConsume from plugin_app where plugin_type='ZP' and channelid=chanId and is_active=1 and is_draft=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetContentForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetContentForUser`(IN urId INT, IN chanId INT)
BEGIN

DECLARE nowDate DATETIME;

SELECT NOW() INTO nowDate;

DROP TEMPORARY TABLE IF EXISTS tempPendingContent;
CREATE TEMPORARY TABLE tempPendingContent(tCid INT, tContFrom VARCHAR(250), tContType VARCHAR(45), tContMode VARCHAR(250), tExpectDate DATETIME,
INDEX my_index_PendingContentid (tCid,tExpectDate))ENGINE=MEMORY;

INSERT INTO tempPendingContent
  SELECT upc.cid, upc.content_from, ast.conttype, upc.content_mode, expected_date
  FROM userpendingcontent upc
    JOIN assets ast ON upc.cid = ast.cid
  WHERE upc.uid = urId AND upc.channelid = chanId 
    AND upc.expected_date <= nowDate AND upc.content_state = 1
    AND ast.isDeleted = 0;

IF EXISTS (SELECT * FROM tempPendingContent) THEN
  -- Insert into inbox
  INSERT INTO userinbox(uid, cid, channelid, createddate, modeType, noti_id)
    SELECT urId, tCid, chanId, tExpectDate, tContMode, 0 FROM tempPendingContent;
  
  -- Delete from pending
  DELETE FROM userpendingcontent WHERE uid = urId AND channelid = chanId AND expected_date <= nowDate AND content_state = 1;
END IF;

-- Select pending contents
SELECT 
  tCid AS cid,
  tContFrom AS content_from,
  tContMode AS content_mode,
  tExpectDate AS expected_date,
  tContType AS conttype
FROM tempPendingContent ORDER BY tExpectDate DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetContentInboxV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetContentInboxV3`(in userid int,in chanId int,IN max_id INT, IN conLimit INT,IN search_text TEXT,IN filter_type TEXT)
BEGIN

SELECT 
    uib . *,
    Coalesce(cv.counts, 0) AS view_count,
    ast.conttype AS cont_type,
	cm.title,cm.desc
	
FROM
    userinbox uib
        LEFT JOIN
    usernotification un ON un.noti_id = uib.noti_id  
        LEFT JOIN
    contentviewed cv ON (cv.uid = uib.uid
        AND (cv.cid = uib.cid OR cv.cid = un.cid))
        JOIN
    assets ast ON (ast.cid = uib.cid OR ast.cid = un.cid) 
		LEFT JOIN
	contentmeta cm ON cm.mid = ast.mid 
       
WHERE
		uib.uid = userid
        AND uib.channelid = chanid
        AND (((max_id > 0) AND (inbox_id < max_id)) OR (max_id = 0)) 
        AND	((search_text = '') OR ((search_text <> '') AND cm.title LIKE CONCAT('%', search_text ,'%')) OR (cm.desc LIKE CONCAT('%', search_text ,'%')))
		AND ((filter_type = '') OR (ast.conttype=filter_type))
		
ORDER BY inbox_id DESC
LIMIT conlimit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetDefaultAppID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetDefaultAppID`()
BEGIN

SELECT appid FROM applinks where isdefault=1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getEmailConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getEmailConfig`(in chanId int ,in contype text)
BEGIN
      select * from channel_email_config where channel_id=chanId and config_type= contype;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetEmailTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetEmailTemplate`(IN chanName TEXT, IN mailContext TEXT)
BEGIN



    DECLARE chanId INT DEFAULT 0;



    SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;



    IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = mailContext) THEN

        SELECT email_body, is_html, email_subject, email_from_name, 1 AS is_custom

            FROM emailtemplatecustom

            WHERE channelid = chanId AND email_context = mailContext;

    ELSE

        SELECT et.emailsubject, et.emailhtmlbody, 0 AS is_custom

            FROM emailtemplate et WHERE emailcontext = mailContext;

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetFormBuilder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetFormBuilder`(in frmId int)
BEGIN

select * from formbuilder where formid = frmId AND is_deleted = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetGroup`(IN groupId INT, IN chanId INT, IN pluginId INT)
BEGIN

IF(pluginId = 0)THEN

  SELECT g.*

  FROM usergroup g

  WHERE g.channelid = chanId AND g.gid = groupId;

ELSE

  SELECT g.*

  FROM usergroup g

    JOIN mapviewgrp mvg

      ON g.gid = mvg.gid

    JOIN plugin_template_map ptm

      ON ptm.template_id = mvg.viewid

  WHERE mvg.gid = groupId AND g.channelid = chanId  AND ptm.plugin_id = pluginId;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetGroupIdFromName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetGroupIdFromName`(IN groupName TEXT, IN chanId INT)
BEGIN



SELECT * 

FROM   usergroup 

WHERE  gname = groupName 

       AND channelId = chanId; 



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetGroupsOfTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetGroupsOfTemplate`(IN urId INT)
BEGIN

DECLARE usrId, adminId INT;



SELECT userid FROM userdetails WHERE uid = urId INTO usrId;



IF EXISTS(SELECT * FROM adminuser WHERE userid = usrId AND is_super = FALSE) THEN



  SELECT admin_id FROM adminuser WHERE userid = usrId  AND is_super = FALSE INTO adminId;



  SELECT DISTINCT( gid ) 

  FROM   mapviewgrp 

  WHERE  viewid IN (SELECT av.viewid 

                    FROM   admin_view_access  av

                    WHERE  av.admin_id = adminId); 



END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetHomescreenIcon_ForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetHomescreenIcon_ForUser`(IN urId INT, IN chanId INT)
BEGIN

DECLARE defaultTemplate INT;

DROP TEMPORARY TABLE IF EXISTS temp_viewIds;
CREATE TEMPORARY TABLE temp_viewIds (tids INT, tViewRank INT);

SELECT viewid FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE INTO defaultTemplate;
INSERT INTO temp_viewIds 
  SELECT viewid, dispindex FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE;

IF EXISTS (SELECT * FROM uidgid WHERE uid = urId) THEN

  INSERT INTO temp_viewIds
    SELECT ct.viewid, ct.dispindex FROM mapviewgrp mvg
      LEFT JOIN categorytemplate ct on mvg.viewid=ct.viewid
      WHERE gid IN (SELECT gid FROM uidgid u WHERE uid = urId)
        AND ct.viewid <> defaultTemplate
      ORDER BY dispindex;

END IF;

DROP TEMPORARY TABLE IF EXISTS temp_catList;
CREATE TEMPORARY TABLE temp_catList
  (kbId INT, kbName VARCHAR(200), kbDesc VARCHAR(200), kbImage VARCHAR(200), kbIndexing INT, kbTileImg VARCHAR(200),
   kbModifiedDate DATETIME, kbNewIconDate DATETIME, kbGridXhdpi VARCHAR(200), kbGridHdpi VARCHAR(200), kbGridMdpi VARCHAR(200),
   kbGridLdpi VARCHAR(200), kbTitleXhdpi VARCHAR(200), kbTitleHdpi VARCHAR(200), kbTitleMdpi VARCHAR(200), kbTitleLdpi VARCHAR(200),
   kbType VARCHAR(10), kbActionButtonUrl VARCHAR(999), tViewRank INT,
   tPluginId INT, tPluginDesc VARCHAR(250), tPluginVerCode VARCHAR(15), tPluginVerType CHAR(5), tPluginWebURL VARCHAR(145),
   tPluginSize BIGINT, tPluginWhatsNew VARCHAR(450), tPluginCheckSum VARCHAR(145), tPluginUpdateOn DATETIME,
   tPluginThemeColor VARCHAR(10), tPluginStatusbarShow TINYINT(1), tPluginStatusbarColor VARCHAR(10),
   tPluginStatusbarStyle VARCHAR(10), tPluginHideCloseButton TINYINT(1), tPluginAllowTextCopy TINYINT(1), tPluginAllowScreenShot TINYINT(1),
   tPluginInstallType VARCHAR(9), tSupportEmail VARCHAR(150), tSupportPhone VARCHAR(150), tAvgRat FLOAT, tTotalRat INT, tMyRat INT,
   tMyFavItIs INT, tPluginType VARCHAR(5), downloadUrlNA  VARCHAR(450), tUniversalLink VARCHAR(450), tAppCustomViewCode VARCHAR(450),
   tViewId INT,
   win_registry_key VARCHAR(250), win_registry_location VARCHAR(250),android_package_name VARCHAR(145),min_width INT,max_width INT,min_width_msg VARCHAR(250)
  );

INSERT INTO temp_catList
  SELECT
    c.catId, c.catName, catDescp, catImg, indexing, cat_tile_Img,
    IF(Modify_date='0000-00-00 00:00:00',NOW(),Modify_date) as Modify_date,
    add_new_con_date, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, tile_xhdpi,
    tile_hdpi, tile_mdpi, tile_ldpi, 'c', '', tv.tViewRank, 0, '', '', '', '', 0,
	  '', '', '0000-00-00 00:00:00', '', 1, '', '', 0, 1, 1, '', '', '', 
	  COALESCE(AVG(uri.rating), 0), COUNT(uri.rating), COALESCE(uri1.rating, 0),
    COALESCE(ufi.uid, 0), '', '', '', '', tv.tids,
    '', '','',0,0,''
    FROM category c
    JOIN mapviewcat mc on c.catid = mc.catid
    JOIN temp_viewIds tv on tv.tids = mc.viewid
    LEFT JOIN user_rating_icon uri ON uri.icon_id = c.catid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = c.catid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = c.catid AND ufi.icon_type = 'c' AND ufi.uid = urId
    WHERE
      c.channelId = chanId
      AND searchable = true
      AND mc.`type` = 'c'
    GROUP BY c.catId;


INSERT INTO temp_catList
  SELECT
    abid, title, `action`, image, a.dispindex, a.action_tile_img,
    IF(modify_date='0000-00-00 00:00:00',NOW(),modify_date),
    '0000-00-00 00:00:00', grid_xhdpi, grid_hdpi, grid_mdpi,
    grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi,
    'a', a.url, tv.tViewRank, COALESCE(ptm.plugin_id, 0), pa.plugin_desc, 
	  pav.version_code, pav.update_type, pav.plugin_web_url, 
	  pav.package_size, pav.whats_new, pav.package_checksum, 
	  COALESCE(pav.update_on,NOW()), pa.plugin_theme_color, pa.plugin_statusbar,
	  pa.plugin_statusbar_bgcolor, pa.plugin_statusbar_style, pa.plugin_hide_close_btn,
    COALESCE(pas.plugin_allow_text_copy, 1), COALESCE(pas.plugin_allow_screen_shot, 1),
    pa.plugin_install_type, COALESCE(pas.support_email, ''), COALESCE(pas.support_phone, ''),
    COALESCE(AVG(uri.rating), 0), COUNT(uri.rating), COALESCE(uri1.rating, 0),
    COALESCE(ufi.uid, 0), pa.plugin_type, pav.download_url_na,
    COALESCE(CONCAT(paul.absolute_url, paul.relative_url), ''),
    COALESCE(acv.view_code, ''), tv.tids,
    paul.win_registry_key, paul.win_registry_location,paul.android_package_name,pas.app_min_width,pas.app_max_width,pas.app_min_width_msg
  FROM actionbutton a
    join mapviewcat mc on a.abid = mc.catid
    join temp_viewIds tv on tv.tids = mc.viewid
  	LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid
  	LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id AND pa.is_active = 1
  	LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN app_custom_view acv ON acv.plugin_id = pa.plugin_id
  WHERE a.channelId = chanId and mc.`type` = 'a' AND searchable = true
  GROUP BY a.abid;

INSERT INTO temp_catList
  SELECT
      abid, title, `action`, image, a.dispindex, a.action_tile_img,
      IF(modify_date='0000-00-00 00:00:00',NOW(),modify_date),
      '0000-00-00 00:00:00', grid_xhdpi, grid_hdpi, grid_mdpi,
       grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi,
       'f', a.url, tv.tViewRank, 0, '', '', '', '', 0,
  	  '', '', '0000-00-00 00:00:00', '', 1, '', '', 0, 1, 1, '', '', '',
  	  0, 0, 0, COALESCE(ufi.uid, 0), '', '', '', '', tv.tids,
  	  '', '','',0,0,''
    FROM actionbutton a
    join mapviewcat mc on a.abid = mc.catid
    join temp_viewIds tv on tv.tids = mc.viewid
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    WHERE a.channelId = chanId and mc.`type` = 'f' AND searchable = true;

SELECT * FROM temp_catList ORDER BY tViewRank, kbIndexing;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetHomescreenIcon_ForUserV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetHomescreenIcon_ForUserV3`(IN urId INT, IN chanId INT)
BEGIN
    DECLARE  defaultTemplate INT;

    DROP TEMPORARY TABLE IF EXISTS temp_viewIds_1;
    CREATE TEMPORARY TABLE temp_viewIds_1 (tids INT, tViewRank INT ,INDEX my_index_tempid (tids,tViewRank)) ENGINE = MEMORY;

    SELECT viewid FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE INTO defaultTemplate;
    INSERT INTO temp_viewIds_1
    SELECT viewid, dispindex FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE;

    IF EXISTS (SELECT uid FROM uidgid WHERE uid = urId) THEN
        INSERT INTO temp_viewIds_1
            SELECT ct.* FROM (SELECT mvg.viewid,mvg.gid FROM mapviewgrp mvg WHERE EXISTS(SELECT 1 FROM uidgid u WHERE u.uid = urId AND u.gid=mvg.gid)) mvg
            LEFT JOIN (SELECT ct.viewid, ct.dispindex FROM categorytemplate ct WHERE ct.viewid <> defaultTemplate)ct ON mvg.viewid=ct.viewid;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_envs;
    CREATE TEMPORARY TABLE temp_envs
    (teUserId int, tePluginId INT, teEnvironment VARCHAR(5), tePlugin_url varchar(999), tePluginVerCode VARCHAR(15),
    tePluginVerType CHAR(5), tePluginWebURL VARCHAR(145),
    tePluginSize BIGINT,  tePluginCheckSum VARCHAR(145), tePluginUpdateOn DATETIME,INDEX my_index_temp_envsid (tePluginId,teEnvironment,tePluginVerCode)) ENGINE = MEMORY;
    
    IF EXISTS(select * from plugin_app_environment_users where uid= urId)THEN
        INSERT INTO temp_envs
            select pu.uid, pu.plugin_id,pu.environment,pav1.plugin_url,pav1.version_code,pav1.update_type,pav1.plugin_web_url,pav1.package_size,pav1.package_checksum,pav1.update_on from plugin_app_environment_users pu
            JOIN plugin_app pac ON pac.plugin_id = pu.plugin_id
            JOIN plugin_app_version pav1 ON ((pav1.plugin_ver_id = pac.dev_version AND pu.environment='dev' AND pac.dev_version > 0) OR (pav1.plugin_ver_id = pac.beta_version AND pu.environment='beta' and pac.beta_version > 0))
        where pu.uid = urId and pac.channelId = chanId;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_catList1;
    CREATE TEMPORARY TABLE temp_catList1
        (kbId INT, kbName VARCHAR(200), kbDesc VARCHAR(200), kbImage VARCHAR(200), kbIndexing INT, kbTileImg VARCHAR(200),
        kbModifiedDate DATETIME, kbNewIconDate DATETIME, kbGridXhdpi VARCHAR(200), kbGridHdpi VARCHAR(200), kbGridMdpi VARCHAR(200),
        kbGridLdpi VARCHAR(200), kbTitleXhdpi VARCHAR(200), kbTitleHdpi VARCHAR(200), kbTitleMdpi VARCHAR(200), kbTitleLdpi VARCHAR(200),
        kbType VARCHAR(10), kbActionButtonUrl VARCHAR(999), tViewRank INT,

        tPluginId INT, tPluginDesc VARCHAR(250), tPluginVerCode VARCHAR(15), tPluginVerType CHAR(5), tPluginWebURL VARCHAR(145),
        tPluginSize BIGINT, tPluginWhatsNew VARCHAR(145), tPluginCheckSum VARCHAR(145), tPluginUpdateOn DATETIME,
        tPluginThemeColor VARCHAR(10), tPluginStatusbarShow TINYINT(1), tPluginStatusbarColor VARCHAR(10),
        tPluginStatusbarStyle VARCHAR(10), tPluginHideCloseButton TINYINT(1),
        tPluginIsPhonePortrait TINYINT(1), tPluginIsPhoneLandscape TINYINT(1), tPluginIsTabletPortrait TINYINT(1), tPluginIsTabletLandscape TINYINT(1),
        tPluginAllowTextCopy TINYINT(1), tPluginAllowScreenShot TINYINT(1),
        tPluginInstallType VARCHAR(9), tSupportEmail VARCHAR(150), tSupportPhone VARCHAR(150), tIsHidden TINYINT(1), tAvgRat FLOAT, tTotalRat INT, tMyRat INT,
        tMyFavItIs INT, tPluginType VARCHAR(5), downloadUrlNA VARCHAR(999),
        tBackgroundUpgradeOnly TINYINT(1),  tUniversalLink VARCHAR(300), tAppCustomViewCode VARCHAR(300), tIsDraft INT, tPluginIsActive INT,
        tViewId INT,tPluginAllowHttp TINYINT(1),
        on_ios_mobile TINYINT(1),on_ios_tablet TINYINT(1),
        on_android_mobile TINYINT(1), on_android_tablet TINYINT(1), on_web_browser TINYINT(1),
        on_windows_mobile TINYINT(1), on_windows_tablet TINYINT(1), on_windows_desktop TINYINT(1),
        win_registry_key VARCHAR(250), win_registry_location VARCHAR(250),android_package_name VARCHAR(145),min_width INT,max_width INT,min_width_msg VARCHAR(250),
        ios_bottombar_color VARCHAR(20),android_bottombar_color VARCHAR(20),
        is_phone_landscape_notch TINYINT(1), status_bar_text_visibility TINYINT(1),
        statusbar_visibility TINYINT(1),status_bar_gradient_color VARCHAR(20),plugin_statusbar_bgcolor VARCHAR(20),bottom_bar_visibility TINYINT(1),
        bottom_bar_gradient TINYINT(1),bottom_bar_color_left VARCHAR(20),bottom_bar_color_right VARCHAR(20),
        tEnableLogging TINYINT(1), tLoggingWithScreenShot TINYINT(1),
        tPlugin_al_env_type varchar(100), tPlugin_al_url VARCHAR(300), tPlugin_al_version VARCHAR(300), tPlugin_al_modifydate VARCHAR(300), tPlugin_al_checksum VARCHAR(300),tPlugin_al_versiontpye VARCHAR(300),tPlugin_al_size VARCHAR(300),
        tPlugin_al_weburl VARCHAR(300),
        INDEX my_index_cattempid (kbId,tIsDraft,tPluginIsActive,tViewRank,kbIndexing)) ENGINE = MEMORY;

    INSERT INTO temp_catList1
    SELECT
        c.catId, c.catName, catDescp, catImg, indexing, cat_tile_Img,
        IF(Modify_date='0000-00-00 00:00:00',NOW(),Modify_date) as Modify_date,
        add_new_con_date, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, tile_xhdpi,
        tile_hdpi, tile_mdpi, tile_ldpi, 'c', '', tv.tViewRank, 0, '', '', '', '', 0,
        '', '', '0000-00-00 00:00:00', '', 1, '', '',
        0,1,0,1,0,
        1, 1, '', '', '',c.is_hidden,
        COALESCE(AVG(uri.rating), 0), COUNT(uri.rating), COALESCE(uri1.rating, 0),
        COALESCE(ufi.uid, 0), '', '', 0, '', '', 0, 1, tv.tids,0,
        1,1,1,1,1,1,1,1,
        '', '', '', 0, 0,'','','',0,0,0,'','',0,0,'','',1,0,
        '','','','0000-00-00 00:00:00','','','',''
    FROM category c
    JOIN mapviewcat mc on c.catid = mc.catid and c.channelId = chanId AND searchable = true AND mc.`type` = 'c'
    JOIN temp_viewIds_1 tv on tv.tids = mc.viewid
    LEFT JOIN user_rating_icon uri ON uri.icon_id = c.catid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = c.catid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = c.catid AND ufi.icon_type = 'c' AND ufi.uid = urId
    GROUP BY c.catId;

    INSERT INTO temp_catList1
    SELECT
        abid, title, `action`, image, a.dispindex, a.action_tile_img,
        IF(modify_date='0000-00-00 00:00:00',NOW(),a.modify_date),
        '0000-00-00 00:00:00', grid_xhdpi, grid_hdpi, grid_mdpi,
        grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi,
        'a', pav.plugin_url, tv.tViewRank, COALESCE(ptm.plugin_id, 0), pa.plugin_desc,
        pav.version_code, pav.update_type, pav.plugin_web_url,
        pav.package_size, pav.whats_new, pav.package_checksum,
        COALESCE(pav.update_on,NOW()), pa.plugin_theme_color, pa.plugin_statusbar,
        SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1), pa.plugin_statusbar_style, pa.plugin_hide_close_btn,
        pas.is_phone_portrait, pas.is_phone_landscape, pas.is_tablet_portrait, pas.is_tablet_landscape,
        COALESCE(pas.plugin_allow_text_copy, 1), COALESCE(pas.plugin_allow_screen_shot, 1),
        pa.plugin_install_type, COALESCE(pas.support_email, ''), COALESCE(pas.support_phone, ''),
        COALESCE(pas.is_hidden, 0),
        COALESCE(AVG(uri.rating), 0), COUNT(uri.rating), COALESCE(uri1.rating, 0),
        COALESCE(ufi.uid, 0), pa.plugin_type, pav.download_url_na, COALESCE(pav.background_upgrade_only,0),
        COALESCE(CONCAT(paul.absolute_url, paul.relative_url), ''),
        COALESCE(acv.view_code, ''), COALESCE(pa.is_draft, 0),COALESCE(pa.is_active, 1), tv.tids,COALESCE(pas.allow_http,0),
        COALESCE(pas.on_ios_mobile,1), COALESCE(pas.on_ios_tablet,1), COALESCE(pas.on_android_mobile,1),
        COALESCE(pas.on_android_tablet,1), COALESCE(pas.on_web_browser,1),
        COALESCE(pas.on_windows_mobile,1), COALESCE(pas.on_windows_tablet,1), COALESCE(pas.on_windows_desktop,1),
        paul.win_registry_key, paul.win_registry_location,paul.android_package_name,pas.app_min_width,pas.app_max_width,pas.app_min_width_msg,
        COALESCE(pas.ios_bottombar_color,''),COALESCE(pas.android_bottombar_color,''),COALESCE(pas.is_phone_landscape_notch,0),
        IF(COALESCE(pa.plugin_statusbar_style, '')='', 0, 1),
        IF(COALESCE(pa.plugin_statusbar_bgcolor, '')='', 0, 1),
        IF(COALESCE(pa.plugin_statusbar_bgcolor, '')=SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', -1)),
        SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1),
        IF(COALESCE(pas.ios_bottombar_color, '')='', 0, 1),
        IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), 0, 1),
        SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1),
        IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', -1)),
        COALESCE(pas.enable_logging, 1),
        COALESCE(pas.logging_with_screenshot, 0),
        COALESCE(  group_concat(DISTINCT(tep.teEnvironment),'')),
        COALESCE(  group_concat(DISTINCT(tep.tePlugin_url),'')),
        COALESCE(  group_concat(DISTINCT(tep.tePluginVerCode ),'')),
        COALESCE(  group_concat(DISTINCT(tep.tePluginUpdateOn ),'')),
        COALESCE( group_concat(DISTINCT(tep.tePluginCheckSum ),'')),
        COALESCE(  group_concat(DISTINCT(tep.tePluginVerType ),'')),
        COALESCE( group_concat(DISTINCT(tep.tePluginSize ),'')),
        COALESCE( group_concat(DISTINCT(tep.tePluginWebURL ),''))
    FROM actionbutton a
    JOIN mapviewcat mc on a.abid = mc.catid and a.channelId = chanId and mc.`type` = 'a' AND searchable = true
    JOIN temp_viewIds_1 tv on tv.tids = mc.viewid
    LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid
    LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id
    LEFT JOIN temp_envs tep ON tep.tePluginId = pa.plugin_id and tep.teUserId=urId
    LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN app_custom_view acv ON acv.plugin_id = pa.plugin_id
    GROUP BY a.abid  ;
    SELECT * FROM temp_catList1 WHERE tIsDraft = 0 and tPluginIsActive = 1 ORDER BY tViewRank, kbIndexing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getIconFeedBack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getIconFeedBack`(IN iconId INT, IN iconType VARCHAR(5), IN chanId INT, IN maxFeedId INT, IN maxResultCount INT)
BEGIN
DECLARE pluginId, iconExists INT DEFAULT 0;

IF EXISTS (SELECT * FROM actionbutton WHERE abid = iconId AND channelid = chanId) THEN
  IF EXISTS (SELECT * FROM plugin_template_map WHERE ab_id = iconId) THEN
    SELECT plugin_id FROM plugin_template_map WHERE ab_id = iconId INTO pluginId;
    SET iconExists = 1;
  END IF;
   SET iconExists = 1;
ELSE
  IF EXISTS(SELECT * FROM category WHERE catid = iconId AND channelid = chanId)THEN
    SET iconExists = 1;
  END IF;
END IF;

IF(iconExists = 1)THEN
  SELECT ufi.feedback_id,
      ufi.feedback_text,
      ufi.feedback_update_on,
      ufi.uid,
      ui.uname,
      ui.uemail,
      COALESCE(ui.uimageurl, '') AS uimageurl,
      pa.plugin_id,
      ufi.channelid,
      ufi.feedback_update_on,
      pav.version_code,
      device_type
    FROM user_feedback_icon ufi
    LEFT JOIN plugin_template_map ptm
      ON ufi.icon_id = ptm.ab_id AND ufi.icon_type = iconType
    LEFT JOIN plugin_app pa
      ON pa.plugin_id = ptm.plugin_id AND pa.plugin_id = pluginId
    LEFT JOIN plugin_app_version pav
      ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN userdetails ud
      ON ud.uid = ufi.uid
    JOIN userinfo ui
      ON ui.userid = ud.userid
    WHERE ((maxFeedId = 0) OR (feedback_id < maxFeedId))
      AND ufi.icon_id = iconId
      AND ufi.channelid = chanId
      AND ud.is_active = 1
    ORDER BY feedback_id DESC
    LIMIT maxResultCount;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getInternalViewPlugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getInternalViewPlugin`(IN chanId INT)
BEGIN



SELECT *

FROM app_custom_view acv

  JOIN plugin_app pa

    ON pa.plugin_id = acv.plugin_id

WHERE acv.channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetNotificationForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetNotificationForUser`(IN urId INT, IN chanId INT)
BEGIN

SELECT upc.*, NOW() AS notiLastDate FROM userpendingnotification upc WHERE uid = urId AND channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getOauthCreds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getOauthCreds`(in providerCode Text)
BEGIN
select * from channel_oauth_sso_config where oauth_provider_id=providerCode and oauth_status=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetOrCreateDefaultCatTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetOrCreateDefaultCatTemplate`(IN chanId INT)
BEGIN

DECLARE returnType INT;

IF EXISTS (SELECT * FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE) THEN

  SELECT viewid FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE INTO returnType;

ELSE

  INSERT INTO categorytemplate (viewname, ismaster, channelId, created_on)
    VALUES ('Master Template', TRUE, chanId, NOW());
  
  SELECT LAST_INSERT_ID() INTO returnType;

END IF;

SELECT returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetResetPasswordDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetResetPasswordDetail`(IN requestCode TEXT)
BEGIN

DECLARE userEmail TEXT DEFAULT '';
DECLARE usrId INT DEFAULT 0;

IF EXISTS (SELECT * FROM userpasswordrequest WHERE requesttoken = requestCode) THEN
	SELECT userid FROM userpasswordrequest WHERE requesttoken = requestCode INTO usrId;
	IF EXISTS (SELECT * FROM userpasswordrequest WHERE userid = usrId AND DATE_ADD(requesttime, INTERVAL 2 HOUR) > NOW()) THEN
		SELECT uemail FROM userinfo WHERE userid = usrId INTO userEmail;
	ELSE
		DELETE FROM userpasswordrequest WHERE userid = usrId;
	END IF;
END IF;

SELECT userEmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_GetRootedAllowedStatusInChannel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_GetRootedAllowedStatusInChannel`(IN chanId INT)
BEGIN

IF EXISTS(SELECT * FROM channel WHERE channelid = chanId)THEN

  SELECT COALESCE(cs.allow_rooted_device, 1) AS allow_rooted_device

  FROM channel c

  LEFT JOIN channel_setting cs

    ON cs.channelid = c.channelid

  WHERE c.channelid = chanId;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_getSubDomainDetails_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_getSubDomainDetails_new`(in chanId int)
BEGIN
declare is_status int;

 if not exists(select * from channel_custom_domain where channel_id=chanId)Then
     select * from channelsubdomain where channelid= chanId;
   else
       select cust_status from channel_custom_domain where channel_id=chanId into is_status;
       if(is_status=1) then
		  select cs.*,cd.cust_domain from channelsubdomain cs
			left join channel_custom_domain cd on cd.channel_id=cs.channelid
			where channelid= chanId;
        else 
			select * from channelsubdomain where channelid= chanId;
        end if;
   end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserByEmail`(IN userEmail VARCHAR(250), IN chanId INT, IN showDeactive BOOL)
BEGIN

  DECLARE usrId, urId INT;
  
  SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;
  
  IF EXISTS (SELECT * FROM userdetails WHERE userid = usrId AND channelid = chanId) THEN
    SELECT uid FROM userdetails WHERE userid = usrId AND channelid = chanId INTO urId;
    
    CALL diy_GetUserById(urId, chanId, showDeactive);
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserByEmail_Plugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserByEmail_Plugin`(IN userEmail VARCHAR(250), IN pluginId INT, IN chanId INT, IN showDeactive BOOL)
BEGIN

  

  DECLARE usrId, urId INT DEFAULT 0;

  

  -- Get userId for this user

  SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;

  

  IF EXISTS (SELECT uid FROM userdetails WHERE userid = usrId AND channelid = chanId) THEN

    SELECT uid FROM userdetails WHERE userid = usrId AND channelid = chanId INTO urId;

    

    DROP TEMPORARY TABLE IF EXISTS tempGroupTemplate;

    CREATE TEMPORARY TABLE tempGroupTemplate (tGid INT) ENGINE = MEMORY;

    

    -- Get all templates this plugin is mapped to

    -- Get all groups these templates are mapped to

    INSERT INTO tempGroupTemplate

      SELECT gid 

      FROM mapviewgrp mvg 

        JOIN plugin_template_map ptm ON mvg.viewid = ptm.template_id

      WHERE ptm.plugin_id = pluginId;

  

    -- Check if this user belongs to any of those groups

    -- If yes, then get the user, else ...

    IF EXISTS (SELECT * FROM uidgid WHERE uid = urId AND gid IN (select tGid FROM tempGroupTemplate)) THEN

      CALL diy_GetUserById(urId, chanId, showDeactive);

    ELSE

      -- Check if one of the template is master. Then we can have the fun

      IF EXISTS (SELECT *  FROM plugin_template_map ptm JOIN categorytemplate ctm ON ptm.template_id = ctm.viewid WHERE ptm.plugin_id = pluginId AND ctm.ismaster = 1) THEN

        CALL diy_GetUserById(urId, chanId, showDeactive);

      END IF;

    END IF;

  

  END IF;

  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserById`(IN urId INT, IN chanId INT, IN showDeactive BOOL)
BEGIN

  SELECT 
    uds.uid,
    ui.uname,
    ui.uemail,
    ui.udesg,
    ui.uimageurl,
    uds.registrationDate,
    uds.channelid,
    ch.display_name,
    ch.channelname,
	  IFNULL(ad.admin_id, 0) as admin_id,
	  ad.is_super as isAdmin,
	  IFNULL(last_app_launch,'') as last_app_launch,
	  uds.is_active,
	  ui.is_owner,
    IFNULL(ad.is_creator, 0) as is_creator
  FROM userdetails uds
    JOIN userinfo ui ON ui.userid = uds.userid
	  LEFT JOIN adminuser ad ON ad.userid = uds.userid AND ad.channelid = uds.channelid
    JOIN channel ch ON ch.channelid = uds.channelid
  WHERE uds.uid = urId AND uds.channelid = chanId 
     AND ((showDeactive = 0 AND is_active = 1) OR (showDeactive = 1));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserById_Plugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserById_Plugin`(IN urId INT, IN pluginId INT, IN chanId INT, IN showDeactive BOOL)
BEGIN



  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId) THEN



    DROP TEMPORARY TABLE IF EXISTS tempGroupTemplate;

    CREATE TEMPORARY TABLE tempGroupTemplate (tGid INT) ENGINE = MEMORY;

      

    -- Get all templates this plugin is mapped to

    -- Get all groups these templates are mapped to

    INSERT INTO tempGroupTemplate

      SELECT gid 

      FROM mapviewgrp mvg 

        JOIN plugin_template_map ptm ON mvg.viewid = ptm.template_id

      WHERE ptm.plugin_id = pluginId;

      

    -- Check if this user belongs to any of those groups

    -- If yes, then get the user, else ...

    IF EXISTS (SELECT * FROM uidgid WHERE uid = urId AND gid IN (select tGid FROM tempGroupTemplate)) THEN

      CALL diy_GetUserById(urId, chanId, showDeactive);

    ELSE

      -- Check if one of the template is master. Then we can have the fun

      IF EXISTS (SELECT *  FROM plugin_template_map ptm JOIN categorytemplate ctm ON ptm.template_id = ctm.viewid WHERE ptm.plugin_id = pluginId AND ctm.ismaster = 1) THEN

        CALL diy_GetUserById(urId, chanId, showDeactive);

      END IF;

    END IF;

  

  END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserExternalAuth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserExternalAuth`(IN urId INT)
BEGIN

  DECLARE usrId INT;



  SELECT userid FROM userdetails WHERE uid = urId INTO usrId;



  SELECT uea.*, NOW() as now_date FROM user_external_auth uea WHERE userid = usrId;

  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserGroup`(IN urId INT, IN chanId INT)
BEGIN



  SELECT 

    udg.gid,

    ug.gname

  FROM uidgid udg

    JOIN usergroup ug ON udg.gid = ug.gid

  WHERE udg.uid = urId AND ug.channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserInfoDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserInfoDetails`(in userid int,in chanId int)
BEGIN
SELECT 
    userdetails.uid,
    userinfo.uname,
    userinfo.udesg,
    userinfo.uemail,
    IFNULL(usergroup.gname, '') AS gname,
    IFNULL(userinfo.uimageurl, '') AS uimageurl,
    IFNULL(userinfo.currentcountry, '') AS currentcountry,
    IFNULL(userinfo.currentcity, '') AS currentcity,
    IFNULL(userinfo.userabout, '') AS userabouts,
    COALESCE(cs.user_profile_readonly, 0) AS readonly,
    COALESCE(cs.mpin_enabled,0) as mpin_enabled,
  	COALESCE(cs.mpin_timeout_interval,0) as mpin_timeout_interval,
  	COALESCE(cs.biometric_enabled,0) as biometric_enabled,
  	cs.biological_characteristics
FROM
    userdetails
    LEFT JOIN userinfo
      ON userinfo.userid = userdetails.userid
    LEFT JOIN uidgid
      ON uidgid.uid = userdetails.uid
    LEFT JOIN usergroup
      ON usergroup.gid = uidgid.gid
    LEFT JOIN channel_setting cs
      ON cs.channelid = userdetails.channelid
WHERE
    userdetails.is_active = 1
        AND userdetails.uid = userid
        AND userdetails.channelid = chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserNotificationList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserNotificationList`(in urId int, in notiId int)
BEGIN

	SELECT

			*,

			diy_GetContentTitle(cid) AS contTitle,

			diy_GetUserName(uid_from) AS usrFrom,

			diy_GetUserProfileImg(uid_from) AS usrFromProfileImg,

			(SELECT usercomment FROM usercomment WHERE cmId = noti_for_comment) AS notiCommentText,

			(SELECT conttype FROM assets ast WHERE ast.cid = un.cid) AS contType

		FROM usernotification un

		WHERE uid=urId and  noti_id = notiId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserRecommList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserRecommList`(in usrId int, in contentId int )
BEGIN

SELECT

			*,

			diy_GetContentTitle(cid) AS contTitle,

			diy_GetUserName(un.uid) AS usrRecommTo,

			diy_GetUserProfileImg(un.uid) AS usrRecommToProfileImg,

			(SELECT conttype FROM assets ast WHERE ast.cid = un.cid) AS contType

		FROM userrecommendpush un Where un.uidfrom=usrId and  un.cid=contentId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUsers`(IN chanId INT, IN maxId INT, IN resultSize INT, IN groupIds VARCHAR(150), IN searchText VARCHAR(45), IN showDeactive BOOL, 
    IN listType INT(1), IN showStats BOOL)
BEGIN

  -- listType:
  -- 0: Show all
  -- 1: Show only active. is_active = 1
  -- 2: Show only live, is_active = 1 & last_app_launch <> '0000-00-00 00:00:00'
  -- 3: Show only users who are "active" by activity
  -- 4: Show only users who are "inactive" by activity
  -- 5: Show only users who are "moderate" by activity

  SELECT
    ud.uid,
    ui.uname,
    ui.uemail,
    ui.udesg,
    ui.uimageurl,
    ud.registrationDate,
    ud.channelid,
    ch.display_name,
    ch.channelname,
    (SELECT GROUP_CONCAT(CONCAT(ug.gid, '`', ug.gname)) FROM uidgid ugd JOIN usergroup ug ON ug.gid = ugd.gid WHERE ugd.uid = ud.uid) AS groupBunch,
    CASE showStats WHEN 1 THEN fn_diy_GetContConsumptionStat_User(ud.uid, chanId) ELSE '0|0' END AS userStat,
    CASE showStats WHEN 1 THEN fn_diy_GetUserActivityStatus(ud.uid) ELSE '' END AS userStatus
  FROM userdetails ud
    JOIN userinfo ui ON ui.userid = ud.userid
    JOIN channel ch ON ch.channelid = ud.channelid
    LEFT JOIN uidgid ugd ON ugd.uid = ud.uid
  WHERE ud.channelid = chanId
    AND ((maxId = 0) OR (ud.uid > maxId))
    AND ((searchText = '') OR (ui.uname LIKE CONCAT('%', searchText, '%') OR ui.uemail LIKE CONCAT('%', searchText, '%')))
    AND ((groupIds = '0') OR (groupIds = '') OR (FIND_IN_SET(ugd.gid, groupIds)))
    AND ((showDeactive = 0 AND is_active = 1) OR (showDeactive = 1))
    AND ((listType = 0) 
        OR (listType = 1 AND is_active = 1) 
        OR (listType = 2 AND is_active = 1 AND last_app_launch <> '0000-00-00 00:00:00')
        OR (listType = 3 AND fn_diy_GetUserActivityStatus(ud.uid) = 'A')
        OR (listType = 4 AND fn_diy_GetUserActivityStatus(ud.uid) = 'I')
        OR (listType = 5 AND fn_diy_GetUserActivityStatus(ud.uid) = 'M'))
  GROUP BY ud.uid
  LIMIT resultSize;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUserStat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUserStat`(IN urId INT, IN chanId INT)
BEGIN

-- Status: Inactive, Moderate, Active
-- Total unique contents available for consumption: Pushed + Knowledgebase
-- Total unique contents consumed by the user

DECLARE totalContAvailable, totalContConsumed INT DEFAULT 0;
DECLARE totalAppTimespent INT DEFAULT 0;
DECLARE userActStatus CHAR(1);

-- Available contents for consumption
BEGIN
  DROP TEMPORARY TABLE IF EXISTS tempAvailableUserCont;
  CREATE TEMPORARY TABLE tempAvailableUserCont(tCid INT, tChanId INT, tContType CHAR(5)) ENGINE = MEMORY;

  -- Sent via Push & Recommend
  INSERT INTO tempAvailableUserCont
    SELECT usc.cid, chanId, 'SENT' FROM usersentcontent usc WHERE usc.uid = urId AND usc.channelid = chanId;
  
  -- Available via knoweldgebase
  
  -- Get all my templates, and then get all contents in those templates
  -- Specially handle the case of folder?
  INSERT INTO tempAvailableUserCont
    SELECT
      DISTINCT kb.cid, chanId, 'KB' 
    FROM uidgid ugd
      LEFT JOIN mapviewgrp mvg ON mvg.gid = ugd.gid 
      LEFT JOIN categorytemplate ctm ON (ctm.viewid = mvg.viewid) OR (ctm.ismaster = 1 and ctm.channelid = chanId)
      JOIN mapviewcat mvc ON ctm.viewid = mvc.viewid AND type ='c' 
      JOIN category cat ON cat.catid = mvc.catid AND cat.channelid = chanId
      JOIN knowledgebase kb ON cat.catid = kb.catid 
    WHERE uid = urId;
  
  -- Unique contents (By aid, mid & type)
  SELECT COUNT(*) FROM
    (SELECT *
      FROM tempAvailableUserCont tauc
        JOIN assets ast ON tauc.tcid = ast.cid AND ast.channelid = tauc.tChanId AND ast.isDeleted = 0
      GROUP by ast.aid, ast.mid, ast.conttype) sq INTO totalContAvailable;
END;

-- Total consumed contents
SELECT COUNT(*) FROM
  (SELECT cv.* FROM contentviewed cv
      JOIN assets ast ON cv.cid = ast.cid AND cv.channelid = ast.channelid
    WHERE cv.uid = urId AND cv.channelid = chanId
    GROUP BY ast.aid, ast.mid, ast.conttype) sq INTO totalContConsumed;

-- Activity status for this user
SELECT fn_diy_GetUserActivityStatus(urId) INTO userActStatus;

SELECT COALESCE(timespent, 0) FROM apptimespent WHERE uid = urId INTO totalAppTimespent;

SELECT totalContAvailable, totalContConsumed, userActStatus, totalAppTimespent;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_GetUsers_Plugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_GetUsers_Plugin`(IN pluginId INT, IN chanId INT, IN maxId INT,

  IN resultSize INT, IN groupId INT, IN searchText VARCHAR(45), IN showDeactive BOOL, IN showStats BOOL, IN listType INT)
BEGIN



  DECLARE groupIds VARCHAR(150) DEFAULT '0';

  DECLARE isMasterTemplate INT DEFAULT 0;

  

  DROP TEMPORARY TABLE IF EXISTS tempGroupTemplate;

  CREATE TEMPORARY TABLE tempGroupTemplate (tGid INT) ENGINE = MEMORY;

  

  -- There is a case when the plugin is mapped to a master template,

  -- in that case, there is no entry in mapviewgrp

  SELECT ismaster FROM plugin_template_map ptm 

    JOIN categorytemplate ctm ON ptm.template_id = ctm.viewid 

    WHERE plugin_id = pluginId INTO isMasterTemplate;

  

  IF (isMasterTemplate = 0) THEN

    -- Get all templates this plugin is mapped to

    -- Get all groups these templates are mapped to

    INSERT INTO tempGroupTemplate

      SELECT gid 

      FROM mapviewgrp mvg 

        JOIN plugin_template_map ptm ON mvg.viewid = ptm.template_id

      WHERE ptm.plugin_id = pluginId;

    

  

    -- If groupId is mentioned make sure it's in the pluginGroupMapping

    IF (groupId > 0) THEN

      IF EXISTS (SELECT * FROM tempGroupTemplate WHERE tGid = groupId) THEN

        -- Get all users who are in this groupId

        CALL diy_GetUsers(chanId, maxId, resultSize, groupId, searchText, showDeactive, listType, showStats);

      END IF;

    ELSE

      -- Get all users who are in this plugin's groups.

      SELECT GROUP_CONCAT(tGid) FROM tempGroupTemplate INTO groupIds;

      

      CALL diy_GetUsers(chanId, maxId, resultSize, groupIds, searchText, showDeactive, listType, showStats);

    END IF;

  ELSE

    -- Get all users in this channel

    CALL diy_GetUsers(chanId, maxId, resultSize, '0', searchText, showDeactive, listType, showStats);

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InsertAppLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InsertAppLink`(IN appLinkid INT, IN chanName TEXT)
BEGIN



  DECLARE chanId INT;



  SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;



  IF EXISTS (SELECT * FROM channelapplinks WHERE channelid = chanId) THEN

    UPDATE channelapplinks SET appid = appLinkid WHERE channelid = chanId;

  ELSE

    INSERT INTO channelapplinks (channelid, appid) VALUES (chanId, appLinkid);

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InsertAppUpgradeData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InsertAppUpgradeData`(IN urId INT, IN deviceId TEXT, IN deviceType TEXT, IN appName TEXT,

  IN appVersion TEXT, IN chanId INT)
BEGIN



IF NOT EXISTS (SELECT * FROM appupgrade WHERE uid = urId AND channelId = chanId AND app_name = appName AND device_id = deviceid) THEN



  INSERT INTO appupgrade 

            (uid, 

             device_id, 

             device_type, 

             app_name, 

             app_version, 

             channelid) 

  VALUES     (urid, 

             deviceid, 

             devicetype, 

             appname, 

             appversion, 

             chanid); 



ELSE



  UPDATE appupgrade 

  SET    app_version = appversion 

  WHERE  uid = urid 

         AND channelid = chanid

         AND app_name = appName

         AND device_id = deviceid; 



END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InsertDeviceHealth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InsertDeviceHealth`(IN urId INT, IN devId TEXT, IN devName TEXT, IN devType TEXT, IN appName TEXT,

  IN osVer TEXT, IN deviceModel TEXT, IN freeMem TEXT, IN memUsedByApp TEXT, IN chanId INT, IN isRooted BOOL)
BEGIN



IF NOT EXISTS (SELECT * FROM devicehealth WHERE uid = urId AND channelId = chanId AND app_name = appName AND device_id = devId) THEN



  INSERT INTO devicehealth

            (uid, device_id, device_type, app_name, os_version, model, free_memory, used_by_app, channelId, updated_on)

  VALUES    (urid, devId, devType, appname, osVer, deviceModel, freeMem,

             memUsedByApp, chanid, NOW());



ELSE



    UPDATE devicehealth

    SET device_type = devType,

        os_version = osVer,

        model = deviceModel,

        free_memory = freeMem,

        used_by_app = memUsedByApp,

        updated_on = NOW()

    WHERE  uid = urid

        AND channelid = chanId

        AND app_name = appName

        AND device_id = devId;



END IF;



-- Update details into the deviceinfo table

UPDATE deviceinfo

SET devicename = devName, devicetype = devType, deviceversion = deviceModel, osversion = osVer,

    freememory = freeMem, is_rooted = isRooted

WHERE deviceid = devId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_insert_meta_info_sso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_insert_meta_info_sso`(in chanId int,in proType text,in ssoUrl text,
in ssoCallback text,in idpCode text, in accessType text,in domainName text,in jitaccess int)
BEGIN

DECLARE respStatus INT;
SET respStatus=0;
IF NOT EXISTS(SELECT * FROM channel_external_idp where channelid=chanId and idp_code=idpCode) THEN
 INSERT INTO channel_external_idp
  (channelid,idp_type,login_url,callback_url,idp_code,access_type,domain_name,limited_access,s_type)
 VALUES
  (chanId,proType,ssoUrl,ssoCallback,idpCode,accessType,domainName,jitaccess,'S');
	SET respStatus=1;
END IF;
SELECT respStatus;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InviteUserSSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InviteUserSSO`(IN userName TEXT, IN userEmail TEXT, 
    IN userVerifyCode TEXT, IN chanId INT)
BEGIN

DECLARE usrId,urId INT DEFAULT 0;

IF EXISTS(SELECT * FROM channel WHERE channelid = chanId) THEN
	IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN
  		INSERT INTO userinfo (uname, uemail, upassword, usercode, is_verified, is_external_auth) VALUES (userName, userEmail, '', userVerifyCode, 1, 1);
  		
  		SELECT LAST_INSERT_ID() INTO usrId;
  		
  		INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, NOW(), 'I', 1);
  	ELSE
  	    SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;
    	  IF NOT EXISTS(SELECT * FROM userdetails WHERE userid=usrId AND channelid=chanId)THEN
    	     INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, NOW(), 'I', 1);
             SELECT LAST_INSERT_ID() INTO urId;
  		  END IF;
  END IF;
  
END IF;
select urId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InviteUserToForExcel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InviteUserToForExcel`(IN userName TEXT, IN userEmail TEXT, IN userVerifyCode TEXT,
IN grpId INT, IN chanName TEXT, IN eCode VARCHAR(50))
BEGIN
DECLARE respType, chanId, urId, usrId INT DEFAULT 0;
DECLARE currentTime DATETIME DEFAULT NOW();

START TRANSACTION;

	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

	IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN
		
		INSERT INTO userinfo (uname, uemail, upassword, usercode, is_verified, empid) VALUES (userName, userEmail, '', userVerifyCode, 0, eCode);
		SELECT LAST_INSERT_ID() INTO usrId;
		
		INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, currentTime, 'I', 1);
		SELECT LAST_INSERT_ID() INTO urId;

    IF (grpId > 0) THEN
      INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);
    END IF;

		SET respType = 1;

	ELSE

		SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;

		IF EXISTS (SELECT * FROM userdetails WHERE userid = usrId and channelid=chanId) THEN

      SELECT uid FROM userdetails WHERE userid = usrId and channelid=chanId INTO urId;

        IF NOT EXISTS(SELECT * FROM uidgid WHERE uid=urId AND gid=grpId)THEN

           IF (grpId > 0) THEN
            INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);
          END IF;

        END IF;

       	SET respType = 2;

		END IF;

	END IF;

COMMIT;

SELECT respType, urId, currentTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InviteUserToForExcel_sso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InviteUserToForExcel_sso`(IN userName TEXT, IN userEmail TEXT, IN userVerifyCode TEXT,
IN grpId INT, IN chanName TEXT, IN eCode VARCHAR(50))
BEGIN
DECLARE respType, chanId, urId, usrId INT DEFAULT 0;
DECLARE currentTime DATETIME DEFAULT NOW();

START TRANSACTION;

	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

	IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN
		
		INSERT INTO userinfo (uname, uemail, upassword, usercode, is_verified, is_external_auth) VALUES (userName, userEmail, '', userVerifyCode, 1, 1);
		SELECT LAST_INSERT_ID() INTO usrId;
		
		INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, currentTime, 'I', 1);
		SELECT LAST_INSERT_ID() INTO urId;

    IF (grpId > 0) THEN
      INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);
    END IF;

		SET respType = 1;

	ELSE

		SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;

		IF EXISTS (SELECT * FROM userdetails WHERE userid = usrId and channelid=chanId) THEN

      SELECT uid FROM userdetails WHERE userid = usrId and channelid=chanId INTO urId;

        IF NOT EXISTS(SELECT * FROM uidgid WHERE uid=urId AND gid=grpId)THEN

           IF (grpId > 0) THEN
            INSERT INTO uidgid (uid, gid) VALUES (urId, grpId);
          END IF;

        END IF;

       	SET respType = 2;

		END IF;

	END IF;

COMMIT;

SELECT respType, urId, currentTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_InviteUserToTeamInMultiplegrp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_InviteUserToTeamInMultiplegrp`(IN userName TEXT, IN userEmail TEXT, IN userVerifyCode TEXT, IN devId TEXT, IN grpId TEXT, IN chanName TEXT)
BEGIN
DECLARE respType, chanId, urId, usrId INT DEFAULT 0;
DECLARE currentTime DATETIME DEFAULT NOW();
DECLARE i INT DEFAULT 0;
DECLARE ctr INT DEFAULT 0;
DECLARE temp_str TEXT DEFAULT '';

START TRANSACTION;
IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

	IF NOT EXISTS (SELECT * FROM userinfo WHERE uemail = userEmail) THEN
		
		INSERT INTO userinfo (uname, uemail, upassword, usercode, is_verified) VALUES (userName, userEmail, '', userVerifyCode, 0);
		SELECT LAST_INSERT_ID() INTO usrId;
		
		INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, currentTime, 'I', 1);
		SELECT LAST_INSERT_ID() INTO urId;

		select substrcount(grpId, ',') + 1 into i;	

		 WHILE(ctr<i) DO
			SET ctr=ctr+1; 

			select strsplit(grpId, ',', ctr) into temp_str;
			
      IF (temp_str <> 0) THEN
			  INSERT INTO uidgid (uid, gid) VALUES (urId, temp_str);
      END IF;
		END WHILE;		
		
		IF (devId <> '') THEN
			IF NOT EXISTS (SELECT * FROM deviceinfo WHERE deviceid = devId) THEN
				INSERT INTO deviceinfo (deviceid, devicetype, deviceversion, deviceregdate, osname, osversion, freememory) VALUES (devId, '', '', NOW(), '', '', 0);
				INSERT INTO userdevice (userid, deviceid) VALUES (urId, devId);
			ELSE
				IF EXISTS (SELECT * FROM userdevice WHERE deviceid = devId) THEN
					UPDATE userdevice SET userid = usrId WHERE deviceid = devId;
				ELSE
					INSERT INTO userdevice (userid, deviceid) VALUES (urId, devId);
				END IF;
			END IF;
		END IF;
		
		SET respType = 1;
	ELSE
		SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;
		
		IF EXISTS (SELECT * FROM userdetails WHERE userid = usrId) THEN
			SET respType = -1;
		ELSE
			
			INSERT INTO userdetails (userid, channelid, registrationDate, reg_device, is_active) VALUES (usrId, chanId, currentTime, 'I', 1);
			SELECT LAST_INSERT_ID() INTO urId;
			
			
				select substrcount(grpId, ',') + 1 into i;	

		 WHILE(ctr<i) DO
			SET ctr=ctr+1; 

			select strsplit(grpId, ',', ctr) into temp_str;
			
      IF (temp_str <> 0) THEN
			  INSERT INTO uidgid (uid, gid) VALUES (urId, temp_str);
      END IF;
		END WHILE;
			
			IF (devId <> '') THEN
				IF NOT EXISTS (SELECT * FROM deviceinfo WHERE deviceid = devId) THEN
					INSERT INTO deviceinfo (deviceid, devicetype, deviceversion, deviceregdate, osname, osversion, freememory) VALUES (devId, '', '', NOW(), '', '', 0);
					INSERT INTO userdevice (userid, deviceid) VALUES (urId, devId);
				ELSE
					IF EXISTS (SELECT * FROM userdevice WHERE deviceid = devId) THEN
						UPDATE userdevice SET userid = usrId WHERE deviceid = devId;
					ELSE
						INSERT INTO userdevice (userid, deviceid) VALUES (urId, devId);
					END IF;
				END IF;
			END IF;		
			SET respType = 2;
		END IF;
	END IF;	

END IF;



COMMIT;



SELECT respType, urId, currentTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_IsUserForUpgrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_IsUserForUpgrade`(IN urId INT, IN appName TEXT, IN deviceType TEXT, IN chanId INT)
BEGIN

DECLARE returnType INT DEFAULT 0;
DECLARE latestVersion, upgradeType, downLink, releaseNotes TEXT DEFAULT '';

IF EXISTS (SELECT * FROM appupgradestatus WHERE uid = urId AND app_name = appName AND device_type = deviceType AND upgrade_status = 0 AND channelId = chanId) THEN

  SELECT latest_version, upgrade_type FROM appupgradestatus WHERE uid = urId AND app_name = appName AND device_type = deviceType AND upgrade_status = 0 AND channelId = chanId LIMIT 1
  INTO latestVersion, upgradeType;

  SELECT downloadLink FROM channel WHERE channelid = chanId INTO downLink;
  SELECT GetReleaseNotes(chanId, latestVersion, deviceType) INTO releaseNotes;

  SET returnType = 1;

END IF;

SELECT returnType, latestVersion, upgradeType, downLink, releaseNotes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_KBTimeSpent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_KBTimeSpent`(IN urId INT, IN iconId INT, IN chanId INT, IN acsTime INT, IN iconType CHAR(4),
    IN pluginVer VARCHAR(45))
BEGIN

	DECLARE categId, actId INT DEFAULT 0;
	DECLARE currDate DATETIME;
	
	SELECT NOW() INTO currDate;
	
	IF (iconType = 'AB') THEN
	  SET categId = 0;
	  SET actId = iconId;
	ELSE
	  SET categId = iconId;
	  SET actId = 0;
	END IF;
	
	-- Update the latest access record
	IF EXISTS (SELECT * FROM categoryaccessed WHERE uid = urId AND catid = categId AND actBtnId = actId) THEN
	  UPDATE categoryaccessed 
	  SET accessedType = accessedType + 1, accessedTime = acsTime,
      	accessedOn = currDate, plugin_ver = pluginVer
    WHERE uid = urId AND catid = categId AND actBtnId = actId;
	ELSE
	  INSERT INTO categoryaccessed (uid, catid, accessedOn, accessedTime, channelId, accessedType, actBtnId, plugin_ver)
    VALUES(urId, categId, currDate, acsTime, chanId, 1, actId, pluginVer);
  END IF;
  
	-- Insert into history
	INSERT INTO categoryaccessed_history (uid, catid, accessedOn, accessedTime, channelId, actBtnId, plugin_ver)
	VALUES (urId, categId, currDate, acsTime, chanId, actId, pluginVer);
	
	SELECT 1 as resp;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_LogoutFromDevice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_LogoutFromDevice`(IN urId INT, IN chanId INT, IN devId VARCHAR(100))
BEGIN
  DECLARE usrId INT DEFAULT 0;
  DECLARE devType TEXT;
  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId AND is_active = 1) THEN
    SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
    SELECT devicetype FROM deviceinfo WHERE deviceid = devId INTO devType;

        IF (devType LIKE 'Android%') THEN
      DELETE FROM androidpushtokens WHERE uid = urId AND deviceid = devId;
    ELSE
      IF (devType LIKE 'iP%') THEN
        DELETE FROM iphonepushtokens WHERE uid = urId AND deviceid = devId;
        DELETE FROM userpushdetail WHERE uid = urId AND deviceid = devId;
      ELSE
        IF (devType LIKE 'BB%') THEN
          DELETE FROM userpushdetail WHERE uid = urId AND deviceid = devId;
        END IF;
      END IF;
    END IF;

    -- If user is logged into multiple channels from devices, this can be harmful
    DELETE FROM userdevice WHERE userid = usrId AND deviceid = devId;
    DELETE FROM appupgrade
        WHERE uid = urId AND channelid = chanId AND device_id = devId;
    DELETE FROM devicehealth
        WHERE uid = urId AND channelid = chanId AND device_id = devId;
  END IF;
  
  -- Set login session as 0
  UPDATE app_login_session SET last_logout = NOW(), is_login_active = 0
  WHERE uid = urId AND device_id = devId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_MakeAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_MakeAdmin`(IN urId INT, IN chanId INT, IN isSuper BOOL, IN templateIdBunch TEXT)
BEGIN



DECLARE usrId, rlId, adminId INT DEFAULT 0;

DECLARE lastVal, counter, tmplId INT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

        ROLLBACK;

        RESIGNAL;

    END;

    

START TRANSACTION;



IF EXISTS (SELECT userid FROM userdetails WHERE uid = urId AND channelid = chanId) THEN



  SELECT userid FROM userdetails WHERE uid = urId AND channelid = chanId INTO usrId;

  SELECT roleid FROM adminuser WHERE channelid=chanId LIMIT 1 INTO rlId;

  

  UPDATE userinfo SET isAdmin = 1 WHERE userid = usrId;

  

  IF NOT EXISTS (SELECT * FROM adminuser WHERE userid = usrId AND channelid = chanId) THEN

  

    INSERT INTO adminuser (userid, channelid, last_login_time, roleid, exp_level, is_super)

    VALUES (usrId, chanId, '0000-00-00 00:00:00', rlId, 0, isSuper);

  

    SELECT LAST_INSERT_ID() INTO adminId;

  

    IF (isSuper = FALSE) THEN

      -- Loop over templateIdBunch, and map one-by-one

      SELECT substrCount(templateIdBunch, ',') + 1 INTO lastVal;

      SET counter = 0;

      REPEAT

        SET counter = counter + 1;

        SELECT strsplit(templateIdBunch, ',', counter) INTO tmplId;

        

        INSERT INTO admin_view_access(admin_id, viewid) VALUES (adminId, tmplId);

      UNTIL counter = lastval

      END REPEAT;

    END IF;

  ELSE

    -- Update existing admin with new type?

    SELECT admin_id FROM adminuser WHERE userid = usrId AND channelid = chanId INTO adminId;

    

    UPDATE adminuser SET is_super = isSuper WHERE admin_id = adminId;

    

    DELETE FROM admin_view_access WHERE admin_id = adminId;

    IF (isSuper = FALSE) THEN

      -- Loop over templateIdBunch, and map one-by-one

      SELECT substrCount(templateIdBunch, ',') + 1 INTO lastVal;

      SET counter = 0;

      REPEAT

        SET counter = counter + 1;

        SELECT strsplit(templateIdBunch, ',', counter) INTO tmplId;

        

        INSERT INTO admin_view_access(admin_id, viewid) VALUES (adminId, tmplId);

      UNTIL counter = lastval

      END REPEAT;

    END IF;

  END IF;

END IF;



COMMIT;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_MakeAdminUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_MakeAdminUser`(IN urId INT, IN rolId INT, IN chanName TEXT)
BEGIN

DECLARE chanId, usrId INT DEFAULT 0;

START TRANSACTION;
IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
	IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId) THEN
		SELECT userid FROM userdetails WHERE uid = urId INTO usrId;		
		INSERT INTO adminuser (userid, channelid, roleid, exp_level)
		VALUES (usrId, chanId, rolId, 0);
		UPDATE userinfo SET isAdmin = 1 WHERE userid = usrId;
	END IF;
END IF;

COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_MakeAdminUserV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_MakeAdminUserV2`(IN urId INT, IN rolId INT, IN chanName TEXT)
BEGIN

DECLARE chanId, usrId INT DEFAULT 0;

START TRANSACTION;
IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
	IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId) THEN
		SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
        IF (rolId = 0) THEN
		    SELECT rid FROM roles WHERE rolename = 'Admin' AND channelid = chanId INTO rolId;
        END IF;
        
        IF NOT EXISTS(SELECT * From adminuser WHERE userid = usrId  AND channelid = chanId) THEN
			INSERT INTO adminuser (userid, channelid, roleid, exp_level) VALUES (usrId, chanId, rolId, 0);
		ELSE
			UPDATE adminuser SET is_super = 1, is_creator = 0 WHERE userid = usrId;
		END IF;
        
		UPDATE userinfo SET isAdmin = 1 WHERE userid = usrId;
	END IF;
END IF;

COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_MakeCreatorUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_MakeCreatorUser`(IN urId INT, IN chanName TEXT)
BEGIN
DECLARE chanId, usrId,rolId INT DEFAULT 0;
START TRANSACTION;
IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
	IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId) THEN
		SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
        SELECT rid FROM roles WHERE rolename = 'Admin' AND channelid = chanId INTO rolId;
        
        -- IF admin entry does not exists then it will first make admin entry and then user will become developer 
        IF NOT EXISTS(SELECT * From adminuser WHERE userid = usrId  AND channelid = chanId) THEN
            INSERT INTO adminuser (userid, channelid, roleid, exp_level) VALUES (usrId, chanId, rolId, 0);
        END IF;
        
        UPDATE adminuser SET is_creator = 1, is_super = 1 WHERE userid = usrId AND channelid = chanId ;
		UPDATE userinfo SET isAdmin = 1 WHERE userid = usrId;
        
        SELECT * From adminuser WHERE userid = usrId;
	END IF;
END IF;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_MakeUserAsEndUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_MakeUserAsEndUser`(IN urId INT, IN chanName TEXT)
BEGIN
DECLARE chanId, usrId INT DEFAULT 0;
START TRANSACTION;
IF EXISTS (SELECT * FROM channel WHERE channelname = chanName) THEN
	SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
	IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId) THEN
		SELECT userid FROM userdetails WHERE uid = urId INTO usrId;

        DELETE FROM adminuser WHERE userid = usrId AND channelid = chanId;
		UPDATE userinfo SET isAdmin = 0 WHERE userid = usrId;
        SELECT * FROM userinfo WHERE userid = usrId;
	END IF;
END IF;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RecordActivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RecordActivity`(IN chanId INT, IN subjectId INT, IN objectId INT,

    IN objType CHAR(5), IN actVerb VARCHAR(20))
BEGIN



    INSERT INTO activity_feed (activity_subject_id, activity_object_id, activity_object_type,

        activity_verb, activity_date, activity_channelid)

    VALUES (subjectId, objectId, objType, actVerb, NOW(), chanId);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RecordActivity_V2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RecordActivity_V2`(IN chanId INT, IN subjectId INT, IN subjectType CHAR(5),

  IN objectId INT, IN objType CHAR(5), IN actVerb VARCHAR(20), IN actData VARCHAR(150))
BEGIN



  INSERT INTO activity_feed (activity_subject_id, activity_object_id, activity_object_type,

        activity_verb, activity_date, activity_channelid, activity_subject_type, activity_data)

    VALUES (subjectId, objectId, objType, actVerb, NOW(), chanId, subjectType, actData);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RegisterAndroidPushToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RegisterAndroidPushToken`(IN urId INT, IN devId VARCHAR(100), IN pushToken TEXT, IN pushType CHAR(4))
BEGIN

  IF EXISTS (SELECT * FROM androidpushtokens WHERE uid = urId AND deviceid = devId) THEN
    UPDATE androidpushtokens SET push_token = pushToken, push_type = pushType, modified_date = NOW(), is_valid = 1 WHERE uid = urId AND deviceid = devId;
  ELSE
    INSERT INTO androidpushtokens (uid, deviceid, push_token, push_type, modified_date, is_valid)
    VALUES (urId, devId, pushToken, pushType, NOW(), 1);
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RegisterIOSPushToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RegisterIOSPushToken`(IN urId INT, IN devId TEXT, IN devToken TEXT, IN apName TEXT, IN pshSound TEXT)
BEGIN

  DECLARE devType TEXT;
  DECLARE iOSAppId INT;
  START TRANSACTION;
  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND is_active = 1) THEN
    -- Delete existing tokens
    DELETE FROM iphonepushtokens WHERE tokenId = devToken;
    
    IF EXISTS (SELECT * FROM iphonepushtokens WHERE uid = urId AND deviceid = devId) THEN
	    UPDATE iphonepushtokens SET modified_date = NOW(), tokenId = devToken, pushsound = pshSound WHERE uid = urId AND deviceid = devId; 
    ELSE
		  INSERT INTO iphonepushtokens (uid, tokenId, appname, appversion, pushbadge, pushalert, pushsound, deviceid, modified_date)
  	  VALUES (urId, devToken, apName, '', '', '', pshSound, devId, NOW());
	  END IF;

    SELECT devicetype FROM deviceinfo WHERE deviceid = devId INTO devType;
	  IF EXISTS (SELECT * FROM apppushdetail WHERE appname = apName AND devicetype = devType) THEN
  	  SELECT appid FROM apppushdetail WHERE appname = apName AND devicetype = devType INTO iOSAppId;
	    IF EXISTS (SELECT * FROM userpushdetail WHERE uid = urId AND deviceid = devId) THEN
				UPDATE userpushdetail SET pushid = iOSAppId WHERE uid = urId AND deviceid = devId;
		  ELSE
				INSERT INTO userpushdetail (uid, pushid, pushType, deviceid) VALUES (urId, iOSAppId, 0, devId);
  		END IF;
	  END IF;
	END IF;
  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RemoveAdminRights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RemoveAdminRights`(in userIdBunch text,in chanName text)
BEGIN

declare chanId, urId,usrId int;

declare lastVal, counter int default 0;



select channelId from channel where channelName = chanName into chanId;



select substrcount(userIdBunch, ',') + 1 into lastVal;



repeat

	set counter = counter + 1;

	select strsplit(userIdBunch, ',', counter) into urId;



  select userid from userdetails where uid = urId and channelId = chanId into usrId;



   update userinfo set isAdmin = 0 where userid = usrId;



  if exists(SELECT * FROM adminuser where userid=usrId and channelid=chanId) then

      delete from  adminuser where userid=usrId and channelid=chanId;

	end if;



until counter = lastVal

end repeat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RemoveAdminViewRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RemoveAdminViewRole`(in adminId int)
BEGIN
if exists(select * from admin_view_role_access_map where uid=adminId) then
	Delete from admin_view_role_access_map where  uid=adminId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RemoveCategoryFromFolder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RemoveCategoryFromFolder`(in categoryId int,in fId int,in stype text)
BEGIN
DECLARE templateId INT DEFAULT 0;
Declare atype varchar(10) DEFAULT '';
IF EXISTS(SELECT * FROM folderstructure where actionId=fId and mapId=categoryId)THEN
     SELECT catType FROM folderstructure where actionId=fId and mapId=categoryId into atype;
     SELECT viewid FROM mapviewcat WHERE  catid=fId and type = 'f'  INTO templateId;
     INSERT INTO mapviewcat(viewid, catid,`type`)VALUES(templateId,categoryId,atype);
     DELETE FROM folderstructure WHERE actionId=fId and mapId=categoryId;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RemoveCategoryFromFolder_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RemoveCategoryFromFolder_v2`(in categoryId int,in fId int,in stype text)
BEGIN
DECLARE templateId INT DEFAULT 0;
Declare atype varchar(10) DEFAULT '';
DECLARE folderId INT DEFAULT 0;

IF(fId=0)then
	IF EXISTS(SELECT * FROM folderstructure where mapId=categoryId)THEN
		 SELECT actionId FROM folderstructure where mapId=categoryId into folderId;
		 IF EXISTS(SELECT * FROM folderstructure where actionId=folderId and mapId=categoryId)THEN
			 SELECT catType FROM folderstructure where actionId=folderId and mapId=categoryId into atype;
			 SELECT viewid FROM mapviewcat WHERE  catid=folderId and type = 'f'  INTO templateId;
			 INSERT INTO mapviewcat(viewid, catid,`type`)VALUES(templateId,categoryId,atype);
			 DELETE FROM folderstructure WHERE actionId=folderId and mapId=categoryId;
		END IF;
		
	END IF;
  else
	IF EXISTS(SELECT * FROM folderstructure where actionId=fId and mapId=categoryId)THEN
     SELECT catType FROM folderstructure where actionId=fId and mapId=categoryId into atype;
     SELECT viewid FROM mapviewcat WHERE  catid=fId and type = 'f'  INTO templateId;
     INSERT INTO mapviewcat(viewid, catid,`type`)VALUES(templateId,categoryId,atype);
     DELETE FROM folderstructure WHERE actionId=fId and mapId=categoryId;
END IF;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_removeTokensAppDevicesOfUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_removeTokensAppDevicesOfUser`(IN appId INT, IN deviceId TEXT, IN chanName TEXT, IN userId INT)
BEGIN

DECLARE chanId INT;
DECLARE isSuccess INT DEFAULT 0;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

START TRANSACTION;

  INSERT INTO oauth_expired_token(token, token_expiry_date, token_type)
  SELECT access_token, NOW(), 'ACCESS' FROM oauth_token WHERE channelid = chanId AND app_id = appId AND device_id = deviceId AND uid = userId;

  INSERT INTO oauth_expired_token(token, token_expiry_date, token_type)
  SELECT refresh_token, NOW(), 'REFRESH' FROM oauth_token WHERE channelid = chanId AND app_id = appId AND device_id = deviceId AND uid = userId;

  DELETE FROM oauth_token
  WHERE channelid = chanId AND app_id = appId AND device_id = deviceId AND uid = userId;

  SET isSuccess = 1;

COMMIT;

SELECT isSuccess;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_RemoveUserFromGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_RemoveUserFromGroup`(IN urId INT, IN grpId INT)
BEGIN

  IF EXISTS (SELECT * FROM uidgid WHERE uid = urId AND gid = grpId) THEN

     DELETE FROM uidgid WHERE uid = urId AND gid = grpId;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_ResetUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_ResetUserPassword`(IN emailId TEXT, IN hash_code TEXT, IN salt_code TEXT, IN u_iterations TEXT)
BEGIN

DECLARE usrId INT;
DECLARE usrName TEXT DEFAULT '';

SELECT userid, uname FROM userinfo WHERE uemail = emailId INTO usrId, usrName;

UPDATE userinfo SET
	uhashcode = hash_code,
	usaltcode = salt_code,
		uiterations = u_iterations
		WHERE userid = usrId;

DELETE FROM userpasswordrequest WHERE userid = usrId;

SELECT usrName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_saveEmbedSettingmap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_saveEmbedSettingmap`(in favicon text,in mtitle text, in mdesc text,in mshortdecs text,in pluginId int,in chanId int)
BEGIN
--  emdfavicom
  update formbuilder_embed 
  set emdfavicom=favicon,
   emdtitle=mtitle,
   emddecscription=mdesc,
   emdshortdescription=mshortdecs
  where plugin_id= pluginId and channel_id=chanId; 
  select 1;
  	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_savefrandlyname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_savefrandlyname`(in fnName text,in pluginId int,in chanId int)
BEGIN
declare respcode int default 0;

if exists(select * from formbuilder_embed where frdname=fnName)then
	if exists(select * from formbuilder_embed where frdname=fnName and plugin_id= pluginId and channel_id=chanId) then
	  update formbuilder_embed set frdname=fnName where plugin_id= pluginId and channel_id=chanId; 
	  set respcode=1;
	 else
	  set respcode=2;
	end if;
 else
  update formbuilder_embed set frdname=fnName where plugin_id= pluginId and channel_id=chanId;
  set respcode=1;
end if;
select respcode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_SetAppMetaJSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_SetAppMetaJSON`(IN appMetaJson TEXT, IN chanName TEXT)
BEGIN

DECLARE chanId INT DEFAULT 0;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF EXISTS (SELECT * FROM appmetajson WHERE channelid = chanId) THEN
	UPDATE appmetajson SET app_meta_json = appMetaJson, modify_date = NOW(), is_valid = 1 WHERE channelid = chanId;
ELSE
	INSERT INTo appmetajson (channelid, app_meta_json, modify_date, is_valid) VALUES (chanId, appMetaJson, NOW(), 1);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_setdevloperPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_setdevloperPlan`( in chanId int)
BEGIN
declare respstatus int;
set respstatus=0;
  if exists(select * from channel where channelid=chanId) Then
    update channel set is_devloper_account=1,dev_create_date=now() where channelid=chanId;
    set respstatus=1;
  end if;
  select respstatus;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_setIconUserFeedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_setIconUserFeedback`(IN feedbackId INT, IN feedbackText VARCHAR(1000), IN pluginVersion TEXT, IN urId INT,

  IN chanId INT, IN iconId INT, IN iconType VARCHAR(9), IN deviceType VARCHAR(45))
BEGIN



DECLARE pluginId, pluginVerId, returnVal, iconExists INT DEFAULT 0;



IF EXISTS (SELECT * FROM actionbutton WHERE abid = iconId AND channelid = chanId) THEN



  IF EXISTS (SELECT * FROM plugin_template_map WHERE ab_id = iconId) THEN



    SELECT plugin_id FROM plugin_template_map WHERE ab_id = iconId INTO pluginId;



    SELECT plugin_ver_id FROM plugin_app_version WHERE plugin_id = pluginId AND version_code = pluginVersion INTO pluginVerId;



    SET iconExists = 1;

  END IF;

   SET iconExists = 1;

ELSE

  IF EXISTS(SELECT * FROM category WHERE catid = iconId AND channelid = chanId)THEN

    SET iconExists = 1;

  END IF;

END IF;



IF(iconExists = 1)THEN

  IF (feedbackId = 0) THEN

    -- Make sure this is the 1st feedback by this user

    IF NOT EXISTS (SELECT * FROM user_feedback_icon WHERE uid = urId AND icon_id = iconId) THEN

          -- Insert new feedback by this user

      INSERT INTO user_feedback_icon (icon_id, icon_type, uid, feedback_text, feedback_create_on, feedback_update_on, plugin_ver_id, channelid, device_type)

      VALUES (iconId, iconType, urId, feedbackText, NOW(), NOW(), pluginVerId, chanId, deviceType);



      SELECT LAST_INSERT_ID() INTO returnVal;

    ELSE

      SET returnVal = -1;

    END IF;

  ELSE

    -- Update existing feedback of this user

    IF EXISTS (SELECT * FROM user_feedback_icon WHERE feedback_id = feedbackId AND uid = urId AND icon_id = iconId) THEN

      UPDATE user_feedback_icon

      SET feedback_text = feedbackText, feedback_update_on = NOW(), plugin_ver_id = pluginVerId, device_type = deviceType

      WHERE feedback_id = feedbackId;



      SET returnVal = feedbackId;

    ELSE

      SET returnVal = -2;

    END IF;

  END IF;

END IF;



SELECT returnVal;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_setIconUserRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_setIconUserRating`(IN urId INT, IN chanId INT, IN iconId INT, IN iconType VARCHAR(9), IN appRating INT, IN deviceType VARCHAR(45), IN pluginVerCode TEXT)
BEGIN



DECLARE pluginId, pluginVerId, totRat INT DEFAULT 0;

DECLARE avgRat FLOAT DEFAULT 0;

DECLARE iType VARCHAR(5);



IF EXISTS (SELECT * FROM actionbutton WHERE abid = iconId AND channelid = chanId) THEN



  IF EXISTS (SELECT * FROM plugin_template_map WHERE ab_id = iconId) THEN



    SELECT plugin_id FROM plugin_template_map WHERE ab_id = iconId INTO pluginId;



    SELECT plugin_ver_id FROM plugin_app_version WHERE plugin_id = pluginId AND version_code = pluginVerCode INTO pluginVerId;



  END IF;



  IF EXISTS (SELECT * FROM user_rating_icon WHERE icon_id = iconId AND uid = urId) THEN

    UPDATE user_rating_icon

    SET rating = appRating,

      rated_on = NOW(),

      device_type = deviceType,

      plugin_ver_id = pluginVerId

    WHERE icon_id = iconId AND uid = urId AND icon_type = iconType;

  ELSE

    INSERT INTO user_rating_icon (icon_id, icon_type, uid, channelid, rating, rated_on, device_type, plugin_ver_id)

    VALUES (iconId, iconType, urId, chanId, appRating, NOW(), deviceType, pluginVerId);

  END IF;

ELSE

  IF EXISTS( SELECT * FROM category where catId = iconId )THEN

    IF EXISTS (SELECT * FROM user_rating_icon WHERE icon_id = iconId AND uid = urId) THEN

      UPDATE user_rating_icon

      SET rating = appRating,

        rated_on = NOW(),

        device_type = deviceType,

        plugin_ver_id = pluginVerId

      WHERE icon_id = iconId AND uid = urId AND icon_type = iconType;

    ELSE

      INSERT INTO user_rating_icon (icon_id, icon_type, uid, channelid, rating, rated_on, device_type, plugin_ver_id)

      VALUES (iconId, iconType, urId, chanId, appRating, NOW(), deviceType, pluginVerId);

    END IF;

  END IF;

END IF;



SELECT COUNT(rating), AVG(rating) FROM user_rating_icon

  WHERE icon_id = iconId AND icon_type = iconType INTO totRat, avgRat;

  

SELECT 1, totRat, avgRat;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_setInternalViewPlugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_setInternalViewPlugin`(IN pluginId INT, IN chanId INT, IN viewCode VARCHAR(20))
BEGIN

DECLARE isSuccess INT DEFAULT 0;
DECLARE actBtnId, actBtnIdPrev INT;

IF EXISTS(SELECT * FROM plugin_app WHERE plugin_id = pluginId)THEN

  SELECT ab_id FROM plugin_template_map WHERE plugin_id = pluginId INTO actBtnId;

  IF NOT EXISTS(SELECT * FROM app_custom_view a WHERE view_code = viewCode AND channelid = chanId)THEN
    INSERT INTO app_custom_view(plugin_id, view_code, channelid, modified_date)
    VALUES(pluginId, viewCode, chanId, NOW());

  ELSE
    -- insert current to history
    -- update app_custom_view
    
    SELECT ptm.ab_id FROM plugin_template_map ptm JOIN app_custom_view acv ON acv.plugin_id = ptm.plugin_id WHERE acv.view_code = viewCode AND acv.channelid = chanId INTO actBtnIdPrev;
    
    UPDATE actionbutton SET `action` = 'localview', modify_date = NOW() WHERE abid = actBtnIdPrev;
    
    INSERT INTO app_custom_view_history(plugin_id, view_code, channelid, modified_date, removed_on)
    SELECT plugin_id, view_code, channelid, modified_date, NOW()
    FROM app_custom_view
    WHERE view_code = viewCode AND channelid = chanId;

    UPDATE app_custom_view
    SET plugin_id = pluginId, modified_date = NOW()
    WHERE view_code = viewCode AND channelid = chanId;
  END IF;

  UPDATE actionbutton SET `action` = 'internalview', modify_date = NOW() WHERE  abid = actBtnId;

  SET isSuccess = 1;
ELSE
  IF(pluginId = 0)THEN

    SELECT ab_id
    FROM plugin_template_map ptm1
      JOIN app_custom_view acv1
        ON ptm1.plugin_id = acv1.plugin_id
    WHERE acv1.channelid = chanId AND acv1.view_code = viewCode INTO actBtnId;

    UPDATE actionbutton SET `action` = 'localview', modify_date = NOW() WHERE channelid = chanId AND abid = actBtnId;

    INSERT INTO app_custom_view_history(plugin_id, view_code, channelid, modified_date, removed_on)
    SELECT plugin_id, view_code, channelid, modified_date, NOW()
    FROM app_custom_view
    WHERE view_code = viewCode AND channelid = chanId;

    DELETE FROM app_custom_view WHERE view_code = viewCode AND channelid = chanId;

    SET isSuccess = 1;
    
  END IF;
END IF;

SELECT isSuccess, actBtnId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_SetLoginData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_SetLoginData`(IN emailId TEXT, IN chanName TEXT, IN devId TEXT, IN devName TEXT, IN devType TEXT, IN appNm TEXT,
									 IN currCity TEXT, IN currCountry TEXT, IN isRooted BOOL)
BEGIN

DECLARE respVal, usrId, urId, chanId INT DEFAULT 0;
DECLARE oldDevId TEXT;
DECLARE canContinue BOOL DEFAULT TRUE;
DECLARE allowRooted BOOL DEFAULT TRUE;
DECLARE deviceLimit, deviceCount INT DEFAULT 0;

START TRANSACTION;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

SELECT userid FROM userinfo WHERE uemail = emailId INTO usrId;

SELECT uid FROM userdetails WHERE userid = usrId AND channelid = chanId INTO urId;
-- auto active
IF EXISTS (SELECT * FROM userinfo ui JOIN userdetails ud ON ui.userid = ud.userid WHERE ui.uemail = emailId AND ud.channelid = chanId AND ui.is_verified =1 AND ud.is_active=0) THEN
		  -- 	SELECT userid FROM userinfo WHERE uemail = userEmail INTO usrId;
		  --   SELECT uid FROM userdetails ud WHERE userid = usrId AND channelid = chanId INTO urId;
      UPDATE userdetails SET is_active=1 WHERE uid = urId AND channelid = chanId;
     
        
END IF;
-- Check how many devices this user has logged into
-- If channel allows limited device, handle appropriately
-- Check allowed_rooted case
IF EXISTS (SELECT * FROM channel_setting WHERE channelid = chanId) THEN
  SELECT device_limit, allow_rooted_device FROM channel_setting 
    WHERE channelid = chanId INTO deviceLimit, allowRooted;

  SELECT COUNT(DISTINCT device_id) FROM oauth_token WHERE uid = urId and device_id!='0000000000' AND channelid = chanId INTO deviceCount;
  
  -- Check for device limit
  IF (deviceLimit > 0 AND deviceCount >= deviceLimit) THEN
    -- Oopsie, not allowed bro!
    -- Make sure this is a new device
    IF NOT EXISTS (SELECT * FROM oauth_token WHERE device_id = devId AND uid = urId) THEN
      -- This is a new device
      SET canContinue = FALSE;
      SET respVal = -70; -- Device Limit reached
    END IF;
  END IF;
  
  -- Check for root device allowance
  IF (allowRooted = FALSE AND isRooted = TRUE) THEN
    -- Oopsie, not allowed
    SET canContinue = FALSE;
    SET respVal = -71; -- Rooted device not allowed
  END IF;
END IF;

-- If channelId = 108
-- Check if this user has already logged from another device
-- Reject otherwise
IF (chanId = 220) THEN
	-- Check if this user is already logged in from any device
	-- If no, then it's okay. Let them proceed.
	IF EXISTS (SELECT * FROM app_login_session WHERE uid = urId) THEN
		-- Check if the user is logged in from this device
		IF EXISTS (SELECT * FROM app_login_session WHERE uid = urId AND device_id = devId) THEN
			UPDATE app_login_session SET is_login_active = 1, last_login = NOW()
			WHERE uid = urId AND device_id = devId;
		ELSE
      -- Update the login session to continue on this device instead
      UPDATE app_login_session SET device_id = devId, is_login_active = 1, last_login = NOW()
      WHERE uid = urId;
			-- SET canContinue = FALSE;
			-- SET respVal = -1;
		END IF;
	ELSE
		INSERT INTO app_login_session (uid, device_id, last_login, is_login_active, last_logout)
		VALUES (urId, devId, NOW(), 1, '0000-00-00 00:00:00');
	END IF;
END IF;

IF (canContinue = TRUE) THEN

  UPDATE userdetails SET appname = appNm, last_app_launch = NOW() WHERE uid = urId;
  UPDATE userinfo SET currentcountry = currCountry, currentcity = currCity WHERE userid = usrId;

  IF NOT EXISTS (SELECT * FROM deviceinfo WHERE deviceid = devId) THEN
  	INSERT INTO deviceinfo (deviceid, devicename, devicetype, deviceversion, deviceregdate, osname, osversion, freememory, is_rooted)
  	VALUES (devId, devName, devType, '', NOW(), '', '', 0, isRooted);
  ELSE
  	UPDATE deviceinfo SET devicename = devName, devicetype = devType, is_rooted = isRooted WHERE deviceid = devId;
  END IF;
  
  IF EXISTS (SELECT * FROM userdevice WHERE userid = usrId) THEN
  	IF NOT EXISTS (SELECT * FROM userdevice WHERE userid = usrId AND deviceid = devId) THEN
  	    INSERT INTO userdevice (userid, deviceid) VALUES (usrId, devId);
        SET respVal = 1;
  	ELSE
  		SET respVal = 1;
  	END IF;
  ELSE
		INSERT INTO userdevice (userid, deviceid) VALUES (usrId, devId);
  	SET respVal = 1;
  END IF;
  
  IF NOT EXISTS (SELECT * FROM appupgrade WHERE uid = urId AND channelId = chanId AND app_name = appNm AND device_id = devId) THEN
  
    INSERT INTO appupgrade
              (uid,
               device_id,
               device_type,
               app_name,
               app_version,
               channelid)
    VALUES     (urId,
               devId,
               devType,
               appNm,
               '',
               chanId);
  END IF;

END IF;

COMMIT;


SELECT respVal, urId, chanId, 0 AS firstLogin;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_SetUserAppLaunchDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_SetUserAppLaunchDate`(IN urId INT, IN chanId INT)
BEGIN

IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId AND is_active = 1) THEN
	INSERT INTO user_app_lauch_activity (uid, login_on, channelid) VALUES (urId, NOW(), chanId);
	UPDATE userdetails SET last_app_launch = NOW() WHERE uid = urId AND channelid = chanId;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_StoreAdminLoginToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_StoreAdminLoginToken`(IN adminId INT, IN oldCookieHash TEXT, IN cookieHash TEXT, IN cookieSalt TEXT, IN cookieCreateDt DATETIME, IN cookieExpireIn INT)
BEGIN

IF (oldCookieHash <> '') THEN
	UPDATE adminremember SET 
	cookie_hash = cookieHash,
	cookie_salt = cookieSalt,
	token_create_date = cookieCreateDt,
	cookie_expire_after_day = cookieExpireIn
	WHERE uid = adminId AND cookie_hash = oldCookieHash;
ELSE
	INSERT INTO adminremember(uid, cookie_hash, cookie_salt, token_create_date, cookie_expire_after_day) VALUES(adminId, cookieHash, cookieSalt, cookieCreateDt, cookieExpireIn);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_StoreAuthProviderToken_Temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_StoreAuthProviderToken_Temp`(IN providerToken TEXT)
BEGIN

 declare restype int;

  INSERT INTO temp_auth_token (token_data, token_create_date)

  VALUES (providerToken, NOW());

  

  SELECT LAST_INSERT_ID() into restype;
  select restype;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_textaccessed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_textaccessed`(in urId int,in contentId int,in chanId int)
BEGIN

declare currentDateTime datetime default now();



start transaction;



if not exists (select * from contentviewed where uid = urId and cid = contentId and channelId = chanId) then



	insert into contentviewed values (urId, contentId, currentDateTime, chanId, 1);	

	insert into textaccessed values (urId, contentId,currentDateTime,1);

else



	update contentviewed set counts = counts + 1, viewedDate = currentDateTime where  uid = urId and cid = contentId and channelId = chanId;

  update textaccessed set  accessedtime = currentDateTime where uid = urId and cid = contentId;

end if;



-- Insert in access history

INSERT INTO contentviewhistory(cid, uid, viewon, channelid) VALUES (contentId, urId, currentDateTime, chanId);

INSERT INTO textaccessedhistory (uid, cid, accessedtime, timespent)

	VALUES (urId, contentId,currentDateTime,1);



commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_TimeSpentOnKnowledgeFeed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_TimeSpentOnKnowledgeFeed`(in urId int, in time_spent int,in chanId text)
BEGIN

declare resultType int default 0;

if exists (select uid from userdetails where uid = urId and channelid = chanId AND is_active = 0) then
    insert into kftimespent (uid, timespent,channelid,modifieddate) values (urId, time_spent,chanId,now());
	set resultType=1;
end if;

 select resultType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_TrackUsageOnApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_TrackUsageOnApp`(IN urId INT, IN timeSpnt BIGINT, IN chanId INT)
BEGIN

IF EXISTS (SELECT uid FROM userdetails WHERE uid = urId AND channelid = chanId) THEN

  IF NOT EXISTS (SELECT uid FROM apptimespent WHERE uid = urId AND channelid = chanId) THEN

    INSERT INTO apptimespent 
            (uid, 
             timespent, 
             modifieddate, 
             channelid) 
    VALUES  (urId, 
             timeSpnt,
             NOW(), 
             chanId);

  ELSE

    UPDATE apptimespent
      SET timespent = timespent + timeSpnt,
          modifieddate = NOW()
      WHERE uid = urId
        AND channelid = chanId;

  END IF;

  INSERT INTO apptimespenthist VALUES (urId, timeSpnt, NOW(), chanId);

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_TrfCategoryToTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_TrfCategoryToTemplate`(IN categoryId INT, IN templateId INT, IN categoryOrActionButton VARCHAR(10), IN displayName VARCHAR(100))
BEGIN



-- DO NOT RETURN ANY VALUE AS THIS SP IS BEING USED IN 'v2_diy_CreateCategory'



IF(displayName = '') THEN



  SET displayName = 'content list';



END IF;



IF NOT EXISTS (SELECT * FROM mapviewcat WHERE viewid = templateId AND catid = categoryId AND `type` = categoryOrActionButton) THEN



  INSERT INTO mapviewcat

    VALUES (templateId, categoryId, categoryOrActionButton, displayName);



END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateAppBannerUrl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateAppBannerUrl`(IN chanId INT, IN bannerUrl VARCHAR(255))
BEGIN



  UPDATE channelrights SET banner_url = bannerUrl, modifieddate = NOW() WHERE channelid = chanId;

  UPDATE appmetajson SET is_valid = 0 WHERE channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateAppModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateAppModule`(IN chanId INT, IN allowSocial BOOLEAN,IN allowProfile BOOLEAN,IN allowDownload BOOLEAN)
BEGIN

IF NOT EXISTS(SELECT * FROM channel_app_module WHERE channelid = chanId) THEN

  INSERT INTO channel_app_module(channelid, allowSocial, allowProfile, allowDownload) 

  VALUES (chanId, allowSocial, allowProfile, allowDownload);

ELSE

  UPDATE channel_app_module SET allowSocial = allowSocial, allowProfile =allowProfile,allowDownload=allowDownload WHERE channelid = chanId;

END IF;

  UPDATE appmetajson SET is_valid = 0 WHERE channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateChannelDownloadLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateChannelDownloadLink`(in chanId int, in downloadAppLink text)
BEGIN



update channel set downloadLink = downloadAppLink where channelid = chanId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_updateChannelGlobalToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_updateChannelGlobalToken`(IN chanId INT, IN newTokenKey TEXT)
BEGIN

DECLARE oldTokKey TEXT;

DECLARE pluginId, oldTokId INT;



IF EXISTS(SELECT * FROM channel WHERE channelid = chanId)THEN



  -- if G token exists in channel > insert the same in expired token table

  -- delete G token of channel from table

  IF EXISTS(SELECT * FROM plugin_token WHERE channelid = chanId AND token_type = 'G')THEN

    SELECT tokenkey, plugin_id, token_id

    FROM plugin_token

    WHERE channelid = chanId AND token_type = 'G'

    INTO oldTokKey, pluginId, oldTokId;



    INSERT INTO plugin_token_expired(tokenkey, token_type, plugin_id, channelid, expired_on)

    VALUES(oldTokKey, 'G', 0, chanId, NOW());



    DELETE FROM plugin_token WHERE token_id = oldTokId;

  END IF;



  -- insert new G token for channel

  INSERT INTO plugin_token(channelid, tokenkey, token_type, plugin_id)

  VALUES(chanId, newTokenKey, 'G', 0);



SELECT newTokenKey AS new_token_global;



END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DIY_UpdateChannelIpRangeV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `DIY_UpdateChannelIpRangeV3`(IN chanId INT,IN ipAddress TEXT,IN operation TEXT)
BEGIN
  UPDATE channel_setting SET valid_console_ip=ipAddress WHERE channelid = chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateCustomEmailTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateCustomEmailTemplate`(IN chanId INT,in fromName text,
            IN isInviteMailCustom BOOL,  IN isForgotPwdMailCustom BOOL,
            IN inviteMailSubject TEXT, IN inviteMailHtml TEXT,
            IN forgotPwdMailSubject TEXT, IN forgotPwdMailHtml TEXT)
BEGIN
IF(isInviteMailCustom) THEN

  IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_INVITE") THEN

    UPDATE emailtemplatecustom SET

      email_body = inviteMailHtml,

      email_subject = inviteMailSubject,

      email_from_name=fromName

    WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_INVITE";

  ELSE

    INSERT INTO emailtemplatecustom(email_body, channelid, email_context, email_subject,is_html,email_from_name) 

    VALUES (inviteMailHtml, chanId, "DRONAMOBILE_USER_INVITE", inviteMailSubject,1,fromName);

  END IF;

ELSE

  Delete from emailtemplatecustom WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_INVITE";

END IF;
IF(isForgotPwdMailCustom) THEN

  IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "TEAMGUM_USER_RESET_PASSWORD") THEN

    UPDATE emailtemplatecustom SET

      email_body = forgotPwdMailHtml,

      email_subject = forgotPwdMailSubject,

      email_from_name=fromName

    WHERE channelid = chanId AND email_context = "TEAMGUM_USER_RESET_PASSWORD";

  ELSE

    INSERT INTO emailtemplatecustom(email_body, channelid, email_context, email_subject,is_html,email_from_name) 

    VALUES (forgotPwdMailHtml, chanId, "TEAMGUM_USER_RESET_PASSWORD", forgotPwdMailSubject,1,fromName);

  END IF;

ELSE

  Delete from emailtemplatecustom WHERE channelid = chanId AND email_context = "TEAMGUM_USER_RESET_PASSWORD";

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_updatecustomSSO_credential` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_updatecustomSSO_credential`(in chanId int,in ssoId text,  in ssoSecret text)
BEGIN
    if not exists(select * from channel_custom_sso_credential where channelid=chanId and sso_id=ssoId and sso_secret=ssoSecret )then
    insert into channel_custom_sso_credential(channelid, sso_id, sso_secret, created_on)value(chanId,ssoId,ssoSecret,now());
    end if;
    select * from channel_custom_sso_credential where channelid=chanId and sso_id=ssoId and sso_secret=ssoSecret;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdatePrivacySupportURL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdatePrivacySupportURL`(IN chanId INT, IN privacyUrl VARCHAR(255),IN supportUrl VARCHAR(255),IN supportMail varchar(255))
BEGIN

IF exists(select * from channelrights where channelid = chanId)Then
  UPDATE channelrights 
  SET 
  privacy_url=privacyUrl,
  support_url=supportUrl,
  support_email=supportMail,
		modifieddate = NOW() 
        WHERE channelid = chanId;

  UPDATE appmetajson SET is_valid = 0 WHERE channelid = chanId;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateTimezone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateTimezone`(IN chZonetype TEXT, IN chZoneId TEXT, IN channel TEXT)
BEGIN

	CALL SetChannelTimezone(chZonetype, chZoneId, channel);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateUserExternalAuth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateUserExternalAuth`(IN urId INT, IN refreshToken TEXT,

    IN accessToken VARCHAR(1255), IN validTill INT, IN oauthProvider TEXT, IN externalProviderResp TEXT)
BEGIN



  DECLARE usrId INT;



  SELECT userid FROM userdetails WHERE uid = urId INTO usrId;

  

  UPDATE userinfo SET is_external_auth = 1 WHERE userid = usrId;



  IF EXISTS (SELECT * FROM user_external_auth WHERE userid = usrId) THEN

    UPDATE user_external_auth

    SET

      access_token = accessToken,

      refresh_token = refreshToken,

      valid_till = validTill,

      last_update = NOW(),

      external_auth_resp = externalProviderResp,

      oauth_provider = oauthProvider

    WHERE userid = usrId;

  ELSE

    INSERT INTO user_external_auth (userid, access_token, refresh_token, valid_till, create_date, oauth_provider, last_update, external_auth_resp) 

      VALUES (usrId, accessToken, refreshToken, validTill, NOW(), oauthProvider, NOW(), externalProviderResp);

  END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpdateUserFavIcons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpdateUserFavIcons`(IN urId INT, IN chanId INT, IN addList TEXT, IN removeList TEXT)
BEGIN

DECLARE iconLimit, iconCounter, iconId INT DEFAULT 0;
DECLARE iconStr, iconType VARCHAR(10) DEFAULT '';

-- DECLARE EXIT HANDLER FOR SQLEXCEPTION
   --  BEGIN
       --  ROLLBACK;
       --  RESIGNAL;
   --  END;
    
-- START TRANSACTION;

  -- Remove icons in list
  IF (removeList <> '') THEN
    SELECT substrcount(removeList, ',')+1 INTO iconLimit;
    SET iconCounter = 0;
    SET iconId = 0;
    SET iconStr = '';
    SET iconType = '';
    
    REPEAT
      SET iconCounter = iconCounter + 1;
      
      SELECT strSplit(removeList, ',', iconCounter) INTO iconStr; -- 1~c
      
      SELECT strSplit(iconStr, '~', 1) INTO iconId;
      SELECT strSplit(iconStr, '~', 2) INTO iconType;
      
      DELETE FROM user_fav_icon 
      WHERE uid = urId AND channelid = chanId
        AND icon_id = iconId AND icon_type = iconType;
      
    UNTIL iconLimit = iconCounter
    END REPEAT;
  END IF;
  
  IF (addList <> '') THEN
    SET iconLimit = 0;
    SET iconCounter = 0;
    SET iconId = 0;
    SET iconStr = '';
    SET iconType = '';
    
    -- Add new icons
    SELECT substrcount(addList, ',')+1 INTO iconLimit;
    
    REPEAT
    
      SET iconCounter = iconCounter + 1;
      
      SELECT strSplit(addList, ',', iconCounter) INTO iconStr; -- 1~c
      
      SELECT strSplit(iconStr, '~', 1) INTO iconId;
      SELECT strSplit(iconStr, '~', 2) INTO iconType;
      
      IF NOT EXISTS (SELECT * FROM user_fav_icon WHERE uid = urId AND channelid = chanId
        AND icon_id = iconId AND icon_type = iconType) THEN
        
        INSERT INTO user_fav_icon (uid, channelid, icon_id, icon_type, fav_date)
        VALUES (urId, chanId, iconId, iconType, NOW());
      END IF;
    
    UNTIL iconLimit = iconCounter
    END REPEAT;
  END IF;
  
-- COMMIT;

SELECT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_updateUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_updateUserInfo`(in urId int,in userName text,in userdesg text,in country text,in city text,in Uabouts text,in chanId int)
BEGIN
DECLARE usrId, respType, uProfileReadOnly INT DEFAULT 0;
IF EXISTS(SELECT * FROM channel_setting WHERE channelid = chanId)THEN
  SELECT user_profile_readonly FROM channel_setting WHERE channelid = chanId INTO uProfileReadOnly;
END IF;

IF(uProfileReadOnly <> 1)THEN
	IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId AND is_active = 1) THEN
    SELECT userid FROM userdetails WHERE uid = urId INTO usrId;

    UPDATE userinfo set uname=userName,udesg=userdesg,currentcountry=country,currentcity=city,userabout=Uabouts where userid=usrId;
		SET respType=1;
	ELSE
		   SET respType=3;
	END IF;
ELSE
  SET respType=2; -- user profile is readonly
END IF;

SELECT respType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_UpgradeAck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_UpgradeAck`(IN urId INT, IN appName TEXT, IN deviceType TEXT, IN chanId INT)
BEGIN



IF EXISTS (SELECT * FROM appupgradestatus WHERE uid = urId AND uid = urId AND app_name = appName AND device_type = deviceType AND upgrade_status = 0 AND channelId = chanId) THEN



  UPDATE appupgradestatus 

  SET    upgrade_status = 1, 

         upgraded_on = Now() 

  WHERE  uid = urid 

         AND app_name = appname 

         AND device_type = devicetype 

         AND upgrade_status = 0 

         AND channelid = chanid; 



END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_ValidateUserNonce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_ValidateUserNonce`(IN nonce VARCHAR(10), IN urId INT, IN userEmail TEXT, IN chanId INT)
BEGIN

DECLARE isValid INT DEFAULT 0;
DECLARE u_Id INT DEFAULT 0;

IF (urId > 0) THEN
  SELECT ud.uid FROM userdetails ud 
  WHERE ud.uid = urId
    AND ud.is_active = 1
  INTO u_Id;
ELSE
  IF (userEmail <> '') THEN
    SELECT ud.uid FROM userdetails ud JOIN userinfo ui ON ui.userid = ud.userid
    WHERE ui.uemail = userEmail AND ud.channelid = chanId AND ud.is_active = 1
    INTO u_Id;
  END IF;
END IF;

IF EXISTS(SELECT * FROM oauth_token WHERE nonce = LEFT(access_token , 10) AND uid = u_Id)THEN
  SET isValid = 1;
END IF;

SELECT isValid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_ValidateUserNonce_V2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_ValidateUserNonce_V2`(IN nonce VARCHAR(10), IN urId INT)
BEGIN
DECLARE isValid INT DEFAULT 0;
DECLARE u_Id INT DEFAULT 0;
IF (urId > 0) THEN
  SELECT ud.uid FROM userdetails ud
  WHERE ud.uid = urId
    AND ud.is_active = 1
  INTO u_Id;
END IF;
IF EXISTS(SELECT * FROM oauth_token WHERE nonce = LEFT(access_token , 10) AND uid = u_Id)THEN
  SET isValid = 1;
END IF;
SELECT isValid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diy_ValidateUserWithExternalAuth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `diy_ValidateUserWithExternalAuth`(IN urId INT, IN chanId INT)
BEGIN

  DECLARE returnType, usrId INT DEFAULT 0;

  DECLARE isExternalAuth BOOL DEFAULT FALSE;



  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND channelid = chanId AND is_active = 1) THEN

    SELECT userid FROM userdetails WHERE uid = urId INTO usrId;



    SELECT is_external_auth FROM userinfo WHERE userid = usrId INTO isExternalAuth;



    IF (isExternalAuth = 1) THEN

      SET returnType = 2;

    ELSE

      SET returnType = 1;

    END IF;

  ELSE

    SET returnType = -1;

  END IF;



  SELECT returnType;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_add_modify_api_category_v4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_add_modify_api_category_v4`(IN categoryId INT, IN channelId INT, IN catName TEXT,IN catDesc TEXT, IN catIcon TEXT, IN schemeType TEXT, IN updatedBy TEXT, IN catType TEXT)
BEGIN
	DECLARE resp INT DEFAULT 0;
	IF categoryId = 0 THEN
		IF NOT EXISTS(SELECT 1 FROM api_category WHERE LOWER(cat_name) = LOWER(catName) AND channel_id = channelId) THEN
			INSERT INTO `api_category` (`channel_id`, `cat_name`, `cat_desc`, `cat_image_url`, `scheme_type`, `created_by`, `updated_by`, `cat_type`, `format_id`)
            VALUES(channelId, catName, catDesc, catIcon, schemeType, updatedBy, updatedBy, catType, uuid());
			SELECT LAST_INSERT_ID() INTO resp;
		END IF;
    ELSE
		IF NOT EXISTS(SELECT 1 FROM api_category WHERE LOWER(cat_name) = LOWER(catName) AND channel_id = channelId AND api_category_id != categoryId) THEN
			UPDATE `api_category`
			SET `cat_name` = catName, `cat_desc` = catDesc, `cat_image_url` = catIcon, `scheme_type` = schemeType, `updated_by` = updatedBy, `updated_on` = CURRENT_TIMESTAMP, `cat_type` = catType
			WHERE `api_category_id` = categoryId AND `channel_id` = channelId;
			SET resp = categoryId;
		END IF;
    END IF;			
	SELECT resp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_add_update_delete_ai_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_add_update_delete_ai_key`(IN channelId INT, IN key_name TEXT, IN key_data longtext, IN user_email TEXT, IN isdefault INT, IN operation TEXT)
BEGIN
	DECLARE hasclone INT DEFAULT 0;
	IF operation = "add" THEN
		SELECT COUNT(`name`) INTO hasclone FROM `studio_ai_keys` where `name` = key_name AND `channel_id` = channelId;
        IF hasclone = 0 THEN
			INSERT INTO `studio_ai_keys`(`name`,`key`,`channel_id`,`is_default`,`user_email`)
			VALUES(key_name,key_data,channelId,isdefault,user_email);

            SELECT 1 as result;
		ELSE
			SELECT 0 as result;
        END IF;
    ELSEIF operation = "update" THEN
		UPDATE `studio_ai_keys`
		SET `key` = key_data, `user_email` = user_email
		WHERE `name` = key_name AND `channel_id` = channelId AND id <> 0;
	ELSEIF operation = "makedefault" THEN
		UPDATE `studio_ai_keys`
		SET `is_default` = 0
		WHERE `channel_id` = channelId AND id <> 0;

		UPDATE `studio_ai_keys`
		SET `is_default` = isdefault, `user_email` = user_email
		WHERE `name` = key_name AND `channel_id` = channelId AND id <> 0;
	ELSEIF operation = "delete" THEN
		DELETE FROM `studio_ai_keys`
		WHERE `name` = key_name AND `channel_id` = channelId AND id <> 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_add_update_gateway_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_add_update_gateway_key`(IN channelId INT,IN unique_name TEXT,IN keys_data TEXT,IN user_email TEXT)
BEGIN
			IF NOT EXISTS( select 1 from studio_gateway_key sgk where sgk.name = unique_name)
			THEN
				INSERT INTO `studio_gateway_key` (`name`,`channel_id`,`user_email`,`keys`)
				VALUES(unique_name,channelId,user_email,keys_data);
			ELSE
				UPDATE studio_gateway_key 
				SET 
					`channel_id` = channelId, 
					`user_email` = user_email, 
					`keys` = keys_data 
				WHERE `name` = unique_name;
			END IF;
		END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_change_function_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_change_function_status`(IN function_id INT,IN function_type INT,IN state INT,IN is_promiss INT)
BEGIN
   DECLARE nameAlreadyExists INT default 0;
    /*IF action = add, check if function with same name doesnt exist in same channel*/
   IF EXISTS(SELECT 1 FROM studio_functions sf WHERE  sf.id=function_id )
           THEN
               UPDATE studio_functions sf SET sf.status = state,sf.function_type = function_type, sf.is_promiss = is_promiss WHERE  sf.id=function_id;
              SELECT "1" AS 'response';
   ELSE
               SELECT "0" AS 'response';
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_CreateOrEditFormbuilder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_CreateOrEditFormbuilder`(IN pluginId INT, IN chanId INT, IN editorJson LONGTEXT, IN userId INT)
BEGIN
	DECLARE CurrentDt DATETIME DEFAULT NOW();
    DECLARE entryCount INT DEFAULT 0;
    SELECT  1 FROM formbuilder_tool WHERE plugin_id = pluginId AND channelId = chanId LIMIT 1 INTO entryCount;
	 IF (entryCount > 0) THEN
		UPDATE formbuilder_tool
		  SET
			formeditor = editorJson,
			updated_on = CurrentDt,
			last_updated_by = userId
		  WHERE plugin_id = pluginId AND channelId = chanId;
		SELECT 1 AS 'status',  CurrentDt AS 'last_updated_on';
	ELSE
		INSERT INTO
			formbuilder_tool( title, formcontent, formhash,plugin_id, channelId, formeditor,tytitle, tytext, createdon, created_by, last_updated_by, updated_on)
			values('','','',pluginId, chanId, editorJson,'','',CurrentDt,userId, userId, CurrentDt);
		SELECT 2 AS 'status',  CurrentDt AS 'last_updated_on';
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_GetFormBuilderVersionDataByFdpId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_GetFormBuilderVersionDataByFdpId`(IN fdpId INT, IN channelId INT)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS VersionDataTable;
	CREATE TEMPORARY TABLE VersionDataTable AS  
		SELECT fdp_id,form_id,plugin_id,form_editor,conditional_visibility_data,validation_data,created_date,fdp_type,fdp_version,release_notes,user_id
		FROM formbuilder_download_publish
		WHERE fdp_id= fdpId;
	
   /* UPDATE formbuilder_tool fb
    INNER JOIN VersionDataTable V ON fb.formid = V.form_id
	  SET
		fb.formeditor = V.form_editor,
		fb.validation_data = V.validation_data,
		fb.conditional_visibility_data = V.conditional_visibility_data,
		fb.updated_on = V.created_date,
		fb.last_updated_by = V.user_id,
        version = fdp_version
	WHERE formid = V.form_id AND channelId = channelId;*/
    
    SELECT fdp_id,form_id,plugin_id,form_editor,conditional_visibility_data,validation_data,created_date,fdp_type,fdp_version,release_notes
    FROM VersionDataTable
    WHERE fdp_id= fdpId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_GetFormBuilderVersionsByPluginId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_GetFormBuilderVersionsByPluginId`(IN pluginId int)
BEGIN
	SELECT fdp.fdp_id,fdp.fdp_version,fdp.release_notes,fdp.created_date,fdp.environment_type,ui.uname
    FROM formbuilder_download_publish fdp
    JOIN userdetails ud ON fdp.user_id = ud.uid
    JOIN userinfo ui ON ud.userid = ui.userid
    WHERE plugin_id= pluginId AND fdp_type="pjq"
    ORDER BY fdp.fdp_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_GetUserOnboardingStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_GetUserOnboardingStatus`(IN channelId INT, IN uemail VARCHAR(250))
BEGIN
	DECLARE selectedUid INT;
	
    SELECT ud.uid
	FROM userinfo ui INNER JOIN userdetails ud 
	ON ui.userid = ud.userid AND ui.uemail = uemail AND ud.channelid = channelId
    INTO selectedUid;
     -- check uid present for the entered email
    IF NULLIF(selectedUid, '') IS NOT NULL THEN
		-- IF no record found then return all status as 0
		IF NOT EXISTS(SELECT 1 FROM fb_user_onboarding_status WHERE uid=selectedUid AND channelid=channelId) THEN
			SELECT 0 AS 'studio_status' , 0 AS 'app_listing_status', 0 AS 'sheet_status';
		
        -- ELSE return the respecive found status
        ELSE
			SELECT studio_status,app_listing_status,sheet_status 
			FROM fb_user_onboarding_status
			WHERE uid=selectedUid AND channelid=channelId;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_ai_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_ai_key`(IN account_name TEXT,IN channelid INT)
BEGIN
    IF account_name <> "" THEN
        SELECT `key` FROM `studio_ai_keys` 
        WHERE `name`= account_name AND `channel_id` = channelid;
    ELSE 
        SELECT `key` FROM `studio_ai_keys` 
        WHERE `is_default`= 1 AND `channel_id` = channelid;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_all_public_gateway_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_all_public_gateway_key`(IN channelId INT)
BEGIN
    SELECT tokens.keys, tokens.name 
    FROM studio_gateway_key tokens
    WHERE tokens.channel_id = channelId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_api_category_meta_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_api_category_meta_info`(IN channelId INT, IN catId INT)
BEGIN
	SELECT `api_category_id` as `cat_id`, `channel_id`, `cat_name`, `cat_desc`, `cat_image_url` as `cat_icon`, `scheme_type`, `mongo_doc_id` as `doc_id`
    FROM `api_category` where `channel_id` = channelId  AND `api_category_id` = catId LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_control_for_marketplace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_control_for_marketplace`(IN globalChannelID INT)
BEGIN
	SELECT id as `control_id`,name as control_name ,'0.0.0' as `ver`
    FROM studio_controls sc
    WHERE  sc.channel_id IN (globalChannelID,0)  AND is_on_marketplace = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_published_controls_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_published_controls_v3`(IN channel_id INT,IN userEmail TEXT)
BEGIN
	SELECT id as `control_id`, name as `control_name`, current_version as `ver`,g_id as `group_id`,user,is_deprecated AS 'isDeprecated',is_from_designer AS 'isDesigner', dependencyJSON ,
    CASE WHEN sc.channel_id = 0 THEN 0
      ELSE 1
	END AS 'isCustomControl'
    FROM studio_controls sc
    WHERE
	   ((user <> userEmail AND sc.channel_id IN (channel_id,0)  AND status = 1) #Get all published controls of this channel(Which have status active) except created by this user.
			OR (user = userEmail  AND sc.channel_id IN (channel_id,0)) #get all controls created by current user irrespective of the status. This is if the current user wants to debug.
		) AND sc.is_on_marketplace = 0; # To filter non marketplace controls
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_published_functions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_published_functions`(IN channel_id INT, IN globalChannelId INT)
BEGIN
	-- 1154
SELECT id as `function_id`,current_version as `ver`,function_type as `type`,is_promiss as `promiss`,
    CASE WHEN sf.channel_id = globalChannelId THEN 0
		ELSE 1
	END AS 'isCustomFunction'
    
    FROM studio_functions sf
    WHERE sf.channel_id IN (channel_id,globalChannelId)  AND status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_studio_control_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_studio_control_status`(IN chanID INT,IN getGlobalChannelControls INT)
BEGIN
	IF getGlobalChannelControls THEN 
			SELECT id as 'control_id',g_id as 'group',status,is_deprecated AS 'isDeprecated',is_from_designer AS 'isFromDesigner',is_on_marketplace AS 'isOnMarketplace'
			FROM studio_controls
			WHERE channel_id IN (chanID,0);
    ELSE 
			SELECT id as 'control_id',g_id as 'group',status,is_deprecated AS 'isDeprecated',is_from_designer AS 'isFromDesigner',is_on_marketplace AS 'isOnMarketplace'
			FROM studio_controls
			WHERE channel_id = chanID;
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_studio_function_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_studio_function_status`(IN chanID INT)
BEGIN
	SELECT id as 'function_id',status,function_type,is_promiss
	FROM studio_functions 
	WHERE channel_id = chanID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_studio_template_ids_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_studio_template_ids_v2`(IN chanID INT,IN search_for varchar(20))
BEGIN
	IF (search_for = "showcase") THEN
		SELECT  id as 'template_id'
		FROM studio_templates
		WHERE channel_id IN (chanID,0) AND is_showcase = 1;
	ELSE
		SELECT id as 'template_id', is_premium as `is_premium`
		FROM studio_templates
		WHERE channel_id IN (chanID,0) AND status = 1;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_template_key_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_template_key_list`(IN templateID INT)
BEGIN
	DECLARE noKeysFoundForTemplate INT DEFAULT -1;
    IF EXISTS(SELECT 1 FROM studio_template_keys stk WHERE stk.template_id = templateID)
		THEN
			SELECT template_id,key_code,is_expired,for_plugin FROM studio_template_keys stk WHERE stk.template_id = templateID ORDER BY stk.is_expired ASC;
        ELSE
			SELECT noKeysFoundForTemplate as 'template_id';
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_get_template_meta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_get_template_meta`(IN plugin_id INT,IN template_id INT,IN search_type TEXT,IN channel_id INT)
BEGIN
DECLARE dVal INT DEFAULT -1;
    IF (search_type = "pid") THEN
		IF EXISTS(SELECT 1 FROM studio_templates st WHERE st.plugin_id = plugin_id)
			THEN
				SELECT 
                    formbuilder_embed.embedcode,
                    formbuilder_embed.is_disable,
                    studio_templates.id,
                    studio_templates.status,
                    studio_templates.is_premium,
                    studio_templates.is_showcase
                FROM studio_templates 
                LEFT JOIN formbuilder_embed 
					ON studio_templates.plugin_id = formbuilder_embed.plugin_id 
				WHERE studio_templates.plugin_id = plugin_id LIMIT 1;
				/*SELECT id,status,is_premium FROM studio_templates st WHERE st.plugin_id = plugin_id AND st.channel_id = channel_id LIMIT 1;*/
		ELSE 
				SELECT dVal AS 'id';
		end IF;
	ELSEIF(search_type = "tid") THEN
		IF EXISTS(SELECT 1 FROM studio_templates st WHERE st.id = template_id)
			THEN
				SELECT 
                    formbuilder_embed.embedcode,
					formbuilder_embed.is_disable,
                    studio_templates.id,
                    studio_templates.status,
                    studio_templates.is_premium,
                    studio_templates.is_showcase
                FROM studio_templates 
                LEFT JOIN formbuilder_embed 
					ON studio_templates.plugin_id = formbuilder_embed.plugin_id 
				WHERE studio_templates.id = template_id LIMIT 1;
                /*AND studio_templates.channel_id IN(chanId,0)*/
				/*SELECT id,status,is_premium FROM studio_templates st WHERE st.id= template_id AND st.channel_id = channel_id LIMIT 1;*/
		ELSE 
				SELECT dVal AS 'id';
		end IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_InsertFormbuilderDownloadPublish` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_InsertFormbuilderDownloadPublish`(fdpSecretKey TEXT, pluginId INT, userId INT, formEditor LONGTEXT, IN conditionalVisibilityData LONGTEXT, IN validationData LONGTEXT, fdpType VARCHAR(10), IN newVersion VARCHAR(10), IN releaseNotes VARCHAR(200), IN environmentType VARCHAR(10))
BEGIN
	DECLARE frmId INT DEFAULT 0;
	SELECT formid FROM formbuilder_tool WHERE plugin_id = pluginId INTO frmId;
	
    -- IF fdpType='pjq' THEN 
		-- UPDATE formbuilder_tool SET version=newVersion WHERE formid=frmId;
    -- END IF;
    
	INSERT INTO 
		formbuilder_download_publish(fdp_secret_key, form_id, plugin_id, user_id, form_editor,conditional_visibility_data, validation_data,fdp_type, created_date, release_notes, fdp_version, environment_type)
		VALUES(fdpSecretKey, frmId, pluginId, userId, formEditor,conditionalVisibilityData, validationData, fdpType, NOW(), releaseNotes, newVersion, environmentType);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_save_app_template_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_save_app_template_v2`( IN channel_id INT,IN userEmail TEXT,IN actionType TEXT,IN status TEXT,IN plugin_id INT,IN is_premium bool,IN is_show_case bool)
BEGIN
	IF NOT EXISTS(SELECT 1 FROM studio_templates st WHERE st.plugin_id = plugin_id)
		THEN
			INSERT INTO `studio_templates` (`channel_id`,`status`,`user`,`plugin_id`,`is_premium`,`is_showcase`)
			VALUES(channel_id,status,userEmail,plugin_id,is_premium,is_show_case);
			SELECT id FROM studio_templates st WHERE st.plugin_id= plugin_id AND st.channel_id = channel_id;
	ELSE
			UPDATE studio_templates st 
				SET `status` =  status,
					`is_premium` = is_premium,
					`is_showcase` = is_show_case
                    WHERE st.plugin_id= plugin_id;
			SELECT id FROM studio_templates st WHERE st.plugin_id= plugin_id;
	end IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_save_studio_control_v4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_save_studio_control_v4`(IN control_name TEXT,IN group_id INT,IN channel_id INT,IN userEmail TEXT,IN actionType TEXT,IN status TEXT, IN isDesigner INT,IN GlobalChannelId INT)
BEGIN

DECLARE nameAlreadyExists INT default 0;

IF actionType = 'add' AND channel_id != 0
	THEN
    /*IF action = add, check if function with same name doesnt exist in same channel*/
	IF NOT EXISTS(SELECT 1 FROM studio_controls sc WHERE sc.name = control_name AND (sc.channel_id = channel_id OR sc.channel_id = 0))
			THEN
				INSERT INTO `studio_controls` (`name`,`g_id`,`channel_id`,`current_version`,`status`,`user`,`is_from_designer`)
				VALUES(control_name,group_id,channel_id,'0.0.0',status,userEmail,isDesigner);
				SELECT id FROM studio_controls sc WHERE sc.name= control_name AND sc.channel_id = channel_id;
			ELSE
				SELECT "-1" AS id;
	end IF;
ELSEIF actionType = 'add' AND channel_id = 0 
	THEN
	IF NOT EXISTS(SELECT 1 FROM studio_controls sc WHERE sc.name = control_name)
			THEN
				INSERT INTO `studio_controls` (`name`,`g_id`,`channel_id`,`current_version`,`status`,`user`,`is_from_designer`)
				VALUES(control_name,group_id,channel_id,'0.0.0',status,userEmail,isDesigner);
				SELECT id FROM studio_controls sc WHERE sc.name= control_name AND sc.channel_id = channel_id;
			ELSE
				SELECT "-1" AS id;
	end IF;
ELSEIF actionType = 'update'
	THEN
		/*IF action = Update, ID of the function is returned */
		IF channel_id = 0
		THEN
		    IF EXISTS(SELECT 1 FROM studio_controls sc WHERE sc.name = control_name AND (sc.channel_id = GlobalChannelId OR sc.channel_id = 0))
                THEN
                SELECT id FROM studio_controls sc WHERE sc.name= control_name AND (sc.channel_id = GlobalChannelId OR sc.channel_id = 0);
            ELSE SELECT -1 AS id;
            end IF;
        ELSE
            IF EXISTS(SELECT 1 FROM studio_controls sc WHERE sc.name = control_name AND sc.channel_id = channel_id )
                THEN
                SELECT id FROM studio_controls sc WHERE sc.name= control_name AND sc.channel_id = channel_id;
            ELSE SELECT -1 AS id;
            END IF;
        END IF;
end IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_save_studio_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_save_studio_function`(IN function_name TEXT,IN channel_id INT,IN globalChannelID INT,IN actionType TEXT,IN status INT, IN isPromiss INT)
BEGIN
	
DECLARE nameAlreadyExists INT default 0;

IF actionType = 'add'
	THEN
    /*IF action = add, check if function with same name doesnt exist in same channel*/
	IF NOT EXISTS(SELECT 1 FROM studio_functions sf WHERE sf.name = function_name AND (sf.channel_id = channel_id OR sf.channel_id = globalChannelID))
			THEN
				INSERT INTO `studio_functions` (`name`,`channel_id`,`current_version`,`status`,`is_promiss`)
            VALUES(function_name,channel_id,'0.0.0',status,isPromiss);
            SELECT id FROM studio_functions sf WHERE sf.name= function_name AND sf.channel_id = channel_id;
			ELSE
				SELECT "-1" AS id;
	end IF;
ELSEIF actionType = 'update'
	THEN
		/*IF action = Update, ID of the function is returned */
		IF EXISTS(SELECT 1 FROM studio_functions sf WHERE sf.name = function_name AND sf.channel_id = channel_id )
			THEN
			SELECT id FROM studio_functions sf WHERE sf.name= function_name AND sf.channel_id = channel_id;
		ELSE SELECT -1 AS id;
        end IF;
end IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_update_api_category_mongo_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_update_api_category_mongo_id`(IN channelId INT, IN catId INT, IN mongoId TEXT)
BEGIN
	IF EXISTS(SELECT 1 FROM api_category WHERE api_category_id = catId AND channel_id = channelId) THEN
		UPDATE `api_category`
        SET `mongo_doc_id` = mongoId
		WHERE `api_category_id` = catId AND `channel_id` = channelId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_update_control_meta_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_update_control_meta_v3`(IN isDeprecated INT,IN id INT,IN group_id INT,IN status INT,IN isOnMarketplace INT,IN dependencyJSONStringified TEXT)
BEGIN
	IF EXISTS(SELECT 1 FROM studio_controls sc WHERE sc.id = id)
			THEN
				UPDATE `studio_controls` sc
                SET sc.g_id = group_id,
					sc.status = status,
					sc.is_deprecated = isDeprecated,
					sc.is_on_marketplace = isOnMarketplace,
                    sc.dependencyJSON = dependencyJSONStringified
				WHERE sc.id = id;
				SELECT "1" AS 'id';
	ELSE
		SELECT "-1" AS Err;
	end IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_update_control_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_update_control_version`(IN control_id TEXT,IN current_version TEXT,IN release_note MEDIUMTEXT)
BEGIN
	UPDATE studio_controls
	SET `current_version` = current_version,
	`release_note` = release_note,
	`status` = 1
	WHERE id  = control_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_update_function_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_update_function_version`(IN function_id TEXT,IN current_version TEXT, IN release_note MEDIUMTEXT)
BEGIN
	UPDATE studio_functions
	SET `current_version` = current_version,
	`release_note` = release_note
	WHERE id  = function_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fb_update_template_keycode_used` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `fb_update_template_keycode_used`(IN key_code VARCHAR(13))
BEGIN
	IF EXISTS(SELECT 1 FROM studio_template_keys sk WHERE  sk.key_code = key_code )
			THEN
				UPDATE studio_template_keys sk SET sk.is_expired = 1 WHERE (sk.key_code = key_code);
                SELECT 'ok' AS 'resp';
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAPISelectedCatInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `getAPISelectedCatInfo`(in catIds TEXT)
BEGIN

    SELECT *, ac.isDeleted as api_del, sc.isDeleted as subCat_del FROM api_category ac
    join api_sub_category sc 
        on sc.category_id = ac.api_category_id 
    where
		FIND_IN_SET(ac.api_category_id ,catIds );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAWSCredentials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetAWSCredentials`(IN chanName TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

SELECT DCR(accesskey), DCR(secretkey) FROM awscredentials WHERE channelid = chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getChannelIdUsingEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `getChannelIdUsingEmail`(IN email TEXT)
BEGIN
	select ud.channelid from userinfo ui
	JOIN userdetails ud on ud.userid = ui.userid
	where uemail = email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChannelInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetChannelInfo`(in chanName text)
BEGIN

select c.channelid, c.channelname, c.channelinfo, c.channelimg, c.registrationdatetime, c.display, c.bannerimg,
cr.launchscreen, cr.switchchannelflag, cr.subscriptionflag, cr.categorytitle, cr.authortitle, cr.modifieddate,cr.splash_bg_url,
cr.splash_logo_url,cr.splash_logo_text,cr.splash_text, c.channelwebsite, cr.recommendation_Allowed, cr.ispublicread,cr.splash_bg_bb_url,
cr. chan_Cat_Listing from
channel c join channelrights cr on c.channelid = cr.channelid where c.channelname = chanName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChannelMailSettings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetChannelMailSettings`(IN chanId INT)
BEGIN



DECLARE is_invitemail_custom, is_welcomemail_custom, is_forgotpwdmail_custom, is_pwdchangemail_custom bool DEFAULT false;

DECLARE invite_email_subject,invite_email_body,invite_is_html,invite_emailhtmlbody TEXT DEFAULT "";

DECLARE welcome_email_subject,welcome_email_body,welcome_is_html,welcome_emailhtmlbody TEXT DEFAULT "";

DECLARE forgotpwd_email_subject,forgotpwd_email_body,forgotpwd_is_html,forgotpwd_emailhtmlbody TEXT DEFAULT "";

DECLARE pwdchange_email_subject,pwdchange_email_body,pwdchange_is_html,pwdchange_emailhtmlbody TEXT DEFAULT "";



SELECT et.emailhtmlbody

  FROM emailtemplate et WHERE emailcontext = "DRONAMOBILE_USER_INVITE"

  INTO invite_emailhtmlbody;

SELECT et.emailhtmlbody

  FROM emailtemplate et WHERE emailcontext = "DRONAMOBILE_USER_WELCOME"

  INTO welcome_emailhtmlbody;

SELECT et.emailhtmlbody

  FROM emailtemplate et WHERE emailcontext = "TEAMGUM_USER_RESET_PASSWORD"

  INTO forgotpwd_emailhtmlbody;

SELECT et.emailhtmlbody

  FROM emailtemplate et WHERE emailcontext = "DRONAMOBILE_USER_PASSWORD_CHANGED"

  INTO pwdchange_emailhtmlbody;



IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_INVITE") THEN

	SET is_invitemail_custom = true;

	SELECT email_body, is_html, email_subject

    FROM emailtemplatecustom

    WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_INVITE"

    INTO invite_email_body,invite_is_html,invite_email_subject;

END IF;

IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_WELCOME") THEN

	SET is_welcomemail_custom = true;

	SELECT email_body, is_html, email_subject

    FROM emailtemplatecustom

    WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_WELCOME"

    INTO welcome_email_body,welcome_is_html,welcome_email_subject;

  else

    SELECT et.emailsubject

      FROM emailtemplate et WHERE emailcontext = "DRONAMOBILE_USER_WELCOME"

    INTO welcome_email_subject;

END IF;

IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "TEAMGUM_USER_RESET_PASSWORD") THEN

	SET is_forgotpwdmail_custom = true;

	SELECT email_body, is_html, email_subject

    FROM emailtemplatecustom

    WHERE channelid = chanId AND email_context = "TEAMGUM_USER_RESET_PASSWORD"

    INTO forgotpwd_email_body,forgotpwd_is_html,forgotpwd_email_subject;

  else

    SELECT et.emailsubject

      FROM emailtemplate et WHERE emailcontext = "TEAMGUM_USER_RESET_PASSWORD"

    INTO forgotpwd_email_subject;

END IF;

IF EXISTS (SELECT * FROM emailtemplatecustom WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_PASSWORD_CHANGED") THEN

	SET is_pwdchangemail_custom = true;

	SELECT email_body, is_html, email_subject

    FROM emailtemplatecustom

    WHERE channelid = chanId AND email_context = "DRONAMOBILE_USER_PASSWORD_CHANGED"

    INTO pwdchange_email_body,pwdchange_is_html,pwdchange_email_subject;

  else

    SELECT et.emailsubject

      FROM emailtemplate et WHERE emailcontext = "DRONAMOBILE_USER_PASSWORD_CHANGED"

    INTO pwdchange_email_subject;

END IF;

select is_invitemail_custom, is_welcomemail_custom, is_forgotpwdmail_custom, is_pwdchangemail_custom,invite_email_subject,invite_email_body,invite_is_html,invite_emailhtmlbody,

welcome_email_subject,welcome_email_body,welcome_is_html,welcome_emailhtmlbody,

forgotpwd_email_subject,forgotpwd_email_body,forgotpwd_is_html,forgotpwd_emailhtmlbody,

pwdchange_email_subject,pwdchange_email_body,pwdchange_is_html,pwdchange_emailhtmlbody;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChannelTimezone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetChannelTimezone`(IN chanName TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

SELECT tzonedname, tzoneid FROM channeltimezone WHERE channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEmailTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetEmailTemplate`(IN mailContext TEXT)
BEGIN

SELECT emailsubject, emailhtmlbody, emailbcc FROM emailtemplate WHERE emailcontext = mailContext;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLicensedSpace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetLicensedSpace`(IN chanName TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

SELECT DCR(ecapsksid) FROM saaslicense WHERE channelid = chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLicenseStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetLicenseStatus`(IN chanName TEXT)
BEGIN

DECLARE chanId INT;
DECLARE returnType TEXT;

SET returnType = '';
SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF EXISTS (SELECT * FROM saaslicensestatus WHERE channelid = chanId AND status = 0) THEN
    SELECT reason FROM saaslicensestatus WHERE channelid = chanId INTO returnType;
END IF;

SELECT returnType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPluginTokens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `getPluginTokens`()
BEGIN

  SELECT tokenkey FROM plugin_token;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSaaSLicenseDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetSaaSLicenseDetails`(IN chanName TEXT)
BEGIN

DECLARE chanId, licDuration, licUser, licDelivery, licPush, licBcm, licCateg, userCount, deliveryCount, pushCnt, bcmCount, categCount INT;
DECLARE planType, channelMail TEXT;
DECLARE licStart, licRecurrDate DATETIME;
DECLARE licSpace DOUBLE;
DECLARE graceDur INT;
DECLARE finStat VARCHAR(5);

SET planType = '';
SET deliveryCount =0;
SET pushCnt = 0;
SET bcmCount = 0;
SET userCount=0;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
SELECT contactmail FROM channel WHERE channelid = chanId INTO channelMail;

IF EXISTS (SELECT * FROM saaslicense WHERE channelid = chanId) THEN
	SELECT planname, DCR(noitarud), DCR(tratsfoetad), DCR(tnuocresu), DCR(tnuocyreviled),
	  DCR(ecapsksid), DCR(tnuochsup), DCR(etadrrucer), DCR(tnuocmcb), DCR(tnuocgetac),
	  grace_duration, fin_status
  FROM saaslicense WHERE channelid = chanId
  INTO planType, licDuration, licStart, licUser, licDelivery, licSpace, licPush, licRecurrDate, licBcm, licCateg,
    graceDur, finStat;

	
	IF EXISTS (SELECT * FROM content WHERE channelid = chanId) THEN
		SELECT SUM(deliveries) FROM content WHERE channelid = chanId INTO deliveryCount;
	END IF;
	
	SELECT pushCount FROM licensecounter WHERE channelid = chanId INTO pushCnt;
	SELECT broadcastCount FROM licensecounter WHERE channelid = chanId INTO bcmCount;
	SELECT COUNT(catId) FROM category WHERE channelid = chanId INTO categCount;

    SELECT COUNT(uid) FROM userdetails WHERE channelid = chanId and is_active=1 INTO userCount;

	SELECT planType, licDuration, licStart, licUser, licDelivery, licSpace, licPush,
	  channelMail, userCount, deliveryCount, pushCnt, licRecurrDate, licBcm, licCateg,
	  bcmCount, categCount, graceDur, finStat;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSaaSLicenseDetailsV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetSaaSLicenseDetailsV3`(IN chanName TEXT)
BEGIN
DECLARE chanId, licDuration, licUser, userCount INT;
DECLARE planType, channelMail TEXT;
DECLARE licStart, licRecurrDate DATETIME;
DECLARE licSpace DOUBLE;
DECLARE cmpnyName,contactMail TEXT;
DECLARE catUsedCount, catAllowedCount INT DEFAULT 0;

SET planType = '';

SELECT channelid,display_name FROM channel WHERE channelname = chanName INTO chanId,cmpnyName;
SELECT contactemail FROM channelowner WHERE channelid = chanId INTO contactMail;
SELECT COUNT(viewid) FROM categorytemplate WHERE channelId = chanId INTO catUsedCount;
SELECT COALESCE(template_count, 0) FROM lic_channel_limit WHERE channelId = chanId INTO catAllowedCount;

IF EXISTS (SELECT * FROM saaslicense WHERE channelid = chanId) THEN
	SELECT planname, DCR(noitarud), DCR(tratsfoetad), DCR(tnuocresu), DCR(ecapsksid), DCR(etadrrucer)
    FROM saaslicense WHERE channelid = chanId
    INTO planType, licDuration, licStart, licUser, licSpace,  licRecurrDate;

  SELECT COUNT(uid) FROM userdetails WHERE channelid = chanId AND is_active=1 INTO userCount;

	SELECT planType, licDuration, licStart, licUser, licSpace, userCount,  licRecurrDate,cmpnyName,catUsedCount,catAllowedCount,contactMail;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserListbycontentComment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `GetUserListbycontentComment`(in contentId int,in chanId int)
BEGIN

 SELECT distinct uid,

			diy_GetUserName(uid) AS usrFrom,

			diy_GetUserProfileImg(uid) AS usrFromProfileImg

		    FROM usercomment un where un.cid=contentId and un.channelid=chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserSSOToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `getUserSSOToken`(IN userEmail TEXT)
BEGIN
	DECLARE usrId INT;
	select userid from userinfo where uemail = userEmail into usrId;
    select access_token, refresh_token, external_auth_resp from user_external_auth where userid = usrId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_channel_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `get_channel_list`(IN u_Id INT)
BEGIN



DECLARE usrId INT;



SELECT userid from userdetails where uid = u_Id INTO usrId;



SELECT ud.uid,

       c.channelid AS channel_id,

       c.display_name,

       c.channelname,

       cr.img_top_bar_xhdpi,

       cr.img_top_bar_hdpi,

       cr.img_top_bar_mdpi,

       cr.img_top_bar_ldpi

FROM  userdetails ud

JOIN  channel c

      ON c.channelid = ud.channelid

JOIN  channelrights cr

      ON cr.channelid = c.channelid

WHERE ud.userid = usrId AND ud.is_active = 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `increment_console_login_failed_counter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `increment_console_login_failed_counter`(IN adminId INT)
BEGIN



DECLARE old_failed_login_counter INT;

DECLARE new_failed_login_counter INT;



SELECT failed_login_counter FROM admin_account_locked where admin_id=adminId INTO old_failed_login_counter;



SET new_failed_login_counter=old_failed_login_counter + 1;





update admin_account_locked set failed_login_counter=new_failed_login_counter,last_login=NOW() where admin_id=adminId;



SELECT failed_login_counter FROM admin_account_locked WHERE admin_id=adminId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_CheckClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_CheckClient`(IN clientId VARCHAR(255), IN clientSecret VARCHAR(255))
BEGIN

  -- Check if this is a valid client or not



  IF EXISTS (SELECT * FROM oauth_client_app WHERE is_valid = TRUE AND client_id = clientId AND clientSecret = client_secret) THEN

    SELECT oauth_app_id, app_name FROM oauth_client_app

      WHERE client_id = clientId AND clientSecret = client_secret;

  ELSE

    SELECT 0;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_DeactivateToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_DeactivateToken`(IN tokenId INT, IN urId INT)
BEGIN



  DECLARE accTok, refreshTok VARCHAR(255);



  -- Check if this is a valid token id for this user

  IF EXISTS (SELECT * FROM oauth_token WHERE token_id = tokenId AND uid = urId) THEN

    -- Remove from oauth token

    SELECT access_token, refresh_token FROM oauth_token

      WHERE token_id = tokenId INTO accTok, refreshTok;



    START TRANSACTION;

      DELETE FROM oauth_token WHERE token_id = tokenId;



      -- Put it in expired token list

      INSERT INTO oauth_expired_token (token, token_expiry_date, token_type)

        VALUES (accTok, NOW(), 'ACCESS');

      INSERT INTO oauth_expired_token (token, token_expiry_date, token_type)

        VALUES (refreshTok, NOW(), 'REFRESH');

    COMMIT;



    SELECT 1;

  ELSE

    SELECT 0; -- Invalid token id

  END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_SetAccessToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_SetAccessToken`(IN urId INT, IN chanId INT,

    IN devId VARCHAR(255), IN appId INT, IN accessToken VARCHAR(255),

    IN refreshToken VARCHAR(255), IN expireInSec INT, IN ipAddr VARCHAR(55),

    IN userAgentString VARCHAR(255))
BEGIN

  DECLARE currDate, expireDate DATETIME;



  SELECT NOW() INTO currDate;

  SELECT DATE_ADD(currDate, INTERVAL expireInSec SECOND) INTO expireDate;



  -- Check if this user is valid or not

  IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND is_active = 1) THEN

    -- Store the tokens

    INSERT INTO oauth_token (uid, channelid, device_id, app_id, access_token,

        expire_on, create_date, refresh_token, ip_address, ua_string, last_access_date)

    VALUES (urId, chanId, devId, appId, accessToken, expireDate, currDate,

        refreshToken, ipAddr, userAgentString, currDate);



    SELECT 1;

  ELSE

    SELECT 0;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_UpdatetAccessToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_UpdatetAccessToken`(IN usrId INT, IN tokenId INT, IN accessToken TEXT, IN expireInSec INT, IN ipAddr TEXT, IN userAgentString TEXT)
BEGIN



DECLARE currDate, expireDate DATETIME;

DECLARE currAccessToken TEXT;



  SELECT NOW() INTO currDate;

  SELECT DATE_ADD(currDate, INTERVAL expireInSec SECOND) INTO expireDate;



  -- Check if this user is valid or not

  IF EXISTS (SELECT * FROM userdetails WHERE uid = usrId AND is_active = 1) THEN



    SELECT access_token

    FROM oauth_token

    WHERE uid = usrId AND token_id = tokenId INTO currAccessToken;



    INSERT INTO oauth_expired_token (token, token_expiry_date, token_type)

        VALUES (currAccessToken, NOW(), 'ACCESS');



    -- Update the access-token

    UPDATE oauth_token

    SET access_token = accessToken,

        expire_on = expireDate,

        ip_address = ipAddr,

        ua_string = userAgentString

    WHERE token_id = tokenId;



    SELECT 1;

  ELSE

    SELECT 0;

  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_ValidateAccessToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_ValidateAccessToken`(IN accessToken VARCHAR(255))
BEGIN
  DECLARE currDate DATETIME;
  DECLARE urId INT DEFAULT 0;

  SELECT NOW() INTO currDate;
  -- Check if this access token in valid
  IF EXISTS (SELECT access_token FROM oauth_token WHERE access_token = accessToken AND expire_on > currDate) THEN
    -- Check if the assosciated user is active
    SELECT uid FROM oauth_token WHERE access_token = accessToken INTO urId;
    IF EXISTS (SELECT uid FROM userdetails WHERE uid = urId AND is_active = 1) THEN
      
      -- Update the last access date
     -- UPDATE oauth_token SET last_access_date = currDate WHERE access_token = accessToken;
      
      -- Get detail for this access token
      SELECT ot.uid, ot.channelid, ch.channelname, ot.app_id, ot.device_id, ot.token_id,
        di.devicetype
        FROM oauth_token ot
          JOIN channel ch ON ot.channelid = ch.channelid
          LEFT JOIN deviceinfo di ON di.deviceid = ot.device_id
      WHERE access_token = accessToken;
      
    ELSE
      SELECT -1 as uid; --  associated user has been deactivated
    END IF;
  ELSE
    SELECT 0 as uid; -- invalid access token
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `oauth_ValidateRefreshToken_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `oauth_ValidateRefreshToken_v2`(IN refreshToken VARCHAR(255), IN appId INT)
BEGIN
  DECLARE urId, chanId, refExpDuration, tokId,usrId INT DEFAULT 0;
  DECLARE loginDate, refExpDate DATETIME;
  DECLARE deviceId,outhp TEXT;

  -- Check if this refresh token exists
  IF EXISTS (SELECT * FROM oauth_token WHERE refresh_token = refreshToken AND app_id = appId) THEN

    SELECT uid, channelid FROM oauth_token WHERE refresh_token = refreshToken AND app_id = appId INTO urId, chanId;

    -- Check if the assosciated user is active
    IF EXISTS (SELECT * FROM userdetails WHERE uid = urId AND is_active = 1) THEN
        SELECT userid FROM userdetails WHERE uid = urId INTO usrId;
        SELECT oauth_provider FROM user_external_auth uea WHERE userid = usrId into outhp;
    IF(outhp='wipro_saml') THEN
        SELECT -1;
        
      ELSE
      -- Check if refresh expires in detail is available
        IF EXISTS(SELECT * FROM channel_setting WHERE channelid = chanId)THEN
          SELECT refresh_expires_in FROM channel_setting WHERE channelid = chanId INTO refExpDuration;
        END IF;
  
        IF(refExpDuration > 0)THEN
  
          SELECT create_date FROM oauth_token WHERE refresh_token = refreshToken AND app_id = appId INTO loginDate;
  
          SELECT DATE_ADD(loginDate, INTERVAL refExpDuration DAY) INTO refExpDate;
  
          -- if expiry date if less then now(), delete tokens
          IF(refExpDate > NOW())THEN
            SELECT token_id, uid, channelid, device_id, app_id,access_token
            FROM oauth_token
            WHERE refresh_token = refreshToken AND app_id = appId;
          ELSE
            -- refreshToken has expired
            -- Put tokens in expired token list
            SELECT token_id, device_id FROM oauth_token WHERE refresh_token = refreshToken AND app_id = appId INTO tokId, deviceId;
  
            INSERT INTO oauth_expired_token (token, token_expiry_date, token_type)
            SELECT access_token, NOW(), 'ACCESS' FROM oauth_token WHERE channelid = chanId AND app_id = appId AND device_id = deviceId AND uid = urId;
            INSERT INTO oauth_expired_token (token, token_expiry_date, token_type)
            SELECT refresh_token, NOW(), 'REFRESH' FROM oauth_token WHERE channelid = chanId AND app_id = appId AND device_id = deviceId AND uid = urId;
  
            -- cos right now multiple tokens may exist for a container app for a user
            DELETE FROM oauth_token WHERE uid = urId AND app_id = appId AND channelid = chanId AND device_id = deviceId;
  
            -- DELETE FROM oauth_token WHERE token_id = tokId;
  
            SELECT -2;
  
          END IF;
         ELSE
          -- refExpDuration = 0, refresh token never expires
          SELECT token_id, uid, channelid, device_id, app_id,access_token
          FROM oauth_token
          WHERE refresh_token = refreshToken AND app_id = appId;
      END IF;
    END IF;
    ELSE
      SELECT -1; -- Associated user has been deactivated.
    END IF;
  ELSE
    SELECT 0; -- Invalid refreshToken
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OnpremGetPlanCountDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `OnpremGetPlanCountDetails`(IN channelId INT)
BEGIN
	select	lennahc_json as plan_details,
			tnuoc_json as count_json,
			noitpecxe_json as exception
	from sliated_nalp_merpno where kcol_operation = 0 and channel_id = channelId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_ChangeAppStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_ChangeAppStatus`(IN pluginId INT, IN chanId INT,IN appStatus TEXT)
BEGIN

IF(appStatus = 'delete') THEN
  UPDATE plugin_app SET is_active = false,is_draft = true
  WHERE plugin_id = pluginId AND channelid = chanId;
  
ELSE IF(appStatus = 'draft') THEN
  UPDATE plugin_app SET is_active = true, is_draft = true
  WHERE plugin_id = pluginId AND channelid = chanId;
  UPDATE actionbutton 
        INNER JOIN plugin_template_map on plugin_template_map.ab_id = actionbutton.abid
        INNER JOIN plugin_app on plugin_app.plugin_id = plugin_template_map.plugin_id
        SET actionbutton.modify_date = NOW() ,actionbutton.searchable=0
        
        WHERE plugin_app.plugin_id = pluginId and plugin_app.channelid=chanId;
        if exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId)then
         update formbuilder_embed set is_disable=1 where channel_id=chanId and plugin_id=pluginId;
        end if;
ELSE IF(appStatus='live') THEN
  UPDATE plugin_app SET is_active = true, is_draft = false
  WHERE plugin_id = pluginId AND channelid = chanId;
  
   UPDATE actionbutton 
        INNER JOIN plugin_template_map on plugin_template_map.ab_id = actionbutton.abid
        INNER JOIN plugin_app on plugin_app.plugin_id = plugin_template_map.plugin_id
        SET actionbutton.modify_date = NOW() ,actionbutton.searchable=1
        
        WHERE plugin_app.plugin_id = pluginId and plugin_app.channelid=chanId;
        -- if exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId)then
        --   update formbuilder_embed set is_disable=0 where channel_id=chanId and plugin_id=pluginId;
        -- end if;
END IF;
END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_channelname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_channelname`(in chnlid text)
BEGIN

select channelname from channel where channelid = chnlid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_GetApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_GetApp`(IN pluginId INT, IN chanId INT)
BEGIN

  DECLARE latestVer INT;
  DECLARE latestVerCode varchar(25);
  
  IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN
    select plugin_fnGetLatestVersionId(pluginId) into latestVer;
    select plugin_fnGetLatestVersionCode(pluginId) into latestVerCode;
      SELECT
      pa.plugin_id,
      pa.plugin_name,
      pa.plugin_desc,
      pa.plugin_type,
      pa.plugin_url,
      pa.plugin_icon_url_mdpi,
      pa.plugin_icon_url_xhdpi,
      pa.plugin_icon_url_hdpi,
      pa.plugin_icon_url_ldpi,
      pa.plugin_modified_date,
      pa.plugin_install_type,
      latestVer AS latest_version,
      latestVerCode AS version_code,
      pav.download_url_na, -- Required for NativeApp type
      pav.plugin_web_url, -- Required if WebApp
      pav.update_type, -- Only for ZP
      pav.background_upgrade_only, -- Only for ZP with AutoSync
      pa.plugin_theme_color,
      pa.plugin_statusbar,
      pa.plugin_statusbar_bgcolor, -- Only if statusbar is true
      pa.plugin_statusbar_style, -- Only if statusbar is true
      ptm.template_id,
      ct.viewname,
      ptm.ab_id,
      pt.tokenkey,
      pa.plugin_hide_close_btn, -- Optional with default 0
      pa.admin_url, -- Optional
      COALESCE(pas.plugin_allow_text_copy, 1) AS plugin_allow_text_copy,
      COALESCE(pas.plugin_allow_screen_shot, 1) AS plugin_allow_screen_shot,
      COALESCE(pas.support_email, '') AS support_email,
      COALESCE(pas.support_phone, '') AS support_phone,
      COALESCE(pas.is_hidden, 0) AS is_hidden,
      pas.is_phone_portrait, -- Optional
      pas.is_phone_landscape, -- Optional
      pas.is_tablet_portrait, -- Optional
      pas.is_tablet_landscape, -- Optional
      plugin_fnGetAppAverageRating(pa.plugin_id) AS average_rating,
      plugin_fnGetAppAverageRatingUserCount(pa.plugin_id) AS average_rating_u_count,
      plugin_fnGetAppFeedbackCount(pa.plugin_id) AS feekback_count,
      plugin_fnGetAppFavCount(pa.plugin_id) AS favorite_count,
      COALESCE(paul.app_prefix, '') AS app_prefix, -- Required for NativeApp type with iOS
      COALESCE(paul.bundle_id, '') AS bundle_id -- Required for NativeApp type with iOS
    FROM plugin_app pa
      LEFT JOIN plugin_app_setting pas
        ON pas.plugin_id = pa.plugin_id
		  LEFT JOIN plugin_template_map ptm
        ON ptm.plugin_id = pa.plugin_id
		  LEFT JOIN categorytemplate ct
        ON ptm.template_id = ct.viewid
		  LEFT JOIN plugin_app_version pav
        ON pav.plugin_ver_id = latestVer
		  LEFT JOIN plugin_token pt
        ON pt.plugin_id = pa.plugin_id
      LEFT JOIN plugin_app_universal_link paul
        ON paul.plugin_id = pa.plugin_id
    WHERE pa.plugin_id = pluginId AND pa.channelid = chanId LIMIT 1;
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_GetAppV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_GetAppV3`(IN pluginId INT, IN chanId INT)
BEGIN

DECLARE latestversion TEXT;
DECLARE maxVerId INT;
DECLARE action_Id,f_actId INT;
DECLARE foldername TEXT;

IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN

  SELECT latest_version FROM plugin_app WHERE plugin_id = pluginId INTO maxVerId;
  select version_code from plugin_app_version where plugin_id = pluginId AND plugin_ver_id=maxVerId INTO latestversion;
  
   select actionbutton.abid from  actionbutton 
        INNER JOIN plugin_template_map on plugin_template_map.ab_id = actionbutton.abid
        INNER JOIN plugin_app on plugin_app.plugin_id = plugin_template_map.plugin_id
        WHERE plugin_app.plugin_id = pluginId and plugin_app.channelid=chanId into action_Id;
        
  
   if exists(select * from folderstructure where mapId=action_Id)then
        
        select title from actionbutton where abid in( select actionId from folderstructure where mapId=action_Id) into foldername;
   end if;
  
  SELECT
      pa.plugin_id,
      pa.plugin_name,
      pa.plugin_desc,
      pa.plugin_type,
      COALESCE(latestversion,'') as app_version_code,
      pa.plugin_icon_url_mdpi,
      pa.plugin_icon_url_xhdpi,
      pa.plugin_icon_url_hdpi,
      pa.plugin_icon_url_ldpi,
      ptm.template_id,
      pa.is_active,
	    pa.is_draft,
      COALESCE(ptm.ab_id, 0) AS ab_id,
      ct.viewname,
      pt.tokenkey,
      pa.plugin_install_type,
     plugin_fnGetAppAverageRating(pa.plugin_id) AS average_rating,
     plugin_fnGetAppAverageRatingUserCount(pa.plugin_id) AS average_rating_u_count,
     plugin_fnGetAppFeedbackCount(pa.plugin_id) AS feekback_count,
     COALESCE(foldername,'') as foldername
     
    FROM plugin_app pa
      LEFT JOIN plugin_app_setting pas
        ON pas.plugin_id = pa.plugin_id
		  LEFT JOIN plugin_template_map ptm
        ON ptm.plugin_id = pa.plugin_id
		  LEFT JOIN categorytemplate ct
        ON ptm.template_id = ct.viewid
		  LEFT JOIN plugin_app_version pav
        ON pav.plugin_ver_id = pa.latest_version
		  LEFT JOIN plugin_token pt
        ON pt.plugin_id = pa.plugin_id
      LEFT JOIN plugin_app_universal_link paul
        ON paul.plugin_id = pa.plugin_id
    WHERE pa.plugin_id = pluginId AND pa.channelid = chanId LIMIT 1;
  END IF;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_GetUniversalLinkKeyUnique` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_GetUniversalLinkKeyUnique`(IN uKey TEXT)
BEGIN

SELECT unique_key

FROM plugin_app_universal_link WHERE unique_key = uKey;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_UpdateAppDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_UpdateAppDetails`(IN pluginId INT, IN appName VARCHAR(145), IN appDesc VARCHAR(245),IN appType VARCHAR(25),
    IN appIconXHDPI VARCHAR(145), IN appIconHDPI VARCHAR(145), IN appIconMDPI VARCHAR(145), IN appIconLDPI VARCHAR(145),IN templateId INT, IN chanId INT)
BEGIN

DECLARE actId INT DEFAULT 0;

DECLARE chanName TEXT;

DECLARE appUrl TEXT;

DECLARE prevViewId INT DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 

  BEGIN

      ROLLBACK;

      RESIGNAL;

  END;

IF EXISTS (SELECT 1 FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN

  START TRANSACTION;
  SELECT channelname FROM channel WHERE channelid = chanId INTO chanName;
    -- Update plugin_app

  UPDATE plugin_app SET

    plugin_name = appName,

    plugin_desc = appDesc,

    plugin_modified_date = NOW(),

    plugin_icon_url_xhdpi = appIconXHDPI,

    plugin_icon_url_hdpi = appIconHDPI,

    plugin_icon_url_mdpi = appIconMDPI,

    plugin_icon_url_ldpi = appIconLDPI

  WHERE plugin_id = pluginId;

  IF(templateId > 0 )THEN

    IF NOT EXISTS(SELECT 1 FROM plugin_template_map WHERE plugin_id = pluginId)THEN

      -- create new ab

      select plugin_url from plugin_app where plugin_id = pluginId into appUrl;

      CALL diy_CreateActionButton(appName, appType, appUrl, chanName,

        appIconXHDPI, appIconHDPI, appIconMDPI, appIconLDPI,

        appIconXHDPI, appIconHDPI, appIconMDPI, appIconLDPI,

        templateId, @actionButtonId);

        -- create new mapping template-plugin

        INSERT INTO plugin_template_map (plugin_id, template_id, ab_id) 

        VALUES (pluginId, templateId, @actionButtonId);

	  ELSE

		  SELECT ab_id FROM plugin_template_map WHERE plugin_id = pluginId INTO actId;

	    SELECT viewid FROM mapviewcat WHERE catid = actId AND type = 'a' limit 1 INTO prevViewId;

	    -- Update modify_date/detail of actionbutton

		    UPDATE actionbutton

			    SET modify_date = NOW(), title = appName,

			    action_tile_img = appIconMDPI, grid_xhdpi = appIconXHDPI, grid_hdpi = appIconHDPI, grid_mdpi = appIconMDPI, grid_ldpi = appIconLDPI,

			    tile_xhdpi = appIconXHDPI, tile_hdpi = appIconHDPI, tile_mdpi = appIconMDPI, tile_ldpi = appIconLDPI

		    WHERE abid = actId;

	    IF(prevViewId!=templateId) THEN

        -- update actionbutton-template mapping

        UPDATE mapviewcat SET viewid = templateId WHERE catid = actId AND type = 'a'; 

        -- update mapping template-plugin
        UPDATE plugin_template_map SET template_id = templateId WHERE plugin_id = pluginId;
      END IF;
	  END IF;
	ELSE
		IF(templateId = 0)THEN
		  SELECT ab_id FROM plugin_template_map WHERE plugin_id = pluginId INTO actId;
  		-- delete actionbutton-template mapping
	  	DELETE FROM mapviewcat WHERE catid = actId AND type = 'a'; 
	  	-- update mapping template-plugin
	  	DELETE FROM plugin_template_map WHERE plugin_id = pluginId;
	  	-- Delete actionbutton as well
	  	DELETE FROM actionbutton WHERE abid = actId;
		END IF;
	END IF;
  COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `plugin_validtokenkey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `plugin_validtokenkey`(in tokKey text)
BEGIN

  SELECT pt.channelid, pt.token_id, pt.token_type, ch.channelname, pt.plugin_id, pa.plugin_name,
    GROUP_CONCAT(ptm.template_id) AS templateIdBunch,
    COALESCE(ptm.template_id, 0) AS template_id, COALESCE(ct.ismaster, 0) AS is_master
  FROM plugin_token pt
    JOIN channel ch ON pt.channelid = ch.channelid
    LEFT JOIN plugin_app pa ON pa.plugin_id = pt.plugin_id
    LEFT JOIN plugin_template_map ptm ON pt.plugin_id = ptm.plugin_id
    LEFT JOIN categorytemplate ct ON ct.viewid = ptm.template_id
  WHERE  pt.tokenkey =tokKey
  GROUP BY pt.token_id;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterLicenseInOnprem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `RegisterLicenseInOnprem`(IN channelId INT, IN planDetails LONGTEXT, IN countJsn LONGTEXT)
BEGIN
	
	IF NOT EXISTS (SELECT 1 FROM sliated_nalp_merpno WHERE channel_id = channelId) THEN
		INSERT INTO sliated_nalp_merpno (`channel_id`, `lennahc_json`, `created_at`, `updated_at`, `sync_at`, `tnuoc_json`, `kcol_operation`)
		VALUES (channelId, planDetails, NOW(), NOW(), NOW(), countJsn, 0);
	ELSE
		UPDATE sliated_nalp_merpno SET lennahc_json = planDetails, updated_at = NOW()
		WHERE channel_id = channel_id;
	END IF;
	SELECT 1 as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveInstalledGlobalAPISubCategorydetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `saveInstalledGlobalAPISubCategorydetails`(IN channelId INT, IN catId INT, IN subCatId INT, IN catName TEXT, IN catMethod TEXT, IN formatId TEXT, IN pluginId INT, IN isSubCatInstalled INT)
BEGIN
	DECLARE sub_cat_id INT default 0;
    DECLARE duplicate_name_count INT default 0;
	if exists (select * from api_category where channel_id = channelId and api_category_id = catId)then
		if exists(select * from api_sub_category where category_id = catId and sub_category_id = subCatId)Then
			select subCatId into sub_cat_id;
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and sub_category_id != subCatId and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				UPDATE api_sub_category SET
					sub_category_name = catName,
					sub_modify_on = CURRENT_TIMESTAMP,
					sub_category_method = catMethod,
                    format_id = formatId,
					plugin_id = pluginId
					WHERE category_id = catId and sub_category_id = subCatId;
			end if;
		else
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				INSERT INTO `api_sub_category` (`sub_category_name`,`category_id`, `sub_category_method`, `format_id`, `plugin_id`, `isSubCatInstalled`)
				VALUES (catName, catId, catMethod, formatId, pluginId, isSubCatInstalled);
				select LAST_INSERT_ID() into sub_cat_id;
			end if;
		end if;
   end if;
   select sub_cat_id as 'sub_cat_id', duplicate_name_count as 'isDuplicate';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveSubCatDetailsFromAutomation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `saveSubCatDetailsFromAutomation`(IN channelId INT, IN catId INT, IN subCatId INT, IN catName TEXT, IN catMethod TEXT, IN pluginId INT, IN reference TEXT)
BEGIN
	DECLARE sub_cat_id INT default 0;
    DECLARE duplicate_name_count INT default 0;
    DECLARE newFormatId VARCHAR(128); -- Declare the variable to store format_id
	if exists (select * from api_category where channel_id = channelId and api_category_id = catId)then
		if exists(select * from api_sub_category where category_id = catId and sub_category_id = subCatId)Then
			select subCatId into sub_cat_id;
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and sub_category_id != subCatId and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				SET newFormatId = (
					  SELECT format_id FROM api_sub_category WHERE category_id = catId AND sub_category_id = subCatId
				);
				UPDATE api_sub_category SET
					sub_category_name = catName,
					sub_modify_on = CURRENT_TIMESTAMP,
					sub_category_method = catMethod,
					plugin_id = pluginId,
                    reference = reference
					WHERE category_id = catId and sub_category_id = subCatId;
			end if;
		else
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				SET newFormatId = uuid(); -- Generate UUID
				INSERT INTO `api_sub_category` (`sub_category_name`,`category_id`, `sub_category_method`, `plugin_id`, `format_id`, `reference`)
				VALUES (catName, catId, catMethod, pluginId, newFormatId, reference);
				select LAST_INSERT_ID() into sub_cat_id;
			end if;
		end if;
   end if;
   select sub_cat_id as 'sub_cat_id', duplicate_name_count as 'isDuplicate', newFormatId AS 'format_id';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetAWSCredentials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `SetAWSCredentials`(IN chanName TEXT, IN publicKey TEXT, IN scrtKey TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF EXISTS (SELECT * FROM awscredentials WHERE channelid = chanId) THEN
    UPDATE awscredentials SET accesskey = ENC(publicKey), secretkey = ENC(scrtKey) WHERE channelid = chanId;
ELSE
    INSERT INTO awscredentials VALUES (chanId, ENC(publicKey), ENC(scrtKey));
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetChannelTimezone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `SetChannelTimezone`(IN timezoneDname TEXT, IN timezoneId TEXT, IN chanName TEXT)
BEGIN

DECLARE chanId INT;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF EXISTS (SELECT * FROM channeltimezone WHERE channelid = chanId) THEN
    UPDATE channeltimezone SET tzonedname = timezoneDname, tzoneid = timezoneId WHERE channelid = chanId; 
ELSE
    INSERT INTO channeltimezone VALUES(chanId, timezoneDname, timezoneId);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetGroupCampaignHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `SetGroupCampaignHistory`(in groupId int, in campaignId int)
BEGIN

insert into groupcampaignhistory values (groupId, campaignId, now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setPluginAppUserEnvironmentDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `setPluginAppUserEnvironmentDetails`(in urId int,in newEnvironment TEXT,IN pluginId INT, IN chanId INT,IN act Varchar(45))
BEGIN



IF EXISTS(SELECT uid FROM userdetails WHERE uid = urId AND channelid=chanId) THEN

 IF(act = 'D') THEN

   DELETE FROM plugin_app_environment_users WHERE plugin_id = pluginId and uid=urId and environment=newEnvironment;

 ELSE

    IF NOT EXISTS(SELECT * FROM plugin_app_environment_users WHERE plugin_id = pluginId AND uid=urId and  environment=newEnvironment) THEN

      INSERT INTO plugin_app_environment_users (plugin_id,uid,environment) VALUES (pluginId,urId,newEnvironment);

    END IF;

 END IF;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_update_jwt_sso_oauth_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_create_update_jwt_sso_oauth_data`(
 in ssoName text
,in providerid text
,in ssotype int
,in channelId int
,in domainName text
,in clientId text
,in clientSecret text
,in scopeData text
,in authorization LONGTEXT
,in accessToken LONGTEXT
,in refreshToken LONGTEXT
,in jwtloginurl LONGTEXT
,in jwtredirecturi LONGTEXT
,in editSSOId int
,in oauthClaimlist LONGTEXT
,in oauthJitAccess int)
BEGIN

	IF not exists (SELECT * FROM channel_oauth_sso_jwtgoogle_config WHERE channel_id = channelId and jwtoauth_provider_id=providerid)THEN
        INSERT INTO channel_oauth_sso_jwtgoogle_config
                    (
                    jwtoauth_provider_id, 
                    jwtoauth_name, 
                    jwtoauth_client_id, 
                    jwtoauth_client_secret, 
                    jwtoauth_scope,
                    jwtoauth_restricted_domain, 
                    jwtoauth_auth_request, 
                    jwtoauth_access_request, 
                    jwtoauth_refres_request, 
                    jwtoauth_login_url, 
                    jwtoauth_redirect_url, 
                    jwtoauth_created_date, 
                    jwtoauth_updated_date, 
                    channel_id, 
                    jwtoauth_status, 
                    jwtoauth_type, 
                    jwtoauth_jit_access, 
                    jwtoauth_attar_list
                    )
                    VALUES
                    (providerid, ssoName,clientId,clientSecret,scopeData,domainName,
                    authorization,accessToken,refreshToken,jwtloginurl,jwtredirecturi,
                    now(),now(),channelId,0,ssotype,oauthJitAccess,oauthClaimlist);
                    SELECT LAST_INSERT_ID() as ID;
                
            ELSE
            
                UPDATE channel_oauth_sso_jwtgoogle_config
                  SET 
                    jwtoauth_name=ssoName,
                    jwtoauth_client_id=clientId,
                    jwtoauth_client_secret=clientSecret,
                    jwtoauth_scope=scopeData,
                    jwtoauth_restricted_domain=domainName,
                    jwtoauth_auth_request=authorization,
                    jwtoauth_access_request=accessToken,
                    jwtoauth_refres_request=refreshToken,
					jwtoauth_login_url=jwtloginurl, 
                    jwtoauth_redirect_url=jwtredirecturi, 
                    jwtoauth_updated_date=now(),
                    jwtoauth_jit_access=oauthJitAccess,
                    jwtoauth_attar_list=oauthClaimlist
                    WHERE jwtoauth_id = editSSOId AND jwtoauth_provider_id = providerid and  channel_id = channelId;
              
                 SELECT ROW_COUNT() AS Updated_count;
            END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_update_sso_oauth_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_create_update_sso_oauth_data`(in ssoName text
,in channelId int
,in domainName text
,in clientId text
,in clientSecret text
,in scopeData text
,in authorization LONGTEXT
,in accessToken LONGTEXT
,in refreshToken LONGTEXT
,in editSSOId int
,in oauthClaimlist LONGTEXT
,in oauthJitAccess int)
BEGIN
 IF (editSSOId = 0)
    THEN
        BEGIN
            DECLARE ID INT DEFAULT 0;
            DECLARE existingCount INT DEFAULT 0; 
            SELECT COUNT(1) FROM channel_oauth_sso_config WHERE oauth_name = ssoName AND channel_id = channelId and oauth_restricted_domain=domainName INTO existingCount;
            IF (existingCount = 0)
            THEN
                BEGIN
                    INSERT INTO channel_oauth_sso_config
                    (oauth_provider_id, 
                    oauth_name,
                    oauth_client_id,
                    oauth_client_secret,
                    oauth_scope,
                    oauth_restricted_domain,
                    oauth_auth_request,
                    oauth_access_request,
                    oauth_refres_request,
                    oauth_created_date,
                    oauth_updated_date,
                    channel_id,
                    oauth_jit_access,
                    oauth_attar_list
                    )
                    VALUES
                    (uuid(), ssoName,clientId,clientSecret,scopeData,domainName,authorization,accessToken,refreshToken,now(),now(),channelId,oauthJitAccess,oauthClaimlist);
                    SELECT LAST_INSERT_ID() as ID;
                END;
            ELSE
                BEGIN
                    SET ID = -1; -- Duplicate Entry Founnd
                    SELECT ID;
                END;
            END IF;
        END;
    ELSE
        BEGIN
            UPDATE channel_oauth_sso_config
            SET 
                    oauth_name=ssoName,
                    oauth_client_id=clientId,
                    oauth_client_secret=clientSecret,
                    oauth_scope=scopeData,
                    oauth_restricted_domain=domainName,
                    oauth_auth_request=authorization,
                    oauth_access_request=accessToken,
                    oauth_refres_request=refreshToken,
                    oauth_updated_date=now(),
                    oauth_jit_access=oauthJitAccess,
                    oauth_attar_list=oauthClaimlist
                    WHERE oauth_id = editSSOId AND channel_id = channelId;
                
            -- SELECT editSSOId;
            SELECT ROW_COUNT() AS Updated_count;
        END;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getALLSSOList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_getALLSSOList`(IN channelId int)
BEGIN

   drop temporary table if exists tempSSOList;
create temporary table tempSSOList (s_id int, 
ssoName varchar(100), domainName VARCHAR(100), ssoStatus int, ssoType int, providerId VARCHAR(1000), createdDate DateTime) engine = memory;


insert into tempSSOList	
 SELECT id,sso_name,domain_url,`status`,sso_type,provider_id,created_at
    FROM sso_auth_config
    WHERE channel_id = channelId;
insert into tempSSOList	
 SELECT oauth_id,oauth_name,oauth_restricted_domain,oauth_status,oauth_type,oauth_provider_id,oauth_created_date
    FROM channel_oauth_sso_config
    WHERE channel_id = channelId;
   insert into tempSSOList 
    select jwtoauth_id,jwtoauth_name,jwtoauth_restricted_domain,jwtoauth_status,jwtoauth_type,jwtoauth_provider_id,jwtoauth_created_date
    FROM channel_oauth_sso_jwtgoogle_config;
    
 select * from tempSSOList order by createdDate desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSingleSSOInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_getSingleSSOInfo`(IN channelId int,IN ssoID int)
BEGIN
	SELECT * FROM sso_auth_config WHERE channel_id = channelId AND id = ssoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSingleSSOuth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_getSingleSSOuth`(in chanId int,in ssoId int)
BEGIN

 select * from channel_oauth_sso_config where channel_id=chanId and oauth_id=ssoId;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertWhitelistIpPluginApi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_insertWhitelistIpPluginApi`(IN chanId INT,IN pluginId INT,IN ipAddress TEXT, IN actionW TEXT)
BEGIN

DECLARE isSuccess INT DEFAULT 0;

IF NOT EXISTS(SELECT * FROM plugin_whitelisted_ip WHERE ip = ipAddress AND `action` = actionW AND plugin_id = pluginId)THEN

  INSERT INTO plugin_whitelisted_ip(channelid, plugin_id, ip, `action`, added_on )

  VALUES(chanId, pluginId, ipAddress, actionW, NOW());

  

  SET isSuccess = 1;

END IF;

SELECT isSuccess;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateSSOOauthStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_updateSSOOauthStatus`(IN channelId int, IN ssoID int,IN statusVal int)
BEGIN
	UPDATE channel_oauth_sso_config SET oauth_status = statusVal WHERE channel_id = channelId AND oauth_id = ssoID;
    SELECT ssoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateSSOStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_updateSSOStatus`(IN channelId int, IN ssoID int,IN statusVal int)
BEGIN
	UPDATE sso_auth_config SET `status` = statusVal WHERE channel_id = channelId AND id = ssoID;
    SELECT ssoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_google_jwtSSOOauthStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_update_google_jwtSSOOauthStatus`(IN channelId int, IN ssoID int,IN statusVal int)
BEGIN

IF exists(SELECT * FROM channel_oauth_sso_jwtgoogle_config WHERE channel_id = channelId and jwtoauth_id=ssoID)THEN
	UPDATE channel_oauth_sso_jwtgoogle_config SET jwtoauth_status = statusVal WHERE 
    channel_id = channelId AND jwtoauth_id = ssoID;
    
END IF;
SELECT ssoID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsertSSOSAMLData_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_upsertSSOSAMLData_v2`(IN ssoName varchar(200), IN channelId int,  IN emailId varchar(200),  IN ssoType varchar(200),  IN hasMetaFile varchar(200),  IN mfAttributesList LONGTEXT,  IN domainURL TEXT,  IN sEntityId varchar(200),  IN sLoginSso_Url TEXT, IN sCertificateFileContent LONGTEXT, IN sBindingType varchar(200),  IN sAuthSignedRequest varchar(20),  IN editSSOId int, IN samlJitAccess int, IN samlScimAccess int, IN samlScimAuthToken TEXT
)
BEGIN
    IF (editSSOId = 0) THEN
        BEGIN
            DECLARE ID INT DEFAULT 0;
            DECLARE existingCount INT DEFAULT 0; 
            SELECT COUNT(1) FROM sso_auth_config WHERE sso_name = ssoName AND channel_id = channelId and domain_url=domainURL INTO existingCount;
            IF (existingCount = 0) THEN
                BEGIN
                    INSERT INTO sso_auth_config
                    (provider_id, sso_name, channel_id, email_id, sso_type, has_meta_file, mf_attributes_list,
                    meta_file_data, domain_url,
                    s_entity_id, s_login_sso_url, s_certificate_file_content, s_binding_type, s_auth_signed_request,
                    created_at, updated_at, saml_jit_access, saml_scim_access, saml_scim_auth_token)
                    VALUES
                    (uuid(), ssoName, channelId, emailId, ssoType, hasMetaFile, mfAttributesList,
                    '', domainURL,
                    sEntityId, sLoginSso_Url, sCertificateFileContent, sBindingType, sAuthSignedRequest,
                    NOW(), NOW(), samlJitAccess, samlScimAccess, samlScimAuthToken);
                    SELECT LAST_INSERT_ID() as ID;
                END;
            ELSE
                BEGIN
                    SET ID = -1; -- Duplicate Entry Found
                    SELECT ID;
                END;
            END IF;
        END;
    ELSE
        BEGIN
            UPDATE sso_auth_config
            SET sso_name = ssoName,
                has_meta_file = hasMetaFile, 
                mf_attributes_list = mfAttributesList,
                domain_url = domainURL,
                s_entity_id = sEntityId,
                s_login_sso_url = sLoginSso_Url,
                s_certificate_file_content = sCertificateFileContent,
                s_binding_type = sBindingType,
                s_auth_signed_request = sAuthSignedRequest,
                saml_jit_access = samlJitAccess,
                saml_scim_access = samlScimAccess,
                saml_scim_auth_token = samlScimAuthToken,
                updated_at = NOW()
            WHERE id = editSSOId AND channel_id = channelId;
            SELECT ROW_COUNT() AS Updated_count;
        END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studio_environment_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `studio_environment_add`(IN channelId INT, IN envName TEXT, IN sheetEnv TEXT)
BEGIN
	IF channelId = 0 THEN
		SELECT 0 AS 'result', 'Cannot add default environment.' AS 'message', 0 AS 'env_id';
	ELSE
		IF EXISTS (SELECT 1 FROM studio_environments WHERE (channel_id = 0 OR channel_id = channelId) AND LOWER(env_name) = LOWER(envName)) THEN
			SELECT 0 AS 'result', 'Name already exist.' AS 'message', 0 AS 'env_id', envName as 'env_name', sheetEnv AS 'sheet_env';
		ELSE
			INSERT INTO studio_environments (env_name, channel_id, sheet_env)
			VALUES (envName, channelId, sheetEnv);
			SELECT 1 AS 'result', 'Environment added.' AS 'message', LAST_INSERT_ID() AS 'env_id', envName as 'env_name', sheetEnv AS 'sheet_env';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studio_environment_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `studio_environment_delete`(IN channelId INT, IN envId INT)
BEGIN
	IF channelId = 0 THEN
		SELECT 0 AS 'result', 'Cannot delete default environment.' AS 'message', envId AS 'env_id';
	ELSE
		IF EXISTS (SELECT 1 FROM studio_environments WHERE channel_id <> 0 AND channel_id = channelId AND env_id = envId) THEN
			DELETE FROM studio_environments WHERE env_id = envId;
			SELECT 1 AS 'result', 'Environent deleted.' AS 'message', envId AS 'env_id';
		ELSE
			SELECT 0 AS 'result', 'Environent not exist.' AS 'message', envId AS 'env_id';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studio_environment_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `studio_environment_edit`(IN channelId INT, IN envId INT, IN envName TEXT, IN sheetEnv TEXT)
BEGIN
	IF channelId = 0 THEN
		SELECT 0 AS 'result', 'Cannot rename default environment.' AS 'message', envId AS 'env_id', envName AS 'env_name', sheetEnv AS 'sheet_env';
	ELSE
		IF EXISTS (SELECT 1 FROM studio_environments WHERE (channel_id = 0 OR channel_id = channelId) AND LOWER(env_name) = LOWER(envName) AND env_id <> envId) THEN
			SELECT 0 AS 'result', 'Name already exist.' AS 'message', envId AS 'env_id', envName AS 'env_name';
		ELSE
			UPDATE studio_environments SET env_name = envName, sheet_env = sheetEnv WHERE env_id = envId;
			SELECT 1 AS 'result', 'Environment name updated.' AS 'message', envId AS 'env_id', envName AS 'env_name', sheetEnv AS 'sheet_env';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studio_environment_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `studio_environment_get`(IN channelId INT)
BEGIN
	SELECT * FROM studio_environments
	WHERE channel_id = 0 OR channel_id = channelId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateActionBtnOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `UpdateActionBtnOrder`(in actionId int, in displayIndex int,in chanName text)
BEGIN

declare chanId, returnType int default 2;

select channelId from channel where channelName = chanName into chanId;

        update actionbutton
    set dispindex = displayIndex,
    modify_date = NOW()
        where abid = actionId and channelId = chanId;

        set returnType = 1;

select returnType;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCatalogueOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `updateCatalogueOrder`(IN chanId INT, IN tempId INT,IN displayIndex int)
BEGIN



update categorytemplate set dispindex = displayIndex

		where viewid = tempId and channelId = chanId;

		

select 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCategoryOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `UpdateCategoryOrder`(in categoryId int, in displayIndex int,in chanName text)
BEGIN



declare chanId, returnType int default 2;



select channelId from channel where channelName = chanName into chanId;



		update category set indexing = displayIndex, modify_date = now()

		where catId = categoryId and channelId = chanId;	



		set returnType = 1;



select returnType;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOnpremPlanDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `updateOnpremPlanDetails`(IN channelId INT, IN channelJson LONGTEXT, IN countJson LONGTEXT,
	IN exceptionJson LONGTEXT)
BEGIN
	UPDATE sliated_nalp_merpno SET
		lennahc_json = channelJson,
		tnuoc_json = countJson,
		noitpecxe_json = exceptionJson,
		updated_at = NOW(),
		sync_at = NOW()
	WHERE channel_id = channelId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOnpremTotalTaskUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `updateOnpremTotalTaskUpdate`(IN channelId INT, IN countJson TEXT)
BEGIN
	UPDATE sliated_nalp_merpno 
    SET tnuoc_json = countJson
	WHERE channel_id = channelId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upsertAdminInviteDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `upsertAdminInviteDetails`(
IN adminId INT, IN emailId TEXT, IN invitedOn DATETIME, IN inviteAcceptedOn DATETIME, IN verificationCode INT, IN verified TEXT, IN UserName TEXT, IN Password TEXT, IN companyName TEXT, IN phoneNo TEXT, IN res_type TEXT, IN admin_address TEXT, IN admin_website TEXT)
BEGIN

	IF NOT EXISTS (SELECT 1 FROM `admininvites` WHERE `adminId` = adminId AND `emailId` = emailId) THEN
    
		INSERT INTO `admininvites` (`adminId`, `emailId`, `invitedOn`, `inviteAcceptedOn`, `verificationCode`, `verified`, `UserName`, `Password`, `companyName`, `phoneNo`, `res_type`, `admin_address`, `admin_website`)
		VALUES (adminId, emailId, invitedOn, inviteAcceptedOn, verificationCode, verified, UserName, Password, COALESCE(companyName, ""), COALESCE(phoneNo, ""), COALESCE(res_type, ""), COALESCE(admin_address, ""), COALESCE(admin_website, ""));

    else
    
		UPDATE `admininvites`
		SET
		`invitedOn` = invitedOn,
		`inviteAcceptedOn` = inviteAcceptedOn,
		`verificationCode` = verificationCode,
		`verified` = verified,
		`UserName` = UserName,
		`Password` = Password,
		`companyName` = COALESCE(companyName, ""),
		`phoneNo` = COALESCE(phoneNo, ""),
		`res_type` = COALESCE(res_type, ""),
		`admin_address` = COALESCE(admin_address, ""),
		`admin_website` = COALESCE(admin_website, "")
		WHERE `adminId` = adminId AND `emailId` = emailId;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v10_diy_GetCatAPILIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v10_diy_GetCatAPILIST`(IN chanId INT, IN globalChannelId INT, IN pluginId INT)
BEGIN
  SELECT api_category_id, cat_name, cat_desc, cat_image_url, scheme_type, channel_id, create_on, created_by, updated_on, cat_type, 
		sub_category_id, sub_category_name, sub_category_desc,sub_created_on,sub_modify_on ,category_id, sub_category_method,
        IF(channel_id = globalChannelId, 1, 0) isGlobal,
        IF(channel_id = chanId, 1, 0) isEditable,
		isCatPublic, isSubCatPublic, ac.isInstalled, asu.plugin_id, asu.isSubCatInstalled, ac.format_id, asu.format_id as subCat_format_id
	FROM api_category ac
	LEFT JOIN api_sub_category asu 
    ON asu.category_id=ac.api_category_id AND asu.isDeleted = 0 AND (asu.plugin_id = 0 OR asu.plugin_id = pluginId)
    WHERE ac.isDeleted = 0 AND ((channel_id = globalChannelId AND (isCatPublic = 1 && isSubCatPublic = 1)) or channel_id=chanId ) AND scheme_type != "multistep_auth";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_ActivateDeactivateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_ActivateDeactivateUser`(in userIdBunch text, in activeDeactiveFlag int, in chanName text)
BEGIN

declare chanId, urId int;
declare lastVal, counter int default 0;

select channelId from channel where channelName = chanName into chanId;

select substrcount(userIdBunch, ',') + 1 into lastVal;

repeat

	set counter = counter + 1;
	select strsplit(userIdBunch, ',', counter) into urId;

	update userdetails set is_active = activeDeactiveFlag where uid = urId and channelId = chanId;

	if(activeDeactiveFlag = 0) then
		update contentdownload set isContentDeleted = true, notifydownload='n' where uid = urId and channelId = chanId;
	end if;

until counter = lastVal
end repeat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_ChangeGroupByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_ChangeGroupByUserId`(in userId int,in groupId TEXT)
BEGIN

DECLARE i, chanId INT DEFAULT 0;
DECLARE ctr INT DEFAULT 0;
DECLARE temp_str TEXT DEFAULT '';

SELECT channelid FROM userdetails WHERE uid = userId AND is_active = 1 INTO chanId;

		delete from uidgid where uid = userId; 
-- if not exists(select * from uidgid where uid=userId and gid=groupId)then
	 
		select substrcount(groupId, ',') + 1 into i;	

		WHILE(ctr<i) DO
			SET ctr=ctr+1; 
			
			select strsplit(groupId, ',', ctr) into temp_str;	
			IF EXISTS (SELECT * FROM usergroup WHERE gid = temp_str AND channelid = chanId) THEN
			  IF NOT EXISTS (SELECT * FROM uidgid WHERE uid = userId AND gid = temp_str) THEN
			    INSERT INTO uidgid (uid, gid) VALUES (userId, temp_str);
			  END IF;
		  END IF;

		END WHILE;

   -- Update uidgid set gid=groupId where uid=userId;

-- end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_ChangeUserNameByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_ChangeUserNameByUserId`(in urId int,in userName TEXT)
BEGIN



DECLARE usrId INT DEFAULT 0;



   -- insert into default group

  IF EXISTS(SELECT uid FROM userdetails  WHERE uid = urId)THEN

    SELECT ud.userid FROM userdetails ud  WHERE ud.uid = urId INTO usrId;

    UPDATE userinfo SET uname = userName WHERE userid = usrId;

  END IF;

  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_CreateChannelCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_CreateChannelCode`(in chanName text,in requestId text)
BEGIN

Declare chan_code text;

set chan_code='';

select channCode from channel where channelname=chanName into chan_code;



if(chan_code='' or ISNULL(chan_code))then



 update channel set channCode=requestId where channelname=chanName;

 select channCode from channel where channelname=chanName into chan_code;



end if;



Select chan_code;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_CreatedActivateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_CreatedActivateUser`(in username text,in emailid text,in designation text,in userhash Text,in usersalt text,in useritr text, in chanName text)
BEGIN
Declare chanId,usrId, urId int DEFAULT 0;
declare resptype int DEFAULT 0;
DECLARE regDate DATETIME;

Select channelid from channel where channelname=chanName into chanId;

 IF exists (select * from userinfo where uemail=emailid) then
    update userinfo set uname=username,udesg=designation,uhashcode=userhash,usaltcode=usersalt,uiterations=useritr, is_verified = 1 where uemail=emailid;
		select userid from userinfo where uemail=emailid INTO usrId;
    update userdetails set signup_date=NOW() WHERE userid=usrId and channelid=chanId;
    SELECT uid, registrationDate from userdetails where userid = usrId AND channelid = chanId INTO urId, regDate;
    
		set resptype=1;

  end if;

Select resptype, urId, regDate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_Create_Folder_App` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_Create_Folder_App`(IN actitle TEXT, IN chanName TEXT,IN templateId INT,IN urId INT)
BEGIN

 DECLARE chanId, indx INT;
 DECLARE actionButtonId INT default 0;

 SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
 select GetIndexForCategory(chanName) into indx;
if not exists(select * from actionbutton where channelid= chanId and title= actitle and `action`='folderview') then
	 INSERT INTO actionbutton (title, `action`, url, image, dispindex, channelid, action_tile_img, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, tile_xhdpi, tile_hdpi, tile_mdpi, tile_ldpi)
	 VALUES (actitle, 'folderview', '', '', indx, chanId, '', '', '', '', '', '', '', '', '');
	 SELECT LAST_INSERT_ID() INTO actionButtonId;
	 CALL diy_TrfCategoryToTemplate(actionButtonId, templateId, 'f', 'folder view');
 end if;
 SELECT actionButtonId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_GetAppMetaList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_GetAppMetaList`(in chanName text)
BEGIN

SELECT
    c.display_name,
    c.bannerimg,
    cr.modifieddate,
    cr.chan_Cat_Listing,
    cr.splash_bg_color,
    cr.img_xhdpi,
    cr.img_hdpi,
    cr.img_mdpi,
    cr.img_ldpi,
    cr.splash_bg_bb_url,
    cr.img_top_bar_xxhdpi,
    cr.img_top_bar_xhdpi,
    cr.img_top_bar_hdpi,
    cr.img_top_bar_mdpi,
    cr.img_top_bar_ldpi,
    cr.splash_img_xxhdpi,
    cr.splash_img_xhdpi,
    cr.splash_img_hdpi,
    cr.splash_img_mdpi,
    cr.splash_img_ldpi,
    cr.banner_url,
    cr.header_color,
    cr.header_style,
    cr.statusbar_color,
    cr.statusbar_style,
    cr.about_us,
	  cr.support_url,
	  cr.support_email,
	  cr.privacy_url,
	  cs.disable_screenshot,
       cs.status_app,
      cs.status_app_color,
	   COALESCE(cs.mpin_enabled,0) as mpin_enabled,
	  COALESCE(cs.mpin_timeout_interval,0) as mpin_timeout_interval,
	  COALESCE(cs.biometric_enabled,0) as biometric_enabled,
      cs.biological_characteristics,
	  COALESCE(cam.allowSocial,1) AS allowSocial,
	  COALESCE(cam.allowDownload,1) AS allowDownload,
	  COALESCE(cam.allowProfile,1) AS allowProfile,
	  COALESCE(c.is_oem,0) AS is_oem,
	  COALESCE(cs.enable_logging,1) as enable_logging,
       COALESCE(cs.logging_with_screenshot,0) as logging_with_screenshot
FROM channel c
    JOIN channelrights cr ON c.channelid = cr.channelid
    left JOIN channel_setting cs ON c.channelid = cs.channelid
    left join channel_app_module cam on  c.channelid = cam.channelid
WHERE c.channelname = chanName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_GetCategoryListingType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_GetCategoryListingType`(in chanName text)
BEGIN

declare chanId INT;



 Select channelid from channel where channelname=chanName into chanId;

 Select chan_Cat_Listing from channelrights where channelId=chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_GetRights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_GetRights`(IN roleId INT)
BEGIN



DECLARE um, cm, an BOOL;

DECLARE rlnm TEXT;



SELECT usermanagement, campaignmanagement, analysis, rolename FROM roles WHERE rid = roleId

INTO um, cm, an, rlnm;



SELECT um, cm, an, rlnm;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_GetUserActivationInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_GetUserActivationInfo`(in chan_code text,in u_code text)
BEGIN

SELECT ch.channelname,ch.channelinfo,ch.display_name,cr.img_top_bar_xhdpi,ui.uname,ui.uemail,ud.registrationDate,ud.is_active, ud.uid, ui.is_verified FROM channel ch
inner join userdetails ud on  ud.channelid=ch.channelid
inner join userinfo ui on ui.userid=ud.userid join channelrights cr on ud.channelid = cr.channelid where ch.channCode=chan_code and ui.usercode=u_code;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V2_SetUserPasswordRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V2_SetUserPasswordRequest`(IN userMailId TEXT, IN passReqToken VARCHAR(150))
BEGIN

DECLARE usrId, chanId INT DEFAULT 0;
DECLARE returnVal INT DEFAULT 0;
DECLARE usrName, chanName TEXT DEFAULT '';

IF EXISTS (SELECT userid FROM userinfo WHERE uemail = userMailId) THEN
	SELECT userid FROM userinfo WHERE uemail = userMailId INTO usrId;
	IF EXISTS (SELECT userid FROM userpasswordrequest WHERE userid = usrId) THEN
		UPDATE userpasswordrequest SET requesttoken = passReqToken, requesttime = NOW() WHERE userid = usrId;
	ELSE
		INSERT INTO userpasswordrequest (userid, requesttoken, requesttime) VALUES (usrId, passReqToken, NOW());
	END IF;

	SELECT uname FROM userinfo WHERE userid = usrId INTO usrName;
	SELECT channelid FROM userdetails WHERE userid = usrId LIMIT 1 INTO chanId;
	SELECT channelname FROM channel WHERE channelid = chanId INTO chanName;
	
	SET returnVal = 1;
END IF;

SELECT returnVal, usrName, chanName, chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v2_Update_Folder_App` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v2_Update_Folder_App`(IN actitle TEXT, IN chanName TEXT,IN templateId INT,IN urId INT,IN actionId INT)
BEGIN
 DECLARE chanId, indx INT;
 DECLARE actionButtonId INT default 0;

 SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
if exists(select * from actionbutton where channelid= chanId  and `action`='folderview' and abid=actionId) then
     update actionbutton set title=actitle  where channelid= chanId  and `action`='folderview' and abid=actionId;
	 set actionButtonId=1;
	
 end if;
 SELECT actionButtonId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v3_GenerateSaasLicense` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v3_GenerateSaasLicense`(IN chanName TEXT, IN planType TEXT, IN licDuration INT, IN startDateTime DATETIME, IN licCal TEXT, IN licSid TEXT, IN userCount INT, IN deliveryCount INT, IN diskSpace DOUBLE, IN pushContent INT, IN rba INT, IN whitelabel BOOL, IN contExpiry BOOL, IN subscrId TEXT, IN bcmCount INT, IN categCount INT, IN licType TEXT, IN licAction TEXT)
BEGIN

DECLARE chanId INT;
declare recudate datetime;
SELECT channelId FROM channel WHERE channelName = chanName INTO chanId;

IF NOT EXISTS (SELECT * FROM saaslicense WHERE channelId = chanId) THEN
   select DATE_SUB(now(), INTERVAL (DAY(LAST_DAY(now()))-14) DAY) into recudate; 

    INSERT INTO saaslicense
    VALUES(chanId, (ENC(licDuration)), (ENC(startDateTime)), (ENC(licCal)), (ENC(licSid)),
    planType, (ENC(userCount)), (ENC(deliveryCount)), (ENC(diskSpace)), (ENC(pushContent)),
    (ENC(rba)), (ENC(whitelabel)), (ENC(contExpiry)), (ENC(recudate)), ENC(subscrId),
    ENC(bcmCount), ENC(categCount), '', 0, licType, licAction);
ELSE
    UPDATE saaslicense SET
    noitarud = ENC(licDuration),
    tratsfoetad = ENC(startDateTime),
    planname = planType,
    tnuocresu = ENC(userCount),
    tnuocyreviled = ENC(deliveryCount),
    ecapsksid = ENC(diskSpace),
    tnuochsup = ENC(pushContent),
    abr =  ENC(rba),
    lebaletihw = ENC(whitelabel),
    yripxec = ENC(contExpiry),
    etadrrucer = (ENC(startDateTime)),
    ppsubid = ENC(subscrId),
	tnuocmcb = ENC(bcmCount),
	tnuocgetac = ENC(categCount),
    lic_type = licType,
    lic_action = licAction
    WHERE channelid = chanId;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_CreateCouchdbDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_CreateCouchdbDetails`( in chanId INT)
BEGIN
DECLARE resptype INT;
SET resptype=0;
 IF NOT EXISTS(select * from couchdb_data where channel_id=chanId)THEN
 insert into couchdb_data(channel_id, server_endpoint, database_name, username, `password`, wipe_data, created_at, couchdb_token)
 VALUE(chanId,'https://sheetdb.dronahq.com',concat("cdb",chanId),'dhq-admin',
 'AwFkoWIE+DaQHUhaTc1ojrLmFi+XMo31AuQfhzutigvtSzCygE4BSE6CSuIvEiY2/8qwXz267TYpM87bFaLuFUJo9x9xEOlAg+jhh35UgEgoSVWxJpERo2zP5Sk1vZ+z+Ko=',
 0,NOW(),uuid());
 SET resptype=1;
 END IF;
 SELECT resptype;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_create_embedbuilder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_create_embedbuilder`(in chanId int,in pluginId int,in emdCode text, in createdBy text,in readStatus int)
BEGIN
  IF not exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId) then
      insert into formbuilder_embed(embedcode, plugin_id, channel_id, created_by, created_date, ready_only,is_disable)
          values(emdCode,pluginId,chanId,createdBy,now(),readStatus,1);
  END IF;
  select embed_id, embedcode, plugin_id, fe.channel_id, created_by, created_date, ready_only, is_disable, frdname, emdfavicom, emdtitle, emddecscription, emdshortdescription,subdo_name,cust_domain,is_private,pwa_manifest
  from formbuilder_embed fe 
  left join channelsubdomain cs on cs.channelid=fe.channel_id
  left join channel_custom_domain cd on cd.channel_id=cs.channelid
  where fe.channel_id=chanId and fe.plugin_id=pluginId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_deleteAPISubCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_deleteAPISubCategory`(in channelid INT, in catid int, in subcatid int)
BEGIN
	declare checkCat int default 0;
	declare checkSubCat int default 0;
    declare result int default 0;
    select 1 from api_category where channel_id = channelid and api_category_id = catid into checkCat;
	if checkCat = 1 then
		select 1 from api_sub_category where sub_category_id = subcatid and category_id = catid and isDeleted = 0 into checkSubCat;
        if checkSubCat = 1 then
			UPDATE api_sub_category SET
				sub_modify_on = CURRENT_TIMESTAMP,
				isDeleted = 1
			WHERE category_id = catid and sub_category_id = subcatid;
            select 1 into result;
		end if;
	end if;
    select result as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_deleteFolder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_deleteFolder`(IN fAbid INT)
BEGIN
    DECLARE resp INT DEFAULT 0;
    IF EXISTS(SELECT * FROM actionbutton WHERE abid = fAbid) THEN
        if NOT EXISTS(SELECT * FROM folderstructure WHERE actionid = fAbid)THEN
            DELETE FROM actionbutton WHERE abid = fAbid;
            DELETE FROM mapviewcat WHERE type = "f" AND catid = fAbid;
            DELETE FROM folderstructure  WHERE actionid = fAbid;
            SELECT 1 INTO resp;
            else
			  SELECT 2 INTO resp;
		END IF; 
        
    END IF;
   
    SELECT resp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V7_diy_CreateNewChannel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V7_diy_CreateNewChannel`(in chtype Text, in chZonetype Text,in s_ldpiImg text,in s_mdpiImg text,in s_hdpiImg text,in s_xhdpiImg text,in tb_ldpiImg text,in tb_mdpiImg text,in tb_hdpiImg text,in tb_xhdpiImg text,in chanTzoneId text,in ownerEmail text,in displayNm text)
BEGIN
DECLARE chancontType, templateId INT;
DECLARE  chanId, roleId, mgmtUser, groupId, campaignId INT;
DECLARE chanAdminName TEXT;
DECLARE returnType, returnVal int default 0;
DECLARE chanName TEXT;
START TRANSACTION;

    SELECT chantype FROM channeltype WHERE typename=chtype INTO chancontType;

	 	INSERT INTO channel (channelname, channelinfo, channelimg, registrationDateTime, display, contactmail, channelwebsite, bannerimg,display_name,signup_status)
        VALUES ('Drona', '', 'NA', NOW(), 1, ownerEmail, 'NA', 'NA',displayNm,'3');

        SELECT LAST_INSERT_ID() INTO chanId;

	    SELECT CONCAT('DRONA5_Team', chanId) INTO chanName;
      	UPDATE channel SET channelname = chanName WHERE channelid = chanId;
       -- SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

	   	INSERT INTO channelowner(channelid, firstname, lastname, contactPhone, contactEmail, companyname)
	   	  VALUES (chanId, ownerEmail, 'NA', 'NA', ownerEmail, '');

        CALL SetChannelTimezone(chZonetype, chanTzoneId, chanName);

        INSERT INTO adminusersignup(signup_email_id, signup_date) VALUES(ownerEmail, Now());

		 INSERT INTO roles (rolename, usermanagement, campaignmanagement, analysis, rolecreationdate, channelid)
        VALUES ('Admin', TRUE, TRUE, TRUE, NOW(), chanId);
            
        SELECT rid FROM roles WHERE rolename = 'Admin' AND channelid = chanId INTO roleId;

		INSERT INTO usergroup (gname, details, channelid, creationdate, isDefault) VALUES
        ('Default', 'All the users initially will register in this group', chanId, NOW(), 1);

        SELECT gid FROM usergroup WHERE gname = 'Default' AND channelid = chanId INTO groupId;

        INSERT INTO notificationrange (fromRange, toRange, gid) VALUES
        ('00:00:00', '00:00:00', groupId);

        INSERT INTO deliveryrange (fromRange, toRange, gid) VALUES
        ('00:00:00', '00:00:00', groupId);
            
		INSERT INTO campaign (campname, campdesc, startdate, status, channelid, campaignCreationDate) VALUES
        ('Default Campaign', 'Default Campaign', NOW(), FALSE, chanId, NOW());

        SELECT campid FROM campaign WHERE campname = 'Default Campaign' AND channelid = chanId INTO campaignId;

        IF NOT EXISTS (SELECT * FROM assigncampaign WHERE gid = groupId) THEN
            INSERT INTO assigncampaign (gid, campid) VALUES (groupId, campaignId);
        ELSE
            UPDATE assigncampaign SET campId = campaignId WHERE gid = groupId;
        END IF;

        CALL SetGroupCampaignHistory(groupId, campaignId);

        INSERT INTO campstyling VALUES (campaignId, 1);
        
        INSERT INTO enterpriseprovision VALUES('N', chanId);

		   INSERT INTO channelrights(channelId, launchscreen, switchchannelflag, subscriptionflag, categorytitle, authortitle,
          modifieddate, splash_bg_url, splash_logo_url, splash_logo_text, splash_text, recommendation_Allowed, IsCollabrationSuits, 
          isPublicRead, splash_bg_bb_url, chan_Cat_Listing, splash_bg_color, img_xhdpi, img_hdpi, img_mdpi, img_ldpi, chantype, img_top_bar_xhdpi, img_top_bar_hdpi, img_top_bar_mdpi, img_top_bar_ldpi) 
        VALUES (chanId, 'category',true,false,'Category', 'Author', NOW(),'','','','', 1, true,1,'','Grid','#ffffff',s_xhdpiImg,s_hdpiImg,s_mdpiImg,s_ldpiImg,chancontType,tb_xhdpiImg,tb_hdpiImg,tb_mdpiImg,tb_ldpiImg);
        
		INSERT INTO licensecounter VALUES (chanId, 0, 0);

		INSERT INTO channelsec VALUES (chanId, 0, '');
		
		INSERT INTO channel_setting(channelid,status_app) VALUES (chanId,1);

     SET returnType = 1,returnVal = chanId;
		
	-- create default default template for new channel	
	SELECT diy_GetOrCreateDefaultTemplate(chanId) INTO templateId;


COMMIT;

SELECT returnType,returnVal,chanName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_getAdminUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_getAdminUsers`(IN chanId INT, IN catStr TEXT)
BEGIN
DECLARE ownerMail VARCHAR(250);

SELECT contactmail FROM channel WHERE channelid = chanId INTO ownerMail;

SELECT
 au.admin_id,
 ct.viewid,
 ud.uid,
 ui.uname AS 'name',
 ui.uemail as 'email',ud.last_app_launch, ui.isAdmin,ui.is_verified,au.is_super,ud.is_active,
  (CASE WHEN ui.uemail = ownerMail THEN 1 ELSE 0 END) AS 'is_owner',
	GROUP_CONCAT(CONCAT(ct.viewid, '`', ct.viewname)) AS cat_bunch
	/* (select GROUP_CONCAT(CONCAT(ct.viewid, '`', ct.viewname)) from admin_view_access ava
    JOIN categorytemplate ct ON ct.viewid = ava.viewid
                        where ava.admin_id=au.admin_id  group by au.admin_id) AS cat_bunch*/
FROM adminuser au
 JOIN userinfo ui 
	ON ui.userid = au.userid
 JOIN userdetails ud 
	ON ud.userid = au.userid
 LEFT JOIN admin_view_access ava
	ON ava.admin_id= au.admin_id
 LEFT JOIN categorytemplate ct
	ON ct.viewid = ava.viewid
WHERE au.channelid = chanId
 AND ud.is_active = 1
 AND ((catStr = '0') OR FIND_IN_SET(ct.viewid, catStr))
GROUP BY ud.uid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_GetAppList_ForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_GetAppList_ForUser`(IN urId INT, IN chanId INT)
BEGIN



DECLARE defaultTemplate INT;



DROP TEMPORARY TABLE IF EXISTS temp_viewIdsPerUser;

CREATE TEMPORARY TABLE temp_viewIdsPerUser (tids INT, tViewRank INT);



SELECT diy_GetOrCreateDefaultTemplate(chanId) INTO defaultTemplate;

INSERT INTO temp_viewIdsPerUser VALUES(defaultTemplate, 0);



IF EXISTS (SELECT * FROM uidgid WHERE uid = urId) THEN



  INSERT INTO temp_viewIdsPerUser

    SELECT viewid, viewid FROM mapviewgrp

      WHERE gid IN (SELECT gid FROM uidgid u WHERE uid = urId)

        AND viewid <> defaultTemplate;



END IF;



DROP TEMPORARY TABLE IF EXISTS temp_catListPerUser;

CREATE TEMPORARY TABLE temp_catListPerUser

  (kbId INT, kbName VARCHAR(200), kbAction VARCHAR(200),kbIndexing INT,kbGridXhdpi VARCHAR(200), kbGridHdpi VARCHAR(200), kbGridMdpi VARCHAR(200),

   kbGridLdpi VARCHAR(200),kbType VARCHAR(10), tPluginVerCode VARCHAR(15),tIsDraft INT, tViewRank INT,tPluginCount INT,tPluginLastAccessed DATETIME,
   version_details VARCHAR(100),INDEX my_index_catListPerUserid (kbId,kbIndexing,tIsDraft,tViewRank)
   
   );



INSERT INTO temp_catListPerUser

  SELECT

    c.catId, c.catName, catDescp,indexing, grid_xhdpi, grid_hdpi, grid_mdpi, grid_ldpi, 'c', '',0, tv.tViewRank,COALESCE(ca.accessedtype,0),COALESCE(ca.accessedon,'0000-00-00 00:00:00'), ""

    FROM category c

    JOIN mapviewcat mc on c.catid = mc.catid

    JOIN temp_viewIdsPerUser tv on tv.tids = mc.viewid

    LEFT JOIN user_rating_icon uri ON uri.icon_id = c.catid

    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = c.catid AND uri1.uid = urId

    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = c.catid AND ufi.icon_type = 'c' AND ufi.uid = urId

    LEFT jOIN categoryaccessed ca ON ca.uid=urId AND ca.catid = c.catId

    WHERE

      c.channelId = chanId

      AND searchable = true

      AND ca.uid=urId

      AND mc.`type` = 'c'

    GROUP BY c.catId;





INSERT INTO temp_catListPerUser

  SELECT

    abid, title, `action`,a.dispindex,grid_xhdpi, grid_hdpi, grid_mdpi,

    grid_ldpi,

    'a',
    pav.version_code,COALESCE(pa.is_draft, 0), tv.tViewRank,COALESCE(ca.accessedtype,0),COALESCE(ca.accessedon,'0000-00-00 00:00:00'), fn_getPluginVersions(pa.plugin_id)

  FROM actionbutton a

    JOIN mapviewcat mc on a.abid = mc.catid

    JOIN temp_viewIdsPerUser tv on tv.tids = mc.viewid

    LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid

    LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id AND pa.is_active = 1


    LEFT JOIN plugin_app_version pav
      ON (pav.plugin_ver_id = pa.beta_version )
        OR (pav.plugin_ver_id = pa.latest_version )
    -- LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN app_custom_view acv ON acv.plugin_id = pa.plugin_id
    LEFT jOIN categoryaccessed ca ON ca.actbtnid=a.abid AND ca.uid=urId
  WHERE a.channelId = chanId and mc.`type` = 'a' AND searchable = true
  GROUP BY a.abid;
  
INSERT INTO temp_catListPerUser
  SELECT
      abid, title, `action`,a.dispindex,grid_xhdpi, grid_hdpi, grid_mdpi,
       grid_ldpi,
       'f', '',0, tv.tViewRank,0,'0000-00-00 00:00:00', ""
    FROM actionbutton a
    JOIN mapviewcat mc on a.abid = mc.catid
    JOIN temp_viewIdsPerUser tv on tv.tids = mc.viewid
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    WHERE a.channelId = chanId 
      AND mc.`type` = 'f' AND searchable = true 
    GROUP BY a.abid;

SELECT * FROM temp_catListPerUser WHERE tIsDraft = 0  ORDER BY tViewRank, kbIndexing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_GetCatAPILIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_GetCatAPILIST`(IN chanId INT, IN globalChannelId INT)
BEGIN
	SELECT api_category_id, cat_name, cat_desc, cat_image_url, scheme_type, channel_id, create_on, created_by, updated_on, 
		sub_category_id, sub_category_name, sub_category_desc,sub_created_on,sub_modify_on ,category_id, sub_category_method,
        IF(channel_id = globalChannelId, 1, 0) isGlobal,
        IF(channel_id = chanId, 1, 0) isEditable,
		isCatPublic, isSubCatPublic
	FROM api_category ac
	LEFT JOIN api_sub_category asu ON asu.category_id=ac.api_category_id AND asu.isDeleted = 0 
    WHERE ac.isDeleted = 0 AND ((channel_id = globalChannelId AND (isCatPublic = 1 && isSubCatPublic = 1)) or channel_id=chanId );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_GetTemplates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_GetTemplates`(IN chanId INT,IN searchText TEXT)
BEGIN

SELECT ct.*,v7_fnGetAppCount(chanId,ct.viewid) as app_count,
  (select count(mvg.gid) FROM mapviewgrp mvg where mvg.viewid=ct.viewid)as group_count,
   if(ct.ismaster=1,(select count(ug.uid) FROM userdetails ug  where ug.channelid=chanId and ug.is_active=1),(select count(ug.uid) FROM uidgid ug LEFT JOIN mapviewgrp mvg ON ug.gid=mvg.gid where mvg.viewid=ct.viewid))as user_count,
 --  (select count(ug.uid) FROM uidgid ug LEFT JOIN mapviewgrp mvg ON ug.gid=mvg.gid where mvg.viewid=ct.viewid) as user_count,
  (select GROUP_CONCAT(mvg.gid) FROM mapviewgrp mvg where mvg.viewid=ct.viewid)as groupids,
  ct.dispindex AS display_index FROM categorytemplate ct
  LEFT JOIN admin_view_access ava ON ava.viewid = ct.viewid
  where channelId = chanId
  AND ((searchText = '') OR ((searchText <> '') AND (ct.viewname LIKE CONCAT('%', searchText, '%'))))
  GROUP BY ct.viewid
  ORDER BY ct.dispindex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_GetTemplatesForAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_GetTemplatesForAdmin`(IN chanId INT, IN urId INT,IN searchText TEXT)
BEGIN

DECLARE adminId INT;

SELECT admin_id FROM adminuser au JOIN userdetails ud ON ud.userid = au.userid
WHERE ud.uid = urId INTO adminId;

SELECT ct.*,v7_fnGetAppCount(chanId,ct.viewid) as app_count,
  (select count(mvg.gid) FROM mapviewgrp mvg where mvg.viewid=ct.viewid)as group_count,
  (select count(ug.uid) FROM uidgid ug LEFT JOIN mapviewgrp mvg ON ug.gid=mvg.gid where mvg.viewid=ct.viewid) as user_count,
  (select GROUP_CONCAT(mvg.gid) FROM mapviewgrp mvg where mvg.viewid=ct.viewid)as groupids,
  ct.dispindex AS display_index FROM categorytemplate ct
  LEFT JOIN admin_view_access ava ON ava.viewid = ct.viewid
  where channelId = chanId AND ava.admin_id = adminId
  AND ((searchText = '') OR ((searchText <> '') AND (ct.viewname LIKE CONCAT('%', searchText, '%'))))
  GROUP BY ct.viewid
  ORDER BY ct.dispindex;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_getUserDetailsbyuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_getUserDetailsbyuser`(in urIds text, in chanId Int)
BEGIN
declare  urId int;
declare lastVal, counter int default 0;
select substrcount(urIds, ',') + 1 into lastVal;
 DROP TEMPORARY TABLE IF EXISTS temUser;
  CREATE TEMPORARY TABLE temUser(user_id INT, channel_id INT, user_name VARCHAR(300), user_email VARCHAR(300),
  user_desg VARCHAR(300),is_active int,user_image_url varchar(3000),is_admin int , is_owner int,user_groups varchar(5000));
  SET counter = 0;
 
repeat

	set counter = counter + 1;
	select strsplit(urIds, ',', counter) into urId;
	
 insert into temUser   select 	ud.userid as 'user_id',
		ud.channelid as 'channel_id',
        ui.uname as 'user_name',
        ui.uemail as 'user_email',
        ui.udesg as 'user_desg',
        ud.is_active as 'is_active',
        ui.uimageurl as 'user_image_url',
        ui.isAdmin as 'is_admin',
        ui.is_owner as 'is_owner',
        GROUP_CONCAT(ugp.gname ) as 'user_groups'
	from userdetails ud
	left join userinfo ui on ui.userid = ud.userid
	left join uidgid ug on ug.uid=ud.uid
  left join usergroup ugp on ugp.gid=ug.gid
	where ud.channelid = chanId and ud.uid =urId
	group by ud.uid;
    
    until counter = lastVal
end repeat;
select * from temUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_Report_GetUserCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_Report_GetUserCard`(IN urId INT,IN chanId INT)
BEGIN
DECLARE ownerMail VARCHAR(250);
DECLARE isLocked bool;

SELECT channelid, contactmail FROM channel WHERE channelid = chanId INTO chanId, ownerMail;

IF EXISTS (SELECT * FROM useraccountlock WHERE uid = urId) THEN
  set isLocked = 1;
ELSE
  set isLocked = 0;
END IF;

    SELECT
        ui.uname,
        ui.uemail,
        ui.udesg,
        ui.uimageurl,
        ui.is_verified,
        ud.registrationDate,
        ud.signup_date,
        ud.last_app_launch,
        ud.is_active,
        isLocked,
        ui.isAdmin,
        (CASE WHEN ui.uemail = ownerMail THEN 1 ELSE 0 END) AS 'is_owner',
		au.is_super,
        COALESCE(app.timespent,0) as timeSpent,
        COALESCE(SUM(cv.counts), 0) AS totalViews,
        COUNT(cv.cid) AS totalContAcc,
        (SELECT COUNT(cd.cid) FROM contentdownload cd WHERE cd.uid = urId
            AND isContentDeleted = 0) AS totalDownload,
        (SELECT COUNT(au.device_id) FROM oauth_token au
            WHERE au.uid = urId and  au.device_id!='0000000000') AS deviceCount,
		(SELECT GROUP_CONCAT(gname) FROM usergroup usrg
						LEFT JOIN uidgid ug ON ug.gid = usrg.gid
						WHERE ug.uid=ud.uid
						GROUP BY ug.uid) AS grp_name,
		(SELECT GROUP_CONCAT(ug.gid order by ug.gid) FROM usergroup usrg
 						LEFT JOIN uidgid ug ON ug.gid = usrg.gid
 						WHERE ug.uid=ud.uid
 						GROUP BY ug.uid) AS gids
    FROM
        userdetails ud
            JOIN
        userinfo ui ON ud.userid = ui.userid
            LEFT JOIN
        contentviewed cv ON ud.uid = cv.uid
        LEFT JOIN apptimespent app ON ud.uid = app.uid
        LEFT JOIN adminuser au ON au.userid = ui.userid
    WHERE
        ud.uid = urId
        AND ud.channelid= chanId ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_UpdateChannelBranding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_UpdateChannelBranding`(IN chanName TEXT, IN appName TEXT,

  IN appLogo_XXHDPI VARCHAR(200), IN appLogo_XHDPI VARCHAR(200), IN appLogo_HDPI VARCHAR(200), IN appLogo_MDPI VARCHAR(200), IN appLogo_LDPI VARCHAR(200),

  IN splashLogo_XHDPI VARCHAR(200), IN splashLogo_HDPI VARCHAR(200), IN splashLogo_MDPI VARCHAR(200), IN splashLogo_LDPI VARCHAR(200),

  IN splashImage_XXHDPI VARCHAR(200), IN splashImage_XHDPI VARCHAR(200), IN splashImage_HDPI VARCHAR(200), IN splashImage_MDPI VARCHAR(200), IN splashImage_LDPI VARCHAR(200),

    IN aboutUs TEXT,IN headerColor VARCHAR(10),IN headerStyle VARCHAR(10),IN statusbarStyle varchar(10),

  IN statusBarColor VARCHAR(10))
BEGIN
DECLARE chanId INT;



SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

IF EXISTS(select * from channel where channelid=chanId)Then

UPDATE channel SET display_name = appName WHERE channelid = chanId;
UPDATE channelrights SET

    img_xhdpi = splashLogo_XHDPI,

    img_hdpi = splashLogo_HDPI,

    img_mdpi = splashLogo_MDPI,

    img_ldpi = splashLogo_LDPI,

    img_top_bar_xxhdpi = appLogo_XXHDPI,

    img_top_bar_xhdpi = appLogo_XHDPI,

    img_top_bar_hdpi = appLogo_HDPI,

    img_top_bar_mdpi = appLogo_MDPI,

	  img_top_bar_ldpi = appLogo_LDPI,

	  splash_img_xxhdpi = splashImage_XXHDPI,

	  splash_img_xhdpi = splashImage_XHDPI,

	  splash_img_hdpi = splashImage_HDPI,

	  splash_img_mdpi = splashImage_MDPI,

	  splash_img_ldpi = splashImage_LDPI,

	  about_us=aboutUs,

	  header_color=headerColor,

	  header_style=headerStyle,

	  statusbar_style=statusbarStyle,

	  statusbar_color=statusBarColor,

    modifieddate = NOW()

WHERE channelid = chanId;

UPDATE appmetajson SET is_valid = 0 WHERE channelid = chanId;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_DIY_UpdateChannelSettingSecurity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_DIY_UpdateChannelSettingSecurity`(IN chanId INT, 
    IN allowRootedDevice INT, 
     IN refreshExpiresIn INT,
     IN disableScreenshot INT, 
     IN mpinEnabled TINYINT, 
     IN mpinTimeoutInterval INT, 
     IN biometricEnabled TINYINT,
     IN bioChars VARCHAR(45),
     IN enableLogging TINYINT,
     IN loggingWithScreenshot TINYINT)
BEGIN
 IF NOT EXISTS(SELECT * FROM channel_setting WHERE channelid = chanId) THEN
   INSERT INTO 
   channel_setting(channelid, allow_rooted_device, refresh_expires_in,disable_screenshot,mpin_enabled,mpin_timeout_interval,biometric_enabled,biological_characteristics, enable_logging, logging_with_screenshot)
   VALUES 
   (chanId, allowRootedDevice, refreshExpiresIn,disableScreenshot,mpinEnabled,mpinTimeoutInterval,biometricEnabled,bioChars,enableLogging,loggingWithScreenshot);
 ELSE
   UPDATE channel_setting
   SET 
 	#device_limit = deviceLimit, 
 	allow_rooted_device = allowRootedDevice, 
 	refresh_expires_in = refreshExpiresIn,
 	disable_screenshot=disableScreenshot,
 	mpin_enabled=mpinEnabled,
 	mpin_timeout_interval=mpinTimeoutInterval,
 	biometric_enabled=biometricEnabled,
 	biological_characteristics=bioChars,
  enable_logging=enableLogging,
  logging_with_screenshot=loggingWithScreenshot 
   WHERE 
 	channelid = chanId;
 END IF;
 
 UPDATE appmetajson SET is_valid = 0 WHERE channelid = chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_diy_UserReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_diy_UserReports`(IN chanName TEXT, 
IN groupId TEXT, 
IN searchText TEXT, 
IN maxUid INT,
IN userLimit INT,
IN userStatus INT,
IN orderUserListDesc INT,
IN showDeletedUsers tinyint(1),
IN userAccessType INT)
BEGIN
DECLARE chanId INT;
DECLARE ownerMail VARCHAR(250);
DECLARE channCodeIn VARCHAR(250);
DECLARE userCount INT;

SELECT channelId, contactmail,channCode FROM channel WHERE channelname = chanName INTO chanId, ownerMail,channCodeIn;
-- fn_getUserReportCount
SELECT COUNT(DISTINCT ud.uid)
  FROM userinfo ui
    JOIN userdetails ud ON ui.userid = ud.userid
    LEFT JOIN uidgid ug ON ud.uid = ug.uid
    LEFT OUTER JOIN contentviewed ca ON ud.uid = ca.uid
    LEFT JOIN apptimespent app ON ud.uid = app.uid
    LEFT JOIN adminuser au ON au.userid = ui.userid
  WHERE
      ud.channelid= chanId
      AND ((((maxUid > 0) AND ((orderUserListDesc = 0 AND ud.uid > maxUid) OR (orderUserListDesc = 1 AND ud.uid < maxUid)) OR (maxUid = 0))))
      AND ((groupId = '0') OR (FIND_IN_SET(ug.gid, groupId)))
      AND (((showDeletedUsers = 1)) OR ((showDeletedUsers = 0) AND (ud.is_active = 1 )))
      AND (((userStatus = 2)) OR ((userStatus = 1) AND (ui.is_verified = 1 AND ud.is_active = 1 AND ud.last_app_launch != '0000-00-00 00:00:00')) OR ((userStatus = 0) AND (ui.is_verified = 0)) OR ((userStatus = 3) AND (ud.is_active = 0)) OR ((userStatus = 4) AND (ud.is_active = 1) AND (ud.last_app_launch = '0000-00-00 00:00:00') AND (ui.is_verified=1)))
      AND ((searchText = '') OR ((searchText <> '') AND (ui.uname LIKE CONCAT('%', searchText, '%')) OR ui.uemail LIKE CONCAT('%', searchText, '%'))) 
      AND ((userAccessType = 0) OR (userAccessType = (CASE WHEN ui.uemail = ownerMail THEN 1 ELSE 0 END)) OR ( userAccessType = 2 AND ui.isAdmin = 1 AND au.is_super <> 1) OR ( userAccessType = 3 AND ui.isAdmin = 1 AND au.is_super = 1))
	  INTO userCount;

-- userAccessType: 0- all , 1-owner, 2-admin, 3- super admin

if(orderUserListDesc = 1 AND maxUid=0) THEN 
  select max(uid) from userdetails INTO maxUid;
END IF;

  SELECT ud.uid, (CASE WHEN ui.uname = '' THEN '(yet to activate)' ELSE ui.uname END) AS 'name',
    ui.uemail as 'email',
    ud.last_app_launch, COALESCE(SUM(ca.counts), 0) as 'totalViews', COALESCE(COUNT(ca.cid), 0) AS 'uniqueViews',
    app.timespent as 'timeSpent',
    ui.isAdmin,
    ui.is_verified,userCount,
    (select GROUP_CONCAT(gname) from usergroup usrg
                        left join uidgid ug on ug.gid = usrg.gid
                        where ug.uid=ud.uid
                        group by ug.uid) as grp_name,
    (SELECT GROUP_CONCAT(gid) FROM uidgid ug WHERE ug.uid = ud.uid) as grp_id,
    ud.is_active,
    (CASE WHEN ui.uemail = ownerMail THEN 1 ELSE 0 END) AS 'is_owner',
    au.is_super,
    ui.usercode,
    channCodeIn,
    (CASE WHEN au.is_creator = 1 THEN 1 ELSE 0 END) AS 'is_creator',
    ui.is_external_auth
  FROM userinfo ui
    JOIN userdetails ud ON ui.userid = ud.userid
    LEFT JOIN uidgid ug ON ud.uid = ug.uid
    LEFT OUTER JOIN contentviewed ca ON ud.uid = ca.uid
    LEFT JOIN apptimespent app ON ud.uid = app.uid
    LEFT JOIN adminuser au ON au.userid = ui.userid
  WHERE
      ud.channelid= chanId
      AND ((((maxUid > 0) AND ((orderUserListDesc = 0 AND ud.uid > maxUid) OR (orderUserListDesc = 1 AND ud.uid < maxUid)) OR (maxUid = 0))))
	  AND ((groupId = '0') OR (FIND_IN_SET(ug.gid, groupId)))
	  AND (((showDeletedUsers = 1)) OR ((showDeletedUsers = 0) AND (ud.is_active = 1 )))
      AND (((userStatus = 2)) OR ((userStatus = 1) AND (ui.is_verified = 1 AND ud.is_active = 1 AND ud.last_app_launch != '0000-00-00 00:00:00')) OR ((userStatus = 0) AND (ui.is_verified = 0)) OR ((userStatus = 3) AND (ud.is_active = 0)) OR ((userStatus = 4) AND (ud.is_active = 1) AND (ud.last_app_launch = '0000-00-00 00:00:00') AND (ui.is_verified=1)))
      AND ((searchText = '') OR ((searchText <> '') AND (ui.uname LIKE CONCAT('%', searchText, '%')) OR (ui.uemail LIKE CONCAT('%', searchText, '%'))))
	  AND ((userAccessType = 0) OR (userAccessType = (CASE WHEN ui.uemail = ownerMail THEN 1 ELSE 0 END)) OR ( userAccessType = 2 AND ui.isAdmin = 1 AND au.is_super <> 1) OR ( userAccessType = 3 AND ui.isAdmin = 1 AND au.is_super = 1) OR (userAccessType = 4 AND ui.isAdmin = 1 AND au.is_creator = 1))
    GROUP BY ud.uid ORDER BY 
    CASE orderUserListDesc WHEN 0 THEN ud.uid END ASC,
    CASE orderUserListDesc WHEN 1 THEN ud.uid END DESC
    LIMIT userLimit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_getAccUserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_getAccUserInfo`(in chanId int)
BEGIN

declare uemailId text;

if exists(select * from channel where channelid=chanId)Then
   select contactmail from channel where channelid=chanId into uemailId;
   select * from  admininvites where verified=1 and emailId=uemailId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetAPICategoryDetailsV1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetAPICategoryDetailsV1`(in chanId int, IN globalChannelId INT)
BEGIN

SELECT *, IF(channel_id = globalChannelId and chanId != globalChannelId, 1, 0) isGlobal
FROM api_category ac
join api_sub_category sc on sc.category_id=ac.api_category_id and sc.isDeleted =0 where ac.isDeleted = 0 and (channel_id=chanId or channel_id= globalChannelId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetAPICategoryDetails_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetAPICategoryDetails_v3`(in chanId int, IN globalChannelId INT,IN catList Text)
BEGIN
SELECT 	*,
	IF(channel_id = globalChannelId and chanId != globalChannelId, 1, 0) isGlobal
FROM
	api_category ac
JOIN
	api_sub_category sc
ON
	sc.category_id = ac.api_category_id
AND
	sc.isDeleted = 0
WHERE
	ac.isDeleted = 0
	AND
		(channel_id=chanId OR
			(channel_id = globalChannelId AND isCatPublic = 1 AND isSubCatPublic = 1))
	AND FIND_IN_SET(sc.sub_category_id,catList);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetBetaUsersEnv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetBetaUsersEnv`(in chanId INT,in groupIds Text,in pluginId INT,in pageOffset int, in returnSize int,in searchTxt text, in stype Text )
BEGIN
select
ud.uid,
ui.uname ,
ui.uemail,
pau.environment as environment
from userdetails ud
join userinfo ui on ud.userid=ui.userid
left join uidgid ug on ug.uid=ud.uid
left join mapviewgrp mvg on ug.gid=mvg.gid
left join usergroup ugp on ugp.gid=ug.gid
left join plugin_app_environment_users pau on pau.uid=ud.uid and plugin_id=pluginId and pau.environment='beta'
where ud.channelid=chanId and ud.is_active=1 and pau.environment = "beta"
and (''= groupIds OR FIND_IN_SET(ug.gid, groupIds))
and ('' = searchTxt OR ui.uname LIKE CONCAT('%', searchTxt, '%') or ui.uemail LIKE CONCAT('%', searchTxt, '%'))
group by ud.uid
LIMIT returnSize
OFFSET pageOffset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetCategoryListAsPerTemplate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetCategoryListAsPerTemplate`(IN templateId INT, IN chanId INT)
BEGIN

DECLARE mstr BOOL;

DROP TEMPORARY TABLE IF EXISTS temp_catListingtemp;
CREATE TEMPORARY TABLE temp_catListingtemp
  (tcatId int, tcatName varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
  tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool, tIsActive INT, tisHidden int, ttid int, tcatTileImg varchar(200),
  tdisplayName varchar(100), tPluginId INT, tfAppCount INT) engine = memory;

SELECT ismaster FROM categorytemplate where viewid = templateId and channelId = chanId INTO mstr;

IF EXISTS (SELECT * FROM category WHERE channelid = chanId) THEN

  INSERT INTO temp_catListingtemp (tcatId, tcatName, tcatImg, tcatDisplayIndex, tdiff,tsubDiff, tsearchable, tIsActive, tisHidden, tcatTileImg, tdisplayName, tPluginId)
  SELECT c.catid, 
         c.catname, 
         c.grid_xhdpi,
         c.indexing,
         'c',
		 'CMS',
         c.searchable,
		 c.is_active,
		 c.is_hidden,
         c.tile_mdpi,
         mp.display_name,
         0
  FROM   mapviewcat mp 
         JOIN category c 
           ON mp.catid = c.catid 
         JOIN categorytemplate ct 
           ON mp.viewid = ct.viewid 
  WHERE  c.channelid = chanId
         AND mp.`type` = 'c' 
         AND mp.viewid = templateId; 

END IF;

IF EXISTS (SELECT * FROM actionbutton WHERE channelid = chanId) THEN

  INSERT INTO temp_catListingtemp (tcatId, tcatName, tcatImg, tcatDisplayIndex, tdiff, tsubDiff, tsearchable,tIsActive, tisHidden, tcatTileImg, tdisplayName, tPluginId, tfAppCount)

	SELECT a.abid, 
	a.title,
	a.grid_xhdpi, 
	a.dispindex, 
	mp.`type`, 
	COALESCE(pa.plugin_type, 'DRU'), 
	a.searchable,
	a.is_active,
	CASE COALESCE(pa.plugin_type, 'DRU') /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
	  WHEN 'DRU' THEN a.is_hidden
	  ELSE ifnull(pas.is_hidden, 0)
	END as 'is_hidden',
	a.tile_mdpi,
	mp.display_name, 
	COALESCE(ptm.plugin_id, 0),
   (select count(*) from folderstructure where actionid =  a.abid)
    FROM mapviewcat mp 
      JOIN actionbutton a ON mp.catid = a.abid 
      LEFT JOIN plugin_template_map ptm 
		ON ptm.ab_id = a.abid
      LEFT JOIN plugin_app pa
		ON ptm.plugin_id = pa.plugin_id
      LEFT JOIN plugin_app_setting pas
		ON pa.plugin_id = pas.plugin_id
    WHERE 
       a.channelid = chanId
      AND (mp.`type` = 'a' OR mp.`type` = 'f')
      AND mp.viewid = templateId;
END IF;

SELECT * FROM temp_catListingtemp order by tcatDisplayIndex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetCouchdbDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetCouchdbDetails`(in chanId int)
BEGIN

DECLARE token_key TEXT;
SELECT tokenkey FROM plugin_token where token_type = "G" AND channelid = chanId INTO token_key;
select channel_id, server_endpoint, database_name, created_at, couchdb_token, is_active, is_onprime, couchdb_secretkey, token_key from couchdb_data where channel_id=chanId;

-- select channel_id, server_endpoint, database_name, created_at, couchdb_token, is_active, is_onprime, couchdb_secretkey from couchdb_data where channel_id=chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_getFolderApps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_getFolderApps`(IN folderId Int, IN chanId INT,IN urId INT)
BEGIN
DECLARE mstr BOOL;
 DECLARE total_apps INT DEFAULT 0;
 DROP TEMPORARY TABLE IF EXISTS temp_fcatList;
 CREATE TEMPORARY TABLE temp_fcatList
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tMyFavItIs INT,
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20),
   owner_email VARCHAR(250), app_access VARCHAR(1));
 
 
 
    
 INSERT INTO temp_fcatList (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
                            version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,app_access )        
        SELECT abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, `expiry_date`, folder_assign_to, folder_assign_id, is_ab,
                            `version`, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,
               (CASE 
                 WHEN owner_allowed IS NOT NULL THEN (
                   CASE
                   WHEN owner_allowed = 0 then 'w'
                  WHEN owner_allowed = 1 then 'w'
                  WHEN owner_allowed = 2 then 'w'
                  WHEN owner_allowed = 3 then 'o'
                  END
                 ) ELSE (                   
                   CASE
                   WHEN all_users_allowed = 0 then 'w'
                  WHEN all_users_allowed = 1 then 'w'
                  WHEN all_users_allowed = 2 then 'w'
                  END
                 )
                 END             
               ) AS app_access
FROM (
    SELECT 
    DISTINCT
    a.abid as abid,
    CASE COALESCE(pa.plugin_type, 'DRU')
      WHEN 'DRU' THEN a.title
      ELSE pa.plugin_name
    END as 'tcatName',
    pa.plugin_desc as tcatDesc,
    a.grid_xhdpi as tcatImg,
    a.dispindex as tcatDisplayIndex,
    'a' as tdiff, 
    COALESCE(pa.plugin_type, 'DRU') as tsubDiff, 
    CASE COALESCE(pa.plugin_type, 'DRU') 
      WHEN 'DRU' THEN a.is_hidden
      ELSE ifnull(pas.is_hidden, 0)
    END as 'tisHidden',
    a.tile_mdpi as tcatTileImg,
    COALESCE(ufi.uid, 0) as tMyFavItIs,
    '' as tdisplayName,
    COALESCE(ptm.plugin_id, 0) as pluginId,
    0 as tfAppCount,
    '' as templateName,
    a.modify_date as modified_date,
    pa.expiry_date as `expiry_date`,
    a.title as folder_assign_to,
    f.actionId as folder_assign_id,
    1 as is_ab,
    pav.version_code as `version`,
   '' as last_accessed,
    0 as total_accessed_time,
    0 as users_accessedcontent_count,
    0 as avg_accessed_time,
    ifnull(pa.plugin_install_type,'Deprecated') as plugin_install_type, 
    0 as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    CASE pa.is_draft 
      WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
      ELSE fn_getAppStatus(a.is_active,a.searchable)
    END as 'tappStatus',
    ui.uemail as owner_email,
    MIN(IF(pa.owner_uid=urId, 3, IF(pap.uid=urId, 2, NULL))) AS owner_allowed,
    MIN(IF(pap.uid IS NULL OR pap.uid=0, 2, 2)) AS all_users_allowed
    
FROM actionbutton a 
    JOIN folderstructure f on f.mapid=a.abid
    LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid
  	LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id AND pa.is_active = 1
   
  	LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid AND uri.icon_type = 'a'
    LEFT JOIN plugin_app_rating par ON pa.plugin_id = par.plugin_id
    LEFT JOIN plugin_app_rating par1 ON pa.plugin_id = par1.plugin_id AND par1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
     
    LEFT JOIN userdetails ud on ud.channelid = chanId AND pa.owner_uid = ud.uid
    LEFT JOIN userinfo ui on ui.userid = ud.userid
    LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
    AND (
    CASE WHEN 1<>1 THEN pap.uid IN (0, urId)
    ELSE 0=0 END
    )
     WHERE 
       a.channelid = chanId
      AND a.is_active=1
      AND f.catType='a'
      AND f.actionId=folderId
      GROUP BY a.abid
     
    HAVING (
    CASE WHEN 1 <> 1 THEN (IF(owner_allowed IS NOT NULL, owner_allowed<>0, all_users_allowed<>0))
    ELSE 0=0 END
    )
) tempAfterPermissionFiltering;
    

SELECT *,total_apps FROM temp_fcatList ORDER BY  tcatDisplayIndex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_getPluginLatestVersion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_getPluginLatestVersion`(IN pluginId INT, IN chanId INT)
BEGIN

IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN

  select version_code from plugin_app_version where plugin_id = pluginId order by PLUGIN_VER_ID desc;
  
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_getPluginUrl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_getPluginUrl`(IN pluginId INT,IN chanId INT)
BEGIN
DECLARE pluginWebUrl TEXT;
  SELECT plugin_web_url FROM plugin_app_version WHERE plugin_ver_id = (SELECT latest_version FROM plugin_app WHERE plugin_id = pluginId) INTO pluginWebUrl;
  select plugin_url,pluginWebUrl from plugin_app where plugin_id=pluginId and channelid=chanId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetSaasCurrentLicenseDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetSaasCurrentLicenseDetails`(IN chanName TEXT)
BEGIN
DECLARE chanId, licDuration, licUser, userCount INT;
DECLARE planType, channelMail TEXT;
DECLARE licStart, licRecurrDate,createdDate DATETIME;
DECLARE licSpace DOUBLE;
DECLARE cmpnyName,contactMail TEXT;
DECLARE catUsedCount, catAllowedCount,isTrial INT DEFAULT 0;
DECLARE plnType,paymentMode TEXT DEFAULT '';

SET planType = '';

SELECT channelid,display_name FROM channel WHERE channelname = chanName INTO chanId,cmpnyName;
SELECT contactemail FROM channelowner WHERE channelid = chanId INTO contactMail;
SELECT COUNT(viewid) FROM categorytemplate WHERE channelId = chanId INTO catUsedCount;
SELECT COALESCE(template_count, 0) FROM lic_channel_limit WHERE channelId = chanId INTO catAllowedCount;

IF EXISTS (SELECT * FROM saaslicense WHERE channelid = chanId) THEN
	SELECT planname, DCR(noitarud), DCR(tratsfoetad), DCR(tnuocresu), DCR(ecapsksid), DCR(etadrrucer)
    FROM saaslicense WHERE channelid = chanId
    INTO planType, licDuration, licStart, licUser, licSpace,  licRecurrDate;

	SELECT COUNT(uid) FROM userdetails WHERE channelid = chanId and is_active=1  INTO userCount;
    
    IF EXISTS(select * from  saasplan where channelid = chanId)then
		select plan_type, payment_mode, is_trial, created_date from  saasplan where channelid = chanId INTO plnType,paymentMode,isTrial,createdDate;
    END IF;

	SELECT planType, licDuration, licStart, licUser, licSpace, userCount,  licRecurrDate,cmpnyName,catUsedCount,catAllowedCount,contactMail,plnType,paymentMode,isTrial,createdDate;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `V7_GetSaaSLicenseDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `V7_GetSaaSLicenseDetails`(IN chanName TEXT)
BEGIN

DECLARE chanId, licDuration, licUser, licDelivery, licPush, licBcm, licCateg, userCount, deliveryCount, pushCnt, bcmCount, categCount INT;
DECLARE planType, channelMail TEXT;
DECLARE licStart, licRecurrDate DATETIME;
DECLARE licSpace DOUBLE;
DECLARE graceDur INT;
DECLARE finStat VARCHAR(5);

SET planType = '';
SET deliveryCount =0;
SET pushCnt = 0;
SET bcmCount = 0;
SET userCount=0;

SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;
SELECT contactmail FROM channel WHERE channelid = chanId INTO channelMail;

IF EXISTS (SELECT * FROM saaslicense WHERE channelid = chanId) THEN
	SELECT planname, DCR(noitarud), DCR(tratsfoetad), DCR(tnuocresu), DCR(tnuocyreviled),
	  DCR(ecapsksid), DCR(tnuochsup), DCR(etadrrucer), DCR(tnuocmcb), DCR(tnuocgetac),
	  grace_duration, fin_status
  FROM saaslicense WHERE channelid = chanId
  INTO planType, licDuration, licStart, licUser, licDelivery, licSpace, licPush, licRecurrDate, licBcm, licCateg,
    graceDur, finStat;

	
	IF EXISTS (SELECT * FROM content WHERE channelid = chanId) THEN
		SELECT SUM(deliveries) FROM content WHERE channelid = chanId INTO deliveryCount;
	END IF;
	
	SELECT pushCount FROM licensecounter WHERE channelid = chanId INTO pushCnt;
	SELECT broadcastCount FROM licensecounter WHERE channelid = chanId INTO bcmCount;
	SELECT COUNT(catId) FROM category WHERE channelid = chanId INTO categCount;

   SELECT COUNT(uid) FROM userdetails WHERE channelid = chanId and is_active=1 INTO userCount;

	SELECT planType, licDuration, licStart, licUser, licDelivery, licSpace, licPush,
	  channelMail, userCount, deliveryCount, pushCnt, licRecurrDate, licBcm, licCateg,
	  bcmCount, categCount, graceDur, finStat;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_GetUsersEnv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_GetUsersEnv`(in chanId INT,in groupIds Text,in pluginId INT,in pageOffset int, in returnSize int,in searchTxt text, in stype Text )
BEGIN
select 
ud.uid,
ui.uname ,
ui.uemail,
GROUP_CONCAT(COALESCE(pau.environment,''))as environment
 from userdetails ud
 join userinfo ui on ud.userid=ui.userid
 left join uidgid ug on ug.uid=ud.uid
 left join mapviewgrp mvg on ug.gid=mvg.gid
 left join usergroup ugp on ugp.gid=ug.gid
  left join plugin_app_environment_users pau on pau.uid=ud.uid and plugin_id=pluginId
 where ud.channelid=chanId and ud.is_active=1
 and (''= groupIds OR FIND_IN_SET(ug.gid, groupIds))
 and ('' = searchTxt OR ui.uname LIKE CONCAT('%', searchTxt, '%') or ui.uemail LIKE CONCAT('%', searchTxt, '%'))
 group by ud.uid
 LIMIT returnSize
 OFFSET pageOffset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_get_embedbuilderByPluginId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_get_embedbuilderByPluginId`(IN pluginId INT)
BEGIN

		select * from formbuilder_embed where plugin_id=pluginId;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_get_embedbuilderV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_get_embedbuilderV2`(in emdCode Text)
BEGIN
SELECT pa.plugin_id,pa.plugin_name,pav.plugin_web_url, fe.channel_id,ui.uname, ui.uemail,ud.uid,ui.uimageurl, fe.created_date, 
    fe.ready_only, fe.is_disable, fe.frdname, fe.emdfavicom, fe.emdtitle, fe.emddecscription, fe.emdshortdescription,
    IFNULL(cs.is_subdo_brand,1) as is_subdo_brand, IFNULL(cs.subdo_name,'') as subdo_name, is_private, fe.pwa_manifest
FROM formbuilder_embed fe
join plugin_app pa  on pa.plugin_id=fe.plugin_id
join plugin_app_version pav on pav.plugin_ver_id=pa.latest_version
join userinfo  ui on ui.uemail=fe.created_by
join userdetails ud on ud.userid =ui.userid and ud.channelid=fe.channel_id
left join channelsubdomain cs on cs.channelid=fe.channel_id
Where (fe.embedcode=emdCode or fe.frdname=emdCode) and (fe.is_disable=0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_CreateAppVersionV2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_CreateAppVersionV2`(IN pluginId INT, IN usrid INT, IN pluginVerCode VARCHAR(15), IN pluginUrl VARCHAR(145),
  IN pluginVerWhatsNew VARCHAR(1055), IN pluginWebUrl VARCHAR(145), IN allowWebAccess BOOL, IN pluginUpdateType CHAR(5),
  IN packageSize BIGINT(20), IN packageChecksum VARCHAR(145), IN chanId INT, IN downloadUrlNA TEXT, 
  IN ulinkAppPrefix TEXT, IN ulinkBundleId TEXT, IN ulinkDomainName TEXT, IN ulinkRelativeUrl TEXT, IN environment VARCHAR(45),ulinkUniqueKey VARCHAR(50), IN uRegKey VARCHAR(250), IN uRegLoc VARCHAR(250), IN uAndroidPackage VARCHAR(145))
BEGIN
 DECLARE pluginVerId INT DEFAULT 0;
  DECLARE naDeepLinkUniqueKey TEXT;
  DECLARE abId INT DEFAULT 0;

  /* DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
  
  START TRANSACTION; */

  IF EXISTS (SELECT 1 FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId LIMIT 1) THEN
    -- Insert into plugin_app_version
    SELECT ab_id FROM plugin_template_map WHERE plugin_id = pluginId LIMIT 1 INTO abId;
    INSERT INTO plugin_app_version (plugin_id, version_code, whats_new, update_on, plugin_url, plugin_web_url, update_type, package_size, web_access,
        package_checksum, download_url_na,environment,updated_by)
    VALUES (pluginId, pluginVerCode, pluginVerWhatsNew, NOW(), pluginUrl, pluginWebUrl, pluginUpdateType, packageSize, allowWebAccess,
      packageChecksum, downloadUrlNA,environment,usrid);
    -- Update plugin_app
    SELECT LAST_INSERT_ID() INTO pluginVerId;
      -- Update the plugin_app entry with latest version.
      IF(environment='prod') THEN
        UPDATE plugin_app SET latest_version = pluginVerId, plugin_url = pluginUrl, plugin_modified_date = NOW() WHERE plugin_id = pluginId LIMIT 1;
        UPDATE plugin_app_setting SET allow_web_access=1,on_web_browser=1  WHERE plugin_id = pluginId LIMIT 1;
        UPDATE actionbutton
        SET modify_date = NOW(), url = pluginUrl
         WHERE abid = abId LIMIT 1;
      ELSE IF(environment='beta') THEN
        UPDATE plugin_app SET plugin_modified_date = NOW(), beta_version = pluginVerId WHERE plugin_id = pluginId LIMIT 1;
      ELSE 
        UPDATE plugin_app SET plugin_modified_date = NOW(),dev_version = pluginVerId WHERE plugin_id = pluginId LIMIT 1;
      END IF;
      END IF;
      IF EXISTS(SELECT 1 FROM plugin_user_beta WHERE plugin_id = pluginId LIMIT 1)THEN
        -- delete beta users tagged to previous version
        DELETE FROM plugin_user_beta WHERE plugin_id = pluginId LIMIT 1;
      END IF;
    -- Update actionbutton
     UPDATE actionbutton
       SET modify_date = NOW()
      WHERE abid = abId LIMIT 1;
    

    IF EXISTS (SELECT 1 FROM plugin_app_universal_link WHERE plugin_id = pluginId LIMIT 1) THEN
    select '' into naDeepLinkUniqueKey;
    -- SELECT unique_key FROM plugin_app_universal_link WHERE plugin_id = pluginId INTO naDeepLinkUniqueKey;
    UPDATE plugin_app_universal_link
    SET app_prefix = ulinkAppPrefix, win_registry_key = uRegKey , win_registry_location = uRegLoc, android_package_name = uAndroidPackage, bundle_id = ulinkBundleId, absolute_url = ulinkDomainName, relative_url = CONCAT(ulinkRelativeUrl, naDeepLinkUniqueKey),unique_key=ulinkUniqueKey
    WHERE plugin_id = pluginId LIMIT 1;
    
    ELSE
    select '' into naDeepLinkUniqueKey;
    INSERT INTO plugin_app_universal_link (plugin_id,app_prefix, bundle_id, absolute_url, relative_url,unique_key, win_registry_key, win_registry_location, android_package_name)
    VALUES (pluginId,ulinkAppPrefix, ulinkBundleId, ulinkDomainName, CONCAT(ulinkRelativeUrl, naDeepLinkUniqueKey),ulinkUniqueKey,uRegKey,uRegLoc,uAndroidPackage);
    
    END IF;

  END IF;
  -- COMMIT;

  SELECT pluginVerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_CreatePluginApp_v5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_CreatePluginApp_v5`(IN appName VARCHAR(145), IN appDesc VARCHAR(245), IN appType CHAR(25),
                                            IN appIconXHDPI VARCHAR(145), IN appIconHDPI VARCHAR(145), IN appIconMDPI VARCHAR(145), 
                                            IN appIconLDPI VARCHAR(145),IN pluginToken VARCHAR(150), IN tokenType CHAR(5),IN chanId INT,IN isAppDraft BOOL,IN templateId INT,IN ownerUid INT)
BEGIN

DECLARE pluginId, tokenId INT DEFAULT 0;
DECLARE pluginVerId INT DEFAULT 0;
DECLARE chanName TEXT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

  START TRANSACTION;

    SELECT channelname FROM channel WHERE channelid = chanId INTO chanName;

    IF NOT EXISTS (SELECT * FROM plugin_token WHERE tokenkey = pluginToken) THEN
      -- Create Plugin
      INSERT INTO plugin_app (plugin_name, plugin_desc, plugin_type, plugin_url, plugin_icon_url_xhdpi, channelid, plugin_modified_date,
        plugin_icon_url_hdpi,plugin_icon_url_mdpi,plugin_icon_url_ldpi, latest_version, plugin_theme_color, plugin_statusbar, 
        plugin_statusbar_bgcolor, plugin_statusbar_style, plugin_hide_close_btn, plugin_install_type,is_draft, admin_url,build_by, owner_uid)
      VALUES (appName, appDesc, appType, "", appIconXHDPI, chanId, NOW(), appIconHDPI, appIconMDPI, appIconLDPI, 0,
        "444444", 1, "F5F5F5", "DARK", 0, "OPT", isAppDraft, "","S",ownerUid);
      
      SELECT LAST_INSERT_ID() INTO pluginId;

      -- insert plugin settings
      INSERT INTO plugin_app_setting(plugin_id, channelid, plugin_allow_text_copy, plugin_allow_screen_shot,
        support_email, support_phone, is_hidden,on_web_browser,allow_web_access)
      VALUES(pluginId, chanId, 1, 1, "", "", 0,0,0);
    
      -- Create token
      INSERT INTO plugin_token (channelid, tokenkey, token_type, plugin_id)
      VALUES (chanId, pluginToken, tokenType, pluginId);
      
      SELECT LAST_INSERT_ID() INTO tokenId;
      
      IF(templateId > 0 )THEN
       IF NOT EXISTS(SELECT * FROM plugin_template_map WHERE plugin_id = pluginId)THEN
		   
		   IF(appType='RU')THEN
		    SET appType='webview';
		   ELSE IF(appType='ZP')THEN
		        SET appType='localview';
		   ELSE IF(appType='NA')THEN
		         SET appType='nativeview';
		   END IF;
		   END IF;
		   END IF;
		 
		  CALL diy_CreateActionButton(appName, appType, '', chanName,
			appIconXHDPI, appIconHDPI, appIconMDPI, appIconLDPI,
			appIconXHDPI, appIconHDPI, appIconMDPI, appIconLDPI,
			templateId, @actionButtonId);
			-- create new mapping template-plugin
			INSERT INTO plugin_template_map (plugin_id, template_id, ab_id) 
			VALUES (pluginId, templateId, @actionButtonId);
       END IF;
      END IF;
    ELSE
      SET pluginId = -2; -- Duplicate token
    END IF;
  COMMIT;
  
  SELECT pluginId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_GetAppDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_GetAppDetails`(IN pluginId INT, IN chanId INT)
BEGIN
  SELECT * FROM plugin_app pa
  left JOIN plugin_app_version pav
		ON  pa.latest_version=pav.plugin_ver_id
  WHERE pa.plugin_id = pluginId AND pa.channelid = chanId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_GetAppDetails_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_GetAppDetails_v2`(IN pluginId INT, IN chanId INT)
BEGIN
    SELECT pa.*,pav.*, ui.uemail 'owner_email' FROM plugin_app pa
    left JOIN plugin_app_version pav
    ON  pa.latest_version=pav.plugin_ver_id
	LEFT JOIN userdetails ud on ud.uid=pa.owner_uid and ud.channelid = pa.channelid
	LEFT JOIN userinfo ui on ud.userid=ui.userid
    WHERE pa.plugin_id = pluginId AND pa.channelid = chanId;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_getAppsSorted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_getAppsSorted`(IN chanId INT,IN templateIds TEXT, IN searchTxt TEXT, IN appActive INT,IN filterByAppType TEXT,IN isAppDraft INT,IN hiddenApp INT, IN pageOffset INT, IN returnSize INT, IN appStatus VARCHAR(20))
BEGIN
 DECLARE mstr BOOL;
 DECLARE total_apps INT DEFAULT 0;
 DROP TEMPORARY TABLE IF EXISTS temp_catListing;
 CREATE TEMPORARY TABLE temp_catListing
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20)) engine = memory;
 
 -- SELECT ismaster FROM categorytemplate where viewid = templateId and channelId = chanId INTO mstr;
 
 IF EXISTS (SELECT 1 FROM category WHERE channelid = chanId LIMIT 1) THEN
 
   INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff,tsubDiff, tisHidden, tcatTileImg, tdisplayName, pluginId, templateName, modified_date, expiry_date, is_ab, tappStatus)
   SELECT c.catid,
          c.catname,
 	        c.catDescp,
          c.grid_xhdpi,
          c.indexing,
          'c',
 		      'CMS',
 		      c.is_hidden,
          c.tile_mdpi,
          mp.display_name,
          0,
 		      ct.viewname,
 		      c.modify_date,
 		     '',
 		      1,
 		      fn_getAppStatus(c.is_active,c.searchable)
   FROM   mapviewcat mp 
          JOIN category c 
            ON mp.catid = c.catid 
          JOIN categorytemplate ct 
            ON mp.viewid = ct.viewid 
           
   WHERE  c.channelid = chanId
          AND mp.`type` = 'c'
          AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
 		 AND ('' = searchTxt OR c.catname LIKE CONCAT('%', searchTxt, '%') or c.catDescp LIKE CONCAT('%', searchTxt, '%'));
 
 END IF;
 
-- IF EXISTS (SELECT 1 FROM actionbutton WHERE channelid = chanId limit 1) THEN
 	
 	/* select mapviewcat apps that will include 1: weblink , 2: apps assigned to template */
     
 INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
 							tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
 							version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus )
 	SELECT 
 	a.abid,
 	CASE COALESCE(pa.plugin_type, 'DRU')
 	  WHEN 'DRU' THEN a.title
 	  ELSE pa.plugin_name
 	END as 'title',
  pa.plugin_desc,
 	a.grid_xhdpi, 
 	a.dispindex,
 	mp.`type`, 
 	COALESCE(pa.plugin_type, 'DRU'), -- if null then it is old link then assign DRU D - deprecated
 	CASE COALESCE(pa.plugin_type, 'DRU') /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
 	  WHEN 'DRU' THEN a.is_hidden
 	  ELSE ifnull(pas.is_hidden, 0)
 	END as 'is_hidden',
 	a.tile_mdpi,
 	mp.display_name, 
 	COALESCE(ptm.plugin_id, 0),
    (select count(*) from folderstructure where actionid =  a.abid),
 	ct.viewname,
 	a.modify_date,
 	pa.expiry_date,
 	fab.title,
 	fs.actionId,
 	1,
 	pav.version_code as version,
   '',--  MAX(cah.accessedon) as last_accessed,
    0,-- COALESCE(SUM(cah.accessedtime),0) as total_accessed_time,
    0,-- COALESCE(COUNT(cah.uid),0) as users_accessedcontent_count,
    0,-- ROUND(COALESCE(SUM(cah.accessedtime)/COUNT(cah.uid),0),2) as avg_accessed_time,
 	ifnull(pa.plugin_install_type,'Deprecated'), -- if null then it is old link then assign DRU D - deprecated
 0,-- 	ifnull(COUNT(ug.uid),0) as user_count,
 	FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
 	CASE pa.is_draft /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
 	  WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
 	  ELSE fn_getAppStatus(a.is_active,a.searchable)
 	END as 'status'
    -- fn_getAppStatus(a.is_active,a.searchable)
     FROM mapviewcat mp 
      left JOIN actionbutton a ON mp.catid = a.abid 
       LEFT JOIN plugin_template_map ptm 
 		ON ptm.ab_id = a.abid
 	  LEFT JOIN categorytemplate ct
 		 ON mp.viewid = ct.viewid
       LEFT JOIN plugin_app pa
 		ON ptm.plugin_id = pa.plugin_id
       LEFT JOIN plugin_app_setting pas
 		ON pa.plugin_id = pas.plugin_id
 
 	  LEFT JOIN user_rating_icon uri
 		ON uri.icon_id = a.abid AND uri.icon_type = 'a'
 	  LEFT JOIN mapviewgrp mvg
 		ON ptm.template_id=mvg.viewid
 	  -- LEFT JOIN uidgid ug	ON ug.gid=mvg.gid
 	  LEFT JOIN plugin_app_version pav
 		ON pa.latest_version=pav.plugin_ver_id
 	  -- LEFT JOIN userdetails ud ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
 	--  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
 
 	  LEFT JOIN folderstructure fs
 		ON a.abid = fs.mapid
 	  LEFT JOIN actionbutton fab
 		ON fab.abid = fs.actionid
     WHERE 
       a.channelid = chanId AND pa.is_active=1
       AND (mp.`type` = 'a')
       AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
 	  AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or a.title LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
 	--  GROUP BY mp.catId;
   GROUP BY pa.plugin_id;
 
 	/* SELECT PLugins in channel which are not assigned to template */
 	
 	IF(templateIds = '0') THEN
 		INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
 							tfAppCount, templateName, modified_date, expiry_date, folder_assign_to,folder_assign_id, is_ab,
 							version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating, tappStatus)
 		SELECT 
 		COALESCE(a.abid, 0), 
 		pa.plugin_name,
         pa.plugin_desc,
 		pa.plugin_icon_url_xhdpi, 
 		a.dispindex, 
 		mp.`type`, 
 		pa.plugin_type,
 		pas.is_hidden,
 		a.tile_mdpi,
 		mp.display_name, 
 		COALESCE(pa.plugin_id, 0),
 	   (select count(*) from folderstructure where actionid =  a.abid),
 		ct.viewname,
 		pa.plugin_modified_date,
 		pa.expiry_date,
 		null,
 		0,
 		0,
 		pav.version_code as version,
   '',--  MAX(cah.accessedon) as last_accessed,
   0,--  COALESCE(SUM(cah.accessedtime),0) as total_accessed_time,
   0,  -- COALESCE(COUNT(cah.uid),0) as users_accessedcontent_count,
    0,-- ROUND(COALESCE(SUM(cah.accessedtime)/COUNT(cah.uid),0),2) as avg_accessed_time,
 	pa.plugin_install_type,
0, -- 	ifnull(COUNT(ug.uid),0) as user_count,
 	FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
 	
 fn_getAppStatus(pa.is_active,0)
 	FROM plugin_app pa
 		   LEFT JOIN plugin_template_map ptm 
 			ON pa.plugin_id = ptm.plugin_id
 		   LEFT JOIN categorytemplate ct
 			 ON ptm.template_id = ct.viewid
 		   LEFT JOIN actionbutton a
 			ON a.abid = ptm.ab_id
 		   LEFT JOIN mapviewcat mp
 			ON a.abid = mp.catid
 		  LEFT JOIN plugin_app_setting pas
 			ON pa.plugin_id = pas.plugin_id
 		
 		  LEFT JOIN user_rating_icon uri
 				ON uri.icon_id = ptm.ab_id AND uri.icon_type = 'a'
 		  LEFT JOIN mapviewgrp mvg
 			ON ptm.template_id=mvg.viewid
 		 -- LEFT JOIN uidgid ug 	ON ug.gid=mvg.gid
 		  LEFT JOIN plugin_app_version pav
 			ON pa.latest_version=pav.plugin_ver_id
 		  -- LEFT JOIN userdetails ud 	ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
 		 --  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
 		WHERE 
 		   pa.channelid = chanId AND pa.is_active=1
 		  AND ptm.template_id IS NULL
 		  AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
 		GROUP BY pa.plugin_id;
 
 	--  END IF;
 END IF;
 SELECT COUNT(1) FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
 		INTO total_apps;
 
 
 IF(returnSize = 0) THEN
 	SELECT *, total_apps FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) order by abid ;
 	-- 	ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc;
 ELSE
 	SELECT  *, total_apps FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
 		order by abid
 	-- 	ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc
    LIMIT returnSize
    OFFSET pageOffset;
 END IF;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_getAppsSortedCustom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_getAppsSortedCustom`(IN chanId INT,IN templateIds TEXT, IN searchTxt TEXT, IN appActive INT,IN filterByAppType TEXT,IN isAppDraft INT,IN hiddenApp INT, IN pageOffset INT, IN returnSize INT, IN appStatus VARCHAR(20))
BEGIN
 DECLARE mstr BOOL;
 DECLARE total_apps INT DEFAULT 0;
 DROP TEMPORARY TABLE IF EXISTS temp_catListing;
 CREATE TEMPORARY TABLE temp_catListing
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20),
   owner_email VARCHAR(250), app_access VARCHAR(1)) engine = memory;
 
 -- SELECT ismaster FROM categorytemplate where viewid = templateId and channelId = chanId INTO mstr;
 
 IF EXISTS (SELECT 1 FROM category WHERE channelid = chanId LIMIT 1) THEN
 
   INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff,tsubDiff, tisHidden, tcatTileImg, tdisplayName, pluginId, templateName, modified_date, expiry_date, is_ab, tappStatus)
   SELECT c.catid,
          c.catname,
 	        c.catDescp,
          c.grid_xhdpi,
          c.indexing,
          'c',
 		      'CMS',
 		      c.is_hidden,
          c.tile_mdpi,
          mp.display_name,
          0,
 		      ct.viewname,
 		      c.modify_date,
 		     '',
 		      1,
 		      fn_getAppStatus(c.is_active,c.searchable)
   FROM   mapviewcat mp 
          JOIN category c 
            ON mp.catid = c.catid 
          JOIN categorytemplate ct 
            ON mp.viewid = ct.viewid 
           
   WHERE  c.channelid = chanId
          AND mp.`type` = 'c'
          AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
 		 AND ('' = searchTxt OR c.catname LIKE CONCAT('%', searchTxt, '%') or c.catDescp LIKE CONCAT('%', searchTxt, '%'));
 
 END IF;
 
-- IF EXISTS (SELECT 1 FROM actionbutton WHERE channelid = chanId limit 1) THEN
 	
 	/* select mapviewcat apps that will include 1: weblink , 2: apps assigned to template */
     
 INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
 							tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
 							version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus )
 	SELECT 
 	a.abid,
 	CASE COALESCE(pa.plugin_type, 'DRU')
 	  WHEN 'DRU' THEN a.title
 	  ELSE pa.plugin_name
 	END as 'title',
  pa.plugin_desc,
 	a.grid_xhdpi, 
 	a.dispindex,
 	mp.`type`, 
 	COALESCE(pa.plugin_type, 'DRU'), -- if null then it is old link then assign DRU D - deprecated
 	CASE COALESCE(pa.plugin_type, 'DRU') /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
 	  WHEN 'DRU' THEN a.is_hidden
 	  ELSE ifnull(pas.is_hidden, 0)
 	END as 'is_hidden',
 	a.tile_mdpi,
 	mp.display_name, 
 	COALESCE(ptm.plugin_id, 0),
    (select count(*) from folderstructure where actionid =  a.abid),
 	ct.viewname,
 	a.modify_date,
 	pa.expiry_date,
 	fab.title,
 	fs.actionId,
 	1,
 	pav.version_code as version,
   '',--  MAX(cah.accessedon) as last_accessed,
    0,-- COALESCE(SUM(cah.accessedtime),0) as total_accessed_time,
    0,-- COALESCE(COUNT(cah.uid),0) as users_accessedcontent_count,
    0,-- ROUND(COALESCE(SUM(cah.accessedtime)/COUNT(cah.uid),0),2) as avg_accessed_time,
 	ifnull(pa.plugin_install_type,'Deprecated'), -- if null then it is old link then assign DRU D - deprecated
 0,-- 	ifnull(COUNT(ug.uid),0) as user_count,
 	FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
 	CASE pa.is_draft /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
 	  WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
 	  ELSE fn_getAppStatus(a.is_active,a.searchable)
 	END as 'status'
    -- fn_getAppStatus(a.is_active,a.searchable)
     FROM mapviewcat mp 
      left JOIN actionbutton a ON mp.catid = a.abid 
       LEFT JOIN plugin_template_map ptm 
 		ON ptm.ab_id = a.abid
 	  LEFT JOIN categorytemplate ct
 		 ON mp.viewid = ct.viewid
       LEFT JOIN plugin_app pa
 		ON ptm.plugin_id = pa.plugin_id
       LEFT JOIN plugin_app_setting pas
 		ON pa.plugin_id = pas.plugin_id
 
 	  LEFT JOIN user_rating_icon uri
 		ON uri.icon_id = a.abid AND uri.icon_type = 'a'
 	  LEFT JOIN mapviewgrp mvg
 		ON ptm.template_id=mvg.viewid
 	  -- LEFT JOIN uidgid ug	ON ug.gid=mvg.gid
 	  LEFT JOIN plugin_app_version pav
 		ON pa.latest_version=pav.plugin_ver_id
 	  -- LEFT JOIN userdetails ud ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
 	--  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
 
 	  LEFT JOIN folderstructure fs
 		ON a.abid = fs.mapid
 	  LEFT JOIN actionbutton fab
 		ON fab.abid = fs.actionid
     WHERE 
       a.channelid = chanId AND pa.is_active=1 and pa.build_by='S'
       AND (mp.`type` = 'a')
       AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
 	  AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or a.title LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
 	--  GROUP BY mp.catId;
   GROUP BY pa.plugin_id;
 
 	/* SELECT PLugins in channel which are not assigned to template */
 	
 	IF(templateIds = '0') THEN
 		INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
 							tfAppCount, templateName, modified_date, expiry_date, folder_assign_to,folder_assign_id, is_ab,
 							version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating, tappStatus)
 		SELECT 
 		COALESCE(a.abid, 0), 
 		pa.plugin_name,
         pa.plugin_desc,
 		pa.plugin_icon_url_xhdpi, 
 		a.dispindex, 
 		mp.`type`, 
 		pa.plugin_type,
 		pas.is_hidden,
 		a.tile_mdpi,
 		mp.display_name, 
 		COALESCE(pa.plugin_id, 0),
 	   (select count(*) from folderstructure where actionid =  a.abid),
 		ct.viewname,
 		pa.plugin_modified_date,
 		pa.expiry_date,
 		null,
 		0,
 		0,
 		pav.version_code as version,
   '',--  MAX(cah.accessedon) as last_accessed,
   0,--  COALESCE(SUM(cah.accessedtime),0) as total_accessed_time,
   0,  -- COALESCE(COUNT(cah.uid),0) as users_accessedcontent_count,
    0,-- ROUND(COALESCE(SUM(cah.accessedtime)/COUNT(cah.uid),0),2) as avg_accessed_time,
 	pa.plugin_install_type,
0, -- 	ifnull(COUNT(ug.uid),0) as user_count,
 	FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
 	
 fn_getAppStatus(pa.is_active,0)
 	FROM plugin_app pa
 		   LEFT JOIN plugin_template_map ptm 
 			ON pa.plugin_id = ptm.plugin_id
 		   LEFT JOIN categorytemplate ct
 			 ON ptm.template_id = ct.viewid
 		   LEFT JOIN actionbutton a
 			ON a.abid = ptm.ab_id
 		   LEFT JOIN mapviewcat mp
 			ON a.abid = mp.catid
 		  LEFT JOIN plugin_app_setting pas
 			ON pa.plugin_id = pas.plugin_id
 		
 		  LEFT JOIN user_rating_icon uri
 				ON uri.icon_id = ptm.ab_id AND uri.icon_type = 'a'
 		  LEFT JOIN mapviewgrp mvg
 			ON ptm.template_id=mvg.viewid
 		 -- LEFT JOIN uidgid ug 	ON ug.gid=mvg.gid
 		  LEFT JOIN plugin_app_version pav
 			ON pa.latest_version=pav.plugin_ver_id
 		  -- LEFT JOIN userdetails ud 	ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
 		 --  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
 		WHERE 
 		   pa.channelid = chanId AND pa.is_active=1 and pa.build_by='S'
 		  AND ptm.template_id IS NULL
 		  AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
 		GROUP BY pa.plugin_id;
 
 	--  END IF;
 END IF;
 SELECT COUNT(1) FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
 		INTO total_apps;
 
 
 IF(returnSize = 0) THEN
 	SELECT *, total_apps FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) order by abid ;
 	-- 	ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc;
 ELSE
 	SELECT  *, total_apps FROM temp_catListing tc
 		WHERE
 		(''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
 		AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
 		AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
 		order by abid
 	-- 	ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc
    LIMIT returnSize
    OFFSET pageOffset;
 END IF;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_getAppsSortedEndUserV4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_getAppsSortedEndUserV4`(IN urId INT, IN chanId INT)
BEGIN


DECLARE defaultTemplate INT;
DROP TEMPORARY TABLE IF EXISTS temp_viewIds_1;
CREATE TEMPORARY TABLE temp_viewIds_1 (tids INT, tViewRank INT);
SELECT viewid FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE INTO defaultTemplate;
INSERT INTO temp_viewIds_1 
SELECT viewid, dispindex FROM categorytemplate WHERE channelId = chanId AND ismaster = TRUE;
IF EXISTS (SELECT uid FROM uidgid WHERE uid = urId) THEN
 INSERT INTO temp_viewIds_1
      SELECT ct.* FROM(SELECT mvg.viewid,mvg.gid FROM mapviewgrp mvg WHERE EXISTS(
		SELECT 1 FROM uidgid u WHERE u.uid = urId AND u.gid=mvg.gid))mvg
	    LEFT JOIN (SELECT ct.viewid, ct.dispindex FROM categorytemplate ct WHERE ct.viewid <> defaultTemplate)ct ON mvg.viewid=ct.viewid;
END IF;

DROP TEMPORARY TABLE IF EXISTS temp_envs;

CREATE TEMPORARY TABLE temp_envs (teUserId int, tePluginId INT, teEnvironment VARCHAR(5), tePlugin_url varchar(999), tePluginVerCode VARCHAR(15),
tePluginVerType CHAR(5), tePluginWebURL VARCHAR(145),
   tePluginSize BIGINT,  tePluginCheckSum VARCHAR(145), tePluginUpdateOn DATETIME,INDEX my_index_temp_envsid (tePluginId,teEnvironment,tePluginVerCode));

 IF EXISTS(select * from plugin_app_environment_users where uid= urId)THEN
 INSERT INTO temp_envs
 select pu.uid, pu.plugin_id,pu.environment,pav1.plugin_url,pav1.version_code,pav1.update_type,pav1.plugin_web_url,pav1.package_size,pav1.package_checksum,pav1.update_on from plugin_app_environment_users pu
 JOIN plugin_app pac ON pac.plugin_id = pu.plugin_id
 JOIN plugin_app_version pav1
        ON ((pav1.plugin_ver_id = pac.dev_version AND pu.environment='dev' AND pac.dev_version > 0)
            OR (pav1.plugin_ver_id = pac.beta_version AND pu.environment='beta' and pac.beta_version > 0))
 where pu.uid = urId and pac.channelId = chanId;
 END IF;
 
 DROP TEMPORARY TABLE IF EXISTS temp_catListing;
 CREATE TEMPORARY TABLE temp_catListing
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tMyFavItIs INT,
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20),
   owner_email VARCHAR(250), app_access VARCHAR(1));
IF EXISTS (SELECT * FROM actionbutton WHERE channelid = chanId and `action`='folderview') THEN
  INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs,
	   tdisplayName, pluginId,tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
	  version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count,
	  average_rating,tappStatus,owner_email,app_access )        

      SELECT a.abid,
      a.title,
      '',
      a.grid_xhdpi,
      a.dispindex,
      mc.`type`,
      'FR'  as tsubDiff,
      a.is_hidden,
      a.tile_mdpi,
     COALESCE(ufi.uid, 0), 
     mc.display_name, 
	 0 ,
     (select count(*) from folderstructure where actionid =  a.abid),
     '' as templateName,
    a.modify_date as modified_date,
   '' as `expiry_date`,
    '' as folder_assign_to,
    '' as folder_assign_id,
    1 as is_ab,
   '' as `version`,
   '' as last_accessed,
    0 as total_accessed_time,
    0 as users_accessedcontent_count,
    0 as avg_accessed_time,
    '' as plugin_install_type, 
    0 as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    'fold',
    '' as owner_email,
    '' AS owner_allowed
   
    FROM actionbutton a
    JOIN mapviewcat mc on a.abid = mc.catid and a.channelId = chanId and mc.`type` = 'f' and  a.searchable = true
    JOIN temp_viewIds_1 tv on tv.tids = mc.viewid
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    GROUP BY a.abid ;
   
END IF;
INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs,
        tdisplayName, pluginId, tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
		version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count,
        average_rating,tappStatus,owner_email,app_access ) 
     
 SELECT 
    DISTINCT
    a.abid as abid,
    CASE COALESCE(pa.plugin_type, 'DRU')
      WHEN 'DRU' THEN a.title
      ELSE pa.plugin_name
    END as 'tcatName',
    pa.plugin_desc as tcatDesc,
    a.grid_xhdpi as tcatImg,
    a.dispindex as tcatDisplayIndex,
    mc.`type` as tdiff, 
    COALESCE(pa.plugin_type, 'DRU') as tsubDiff, 
    CASE COALESCE(pa.plugin_type, 'DRU') 
      WHEN 'DRU' THEN a.is_hidden
      ELSE ifnull(pas.is_hidden, 0)
    END as 'tisHidden',
    a.tile_mdpi as tcatTileImg,
    COALESCE(ufi.uid, 0) as tMyFavItIs,
    mc.display_name as tdisplayName,
    COALESCE(ptm.plugin_id, 0) as pluginId,
    (select count(*) from folderstructure where actionid =  a.abid) as tfAppCount,
    '' as templateName,
    a.modify_date as modified_date,
    pa.expiry_date as `expiry_date`,
    '' as folder_assign_to,
   '' as folder_assign_id,
    1 as is_ab,
    pav.version_code as `version`,
   '' as last_accessed,
    0 as total_accessed_time,
    0 as users_accessedcontent_count,
    0 as avg_accessed_time,
    ifnull(pa.plugin_install_type,'Deprecated') as plugin_install_type, 
    0 as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    CASE pa.is_draft 
      WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
      ELSE fn_getAppStatus(a.is_active,a.searchable)
    END as 'tappStatus',
   '' as owner_email,
   '' AS owner_allowed    
      FROM actionbutton a
    JOIN mapviewcat mc on a.abid = mc.catid and a.channelId = chanId and mc.`type` = 'a' AND searchable = true
    JOIN temp_viewIds_1 tv on tv.tids = mc.viewid
	LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid
	LEFT JOIN plugin_app pa ON pa.plugin_id = ptm.plugin_id
	LEFT JOIN temp_envs tep ON tep.tePluginId = pa.plugin_id and tep.teUserId=urId
	LEFT JOIN plugin_app_version pav ON pav.plugin_ver_id = pa.latest_version
    LEFT JOIN plugin_app_setting pas ON pas.plugin_id = pa.plugin_id
    LEFT JOIN user_rating_icon uri ON uri.icon_id = a.abid
    LEFT JOIN user_rating_icon uri1 ON uri1.icon_id = a.abid AND uri1.uid = urId
    LEFT JOIN user_fav_icon ufi ON ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = urId
    LEFT JOIN plugin_app_universal_link paul ON paul.plugin_id = pa.plugin_id
    LEFT JOIN app_custom_view acv ON acv.plugin_id = pa.plugin_id

  GROUP BY a.abid  ;

  SELECT  * FROM temp_catListing where tappStatus!='draft'  ORDER BY  tcatDisplayIndex;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_getAppsSortedV4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_getAppsSortedV4`(IN chanId INT,IN templateIds TEXT, IN searchTxt TEXT, IN appActive INT,
IN filterByAppType TEXT,IN isAppDraft INT,IN hiddenApp INT, IN pageOffset INT, IN returnSize INT, IN appStatus VARCHAR(20), IN loggedInUid INT,
IN showAll INT)
BEGIN
 
DECLARE mstr BOOL;
 DECLARE total_apps INT DEFAULT 0;
 DROP TEMPORARY TABLE IF EXISTS temp_catListing;
 CREATE TEMPORARY TABLE temp_catListing
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tMyFavItIs INT,
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20),
   owner_email VARCHAR(250), app_access VARCHAR(1)) engine = memory;
 
 
 
 IF EXISTS (SELECT 1 FROM category WHERE channelid = chanId LIMIT 1) THEN
 
   INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff,tsubDiff, tisHidden, tcatTileImg, tdisplayName, pluginId, templateName, modified_date, expiry_date, is_ab, tappStatus,
   owner_email)
   SELECT c.catid,
          c.catname,
            c.catDescp,
          c.grid_xhdpi,
          c.indexing,
          'c',
              'CMS',
              c.is_hidden,
          c.tile_mdpi,
          0,
          mp.display_name,
          0,
              ct.viewname,
              c.modify_date,
             '',
              1,
              fn_getAppStatus(c.is_active,c.searchable),
              ''
   FROM   mapviewcat mp 
          JOIN category c 
            ON mp.catid = c.catid 
          JOIN categorytemplate ct 
            ON mp.viewid = ct.viewid 
           
   WHERE  c.channelid = chanId
          AND mp.`type` = 'c'
          AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
         AND ('' = searchTxt OR c.catname LIKE CONCAT('%', searchTxt, '%') or c.catDescp LIKE CONCAT('%', searchTxt, '%'))
          AND c.is_active=1;
 
 END IF;
 

IF EXISTS (SELECT * FROM actionbutton WHERE channelid = chanId and `action`='folderview') THEN
	INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs,
	   tdisplayName, pluginId,tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
	  version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count,
	  average_rating,tappStatus,owner_email,app_access )        

      SELECT a.abid,
      a.title,
      '',
      a.grid_xhdpi,
      a.dispindex,
      mp.`type`,
      'FR'  as tsubDiff,
      a.is_hidden,
      a.tile_mdpi,
     COALESCE(ufi.uid, 0),  mp.display_name, 
	 COALESCE(ptm.plugin_id, 0) ,
     (select count(*) from folderstructure where actionid =  a.abid),
      ct.viewname as templateName,
    a.modify_date as modified_date,
    pa.expiry_date as `expiry_date`,
    '' as folder_assign_to,
    fs.actionId as folder_assign_id,
    1 as is_ab,
   '' as `version`,
   '' as last_accessed,
    0 as total_accessed_time,
    0 as users_accessedcontent_count,
    0 as avg_accessed_time,
    '' as plugin_install_type, 
    0 as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    'fold',
    ui.uemail as owner_email,
    MIN(IF(pa.owner_uid=loggedInUid, 3, IF(pap.uid=loggedInUid, 2, NULL))) AS owner_allowed

     
     
    FROM mapviewcat mp 
      JOIN actionbutton a ON mp.catid = a.abid 
      LEFT JOIN plugin_template_map ptm ON ptm.ab_id = a.abid 
       LEFT JOIN categorytemplate ct
         ON mp.viewid = ct.viewid
          LEFT JOIN plugin_app pa
        ON ptm.plugin_id = pa.plugin_id 
        LEFT JOIN user_rating_icon uri
        ON uri.icon_id = a.abid 
	  LEFT JOIN user_fav_icon ufi ON 
		 ufi.icon_id = a.abid  
           LEFT JOIN folderstructure fs
        ON a.abid = fs.mapid
          LEFT JOIN userdetails ud on ud.channelid = chanId
    AND pa.owner_uid = ud.uid
    LEFT JOIN userinfo ui on ui.userid = ud.userid
    LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
    WHERE  a.channelid = chanId 
      AND  mp.`type` = 'f'
      AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
       GROUP BY a.abid;
      
END IF;

	
     
 INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
                            version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,app_access )        
        SELECT
abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, `expiry_date`, folder_assign_to, folder_assign_id, is_ab,
                            `version`, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,
               (CASE 
                 WHEN owner_allowed IS NOT NULL THEN (
                   CASE
                   WHEN owner_allowed = 0 then 'w'
                  WHEN owner_allowed = 1 then 'w'
                  WHEN owner_allowed = 2 then 'w'
                  WHEN owner_allowed = 3 then 'o'
                  END
                 ) ELSE (                   
                   CASE
                   WHEN all_users_allowed = 0 then 'w'
                  WHEN all_users_allowed = 1 then 'w'
                  WHEN all_users_allowed = 2 then 'w'
                  END
                 )
                 END             
               ) AS app_access
FROM (
    SELECT 
    DISTINCT
    a.abid as abid,
    CASE COALESCE(pa.plugin_type, 'DRU')
      WHEN 'DRU' THEN a.title
      ELSE pa.plugin_name
    END as 'tcatName',
  pa.plugin_desc as tcatDesc,
    a.grid_xhdpi as tcatImg,
    a.dispindex as tcatDisplayIndex,
    mp.`type` as tdiff, 
    COALESCE(pa.plugin_type, 'DRU') as tsubDiff, 
    CASE COALESCE(pa.plugin_type, 'DRU') 
      WHEN 'DRU' THEN a.is_hidden
      ELSE ifnull(pas.is_hidden, 0)
    END as 'tisHidden',
    a.tile_mdpi as tcatTileImg,
    COALESCE(ufi.uid, 0) as tMyFavItIs,
    mp.display_name as tdisplayName,
    COALESCE(ptm.plugin_id, 0) as pluginId,
    (select count(*) from folderstructure where actionid =  a.abid) as tfAppCount,
    ct.viewname as templateName,
    a.modify_date as modified_date,
    pa.expiry_date as `expiry_date`,
    fab.title as folder_assign_to,
    fs.actionId as folder_assign_id,
    1 as is_ab,
    pav.version_code as `version`,
   '' as last_accessed,
    0 as total_accessed_time,
    0 as users_accessedcontent_count,
    0 as avg_accessed_time,
    ifnull(pa.plugin_install_type,'Deprecated') as plugin_install_type, 
 0 as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    CASE pa.is_draft 
      WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
      ELSE fn_getAppStatus(a.is_active,a.searchable)
    END as 'tappStatus',
    ui.uemail as owner_email,
    MIN(IF(pa.owner_uid=loggedInUid, 3, IF(pap.uid=loggedInUid, 2, NULL))) AS owner_allowed,
    MIN(IF(pap.uid IS NULL OR pap.uid=0, 2, 2)) AS all_users_allowed
    
     FROM mapviewcat mp 
      left JOIN actionbutton a ON mp.catid = a.abid 
       LEFT JOIN plugin_template_map ptm 
        ON ptm.ab_id = a.abid
      LEFT JOIN categorytemplate ct
         ON mp.viewid = ct.viewid
       LEFT JOIN plugin_app pa
        ON ptm.plugin_id = pa.plugin_id and pa.is_active = 1
       LEFT JOIN plugin_app_setting pas
        ON pa.plugin_id = pas.plugin_id
 
      LEFT JOIN user_rating_icon uri
        ON uri.icon_id = a.abid AND uri.icon_type = 'a'
	  LEFT JOIN user_fav_icon ufi ON 
		 ufi.icon_id = a.abid AND ufi.icon_type = 'a' AND ufi.uid = loggedInUid
      LEFT JOIN mapviewgrp mvg
        ON ptm.template_id=mvg.viewid
      
      LEFT JOIN plugin_app_version pav
        ON pa.latest_version=pav.plugin_ver_id
      
    
 
      LEFT JOIN folderstructure fs
        ON a.abid = fs.mapid
      LEFT JOIN actionbutton fab
        ON fab.abid = fs.actionid
        
    LEFT JOIN userdetails ud on ud.channelid = chanId
    AND pa.owner_uid = ud.uid
    LEFT JOIN userinfo ui on ui.userid = ud.userid
    LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
    AND (
    CASE WHEN 1<>showAll THEN pap.uid IN (0, loggedInUid)
    ELSE 0=0 END
    )
     WHERE 
       a.channelid = chanId
       AND (mp.`type` = 'a')
       AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
      AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or a.title LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
          AND a.is_active=1
     GROUP BY mp.catId
    HAVING (
    CASE WHEN 1 <> showAll THEN (IF(owner_allowed IS NOT NULL, owner_allowed<>0, all_users_allowed<>0))
    ELSE 0=0 END
    )
) tempAfterPermissionFiltering;
    
 
    
    
    IF(templateIds = '0') THEN
        INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, expiry_date, folder_assign_to,folder_assign_id, is_ab,
                            version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating, tappStatus,
                            owner_email, app_access)
        SELECT abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff, tisHidden, tcatTileImg,tMyFavItIs, tdisplayName, pluginId, 
tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab, version, last_accessed,
total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,
tappStatus, owner_email, 
               (CASE 
                 WHEN owner_allowed IS NOT NULL THEN (
                   CASE
                   WHEN owner_allowed = 0 then 'w'
                  WHEN owner_allowed = 1 then 'w'
                  WHEN owner_allowed = 2 then 'w'
                  WHEN owner_allowed = 3 then 'o'
                  END
                 ) ELSE (                   
                   CASE
                   WHEN all_users_allowed = 0 then 'w'
                  WHEN all_users_allowed = 1 then 'w'
                  WHEN all_users_allowed = 2 then 'w'
                  END
                 )
                 END             
               ) AS app_access FROM (
SELECT
        COALESCE(a.abid, 0) AS `abid`,
        pa.plugin_name AS `tcatName`,
        pa.plugin_desc AS `tcatDesc`,
        pa.plugin_icon_url_xhdpi AS `tcatImg`,
        a.dispindex AS `tcatDisplayIndex`,
        mp.`type` AS `tdiff`,
        pa.plugin_type AS `tsubDiff`,
        pas.is_hidden AS `tisHidden`,
        a.tile_mdpi AS `tcatTileImg`,
        COALESCE(ufi.uid, 0) as tMyFavItIs,
        mp.display_name AS `tdisplayName`,
        COALESCE(pa.plugin_id, 0) AS `pluginId`,
       (select count(*) from folderstructure where actionid =  a.abid) AS `tfAppCount`,
        ct.viewname AS `templateName`,
        pa.plugin_modified_date AS `modified_date`,
        pa.expiry_date AS `expiry_date`,
        null AS `folder_assign_to`,
        0 AS `folder_assign_id`,
        0 AS `is_ab`,
        pav.version_code AS `version`,
   '' AS `last_accessed`,
   0 AS `total_accessed_time`,
   0 AS `users_accessedcontent_count`,
    0 AS `avg_accessed_time`,
    pa.plugin_install_type AS `plugin_install_type`,
0 AS `user_count`,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS `average_rating`,    
 fn_getAppStatus(pa.is_active,0) AS `tappStatus`,
 ui.uemail AS `owner_email`,
    MIN(IF(pa.owner_uid=loggedInUid, 3, IF(pap.uid=loggedInUid, 2, NULL))) AS owner_allowed,
    MIN(IF(pap.uid IS NULL OR pap.uid=0, 2, 2)) AS all_users_allowed
    FROM plugin_app pa
           LEFT JOIN plugin_template_map ptm
            ON pa.plugin_id = ptm.plugin_id
           LEFT JOIN categorytemplate ct
             ON ptm.template_id = ct.viewid
           LEFT JOIN actionbutton a
            ON a.abid = ptm.ab_id
           LEFT JOIN mapviewcat mp
            ON a.abid = mp.catid
          LEFT JOIN plugin_app_setting pas
            ON pa.plugin_id = pas.plugin_id
        
          LEFT JOIN user_rating_icon uri
                ON uri.icon_id = ptm.ab_id AND uri.icon_type = 'a'
		 LEFT JOIN user_fav_icon ufi ON 
		    ufi.icon_id = ptm.ab_id AND ufi.icon_type = 'a' AND ufi.uid = loggedInUid      
          LEFT JOIN mapviewgrp mvg
            ON ptm.template_id=mvg.viewid
         
          LEFT JOIN plugin_app_version pav
            ON pa.latest_version=pav.plugin_ver_id
          
         
         LEFT JOIN userdetails ud on ud.channelid = chanId
         AND pa.owner_uid = ud.uid
         LEFT JOIN userinfo ui on ui.userid = ud.userid
        LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
        AND (
            CASE WHEN 1<>showAll THEN pap.uid IN (0, loggedInUid)
            ELSE 0=0 END
        )
        WHERE
           pa.channelid = chanId
          AND ptm.template_id IS NULL
          AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
          and pa.is_active = 1
        GROUP BY pa.plugin_id
        HAVING (
            CASE WHEN 1 <> showAll THEN (IF(owner_allowed IS NOT NULL, owner_allowed<>0, all_users_allowed<>0))
            ELSE 0=0 END
        )
) tempAfterPermissionFiltering;
 
    
 END IF;
SELECT 
    COUNT(1)
FROM
    temp_catListing tc
WHERE
    ('' = filterByAppType
        OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp)
        OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all'
        OR tc.tappStatus = appStatus) INTO total_apps;
 
 
 IF(returnSize = 0) THEN
    SELECT *, total_apps FROM temp_catListing tc
        WHERE
        (''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
        ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc;
 ELSE
    SELECT  *, total_apps FROM temp_catListing tc
        WHERE
        (''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
        ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc
    LIMIT returnSize
    OFFSET pageOffset;
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_getAppsSortedWithOwners` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_getAppsSortedWithOwners`(IN chanId INT,IN templateIds TEXT, IN searchTxt TEXT, IN appActive INT,
IN filterByAppType TEXT,IN isAppDraft INT,IN hiddenApp INT, IN pageOffset INT, IN returnSize INT, IN appStatus VARCHAR(20), IN loggedInUid INT,
IN showAll INT)
BEGIN
 
 
DECLARE mstr BOOL;
 DECLARE total_apps INT DEFAULT 0;
 DROP TEMPORARY TABLE IF EXISTS temp_catListing;
 CREATE TEMPORARY TABLE temp_catListing
   (tId INT PRIMARY KEY AUTO_INCREMENT, abid int, tcatName varchar(200),tcatDesc varchar(200), tcatImg varchar(200), tcatDisplayIndex int,
   tdiff varchar(10), tsubDiff VARCHAR(20), tsearchable bool,tisHidden int, tcatTileImg varchar(200),
   tdisplayName varchar(100), pluginId INT, tfAppCount INT, templateName varchar(200), is_active INT, is_draft INT,
   modified_date varchar(100), expiry_date varchar(100), folder_assign_to varchar(100),folder_assign_id varchar(100), app_type varchar(100), 
   is_ab boolean, version varchar(20), last_accessed DATETIME, total_accessed_time INT,users_accessedcontent_count INT,
   avg_accessed_time float, plugin_install_type VARCHAR(50), user_count INT, average_rating FLOAT, tappStatus VARCHAR(20),
   owner_email VARCHAR(250), app_access VARCHAR(1)) engine = memory;
 
 -- SELECT ismaster FROM categorytemplate where viewid = templateId and channelId = chanId INTO mstr;
 
 IF EXISTS (SELECT 1 FROM category WHERE channelid = chanId LIMIT 1) THEN
 
   INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff,tsubDiff, tisHidden, tcatTileImg, tdisplayName, pluginId, templateName, modified_date, expiry_date, is_ab, tappStatus,
   owner_email)
   SELECT c.catid,
          c.catname,
            c.catDescp,
          c.grid_xhdpi,
          c.indexing,
          'c',
              'CMS',
              c.is_hidden,
          c.tile_mdpi,
          mp.display_name,
          0,
              ct.viewname,
              c.modify_date,
             '',
              1,
              fn_getAppStatus(c.is_active,c.searchable),
              ''
   FROM   mapviewcat mp 
          JOIN category c 
            ON mp.catid = c.catid 
          JOIN categorytemplate ct 
            ON mp.viewid = ct.viewid 
           
   WHERE  c.channelid = chanId
          AND mp.`type` = 'c'
          AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
         AND ('' = searchTxt OR c.catname LIKE CONCAT('%', searchTxt, '%') or c.catDescp LIKE CONCAT('%', searchTxt, '%'))
          AND c.is_active=1;
 
 END IF;
 
-- IF EXISTS (SELECT 1 FROM actionbutton WHERE channelid = chanId limit 1) THEN
    
    /* select mapviewcat apps that will include 1: weblink , 2: apps assigned to template */
     
 INSERT INTO temp_catListing (abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab,
                            version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,app_access )        
        SELECT
abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, `expiry_date`, folder_assign_to, folder_assign_id, is_ab,
                            `version`, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,tappStatus,owner_email,
               (CASE 
                 WHEN owner_allowed IS NOT NULL THEN (
                   CASE
                   WHEN owner_allowed = 0 then 'n'
                  WHEN owner_allowed = 1 then 'r'
                  WHEN owner_allowed = 2 then 'w'
                  WHEN owner_allowed = 3 then 'o'
                  END
                 ) ELSE (                   
                   CASE
                   WHEN all_users_allowed = 0 then 'n'
                  WHEN all_users_allowed = 1 then 'r'
                  WHEN all_users_allowed = 2 then 'w'
                  END
                 )
                 END             
               ) AS app_access
FROM (
    SELECT 
    DISTINCT
    a.abid as abid,
    CASE COALESCE(pa.plugin_type, 'DRU')
      WHEN 'DRU' THEN a.title
      ELSE pa.plugin_name
    END as 'tcatName',
  pa.plugin_desc as tcatDesc,
    a.grid_xhdpi as tcatImg,
    a.dispindex as tcatDisplayIndex,
    mp.`type` as tdiff, 
    COALESCE(pa.plugin_type, 'DRU') as tsubDiff, -- if null then it is old link then assign DRU D - deprecated
    CASE COALESCE(pa.plugin_type, 'DRU') /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
      WHEN 'DRU' THEN a.is_hidden
      ELSE ifnull(pas.is_hidden, 0)
    END as 'tisHidden',
    a.tile_mdpi as tcatTileImg,
    mp.display_name as tdisplayName,
    COALESCE(ptm.plugin_id, 0) as pluginId,
    (select count(*) from folderstructure where actionid =  a.abid) as tfAppCount,
    ct.viewname as templateName,
    a.modify_date as modified_date,
    pa.expiry_date as `expiry_date`,
    fab.title as folder_assign_to,
    fs.actionId as folder_assign_id,
    1 as is_ab,
    pav.version_code as `version`,
   '' as last_accessed,--  MAX(cah.accessedon) as last_accessed,
    0 as total_accessed_time,-- COALESCE(SUM(cah.accessedtime),0) as total_accessed_time,
    0 as users_accessedcontent_count,-- COALESCE(COUNT(cah.uid),0) as users_accessedcontent_count,
    0 as avg_accessed_time,-- ROUND(COALESCE(SUM(cah.accessedtime)/COUNT(cah.uid),0),2) as avg_accessed_time,
    ifnull(pa.plugin_install_type,'Deprecated') as plugin_install_type, -- if null then it is old link then assign DRU D - deprecated
 0 as user_count,--     ifnull(COUNT(ug.uid),0) as user_count,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS average_rating,
    CASE pa.is_draft /* if plugin_type is null means it is deprecated then read from a.is_hidden and if other read from plugin_app_setting is_hidden */
      WHEN 1 THEN  fn_getAppStatus(a.is_active,0)
      ELSE fn_getAppStatus(a.is_active,a.searchable)
    END as 'tappStatus',
    ui.uemail as owner_email,
    MIN(IF(pa.owner_uid=loggedInUid, 3, IF(pap.uid=loggedInUid, permission, NULL))) AS owner_allowed,
    MIN(IF(pap.uid IS NULL OR pap.uid=0, IF(PERMISSION IS NOT NULL, PERMISSION, 2), 2)) AS all_users_allowed
    -- fn_getAppStatus(a.is_active,a.searchable)
     FROM mapviewcat mp 
      left JOIN actionbutton a ON mp.catid = a.abid 
       LEFT JOIN plugin_template_map ptm 
        ON ptm.ab_id = a.abid
      LEFT JOIN categorytemplate ct
         ON mp.viewid = ct.viewid
       LEFT JOIN plugin_app pa
        ON ptm.plugin_id = pa.plugin_id and pa.is_active = 1
       LEFT JOIN plugin_app_setting pas
        ON pa.plugin_id = pas.plugin_id
 
      LEFT JOIN user_rating_icon uri
        ON uri.icon_id = a.abid AND uri.icon_type = 'a'
      LEFT JOIN mapviewgrp mvg
        ON ptm.template_id=mvg.viewid
      -- LEFT JOIN uidgid ug    ON ug.gid=mvg.gid
      LEFT JOIN plugin_app_version pav
        ON pa.latest_version=pav.plugin_ver_id
      -- LEFT JOIN userdetails ud ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
    --  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
 
      LEFT JOIN folderstructure fs
        ON a.abid = fs.mapid
      LEFT JOIN actionbutton fab
        ON fab.abid = fs.actionid
        
    LEFT JOIN userdetails ud on ud.channelid = chanId
    AND pa.owner_uid = ud.uid and ud.is_active=1
    LEFT JOIN userinfo ui on ui.userid = ud.userid
    LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
    AND (
    CASE WHEN 1<>showAll THEN pap.uid IN (0, loggedInUid)
    ELSE 0=0 END
    )
     WHERE 
       a.channelid = chanId
       AND (mp.`type` = 'a')
       AND ('0' = templateIds OR FIND_IN_SET(mp.viewid, templateIds))
      AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or a.title LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
          AND a.is_active=1
     GROUP BY mp.catId
    HAVING (
    CASE WHEN 1 <> showAll THEN (IF(owner_allowed IS NOT NULL, owner_allowed<>0, all_users_allowed<>0))
    ELSE 0=0 END
    )
) tempAfterPermissionFiltering;
    -- GROUP BY pa.plugin_id;
 
    /* SELECT PLugins in channel which are not assigned to template */
    
    IF(templateIds = '0') THEN
        INSERT INTO temp_catListing (abid, tcatName,tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff,tisHidden, tcatTileImg, tdisplayName, pluginId,
                            tfAppCount, templateName, modified_date, expiry_date, folder_assign_to,folder_assign_id, is_ab,
                            version, last_accessed, total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating, tappStatus,
                            owner_email, app_access)
        SELECT abid, tcatName, tcatDesc, tcatImg, tcatDisplayIndex, tdiff, tsubDiff, tisHidden, tcatTileImg, tdisplayName, pluginId, 
tfAppCount, templateName, modified_date, expiry_date, folder_assign_to, folder_assign_id, is_ab, version, last_accessed,
total_accessed_time, users_accessedcontent_count, avg_accessed_time, plugin_install_type, user_count, average_rating,
tappStatus, owner_email, 
               (CASE 
                 WHEN owner_allowed IS NOT NULL THEN (
                   CASE
                   WHEN owner_allowed = 0 then 'n'
                  WHEN owner_allowed = 1 then 'r'
                  WHEN owner_allowed = 2 then 'w'
                  WHEN owner_allowed = 3 then 'o'
                  END
                 ) ELSE (                   
                   CASE
                   WHEN all_users_allowed = 0 then 'n'
                  WHEN all_users_allowed = 1 then 'r'
                  WHEN all_users_allowed = 2 then 'w'
                  END
                 )
                 END             
               ) AS app_access FROM (
SELECT
        COALESCE(a.abid, 0) AS `abid`,
        pa.plugin_name AS `tcatName`,
        pa.plugin_desc AS `tcatDesc`,
        pa.plugin_icon_url_xhdpi AS `tcatImg`,
        a.dispindex AS `tcatDisplayIndex`,
        mp.`type` AS `tdiff`,
        pa.plugin_type AS `tsubDiff`,
        pas.is_hidden AS `tisHidden`,
        a.tile_mdpi AS `tcatTileImg`,
        mp.display_name AS `tdisplayName`,
        COALESCE(pa.plugin_id, 0) AS `pluginId`,
       (select count(*) from folderstructure where actionid =  a.abid) AS `tfAppCount`,
        ct.viewname AS `templateName`,
        pa.plugin_modified_date AS `modified_date`,
        pa.expiry_date AS `expiry_date`,
        null AS `folder_assign_to`,
        0 AS `folder_assign_id`,
        0 AS `is_ab`,
        pav.version_code AS `version`,
   '' AS `last_accessed`,
   0 AS `total_accessed_time`,
   0 AS `users_accessedcontent_count`,
    0 AS `avg_accessed_time`,
    pa.plugin_install_type AS `plugin_install_type`,
0 AS `user_count`,
    FORMAT(SUM(uri.rating)/COUNT(*), 1) AS `average_rating`,    
 fn_getAppStatus(pa.is_active,0) AS `tappStatus`,
 ui.uemail AS `owner_email`,
    MIN(IF(pa.owner_uid=loggedInUid, 3, IF(pap.uid=loggedInUid, permission, NULL))) AS owner_allowed,
    MIN(IF(pap.uid IS NULL OR pap.uid=0, IF(PERMISSION IS NOT NULL, PERMISSION, 2), 2)) AS all_users_allowed
    FROM plugin_app pa
           LEFT JOIN plugin_template_map ptm
            ON pa.plugin_id = ptm.plugin_id
           LEFT JOIN categorytemplate ct
             ON ptm.template_id = ct.viewid
           LEFT JOIN actionbutton a
            ON a.abid = ptm.ab_id
           LEFT JOIN mapviewcat mp
            ON a.abid = mp.catid
          LEFT JOIN plugin_app_setting pas
            ON pa.plugin_id = pas.plugin_id
        
          LEFT JOIN user_rating_icon uri
                ON uri.icon_id = ptm.ab_id AND uri.icon_type = 'a'
          LEFT JOIN mapviewgrp mvg
            ON ptm.template_id=mvg.viewid
         -- LEFT JOIN uidgid ug     ON ug.gid=mvg.gid
          LEFT JOIN plugin_app_version pav
            ON pa.latest_version=pav.plugin_ver_id
          -- LEFT JOIN userdetails ud   ON ud.uid=ug.uid AND ud.IS_ACTIVE = 1
         --  LEFT JOIN categoryaccessed_history cah ON cah.actbtnid=ptm.ab_id
         LEFT JOIN userdetails ud on ud.channelid = chanId
         AND pa.owner_uid = ud.uid
         LEFT JOIN userinfo ui on ui.userid = ud.userid
        LEFT JOIN plugin_app_permissions pap ON pa.plugin_id = pap.plugin_id
        AND (
            CASE WHEN 1<>showAll THEN pap.uid IN (0, loggedInUid)
            ELSE 0=0 END
        )
        WHERE
           pa.channelid = chanId
          AND ptm.template_id IS NULL
          AND ('' = searchTxt OR pa.plugin_name LIKE CONCAT('%', searchTxt, '%') or pa.plugin_desc LIKE CONCAT('%', searchTxt, '%'))
          and pa.is_active = 1
        GROUP BY pa.plugin_id
        HAVING (
            CASE WHEN 1 <> showAll THEN (IF(owner_allowed IS NOT NULL, owner_allowed<>0, all_users_allowed<>0))
            ELSE 0=0 END
        )
) tempAfterPermissionFiltering;
 
    --  END IF;
 END IF;
SELECT 
    COUNT(1)
FROM
    temp_catListing tc
WHERE
    ('' = filterByAppType
        OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp)
        OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all'
        OR tc.tappStatus = appStatus) INTO total_apps;
 
 
 IF(returnSize = 0) THEN
    SELECT *, total_apps FROM temp_catListing tc
        WHERE
        (''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
        ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc;
 ELSE
    SELECT  *, total_apps FROM temp_catListing tc
        WHERE
        (''= filterByAppType OR FIND_IN_SET(tc.tsubDiff, filterByAppType))
        AND ((2 = hiddenApp ) OR (tc.tisHidden = hiddenApp))
        AND (appStatus = 'all' OR tc.tappStatus = appStatus) 
        ORDER BY STR_TO_DATE(tc.modified_date, '%Y-%m-%d %H:%i:%s') desc
    LIMIT returnSize
    OFFSET pageOffset;
 END IF;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_plugin_UpdateAppIcon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_plugin_UpdateAppIcon`(IN pluginId INT,IN hideApp BOOL,IN chanId INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
  BEGIN
	  ROLLBACK;
	  RESIGNAL;
  END;  
IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN
  START TRANSACTION;
	IF EXISTS(SELECT * FROM plugin_app_setting WHERE plugin_id = pluginId AND channelid = chanId) THEN
		-- update
		UPDATE plugin_app_setting
		SET is_hidden = hideApp
		WHERE plugin_id = pluginId AND channelid = chanId;
        
        UPDATE actionbutton 
        INNER JOIN plugin_template_map on plugin_template_map.ab_id = actionbutton.abid
        INNER JOIN plugin_app on plugin_app.plugin_id = plugin_template_map.plugin_id
        SET actionbutton.modify_date = NOW() 
        WHERE plugin_app.plugin_id = pluginId;
	END IF;
  COMMIT;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_saveAPISubCategorydetails_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_saveAPISubCategorydetails_v3`(IN channelId INT, IN catId INT, IN subCatId INT, IN catName TEXT, IN catMethod TEXT, IN pluginId INT)
BEGIN
	DECLARE sub_cat_id INT default 0;
    DECLARE duplicate_name_count INT default 0;
	if exists (select * from api_category where channel_id = channelId and api_category_id = catId)then
		if exists(select * from api_sub_category where category_id = catId and sub_category_id = subCatId)Then
			select subCatId into sub_cat_id;
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and sub_category_id != subCatId and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				UPDATE api_sub_category SET
					sub_category_name = catName,
					sub_modify_on = CURRENT_TIMESTAMP,
					sub_category_method = catMethod,
					plugin_id = pluginId
					WHERE category_id = catId and sub_category_id = subCatId;
			end if;
		else
			select 1 from api_sub_category where category_id = catId and sub_category_name = catName and isDeleted = 0 into duplicate_name_count;
			if duplicate_name_count = 0 then
				INSERT INTO `api_sub_category` (`sub_category_name`,`category_id`, `sub_category_method`, `plugin_id`, `format_id`)
				VALUES (catName, catId, catMethod, pluginId, uuid());
				select LAST_INSERT_ID() into sub_cat_id;
			end if;
		end if;
   end if;
   select sub_cat_id as 'sub_cat_id', duplicate_name_count as 'isDuplicate';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_searchAdminUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_searchAdminUsers`(IN chanId INT, IN searchTxt TEXT,
IN pageSize INT, IN pageOffset INT)
BEGIN
DECLARE ownerMail VARCHAR(250);

SELECT 
    contactmail
FROM
    channel
WHERE
    channelid = chanId INTO ownerMail;

SELECT 
    au.admin_id,
    ud.uid,
    ui.uname AS 'name',
    ui.uemail AS 'email',
    ud.last_app_launch,
    ui.isAdmin,
    ui.is_verified,
    au.is_super,
    ud.is_active,
    (CASE
        WHEN ui.uemail = ownerMail THEN 1
        ELSE 0
    END) AS 'is_owner'
FROM
    adminuser au
        JOIN
    userinfo ui ON ui.userid = au.userid
        JOIN
    userdetails ud ON ud.userid = au.userid
WHERE
    au.channelid = chanId
        AND ud.is_active = 1
        AND (searchTxt IS NULL OR searchTxt = ''
        OR (ui.uemail LIKE CONCAT('%', searchTxt, '%')
        OR ui.uname LIKE CONCAT('%', searchTxt, '%')))
GROUP BY ud.uid
LIMIT PAGESIZE OFFSET PAGEOFFSET;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_sp_deleteWhiteListIpForPlugin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_sp_deleteWhiteListIpForPlugin`(IN chanId INT, IN pluginId INT)
BEGIN
DELETE FROM plugin_whitelisted_ip WHERE channelid= chanId AND plugin_id = pluginId;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_sp_getPluginWhitelistedIp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_sp_getPluginWhitelistedIp`(IN chanId INT, IN pluginId INT)
BEGIN
SELECT *
FROM plugin_whitelisted_ip
WHERE channelid = chanId AND plugin_id = pluginId
ORDER BY channelid DESC, plugin_id DESC, ip DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_toggleApiPublicKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_toggleApiPublicKey`(IN channelId INT, IN catId INT, IN subCatId INT, IN checked INT)
BEGIN
	DECLARE output INT DEFAULT 0;
	IF subCatId = 0 THEN
		IF EXISTS (SELECT 1 FROM api_category where channel_id = channelId and api_category_id = catId and isDeleted = 0) THEN
			UPDATE `api_category`
			SET `isCatPublic` = checked
			WHERE `api_category_id` = catId;
			SELECT 1 INTO output;
		END IF;
	ELSE
		IF EXISTS (select 1 from api_category ac left join api_sub_category asbc ON ac.api_category_id = asbc.category_id where ac.channel_id = channelId and ac.api_category_id = catId and asbc.sub_category_id = subCatId and asbc.isDeleted = 0) THEN
			UPDATE `api_sub_category`
			SET `isSubCatPublic` = checked
			WHERE `sub_category_id` = subCatId and category_id = catId;
			SELECT 1 INTO output;
		END IF;
	END IF;
	SELECT output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_updateEmbedBuilderUrl_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_updateEmbedBuilderUrl_v2`(in pluginId int,in chanId int,in readOnly int,IN disabled INT,in embed_Code text,IN type Text)
BEGIN
	IF(type = "update_disabled") THEN
		 IF exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId)then
			Update formbuilder_embed set is_disable=disabled  where channel_id=chanId and plugin_id=pluginId;
		 END IF;
	ELSEIF (type = "update_read_only") THEN
		 IF exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId)then
			Update formbuilder_embed set ready_only=readOnly  where channel_id=chanId and plugin_id=pluginId;
		END IF;
	ELSEIF (type = "regenerate_new_link") THEN
		IF exists(select * from formbuilder_embed where channel_id=chanId and plugin_id=pluginId)then
			Update formbuilder_embed set embedcode=embed_Code  where channel_id=chanId and plugin_id=pluginId;
        END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v7_updatestatusappdetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v7_updatestatusappdetails`(IN channelId INT, IN statusApp TINYINT, IN statusAppColor VARCHAR(10))
BEGIN
/*
=======================================================================================================================================
=======================================================================================================================================

SR.NO.		CREATED BY 			CREATED DATE		CREATED FOR
======		==============		============		===========
1.			UNMESH GAIKWAD		31/12/2018			UPDATING STATUS APP DETAILS AND ALSO SET STATUS APP HEADER COLOR

=======================================================================================================================================
=======================================================================================================================================
*/

/* 1: SET THE STATUS APP DETAILS AND ALSO THE COLOR*/
IF exists(select * from channel_setting where channelid = channelId)THEN

UPDATE channel_setting c
 	SET 
 		status_app = statusApp,
 		status_app_color = statusAppColor
	WHERE
 		c.channelid = channelId;

/* 2: SET APP META JSON TO UPDATE ITSELF SO THAT THE NEW APP META JSON WILL BE CREATED*/

UPDATE appmetajson a
 	SET 
 		is_valid = 0
 	WHERE
 		a.channelid = channelId;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v8_diy_UpdateChannelBranding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v8_diy_UpdateChannelBranding`(IN chanName TEXT, IN chanId TEXT,
    IN pageTitle TEXT,IN pageDescription TEXT,IN favIcon TEXT,IN subDomain TEXT,IN keepBranding BOOL,IN appLogo_XXHDPI TEXT, IN appLogo_XHDPI TEXT,IN appLogo_HDPI TEXT,IN appLogo_MDPI TEXT,IN appLogo_LDPI TEXT,IN primaryColor VARCHAR(10),IN backgroundColor varchar(10),IN fontColor varchar(10),
    IN appName TEXT,IN aboutDescVal TEXT)
BEGIN

    SELECT channelid FROM channel WHERE channelname = chanName INTO chanId;

    IF EXISTS(select * from channel where channelid=chanId)Then
    UPDATE channel SET display_name = appName WHERE channelid = chanId;
    IF EXISTS(select * from channelsubdomain where channelid=chanId)Then
    UPDATE channelsubdomain SET

        subdo_title=pageTitle,
        subdo_description=pageDescription,
      subdo_fevicon=favIcon,
      is_subdo_brand=keepBranding,
        subdo_primarycolor=primaryColor,
        subdo_backcolor = backgroundColor,
        subdo_fontcolor=fontColor

    WHERE channelid = chanId and id!=-1;
    ELSE 
    INSERT INTO channelsubdomain (channelid,subdo_title,subdo_description,subdo_fevicon,is_subdo_brand,subdo_primarycolor,subdo_backcolor,subdo_fontcolor)
    VALUES (chanId,pageTitle,pageDescription,favIcon,keepBranding,primaryColor,backgroundColor,fontColor);
    END IF;
    UPDATE channelrights SET 
        img_top_bar_xxhdpi = appLogo_XXHDPI,
        img_top_bar_xhdpi = appLogo_XHDPI,
        img_top_bar_hdpi = appLogo_HDPI,
        img_top_bar_mdpi = appLogo_MDPI,
        img_top_bar_ldpi = appLogo_LDPI,
        about_us=aboutDescVal,
        modifieddate = NOW()
    WHERE channelid = chanId ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v8_plugin_GetAppPropertiesV3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v8_plugin_GetAppPropertiesV3`(IN pluginId INT, IN chanId INT)
BEGIN
Declare devUser INT DEFAULT 0;
Declare betaUser INT DEFAULT 0;
Declare prodUser INT DEFAULT 0;
DECLARE isMasterCheck BOOL;
IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN
   select ismaster
        from plugin_app pa 
        left join plugin_template_map ptm on pa.plugin_id=ptm.plugin_id
        left join categorytemplate ct on ct.viewid=ptm.template_id
        where pa.plugin_id=pluginId
        group by pa.PLUGIN_ID into isMasterCheck;
        
       select count(ud.uid)
      from plugin_app pa 
       join plugin_template_map ptm on pa.plugin_id=ptm.plugin_id
       join mapviewgrp mvg on ptm.TEMPLATE_ID=mvg.viewid
       join uidgid ug on ug.gid=mvg.gid
       join userdetails ud on ud.uid=ug.uid
      and pa.plugin_id=pluginId
      and ud.uid not in (select uid from plugin_app_environment_users paeu where paeu.plugin_id=pluginId) into prodUser;
    select COUNT(uid) from plugin_app_environment_users paeu WHERE plugin_id = pluginId and environment='beta' GROUP BY environment into betaUser;
    select  COUNT(uid) from plugin_app_environment_users paeu WHERE plugin_id = pluginId and environment='dev' GROUP BY environment into devUser;
  SELECT
      pa.plugin_id,
      COALESCE(ptm.ab_id, 0) AS ab_id,
      COALESCE(pas.is_hidden, 0) AS is_hidden,
      pa.plugin_statusbar,
     -- pa.plugin_statusbar_bgcolor,
      pa.plugin_statusbar_style,
      pa.plugin_hide_close_btn,
      COALESCE(pas.plugin_allow_text_copy, 1) AS plugin_allow_text_copy,
      COALESCE(pas.plugin_allow_screen_shot, 1) AS plugin_allow_screen_shot,
      COALESCE(pas.allow_web_access, 1) AS plugin_allow_web_access,
      COALESCE(pas.allow_http, 0) AS plugin_allow_http_server,
      COALESCE(pas.on_ios_mobile, 1) AS iphone_support,
      COALESCE(pas.on_ios_tablet, 1) AS ipad_support,
      COALESCE(pas.on_web_browser, 1) AS web_browser_support,
      COALESCE(pas.on_android_mobile, 1) AS android_mobile_support,
      COALESCE(pas.on_android_tablet, 1) AS android_tablet_support,
      COALESCE(pas.on_windows_mobile, 1) AS windows_phone_support,
      COALESCE(pas.on_windows_tablet, 1) AS windows_tablet_support,
      COALESCE(pas.on_windows_desktop, 1) AS windows_desktop_support,
      COALESCE(pas.ios_bottombar_color, '') AS ios_bottombar_color,
         COALESCE(pas.android_bottombar_color, '') AS android_bottombar_color,
         COALESCE(pas.is_phone_landscape_notch, 0) AS is_phone_landscape_notch,
      pa.plugin_install_type,
	    COUNT(ug.uid) as live_user_count,
      pa.plugin_type,
      pa.plugin_theme_color,
      devUser,prodUser,betaUser,
      COALESCE(pas.support_email, '') AS support_email,
      COALESCE(pas.show_multistep_auth_screen, 1) AS show_multistep_auth_screen,
      COALESCE(pas.support_phone, '') AS support_phone,
      COALESCE(pas.app_min_width, '') AS app_min_width,
      COALESCE(pas.app_max_width, '') AS app_max_width,
      COALESCE(pas.app_min_width_msg, '') AS app_min_width_msg,
      COALESCE(pas.is_phone_portrait, 1) AS is_phone_portrait,
      COALESCE(pas.is_phone_landscape, 1) AS is_phone_landscape,
      COALESCE(pas.is_tablet_portrait, 1) AS is_tablet_portrait,
      COALESCE(pas.is_tablet_landscape, 1) AS is_tablet_landscape,
   
      pa.admin_url,
       IF(COALESCE(pa.plugin_statusbar_style, '')='', 0, 1) as status_bar_text_visibility,
          IF(COALESCE(pa.plugin_statusbar_bgcolor, '')='', 0, 1) as statusbar_visibility,
          IF(COALESCE(pa.plugin_statusbar_bgcolor, '')=SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', -1)) as status_bar_gradient_color,
          SUBSTRING_INDEX(COALESCE(pa.plugin_statusbar_bgcolor,''), ',', 1) as plugin_statusbar_bgcolor,
          IF(COALESCE(pas.ios_bottombar_color, '')='', 0, 1) as bottom_bar_visibility,
          IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), 0, 1) as bottom_bar_gradient,
          SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1) as bottom_bar_color_left,
          IF(COALESCE(pas.ios_bottombar_color, '')=SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', 1), '', SUBSTRING_INDEX(COALESCE(pas.ios_bottombar_color,''), ',', -1)) as bottom_bar_color_right,
          COALESCE(pas.enable_logging, 1) as enable_logging,
            COALESCE(pas.logging_with_screenshot, 0) as logging_with_screenshot,
            COALESCE(pas.verify_digest, 0) AS verify_digest
    
    FROM plugin_app pa
      LEFT JOIN plugin_app_setting pas
        ON pas.plugin_id = pa.plugin_id
		  LEFT JOIN plugin_template_map ptm
        ON ptm.plugin_id = pa.plugin_id
		  LEFT JOIN categorytemplate ct
        ON ptm.template_id = ct.viewid
		  LEFT JOIN plugin_app_version pav
        ON pav.plugin_ver_id = pa.latest_version
		  LEFT JOIN plugin_token pt
        ON pt.plugin_id = pa.plugin_id
      LEFT JOIN plugin_app_universal_link paul
        ON paul.plugin_id = pa.plugin_id
      LEFT JOIN mapviewgrp mvg
        ON ptm.template_id=mvg.viewid
      LEFT JOIN uidgid ug
        ON ug.gid=mvg.gid
      LEFT JOIN userdetails ud 
        ON ud.uid=ug.uid AND ud.IS_ACTIVE=1
    WHERE pa.plugin_id = pluginId AND pa.channelid = chanId LIMIT 1;
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v8_plugin_UpdateAppPoperties_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v8_plugin_UpdateAppPoperties_v2`(IN pluginId INT,IN hideApp BOOL,IN packageWebUrl TEXT,IN pluginShowStatusbar BOOL,IN pluginStatusbarColor VARCHAR(40),
    IN pluginStatusbarStyle VARCHAR(10),IN pluginHideCloseBtn BOOL,IN pluginCloseBtnColor VARCHAR(10),IN pluginAllowTextCopy BOOL,IN pluginAllowScreenShot BOOL,
    IN pluginAllowWebAccess BOOL,IN installType CHAR(9), IN chanId INT,IN supportEmail VARCHAR(150), IN supportPhone VARCHAR(150),  
    IN adminPanelUrl TEXT,IN pluginAllowHttpServe BOOL,IN pluginAllowPhonePortrait BOOL,IN pluginAllowPhoneLandscape BOOL,IN pluginAllowTabletPortrait BOOL,IN pluginAllowTabletLandscape BOOL,
    IN isiphoneSupported BOOL,IN isipadSupported BOOL,IN isAndroidMobileSupported BOOL,IN isAndroidTabletSupported BOOL,IN isWindowsMobileSupported BOOL,
    IN isWindowsTabletSupported BOOL,IN isWindowsDesktopSupported BOOL,IN isWebBrowserSupported BOOL,IN maxWidth INT,IN minWidth INT, IN errorMSg VARCHAR(250),
    IN iosBottombarColor VARCHAR(20), IN androidBottombarColor VARCHAR(20), IN isPhoneLandscapeNotch BOOL, IN verifyDigest BOOL, IN showMultistepAuthScreen BOOL)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
  IF EXISTS (SELECT * FROM plugin_app WHERE plugin_id = pluginId AND channelid = chanId) THEN
    START TRANSACTION;
    
    -- Update plugin_app
    UPDATE plugin_app SET
      plugin_statusbar = pluginShowStatusbar,
      plugin_statusbar_bgcolor = pluginStatusbarColor,
      plugin_statusbar_style = pluginStatusbarStyle,
      plugin_theme_color=pluginCloseBtnColor,
      plugin_hide_close_btn = pluginHideCloseBtn,
      plugin_install_type = installType,
      admin_url = adminPanelUrl
    WHERE plugin_id = pluginId;

    IF EXISTS(SELECT * FROM plugin_app_setting WHERE plugin_id = pluginId AND channelid = chanId)THEN
      -- update
      UPDATE plugin_app_setting
      SET plugin_allow_text_copy = pluginAllowTextCopy , plugin_allow_screen_shot = pluginAllowScreenShot,allow_http=pluginAllowHttpServe,
      support_email = supportEmail, support_phone = supportPhone, IS_HIDDEN = hideApp, 
      is_phone_portrait=pluginAllowPhonePortrait , is_phone_landscape=pluginAllowPhoneLandscape,
      is_tablet_portrait=pluginAllowTabletPortrait, is_tablet_landscape=pluginAllowTabletLandscape,
      on_ios_mobile=isiphoneSupported, on_ios_tablet=isipadSupported, 
      on_android_mobile=isAndroidMobileSupported, on_android_tablet=isAndroidTabletSupported, 
      on_web_browser=isWebBrowserSupported,on_windows_mobile=isWindowsMobileSupported, 
      on_windows_tablet=isWindowsTabletSupported, on_windows_desktop=isWindowsDesktopSupported,allow_web_access=pluginAllowWebAccess,
      app_max_width=maxWidth,app_min_width=minWidth,app_min_width_msg=errorMSg,
      ios_bottombar_color = iosBottombarColor, android_bottombar_color = androidBottombarColor,is_phone_landscape_notch=isPhoneLandscapeNotch,
      verify_digest = verifyDigest, show_multistep_auth_screen = showMultistepAuthScreen
      WHERE plugin_id = pluginId AND channelid = chanId;
    ELSE
      -- insert
      INSERT INTO plugin_app_setting(plugin_id, channelid, plugin_allow_text_copy, plugin_allow_screen_shot,allow_http,
        support_email, support_phone, is_hidden,is_phone_portrait,is_phone_landscape,is_tablet_portrait,is_tablet_landscape,
        on_ios_mobile, on_ios_tablet, on_android_mobile, on_android_tablet, on_web_browser,
        on_windows_mobile, on_windows_tablet, on_windows_desktop,allow_web_access,app_min_width,app_max_width,app_min_width_msg,
        ios_bottombar_color, android_bottombar_color, is_phone_landscape_notch, verify_digest, show_multistep_auth_screen)
      VALUES(pluginId, chanId, pluginAllowTextCopy, pluginAllowScreenShot,pluginAllowHttpServe, supportEmail, supportPhone, hideApp,
       pluginAllowPhonePortrait , pluginAllowPhoneLandscape , pluginAllowTabletPortrait , pluginAllowTabletLandscape ,
       isiphoneSupported,isipadSupported, isAndroidMobileSupported , isAndroidTabletSupported,isWebBrowserSupported, isWindowsMobileSupported ,
       isWindowsTabletSupported , isWindowsDesktopSupported, pluginAllowWebAccess,minWidth,maxWidth,errorMSg ,iosBottombarColor,androidBottombarColor,isPhoneLandscapeNotch, verifyDigest, showMultistepAuthScreen);
    END IF;

      -- update plugin background upgrade only
    UPDATE plugin_app_version 
    SET 
    -- update_type = installType,
    web_access=pluginAllowWebAccess,
    plugin_web_url=packageWebUrl
    WHERE plugin_ver_id = (SELECT latest_version FROM plugin_app WHERE plugin_id = pluginId)
      AND plugin_id = pluginId;
     UPDATE actionbutton 
        INNER JOIN plugin_template_map on plugin_template_map.ab_id = actionbutton.abid
        INNER JOIN plugin_app on plugin_app.plugin_id = plugin_template_map.plugin_id
        SET actionbutton.modify_date = NOW() 
        WHERE plugin_app.plugin_id = pluginId;
    COMMIT;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v8_saveAPISubCategorydetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE PROCEDURE `v8_saveAPISubCategorydetails`(IN channelId INT, IN catId INT, IN subCatId INT, IN catName TEXT, IN catMethod TEXT, IN pluginId INT)
BEGIN
	DECLARE sub_cat_id INT DEFAULT 0;
    DECLARE duplicate_name_count INT DEFAULT 0;
    DECLARE duplicate_cat_plugin_id INT DEFAULT 0;
 
	IF EXISTS (SELECT * FROM api_category WHERE channel_id = channelId AND api_category_id = catId) then
		-- subcat is zero it means we need to create it
		IF (subCatId = 0) THEN
			-- Checking with Plugin_id 0 and actual plugin_id so that our subcategory name should not be same 
			-- as global subcat name also.. In different channel it can be same but not in channel and global subcat
			SELECT 1, plugin_id, sub_category_id from api_sub_category WHERE category_id = catId AND sub_category_name = catName AND (plugin_id = pluginId OR plugin_id = 0) AND isDeleted = 0  LIMIT 1 INTO duplicate_name_count,duplicate_cat_plugin_id,sub_cat_id;
			IF duplicate_name_count = 0 THEN
				INSERT INTO `api_sub_category` (`sub_category_name`,`category_id`, `sub_category_method`, `plugin_id`, `format_id`)
				VALUES (catName, catId, catMethod, pluginId, uuid());
				SELECT LAST_INSERT_ID() INTO sub_cat_id;
				-- name is duplicate so we can't create it
			-- ELSEIF (duplicate_cat_plugin_id = pluginId) THEN
				-- SELECT 0 INTO duplicate_name_count;
			END IF;
		-- subcat id is greater than zero it means we need to update existing subcategory
		ELSE
			-- We can remove plugin_id check as some old local subcategories were created as plugin_id during import
			-- So when user saving it again it will pass with actual plugin_id so will be updated properly
			IF EXISTS(SELECT 1 FROM api_sub_category WHERE category_id = catId AND sub_category_id = subCatId AND isDeleted = 0) THEN
				UPDATE api_sub_category SET
					sub_category_name = catName,
					sub_modify_on = CURRENT_TIMESTAMP,
					sub_category_method = catMethod,
					plugin_id = pluginId
					WHERE category_id = catId AND sub_category_id = subCatId;
				SELECT subCatId INTO sub_cat_id;
			END IF;
		END IF;
   END IF;
   SELECT sub_cat_id AS 'sub_cat_id', duplicate_name_count AS 'isDuplicate';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `v9_diy_GetCatAPILIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `v9_diy_GetCatAPILIST`(IN chanId INT, IN globalChannelId INT, IN pluginId INT)
BEGIN
SELECT api_category_id, cat_name, cat_desc, cat_image_url, scheme_type, channel_id, create_on, created_by, updated_on, cat_type, 
		sub_category_id, sub_category_name, sub_category_desc,sub_created_on,sub_modify_on ,category_id, sub_category_method,
        IF(channel_id = globalChannelId, 1, 0) isGlobal,
        IF(channel_id = chanId, 1, 0) isEditable,
		isCatPublic, isSubCatPublic, ac.isInstalled, asu.plugin_id, asu.isSubCatInstalled, ac.format_id, asu.format_id as subCat_format_id
	FROM api_category ac
	LEFT JOIN api_sub_category asu 
    ON asu.category_id=ac.api_category_id AND asu.isDeleted = 0 AND (asu.plugin_id = 0 OR asu.plugin_id = pluginId)
    WHERE ac.isDeleted = 0 AND ((channel_id = globalChannelId AND (isCatPublic = 1 && isSubCatPublic = 1)) or channel_id=chanId );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 13:22:22
