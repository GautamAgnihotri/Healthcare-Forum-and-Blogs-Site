CREATE DATABASE  IF NOT EXISTS `techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `techblog`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: techblog
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Diseases','This categories is for blogs related to diseases'),(2,'Healthcare','This category is for blogs related to healthcare');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liked`
--

DROP TABLE IF EXISTS `liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `postlike_idx` (`pid`),
  KEY `userlike_idx` (`uid`),
  CONSTRAINT `postlike` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`),
  CONSTRAINT `userlike` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liked`
--

LOCK TABLES `liked` WRITE;
/*!40000 ALTER TABLE `liked` DISABLE KEYS */;
INSERT INTO `liked` VALUES (1,1,2),(2,1,2),(3,1,2),(4,1,2),(5,1,2),(6,1,2),(7,1,2),(8,1,2),(9,1,2),(10,1,2),(11,1,2),(12,1,1),(13,1,2),(14,1,2),(15,1,2),(16,1,2),(17,1,2),(18,1,2),(19,1,2),(20,1,2),(21,1,2),(22,1,2),(23,5,3),(24,5,3),(25,5,3),(26,5,3),(27,5,3),(28,5,3),(29,5,3),(30,5,3),(31,5,3),(32,5,3),(33,5,3),(34,5,3),(35,5,3),(36,5,3),(37,5,3),(38,5,3),(39,5,3),(40,5,3),(41,5,3),(42,5,3),(43,5,3),(44,5,3),(45,5,3),(46,5,3),(47,5,3),(48,5,3),(49,5,3),(50,5,3),(51,2,1),(52,2,1),(53,2,1),(54,2,1),(55,5,1),(56,2,1),(57,5,1),(58,2,1);
/*!40000 ALTER TABLE `liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext NOT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `pDescription` longtext NOT NULL,
  `uId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`catId`),
  CONSTRAINT `cid` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'AIDS','                                     AIDS/HIV\r\nAcquired immunodeficiency syndrome (AIDS) is a chronic, potentially life-threatening condition caused by the human immunodeficiency virus (HIV). By damaging your immune system, HIV interferes with your body\'s ability to fight infection and disease.\r\n\r\nHIV is a sexually transmitted infection (STI). It can also be spread by contact with infected blood and from illicit injection drug use or sharing needles. It can also be spread from mother to child during pregnancy, childbirth or breastfeeding. Without medication, it may take years before HIV weakens your immune system to the point that you have AIDS.\r\n\r\nThere\'s no cure for HIV/AIDS, but medications can control the infection and prevent progression of the disease. Antiviral treatments for HIV have reduced AIDS deaths around the world, and international organizations are working to increase the availability of prevention measures and treatment in resource-poor countries.\r\n\r\n                                         \r\nThe signs and symptoms of some of these infections may include:\r\n\r\n        Sweats\r\n        Chills\r\n        Recurring fever\r\n        Chronic diarrhea\r\n        Swollen lymph glands\r\n        Persistent white spots or unusual lesions on your tongue or in your mouth\r\n        Persistent, unexplained fatigue\r\n        Weakness\r\n        Weight loss\r\n        Skin rashes or bumps\r\n\r\n o) Causes:-\r\n\r\nHIV is caused by a virus. It can spread through sexual contact, illicit injection drug use or sharing needles, contact with infected blood, or from mother to child during pregnancy, childbirth or breastfeeding.\r\n\r\nHIV destroys CD4 T cells â white blood cells that play a large role in helping your body fight disease. The fewer CD4 T cells you have, the weaker your immune system becomes.\r\n\r\no)  How does HIV become AIDS?\r\n\r\nYou can have an HIV infection, with few or no symptoms, for years before it turns into AIDS. AIDS is diagnosed when the CD4 T cell count falls below 200 or you have an AIDS-defining complication, such as a serious infection or cancer.\r\n\r\no) Prevention:-\r\n\r\nThere\'s no vaccine to prevent HIV infection and no cure for HIV/AIDS. But you can protect yourself and others from infection.\r\n\r\nTo help prevent the spread of HIV:\r\n  Consider preexposure prophylaxis (PrEP). The combination oral drugs emtricitabine plus tenofovir \r\n  disoproxil fumarate (Truvada) and emtricitabine plus tenofovir alafenamide fumarate (Descovy) can reduce the \r\n  risk of sexually transmitted HIV infection in people at very high risk. PrEP can reduce your risk of getting HIV from sex \r\n  by about 99% and from injection drug use by at least 74%, according to the Centers for Disease Control and \r\n  Prevention.','2022-04-24 11:20:43',1,'These blog contain useful information related to AIDS/HIV like  causes , symptoms , and precautions .',1),(2,'Dyslexia ','Dyslexia is a learning disorder that involves difficulty reading due to problems identifying speech sounds and learning how they relate to letters and words (decoding). Also called reading disability, dyslexia affects areas of the brain that process language.\r\n\r\nPeople with dyslexia have normal intelligence and usually have normal vision. Most children with dyslexia can succeed in school with tutoring or a specialized education program. Emotional support also plays an important role.\r\n\r\nThough there\'s no cure for dyslexia, early assessment and intervention result in the best outcome. Sometimes dyslexia goes undiagnosed for years and isn\'t recognized until adulthood, but it\'s never too late to seek help.\r\n\r\no Symptoms:-\r\n  * Difficulty reading, including reading aloud\r\n  * Slow and labor-intensive reading and writing\r\n  * Problems spelling\r\n  * Avoiding activities that involve reading\r\n  * Mispronouncing names or words, or problems retrieving words\r\n * Trouble understanding jokes or expressions that have a meaning not easily understood from the specific words \r\n  (idioms), such as \"piece of cake\" meaning \"easy\"\r\n*  Spending an unusually long time completing tasks that \r\n  involve reading or writing\r\n* Difficulty summarizing a story\r\n*  Trouble learning a foreign language\r\n* Difficulty memorizing\r\n*  Difficulty doing math problems\r\n\r\no Causes\r\n    Dyslexia tends to run in families. It appears to be linked \r\nto certain genes that affect how the brain processes reading and language, as well as risk factors in the environment.\r\n\r\no Risk factors\r\n    Dyslexia risk factors include:\r\n\r\n     * A family history of dyslexia or other learning disabilities\r\n     * Premature birth or low birth weight\r\n     * Exposure during pregnancy to nicotine, drugs, alcohol or infection that may alter brain development in the fetus\r\n     * Individual differences in the parts of the brain that enable reading.','2022-05-05 04:47:17',1,'This blog contain useful information information related to Dyslexia and its risk factors.',2),(5,'Everyday Health','There a good chance Everyday Health is the most appropriately named blog on this list because it focuses on the health topics that consistently affect a wide range of people. They also get kudos for addressing the emotional challenges folks face when managing different conditions. \r\n\r\nHealth blog takes a very news-focused approach, covering new studies, diseases impacting the country and world, and some stories with a bit of shock factor. Itâs a great resource for following up on the stories that often get just 20 seconds of coverage during your favorite morning news broadcasts.','2022-05-05 05:21:59',2,'This blog contain info about everyday health!',3);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mobileNo` bigint NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `uLevel` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Gautam Agnihotri','abc@gmail.com','123',56737255627,'male','2001-04-15','admin'),(2,'Harsh Raikwar','abcd@gmail.com','1234',5784573845,'male','2000-02-05','user'),(3,'Gouransh','ab@gmail.com','12345',9002345421,'male','2000-10-03','user'),(4,'Rahul Sharma','Rahul@gmail.com','1234',5246347254,'male','1995-12-11','user'),(5,'Mohit Rathore','Mohit@gmail.com','1234',7626535635,'male','1967-12-03','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'techblog'
--

--
-- Dumping routines for database 'techblog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18  9:40:18
