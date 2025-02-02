-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` tinyint(4) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `codename` varchar(29) DEFAULT NULL,
  `name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_contenttype','Can add content type'),(18,5,'change_contenttype','Can change content type'),(19,5,'delete_contenttype','Can delete content type'),(20,5,'view_contenttype','Can view content type'),(21,6,'add_session','Can add session'),(22,6,'change_session','Can change session'),(23,6,'delete_session','Can delete session'),(24,6,'view_session','Can view session'),(25,7,'add_drug','Can add drug'),(26,7,'change_drug','Can change drug'),(27,7,'delete_drug','Can delete drug'),(28,7,'view_drug','Can view drug'),(29,8,'add_userprofile','Can add user profile'),(30,8,'change_userprofile','Can change user profile'),(31,8,'delete_userprofile','Can delete user profile'),(32,8,'view_userprofile','Can view user profile'),(33,9,'add_inventoryitem','Can add inventory item'),(34,9,'change_inventoryitem','Can change inventory item'),(35,9,'delete_inventoryitem','Can delete inventory item'),(36,9,'view_inventoryitem','Can view inventory item'),(37,10,'add_order','Can add order'),(38,10,'change_order','Can change order'),(39,10,'delete_order','Can delete order'),(40,10,'view_order','Can view order'),(41,11,'add_orderitem','Can add order item'),(42,11,'change_orderitem','Can change order item'),(43,11,'delete_orderitem','Can delete order item'),(44,11,'view_orderitem','Can view order item'),(45,12,'add_inventoryitemdispensed','Can add inventory item dispensed'),(46,12,'change_inventoryitemdispensed','Can change inventory item dispensed'),(47,12,'delete_inventoryitemdispensed','Can delete inventory item dispensed'),(48,12,'view_inventoryitemdispensed','Can view inventory item dispensed'),(49,13,'add_donation','Can add donation'),(50,13,'change_donation','Can change donation'),(51,13,'delete_donation','Can delete donation'),(52,13,'view_donation','Can view donation'),(53,14,'add_donationrequest','Can add donation request'),(54,14,'change_donationrequest','Can change donation request'),(55,14,'delete_donationrequest','Can delete donation request'),(56,14,'view_donationrequest','Can view donation request');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` tinyint(4) DEFAULT NULL,
  `password` varchar(88) DEFAULT NULL,
  `last_login` varchar(10) DEFAULT NULL,
  `is_superuser` tinyint(4) DEFAULT NULL,
  `username` varchar(14) DEFAULT NULL,
  `last_name` varchar(7) DEFAULT NULL,
  `email` varchar(24) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_joined` varchar(10) DEFAULT NULL,
  `first_name` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$K6z84M3MbaHkJLX0quWfbp$nQLh786npbbWDwDGg4Qi9dq3HSCZKCdsWvCaOgZy7ZY=','2025-02-01',1,'admin','','ahmedmagdy92@yahoo.com',1,1,'2024-11-21',''),(2,'pbkdf2_sha256$600000$aDn6FwuwdoamJnul0Q0wEH$+BV6jYpBUEYC5mCm+JSjgD9J+tbKgVFmw767PUVR0bI=','2025-02-01',0,'ahmed.hefny','Hefny','ahmed.hefny@gmail.com',1,1,'','Ahmed'),(3,'pbkdf2_sha256$600000$YYPsQekEqoCwdAnMGKWIp3$NH73QC+Hmi2liQrSDWwJ8v5tcgCugkhKzRs3dVODFd8=','2025-02-01',0,'ahmed.magdy','Magdy','blackarc.001@gmail.com',0,1,'2025-01-05','Ahmed'),(4,'Password.1','',0,'bassem.hussein','Hussein','bassem.hussein@gmail.com',0,1,'2025-01-28','Bassem');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` tinyint(4) DEFAULT NULL,
  `object_id` tinyint(4) DEFAULT NULL,
  `object_repr` varchar(35) DEFAULT NULL,
  `action_flag` tinyint(4) DEFAULT NULL,
  `change_message` varchar(89) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `action_time` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,2,'ahmed.hefny',1,'[{\"added\": {}}]',4,1,'2024-11-26'),(2,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"Photo\", \"Address\", \"Phone number\", \"Gender\", \"Role\"]}}]',8,1,'2024-11-26'),(3,2,'ahmed.hefny',2,'[]',8,1,'2024-11-26'),(4,12,'XEMOSE CLEANSING SYNDET 200ML | 123',2,'[{\"changed\": {\"fields\": [\"Expiry date\"]}}]',9,1,'2024-12-01'),(5,1,'Order object (1)',3,'',10,1,'2024-12-07'),(6,2,'Order object (2)',3,'',10,1,'2024-12-07'),(7,2,'UserProfile object (2)',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',8,1,'2024-12-08'),(8,2,'UserProfile object (2)',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',8,1,'2024-12-08'),(9,1,'UserProfile object (1)',2,'[{\"changed\": {\"fields\": [\"Photo\", \"Address\", \"Phone number\", \"Gender\", \"Role\", \"User\"]}}]',8,1,'2024-12-08'),(10,1,'UserProfile object (1)',1,'[{\"added\": {}}]',8,1,'2024-12-08'),(11,1,'UserProfile object (1)',2,'[]',8,1,'2024-12-08'),(12,2,'UserProfile object (2)',1,'[{\"added\": {}}]',8,1,'2024-12-08'),(13,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1,'2024-12-09'),(14,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1,'2024-12-09'),(15,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1,'2024-12-09'),(16,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1,'2025-01-03'),(17,2,'ahmed.hefny',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1,'2025-01-04'),(18,3,'ahmed.magdy',2,'[{\"changed\": {\"fields\": [\"Address\", \"Phone number\", \"Role\"]}}]',8,1,'2025-01-05'),(19,1,'Concor 5 plus',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',13,1,'2025-01-06'),(20,1,'Concor 5 plus',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1,'2025-01-06'),(21,1,'Concor 5 plus',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1,'2025-01-06'),(22,1,'DonationRequest object (1)',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',14,1,'2025-01-09'),(23,1,'DonationRequest object (1)',2,'[{\"changed\": {\"fields\": [\"Comment\"]}}]',14,1,'2025-01-09'),(24,5,'5',3,'',8,1,'2025-02-01');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` tinyint(4) DEFAULT NULL,
  `app_label` varchar(12) DEFAULT NULL,
  `model` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'donations','donation'),(14,'donations','donationrequest'),(9,'inventory','inventoryitem'),(12,'inventory','inventoryitemdispensed'),(10,'orders','order'),(11,'orders','orderitem'),(7,'products','drug'),(6,'sessions','session'),(8,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` tinyint(4) DEFAULT NULL,
  `app` varchar(12) DEFAULT NULL,
  `name` varchar(63) DEFAULT NULL,
  `applied` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-21'),(2,'auth','0001_initial','2024-11-21'),(3,'admin','0001_initial','2024-11-21'),(4,'admin','0002_logentry_remove_auto_add','2024-11-21'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-21'),(6,'contenttypes','0002_remove_content_type_name','2024-11-21'),(7,'auth','0002_alter_permission_name_max_length','2024-11-21'),(8,'auth','0003_alter_user_email_max_length','2024-11-21'),(9,'auth','0004_alter_user_username_opts','2024-11-21'),(10,'auth','0005_alter_user_last_login_null','2024-11-21'),(11,'auth','0006_require_contenttypes_0002','2024-11-21'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-21'),(13,'auth','0008_alter_user_username_max_length','2024-11-21'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-21'),(15,'auth','0010_alter_group_name_max_length','2024-11-21'),(16,'auth','0011_update_proxy_permissions','2024-11-21'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-21'),(18,'products','0001_initial','2024-11-21'),(19,'products','0002_rename_inventory_id_id_orderitem_inventory_id','2024-11-21'),(20,'products','0003_remove_drug_contradiction_remove_drug_indication_and_more','2024-11-21'),(21,'products','0004_remove_order_created_by_remove_order_dispensed_by_and_more','2024-11-21'),(22,'inventory','0001_initial','2024-11-21'),(23,'orders','0001_initial','2024-11-21'),(24,'sessions','0001_initial','2024-11-21'),(26,'users','0002_userprofile_user_id','2024-11-21'),(27,'users','0003_alter_userprofile_gender_alter_userprofile_role','2024-11-26'),(28,'inventory','0002_rename_price_inventoryitem_pharmacist_price_and_more','2024-11-27'),(29,'inventory','0003_alter_inventoryitem_id','2024-11-29'),(30,'products','0005_drug_img','2024-12-05'),(31,'orders','0002_orderitem_drug_id_alter_orderitem_inventory_id','2024-12-07'),(32,'orders','0003_alter_order_dispensed_by_alter_order_order_date','2024-12-07'),(33,'orders','0004_alter_order_dispensed_by_alter_order_status_and_more','2024-12-07'),(34,'orders','0005_alter_orderitem_drug_id','2024-12-07'),(35,'users','0004_remove_userprofile_user_id_userprofile_user_and_more','2024-12-08'),(36,'products','0006_alter_drug_img','2024-12-08'),(37,'users','0005_alter_userprofile_photo','2024-12-08'),(38,'users','0001_initial','2024-12-08'),(39,'users','0002_alter_userprofile_user','2024-12-08'),(40,'orders','0002_order_created_at_order_updated_at','2024-12-09'),(41,'orders','0003_alter_orderitem_order_id','2024-12-10'),(42,'orders','0004_remove_order_created_at','2024-12-10'),(43,'inventory','0002_inventoryitemdispensed','2024-12-12'),(44,'orders','0005_alter_orderitem_inventory_id','2024-12-12'),(45,'inventory','0003_remove_inventoryitemdispensed_batch_no_and_more','2024-12-12'),(46,'inventory','0004_alter_inventoryitemdispensed_dispensed_by','2024-12-22'),(47,'orders','0006_order_comment','2024-12-24'),(48,'orders','0007_remove_orderitem_inventory_id','2024-12-25'),(49,'users','0003_alter_userprofile_gender','2025-01-03'),(50,'donations','0001_initial','2025-01-05'),(51,'donations','0002_alter_donation_status_donationrequest','2025-01-06'),(52,'donations','0003_remove_donationrequest_image_and_more','2025-01-06'),(53,'donations','0004_alter_donation_received_by_alter_donation_status','2025-01-06'),(54,'donations','0005_alter_donationrequest_status','2025-01-06'),(55,'donations','0006_donationrequest_comment','2025-01-09'),(56,'donations','0007_donationrequest_created_at_and_more','2025-01-09'),(57,'donations','0008_alter_donationrequest_status','2025-02-01'),(58,'inventory','0005_inventoryitem_created_at_inventoryitem_updated_at','2025-02-01');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(32) DEFAULT NULL,
  `session_data` varchar(228) DEFAULT NULL,
  `expire_date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wmakqe0akat7qqo39tt4uuv1h2eq92yd','.eJxVjMsOwiAQRf-FtSFAeVSX7vsNZAZmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXocXpd0NID6o7yHeotyZTq-syo9wVedAup5bpeT3cv4MCvXxry4DWOOds4BzS6IgcD4opZM04GO1TYouaiPNoFOJ5IGCrtEUVvPfi_QECyziP:1tE86j:6Aq-hpQb3q-WTwtR3ufDAYda-EG-ffCydIcOCmv8ppQ','2024-12-05'),('nvbdwhil8dlm1qxpfr7uaj6mnshp07b8','.eJxVjMsOwiAQRf-FtSFAeVSX7vsNZAZmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXocXpd0NID6o7yHeotyZTq-syo9wVedAup5bpeT3cv4MCvXxry4DWOOds4BzS6IgcD4opZM04GO1TYouaiPNoFOJ5IGCrtEUVvPfi_QECyziP:1tKl6A:JeKAA1W4DSgaHpTBQoUUGTBQoF6n7bR_lrTbVVbOzw4','2024-12-23'),('lt09th0kuy06qa6v4422sonz543ofnhe','.eJxVjMsOwiAQRf-FtSFAeVSX7vsNZAZmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXocXpd0NID6o7yHeotyZTq-syo9wVedAup5bpeT3cv4MCvXxry4DWOOds4BzS6IgcD4opZM04GO1TYouaiPNoFOJ5IGCrtEUVvPfi_QECyziP:1tLq9J:GoczYJQhO8amZdHjneHza-2cGCG3tJlb7FhB8qKGWMg','2024-12-26'),('nu5cjt8xlhmz7p88dgbwabrfhlsrnw3l','.eJxVjMsOwiAQRf-FtSFAeVSX7vsNZAZmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXocXpd0NID6o7yHeotyZTq-syo9wVedAup5bpeT3cv4MCvXxry4DWOOds4BzS6IgcD4opZM04GO1TYouaiPNoFOJ5IGCrtEUVvPfi_QECyziP:1tMuqt:Z13Pkvg-yp4iyAyMwPusVjwASbV2ltDEVawk8VcsqvQ','2024-12-29'),('rl7q9bgzyj86ykintctmgdymmx2jd8sw','.eJxVjMsOwiAQRf-FtSFAeVSX7vsNZAZmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXocXpd0NID6o7yHeotyZTq-syo9wVedAup5bpeT3cv4MCvXxry4DWOOds4BzS6IgcD4opZM04GO1TYouaiPNoFOJ5IGCrtEUVvPfi_QECyziP:1tPSY6:0mR_cJlKq2ZU1p4AZP75jA-Ja7vGRccWrZ6iKXf2r1w','2025-01-05'),('m7t7qo217hdelmwfptltzls3cpsfd26b','.eJxVjDkOwjAURO_iGlk_8UYo6TmD5b8YB5AjxUmFuDuJlALKmfdm3iqmdSlxbTLHkdVFder022Gip9Qd8CPV-6Rpqss8ot4VfdCmbxPL63q4fwcltbKt0TjpKWdnORgwZ7YMKI4GQtMBcfADBrBeLGPOwcIWghAk10POxqvPF_W1OCk:1tPbOD:hX27XRH8OjeLToFkc8OOwbM3_GEEsTNEn0H1NyebWzg','2025-01-06'),('o4sbelyj21a4bbuumm19b5kmzsvhor1i','.eJxVjDsOwyAQBe9CHSFgzQIp0_sMiOUTnERYMnYV5e6xJRdJ-2bmvZkP21r91vPip8SuTLHL70YhPnM7QHqEdp95nNu6TMQPhZ-083FO-XU73b-DGnrdayKrtLUqKT3oKI0rRTkQJiIW4Qh2Ek3GKAZKiASQpC4SCiBCydaxzxfL-jdb:1tTqCb:RRPRTO0ym75E6qa3RX4U6PwsvpGZl_iOeZbtluzFDsQ','2025-01-17'),('1bbtxehzlnw9d859v47ryy2wwqqzyrw8','.eJxVjMEOwiAQRP-FsyEtygIevfcbyLILUjWQlPZk_Hdp0oNe5jDvzbyFx23Nfmtx8TOLqxjF6bcLSM9YdsAPLPcqqZZ1mYPcFXnQJqfK8XU73L-DjC33dUqoBzobA6R0Qk4uxMD6Ao6sYRdBsyEcegDrUSltXMdgnTXgbGDx-QIJtzhl:1tU0IT:bicugwQjTgK7Z6RlqOHoy3YqTeXqBxRJJqclUagpaaI','2025-01-18'),('r414lg8cl2ez1cibb3mk44pfmaoprq1p','.eJxVjMEOwiAQRP-FsyEtygIevfcbyLILUjWQlPZk_Hdp0oNe5jDvzbyFx23Nfmtx8TOLqxjF6bcLSM9YdsAPLPcqqZZ1mYPcFXnQJqfK8XU73L-DjC33dUqoBzobA6R0Qk4uxMD6Ao6sYRdBsyEcegDrUSltXMdgnTXgbGDx-QIJtzhl:1tU295:43dDMRMqXshXPuRuwJ9MDnAtVJq39L9cmeG9GHKYyjo','2025-01-18'),('iwjyx7mx3uz8fs8f0m8wpyu7n6hy7uzn','.eJxVjEEOwiAQRe_C2pBhKEVcuu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERSpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9_aJQR2hoZsFRtMlBw7IIdoGHI2yujREgaiPA4MOoO1OWhSYPFMNor3B-i7N_k:1tUtvq:9N5uSAAUbrsMwax2ywILOpqbYuhFpKUhdFvlF8BAhUM','2025-01-20'),('ooalz8zvtpl7xxy3f0te73m4o9aswqe2','.eJxVjEEOwiAQRe_C2pBhKEVcuu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERSpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9_aJQR2hoZsFRtMlBw7IIdoGHI2yujREgaiPA4MOoO1OWhSYPFMNor3B-i7N_k:1tUuKE:ebl5m04_TuVnFUvdgICuCHCiV5-qzuA7az_zaGbIGCM','2025-01-20'),('xmiq61uifxtk9tc8lwshcdxlcbkpo2hz','.eJxVjEEOwiAQRe_C2pBhKEVcuu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERSpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9_aJQR2hoZsFRtMlBw7IIdoGHI2yujREgaiPA4MOoO1OWhSYPFMNor3B-i7N_k:1tUvJ8:mVvqtcn8aYhwMrk5QT1miFWYQinln6zQipbqVBDPyHU','2025-01-20'),('nzueib75k97wsdq43fgy22zhyy5te8t0','.eJxVjEEOwiAQRe_C2pBhKEVcuu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERSpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9_aJQR2hoZsFRtMlBw7IIdoGHI2yujREgaiPA4MOoO1OWhSYPFMNor3B-i7N_k:1tW0OA:3NKTic5MCdj63stfTviFRXAWyqWMcI1wXKgqqgs43B0','2025-01-23'),('5gsgz2090hxwd9d25kcn8mboym673fd6','.eJxVjEEOwiAQRe_C2pBhKEVcuu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERSpx-t0DxwXUH6U711mRsdV3mIHdFHrTLqSV-Xg_376BQL9_aJQR2hoZsFRtMlBw7IIdoGHI2yujREgaiPA4MOoO1OWhSYPFMNor3B-i7N_k:1tXnYL:6Nha1DjxFvuIXy0S7eJG5UPUaSpVEuOnvPxetdy-qCQ','2025-01-28'),('sxet1niphlnzwxidhv1iur2o7935793f','.eJxVjMsOgyAUBf-FdUMMXAW67L7fQO4Dim2DiejK9N-riYt2e2bmbCriupS4tjTHUdRVGXX53Qj5leoB5In1MWme6jKPpA9Fn7Tp-yTpfTvdv4OCrew1EiQEFgecc8Des6fgsx2AXCcWOnDgAfpsUiYACdZZS85YpIF3rD5f_OY32w:1tXnlA:F9lqFDeyq5BzsLyh_KyRk08xUqi9tnzd7P7T6cb5oVw','2025-01-28'),('8l1qibg23g49qwdtdz34aerxod9pb8a3','.eJxVjDsOwjAQBe_iGlkb__BS0ucMlr3r4ACypTipEHeHSCmgfTPzXiLEbS1h63kJM4uL0OL0u6VIj1x3wPdYb01Sq-syJ7kr8qBdjo3z83q4fwcl9vKtISEltOg9M9FAfjCG2AEAGa2yRVCJARXRNEVmRJcJnEfrrbUaz-L9AeyiN7k:1tdZcK:vuhkMoBDXMMETfmjLJjnjozWHCspacrSMknQq3TXhC8','2025-02-13'),('nrgxgfgpqjjiah8nkq1hmhcke5s474pi','.eJxVjDsOwjAQBe_iGllk_YlNSZ8zWLveBQeQI8VJhbg7iZQC2pl5760SrktJa5M5jawuyqjTLyPMT6m74AfW-6TzVJd5JL0n-rBNDxPL63q0fwcFW9nWwWAgIsPWS4wOzgiuCyiQI2P2zHZjfOuZyDsi8KaPxoM1FiiSdOrzBfEFN_w:1tdyul:YTggeyxZ1nRC-zPp7CGgZttbtTXpJIZyhddi3hoEFSk','2025-02-14');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations_donation`
--

DROP TABLE IF EXISTS `donations_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donations_donation` (
  `id` tinyint(4) DEFAULT NULL,
  `product_name` varchar(23) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `comment` varchar(12) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `approved_by_id` varchar(1) DEFAULT NULL,
  `donated_by_id` tinyint(4) DEFAULT NULL,
  `received_by_id` varchar(0) DEFAULT NULL,
  `image` varchar(54) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations_donation`
--

LOCK TABLES `donations_donation` WRITE;
/*!40000 ALTER TABLE `donations_donation` DISABLE KEYS */;
INSERT INTO `donations_donation` VALUES (1,'Concor 5 plus',20,'Concor 5.',2,'2025-01-06','2025-01-06','3',2,'','donations/donated/8bd118da2bb74f94b3baeb2e9d404547.jpg'),(2,'Ferroglobin Syrup',3,'Donated Toda',2,'2025-01-06','2025-01-14','3',2,'','donations/donated/ec02ab80b47a4af0a20c53672a2641d2.jpg'),(3,'Lipicontrol 10/10mg FCT',20,'Good shape.',1,'2025-01-31','2025-01-31','',2,'','donations/donated/efb21144da2a49bdbbe60c3426bdac4d.jpg');
/*!40000 ALTER TABLE `donations_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations_donationrequest`
--

DROP TABLE IF EXISTS `donations_donationrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donations_donationrequest` (
  `id` tinyint(4) DEFAULT NULL,
  `donation_id` tinyint(4) DEFAULT NULL,
  `requested_by_id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `comment` varchar(12) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `attachment` varchar(57) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations_donationrequest`
--

LOCK TABLES `donations_donationrequest` WRITE;
/*!40000 ALTER TABLE `donations_donationrequest` DISABLE KEYS */;
INSERT INTO `donations_donationrequest` VALUES (1,1,2,5,0,'Need 5 boxes','2025-01-09','2025-01-14','donations/requested/5f93898032534c72a94d57af7b9b5d05.docx'),(2,2,2,1,3,'','2025-01-14','2025-01-14','donations/requested/9a4e39920f844a32bee26120d2de862e.docx');
/*!40000 ALTER TABLE `donations_donationrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_inventoryitem`
--

DROP TABLE IF EXISTS `inventory_inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_inventoryitem` (
  `id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `batch_no` mediumint(9) DEFAULT NULL,
  `pharmacist_price` decimal(5,2) DEFAULT NULL,
  `public_price` decimal(5,2) DEFAULT NULL,
  `manufacturing_date` varchar(0) DEFAULT NULL,
  `expiry_date` varchar(0) DEFAULT NULL,
  `created_by_id` tinyint(4) DEFAULT NULL,
  `drug_id_id` tinyint(4) DEFAULT NULL,
  `created_at` varchar(10) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_inventoryitem`
--

LOCK TABLES `inventory_inventoryitem` WRITE;
/*!40000 ALTER TABLE `inventory_inventoryitem` DISABLE KEYS */;
INSERT INTO `inventory_inventoryitem` VALUES (1,0,24123,50.00,100.00,'','',1,2,'2025-02-01','2025-02-01'),(2,0,123,0.03,0.22,'','',1,2,'2025-02-01','2025-02-01'),(3,0,123,0.03,0.22,'','',1,2,'2025-02-01','2025-02-01'),(4,1,123,0.03,0.22,'','',1,3,'2025-02-01','2025-02-01'),(5,0,123,0.03,0.22,'','',1,1,'2025-02-01','2025-02-01'),(6,0,123,0.03,0.22,'','',1,3,'2025-02-01','2025-02-01'),(7,4,123,150.00,200.00,'','',1,2,'2025-02-01','2025-02-01'),(8,0,123,150.00,200.00,'','',1,3,'2025-02-01','2025-02-01'),(9,0,123,150.00,200.00,'','',1,4,'2025-02-01','2025-02-01'),(10,1,123,150.00,200.00,'','',1,3,'2025-02-01','2025-02-01'),(11,0,123,150.00,200.00,'','',1,3,'2025-02-01','2025-02-01'),(12,1,123,150.00,200.00,'','',1,2,'2025-02-01','2025-02-01');
/*!40000 ALTER TABLE `inventory_inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_inventoryitemdispensed`
--

DROP TABLE IF EXISTS `inventory_inventoryitemdispensed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_inventoryitemdispensed` (
  `id` tinyint(4) DEFAULT NULL,
  `dispensed_at` varchar(10) DEFAULT NULL,
  `dispensed_by_id` varchar(0) DEFAULT NULL,
  `inventory_item_id` tinyint(4) DEFAULT NULL,
  `order_id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_inventoryitemdispensed`
--

LOCK TABLES `inventory_inventoryitemdispensed` WRITE;
/*!40000 ALTER TABLE `inventory_inventoryitemdispensed` DISABLE KEYS */;
INSERT INTO `inventory_inventoryitemdispensed` VALUES (12,'2024-12-24','',5,3,2),(13,'2024-12-24','',1,3,2),(14,'2024-12-24','',2,3,2),(15,'2024-12-25','',3,4,2),(16,'2025-01-05','',4,5,2),(17,'2025-01-05','',6,5,2),(18,'2025-01-05','',8,5,2),(19,'2025-01-05','',11,5,1),(20,'2025-01-05','',9,6,1);
/*!40000 ALTER TABLE `inventory_inventoryitemdispensed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_order` (
  `id` tinyint(4) DEFAULT NULL,
  `order_date` varchar(0) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by_id` tinyint(4) DEFAULT NULL,
  `dispensed_by_id` tinyint(4) DEFAULT NULL,
  `updated_at` varchar(10) DEFAULT NULL,
  `comment` varchar(31) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (3,'',3,1,1,'2024-12-09','dispensed'),(4,'',3,1,1,'2024-12-09','villa borghini is out of stock.'),(5,'',3,2,3,'2025-01-05',''),(6,'',3,2,3,'2025-01-05','');
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_orderitem` (
  `id` tinyint(4) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `drug_id` tinyint(4) DEFAULT NULL,
  `order_id_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
INSERT INTO `orders_orderitem` VALUES (1,2,1,3),(2,4,2,3),(3,2,1,4),(4,5,2,4),(5,4,3,5),(6,5,3,5),(7,1,4,6);
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_drug`
--

DROP TABLE IF EXISTS `products_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_drug` (
  `id` mediumint(9) DEFAULT NULL,
  `name` varchar(114) DEFAULT NULL,
  `active_ingrendients` text,
  `company` varchar(143) DEFAULT NULL,
  `data` text,
  `group` text,
  `price` decimal(8,2) DEFAULT NULL,
  `route` varchar(11) DEFAULT NULL,
  `img` varchar(26) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_drug`
--

LOCK TABLES `products_drug` WRITE;
/*!40000 ALTER TABLE `products_drug` DISABLE KEYS */;
INSERT INTO `products_drug` VALUES (1,'VILLA BORGHINI ANTI-DANDRUFF SOLUTION 6 MONO-DOSE*15ML','.','VILLA BORGHINI S.R.L > SPRING','DESCRIPTION\r\nANTI-DANDRUFF SOLUTION WAS MADE BY OUR RESEARCH LABORATORIES AND TESTED IN UNIVERSITY SEAT COMPARING SCIENTIFIC BEFORE/AFTER INSTRUMENTAL DATA   SHOWING AN IMMEDIATE CLINICAL EFFECTIVENESS ON DRY   GREASY AND MIXED DANDRUFF ALSO ACCOMPANIED BY ITCHING   DESQUAMATIONS   ERYTHEMA AND DRYNESS OF THE SCALP.\r\nITS USE AFTER ANY CHEMICAL TREATMENT SUCH AS COLOURING   PERM OR STRAIGHTENING   RESTORES THE SCALP TROPISM.\r\n\r\nANTI-DANDRUFF SOLUTION 6 X 15 ML\r\nUSE\r\nTO OBTAIN A PERFECT RESULT   MAKE A FIRST CAREFUL HAIR WASHING AND AFTER RINSING   BLOT THE WATER EXCESS.\r\nSHAKE WELL THE SOLUTION AND WITH THE SPECIAL DROPPER DISTRIBUTE EVENLY THE  WHOLE MONO-DOSE OF 15 ML ON THE SCALP.\r\nLEAVE IN FOR ABOUT 6 MINUTES   RINSE-OFF AND MAKE THE SECOND HAIR WASHING.\r\nANTI-DANDRUFF SOLUTION IS COMPATIBLE WITH ALL VB RANGE SHAMPOOS.','HAIR CARE',149.00,'INJECTION','drug_pics/drug_default.png'),(2,'XEMOSE CLEANSING SYNDET 200ML','','URIAGE DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','ALL DRY SKIN.\r\n    SKIN PRONE TO ATOPY.\r\n    BABIES   CHILDREN   ADULTS.\r\n    FACE AND BODY.\r\n\r\nPROPERTIES\r\nXEMOSE GENTLE CLEANSING SYNDET IS A VERY GENTLE CLEANSING CREAM-GEL TO PROVIDE SAFE AND SOFT HYGIENE FOR DAILY USE.\r\nTHE URIAGE THERMAL WATER   NATURALLY RICH IN MINERAL SALTS AND TRACE ELEMENTS   ASSOCIATED WITH CERASTEROL-2F� AND WITH SPECIFIC SUPER-FATTING AGENTS PROTECT FROM THE DRYING EFFECT OF THE WATER THANKS TO THEIR MOISTURIZING AND SOOTHING PROPERTIES.\r\n\r\nASSETS\r\n\r\n    SMOOTH AND SOOTHING DAILY HYGIENE.\r\n    LEAVES THE SKIN SOFT AND SUPPLE.\r\n    UNIQUE FORMULA: URIAGE THERMAL WATER + CERASTEROL-2F�.\r\n    VERY SMOOTH CREAM-GEL TEXTURE   EASY TO RINSE.\r\n    CONVENIENT PUMP BOTTLE.\r\n    FRAGRANCE-FREE - SOAP-FREE - PARABEN-FREE - PHYSIOLOGICAL PH.\r\n\r\n\r\nINSTRUCTIONS FOR USE\r\nLATHER UP WITH WATER THEN RINSE.\r\nDAILY USE.','SKIN CARE',175.00,'TOPICAL','drug_pics/drug_default.png'),(3,'ZINCOLIVE LOTION 60 ML (N/A)','OLIVE OIL+ZINC OXIDE','PHILO PHARM','for napkin rash and sun protection','SOOTHING TOPICAL',7.00,'UNKNOWN','drug_pics/drug_default.png'),(4,'ZINCOFACT CREAM 50 GM','CALENDULA OIL+CHAMOMILE OIL+HONEY+CHLORHEXIDINE+TRICLOSAN+ZINC OXIDE','EL-HELOU PERFUMES & COSMETICS > MEDIFACT GROUP','SKIN EMOLLIENT CREAM','MOISTURIZING TOPICAL',20.00,'TOPICAL','drug_pics/drug_default.png'),(5,'ZEINA VAG.DOUCHE 150 ML','VAGINAL DOUSHE FORMULA','HI-CARE > CHEMI HEALTH','','VAGINAL DOUCHE',13.75,'VAGINAL','drug_pics/drug_default.png'),(6,'ZONE CREAM 50 GM','STEARIC ACID+ASCORBIC ACID+CHAMOMILE EXTRACT+PROPYLENE GLYCOL','EGYPTIAN COMPANY FOR COSMETICS','WHITENING CREAM','WHITENING CREAM',50.00,'TOPICAL','drug_pics/drug_default.png'),(7,'ZINCOPAN CREAM 60 GM','ZINC OXIDE+PANTHENOL+DIMETHICONE(350)+BISABOLOL+CETRIMIDE','LEADER COSMETICS > LEADERS PHARM','EMOLLIENT   MOISTURIZER AND SOOTHING SKIN CARE CREAM','SKIN CARE.MOISTURIZING',11.95,'TOPICAL','drug_pics/drug_default.png'),(8,'ZINCODERM TOPICAL LOTION 120ML','ZINC OXIDE+THYME EXTRACT+CHAMOMILE EXTRACT+GLYCERIN+CETRIMIDE+VITAMIN E','HI-CARE > PIXEL','local anti-pruritic and soothing agent that relieves skin irritations  sweat rash  sun burns  insect bites  skin urticaria & itching.','SKIN CARE.SOOTHING',20.00,'UNKNOWN','drug_pics/drug_default.png'),(9,'ZONDEX GEL 75 GM','GLAUTHERIA OIL+WILLOW BARK EXTRACT+EUCALYPTUS OIL+TURPENTINE OIL+THYME OIL','LEADER COSMETICS > AVEX PHARMA','massage gel','MASSAGE CREAM',27.50,'TOPICAL','drug_pics/drug_default.png'),(10,'ZEROL CREAM 40 GM','SILICON FLUID+DIMETHICONE+HYDROPHILIC ONION EXTRACT+EMU OIL+COCOA BUTTER+BEES WAX+ALMOND OIL+LIQUID','MACRO GROUP PHARMACEUTICALS','*specialized cream for management of keloids & hypertrophic scars with extra moisturizing properties^*helps in softening  smoothing and flattening new and old hypertrophic scars and keloids resulting after laser resurfacing& surgeries.^*helps in relieving new & old scars itching  redness & tenderness.^^how to use^^- zerol cream should be applied on the scar only once the wound is closed (approximately used after 7-10 days after wound occurrence).^^- apply suitable amount of zerol cream on the scar twice daily for 2-6 months or. until the scar has almost disappeared.','SKIN CARE.HEALING',80.00,'TOPICAL','drug_pics/drug_default.png'),(11,'WHITE OBJECTIVE LIGHTENING CREAM DAY CARE 30ML','','BIODERMA DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','LIGHTENING DAY CARE ANTI-BROWN SPOTS THAT RESPECTS SENSITIVE SKINS.\r\n� WHITE OBJECTIVE ACTIVE CREAM WITH PATENTED W.O.� COMPLEX   CLEARS   EVENS AND ENHANCES THE COMPLEXION. IT HELPS TO ELIMINATE BROWN SPOTS AND PREVENTS THEIR REAPPEARANCE.\r\nWHITE OBJECTIVE ACTIVE CREAM IS SPECIALLY FORMULATED TO RESPECT THE MOST SENSITIVE SKINS.\r\n\r\n� VITAMIN C   RELEASED GRADUALLY FOR LONG-TERM EFFECTIVENESS   CUTS DOWN THE NUMBER OF MELANIN PIGMENTS IN THE EPIDERMIS   REDUCING EXISTING HYPERPIGMENTATION AND HELPING PREVENT FUTURE PIGMENTATION.\r\n\r\n� BIODERMA INNOVATION   THE PATENTED W.O.� WORKS ON THE MAIN MECHANISMS THAT CAUSE SKIN PIGMENTATION. THE ORIGINAL NATURE OF THIS MULTI-TARGET ATTACK ENSURES OPTIMUM LIGHTENING AND PREVENTIVE PERFORMANCE.\r\n\r\n� THE ANTI-UVA-UVB FILTERS PROTECT THE SKIN AGAINST THE SUN�S RAYS TO HELP PREVENT ANY NEW PIGMENTATION.\r\n\r\n� THE WHITE OBJECTIVE ACTIVE CREAM HAS A PLEASANT   LIGHT TEXTURE THAT IS COMPLETELY INVISIBLE AFTER APPLICATION. MAKE-UP CAN BE APPLIED AFTERWARDS.\r\nTHE','SKIN CARE',365.00,'TOPICAL','drug_pics/drug_default.png'),(12,'WINDY HAIR CREAM 50 GM','','EGPI > PURITY PHARMA','NOURISHES HAIR','HAIR CARE',32.00,'TOPICAL','drug_pics/drug_default.png'),(13,'NARATRIPTAN 2.5 MG 2 F.C. TABS.','NARATRIPTAN','CHANELLE PHARMACEUTICALS > DILIGENCE PHARMA','NARATRIPTAN IS A TRIPTAN DRUG USED FOR THE TREATMENT OF MIGRAINE HEADACHES. NARATRIPTAN IS AVAILABLE IN 2.5 MG TABLETS. IT IS A SELECTIVE 5-HT1 RECEPTOR SUBTYPE AGONIST.\r\n\r\nNARATRIPTAN IS USED FOR THE TREATMENT OF THE ACUTE MIGRAINE ATTACKS AND THE SYMPTOMS OF MIGRAINE   INCLUDING SEVERE   THROBBING HEADACHES THAT SOMETIMES ARE ACCOMPANIED BY NAUSEA AND SENSITIVITY TO SOUND OR LIGHT.','ANTIMIGRAINE.VASOCONSTRICTOR AGENTS.SELECTIVE SEROTONIN AGONIST',55.00,'ORAL.SOLID','drug_pics/drug_default.png'),(14,'WHITEX CREAM 50 GM','BEARBERRY EXTRACT+LIQUORICE EXTRACT+PARSELY EXTRACT+PARAFFIN OIL+ZINC OXIDE+CETYL ALCOHOL+STEARIC AC','EGYPTIAN COMPANY FOR COSMETICS > ARABIAN INTERNATIONAL GROUP (AIG)','WHITENING CREAM','WHITENING TOPICAL',35.00,'TOPICAL','drug_pics/drug_default.png'),(15,'WHITE OBJECTIVE CREME MOUSSANT ECLAIRCISSANTE 200ML','','BIODERMA DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','','SKIN CARE',235.00,'TOPICAL','drug_pics/drug_default.png'),(16,'XEMOSE CREAM 200 ML','','URIAGE DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','XEMOSE UNIVERSAL EMOLLIENT CREAM BENEFITS FROM THE LAST PATENTED DISCOVERY OF LABORATOIRES DERMATOLOGIQUES D�URIAGE   THE CERASTEROL - 2F WHICH RESTORES   REINFORCES DURABLY THE CUTANEOUS BARRIER AND SOOTHES THE IRRITATIONS OF THE DRIEST SKINS. ITS ASSOCIATION WITH URIAGE THERMAL WATER OFFERS HYDRATATION   SOOTHING AND REINFORCED PROTECTION.\r\n\r\nASSETS\r\n\r\n    EXCELLENT TOLERANCE.\r\n    PROVEN EFFICACY.\r\n    ADAPTED TEXTURE: RAPID SKIN PENETRATION   PLEASANT APPLICATION   NON-STICKY.\r\n    PRACTICAL PACKAGING IN PUMP BOTTLE.\r\n    FRAGRANCE-FREE � PARABEN-FREE.\r\n\r\n\r\nINSTRUCTIONS FOR USE\r\nUSE DAILY ON A CLEANSED SKIN.','SKIN CARE',275.00,'TOPICAL','drug_pics/drug_default.png'),(17,'WHITE SHADOW CREAM 25 GM','MELFADE+NATURAL THYMIC PEPTIDES+GLYCOSOMES+COPPER ION INACTIVATORS+TITANIUM DIOXIDE+VITAMIN A+VITAMI','MASH PREMIERE > CHALTON GROUP LTD.','whitening cream','SKIN CARE.WHITENING',27.30,'TOPICAL','drug_pics/drug_default.png'),(18,'X-DERM LOTION 60ML','GLYCERIN+CAMPHOR+MENTHOL+VITAMIN E+ZINC OXIDE+PROPYLENE GLYCOL+METHYL PARABEN','HI-CARE > FALCON GROUP','SOOTHING LOTION','SOOTHING TOPICAL',29.50,'UNKNOWN','drug_pics/drug_default.png'),(19,'WHITE OBJECTIVE LIGHTENING SERUM NIGHT CARE 30ML','','BIODERMA DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','THE INTENSIVE LIGHTENING NIGHT CARE ANTI-BROWN SPOTS THAT RESPECTS SENSITIVE SKINS.\r\n� WHITE OBJECTIVE SERUM   NIGHT CARE WITH THE PATENTED W.O.� COMPLEX   LIGHTENS   EVENS AND ILLUMINATES THE COMPLEXION. IT HELPS TO ELIMINATE BROWN SPOTS AND PREVENTS THEIR REAPPEARANCE.\r\n\r\n� VITAMIN C   RELEASED GRADUALLY FOR LONG-TERM EFFECTIVENESS   DECREASES THE NUMBER OF MELANIN PIGMENTS CONTAINED IN THE EPIDERMIS. THUS IT REDUCES EXISTING  HYPERPIGMENTATION AND PREVENTS FUTURE PIGMENTATION.\r\n\r\n� BIODERMA INNOVATION   THE PATENTED W.O.� WORKS ON THE MAIN MECHANISMS THAT CAUSE SKIN PIGMENTATION. THE ORIGINAL NATURE OF THIS MULTI-TARGET ATTACK ENSURES OPTIMUM LIGHTENING AND PREVENTIVE PERFORMANCE.\r\n\r\n� THE INTENSIVE �PEELING� ACTION OF GLYCOLIC ACID TRIGGERS THE ELIMINATION OF HEAVILY PIGMENTED CELLS   REDUCES THE INTENSITY OF THE BROWN SPOTS AND REVEALS A RADIANT FACE.\r\n\r\n� THE WHITE OBJECTIVE SERUM �GEL� TEXTURE IS PARTICULARLY PLEASANT AND REFRESHING.\r\nTHE SKIN IS LIGHTER   EVEN AND LUMINOUS.\r\n\r\nUSE:\r\n�','SKIN CARE',365.00,'TOPICAL','drug_pics/drug_default.png'),(20,'XEMOSE FACE CREAM 40 ML','','URIAGE DERMATOLOGICAL LABORATORIES > BIOTECH EGYPT','DRY   FRAGILE AND DELIPIDATED SKIN.\r\n    SKIN PRONE TO ATOPY.\r\n    BABIES   CHILDREN   ADULTS.\r\n\r\nPROPERTIES\r\nRICH IN URIAGE THERMAL WATER   KNOWN FOR ITS HYDRATING   SOOTHING AND ANTI-FREE RADICAL PROPERTIES   THIS CREAM NOURISHES THE SKINS THAT ARE DRY   FRAGILE AND DELIPIDATED.\r\nFORMULATED WITH CERASTEROL-2F� SOOTHES TINGLING SENSATIONS AND LASTINGLY RESTORES SKIN BARRIER.\r\nRICH AND CREAMY XEMOSE FACE CREAM INTENSELY RESTORES COMFORT   PREVENTS DRYNESS AND PROTECTS SKIN FROM OUTSIDE AGGRESSIONS.\r\n\r\nASSETS\r\n\r\n    EFFICACY PROVEN ON ATOPIC SKIN.\r\n    RICH AND CREAMY TEXTURE.\r\n    FRAGRANCE-FREE � PARABEN-FREE.\r\n\r\n\r\nINSTRUCTIONS FOR USE\r\nAPPLY MORNING AND EVENING TO A PERFECTLY CLEANSED FACE.','SKIN CARE',169.00,'TOPICAL','drug_pics/drug_default.png'),(21,'VILLA BORGHINI COLOUR PROTECTOR CREAM','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',175.00,'TOPICAL','drug_pics/drug_default.png'),(22,'VILLA BORGHINI GREASY HAIR SHAMPOO 200 ML','','VILLA BORGHINI S.R.L > SPRING','DESCRIPTION\r\nGREASY HAIR SHAMPOO THANKS TO THE COMBINATION OF SPECIFIC ACTIVE INGREDIENTS   CLEANS AND SANITIZES VERY DELICATELY ALL KIND OF HAIR AND SCALP EVEN THE MOST SENSITIVE ONES.\r\nTHE HAIR REMAIN CLEAN   SOFT AND BRIGHT FOR DAYS FROM THE FIRST APPLICATION.\r\nUSED IN SYNERGY WITH SEBO-BALANCE SOLUTION   IT EFFECTIVELY COMPLETES THE SEBO-BALANCE TREATMENT ACTION.\r\n\r\nGREASY HAIR SHAMPOO 200 ML\r\nUSE\r\nTHE PRODUCT IS FORMULATED WITHOUT PERFUMES   COLOURS AND THICKENING. FOR THIS REASON IT IS LIQUID IN ALL ITS PURITY.  IT IS SUGGESTED TO APPLY THE SHAMPOO DIRECTLY ON THE HAIR. \r\nTO OBTAIN A PERFECT RESULT MAKE TWO WASHES   MASSAGE UNTIL YOU GET A RICH LATHER AND RINSE-OFF PERFECTLY.','HAIR CARE',105.00,'TOPICAL','drug_pics/drug_default.png'),(23,'VILLA BORGHINI STYLING SHAMPOO','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',110.00,'TOPICAL','drug_pics/drug_default.png'),(24,'VILLA BORGHINI COLOUR PROTECTOR TREATMENT','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',259.00,'UNKNOWN','drug_pics/drug_default.png'),(25,'VARIO CREAM 60 GM','BEE PROBLIS+HONEY+DIMETHICONE+NIACINAMIDE+JOJOBA+ALOVERA+ALANTOIN','LEADER COSMETICS > NOVA PHARM','cream for healing','HEALING CREAM',19.00,'TOPICAL','drug_pics/drug_default.png'),(26,'VG-NORM VAG.DOUCHE 200ML','CHLORHEXIDINE+CHAMOMILE+ALOE VERA+THYME+CASEIN+ALUM+MENTHOL+GLYCERIN','HI-CARE > PIXEL','','VAGINAL CARE',23.00,'VAGINAL','drug_pics/drug_default.png'),(27,'VI SENSE SOAP 100 GM','TRICLOSAN+ZINC OXIDE+GLYCERIN','HI-CARE > PIXEL','emollient soap for sensitive skin','SKIN CARE',15.00,'SOAP','drug_pics/drug_default.png'),(28,'VILLA BORGHINI SEBO-BALANCE SERUM 6 MONO-DOSE*15ML','','VILLA BORGHINI S.R.L > SPRING','DESCRIPTION\r\nSEBO-BALANCE SOLUTION REGULATES THE FUNCTION OF THE SEBACEOUS GLANDS.\r\nITS CLINICAL EFFECTIVENESS HAS BEEN TESTED IN UNIVERSITY SEAT COMPARING SCIENTIFIC BEFORE/AFTER INSTRUMENTAL DATA AND THANKS TO THE HIGHLY FUNCTIONAL DOSAGE OF THE ACTIVE INGREDIENTS AND TO THEIR PERFECT SYNERGY HAS BEEN DEMONSTRATED TO RETURN IN NORMAL CONDITIONS PATIENTS AFFECTED BY SEBORRHEA   SEBORRHOIC DERMATITIS AND ITCHY SCALP.\r\nCOMBINED WITH GREASY HAIR SHAMPOO INTENSIFIES AND COMPLETES THE SEBO-BALANCE TREATMENT ACTION.\r\n\r\nSEBO-BALANCE SOLUTION 12 X 15 ML\r\nUSE\r\nTWICE A WEEK   AFTER PERFORMING THOROUGH CLEANSING OF THE HAIR   BLOT THE WATER EXCESS AND WITH THE SPECIAL DROPPER DISTRIBUTE EVENLY ON THE SCALP THE WHOLE MONO-DOSE OF 15 ML.\r\nDO NOT RINSE THE SOLUTION   IT IS RECOMMENDED TO WAIT ABOUT 2 MINUTES BEFORE BLOW DRYING. \r\nNOT GREASY   DOES NOT WEIGHT DOWN THE HAIR AND DRIES QUICKLY.','HAIR CARE',149.00,'INJECTION','drug_pics/drug_default.png'),(29,'VILLA BORGHINI EASY STRAIGHT SHAMPOO 200ML','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',110.00,'TOPICAL','drug_pics/drug_default.png'),(30,'VILLA BORGHINI REINTEGRATING MASK 200ML','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',175.00,'TOPICAL','drug_pics/drug_default.png'),(31,'VILLA BORGHINI VOLUME SHAMPOO','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',110.00,'TOPICAL','drug_pics/drug_default.png'),(32,'VILLA BORGHINI SEBUM EQUALIZING SOLUTION','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',149.00,'UNKNOWN','drug_pics/drug_default.png'),(33,'LIMITLESS OSSOFORTIN D3 (2000 I.U.) 30 TABS.','CHOLECALCIFEROL(VITAMIN D3)','EVA PHARMA','','VITAMIN D',54.00,'ORAL.SOLID','drug_pics/drug_default.png'),(34,'SOVALDI 400MG 28 TABLETS','SOFOSBUVIR','GILEAD SCIENCES > IBIS PHARMA','INDICATIONS AND USAGE:\r\nIT IS A HEPATITIS C VIRUS (HCV) NUCLEOTIDE ANALOG NS5B POLYMERASE INHIBITOR INDICATED FOR THE TREATMENT OF CHRONIC HEPATITIS C (CHC) INFECTION AS A COMPONENT OF A COMBINATION ANTIVIRAL TREATMENT REGIMEN.\r\n*EFFICACY HAS BEEN ESTABLISHED IN SUBJECTS WITH HCV GENOTYPE 1   2   3 OR 4 INFECTION   INCLUDING THOSE WITH HEPATOCELLULAR CARCINOMA MEETING MILAN CRITERIA (AWAITING LIVER TRANSPLANTATION) AND THOSE WITH HCV/HIV-1 CO-INFECTION.\r\n\r\n*DOSAGE AND ADMINISTRATION:\r\n*  ONE 400 MG TABLET TAKEN ONCE DAILY WITH OR WITHOUT FOOD.\r\n*  SHOULD BE USED IN COMBINATION WITH RIBAVIRIN OR IN COMBINATION WITH PEGYLATED INTERFERON AND RIBAVIRIN FOR THE TREATMENT OF CHC.\r\nRECOMMENDED COMBINATION THERAPY:\r\nHCV MONO-INFECTED AND HCV/HIV-1 CO-INFECTED\r\n  TREATMENT  DURATION\r\nGENOTYPE 1 OR 4  SOVALDI + PEG-INTERFERON ALFA + RIBAVIRIN   12 WEEKS\r\nGENOTYPE 2  SO','ANTI-VIRAL',14940.00,'ORAL.SOLID','drug_pics/drug_default.png'),(35,'VIVID CREAM 50 GM','LEMON EXTRACT+OLEANOLEK ACID+PROPOLIS+STEARIC ACID','EGYPTIAN COMPANY FOR COSMETICS > SP','FACE CREAM','SKIN CARE',44.00,'TOPICAL','drug_pics/drug_default.png'),(36,'WASH MIX MOUTH WASH 200ML','MOUTH WASH FORMULA','EGYPTIAN COMPANY FOR COSMETICS > PHARMIX','','ORAL CARE',12.50,'MOUTH','drug_pics/drug_default.png'),(37,'VOTA GEL 15 GM','VITAMIN E+MENTHOL CRYSTALS+L-ARGININE+METHYL NICOTINATE','AL ESRAA PHARMACEUTICAL OPTIMA','USED FOR PREMATURE EJACULATION','PREMATURE EJACULATION',38.00,'TOPICAL','drug_pics/drug_default.png'),(38,'VIVIDOL HAIR CREAM 100 GM','SILICON OIL+DIMETHICONE+PANTHENOL+TEA TREE OIL+CHAMOMILE OIL+ALMOND OIL+JOJOBA OIL+SUNFLOWER OIL+ERU','MACRO GROUP PHARMACEUTICALS','controls hair loss  brittleness and split ends','HAIR CARE',74.00,'TOPICAL','drug_pics/drug_default.png'),(39,'WASH MIX MOUTH SPRAY 60ML','COCAMIDO PROPYL BETAINE+CHLORHEXIDINE GLUCONATE+ETHANOL+SODIUM BENZOATE+CLOVE OIL+CHAMOMILE+MENTHOL+','EGYPTIAN COMPANY FOR COSMETICS > PHARMIX','','ORAL CARE',25.00,'MOUTH','drug_pics/drug_default.png'),(40,'VOREK CREAM 50 GM','ARNICA OIL+EMU OIL+PROPOLIS+AVOCADO OIL+CALENDULA EXTRACT+ALOE VERA EXTRACT','EL-HELOU PERFUMES & COSMETICS > DEVARTLAB PHARMA','#NAME?','SKIN CARE',24.00,'TOPICAL','drug_pics/drug_default.png'),(41,'WE.GEL GEL 25 GM','L-ARGININE+METHYL NICOTINATE+MENTHOL+VITAMINE E','LEADER COSMETICS > TOP Z','STERILE GEL THAT USED FOR PREMATURE EJACULATION AND HELPS MAINTAIN ERECTION','PERSONAL LUBRICANT',24.00,'TOPICAL','drug_pics/drug_default.png'),(42,'SETA CREAM 50 GM','UREA+LACTIC ACID+SALICYLIC ACID+SORBITOL+MOISTURIZING CREAM BASE','MACRO GROUP PHARMACEUTICALS','-SPECIALLY DESIGNED MOISTURIZING CREAM TO COUNTERACT SKIN DRYNESS (XEROSIS)   FLAKING   SCALING & CRACKING ESPECIALLY IN WINTER SEASON OR IN HOT SUMMER INTERVALS DUE TO OVER EXPOSURE TO SUN RAYS.\r\n-PROVIDES EXTRA EMOLLIENT EFFECT FOR DRY HANDS   ELBOWS   KNEES & HEELS.\r\n-HELPS IN SKIN CONDITIONS THAT IS CHARACTERIZED BY DRYNESS & SCALING LIKE ICHTYOSIS   PSORIASIS    ATOPIC DERMATITIS    ETC.\r\n\r\nAPPLY SUITABLE QUANTITY OF SETA CREAM ON THE AFFECTED AREA & MASSAGE GENTLY   2-3 TIMES DAILY TILL SYMPTOMS SUBSIDE.','MOISTURIZING TOPICAL',19.75,'TOPICAL','drug_pics/drug_default.png'),(43,'WHITE CREAM (NO-RASH) 100 GM','','EL-HELOU PERFUMES & COSMETICS > UNISWAB','FOR SKIN PROTECTION OF ALL FAMILY MEMBERS','SKIN CARE',24.00,'TOPICAL','drug_pics/drug_default.png'),(44,'VILLA BORGHINI SEBUM EQUALIZING TREATMENT','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',259.00,'UNKNOWN','drug_pics/drug_default.png'),(45,'VITAL HAIR OIL 60 ML','ERUCA OIL+JOJOBA OIL+NIGELLA OIL+GARLIC OIL+OLIVE OIL+SAW PALMETTO+VITAMIN A+VITAMIN E+THYME EXTRACT','HI-CARE > NP PHARMACEUTICALS','USES: HAIR FALL - HAIR DAMAGE - SPLIT ENDS - DRY HAIR','HAIR CARE',35.00,'UNKNOWN','drug_pics/drug_default.png'),(46,'VIOLA HAIR SERUM 120 ML','','LEADER COSMETICS > BEAUTY & BEYOND INTERNATIONAL','SUITABLE FOR ALL HAIR TYPES - CONTROL FRIZZ - DETANGLES HAIR - REPAIR DAMAGED HAIR','HAIR CARE',59.00,'UNKNOWN','drug_pics/drug_default.png'),(47,'VILLA BORGHINI RESTORING SHAMPOO','','VILLA BORGHINI S.R.L > SPRING','','HAIR CARE',105.00,'TOPICAL','drug_pics/drug_default.png'),(48,'VITO CARE N CREAM 100 GM','','LEADER COSMETICS > ET GROUP (EXTRA TECH)','NIGHT CREAM. EXTRA EMOLLIENT CREAM FOR SEVERE CRACKED SKIN','MOISTURIZING TOPICAL',79.90,'TOPICAL','drug_pics/drug_default.png'),(49,'VITISKIN REGULATING HYDROGEL 50ML','','ISIS PHARMA > BIOTECH EGYPT','*indications:^^pigmentation deficiency.^regulating depigmentation hydrogel^^*use^^apply vitiskin twice a day  on the morning and the evening  on the affected areas as well as on the contours of the lesions. avoid the eye area.^properties^^vitiskin makes it possible to re-balance skin cell metabolism thanks to its anti-oxidant  anti-radical and anti-inflammatory agents:^1. superoxide dismutase dismutin-bt: anti-radical and anti-inflammatory activity  inhibition of lipid peroxidation^2. copper and zinc: tyrosinase co-factor (cu) and preservation from oxidative damages^3. vitamin b12: acts on the synthesis of melanin indispensable to the metabolism^4. calcium panthotenate: vitamin acting on the synthesis of melanin  necessary for the absorption of copper','SKIN CARE',399.00,'TOPICAL','drug_pics/drug_default.png'),(50,'VIMORA VAG.DOUCHE 120ML','CHAMOMILE EXTRACT+THYME EXTRACT+ALOE VERA EXTRACT','HI-CARE > RONY PHARMA','','VAGINAL CARE',9.95,'VAGINAL','drug_pics/drug_default.png'),(51,'VITO CARE WHITENING CREAM 60 GM','','LEADER COSMETICS > ET GROUP (EXTRA TECH)','BLEACHING CREAM FOR SKIN FOLDS','WHITENING TOPICAL',79.90,'TOPICAL','drug_pics/drug_default.png'),(52,'KING CROWN 10 CAP','ROYAL JELLY+BEE POLLEN+WHEAT GERM+GINSENG','ARAB CAPS > IBN SINA','','VITAMINS',37.00,'ORAL.SOLID','drug_pics/drug_default.png'),(53,'CURISAFE 500MG/5ML SUSP. 60ML','CEFADROXIL','PHARCO B','about cefadroxil^first generation cephalosporin  para-hydroxy derivative of cefalexin  oral broad-spectrum antibiotic^^mechanism of action ^cefadroxil is a 1st generation cephalosporin which exerts its bactericidal action against both gram positive & gram negative organisms by inhibiting bacterial cell wall synthesis. cefadroxil inhibits transpeptidase & thus prevents cross linking of bacterial cell wall. transpeptidase & associated proteins constitute various types of specific binding proteins which have affinity for cephalosporins like cefadroxil ^^indications for cefadroxil^1. urinay tract infections ^2. tonsillitis & pharyngitis ^3. skin &soft tissue infections ^4. otitis media. ^^contra-indications of cefadroxil^1.hypersensitivity to cephalosporins ^2.porphyria ^3.neuromuscular disorders.','ANTIBIOTIC.CEPHALOSPORIN.FIRST-GENERATION',20.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(54,'KENACOMB TOPICAL CREAM 30 GM','GRAMICIDIN+NEOMYCIN+NYSTATIN+TRIAMCINOLONE','SMITHKLINE BEECHAM','ABOUT GRAMICIDIN\r\nGRAMICIDIN IS ACTIVE AGAINST MOST OF THE GRAM POSITIVE BACTERIA AND SOME GRAM NEGATIVE BACTERIA. ITS USE IS LIMITED TO TOPICAL USE ONLY   SINCE SYSTEMIC USE MAY PRODUCE HAEMOLYSIS.GRAMICIDIN PRODUCES ITS ACTION BY INCREASING THE PERMEABILITY OF CELL WALL. WHILE THE PERMEABILITY INCREASES INORGANIC MONOVALENT CATIONS ENTER TO THE BACTERIAL CELL WALL AND DESTROY THE ION GRADIENT BETWEEN THE CYTOPLASM AND THE EXTRA CELLULAR ENVIRONMENT.\r\nSPECIAL PRECAUTIONS WHILE TAKING GRAMICIDIN\r\n1.USE CAUTION WHILE DRIVING VEHICLE   OPERATING MACHINE AND OTHER ACTIVITIES WHICH REQUIRES CLEAR VISION. \r\n2.PATIENTS USING CONTACT LENS \r\nINDICATIONS FOR GRAMICIDIN\r\nBACTERIAL INFECTIONS OF EYE','.',14.40,'TOPICAL','drug_pics/drug_default.png'),(55,'KENACOMB TOPICAL OINTMENT 30 GM','GRAMICIDIN+NEOMYCIN+NYSTATIN+TRIAMCINOLONE','SMITHKLINE BEECHAM','about gramicidin^gramicidin is active against most of the gram positive bacteria and some gram negative bacteria. its use is limited to topical use only  since systemic use may produce haemolysis.gramicidin produces its action by increasing the permeability of cell wall. while the permeability increases inorganic monovalent cations enter to the bacterial cell wall and destroy the ion gradient between the cytoplasm and the extra cellular environment.^special precautions while taking gramicidin^1.use caution while driving vehicle  operating machine and other activities which requires clear vision. ^2.patients using contact lens ^indications for gramicidin^bacterial infections of eye','.',14.40,'TOPICAL','drug_pics/drug_default.png'),(56,'LACTACYD VAG.DOUCHE 200ML','LACTO-SERUM+LACTIC ACID','SANOFI','','VAGINAL WASH',26.00,'VAGINAL','drug_pics/drug_default.png'),(57,'ALFABRIMO 0.2% EYE DROPS 5 ML','BRIMONIDINE TARTRATE','RAMEDA > PHARCO','is a relatively selective alpha-2 adrenergic receptor agonist (topical intraocular pressure lowering agent).^indications^indicated for the reduction of elevated intraocular pressure (iop) in patients with open-angle glaucoma or. ocular hypertension.^drug interactions^antihypertensives/cardiac glycosides because alphagan� p (brimonidine tartrate) may reduce blood pressure  caution in using drugs such as antihypertensives and/or cardiac glycosides with alphagan� p (brimonidine tartrate) is advised.^^cns depressants^^although specific drug interaction studies have not been conducted with alphagan� p (brimonidine tartrate)   the possibility of an additive or. potentiating effect with cns depressants (alcohol  barbiturates  opiates  sedatives  or. anesthetics) should be considered.','ANTIGLAUCOMA',33.60,'EYE','drug_pics/drug_default.png'),(58,'ALFASPECT 500 MG 5 S.F.C.TABS.','LEVOFLOXACIN','SPIMACO PHARMACEUTICAL INDUSTRIES > INNOGEN PHARMA','about levofloxacin^third generation fluoroquinolone (or quinolone)  a broad spectrum antiinfective.^^mechanism of action of levofloxacin^levofloxacin is a broad spectrum antibacterial agent. it act by inhibiting the enzyme dna gyrase (topoisomerase 2) and topoisomerase 4.dna gyrase helps in the formation of a highly condensed three dimensional structure of the dna by its nicking and closing activity and also by introducing negative supercoil in to the dna double helix. levofloxacin inhibits dna gyrase which results in abnormal linkage between opened dna and gyrase and negative supercoiling is also impaired. this will inhibits transcription of dna in to rna and subsequent protein synthesis.^^indications for levofloxacin^1.sinusitis ^2.bronchitis ^3.pneumonia ^4.urinary tract infection ^5.traveler`s diarrhoea ^6.skin and soft tissue infections ^7.urethritis','ANTIBIOTIC.QUINOLONE',19.20,'ORAL.SOLID','drug_pics/drug_default.png'),(59,'ALEJON PEEL OFF MASK WITH VITAMIN C / ALGAE 125 ML','','EGYPTIAN CO. FOR COSMETICS (E.C.C.) > ALEJON CO.','An advanced formula  enriched with vitamin c  which deeply cleanses  the skin  restores skin radiances & lighten the skin while maintaining its moisture and preventing dryness.^^Direction of use :^^Apply a thin layer on your skin �avoid eyes area and eyebrows�  leave it for 20 minutes to dry  then gently peel it off from edges and remove it as one piece  finally rinse it with warm water.','SKIN CARE',43.00,'TOPICAL','drug_pics/drug_default.png'),(60,'ALZMENDA 20 MG 21 F.C.TABS.','MEMANTINE','MARCYRL  CO.','about memantine^n-methyl-d-aspartate receptor antagonist  dopamine d2 agonist  antidementia agent in alzheimer`s disease.^mechanism of action of memantine^memantine in an uncompetitive (low to moderate affinity to) nmda (n-methyl-d-aspartate) receptor antagonist. it regulates the activity of glutamate which is involved in information processing  storage and retrieval. excess glutamate plays a role in neuronal cell death and it is common to all neurodegenerative diseases. ^in alzheimer`s disease excess release of glutamate occurs. sustained elevation of glutamate over stimulates nmda receptors and allows too much of calcium in to nerve cells and leads to cell degeneration and cell death. memantine prevents these actions by inhibiting the binding of glutamate at nmda receptor.','DOPAMINE D2 AGONIST',71.00,'ORAL.SOLID','drug_pics/drug_default.png'),(61,'AMAGLUST 2/30 MG 30 SCORED TAB.','GLIMEPIRIDE+PIOGLITAZONE','EVA PHARMA > NEXT PHARMA','about glimepiride^third-generation sulfonylurea  oral antidiabetic agent.^mechanism of action of glimepiride^it is a potent antidiabetic drug which exerts its action by increasing insulin release from the pancreas and by improving glucose tolerance. it acts on the \"sulfonylurea receptors\" on pancreatic ?-cell membrane and reduces conductance of atp sensitive k+ channels and thus causes depolarization. this enhances ca2+ influx and degranultion and thus increases insulin secretion rate at any glucose concentration. it primarily increases 2nd phase insulin secretion and has little effect on 1st phase. it also slows hepatic degradation of insulin and minor action of reducing glucagon release and increasing somatostatin release. it also exerts stronger extrapancreatic action  by sensitizing the target tissues such as liver to insulin action. it increases the number of insulin receptors and through a post receptor action improving translation of receptor activation.','ANTI-DIABETIC.COMBINED SECRETAGOGUES+SENSITIZERS',36.00,'ORAL.SOLID','drug_pics/drug_default.png'),(62,'MASA CREAM 50 GM','EUCALYPTUS OIL+CLOVE EXTRACT+BIRCH EXTRACT+CAMPHOR OIL+PEPPERMINT OIL','EL-HELOU PERFUMES & COSMETICS > MEDIFACT GROUP','MASSAGE CREAM','MASSAGE CREAM',25.00,'TOPICAL','drug_pics/drug_default.png'),(63,'SEMAHEMO TAB 20 TABLETS','IRON+VIT C+VIT B6+VIT B12+FOLIC ACID','PHARMA ZAD > SEMAF PHARMA','Multivitamin with iron  Vit C and Vit B complex','MULTIVITAMIN',31.00,'ORAL.SOLID','drug_pics/drug_default.png'),(64,'AMAGLUST 4/30 MG 30 SCORED TAB.','GLIMEPIRIDE+PIOGLITAZONE','EVA PHARMA > NEXT PHARMA','about glimepiride^third-generation sulfonylurea  oral antidiabetic agent.^mechanism of action of glimepiride^it is a potent antidiabetic drug which exerts its action by increasing insulin release from the pancreas and by improving glucose tolerance. it acts on the \"sulfonylurea receptors\" on pancreatic ?-cell membrane and reduces conductance of atp sensitive k+ channels and thus causes depolarization. this enhances ca2+ influx and degranultion and thus increases insulin secretion rate at any glucose concentration. it primarily increases 2nd phase insulin secretion and has little effect on 1st phase. it also slows hepatic degradation of insulin and minor action of reducing glucagon release and increasing somatostatin release. it also exerts stronger extrapancreatic action  by sensitizing the target tissues such as liver to insulin action. it increases the number of insulin receptors and through a post receptor action improving translation of receptor activation.','ANTI-DIABETIC.COMBINED SECRETAGOGUES+SENSITIZERS',39.00,'ORAL.SOLID','drug_pics/drug_default.png'),(65,'HARVY SOAP 80 GM','KOJIC ACID+LICUORICE EXTRACT+VITAMIN C+GLYCOLIC ACID+ZINC OXIDE+TITANIUM DIOXIDE','HI-CARE > ROVAMED PHARMA','***indications^adjuvant therapy in the treatment of dark patches in different body areas including sensitive areas such as freckles   melasma   darkness of sensitive areas   age spots and post inflammatory hyperpigmentation due to acne   burns   sun exposure or. after cosmetic procedures ( laser   peeling�etc) .^^***directions for use^wash gently with rubbing foam and rinse with warm water twice daily.','SKIN CARE',18.00,'SOAP','drug_pics/drug_default.png'),(66,'AMOCLAWIN 1 GM 7 TAB.','AMOXICILLIN+CLAVULANIC ACID','SEDICO > SANOFI','AMOXICILLIN IS AN ANALOG OF AMPICILLIN   DERIVED FROM THE BASIC PENICILLIN NUCLEUS   6-AMINOPENICILLANIC ACID\r\nCLAVULANIC ACID IS PRODUCED BY THE FERMENTATION OF STREPTOMYCES CLAVULIGERUS. IT IS A BETA-LACTAM STRUCTURALLY RELATED TO THE PENICILLINS AND POSSESSES THE ABILITY TO INACTIVATE SOME BETA-LACTAMASES BY BLOCKING THE ACTIVE SITES OF THESE ENZYMES.\r\nLOWER RESPIRATORY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF HAEMOPHILUS INFLUENZAE AND MORAXELLA CATARRHALIS.\r\n\r\nACUTE BACTERIAL OTITIS MEDIA � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSINUSITIS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSKIN AND SKIN STRUCTURE INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF STAPHYLOCOCCUS AUREUS   ESCHERICHIA COLI   AND KLEBSIELLA SPECIES.\r\n\r\nURINARY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF E. COLI   KLEBSIELLA SPECIES   AND ENTEROBACTER SPECIES.','PENICILLINS.PENICILLIN WITH B-LACTAMASE INHIBITOR',23.00,'ORAL.SOLID','drug_pics/drug_default.png'),(67,'AMOCLAWIN 228.5MG/5ML PD. FOR ORAL SUSP. 60ML','AMOXICILLIN+CLAVULANIC ACID','SEDICO > SANOFI','AMOXICILLIN IS AN ANALOG OF AMPICILLIN   DERIVED FROM THE BASIC PENICILLIN NUCLEUS   6-AMINOPENICILLANIC ACID\r\nCLAVULANIC ACID IS PRODUCED BY THE FERMENTATION OF STREPTOMYCES CLAVULIGERUS. IT IS A BETA-LACTAM STRUCTURALLY RELATED TO THE PENICILLINS AND POSSESSES THE ABILITY TO INACTIVATE SOME BETA-LACTAMASES BY BLOCKING THE ACTIVE SITES OF THESE ENZYMES.\r\nLOWER RESPIRATORY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF HAEMOPHILUS INFLUENZAE AND MORAXELLA CATARRHALIS.\r\n\r\nACUTE BACTERIAL OTITIS MEDIA � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSINUSITIS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSKIN AND SKIN STRUCTURE INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF STAPHYLOCOCCUS AUREUS   ESCHERICHIA COLI   AND KLEBSIELLA SPECIES.\r\n\r\nURINARY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF E. COLI   KLEBSIELLA SPECIES   AND ENTEROBACTER SPECIES.','PENICILLINS.PENICILLIN WITH B-LACTAMASE INHBITOR',12.60,'ORAL.LIQUID','drug_pics/drug_default.png'),(68,'AMOCLAWIN 457MG/5ML PD. FOR ORAL SUSP. 60ML','AMOXICILLIN+CLAVULANIC ACID','SEDICO > SANOFI','AMOXICILLIN IS AN ANALOG OF AMPICILLIN   DERIVED FROM THE BASIC PENICILLIN NUCLEUS   6-AMINOPENICILLANIC ACID\r\nCLAVULANIC ACID IS PRODUCED BY THE FERMENTATION OF STREPTOMYCES CLAVULIGERUS. IT IS A BETA-LACTAM STRUCTURALLY RELATED TO THE PENICILLINS AND POSSESSES THE ABILITY TO INACTIVATE SOME BETA-LACTAMASES BY BLOCKING THE ACTIVE SITES OF THESE ENZYMES.\r\nLOWER RESPIRATORY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF HAEMOPHILUS INFLUENZAE AND MORAXELLA CATARRHALIS.\r\n\r\nACUTE BACTERIAL OTITIS MEDIA � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSINUSITIS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF H. INFLUENZAE AND M. CATARRHALIS.\r\n\r\nSKIN AND SKIN STRUCTURE INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF STAPHYLOCOCCUS AUREUS   ESCHERICHIA COLI   AND KLEBSIELLA SPECIES.\r\n\r\nURINARY TRACT INFECTIONS � CAUSED BY BETA-LACTAMASE�PRODUCING ISOLATES OF E. COLI   KLEBSIELLA SPECIES   AND ENTEROBACTER SPECIES.','PENICILLINS.PENICILLIN WITH B-LACTAMASE INHBITOR',15.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(69,'HIGEEN MOUTH WASH 400ML','MOUTH WASH FORMULA','HOUSEHOLDS & TOILETRIES MANUFACTURING COMPANY >','','ORAL CARE',22.50,'MOUTH','drug_pics/drug_default.png'),(70,'HORST TOP. GEL 50 GM','ARBUTIN+RUMEX EXTRACT(TYROSTAT)+ENZYME INHIBITOR+ANTIOXIDANTS+AHA','HI-CARE > BLUEBELL PHARMACEUTICALS','SKIN LIGHTENING GEL THAT IS USED FOR UNEVEN SKIN TONE   HYPERPIGMENTATION   FRECKLES AND AGE SPOTS','WHITENING TOPICAL',50.00,'TOPICAL','drug_pics/drug_default.png'),(71,'CAVENTOL SYRUP 120 ML','HONEY+THYME OIL WHITE+VIT C+FENNEL OIL+EUCALYPTUS OIL+MARSHMALLOW EXT+IVY EXT+ZINC GLUCONATE+PROPOLIS EXT','COPAD EGYPT','HERBAL SYRUP THAT HELP TO RELIEVE THE COUGH AND SORE THROAT. DIETARY SUPPLEMENT.\r\n\r\nDIRECTIONS FOR USE:\r\nONE SMALL SPOON 5ML   3-4 TIMES DAILY.','ANTI-COUGH.ANTITUSSIVE AND EXPECTORANT',30.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(72,'AMVASC 5MG 30 CAPSULES','AMLODIPINE','JAMJOOM PHARMACEUTICALS','ABOUT AMLODIPINE\r\nCALCIUM CHANNEL BLOCKER   ANTI HYPERTENSIVE  ANTI ANGINA.\r\n\r\nMECHANISM OF ACTION OF AMLODIPINE\r\nAMLODIPINE IS A SECOND GENERATION DIHYDROPYRIDINE CA CHANNEL BLOCKER. IT EXERTS IT`S ANTIHYPERTENSIVE   ANTIANGINAL ACTIONS THROUGH BLOCKING THE INFLUX OF CA IONS THROUGH VOLTAGE GATED L-TYPE CA CHANNELS TO THE PERIPHERAL VASCULAR SMOOTH MUSCLE CELLS   CORONARY SMOOTH MUSCLE CELLS AND TO THE MYOCARDIAL CELLS. THUS CAUSES DILATATION OF VASCULAR ENDOTHELIUM   DECREASE PERIPHERAL RESISTANCE   & REDUCE MYOCARDIAL OXYGEN DEMAND .IT MARKEDLY RELAX ARTERIOLES AND MILDER EFFECTS ON VEINS. THEY DO NOT COMPROMISE HAEMODYNAMICS AND CEREBRAL AND RENAL PERFUSION.\r\n\r\nINDICATIONS FOR AMLODIPINE\r\n1.HYPERTENSION \r\n2.PRINZMETAL`S ANGINA \r\n3.STABLE ANGINA','ANTIHYPERTENSIVE.SELECTIVE CALCIUM CHANNEL BLOCKER',28.80,'ORAL.SOLID','drug_pics/drug_default.png'),(73,'ANDOPOXETINE 30 MG 3 F.C.TABS. (N/A)','DAPOXETINE','INTERNATIONAL DRUG INDUSTRIES > ANDALOUS PHARMA','about dapoxetine^dapoxetine is a short-acting selective serotonin reuptake inhibitor (ssri) marketed for the treatment of premature ejaculation in men.^^mechanism of action of dapoxetine^the mechanism of action of dapoxetine in premature ejaculation is presumed to be linked to the inhibition of neuronal re-uptake of serotonin and the subsequent potentiation of the neurotransmitter s action at pre- and postsynaptic receptors.^^interactions for dapoxetine^1.ssris ^2.maois &thioridazine ^3.synergisic action with ketoconazole. ^^typical dosage for dapoxetine^maximum 240 mg in divided doses per day.','PREMATURE EJACULATION',22.80,'ORAL.SOLID','drug_pics/drug_default.png'),(74,'ANDOPOXETINE 60 MG 3 F.C. TABS.','DAPOXETINE','INTERNATIONAL DRUG INDUSTRIES > ANDALOUS PHARMA','ABOUT DAPOXETINE\r\nDAPOXETINE IS A SHORT-ACTING SELECTIVE SEROTONIN REUPTAKE INHIBITOR (SSRI) MARKETED FOR THE TREATMENT OF PREMATURE EJACULATION IN MEN.\r\n\r\nMECHANISM OF ACTION OF DAPOXETINE\r\nTHE MECHANISM OF ACTION OF DAPOXETINE IN PREMATURE EJACULATION IS PRESUMED TO BE LINKED TO THE INHIBITION OF NEURONAL RE-UPTAKE OF SEROTONIN AND THE SUBSEQUENT POTENTIATION OF THE NEUROTRANSMITTER S ACTION AT PRE- AND POSTSYNAPTIC RECEPTORS.\r\n\r\nINTERACTIONS FOR DAPOXETINE\r\n1.SSRIS \r\n2.MAOIS &THIORIDAZINE \r\n3.SYNERGISIC ACTION WITH KETOCONAZOLE. \r\n\r\nTYPICAL DOSAGE FOR DAPOXETINE\r\nMAXIMUM 240 MG IN DIVIDED DOSES PER DAY.','PREMATURE EJACULATION',33.75,'ORAL.SOLID','drug_pics/drug_default.png'),(75,'ANESTACON 2MG/ML (100ML) I.V. INFUSION','FLUCONAZOLE','GRAND PHARMA > VODACHEM','ABOUT FLUCONAZOLE\r\nA TRIAZOLE DERIVATIVE   A BOARD RANGE ANTIFUNGAL.\r\n\r\nMECHANISM OF ACTION OF FLUCONAZOLE\r\nFLUCONAZOLE IS FUNGICIDAL OR FUNGISTATIC DEPENDING ON THE DRUG CONCENTRATIONS. I T INHIBITS THE CONVERSION OF LANOSTEROL TO 14 DEMETHYL LANOSTEROL BY INHIBITING THE CYTOCHROMEP450 ENZYME 14 ALPHA DEMETHYLASE AND IMPAIR ERGOSTEROL SYNTHESIS\r\n\r\nINTERACTIONS FOR FLUCONAZOLE\r\nCIMETIDINE: DECREASED EFFICACY OF FLUCONAZOLE. \r\nCYCLOSPORINE: INCREASE IN SERUM CYCLOSPORINE PLASMA CONCENTRATION. \r\nHYDROCHLOROTHIAZIDE: REDUCTION IN RENAL CLEARANCE OF FLUCONAZOLE. \r\nPHENYTOIN: EFFICACY OF PHENYTOIN ENHANCED. \r\nRIFAMPICIN: EFFICACY OF FLUCONAZOLE DECREASED   HIGHER DOSAGE REQUIRED. \r\nSULFONYLUREAS: EFFICACY OF TOLBUTAMIDE   GLYBURIDE AND GLIPIZIDE INCREASED. \r\nWARFARIN: POTENTIATES THE ANTICOAGULANT EFFECT RESULTING IN INCREASE IN PROTHROMBIN TIME. \r\n\r\nINDICATIONS FOR FLUCONAZOLE\r\n1.OESOPHAGEAL CANDIDIASIS \r\n2.OROPHARYNGEAL CANDIDIASIS \r\n3.VAGINAL CANDIDIASIS \r\n4.SYSTEMIC CANDIDIASIS \r\n5.CRYPTOC','ANTIFUNGALS.TRIAZOLES',56.00,'INJECTION','drug_pics/drug_default.png'),(76,'AZI-ONCE 200MG/5ML SUSP. 15ML','AZITHROMYCIN','JAMJOOM PHARMACEUTICALS','DESCRIPTION:	\r\nAZITHROMYCIN IS A SEMI-SYNTHETIC MACROLIDE ANTIBIOTIC OF THE AZALIDE CLASS.\r\n\r\nDOSE:\r\nADULT: PO- RESPIRATORY TRACT   SKIN AND SOFT TISSUE INFECTIONS- 500 MG ONCE DAILY FOR 3 DAYS. OR 500MG ON DAY 1 FOLLOWED BY 250MG ON DAYS 2 TO 5. \r\nTYPHOID- 500 MG ONCE DAILY FOR 7 DAYS. \r\nUNCOMPLICATED GONORRHOEA- 2 G SINGLE DOSE. \r\nGRANULOMA INGUINALE- INITIAL: 1 G   THEN 500 MG/DAY UNTIL ALL LESIONS HAS HEALED COMPLETELY.\r\nCHANCROID/CHLAMYDIAL URETHRITIS: 1 G SINGLE DOSE PROPHYLAXIS OF DISSEMINATED MAC INFECTIONS 1.2 G ONCE WEEKLY. TREATMENT OR SECONDARY PROPHYLAXIS: ADMINISTERED ALONG WITH OTHER ANTIMYCOBACTERIALS: 500 MG ONCE DAILY. \r\n\r\nMECHANISM OF ACTION	AZITHROMYCIN BINDS TO THE 50S SUBUNIT OF THE 70S BACTERIAL RIBOSOMES   AND THEREFORE INHIBITS RNA-DEPENDENT PROTEIN SYNTHESIS IN BACTERIAL CELLS.\r\n\r\nHALF LIFE :\r\n68 HOURS','ANTIBIOTIC.MACROLIDE',19.20,'ORAL.LIQUID','drug_pics/drug_default.png'),(77,'AZI-ONCE 200MG/5ML SUSP. 22.5ML','AZITHROMYCIN','JAMJOOM PHARMACEUTICALS','DESCRIPTION:	\r\nAZITHROMYCIN IS A SEMI-SYNTHETIC MACROLIDE ANTIBIOTIC OF THE AZALIDE CLASS.\r\n\r\nDOSE:\r\nADULT: PO- RESPIRATORY TRACT   SKIN AND SOFT TISSUE INFECTIONS- 500 MG ONCE DAILY FOR 3 DAYS. OR 500MG ON DAY 1 FOLLOWED BY 250MG ON DAYS 2 TO 5. \r\nTYPHOID- 500 MG ONCE DAILY FOR 7 DAYS. \r\nUNCOMPLICATED GONORRHOEA- 2 G SINGLE DOSE. \r\nGRANULOMA INGUINALE- INITIAL: 1 G   THEN 500 MG/DAY UNTIL ALL LESIONS HAS HEALED COMPLETELY.\r\nCHANCROID/CHLAMYDIAL URETHRITIS: 1 G SINGLE DOSE PROPHYLAXIS OF DISSEMINATED MAC INFECTIONS 1.2 G ONCE WEEKLY. TREATMENT OR SECONDARY PROPHYLAXIS: ADMINISTERED ALONG WITH OTHER ANTIMYCOBACTERIALS: 500 MG ONCE DAILY. \r\n\r\nMECHANISM OF ACTION	AZITHROMYCIN BINDS TO THE 50S SUBUNIT OF THE 70S BACTERIAL RIBOSOMES   AND THEREFORE INHIBITS RNA-DEPENDENT PROTEIN SYNTHESIS IN BACTERIAL CELLS.\r\n\r\nHALF LIFE :\r\n68 HOURS','ANTIBIOTIC.MACROLIDE',27.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(78,'NRG 10 ORIGINAL SOLUTION 12 BOTTLES 60 ML','L-CARNITINE+L-ARGININE+TAURINE+CAFFEINE+VITAMIN B','EVA PHARMA','TAURINE .. 240MG\r\nCAFFEINE .. 19.2 MG\r\nNIACIN .. 16 MG\r\nPANTOTHENIC ACID .. 6 MG\r\nPYRIDOXINE HCL .. 1.4 MG\r\nCYANOCOBALAMIN .. 2.5 MCG\r\nRIBOFLAVIN .. 1.4 MG\r\nL-CARNITINE L-TARTRATE .. 1.5G\r\nL-ARGININE .. 1 G\r\nASCORBIC ACID .. 50 MG','MULTIVITAMINS',74.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(79,'OZURDEX INTRAVITREAL IMPLANT 0.7 MG','DEXAMETHASONE','ALLERGAN','OZURDEX� IS A TINY IMPLANT THAT SLOWLY RELEASES CORTICOSTEROID MEDICATION OVER TIME   WITHOUT THE NEED FOR MONTHLY INJECTIONS. IT WILL DISSOLVE NATURALLY AND WILL NOT NEED TO BE REMOVED.\r\n\r\nMEDICATION APPROVED TO TREAT 3 CONDITIONS IN ADULTS:\r\n-DIABETIC MACULAR EDEMA (DME)\r\n-MACULAR EDEMA (SWELLING OF THE MACULA) FOLLOWING BRANCH OR CENTRAL RETINAL VEIN OCCLUSION.\r\n-NONINFECTIOUS UVEITIS (AN INFLAMMATORY DISEASE OF THE UVEA) AFFECTING THE BACK SEGMENT OF THE EYE.','GLUCOCORTICOID',35.00,'UNKNOWN','drug_pics/drug_default.png'),(80,'CICA LAB CREAM 50 ML','','EGYPTIAN CO. FOR COSMETICS (E.C.C.) > HAYAH LAB.','rejuvenating cream','SKIN CARE.HEALING',60.00,'TOPICAL','drug_pics/drug_default.png'),(81,'IVOGLITA 300 MG 30 F.C. TABS.','CANAGLIFLOZIN','MASH PREMIERE','CANAGLIFLOZIN IS AN ORAL DIABETES MEDICINE THAT HELPS CONTROL BLOOD SUGAR LEVELS. CANAGLIFLOZIN WORKS BY HELPING THE KIDNEYS GET RID OF GLUCOSE FROM YOUR BLOODSTREAM.\r\n\r\nCANAGLIFLOZIN IS USED TOGETHER WITH DIET AND EXERCISE TO TREAT TYPE 2 DIABETES.\r\n\r\nCANAGLIFLOZIN IS NOT FOR TREATING TYPE 1 DIABETES.\r\n\r\nYOU SHOULD NOT USE CANAGLIFLOZIN IF YOU HAVE SEVERE KIDNEY DISEASE (OR IF YOU ARE ON DIALYSIS).','ANTI-DIABETIC',50.00,'ORAL.SOLID','drug_pics/drug_default.png'),(82,'VOKANAMET 150MG/1000MG 60 F.C. TABS.','CANAGLIFLOZIN+METFORMIN','JANSSEN CILAG > SOFICOPHARM','VOKANAMET COMBINES TWO ORAL GLUCOSE-LOWERING MEDICINAL PRODUCTS WITH DIFFERENT AND COMPLEMENTARY MECHANISMS OF ACTION TO IMPROVE GLYCAEMIC CONTROL IN PATIENTS WITH TYPE 2 DIABETES: CANAGLIFLOZIN   AN INHIBITOR OF SGLT2 TRANSPORTER   AND METFORMIN HYDROCHLORIDE   A MEMBER OF THE BIGUANIDE CLASS.','ANTI-DIABETIC.SGLT2 TRANSPORTER WITH BIGUANIDE',65.00,'ORAL.SOLID','drug_pics/drug_default.png'),(83,'VOKANAMET 50MG/850MG 60 F.C. TABS.','CANAGLIFLOZIN+METFORMIN','JANSSEN CILAG > SOFICOPHARM','VOKANAMET COMBINES TWO ORAL GLUCOSE-LOWERING MEDICINAL PRODUCTS WITH DIFFERENT AND COMPLEMENTARY MECHANISMS OF ACTION TO IMPROVE GLYCAEMIC CONTROL IN PATIENTS WITH TYPE 2 DIABETES: CANAGLIFLOZIN   AN INHIBITOR OF SGLT2 TRANSPORTER   AND METFORMIN HYDROCHLORIDE   A MEMBER OF THE BIGUANIDE CLASS.','ANTI-DIABETIC.SGLT2 TRANSPORTER WITH BIGUANIDE',65.00,'ORAL.SOLID','drug_pics/drug_default.png'),(84,'LEVOTAVIN 500 MG 7 F.C.TABS.','LEVOFLOXACIN','PHARCO','about levofloxacin^third generation fluoroquinolone (or quinolone)  a broad spectrum antiinfective.^^mechanism of action of levofloxacin^levofloxacin is a broad spectrum antibacterial agent. it act by inhibiting the enzyme dna gyrase (topoisomerase 2) and topoisomerase 4.dna gyrase helps in the formation of a highly condensed three dimensional structure of the dna by its nicking and closing activity and also by introducing negative supercoil in to the dna double helix. levofloxacin inhibits dna gyrase which results in abnormal linkage between opened dna and gyrase and negative supercoiling is also impaired. this will inhibits transcription of dna in to rna and subsequent protein synthesis.^^indications for levofloxacin^1.sinusitis ^2.bronchitis ^3.pneumonia ^4.urinary tract infection ^5.traveler`s diarrhoea ^6.skin and soft tissue infections ^7.urethritis','ANTIBIOTIC.QUINOLONE',63.00,'ORAL.SOLID','drug_pics/drug_default.png'),(85,'MOONSHINE WHITENING LOTION DROPS 30 ML','COLLAGEN+VITAMIN C','DREAMS ELHABOBA > UNITED PYRAMIDS','WHITENING DROPS - ANTI-DARK SPOTS','WHITENING TOPICALS',37.00,'UNKNOWN','drug_pics/drug_default.png'),(86,'AZI-ONCE 200MG/5ML SUSP. 30ML','AZITHROMYCIN','JAMJOOM PHARMACEUTICALS','DESCRIPTION:	\r\nAZITHROMYCIN IS A SEMI-SYNTHETIC MACROLIDE ANTIBIOTIC OF THE AZALIDE CLASS.\r\n\r\nDOSE:\r\nADULT: PO- RESPIRATORY TRACT   SKIN AND SOFT TISSUE INFECTIONS- 500 MG ONCE DAILY FOR 3 DAYS. OR 500MG ON DAY 1 FOLLOWED BY 250MG ON DAYS 2 TO 5. \r\nTYPHOID- 500 MG ONCE DAILY FOR 7 DAYS. \r\nUNCOMPLICATED GONORRHOEA- 2 G SINGLE DOSE. \r\nGRANULOMA INGUINALE- INITIAL: 1 G   THEN 500 MG/DAY UNTIL ALL LESIONS HAS HEALED COMPLETELY.\r\nCHANCROID/CHLAMYDIAL URETHRITIS: 1 G SINGLE DOSE PROPHYLAXIS OF DISSEMINATED MAC INFECTIONS 1.2 G ONCE WEEKLY. TREATMENT OR SECONDARY PROPHYLAXIS: ADMINISTERED ALONG WITH OTHER ANTIMYCOBACTERIALS: 500 MG ONCE DAILY. \r\n\r\nMECHANISM OF ACTION	AZITHROMYCIN BINDS TO THE 50S SUBUNIT OF THE 70S BACTERIAL RIBOSOMES   AND THEREFORE INHIBITS RNA-DEPENDENT PROTEIN SYNTHESIS IN BACTERIAL CELLS.\r\n\r\nHALF LIFE :\r\n68 HOURS','ANTIBIOTIC.MACROLIDE',30.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(87,'AZI-ONCE 250MG 6 CAPS.','AZITHROMYCIN','JAMJOOM PHARMACEUTICALS','DESCRIPTION:	\r\nAZITHROMYCIN IS A SEMI-SYNTHETIC MACROLIDE ANTIBIOTIC OF THE AZALIDE CLASS.\r\n\r\nDOSE:\r\nADULT: PO- RESPIRATORY TRACT   SKIN AND SOFT TISSUE INFECTIONS- 500 MG ONCE DAILY FOR 3 DAYS. OR 500MG ON DAY 1 FOLLOWED BY 250MG ON DAYS 2 TO 5. \r\nTYPHOID- 500 MG ONCE DAILY FOR 7 DAYS. \r\nUNCOMPLICATED GONORRHOEA- 2 G SINGLE DOSE. \r\nGRANULOMA INGUINALE- INITIAL: 1 G   THEN 500 MG/DAY UNTIL ALL LESIONS HAS HEALED COMPLETELY.\r\nCHANCROID/CHLAMYDIAL URETHRITIS: 1 G SINGLE DOSE PROPHYLAXIS OF DISSEMINATED MAC INFECTIONS 1.2 G ONCE WEEKLY. TREATMENT OR SECONDARY PROPHYLAXIS: ADMINISTERED ALONG WITH OTHER ANTIMYCOBACTERIALS: 500 MG ONCE DAILY. \r\n\r\nMECHANISM OF ACTION	AZITHROMYCIN BINDS TO THE 50S SUBUNIT OF THE 70S BACTERIAL RIBOSOMES   AND THEREFORE INHIBITS RNA-DEPENDENT PROTEIN SYNTHESIS IN BACTERIAL CELLS.\r\n\r\nHALF LIFE :\r\n68 HOURS','ANTIBIOTIC.MACROLIDE',33.00,'ORAL.SOLID','drug_pics/drug_default.png'),(88,'BLASTOCLAST 2 TABLETS','ALENDRONATE+VITAMIN D3','MASH PREMIERE','IT IS INDICATED FOR THE TREATMENT OF OSTEOPOROSIS IN POSTMENOPAUSAL WOMEN. IN POSTMENOPAUSAL WOMEN   IT INCREASES BONE MASS AND REDUCES THE INCIDENCE OF FRACTURES   INCLUDING THOSE OF THE HIP AND SPINE (VERTEBRAL COMPRESSION FRACTURES).\r\nALENDRONATE SODIUM IS A BISPHOSPHONATE THAT ACTS AS A SPECIFIC INHIBITOR OF OSTEOCLAST-MEDIATED BONE RESORPTION. BISPHOSPHONATES ARE SYNTHETIC ANALOGS OF PYROPHOSPHATE THAT BIND TO THE HYDROXYAPATITE FOUND IN BONE.\r\nCHOLECALCIFEROL (VITAMIN D3) IS A SECOSTEROL THAT IS THE NATURAL PRECURSOR OF THE CALCIUM-REGULATING HORMONE CALCITRIOL (1  25 DIHYDROXYVITAMIN D3).\r\nSTOP USING ALENDRONATE AND CHOLECALCIFEROL AND CALL YOUR DOCTOR AT ONCE IF YOU HAVE A SERIOUS SIDE EFFECT SUCH AS:\r\n\r\nCHEST PAIN;\r\nDIFFICULTY OR PAIN WHEN SWALLOWING;\r\nPAIN OR BURNING UNDER THE RIBS OR IN THE BACK;\r\nNEW OR WORSENING HEARTBURN;\r\nSEVERE JOINT   BONE   OR MUSCLE PAIN;\r\nNEW OR UNUSUAL PAIN IN YOUR THIGH OR HIP; OR\r\nJAW PAIN   NUMBNESS  ...','OSTEOPOROSIS.BISPHOSPHONATES.PLUS VITAMIN D',18.00,'ORAL.SOLID','drug_pics/drug_default.png'),(89,'BONPROVE 150 MG 3 F.C. TABLETS','IBANDRONIC ACID','EVA PHARMA','DOSE : ONE TABLET 150 MG TAKEN ONCE MONTHLY ON THE SAME DATE EACH MONTH','OSTEOPOROSIS.ANTIRESORPTIVES',66.00,'ORAL.SOLID','drug_pics/drug_default.png'),(90,'VITACID C 1000MG 12 EFF. GRAN. IN SACHETS','VITAMIN C','CID','about vitamin c^water soluble vitamin  antioxidant.^mechanism of action of vitamin c^vitamin c exerts it`s action by influencing the biologic oxidations and reductions used in cellular respirations. it directly stimulates collagen synthesis and maintains intracellular connective tissue. it involves in various metabolic reactions such as 1).hydroxylation of praline and lysine residues of protocollagen which is essential for formation and stabilization of collagen triple helix  2).hydroxylation of carnitine  3).conversion of folic acid to folinic acid  4).biosynthesis of adrenal steroids  catecholamines  oxytocin  and adh  5).metabolism of cyclic nucleotides and prostaglandins. vitamin c is important in resistance to infections.Sinteractions for vitamin cSoral contraceptives and estrogens: vitamin c increases serum levels of oestrogen resulting in adverse reactions . Swarfarin: the anticoagulant effects of warfarin is reduced. Slab tests: large doses (>500 mg) of vitamin c may caS','VITAMIN C',50.00,'EFF','drug_pics/drug_default.png'),(91,'BUDECORT 200MCG/DOSE INHALER','BUDESONIDE','CIPLA LTD. - INDIA > STAR INTERNATIONAL COMPANY','ABOUT BUDESONIDE TAB\r\nSTEROIDS   ANTIINFLAMMATORY DRUGS.\r\n\r\nMECHANISM OF ACTION OF BUDESONIDE TAB\r\nBUDESONIDE CONTROLS THE RATE OF PROTEIN SYNTHESIS   DEPRESSES THE MIGRATION OF POLYMORPHONUCLEAR LEUKOCYTES   FIBROBLASTS   REVERSES CAPILLARY PERMEABILITY AND LYSOSOMAL STABILISATION AT THE CELLULAR LEVEL TO PREVENT OR CONTROL INFLAMMATION.\r\n\r\nTYPICAL DOSAGE FOR BUDESONIDE TAB\r\nUSUALLY ONCE DAILY BEFORE MORNING MEAL. THE DOSAGE AND LENGTH OF THE TREATMENT BASED ON THE MEDICAL CONDITION.\r\n\r\nSIDE EFFECTS OF BUDESONIDE TAB\r\n1.HEADACHE \r\n2.NAUSEA \r\n3.RESPIRATORY INFECTION \r\n4.DEPRESSION','BRONCHODILATOR.ANTI-INFLAMMATORY.GLUCOCORTICOID STEROID',55.00,'UNKNOWN','drug_pics/drug_default.png'),(92,'BUDELIZER 400MCG 60 INH. CAPS. +INHALER DEVICE','BUDESONIDE','EUROPEAN EGYPTIAN PHARM. IND.','about budesonide tab^steroids  antiinflammatory drugs.^^mechanism of action of budesonide tab^budesonide controls the rate of protein synthesis  depresses the migration of polymorphonuclear leukocytes  fibroblasts  reverses capillary permeability and lysosomal stabilisation at the cellular level to prevent or. control inflammation.^^typical dosage for budesonide tab^usually once daily before morning meal. the dosage and length of the treatment based on the medical condition.^^side effects of budesonide tab^1.headache ^2.nausea ^3.respiratory infection ^4.depression','BRONCHODILATOR.ANTI-INFLAMMATORY.GLUCOCORTICOID STEROID',42.00,'UNKNOWN','drug_pics/drug_default.png'),(93,'DEVART B12 1000 MCG 30 SUBLINGUAL TABS','CYANOCOBALAMIN','DEVARTLAB > BIOERA','DEVART B12 is water soluble form of vitamin B12 convenient for patients and with acceptable taste in a sublingual form to be readily absorbed into the blood stream.\r\n\r\nDose: one sublingual tablet daily','VITAMIN B12',33.00,'ORAL.SOLID','drug_pics/drug_default.png'),(94,'DEVART C-ZINC SR 20 TABS','CALCIUM ASCORBATE 500 MG+ZINC GLUCONATE 15 MG','DEVARTLAB > BIOERA','DEVART C-Zinc SR is a combination of calcium ascorbate gentle on stomach with fully amino acid chelated zinc in once daily sustained release formula.\r\n\r\nDose: once daily tablet or as recommended','MULTIVITAMIN',43.00,'ORAL.SOLID','drug_pics/drug_default.png'),(95,'DEVART MELATONIN 3 MG 30 TABS','MELATONIN 3 MG','DEVARTLAB > BIOERA','Melatonin is a natural protein produced in the pineal gland and present in high amounts in the gastrointestinal tract.\r\nIt is involved in many of the brain and body biological functions including regulation of normal sleep/wake cycle   mood & maintenance of a healthy gastrointestinal lining.\r\n\r\nDose: one capsule 30-60 minutes before bedtime','SLEEP AID',66.00,'ORAL.SOLID','drug_pics/drug_default.png'),(96,'FROST ACT 90 TABS.','CHONDROITIN+GLUCOSAMINE+METHYL SULPHONYL METHANE','> MACRO GROUP PHARMACEUTICALS','','ANTI-RHEUMATIC.OSTEOARTHRITIS.ANABOLIC AGENTS',32.00,'ORAL.SOLID','drug_pics/drug_default.png'),(97,'LEO CASTLE ANTIPERSPIRANT ROLL ON 60 ML','VITAMIN C+LICORICE+ALOE VERA+COLLAGEN+VITAMIN E','EGYPTIAN CO. FOR COSMETICS (E.C.C.) > AGATHA PHARM','Natural antiperspirant and whitening product','SKIN CARE',26.00,'UNKNOWN','drug_pics/drug_default.png'),(98,'ARGIFEM INTIMATE FEMININE GEL 30 GM','TEA TREE OIL+ROSE OIL+CHAMOMIL EXT.+ALOE VERA EXT.+MALVA SYLVESTRIS EXT.+CALENDULA OFFICINALIS EXT.','EGYPTIAN CO. FOR COSMETICS (E.C.C.) > AGATHA PHARM','Intimate Feminine Gel','VAGINAL CARE',61.00,'TOPICAL','drug_pics/drug_default.png'),(99,'XOMEGA SYRUP 120 ML','COD LIVER OIL','MAXEL PHARMA FOR PHARMACEUTICALS > LOURAN PHARMA','Support CNS development and immuno inhancer','OMEGA 3',42.00,'ORAL.LIQUID','drug_pics/drug_default.png'),(100,'COUGH LESS SYRUP 120 ML','GUAVA LEAVES EXTRACT+FENNEL OIL+TILIA FLOWER','MAXEL PHARMA FOR PHARMACEUTICALS > LOURAN PHARMA','GUAVA LEAVES EXTRACT ... 70 MG\r\nFENNEL OIL ... 15.6 MG\r\nTILIA FLOWER ... 7.8 MG\r\n\r\n\r\nAntitussive and mucolytic for dry and productive cough','COUGH PRODUCTS',41.00,'ORAL.LIQUID','drug_pics/drug_default.png');
/*!40000 ALTER TABLE `products_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlite_sequence` (
  `name` varchar(32) DEFAULT NULL,
  `seq` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlite_sequence`
--

LOCK TABLES `sqlite_sequence` WRITE;
/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',58),('django_admin_log',24),('django_content_type',14),('auth_permission',56),('auth_group',0),('auth_user',4),('products_drug',22501),('orders_order',6),('inventory_inventoryitemdispensed',20),('orders_orderitem',7),('users_userprofile',5),('donations_donation',3),('donations_donationrequest',2),('inventory_inventoryitem',12);
/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` tinyint(4) DEFAULT NULL,
  `photo` varchar(34) DEFAULT NULL,
  `address` varchar(1) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'profile_images/default_profile.png','1','1',3,2,1),(2,'profile_images/default_profile.png','-','-',1,1,1),(3,'profile_images/default_profile.png','-','01012349874',2,3,1),(4,'profile_images/default_profile.png','','',3,4,1);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 16:42:50
