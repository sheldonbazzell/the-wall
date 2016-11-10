-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: the_wall
-- ------------------------------------------------------
-- Server version	5.6.33

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (14,4,29,'My first comment','2016-11-09 17:26:22','2016-11-09 17:26:22'),(15,4,29,'My newest comment goes here','2016-11-09 17:29:32','2016-11-09 17:29:32'),(16,4,28,'this comment','2016-11-09 17:32:03','2016-11-09 17:32:03'),(17,4,33,'Commente here','2016-11-09 17:46:23','2016-11-09 17:46:23'),(18,7,37,'My first comment','2016-11-09 17:56:46','2016-11-09 17:56:46'),(19,4,37,'Te amo','2016-11-09 17:56:59','2016-11-09 17:56:59'),(29,21,45,'Jacob on his post. Jacob on his post. Jacob on his post. Jacob on his post. Jacob on his post. ','2016-11-09 21:48:06','2016-11-09 21:48:06'),(30,7,46,'That is so sweet Cami. ','2016-11-09 21:55:53','2016-11-09 21:55:53'),(31,23,46,'Aw guys.','2016-11-09 21:56:52','2016-11-09 21:56:52'),(32,23,46,'Shucks','2016-11-09 21:56:56','2016-11-09 21:56:56'),(35,7,45,'Comment on Jakes message','2016-11-10 10:12:45','2016-11-10 10:12:45'),(38,7,53,'His comment here. His comment here. His comment here. His comment here. His comment here. ','2016-11-10 10:22:24','2016-11-10 10:22:24');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (26,NULL,'My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. My first message. ','2016-11-09 08:45:35','2016-11-09 08:45:35'),(45,21,'Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. Jacob\'s first message here. ','2016-11-09 21:47:55','2016-11-09 21:47:55'),(53,7,'Sheldons first message.','2016-11-10 10:22:23','2016-11-10 10:22:23');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Claudia','Bazzell','claudiagfloriano@gmail.com','2016-11-08 20:04:21','2016-11-08 20:04:21','$2b$12$xV3XtxvEMrq.l.zhAAgSjeUPJ.ydhfeijHLAwDY6oaeHUGcfNCkhq'),(5,'Sheldon','Bazzell','sheldon.bazzell@gmail.com','2016-11-09 17:47:40','2016-11-09 17:47:40','$2b$12$j3Opp7Gk6HefHMOP2941jO2ZU8jMJq96PqmoTOTt0AaFkc6CFUhIW'),(6,'Sheldon','Bazzell','sheldon.bazzell@gmail.com','2016-11-09 17:48:35','2016-11-09 17:48:35','$2b$12$5R7CdS4001fxPP7gbx9HeOqKQ9rTcO1kIY7q4Jk/V/DY/ZU2CnSve'),(7,'Sheldon','Bazzell','sheldon@gmail.com','2016-11-09 17:50:53','2016-11-09 17:50:53','$2b$12$581HlGPfRz.L2e1eayLsmukbryl20ksg6FiFwfvK09bY6N2A6D/Su'),(8,'Claudia','Floriano','claudiagfloriano@gmail.com','2016-11-09 19:37:03','2016-11-09 19:37:03','$2b$12$418A8NPSGF1qgc3QVM1T7.I21Oco2kg5DyJOxcyP7Z1gVSODiU/.6'),(9,'Jacob Maxwell','Bazzell','jmb@gmail.com','2016-11-09 19:39:18','2016-11-09 19:39:18','$2b$12$umaUWq8PGJD2rnfH2YSEWOqo2y/RMY64m3IRrgCH4vqJCLUrnzJaS'),(10,'Jacob Maxwell','Bazzell','jmb@gmail.com','2016-11-09 19:41:28','2016-11-09 19:41:28','$2b$12$dI1e8R77uns/0SaUByh8/esYv28m/jVfnegdiRSf9NyCG0M0.A362'),(11,'Jacob Maxwell','Bazzell','jmb@gmail.com','2016-11-09 19:42:49','2016-11-09 19:42:49','$2b$12$rHppN4prcXZth7UiXHWSa.B1NaMo98J2wlCrtJUCiL0YDWSj.gSVG'),(12,'Jacob Maxwell','Bazzell','claudiagfloriano@gmail.com','2016-11-09 19:56:53','2016-11-09 19:56:53','$2b$12$8AZ.loifVAtDIDiLqIArvOEcSiuuddByFoKBszQLe84lkLtH28M9y'),(13,'Jacob','Bazz','jmb@gmail.com','2016-11-09 20:00:54','2016-11-09 20:00:54','$2b$12$ro/KM1iYQ/yQu1VkpW2t2ONGeZRSEwaEvN8jMagIIG49eA1oNdBpe'),(14,'Jacob Maxwell','Bazzell','JMBG@gmail.com','2016-11-09 20:06:15','2016-11-09 20:06:15','$2b$12$n.1L6APwSjzHXwGi7ADpSeYRFgGO9Evo7VEMvRPCSpJcA44/7kvCC'),(15,'Jacob Max','Baz','jb@gmail.com','2016-11-09 20:16:58','2016-11-09 20:16:58','$2b$12$UqxavKj/jr1Odg6AV.KkweyxMWjWrWQJFGJTfN/ythw2OviWGF8Aa'),(16,'Jacob','Bazzell','sh@gmail.com','2016-11-09 20:19:34','2016-11-09 20:19:34','$2b$12$o2CDufap8YtNIxyOt4ule.4N0h6SBhBfy1ib6tzjBBYbXSjxU6X0y'),(17,'Jacob','Bazzell','jb@gmail.com','2016-11-09 20:20:33','2016-11-09 20:20:33','$2b$12$xn2tEmPnPPeoayoP7ripjeO6SSrKcQ8MFAIWX1ioIqJBAT4OHS26S'),(18,'Jacob ','Bazzell','sb@gamil.com','2016-11-09 20:21:46','2016-11-09 20:21:46','$2b$12$Sn1XydOLz2mWqXVfe1hG/O6bAM6F0MI4b6uVzIFWN81xhqv52Q.nq'),(19,'Jacob','Max','sb@ga.com','2016-11-09 21:00:44','2016-11-09 21:00:44','$2b$12$E4Zygy/cxSpSbNf9Rldt3OLp.p5YX0ev2M4TlSnm9lz.VBu3166p2'),(20,'Jacob','Max','jb@gamil.com','2016-11-09 21:11:57','2016-11-09 21:11:57','$2b$12$.FvjyEi3/1KQgU1r5cZ1peQg2Ebvot0GEw8onJ3k0NR887.FAxu8m'),(21,'Jake','Max','jmax@gmail.com','2016-11-09 21:47:44','2016-11-09 21:47:44','$2b$12$N8JsPg0.izlHJcw8zCUsn.pmmhhZhjjOCbTEvwqYUSoeAgl4TKMzq'),(22,'Camila','Bazzell','camila@hotmail.com','2016-11-09 21:54:08','2016-11-09 21:54:08','$2b$12$I0cjuE4oZid65t9MTz7d9OKUMPA.Kb1mks/tuslF1LeS1xsayf6eK'),(23,'Claudia','Bazzell','claudiagfloriano@gmail.com','2016-11-09 21:56:47','2016-11-09 21:56:47','$2b$12$C9SustRjK6eXqzVY9gUCdOCKwEKUgbu1VsScHuxSoR1JJja/NMtPa');
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

-- Dump completed on 2016-11-10 10:26:04
