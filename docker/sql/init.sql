-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'natus','2025-07-19 13:39:52','2025-07-19 13:39:52'),(2,'ratione','2025-07-19 13:39:52','2025-07-19 13:39:52'),(3,'velit','2025-07-19 13:39:52','2025-07-19 13:39:52'),(4,'odio','2025-07-19 13:39:52','2025-07-19 13:39:52'),(5,'vel','2025-07-19 13:39:52','2025-07-19 13:39:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025_07_19_185334_create_users_table',1),(2,'2025_07_19_190038_create_categories_table',1),(3,'2025_07_19_190110_create_products_table',1),(4,'2025_07_19_190151_create_orders_table',1),(5,'2025_07_19_190210_create_order_items_table',1),(6,'2025_07_19_191149_create_sessions_table',2),(7,'2025_07_19_191356_create_cache_table',3),(8,'2025_07_19_193841_add_address_to_orders_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,39,4,291.23,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(2,2,44,2,436.02,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(3,2,5,2,368.77,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(4,2,50,5,93.75,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(5,2,36,5,419.68,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(6,2,31,4,380.98,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(7,3,3,4,317.63,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(8,3,42,1,453.51,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(9,4,14,1,429.78,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(10,4,14,4,429.78,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(11,4,1,3,185.95,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(12,5,5,1,368.77,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(13,5,10,4,332.04,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(14,5,9,1,347.78,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(15,6,37,2,216.56,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(16,7,7,1,305.20,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(17,8,34,1,67.14,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(18,8,6,1,127.55,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(19,8,9,3,347.78,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(20,8,24,2,27.24,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(21,9,7,5,305.20,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(22,9,38,2,254.15,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(23,9,10,2,332.04,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(24,9,48,2,334.87,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(25,10,11,2,379.48,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(26,10,21,3,429.08,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(27,11,49,5,222.07,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(28,11,25,2,76.65,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(29,12,22,2,30.29,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(30,12,42,3,453.51,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(31,13,28,5,449.06,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(32,13,21,1,429.08,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(33,14,50,4,93.75,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(34,14,48,4,334.87,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(35,14,19,3,491.96,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(36,15,3,5,317.63,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(37,15,37,2,216.56,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(38,15,16,3,304.37,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(39,16,30,3,96.28,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(40,16,24,4,27.24,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(41,16,25,3,76.65,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(42,17,50,5,93.75,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(43,17,39,1,291.23,'2025-07-19 13:39:55','2025-07-19 13:39:55'),(44,18,26,5,139.71,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(45,18,4,4,393.39,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(46,18,36,4,419.68,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(47,19,23,2,118.09,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(48,19,48,3,334.87,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(49,19,3,5,317.63,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(51,20,25,2,76.65,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(52,20,25,2,76.65,'2025-07-19 13:39:56','2025-07-19 13:39:56'),(54,21,19,1,491.96,'2025-07-19 14:09:42','2025-07-19 14:09:42');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `total` decimal(10,2) NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'completed',1164.92,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(2,1,'pending',5700.65,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(3,2,'completed',1724.03,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(4,2,'pending',2706.75,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(5,3,'completed',2044.71,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(6,3,'completed',433.12,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(7,4,'pending',305.20,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(8,4,'completed',1292.51,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(9,5,'completed',3368.12,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(10,5,'pending',2046.20,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(11,6,'pending',1263.65,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(12,6,'completed',1421.11,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(13,7,'completed',2674.38,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(14,7,'completed',3190.36,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(15,8,'pending',2934.38,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(16,8,'pending',627.75,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(17,9,'completed',759.98,'','2025-07-19 13:39:55','2025-07-19 13:39:55'),(18,9,'pending',3950.83,'','2025-07-19 13:39:55','2025-07-19 13:39:56'),(19,10,'pending',2828.94,'','2025-07-19 13:39:56','2025-07-19 13:39:56'),(20,10,'completed',1610.94,'','2025-07-19 13:39:56','2025-07-19 13:39:56'),(21,12,'pending',491.96,'hihibjhbhb','2025-07-19 14:09:42','2025-07-19 14:09:42');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'nam ab','Quia assumenda aliquam repellat minima et necessitatibus.',185.95,'https://via.placeholder.com/640x480.png/003366?text=similique','2025-07-19 13:39:52','2025-07-19 13:39:52'),(2,1,'et et','Omnis sed autem voluptatem harum et.',331.13,'https://via.placeholder.com/640x480.png/00eebb?text=cupiditate','2025-07-19 13:39:52','2025-07-19 13:39:52'),(3,1,'dolore molestiae','Rerum quis aperiam recusandae.',317.63,'https://via.placeholder.com/640x480.png/00bbff?text=hic','2025-07-19 13:39:52','2025-07-19 13:39:52'),(4,1,'alias pariatur','Molestiae rerum debitis ullam esse.',393.39,'https://via.placeholder.com/640x480.png/008877?text=pariatur','2025-07-19 13:39:52','2025-07-19 13:39:52'),(5,1,'doloribus velit','Ipsam ut rerum nihil quaerat eligendi.',368.77,'https://via.placeholder.com/640x480.png/009977?text=recusandae','2025-07-19 13:39:52','2025-07-19 13:39:52'),(6,1,'rerum est','Illum nam repellendus autem quasi totam molestias.',127.55,'https://via.placeholder.com/640x480.png/00aadd?text=sunt','2025-07-19 13:39:52','2025-07-19 13:39:52'),(7,1,'sunt eum','Nostrum quas nihil fuga in id autem harum.',305.20,'https://via.placeholder.com/640x480.png/009922?text=dolores','2025-07-19 13:39:52','2025-07-19 13:39:52'),(8,1,'provident tempore','Quisquam dicta accusamus natus tenetur et nam omnis.',272.38,'https://via.placeholder.com/640x480.png/00aaaa?text=accusantium','2025-07-19 13:39:52','2025-07-19 13:39:52'),(9,1,'ut eos','Minus nulla dolorem commodi sed repellendus corporis adipisci.',347.78,'https://via.placeholder.com/640x480.png/006622?text=molestiae','2025-07-19 13:39:52','2025-07-19 13:39:52'),(10,1,'nam vitae','Doloribus reprehenderit non reiciendis rerum vitae voluptatem.',332.04,'https://via.placeholder.com/640x480.png/0088cc?text=et','2025-07-19 13:39:52','2025-07-19 13:39:52'),(11,2,'iusto laborum','Libero expedita ut quaerat iusto.',379.48,'https://via.placeholder.com/640x480.png/007766?text=velit','2025-07-19 13:39:52','2025-07-19 13:39:52'),(12,2,'quos eius','Ut optio dolores officia tempore.',29.49,'https://via.placeholder.com/640x480.png/005599?text=sunt','2025-07-19 13:39:52','2025-07-19 13:39:52'),(13,2,'rem omnis','Non quidem corporis dolor et.',233.79,'https://via.placeholder.com/640x480.png/00dd33?text=ut','2025-07-19 13:39:52','2025-07-19 13:39:52'),(14,2,'in voluptas','Id similique suscipit excepturi repellat aperiam ex beatae.',429.78,'https://via.placeholder.com/640x480.png/000055?text=expedita','2025-07-19 13:39:52','2025-07-19 13:39:52'),(15,2,'sint tempora','Consequuntur optio ducimus aliquid sapiente voluptates architecto eos soluta.',468.05,'https://via.placeholder.com/640x480.png/005555?text=quis','2025-07-19 13:39:52','2025-07-19 13:39:52'),(16,2,'ut voluptatem','Consequatur commodi omnis minus eligendi et facilis.',304.37,'https://via.placeholder.com/640x480.png/007744?text=totam','2025-07-19 13:39:52','2025-07-19 13:39:52'),(17,2,'ratione animi','Recusandae adipisci cupiditate et esse.',145.32,'https://via.placeholder.com/640x480.png/0088ee?text=rerum','2025-07-19 13:39:52','2025-07-19 13:39:52'),(19,2,'esse molestias','Voluptates quisquam aut commodi magni atque ipsum quisquam.',491.96,'https://via.placeholder.com/640x480.png/0077ff?text=repellat','2025-07-19 13:39:53','2025-07-19 13:39:53'),(20,2,'et doloremque','Quis voluptatibus reprehenderit inventore rerum repellat deserunt hic.',435.06,'https://via.placeholder.com/640x480.png/002233?text=non','2025-07-19 13:39:53','2025-07-19 13:39:53'),(21,3,'necessitatibus error','Fugit velit ipsum culpa esse id.',429.08,'https://via.placeholder.com/640x480.png/0066bb?text=accusantium','2025-07-19 13:39:53','2025-07-19 13:39:53'),(22,3,'repellendus non','Beatae sit recusandae officia laborum ut.',30.29,'https://via.placeholder.com/640x480.png/000088?text=quia','2025-07-19 13:39:53','2025-07-19 13:39:53'),(23,3,'placeat odio','Possimus deserunt accusamus a incidunt quis minus deserunt nostrum.',118.09,'https://via.placeholder.com/640x480.png/004499?text=exercitationem','2025-07-19 13:39:53','2025-07-19 13:39:53'),(24,3,'et id','Repudiandae et earum aspernatur laborum.',27.24,'https://via.placeholder.com/640x480.png/007733?text=quaerat','2025-07-19 13:39:53','2025-07-19 13:39:53'),(25,3,'aperiam fuga','Nihil inventore facilis omnis tempora eos.',76.65,'https://via.placeholder.com/640x480.png/0033bb?text=magnam','2025-07-19 13:39:53','2025-07-19 13:39:53'),(26,3,'dolorem quia','Quia quia esse numquam fugiat ut ut.',139.71,'https://via.placeholder.com/640x480.png/005522?text=explicabo','2025-07-19 13:39:53','2025-07-19 13:39:53'),(27,3,'voluptatem voluptatem','Consequatur sit molestias enim qui.',446.93,'https://via.placeholder.com/640x480.png/000088?text=nam','2025-07-19 13:39:53','2025-07-19 13:39:53'),(28,3,'modi accusantium','Aliquid voluptas placeat ipsa mollitia molestiae nihil.',449.06,'https://via.placeholder.com/640x480.png/00ccff?text=blanditiis','2025-07-19 13:39:53','2025-07-19 13:39:53'),(29,3,'quisquam ipsa','Saepe velit error et nam.',264.34,'https://via.placeholder.com/640x480.png/0055ff?text=quibusdam','2025-07-19 13:39:53','2025-07-19 13:39:53'),(30,3,'quo iste','Unde quos corporis temporibus optio numquam eos a.',96.28,'https://via.placeholder.com/640x480.png/004488?text=nihil','2025-07-19 13:39:53','2025-07-19 13:39:53'),(31,4,'sit qui','Modi illo perspiciatis aut laborum.',380.98,'https://via.placeholder.com/640x480.png/000044?text=ut','2025-07-19 13:39:53','2025-07-19 13:39:53'),(32,4,'sit praesentium','Esse et ut quia est dicta.',252.94,'https://via.placeholder.com/640x480.png/005533?text=est','2025-07-19 13:39:53','2025-07-19 13:39:53'),(33,4,'dolor qui','Laborum autem aliquam dolores dolores amet omnis.',96.02,'https://via.placeholder.com/640x480.png/006688?text=quo','2025-07-19 13:39:53','2025-07-19 13:39:53'),(34,4,'unde illo','Qui rem maxime ut perspiciatis unde temporibus dolor.',67.14,'https://via.placeholder.com/640x480.png/003333?text=consequuntur','2025-07-19 13:39:53','2025-07-19 13:39:53'),(35,4,'in et','Adipisci quasi quia id voluptas.',291.55,'https://via.placeholder.com/640x480.png/004488?text=est','2025-07-19 13:39:53','2025-07-19 13:39:53'),(36,4,'aut doloribus','Iusto dolorem sequi et doloribus.',419.68,'https://via.placeholder.com/640x480.png/00ddee?text=quisquam','2025-07-19 13:39:53','2025-07-19 13:39:53'),(37,4,'repellat expedita','Quo quis inventore eos excepturi rerum iure.',216.56,'https://via.placeholder.com/640x480.png/0066ee?text=nulla','2025-07-19 13:39:53','2025-07-19 13:39:53'),(38,4,'debitis unde','Rerum ducimus est labore et vel similique.',254.15,'https://via.placeholder.com/640x480.png/0088aa?text=ea','2025-07-19 13:39:53','2025-07-19 13:39:53'),(39,4,'quo in','Officiis amet delectus cum iusto quo autem voluptatum ipsum.',291.23,'https://via.placeholder.com/640x480.png/00eeff?text=est','2025-07-19 13:39:53','2025-07-19 13:39:53'),(40,4,'sit consectetur','Amet voluptatum nostrum tempora qui eum.',185.63,'https://via.placeholder.com/640x480.png/004433?text=ipsa','2025-07-19 13:39:53','2025-07-19 13:39:53'),(41,5,'sed non','Odit similique sed minima iure ut nihil repudiandae laborum.',422.60,'https://via.placeholder.com/640x480.png/0011aa?text=fugiat','2025-07-19 13:39:53','2025-07-19 13:39:53'),(42,5,'aut aspernatur','Aut doloribus et dicta necessitatibus omnis blanditiis eum ipsa.',453.51,'https://via.placeholder.com/640x480.png/00bb99?text=quae','2025-07-19 13:39:53','2025-07-19 13:39:53'),(43,5,'soluta architecto','Quia omnis ea esse laudantium neque.',198.22,'https://via.placeholder.com/640x480.png/003377?text=itaque','2025-07-19 13:39:53','2025-07-19 13:39:53'),(44,5,'qui aliquid','Veritatis soluta molestiae sint nihil natus non.',436.02,'https://via.placeholder.com/640x480.png/00ccee?text=et','2025-07-19 13:39:53','2025-07-19 13:39:53'),(45,5,'eius quas','Consequuntur ipsum est enim.',172.13,'https://via.placeholder.com/640x480.png/006622?text=eveniet','2025-07-19 13:39:53','2025-07-19 13:39:53'),(46,5,'vel ab','Error ea qui veniam illo nulla.',10.69,'https://via.placeholder.com/640x480.png/006600?text=culpa','2025-07-19 13:39:53','2025-07-19 13:39:53'),(47,5,'similique laboriosam','Perspiciatis repudiandae omnis et eius illo repellendus.',458.94,'https://via.placeholder.com/640x480.png/001166?text=exercitationem','2025-07-19 13:39:53','2025-07-19 13:39:53'),(48,5,'maiores accusamus','Voluptatem ea excepturi impedit reiciendis nemo aut.',334.87,'https://via.placeholder.com/640x480.png/00bb00?text=delectus','2025-07-19 13:39:53','2025-07-19 13:39:53'),(49,5,'animi tenetur','Quo rem eum fugiat et nostrum.',222.07,'https://via.placeholder.com/640x480.png/0088ff?text=doloribus','2025-07-19 13:39:53','2025-07-19 13:39:53'),(50,5,'error fugiat','Corrupti consequatur quaerat corrupti eveniet illo eaque vel.',93.75,'https://via.placeholder.com/640x480.png/00ff44?text=sunt','2025-07-19 13:39:53','2025-07-19 13:39:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('QJpmmdBaXSLiSo1Cv99So4VITOa4eFpUC2fZwooT',12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoieFhqU1l6ZFgyOVhrZmlzdlppRXJ1cVFoc1MyQ3l6UmIzVWY5SXNURiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0cy9jcmVhdGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMjt9',1752954922);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ricardo Cruickshank','okuneva.brando@example.net','2025-07-19 13:39:53','$2y$12$alQNjwppCuEcjlLo3HNYe.4KdPyeTTp1xCN.GHGyhzOxdIxRmxe7O','1zXOdQq6Dz','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(2,'Shannon Schulist','laura.tromp@example.net','2025-07-19 13:39:53','$2y$12$rRMaN2WPwtLpE6eiuvlo2ub/yhx5BUynqbhV98qzxlaaMtmgGh9/i','kywVr0K2M0','admin','2025-07-19 13:39:55','2025-07-19 13:39:55'),(3,'Ansley Lesch','upredovic@example.org','2025-07-19 13:39:53','$2y$12$5QS17jIIuQg9dR/KfILKw.VZu.GaYIt4ZWUXEdoz/owxszDMsze6q','JdQQfORmf8','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(4,'Nicola Erdman','ferry.liza@example.net','2025-07-19 13:39:53','$2y$12$74WzS.zgBPz2NlChvcS0t.Q1UFgwo4ssVmFtpc.z0ap.z.VIj.awC','waLzt4xDoD','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(5,'Abigail Keebler','hammes.winona@example.com','2025-07-19 13:39:54','$2y$12$Pb.w90WECLlX62dlXqzcZOWINskQN3x938ydYICdFOPkalUfZB0t2','t2a8HDMDCt','admin','2025-07-19 13:39:55','2025-07-19 13:39:55'),(6,'Alfreda Jenkins','heller.emmet@example.org','2025-07-19 13:39:54','$2y$12$M1w0lnW4RTMPTqLNPeBCqeUgSIJ7lSbfhZx9PIW.rNdAdzY43ExRO','qG4KeSV6WQ','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(7,'Annalise Weber','clifford88@example.org','2025-07-19 13:39:54','$2y$12$iTL927W4vVUGvFvTV7wA5.6rJAMgcjywiFJ.qoA7INljB5y.GuI6y','Ir7dOTf9UW','admin','2025-07-19 13:39:55','2025-07-19 13:39:55'),(8,'Rosie Sipes','mquitzon@example.com','2025-07-19 13:39:54','$2y$12$YDnnTQ4NYcYACZfJmFSOZOT/S9gYWtg.U1OJunCgqBXycDT4jMDFu','g0zXthun5B','admin','2025-07-19 13:39:55','2025-07-19 13:39:55'),(9,'Mr. Brice Bashirian','kari.boyle@example.com','2025-07-19 13:39:54','$2y$12$AfafjKv/PugtwJdEf/HKqeM3kqXb9YFGqSOmdaQQuC887a4dgQIcq','loNVIGM6ja','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(10,'Bernita Hickle','rosendo.wyman@example.org','2025-07-19 13:39:55','$2y$12$l6vR6o.fJuaZC5eNZwCla.6lKini1G.pxilt73le5P74KAhhRMKhW','tlTzNzbFNd','user','2025-07-19 13:39:55','2025-07-19 13:39:55'),(11,'Admin User','admin@example.com','2025-07-19 13:39:56','$2y$12$NP5Sfp3K9PCAk5NL5Bv5XOntosUf7mc1DM1aOGSVdgsMEgjz1tRCC','9EDdLrzN7L','admin','2025-07-19 13:39:56','2025-07-19 13:39:56'),(12,'Mukul Anand','mukulanand.dev@gmail.com',NULL,'$2y$12$6n3IDTXvk5IYUmc24CsR3OTYEoSr1/eaBd2ON./PLe9Eh66AipDpa',NULL,'admin','2025-07-19 13:45:08','2025-07-19 13:45:08');
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

-- Dump completed on 2025-07-20 12:06:11
