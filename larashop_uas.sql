-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: larashop_uas
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

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
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_category_book_id_foreign` (`book_id`),
  KEY `book_category_category_id_foreign` (`category_id`),
  CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (1,3,6,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(2,3,7,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(3,13,3,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(4,9,7,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(5,4,3,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(6,13,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(7,7,2,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(8,5,7,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(9,9,4,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(10,3,8,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(11,8,6,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(12,5,5,'2021-12-26 21:35:25','2021-12-26 21:35:25');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_order_order_id_foreign` (`order_id`),
  KEY `book_order_book_id_foreign` (`book_id`),
  CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (1,3,3,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(2,6,3,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(3,7,5,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(4,7,5,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(5,4,5,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(6,1,4,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(7,10,11,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(8,12,4,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(9,4,5,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(10,10,14,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(11,11,3,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(12,7,2,1,'2021-12-26 21:35:25','2021-12-26 21:35:25'),(13,3,7,1,'2021-12-26 21:35:25','2021-12-26 21:35:25');
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Ipsam necessitatibus qui.','ipsam-necessitatibus-qui','Explicabo et repudiandae eaque. Aperiam nobis laboriosam laboriosam voluptatibus. Ut omnis velit accusantium inventore quam eveniet. Nihil consequatur odio minima qui et maxime qui. Molestias mollitia dolor quis. Id non impedit illo. Nisi et nisi dolores voluptatem quasi perspiciatis ut.','Paulin Usada M.Kom.','CV Prakasa Rahmawati Tbk','books-cover/nocover.png',100000.00,0,0,'DRAFT',5,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(2,'Est cumque qui reiciendis.','est-cumque-qui-reiciendis','Dicta atque fugiat amet eligendi voluptatem. Consequuntur voluptas dolorem deserunt eos et nihil. Atque animi nobis officiis quos totam tenetur. Quia tempore quia dolor voluptatem ratione tenetur. Est rerum quibusdam dolor quisquam eum et est.','Kayla Hariyah','Perum Aryani Usamah Tbk','books-cover/nocover.png',100000.00,0,0,'DRAFT',4,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(3,'Aperiam maiores maxime fuga.','aperiam-maiores-maxime-fuga','Sint reiciendis tenetur corporis temporibus fuga consequatur. Est recusandae optio laudantium qui quia est. Recusandae non laudantium facilis dicta non sed molestias. Eaque dolores pariatur dolor harum pariatur dolor.','Salwa Siska Pertiwi','PD Ardianto','books-cover/nocover.png',100000.00,0,0,'DRAFT',5,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(4,'Repellendus odit eius explicabo.','repellendus-odit-eius-explicabo','Nisi quae sit aliquid corrupti aut voluptatibus omnis eum. Commodi rerum quos laudantium laboriosam. Numquam quisquam aut harum est incidunt facilis excepturi. Rerum soluta dolores velit qui est consectetur tempora. Sapiente officia non rem nihil voluptates quod vel non.','Reza Suwarno S.Ked','CV Lailasari (Persero) Tbk','books-cover/nocover.png',100000.00,0,0,'DRAFT',4,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(5,'Qui repellat consequatur.','qui-repellat-consequatur','Ut facilis repellendus itaque corrupti esse quibusdam non. Maxime expedita maiores consequatur in. Quia tempore nihil ratione sed delectus rem pariatur. Earum dolor voluptatum perspiciatis totam. Velit est vitae tenetur voluptas necessitatibus pariatur.','Zalindra Mayasari','CV Marbun (Persero) Tbk','books-cover/nocover.png',100000.00,0,0,'PUBLISH',6,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(6,'Nesciunt totam dolores.','nesciunt-totam-dolores','Minus rerum in placeat ratione aut nostrum natus. Libero accusamus consequuntur facilis mollitia. Dolorem aut mollitia nisi eum. Dolores voluptatem minus inventore quis facere. Sed ex consequatur ab excepturi praesentium est doloribus nemo.','Rahayu Zulaika','CV Santoso (Persero) Tbk','books-cover/nocover.png',100000.00,0,0,'DRAFT',6,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(7,'Odit omnis esse qui.','odit-omnis-esse-qui','Quidem voluptatem ex nulla harum voluptatem quas quia. Eligendi nostrum voluptatem distinctio excepturi temporibus molestiae sint. Et in sunt hic molestiae fugiat consequatur.','Halima Tina Hastuti S.Sos','PT Andriani Uwais','books-cover/nocover.png',100000.00,0,0,'DRAFT',8,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24',NULL),(8,'Quia fuga natus blanditiis est.','quia-fuga-natus-blanditiis-est','Quaerat velit dolorum exercitationem iure at ex accusamus. Aut eligendi cupiditate error aspernatur labore praesentium rerum. Doloribus delectus ducimus accusamus dolorem et totam.','Julia Salwa Aryani S.Psi','PD Uyainah Mayasari (Persero) Tbk','books-cover/nocover.png',100000.00,0,0,'PUBLISH',3,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(9,'Est dolorem sed ut.','est-dolorem-sed-ut','Eum omnis dolore veniam omnis dolores et officia rerum. Commodi fugiat harum in hic nihil saepe. Aut aut et voluptates dolorem odit quo occaecati. Eos recusandae sint architecto omnis quas enim. Nam necessitatibus et odio aut non optio optio. Delectus ea ut quia omnis veritatis ipsum dolores.','Wardi Rajata','PD Zulkarnain Oktaviani','books-cover/nocover.png',100000.00,0,0,'DRAFT',5,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(10,'Aperiam laborum iste.','aperiam-laborum-iste','Sed occaecati nulla placeat voluptatem sequi neque dolor. Vel ut fugit inventore voluptate. Qui est perspiciatis tempora iste beatae. At et optio asperiores. Ab qui ipsa ea quos. Similique eius occaecati in. Unde incidunt rem dolorem facere error atque.','Padmi Nurdiyanti','UD Dabukke Nasyidah','books-cover/nocover.png',100000.00,0,0,'DRAFT',2,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(11,'Cupiditate similique pariatur.','cupiditate-similique-pariatur','Quis quae voluptatem sunt voluptatum doloremque. Debitis et saepe rerum et. Cum praesentium rerum hic itaque animi culpa sequi. Dolor molestiae architecto quas repellat ullam explicabo.','Najwa Utami M.Pd','PT Usada Pertiwi Tbk','books-cover/nocover.png',100000.00,0,0,'DRAFT',10,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(12,'Et sed voluptatibus.','et-sed-voluptatibus','Dolor rem beatae esse sed. Quod iste ipsam et aspernatur cupiditate qui. Aliquid voluptatem voluptatem voluptatum error necessitatibus at eum.','Carub Abyasa Ramadan S.E.I','Perum Hidayat Tbk','books-cover/nocover.png',100000.00,0,0,'PUBLISH',8,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(13,'Quis laborum alias.','quis-laborum-alias','Rerum necessitatibus laboriosam laboriosam ex velit debitis. Provident ad saepe blanditiis. Consequatur id deleniti placeat repellendus consequatur ullam.','Clara Gasti Fujiati S.Gz','UD Nababan Siregar (Persero) Tbk','books-cover/nocover.png',100000.00,0,0,'PUBLISH',7,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL),(14,'Eos placeat earum.','eos-placeat-earum','Fugiat nemo et aut. Quae ea rerum nesciunt quam. Et tenetur voluptatem sit perspiciatis veniam. Dolores occaecati accusamus eos accusamus. Eum quo non dolor. Ea nihil et eum quos id. Eos commodi quis et consequatur autem nostrum minima.','Tugiman Ardianto','PD Astuti Susanti','books-cover/nocover.png',100000.00,0,0,'DRAFT',5,NULL,NULL,'2021-12-26 21:35:25','2021-12-26 21:35:25',NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Action','action','categories-image/nopic.png',7,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(2,'Fantasy','fantasy','categories-image/nopic.png',4,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(3,'Comedy','comedy','categories-image/nopic.png',6,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(4,'Horror','horror','categories-image/nopic.png',10,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(5,'Romance','romance','categories-image/nopic.png',2,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(6,'Thriller','thriller','categories-image/nopic.png',3,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(7,'Martial Art','martial-art','categories-image/nopic.png',3,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(8,'Isekai','isekai','categories-image/nopic.png',8,NULL,NULL,NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24');
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_12_14_000001_create_personal_access_tokens_table',1),(4,'2021_12_25_061940_create_categories_table',1),(5,'2021_12_26_030223_create_books_table',1),(6,'2021_12_26_031012_create_book_category_table',1),(7,'2021_12_27_012312_create_orders_table',1),(8,'2021_12_27_012343_create_book_order_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `total_price` double(8,2) unsigned NOT NULL DEFAULT 0.00,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,0.00,'GHHLKQNA','SUBMIT','2021-12-26 21:35:25','2021-12-26 21:35:25'),(2,12,0.00,'XSMGIFIL','CANCEL','2021-12-26 21:35:25','2021-12-26 21:35:25'),(3,8,0.00,'NDPKQE4N','PROCESS','2021-12-26 21:35:25','2021-12-26 21:35:25'),(4,12,0.00,'ZFNUHDGO','SUBMIT','2021-12-26 21:35:25','2021-12-26 21:35:25'),(5,11,0.00,'TTJVFH37TFS','PROCESS','2021-12-26 21:35:25','2021-12-26 21:35:25'),(6,7,0.00,'YFAYGZ5C','FINISH','2021-12-26 21:35:25','2021-12-26 21:35:25'),(7,12,0.00,'PJKVEDYQWD1','PROCESS','2021-12-26 21:35:25','2021-12-26 21:35:25'),(8,8,0.00,'GFYYYC1S','CANCEL','2021-12-26 21:35:25','2021-12-26 21:35:25'),(9,1,0.00,'IICZEQCP','FINISH','2021-12-26 21:35:25','2021-12-26 21:35:25'),(10,13,0.00,'PDTUGVR51ZT','PROCESS','2021-12-26 21:35:25','2021-12-26 21:35:25'),(11,8,0.00,'TJBRKWT4WP9','PROCESS','2021-12-26 21:35:25','2021-12-26 21:35:25'),(12,9,0.00,'FJKWAGFD3HJ','FINISH','2021-12-26 21:35:25','2021-12-26 21:35:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Site Administrator','admin@larashop.test','admin','[\"ADMIN\"]','Sarmili, Bintaro, Tanggerang Selatan','0823','avatars/nopic.png','ACTIVE',NULL,'$2y$10$YGgiOYv2Fo0E4P59CrNSjeLrjebOCL1aZwe5QgUuSjUoFBcZcJAN2',NULL,'2021-12-26 21:35:23','2021-12-26 21:35:23'),(2,'Oktavian Yoga','yoga@gmail.com  ','yogatra','[\"CUSTOMER\"]','Sangasanga','0823','avatars/nopic.png','ACTIVE',NULL,'$2y$10$ynKYsFF0lYp8QcpeSQb2jOaj8O1.PQWfb/Wrimxcvwn/LBHR4FuCS',NULL,'2021-12-26 21:35:23','2021-12-26 21:35:23'),(3,'Dagel Adriansyah','hutagalung.amalia@gmail.co.id','laksita.eka','[\"STAFF\",\"CUSTOMER\",\"ADMIN\"]','Ki. Nanas No. 125, Denpasar 21433, Sulteng','(+62) 467 8327 690','avatars/nopic.png','ACTIVE',NULL,'$2y$10$Ldt6CH/i8Ft9aj93Q9GgU.zUO.983DWSH6AEiMpvyNHL4Zucd/jeu',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(4,'Putri Padmi Wahyuni','gadang.mahendra@winarno.my.id','karen65','[\"STAFF\"]','Ki. Gotong Royong No. 714, Ambon 19437, Kalbar','(+62) 407 9918 9539','avatars/nopic.png','ACTIVE',NULL,'$2y$10$.4TaU9uwzGjKJiYlZE7yg.Ofk7aVybidfZF7NlrCb1CEhIjAWNul2',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(5,'Pangeran Setiawan S.T.','salman.rahmawati@gmail.co.id','dbudiyanto','[\"STAFF\"]','Jln. Bak Air No. 594, Sungai Penuh 48501, Papua','(+62) 24 3164 197','avatars/nopic.png','ACTIVE',NULL,'$2y$10$pMeGv18IP8SYV3lLr8mCMeIWLDeV0XEsU4Y/8OXPTFc6CSBf4kKSu',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(6,'Oni Puspita','diana38@gmail.com','ikhsan03','[\"CUSTOMER\"]','Gg. Baya Kali Bungur No. 966, Ambon 48607, Malut','(+62) 491 4918 4301','avatars/nopic.png','ACTIVE',NULL,'$2y$10$JwRyuh1oPN8RkF8hOEROCelN.o4GZGoUdaP8EsxP6CP0PCfI6seA2',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(7,'Elvina Namaga','pertiwi.vanesa@gmail.com','mulyanto80','[\"ADMIN\"]','Ki. Radio No. 453, Bima 33421, Lampung','028 4956 0680','avatars/nopic.png','ACTIVE',NULL,'$2y$10$TaR1jSWYC8xDBstnOEvLX.bdslRTIOM8zOIOMpkvJb8JKKgrXbkLO',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(8,'Maimunah Namaga','salman.hakim@mustofa.desa.id','novitasari.ophelia','[\"STAFF\"]','Dk. Krakatau No. 665, Padangpanjang 78455, Bengkulu','025 0857 369','avatars/nopic.png','ACTIVE',NULL,'$2y$10$nyKOycFrls7a8EoApyeWtuHuV1M4YHcx6eT.6FMbrbAsY/HEyOuty',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(9,'Adika Maulana S.Kom','latupono.lukita@natsir.ac.id','usamah.kusuma','[\"ADMIN\"]','Jr. Abdullah No. 815, Bandung 50488, Gorontalo','0969 0846 5937','avatars/nopic.png','ACTIVE',NULL,'$2y$10$tJ18YekhV3Zsn4RD9flymeiVyC9ib6CB.jqOFy52HjTHuWYM56dm2',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(10,'Edi Nainggolan','gilda.natsir@riyanti.in','wfujiati','[\"STAFF\"]','Jr. Ketandan No. 757, Blitar 75616, Riau','(+62) 541 3041 6872','avatars/nopic.png','ACTIVE',NULL,'$2y$10$K11/85HSC6ZKkuD5y9mRFegdNSqJhZwAgGpm/rf649uHJ64vr0/lS',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(11,'Kunthara Prasetyo','tpuspasari@gmail.com','irma.hassanah','[\"ADMIN\"]','Ki. Jambu No. 810, Sawahlunto 16485, Bali','0803 2128 080','avatars/nopic.png','ACTIVE',NULL,'$2y$10$fJriSD3siL/FWCAVo5o1aeky/ix5xPqFMHo6y.eZug2yQuYO3CsBe',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(12,'Ihsan Bahuwarna Salahudin','smahendra@simbolon.asia','fnajmudin','[\"ADMIN\",\"CUSTOMER\"]','Gg. Wahidin No. 659, Salatiga 59279, Jabar','0520 3507 069','avatars/nopic.png','ACTIVE',NULL,'$2y$10$bu7x8u2zLt9/tz7Uf0g7pOa1Eyy2FIGjenx3BVJgK2ccn.015393G',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(13,'Mutia Uchita Laksmiwati','galiono42@yahoo.com','puspita.nurul','[\"CUSTOMER\"]','Ki. Reksoninten No. 661, Administrasi Jakarta Timur 65527, NTB','0415 3118 2553','avatars/nopic.png','ACTIVE',NULL,'$2y$10$EwjWKCyf9DXgljJ/EufeI.CwlVZiFqLpfTqtn6VyeDmzPmvDTZF8K',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(14,'Kamila Anggraini S.Kom','haryanto.sarah@yahoo.com','novitasari.prasetyo','[\"STAFF\",\"CUSTOMER\",\"ADMIN\"]','Dk. Sumpah Pemuda No. 444, Palembang 38534, Kaltara','(+62) 739 0769 3883','avatars/nopic.png','ACTIVE',NULL,'$2y$10$nDSAwfyNjX4bosDn5F17reCljOODQHl2DRXULoh.nagJFlj3N53sO',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(15,'Labuh Lanjar Budiyanto S.Kom','januar.jatmiko@gmail.com','hasan.lailasari','[\"CUSTOMER\",\"STAFF\"]','Jr. Labu No. 966, Padang 49715, Bengkulu','(+62) 540 3649 721','avatars/nopic.png','ACTIVE',NULL,'$2y$10$HaaS43hH1CJySNzqLu0Mt.bmDMUa3ikhC0grMokh8aDdQKyEM.9rK',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24'),(16,'Heru Sidiq Kuswoyo S.Pd','hafshah.utami@yahoo.co.id','riyanti.kamila','[\"STAFF\",\"CUSTOMER\",\"ADMIN\"]','Psr. Laksamana No. 637, Pasuruan 66786, Sulteng','(+62) 237 2490 3389','avatars/nopic.png','ACTIVE',NULL,'$2y$10$qpx2i2v6qdKu/2yj98iBa.JXgfYq3OxvtDA/70BsO6GdBl6zlI0da',NULL,'2021-12-26 21:35:24','2021-12-26 21:35:24');
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

-- Dump completed on 2021-12-27 13:46:00
