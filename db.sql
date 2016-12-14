-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2016-10-18 18:59:55','2016-10-18 18:59:55','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://localhost','yes'),(2,'home','http://localhost','yes'),(3,'blogname','Left Goat','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','cody@leftgoat.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%postname%','yes'),(29,'rewrite_rules','a:87:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:4:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:41:\"amazon-s3-and-cloudfront/wordpress-s3.php\";i:2;s:43:\"amazon-web-services/amazon-web-services.php\";i:3;s:9:\"hello.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','wp-json','yes'),(41,'stylesheet','wp-json','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','none','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:0:{}','yes'),(80,'widget_rss','a:0:{}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','37965','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(98,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(99,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'cron','a:4:{i:1481741996;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1481742055;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1481742280;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(105,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1476817197;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(106,'current_theme','JSON with Custom Fields','yes'),(107,'theme_switched','','yes'),(108,'acf_version','4.4.11','yes'),(113,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1481701946;s:7:\"checked\";a:4:{s:13:\"twentyfifteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"1.0\";s:13:\"twentysixteen\";s:3:\"1.3\";s:7:\"wp-json\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),(133,'aws_settings','a:2:{s:13:\"access_key_id\";s:0:\"\";s:17:\"secret_access_key\";s:0:\"\";}','no'),(134,'tantan_wordpress_s3','a:14:{s:13:\"manual_bucket\";b:1;s:17:\"post_meta_version\";i:6;s:6:\"bucket\";s:22:\"lg-wp-leftgoat-dot-com\";s:6:\"region\";s:0:\"\";s:6:\"domain\";s:4:\"path\";s:10:\"cloudfront\";s:0:\"\";s:13:\"object-prefix\";s:19:\"wp-content/uploads/\";s:10:\"copy-to-s3\";s:1:\"1\";s:13:\"serve-from-s3\";s:1:\"1\";s:17:\"remove-local-file\";s:1:\"1\";s:11:\"force-https\";s:1:\"1\";s:17:\"object-versioning\";s:1:\"1\";s:21:\"use-yearmonth-folders\";s:1:\"1\";s:20:\"enable-object-prefix\";s:1:\"1\";}','yes'),(135,'_site_transient_as3cf_notices','a:1:{s:53:\"as3cf-notice-c440ccf6253a2a391937f019361ae7bb0f81b56c\";a:19:{s:4:\"type\";s:4:\"info\";s:11:\"dismissible\";b:1;s:6:\"inline\";b:0;s:5:\"flash\";b:0;s:17:\"only_show_to_user\";b:0;s:17:\"user_capabilities\";a:2:{i:0;s:18:\"as3cf_compat_check\";i:1;s:18:\"check_capabilities\";}s:21:\"only_show_in_settings\";b:1;s:16:\"only_show_on_tab\";b:0;s:9:\"custom_id\";s:0:\"\";s:6:\"auto_p\";b:1;s:5:\"class\";s:0:\"\";s:13:\"show_callback\";b:0;s:13:\"callback_args\";a:0:{}s:8:\"lock_key\";s:0:\"\";s:19:\"pre_render_callback\";b:0;s:7:\"message\";s:248:\"<strong>WP Offload S3 Requirement Missing</strong> &mdash; Looks like you don\'t have an image manipulation library installed on this server and configured with PHP. You may run into trouble if you try to edit images. Please setup GD or ImageMagick.\";s:12:\"triggered_by\";i:1;s:10:\"created_at\";i:1476817383;s:2:\"id\";s:53:\"as3cf-notice-c440ccf6253a2a391937f019361ae7bb0f81b56c\";}}','no'),(317,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1481701945;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"21367\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"4.4.11\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.11.zip\";}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"3.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.3.2.zip\";}s:43:\"amazon-web-services/amazon-web-services.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"44146\";s:4:\"slug\";s:19:\"amazon-web-services\";s:6:\"plugin\";s:43:\"amazon-web-services/amazon-web-services.php\";s:11:\"new_version\";s:5:\"1.0.1\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/amazon-web-services/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/amazon-web-services.1.0.1.zip\";}s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}s:41:\"amazon-s3-and-cloudfront/wordpress-s3.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"38149\";s:4:\"slug\";s:24:\"amazon-s3-and-cloudfront\";s:6:\"plugin\";s:41:\"amazon-s3-and-cloudfront/wordpress-s3.php\";s:11:\"new_version\";s:5:\"1.1.4\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/amazon-s3-and-cloudfront/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.1.1.4.zip\";}}}','no'),(319,'db_upgraded','','yes'),(320,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.7-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.7-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.7\";s:7:\"version\";s:3:\"4.7\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1481701944;s:15:\"version_checked\";s:3:\"4.7\";s:12:\"translations\";a:0:{}}','no'),(322,'_site_transient_timeout_theme_roots','1481703744','no'),(323,'_site_transient_theme_roots','a:4:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:7:\"wp-json\";s:7:\"/themes\";}','no'),(324,'_site_transient_timeout_browser_55ae8ef8628e0f8d24166d0eb8f0f156','1482306757','no'),(325,'_site_transient_browser_55ae8ef8628e0f8d24166d0eb8f0f156','a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"54.0.2840.98\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','no'),(326,'can_compress_scripts','0','no'),(327,'_transient_timeout_plugin_slugs','1481788357','no'),(328,'_transient_plugin_slugs','a:5:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:19:\"akismet/akismet.php\";i:2;s:43:\"amazon-web-services/amazon-web-services.php\";i:3;s:9:\"hello.php\";i:4;s:41:\"amazon-s3-and-cloudfront/wordpress-s3.php\";}','no'),(329,'_transient_timeout_dash_88ae138922fe95674369b1cb3d215a2b','1481745157','no'),(330,'_transient_dash_88ae138922fe95674369b1cb3d215a2b','<div class=\"rss-widget\"><ul><li>An error has occurred, which probably means the feed is down. Try again later.</li></ul></div><div class=\"rss-widget\"><ul><li>An error has occurred, which probably means the feed is down. Try again later.</li></ul></div><div class=\"rss-widget\"><ul></ul></div>','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (5,6,'_edit_last','1'),(6,6,'_edit_lock','1477170371:1'),(9,10,'_edit_last','1'),(10,10,'_edit_lock','1477685240:1'),(11,13,'_edit_last','1'),(12,13,'_edit_lock','1477104539:1'),(13,15,'_edit_last','1'),(14,15,'_edit_lock','1477104541:1'),(15,17,'_edit_last','1'),(16,17,'_edit_lock','1477104544:1'),(22,23,'_edit_last','1'),(23,23,'_edit_lock','1477104719:1'),(24,25,'_edit_last','1'),(25,25,'_edit_lock','1477104716:1'),(26,27,'_edit_last','1'),(27,27,'_edit_lock','1477104724:1'),(31,30,'_edit_last','1'),(32,30,'field_5806b7f42b1b5','a:14:{s:3:\"key\";s:19:\"field_5806b7f42b1b5\";s:5:\"label\";s:12:\"Phone Number\";s:4:\"name\";s:12:\"phone_number\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(33,30,'field_5806b80e2b1b6','a:12:{s:3:\"key\";s:19:\"field_5806b80e2b1b6\";s:5:\"label\";s:13:\"Email Address\";s:4:\"name\";s:13:\"email_address\";s:4:\"type\";s:5:\"email\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),(34,30,'field_5806b8192b1b7','a:13:{s:3:\"key\";s:19:\"field_5806b8192b1b7\";s:5:\"label\";s:15:\"Mailing Address\";s:4:\"name\";s:15:\"mailing_address\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:2;}'),(37,30,'position','normal'),(38,30,'layout','no_box'),(39,30,'hide_on_screen','a:13:{i:0;s:11:\"the_content\";i:1;s:7:\"excerpt\";i:2;s:13:\"custom_fields\";i:3;s:10:\"discussion\";i:4;s:8:\"comments\";i:5;s:9:\"revisions\";i:6;s:4:\"slug\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(40,30,'_edit_lock','1477685203:1'),(44,33,'_edit_last','1'),(45,33,'_edit_lock','1477104728:1'),(46,35,'_edit_last','1'),(48,35,'field_5806bb6c05619','a:13:{s:3:\"key\";s:19:\"field_5806bb6c05619\";s:5:\"label\";s:7:\"Tagline\";s:4:\"name\";s:7:\"tagline\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(51,35,'position','normal'),(52,35,'layout','no_box'),(53,35,'hide_on_screen','a:13:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:13:\"custom_fields\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:9:\"revisions\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(54,35,'_edit_lock','1477178295:1'),(56,36,'_edit_last','1'),(57,36,'field_5806bbd5669cb','a:11:{s:3:\"key\";s:19:\"field_5806bbd5669cb\";s:5:\"label\";s:17:\"Large Description\";s:4:\"name\";s:17:\"large_description\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";s:3:\"yes\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(58,36,'field_5806bc33669cc','a:13:{s:3:\"key\";s:19:\"field_5806bc33669cc\";s:5:\"label\";s:17:\"Small Description\";s:4:\"name\";s:17:\"small_description\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),(61,36,'position','normal'),(62,36,'layout','no_box'),(63,36,'hide_on_screen','a:12:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:10:\"discussion\";i:4;s:8:\"comments\";i:5;s:9:\"revisions\";i:6;s:6:\"author\";i:7;s:6:\"format\";i:8;s:14:\"featured_image\";i:9;s:10:\"categories\";i:10;s:4:\"tags\";i:11;s:15:\"send-trackbacks\";}'),(64,36,'_edit_lock','1477685208:1'),(65,37,'_edit_last','1'),(66,37,'_edit_lock','1477104536:1'),(68,39,'_edit_last','1'),(69,39,'field_5806bcc52bc4b','a:13:{s:3:\"key\";s:19:\"field_5806bcc52bc4b\";s:5:\"label\";s:17:\"List Introduction\";s:4:\"name\";s:17:\"list_introduction\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(70,39,'field_5806bcda2bc4c','a:13:{s:3:\"key\";s:19:\"field_5806bcda2bc4c\";s:5:\"label\";s:13:\"Services List\";s:4:\"name\";s:13:\"services_list\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),(71,39,'field_5806bce52bc4d','a:13:{s:3:\"key\";s:19:\"field_5806bce52bc4d\";s:5:\"label\";s:17:\"Services Addendum\";s:4:\"name\";s:17:\"services_addendum\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:2;}'),(73,39,'position','normal'),(74,39,'layout','no_box'),(75,39,'hide_on_screen','a:13:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:13:\"custom_fields\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:9:\"revisions\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(76,39,'_edit_lock','1477178336:1'),(77,40,'_edit_last','1'),(78,40,'field_5806bd1a8f23e','a:13:{s:3:\"key\";s:19:\"field_5806bd1a8f23e\";s:5:\"label\";s:4:\"Text\";s:4:\"name\";s:4:\"text\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(80,40,'position','normal'),(81,40,'layout','no_box'),(82,40,'hide_on_screen','a:13:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:13:\"custom_fields\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:9:\"revisions\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(83,40,'_edit_lock','1477685211:1'),(84,41,'_edit_last','1'),(86,41,'field_5806bd74369c1','a:14:{s:3:\"key\";s:19:\"field_5806bd74369c1\";s:5:\"label\";s:8:\"Position\";s:4:\"name\";s:8:\"position\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:3:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:0:\"\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(88,41,'field_5806bd87369c3','a:13:{s:3:\"key\";s:19:\"field_5806bd87369c3\";s:5:\"label\";s:3:\"Bio\";s:4:\"name\";s:3:\"bio\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),(90,41,'position','normal'),(91,41,'layout','no_box'),(92,41,'hide_on_screen','a:13:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:13:\"custom_fields\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:9:\"revisions\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(93,41,'_edit_lock','1477685214:1'),(94,42,'_edit_last','1'),(95,42,'field_5806bdafa5947','a:13:{s:3:\"key\";s:19:\"field_5806bdafa5947\";s:5:\"label\";s:4:\"Text\";s:4:\"name\";s:4:\"text\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),(97,42,'position','normal'),(98,42,'layout','no_box'),(99,42,'hide_on_screen','a:13:{i:0;s:9:\"permalink\";i:1;s:11:\"the_content\";i:2;s:7:\"excerpt\";i:3;s:13:\"custom_fields\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:9:\"revisions\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:14:\"featured_image\";i:10;s:10:\"categories\";i:11;s:4:\"tags\";i:12;s:15:\"send-trackbacks\";}'),(100,42,'_edit_lock','1477178312:1'),(104,43,'phone_number','4062723134'),(105,43,'_phone_number','field_5806b7f42b1b5'),(106,43,'email_address','hello@leftgoat.com'),(107,43,'_email_address','field_5806b80e2b1b6'),(108,43,'mailing_address','Left Goat LLC\r\n704C East 13th Street\r\nSuite 125\r\nWhitefish, MT 59937'),(109,43,'_mailing_address','field_5806b8192b1b7'),(110,10,'phone_number','406.272.3134'),(111,10,'_phone_number','field_5806b7f42b1b5'),(112,10,'email_address','hello@leftgoat.com'),(113,10,'_email_address','field_5806b80e2b1b6'),(114,10,'mailing_address','Left Goat LLC\r\n704C East 13th Street\r\nSuite 125\r\nWhitefish, MT 59937'),(115,10,'_mailing_address','field_5806b8192b1b7'),(116,44,'banner_image',''),(117,44,'_banner_image','field_5806bb4505618'),(118,44,'tagline','left goat sprung from a shared love for the creation of beautiful and functional web experiences.'),(119,44,'_tagline','field_5806bb6c05619'),(120,44,'logo',''),(121,44,'_logo','field_5806bb860561a'),(122,6,'banner_image',''),(123,6,'_banner_image','field_5806bb4505618'),(124,6,'tagline','Left Goat sprung from a shared love for the creation of beautiful and functional web experiences.'),(125,6,'_tagline','field_5806bb6c05619'),(126,6,'logo',''),(127,6,'_logo','field_5806bb860561a'),(128,45,'banner_image',''),(129,45,'_banner_image','field_5806bb4505618'),(130,45,'tagline','Left Goat sprung from a shared love for the creation of beautiful and functional web experiences.'),(131,45,'_tagline','field_5806bb6c05619'),(132,45,'logo',''),(133,45,'_logo','field_5806bb860561a'),(134,46,'large_description','Left Goat is a small web design and development firm. With a focus on stunning design and custom functionality, we have the the ambition and the experience to deliver a breathtaking web experience at <strong>quality unmatched</strong>.'),(135,46,'_large_description','field_5806bbd5669cb'),(136,46,'small_description',''),(137,46,'_small_description','field_5806bc33669cc'),(138,46,'bottom_image',''),(139,46,'_bottom_image','field_5806bc4c669cd'),(140,37,'large_description','Left Goat is a small web design and development firm. With a focus on stunning design and custom functionality, we have the the ambition and the experience to deliver a breathtaking web experience at <strong>quality unmatched</strong>.'),(141,37,'_large_description','field_5806bbd5669cb'),(142,37,'small_description','Welcome – we’re Left Goat, a small web design and development firm based in Whitefish, Montana. We specialize in exceptional design and custom functionality, and our top priorities include building productive and intimate relationships with our clients and delivering craftsmanship of the highest quality.  With ample experience in comprehensive web design, full-stack web development, external service integrations and more, our team is poised to deliver a stunning product, and we’re looking forward to working with you at every step.'),(143,37,'_small_description','field_5806bc33669cc'),(144,37,'bottom_image',''),(145,37,'_bottom_image','field_5806bc4c669cd'),(147,47,'large_description','Left Goat is a small web design and development firm. With a focus on stunning design and custom functionality, we have the the ambition and the experience to deliver a breathtaking web experience at <strong>quality unmatched</strong>.'),(148,47,'_large_description','field_5806bbd5669cb'),(149,47,'small_description','Welcome – we’re Left Goat, a small web design and development firm based in Whitefish, Montana. We specialize in exceptional design and custom functionality, and our top priorities include building productive and intimate relationships with our clients and delivering craftsmanship of the highest quality.  With ample experience in comprehensive web design, full-stack web development, external service integrations and more, our team is poised to deliver a stunning product, and we’re looking forward to working with you at every step.'),(150,47,'_small_description','field_5806bc33669cc'),(151,47,'bottom_image',''),(152,47,'_bottom_image','field_5806bc4c669cd'),(154,48,'list_introduction','We want your web project up in lights for the world to see: our main trade is the design and development of web experiences. This often includes the following:'),(155,48,'_list_introduction','field_5806bcc52bc4b'),(156,48,'services_list','Website, graphic and UI/UX design\r\nBrand design and development\r\nClient-side and server-side programming\r\nDeployment & continuing support\r\n'),(157,48,'_services_list','field_5806bcda2bc4c'),(158,48,'services_addendum','We also offer in-house photography and illustration services.  While we don’t write copy ourselves, we’re happy to involve trusted copywriters to help generate any written content you need.\r\n'),(159,48,'_services_addendum','field_5806bce52bc4d'),(160,13,'list_introduction','We want your web project up in lights for the world to see: our main trade is the design and development of web experiences. This often includes the following:'),(161,13,'_list_introduction','field_5806bcc52bc4b'),(162,13,'services_list','Website, graphic and UI/UX design\r\nBrand design and development\r\nClient-side and server-side programming\r\nDeployment & continuing support\r\n'),(163,13,'_services_list','field_5806bcda2bc4c'),(164,13,'services_addendum','We also offer in-house photography and illustration services.  While we don’t write copy ourselves, we’re happy to involve trusted copywriters to help generate any written content you need.\r\n'),(165,13,'_services_addendum','field_5806bce52bc4d'),(166,49,'text','Hiring us may well be the best decision you’ll make for your project, and we make it an easy choice.  From our first meeting onward, you’ll find us to be supportive partners and knowledgeable advisors, using our experience to guide your ideas in new and exciting ways and welcoming your engagement at each stage. Our robust design process develops a fully-refined depiction of how your product will look and act, all based on your input and feedback.  Our technological process is advanced: we craft well-researched, individualized solutions on a per-project basis out of the best platforms, services and libraries currently available.  Our attention to detail and quality is meticulous, incorporating iterative design processes and uncompromising product testing until our creations are as good as they can possibly be.  If you like the sound of that, we look forward to hearing from you!'),(167,49,'_text','field_5806bd1a8f23e'),(168,15,'text','Hiring us may well be the best decision you’ll make for your project, and we make it an easy choice.  From our first meeting onward, you’ll find us to be supportive partners and knowledgeable advisors, using our experience to guide your ideas in new and exciting ways and welcoming your engagement at each stage. Our robust design process develops a fully-refined depiction of how your product will look and act, all based on your input and feedback.  Our technological process is advanced: we craft well-researched, individualized solutions on a per-project basis out of the best platforms, services and libraries currently available.  Our attention to detail and quality is meticulous, incorporating iterative design processes and uncompromising product testing until our creations are as good as they can possibly be.  If you like the sound of that, we look forward to hearing from you!'),(169,15,'_text','field_5806bd1a8f23e'),(170,50,'text','We’re a brand new company, looking for brand new clients. \r\nLet’s create something together.'),(171,50,'_text','field_5806bdafa5947'),(172,33,'text','We’re a brand new company, looking for brand new clients. \r\nLet’s create something together.'),(173,33,'_text','field_5806bdafa5947'),(175,51,'title','Project Manager'),(176,51,'_title','field_5806bd74369c1'),(177,51,'photo',''),(178,51,'_photo','field_5806bd7c369c2'),(179,51,'bio',''),(180,51,'_bio','field_5806bd87369c3'),(181,23,'title','Project Manager'),(182,23,'_title','field_5806bd74369c1'),(183,23,'photo',''),(184,23,'_photo','field_5806bd7c369c2'),(185,23,'bio','After finishing at The University of Puget Sound with a degree in Computer Science, Pieter lived aboard a 31-foot sailboat traveling from Chicago to the Bahamas over the course of 7 months. Following the boat, he relocated to San Francisco and worked in operational and analytical roles for an advertising technology company. He brings the benefits of his corporate background to Left Goat, but also values the agile and dynamic nature of a small company. In addition to being Left Goat’s project manager and primary contact, Pieter oversees the health and daily functioning of the business.'),(186,23,'_bio','field_5806bd87369c3'),(187,52,'title','Graphic - UI/UX Designer'),(188,52,'_title','field_5806bd74369c1'),(189,52,'photo',''),(190,52,'_photo','field_5806bd7c369c2'),(191,52,'bio',''),(192,52,'_bio','field_5806bd87369c3'),(193,25,'title','Graphic - UI/UX Designer'),(194,25,'_title','field_5806bd74369c1'),(195,25,'photo',''),(196,25,'_photo','field_5806bd7c369c2'),(197,25,'bio','Holly comes from a background of interactive graphic design and photography. As a nature enthusiast, her creativity is fueled by the outdoors. Holly constantly researches the latest cutting edge design movements, to ensure your project comes out on top. She has a background in brand creation / management, along with information architecture and web design. Holly has worked with all types of clientele: small business, corporate establishments and billion-dollar nonprofits. Bringing experience to the Left Goat team.'),(198,25,'_bio','field_5806bd87369c3'),(199,53,'title','Web Developer'),(200,53,'_title','field_5806bd74369c1'),(201,53,'photo',''),(202,53,'_photo','field_5806bd7c369c2'),(203,53,'bio',''),(204,53,'_bio','field_5806bd87369c3'),(205,27,'title','Web Developer'),(206,27,'_title','field_5806bd74369c1'),(207,27,'photo',''),(208,27,'_photo','field_5806bd7c369c2'),(209,27,'bio','Splitting his undergraduate studies between architectural design and computer programming, his interests span the artistic to the technical.  Initially exposed to programming at the systems level, he likes writing in C and has a soft spot for segmentation faults.  Inspired by the infinite possibilities of web development, he has spent the last two years working on internet-based projects, assembling architectures and writing great front-end and back-end instructions in various languages that accomplish exciting feats of all kinds.  His other interests include drawing, architecture, AR/VR, skiing and pop music.'),(210,27,'_bio','field_5806bd87369c3'),(211,54,'title','Graphic - UI/UX Designer'),(212,54,'_title','field_5806bd74369c1'),(213,54,'photo',''),(214,54,'_photo','field_5806bd7c369c2'),(215,54,'bio','Holly comes from a background of interactive graphic design and photography. As a nature enthusiast, her creativity is fueled by the outdoors. Holly constantly researches the latest cutting edge design movements, to ensure your project comes out on top. She has a background in brand creation / management, along with information architecture and web design. Holly has worked with all types of clientele: small business, corporate establishments and billion-dollar nonprofits. Bringing experience to the Left Goat team.'),(216,54,'_bio','field_5806bd87369c3'),(221,55,'position','Project Manager'),(222,55,'_position','field_5806bd74369c1'),(223,55,'photo',''),(224,55,'_photo','field_5806bd7c369c2'),(225,55,'bio','After finishing at The University of Puget Sound with a degree in Computer Science, Pieter lived aboard a 31-foot sailboat traveling from Chicago to the Bahamas over the course of 7 months. Following the boat, he relocated to San Francisco and worked in operational and analytical roles for an advertising technology company. He brings the benefits of his corporate background to Left Goat, but also values the agile and dynamic nature of a small company. In addition to being Left Goat’s project manager and primary contact, Pieter oversees the health and daily functioning of the business.'),(226,55,'_bio','field_5806bd87369c3'),(227,23,'position','Project Manager'),(228,23,'_position','field_5806bd74369c1'),(230,56,'position',''),(231,56,'_position','field_5806bd74369c1'),(232,56,'_',''),(233,56,'bio','Splitting his undergraduate studies between architectural design and computer programming, his interests span the artistic to the technical.  Initially exposed to programming at the systems level, he likes writing in C and has a soft spot for segmentation faults.  Inspired by the infinite possibilities of web development, he has spent the last two years working on internet-based projects, assembling architectures and writing great front-end and back-end instructions in various languages that accomplish exciting feats of all kinds.  His other interests include drawing, architecture, AR/VR, skiing and pop music.'),(234,56,'_bio','field_5806bd87369c3'),(235,27,'position','Web Developer'),(236,27,'_position','field_5806bd74369c1'),(237,27,'_',''),(238,57,'position','Web Developer'),(239,57,'_position','field_5806bd74369c1'),(240,57,'bio','Splitting his undergraduate studies between architectural design and computer programming, his interests span the artistic to the technical.  Initially exposed to programming at the systems level, he likes writing in C and has a soft spot for segmentation faults.  Inspired by the infinite possibilities of web development, he has spent the last two years working on internet-based projects, assembling architectures and writing great front-end and back-end instructions in various languages that accomplish exciting feats of all kinds.  His other interests include drawing, architecture, AR/VR, skiing and pop music.'),(241,57,'_bio','field_5806bd87369c3'),(242,58,'position','Graphic – UI/UX Designer'),(243,58,'_position','field_5806bd74369c1'),(244,58,'bio','Holly comes from a background of interactive graphic design and photography. As a nature enthusiast, her creativity is fueled by the outdoors. Holly constantly researches the latest cutting edge design movements, to ensure your project comes out on top. She has a background in brand creation / management, along with information architecture and web design. Holly has worked with all types of clientele: small business, corporate establishments and billion-dollar nonprofits. Bringing experience to the Left Goat team.'),(245,58,'_bio','field_5806bd87369c3'),(246,25,'position','Graphic – UI/UX Designer'),(247,25,'_position','field_5806bd74369c1'),(249,30,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"10\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(250,30,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"10\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:1;}'),(251,35,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"6\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(252,42,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"33\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(253,39,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"13\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(254,41,'rule','a:5:{s:5:\"param\";s:11:\"page_parent\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"17\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(255,40,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"15\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(256,36,'rule','a:5:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"37\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),(257,60,'phone_number','406.272.3134'),(258,60,'_phone_number','field_5806b7f42b1b5'),(259,60,'email_address','hello@leftgoat.com'),(260,60,'_email_address','field_5806b80e2b1b6'),(261,60,'mailing_address','Left Goat LLC\r\n704C East 13th Street\r\nSuite 125\r\nWhitefish, MT 59937'),(262,60,'_mailing_address','field_5806b8192b1b7');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2016-10-18 18:59:55','2016-10-18 18:59:55','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2016-10-18 18:59:55','2016-10-18 18:59:55','',0,'http://localhost/?p=1',0,'post','',1),(6,1,'2016-10-18 23:53:51','2016-10-18 23:53:51','','Header','','publish','closed','closed','','header','','','2016-10-19 00:36:02','2016-10-19 00:36:02','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=6',1,'page','',0),(7,1,'2016-10-18 23:53:51','2016-10-18 23:53:51','','Header','','inherit','closed','closed','','6-revision-v1','','','2016-10-18 23:53:51','2016-10-18 23:53:51','',6,'http://leftgoat-dot-com.herokuapp.com/6-revision-v1',0,'revision','',0),(10,1,'2016-10-18 23:54:44','2016-10-18 23:54:44','','Main View','','publish','closed','closed','','main-view','','','2016-10-28 20:09:40','2016-10-28 20:09:40','',0,'http://leftgoat-dot-com.herokuapp.com/?page_id=10',1,'page','',0),(11,1,'2016-10-18 23:54:44','2016-10-18 23:54:44','','Main View','','inherit','closed','closed','','10-revision-v1','','','2016-10-18 23:54:44','2016-10-18 23:54:44','',10,'http://leftgoat-dot-com.herokuapp.com/10-revision-v1',0,'revision','',0),(13,1,'2016-10-18 23:55:57','2016-10-18 23:55:57','','Services','','publish','closed','closed','','services','','','2016-10-19 00:39:22','2016-10-19 00:39:22','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=13',3,'page','',0),(14,1,'2016-10-18 23:55:57','2016-10-18 23:55:57','','Services','','inherit','closed','closed','','13-revision-v1','','','2016-10-18 23:55:57','2016-10-18 23:55:57','',13,'http://leftgoat-dot-com.herokuapp.com/13-revision-v1',0,'revision','',0),(15,1,'2016-10-18 23:56:22','2016-10-18 23:56:22','','The Left Goat Difference','','publish','closed','closed','','the-left-goat-difference','','','2016-10-19 00:39:40','2016-10-19 00:39:40','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=15',4,'page','',0),(16,1,'2016-10-18 23:56:22','2016-10-18 23:56:22','','The Left Goat Difference','','inherit','closed','closed','','15-revision-v1','','','2016-10-18 23:56:22','2016-10-18 23:56:22','',15,'http://leftgoat-dot-com.herokuapp.com/15-revision-v1',0,'revision','',0),(17,1,'2016-10-18 23:56:45','2016-10-18 23:56:45','','Team','','publish','closed','closed','','team','','','2016-10-19 00:21:34','2016-10-19 00:21:34','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=17',5,'page','',0),(18,1,'2016-10-18 23:56:45','2016-10-18 23:56:45','','Team','','inherit','closed','closed','','17-revision-v1','','','2016-10-18 23:56:45','2016-10-18 23:56:45','',17,'http://leftgoat-dot-com.herokuapp.com/17-revision-v1',0,'revision','',0),(23,1,'2016-10-19 00:00:31','2016-10-19 00:00:31','','Pieter VerHaar','','publish','closed','closed','','pieter-verhaar','','','2016-10-22 02:52:28','2016-10-22 02:52:28','',17,'http://leftgoat-dot-com.herokuapp.com/?page_id=23',1,'page','',0),(24,1,'2016-10-19 00:00:31','2016-10-19 00:00:31','','Pieter VerHaar','','inherit','closed','closed','','23-revision-v1','','','2016-10-19 00:00:31','2016-10-19 00:00:31','',23,'http://leftgoat-dot-com.herokuapp.com/23-revision-v1',0,'revision','',0),(25,1,'2016-10-19 00:00:49','2016-10-19 00:00:49','','Holly Mandarich','','publish','closed','closed','','holly-mandarich','','','2016-10-22 02:54:19','2016-10-22 02:54:19','',17,'http://leftgoat-dot-com.herokuapp.com/?page_id=25',2,'page','',0),(26,1,'2016-10-19 00:00:49','2016-10-19 00:00:49','','Holly Mandarich','','inherit','closed','closed','','25-revision-v1','','','2016-10-19 00:00:49','2016-10-19 00:00:49','',25,'http://leftgoat-dot-com.herokuapp.com/25-revision-v1',0,'revision','',0),(27,1,'2016-10-19 00:00:59','2016-10-19 00:00:59','','Cody Leff','','publish','closed','closed','','cody-leff','','','2016-10-22 02:54:02','2016-10-22 02:54:02','',17,'http://leftgoat-dot-com.herokuapp.com/?page_id=27',3,'page','',0),(28,1,'2016-10-19 00:00:59','2016-10-19 00:00:59','','Cody Leff','','inherit','closed','closed','','27-revision-v1','','','2016-10-19 00:00:59','2016-10-19 00:00:59','',27,'http://leftgoat-dot-com.herokuapp.com/27-revision-v1',0,'revision','',0),(30,1,'2016-10-19 00:05:16','2016-10-19 00:05:16','','Contact Info','','publish','closed','closed','','acf_contact-info','','','2016-10-22 23:20:14','2016-10-22 23:20:14','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=30',0,'acf','',0),(33,1,'2016-10-19 00:12:45','2016-10-19 00:12:45','','Looking For Our Work?','','publish','closed','closed','','looking-for-our-work','','','2016-10-19 00:40:05','2016-10-19 00:40:05','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=33',6,'page','',0),(34,1,'2016-10-19 00:12:45','2016-10-19 00:12:45','','Looking For Our Work?','','inherit','closed','closed','','33-revision-v1','','','2016-10-19 00:12:45','2016-10-19 00:12:45','',33,'http://leftgoat-dot-com.herokuapp.com/33-revision-v1',0,'revision','',0),(35,1,'2016-10-19 00:18:11','2016-10-19 00:18:11','','Header','','publish','closed','closed','','acf_header','','','2016-10-22 23:20:39','2016-10-22 23:20:39','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=35',0,'acf','',0),(36,1,'2016-10-19 00:21:05','2016-10-19 00:21:05','','Who We Are','','publish','closed','closed','','acf_who-we-are','','','2016-10-22 23:23:55','2016-10-22 23:23:55','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=36',0,'acf','',0),(37,1,'2016-10-19 00:21:55','2016-10-19 00:21:55','','Who We Are','','publish','closed','closed','','who-we-are','','','2016-10-19 00:37:44','2016-10-19 00:37:44','',10,'http://leftgoat-dot-com.herokuapp.com/?page_id=37',2,'page','',0),(38,1,'2016-10-19 00:21:55','2016-10-19 00:21:55','','Who We Are','','inherit','closed','closed','','37-revision-v1','','','2016-10-19 00:21:55','2016-10-19 00:21:55','',37,'http://leftgoat-dot-com.herokuapp.com/37-revision-v1',0,'revision','',0),(39,1,'2016-10-19 00:23:30','2016-10-19 00:23:30','','Services','','publish','closed','closed','','acf_services','','','2016-10-22 23:21:19','2016-10-22 23:21:19','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=39',0,'acf','',0),(40,1,'2016-10-19 00:24:49','2016-10-19 00:24:49','','The Left Goat Difference','','publish','closed','closed','','acf_the-left-goat-difference','','','2016-10-22 23:21:42','2016-10-22 23:21:42','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=40',0,'acf','',0),(41,1,'2016-10-19 00:26:07','2016-10-19 00:26:07','','Team Member Bio','','publish','closed','closed','','acf_team-member-bio','','','2016-10-22 23:21:31','2016-10-22 23:21:31','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=41',0,'acf','',0),(42,1,'2016-10-19 00:26:57','2016-10-19 00:26:57','','Looking For Our Work?','','publish','closed','closed','','acf_looking-for-our-work','','','2016-10-22 23:20:55','2016-10-22 23:20:55','',0,'http://leftgoat-dot-com.herokuapp.com/?post_type=acf&#038;p=42',0,'acf','',0),(43,1,'2016-10-19 00:30:45','2016-10-19 00:30:45','','Main View','','inherit','closed','closed','','10-revision-v1','','','2016-10-19 00:30:45','2016-10-19 00:30:45','',10,'http://leftgoat-dot-com.herokuapp.com/10-revision-v1',0,'revision','',0),(44,1,'2016-10-19 00:35:50','2016-10-19 00:35:50','','Header','','inherit','closed','closed','','6-revision-v1','','','2016-10-19 00:35:50','2016-10-19 00:35:50','',6,'http://leftgoat-dot-com.herokuapp.com/6-revision-v1',0,'revision','',0),(45,1,'2016-10-19 00:36:02','2016-10-19 00:36:02','','Header','','inherit','closed','closed','','6-revision-v1','','','2016-10-19 00:36:02','2016-10-19 00:36:02','',6,'http://leftgoat-dot-com.herokuapp.com/6-revision-v1',0,'revision','',0),(46,1,'2016-10-19 00:36:36','2016-10-19 00:36:36','','Who We Are','','inherit','closed','closed','','37-revision-v1','','','2016-10-19 00:36:36','2016-10-19 00:36:36','',37,'http://leftgoat-dot-com.herokuapp.com/37-revision-v1',0,'revision','',0),(47,1,'2016-10-19 00:37:44','2016-10-19 00:37:44','','Who We Are','','inherit','closed','closed','','37-revision-v1','','','2016-10-19 00:37:44','2016-10-19 00:37:44','',37,'http://leftgoat-dot-com.herokuapp.com/37-revision-v1',0,'revision','',0),(48,1,'2016-10-19 00:39:22','2016-10-19 00:39:22','','Services','','inherit','closed','closed','','13-revision-v1','','','2016-10-19 00:39:22','2016-10-19 00:39:22','',13,'http://leftgoat-dot-com.herokuapp.com/13-revision-v1',0,'revision','',0),(49,1,'2016-10-19 00:39:40','2016-10-19 00:39:40','','The Left Goat Difference','','inherit','closed','closed','','15-revision-v1','','','2016-10-19 00:39:40','2016-10-19 00:39:40','',15,'http://leftgoat-dot-com.herokuapp.com/15-revision-v1',0,'revision','',0),(50,1,'2016-10-19 00:40:05','2016-10-19 00:40:05','','Looking For Our Work?','','inherit','closed','closed','','33-revision-v1','','','2016-10-19 00:40:05','2016-10-19 00:40:05','',33,'http://leftgoat-dot-com.herokuapp.com/33-revision-v1',0,'revision','',0),(51,1,'2016-10-19 00:42:19','2016-10-19 00:42:19','','Pieter VerHaar','','inherit','closed','closed','','23-revision-v1','','','2016-10-19 00:42:19','2016-10-19 00:42:19','',23,'http://leftgoat-dot-com.herokuapp.com/23-revision-v1',0,'revision','',0),(52,1,'2016-10-19 00:42:37','2016-10-19 00:42:37','','Holly Mandarich','','inherit','closed','closed','','25-revision-v1','','','2016-10-19 00:42:37','2016-10-19 00:42:37','',25,'http://leftgoat-dot-com.herokuapp.com/25-revision-v1',0,'revision','',0),(53,1,'2016-10-19 00:43:06','2016-10-19 00:43:06','','Cody Leff','','inherit','closed','closed','','27-revision-v1','','','2016-10-19 00:43:06','2016-10-19 00:43:06','',27,'http://leftgoat-dot-com.herokuapp.com/27-revision-v1',0,'revision','',0),(54,1,'2016-10-19 00:43:50','2016-10-19 00:43:50','','Holly Mandarich','','inherit','closed','closed','','25-revision-v1','','','2016-10-19 00:43:50','2016-10-19 00:43:50','',25,'http://leftgoat-dot-com.herokuapp.com/25-revision-v1',0,'revision','',0),(55,1,'2016-10-22 02:52:28','2016-10-22 02:52:28','','Pieter VerHaar','','inherit','closed','closed','','23-revision-v1','','','2016-10-22 02:52:28','2016-10-22 02:52:28','',23,'http://local.dev/23-revision-v1',0,'revision','',0),(56,1,'2016-10-22 02:53:40','2016-10-22 02:53:40','','Cody Leff','','inherit','closed','closed','','27-revision-v1','','','2016-10-22 02:53:40','2016-10-22 02:53:40','',27,'http://local.dev/27-revision-v1',0,'revision','',0),(57,1,'2016-10-22 02:54:02','2016-10-22 02:54:02','','Cody Leff','','inherit','closed','closed','','27-revision-v1','','','2016-10-22 02:54:02','2016-10-22 02:54:02','',27,'http://local.dev/27-revision-v1',0,'revision','',0),(58,1,'2016-10-22 02:54:19','2016-10-22 02:54:19','','Holly Mandarich','','inherit','closed','closed','','25-revision-v1','','','2016-10-22 02:54:19','2016-10-22 02:54:19','',25,'http://local.dev/25-revision-v1',0,'revision','',0),(60,1,'2016-10-28 20:09:40','2016-10-28 20:09:40','','Main View','','inherit','closed','closed','','10-revision-v1','','','2016-10-28 20:09:40','2016-10-28 20:09:40','',10,'http://local.dev/10-revision-v1',0,'revision','',0),(61,1,'2016-12-14 07:52:37','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2016-12-14 07:52:37','0000-00-00 00:00:00','',0,'http://leftgoat-dot-com-new.dev/?p=61',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','Cody'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers',''),(13,1,'show_welcome_panel','0'),(14,1,'session_tokens','a:2:{s:64:\"c72fa428a8be6d875293560658f8907b4a20c181f429a311ae7fa5a3b679e7cf\";a:4:{s:10:\"expiration\";i:1481874757;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36\";s:5:\"login\";i:1481701957;}s:64:\"bbe5d82b807bc61ad3dc742188c816c554f61458ebf0d132c32feb3787901644\";a:4:{s:10:\"expiration\";i:1481874809;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36\";s:5:\"login\";i:1481702009;}}'),(15,1,'wp_dashboard_quick_press_last_post_id','61'),(16,1,'closedpostboxes_page','a:0:{}'),(17,1,'metaboxhidden_page','a:11:{i:0;s:6:\"acf_30\";i:1;s:6:\"acf_42\";i:2;s:6:\"acf_39\";i:3;s:6:\"acf_41\";i:4;s:6:\"acf_40\";i:5;s:6:\"acf_36\";i:6;s:12:\"revisionsdiv\";i:7;s:10:\"postcustom\";i:8;s:16:\"commentstatusdiv\";i:9;s:11:\"commentsdiv\";i:10;s:9:\"authordiv\";}'),(18,1,'as3cf_dismissed_notices','a:1:{i:0;s:53:\"as3cf-notice-c440ccf6253a2a391937f019361ae7bb0f81b56c\";}'),(19,1,'wp_user-settings','libraryContent=browse'),(20,1,'wp_user-settings-time','1477104623'),(21,1,'locale','');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'Cody','$P$BIYfm2XWE.Gdt0CxF3VQbEKhtiS1gB1','cody','cody@leftgoat.com','','2016-10-18 18:59:55','',0,'Cody');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-14  7:55:08
