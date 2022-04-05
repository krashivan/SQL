-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: wiki
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(100) NOT NULL COMMENT 'Название обсуждения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Обсуждения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (1,'augue','2021-02-25 05:19:11','2021-08-24 04:54:54'),(2,'montes,','2021-08-29 21:02:17','2021-01-18 14:17:04'),(3,'ligula.','2021-09-22 03:51:51','2021-12-29 02:53:03'),(4,'tristique','2021-09-30 10:02:58','2022-03-21 03:57:47'),(5,'pellentesque.','2021-11-18 11:48:49','2021-05-01 11:44:05'),(6,'Curabitur','2022-02-18 00:19:41','2022-02-08 17:35:11'),(7,'cursus.','2021-05-22 12:08:59','2021-11-29 18:41:47'),(8,'vitae','2021-09-04 23:28:47','2022-03-09 19:31:58'),(9,'venenatis','2021-05-25 09:36:33','2022-02-04 14:05:40'),(10,'mauris','2021-02-15 05:30:29','2021-03-26 15:38:48');
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `filename` varchar(255) NOT NULL COMMENT 'Полный путь к файлу',
  `media_type_id` bigint unsigned NOT NULL COMMENT 'Ссылка на тип файла',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_media_type_id` (`media_type_id`),
  CONSTRAINT `media_media_type_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'cursus et, magna.',7,'2021-12-15 16:02:58','2021-05-11 22:31:20'),(2,'blandit enim consequat purus. Maecenas',3,'2022-09-10 14:07:08','2020-12-13 03:02:10'),(3,'Mauris',1,'2021-08-30 06:05:41','2021-05-19 07:41:31'),(4,'iaculis odio. Nam',6,'2022-05-18 11:13:10','2020-11-07 18:08:46'),(5,'ipsum sodales purus, in molestie',8,'2022-04-24 14:31:32','2022-06-21 00:56:07'),(6,'Morbi metus. Vivamus euismod urna.',1,'2021-08-22 15:05:01','2021-04-11 15:06:38'),(7,'pede, malesuada vel,',7,'2020-12-05 02:39:48','2021-03-05 21:02:35'),(8,'dui nec urna suscipit',10,'2021-12-03 02:37:40','2022-03-09 10:43:07'),(9,'lectus ante dictum mi,',3,'2021-06-14 04:22:46','2022-03-08 09:32:53'),(10,'ante dictum',2,'2021-06-17 00:41:54','2021-07-19 07:37:34');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_topics`
--

DROP TABLE IF EXISTS `media_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_topics` (
  `media_id` bigint unsigned NOT NULL COMMENT 'Ссылка на медиа файл',
  `topic_id` bigint unsigned NOT NULL COMMENT 'Ссылка на статью',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`media_id`,`topic_id`) COMMENT 'Составной первичный ключ',
  KEY `link_to_topics_M` (`topic_id`),
  CONSTRAINT `link_to_media` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `link_to_topics_M` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Связь между медиа файлами и статьями';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_topics`
--

LOCK TABLES `media_topics` WRITE;
/*!40000 ALTER TABLE `media_topics` DISABLE KEYS */;
INSERT INTO `media_topics` VALUES (2,8,'2022-08-04 22:46:14','2021-12-24 19:44:21'),(3,10,'2022-08-20 01:19:45','2020-10-21 05:07:21'),(6,2,'2021-10-19 10:13:53','2022-08-31 13:56:36'),(6,5,'2022-08-16 23:28:49','2021-05-31 15:30:16'),(7,7,'2022-01-05 06:49:53','2021-09-19 16:57:48'),(8,6,'2022-08-09 17:23:16','2022-01-20 01:21:34'),(9,5,'2020-10-08 04:24:55','2022-06-26 03:27:26'),(9,6,'2022-03-10 15:56:32','2020-10-24 19:54:48'),(9,7,'2022-05-17 23:15:47','2021-06-23 03:47:20'),(9,9,'2021-01-22 19:53:41','2022-09-06 22:07:28');
/*!40000 ALTER TABLE `media_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'urna.','2021-08-11 10:16:01','2022-08-01 03:01:09'),(2,'magna.','2020-11-27 03:44:22','2020-11-02 22:38:31'),(3,'orci','2021-06-02 13:03:17','2022-03-08 14:08:09'),(4,'nec','2020-11-06 19:59:07','2021-10-20 15:32:30'),(5,'at,','2022-01-18 15:05:19','2020-12-13 15:15:34'),(6,'Nam','2020-10-20 20:09:15','2020-10-13 23:00:04'),(7,'quis','2021-10-27 14:53:21','2021-05-06 01:33:57'),(8,'felis','2022-01-27 21:16:30','2021-08-22 17:31:08'),(9,'net','2022-04-28 10:50:37','2022-08-17 22:23:59'),(10,'velit.','2020-10-17 06:45:46','2021-10-31 07:17:20');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` bigint unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` bigint unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `discussion_id` bigint unsigned NOT NULL COMMENT 'Ссылка на обсуждение',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  KEY `messages_discussion` (`discussion_id`),
  CONSTRAINT `messages_discussion` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,2,10,'tincidunt dui augue eu',0,'2020-10-11 23:52:53','2021-06-18 17:36:21'),(2,4,7,10,'Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod',1,'2021-04-11 08:57:59','2022-09-28 14:30:29'),(3,7,4,3,'augue id ante',1,'2022-05-27 22:24:15','2021-09-07 11:13:56'),(4,9,1,9,'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus',0,'2022-05-21 14:07:12','2020-11-15 13:14:18'),(5,8,6,10,'nunc nulla vulputate dui, nec tempus mauris erat eget',0,'2021-06-17 22:15:30','2020-12-02 15:02:38'),(6,7,10,5,'nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium',1,'2021-06-17 05:54:36','2021-12-08 09:34:19'),(7,9,7,3,'dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam',0,'2021-04-22 12:47:09','2021-04-23 21:02:59'),(8,9,5,5,'neque sed sem egestas blandit. Nam',0,'2021-04-28 13:41:04','2021-01-29 15:09:07'),(9,2,3,4,'ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam',1,'2022-05-09 19:09:36','2022-09-23 09:04:28'),(10,10,5,5,'lobortis tellus justo sit amet nulla. Donec non justo. Proin',1,'2021-11-29 08:39:03','2021-07-12 20:08:36');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_users`
--

DROP TABLE IF EXISTS `messages_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_users` (
  `message_id` bigint unsigned NOT NULL COMMENT 'Ссылка на сообщение',
  `user_id` bigint unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`message_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `link_to_users` (`user_id`),
  CONSTRAINT `link_to_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `link_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Связь между ссылками на источник и статьями';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_users`
--

LOCK TABLES `messages_users` WRITE;
/*!40000 ALTER TABLE `messages_users` DISABLE KEYS */;
INSERT INTO `messages_users` VALUES (1,5,'2021-03-20 17:55:58','2021-07-19 14:52:24'),(3,9,'2022-03-13 00:53:42','2021-11-28 15:40:25'),(3,10,'2021-03-23 04:50:17','2020-11-25 01:38:41'),(4,6,'2022-05-24 09:56:14','2021-03-10 01:34:46'),(4,7,'2021-12-19 10:57:47','2021-09-02 01:50:34'),(4,8,'2022-06-18 00:08:13','2022-05-15 05:14:41'),(6,1,'2021-10-12 10:23:02','2021-12-31 21:37:38'),(7,1,'2020-12-10 06:53:55','2022-05-08 15:22:09'),(9,6,'2021-02-26 08:54:59','2022-08-10 14:25:04'),(10,8,'2020-11-22 13:47:13','2022-03-27 02:54:34');
/*!40000 ALTER TABLE `messages_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `status` enum('Online','Offline','Inactive') NOT NULL COMMENT 'Текущий статус',
  `topics_created` int unsigned DEFAULT NULL COMMENT 'Количество написанных статей',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица профилей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Online',59,'2021-08-31 23:20:14','2021-11-29 03:53:35'),(2,'Online',67,'2021-08-01 07:06:58','2021-03-28 03:16:31'),(3,'Online',53,'2021-02-14 03:53:51','2022-09-11 10:36:55'),(4,'Online',1,'2021-07-03 00:50:02','2022-04-14 15:28:09'),(5,'Online',89,'2022-05-18 10:57:41','2021-11-04 09:46:58'),(6,'Online',3,'2020-12-11 11:36:13','2022-08-05 21:04:03'),(7,'Online',41,'2020-11-29 12:27:10','2022-09-15 21:49:29'),(8,'Online',5,'2021-12-30 21:12:06','2020-12-21 04:07:11'),(9,'Online',41,'2020-11-10 04:25:52','2021-09-21 14:47:33'),(10,'Online',41,'2021-06-24 14:23:33','2021-09-04 13:26:14');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `refs_text` text NOT NULL COMMENT 'Текст ссылки на источник',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ссылки на источник';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
INSERT INTO `refs` VALUES (1,'quam. Pellentesque habitant morbi tristique senectus et netus','2020-12-23 03:22:12','2021-01-31 19:34:51'),(2,'in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque','2021-05-07 21:58:11','2022-05-21 08:41:55'),(3,'mollis. Phasellus libero mauris, aliquam eu, accumsan sed,','2021-08-20 05:42:06','2022-05-04 03:42:02'),(4,'Vestibulum ut eros non enim commodo hendrerit. Donec','2021-08-16 16:35:43','2020-12-25 05:57:45'),(5,'feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,','2021-03-13 19:18:41','2021-05-03 00:57:31'),(6,'Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum','2022-06-09 06:14:06','2020-10-24 16:28:12'),(7,'Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros','2022-05-08 11:06:29','2021-07-08 22:40:48'),(8,'fringilla cursus purus. Nullam scelerisque neque sed sem','2022-06-14 01:54:01','2022-07-19 02:29:24'),(9,'Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed','2020-11-29 10:52:20','2021-07-26 06:49:52'),(10,'sollicitudin commodo','2022-01-30 12:22:30','2021-03-01 08:20:30');
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs_topics`
--

DROP TABLE IF EXISTS `refs_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refs_topics` (
  `refs_id` bigint unsigned NOT NULL COMMENT 'Ссылка на ссылку на источник',
  `topic_id` bigint unsigned NOT NULL COMMENT 'Ссылка на статью',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`refs_id`,`topic_id`) COMMENT 'Составной первичный ключ',
  KEY `link_to_topics_R` (`topic_id`),
  CONSTRAINT `link_to_refs` FOREIGN KEY (`refs_id`) REFERENCES `refs` (`id`),
  CONSTRAINT `link_to_topics_R` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Связь между ссылками на источник и статьями';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs_topics`
--

LOCK TABLES `refs_topics` WRITE;
/*!40000 ALTER TABLE `refs_topics` DISABLE KEYS */;
INSERT INTO `refs_topics` VALUES (1,5,'2021-08-05 00:05:10','2020-12-26 11:38:17'),(1,7,'2021-02-10 17:39:54','2021-02-07 09:39:53'),(2,6,'2021-12-15 04:32:14','2021-03-18 03:48:22'),(3,5,'2021-06-27 00:32:38','2021-06-18 10:58:12'),(4,6,'2021-07-22 08:21:20','2021-01-09 18:24:56'),(5,5,'2021-06-28 13:45:59','2021-10-17 03:15:13'),(6,8,'2021-07-10 23:21:36','2020-11-18 22:34:23'),(6,10,'2022-04-05 03:50:21','2021-12-10 20:32:29'),(9,7,'2022-02-06 20:03:54','2021-04-24 14:17:33'),(10,10,'2020-12-17 16:09:38','2022-09-09 09:20:47');
/*!40000 ALTER TABLE `refs_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` bigint unsigned NOT NULL COMMENT 'Создатель статьи',
  `body` text NOT NULL COMMENT 'Текст статьи',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `topics_user_id` (`user_id`),
  CONSTRAINT `topics_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,8,'eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est','2022-06-07 07:11:53','2021-12-31 03:49:40'),(2,1,'et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac','2020-11-27 10:23:58','2022-03-26 20:24:42'),(3,2,'Vivamus nisi. Mauris nulla. Integer urna.','2022-01-15 21:56:40','2022-04-10 09:27:18'),(4,5,'molestie pharetra nibh. Aliquam ornare, libero at auctor','2020-12-15 21:39:52','2021-01-06 03:30:46'),(5,1,'mauris. Morbi','2021-12-08 15:54:29','2021-07-14 13:33:24'),(6,5,'sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec','2021-10-24 09:18:14','2022-03-12 10:23:46'),(7,6,'diam','2021-08-28 08:49:00','2020-11-24 06:51:50'),(8,8,'amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2020-10-10 08:47:04','2022-06-23 05:18:18'),(9,10,'imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit,','2021-06-29 10:13:04','2021-07-27 09:29:01'),(10,4,'nascetur ridiculus','2021-06-14 14:51:42','2021-10-24 13:04:27');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` bigint unsigned NOT NULL COMMENT 'Ссылка на редактора статьи',
  `topic_id` bigint unsigned NOT NULL COMMENT 'Ссылка на статью',
  `name` varchar(100) NOT NULL COMMENT 'Название исправления',
  `body` text NOT NULL COMMENT 'Список изменений',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `updates_users` (`user_id`),
  KEY `updates_topics` (`topic_id`),
  CONSTRAINT `updates_topics` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  CONSTRAINT `updates_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Правки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (1,4,9,'a, aliquet vel, vulputate eu, odio. Phasellus at augue id','dapibus ligula. Aliquam erat volutpat. Nulla dignissim.','2022-04-02 16:23:35'),(2,6,9,'turpis non enim. Mauris quis turpis vitae purus gravida sagittis.','Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor','2021-11-19 00:47:42'),(3,5,6,'euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,','per conubia nostra, per inceptos','2022-02-07 09:49:06'),(4,2,1,'amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat','Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui','2022-06-30 18:15:40'),(5,6,9,'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam','hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim.','2021-03-21 15:59:42'),(6,7,4,'ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit','quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci','2021-05-01 23:16:58'),(7,7,1,'eget varius ultrices, mauris ipsum porta elit, a feugiat tellus','nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum','2022-07-30 16:44:29'),(8,2,6,'ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla','Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non','2020-12-04 14:35:41'),(9,10,2,'mattis ornare, lectus ante dictum mi, ac mattis velit justo','est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus','2022-01-27 06:23:15'),(10,5,2,'eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,','nibh. Quisque nonummy ipsum non arcu.','2021-10-25 08:01:44');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) NOT NULL COMMENT 'Email пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sybil','Donovan','porttitor.vulputate.posuere@velitegestaslacinia.net','2020-10-18 20:37:09','2022-01-18 03:38:02'),(2,'Allistair','Hanson','odio@temporestac.co.uk','2021-10-14 10:54:06','2020-11-12 13:29:07'),(3,'Carl','Richardson','sodales.purus.in@nascetur.co.uk','2022-03-09 05:49:17','2021-07-28 07:38:20'),(4,'Simon','Walton','donec.dignissim@habitantmorbi.net','2021-07-24 10:09:41','2021-12-16 00:40:28'),(5,'Helen','Fleming','turpis.aliquam.adipiscing@ipsumdolorsit.net','2021-09-05 12:38:59','2021-04-12 09:09:03'),(6,'Quinlan','Key','ultrices@fermentumrisusat.com','2021-01-20 03:17:13','2022-09-28 22:31:16'),(7,'Alfonso','Stephenson','nam@venenatisa.net','2021-02-03 01:27:00','2021-04-23 10:06:06'),(8,'Giacomo','Howard','egestas.duis@egestasfuscealiquet.org','2021-12-24 15:44:09','2020-11-07 12:28:57'),(9,'Aline','Dalton','quis.lectus@dolorsit.com','2020-11-08 04:49:52','2021-11-09 01:47:07'),(10,'Ima','Flynn','suspendisse@in.edu','2021-05-15 16:42:11','2022-03-10 01:42:32');
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

-- Dump completed on 2021-10-07 20:13:28