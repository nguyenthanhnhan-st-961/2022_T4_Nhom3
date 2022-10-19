-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: staging
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `staging_raw`
--

DROP TABLE IF EXISTS `staging_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_raw` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Temperature` tinyint DEFAULT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Humidity` tinyint DEFAULT NULL,
  `Vision` tinyint DEFAULT NULL,
  `Wind` float DEFAULT NULL,
  `UV_index` float DEFAULT NULL,
  `Air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_raw`
--

LOCK TABLES `staging_raw` WRITE;
/*!40000 ALTER TABLE `staging_raw` DISABLE KEYS */;
INSERT INTO `staging_raw` VALUES (1,'Hà Giang','2022-10-19','07:29:00',16,'Nhiều mây',61,10,1.57,0.25,'Kém'),(2,'Cao Bằng','2022-10-19','07:29:00',18,'Nhiều mây',54,10,1.6,0,'Kém'),(3,'Bắc Kạn','2022-10-19','07:29:00',18,'Nhiều mây',54,10,1.26,0.18,'Kém'),(4,'Tuyên Quang','2022-10-19','07:29:00',17,'Nhiều mây',65,10,0.98,0,'Kém'),(5,'Thái Nguyên','2022-10-19','07:29:00',24,'Nhiều mây',54,10,1.85,0.22,'Kém'),(6,'Lạng Sơn','2022-10-19','07:29:00',18,'Nhiều mây',51,10,2.1,0,'Kém'),(7,'Quảng Ninh','2022-10-19','07:29:00',20,'Nhiều mây',52,10,2.35,0.07,'Kém'),(8,'Bắc Giang','2022-10-19','07:29:00',24,'Nhiều mây',49,10,4.03,0,'Kém'),(9,'Phú Thọ','2022-10-19','07:29:00',18,'Mây cụm',70,10,1.88,0.21,'Rất kém'),(10,'Lào Cai','2022-10-19','07:29:00',18,'Mây cụm',57,10,0.79,0,'Kém'),(11,'Điện Biên','2022-10-19','07:29:00',15,'Mây thưa',81,10,0.76,0.21,'Rất kém'),(12,'Lai Châu','2022-10-19','07:29:00',16,'Mây cụm',60,10,1.02,0,'Kém'),(13,'Sơn La','2022-10-19','07:29:00',15,'Mây cụm',78,10,0.2,0.22,'Rất kém'),(14,'Yên Bái','2022-10-19','07:29:00',19,'Mây cụm',63,10,2.03,0,'Rất kém'),(15,'Hoà Bình','2022-10-19','07:29:00',20,'Mây cụm',69,10,1.61,0,'Rất kém'),(16,'Hà Nội','2022-10-19','07:29:00',24,'Bầu trời quang đãng',38,10,2.57,0,'Rất kém'),(17,'Vĩnh Phúc','2022-10-19','07:29:00',24,'Nhiều mây',63,10,1.48,0,'Rất kém'),(18,'Bắc Ninh','2022-10-19','07:29:00',24,'Nhiều mây',50,10,4.14,0.27,'Kém'),(19,'Hải Dương','2022-10-19','07:29:00',22,'Nhiều mây',50,10,4.67,0,'Kém'),(20,'Hải Phòng','2022-10-19','07:29:00',24,'Bầu trời quang đãng',43,10,4.12,0.21,'Kém'),(21,'Hưng Yên','2022-10-19','07:29:00',21,'Nhiều mây',51,10,4.4,0,'Rất kém'),(22,'Thái Bình','2022-10-19','07:29:00',21,'Nhiều mây',52,10,3.54,0.07,'Rất kém'),(23,'Hà Nam','2022-10-19','07:29:00',20,'Nhiều mây',54,10,4.4,0,'Rất kém'),(24,'Nam Định','2022-10-19','07:29:00',21,'Nhiều mây',52,10,4.09,0,'Rất kém'),(25,'Ninh Bình','2022-10-19','07:29:00',21,'Nhiều mây',55,10,4.54,0,'Rất kém'),(26,'Thanh Hóa','2022-10-19','07:29:00',20,'Nhiều mây',62,10,2.54,0.22,'Kém'),(27,'Nghệ An','2022-10-19','07:29:00',21,'Nhiều mây',71,10,3.29,0,'Rất kém'),(28,'Hà Tĩnh','2022-10-19','07:29:00',21,'Nhiều mây',77,10,4.84,0.26,'Rất kém'),(29,'Quảng Bình','2022-10-19','07:29:00',21,'Nhiều mây',87,10,4.09,0.1,'Rất kém'),(30,'Quảng Trị','2022-10-19','07:29:00',21,'Nhiều mây',90,10,6.31,0,'Kém'),(31,'Thừa Thiên Huế','2022-10-19','07:29:00',20,'Sương mờ',100,2,3.6,0.03,'Kém'),(32,'Đà Nẵng','2022-10-19','07:29:00',23,'Mây cụm',83,10,4.12,0.03,'Kém'),(33,'Quảng Nam','2022-10-19','07:29:00',22,'Nhiều mây',87,10,4.12,0,'Rất kém'),(34,'Quảng Ngãi','2022-10-19','07:29:00',23,'Nhiều mây',83,10,3.67,0.15,'Rất kém'),(35,'Bình Định','2022-10-19','07:29:00',24,'Mây cụm',83,10,1.83,0.59,'Rất kém'),(36,'Phú Yên','2022-10-19','07:29:00',23,'Mây cụm',86,10,1.15,0.61,'Rất kém'),(37,'Khánh Hòa','2022-10-19','07:29:00',25,'Mây cụm',82,10,1.05,0.64,'Rất kém'),(38,'Ninh Thuận','2022-10-19','07:29:00',24,'Mây cụm',85,10,1.09,0.64,'Khá'),(39,'Bình Thuận','2022-10-19','07:29:00',23,'Mây cụm',90,10,0.45,0,'Khá'),(40,'Kon Tum','2022-10-19','07:29:00',19,'Nhiều mây',84,10,0.09,0.53,'Rất kém'),(41,'Gia Lai','2022-10-19','07:29:00',21,'Mây cụm',85,10,1.25,0.57,'Kém'),(42,'Đắk Lắk','2022-10-19','07:29:00',21,'Mây rải rác',89,10,0.26,0,'Kém'),(43,'Đắk Nông','2022-10-19','07:29:00',21,'Mây rải rác',89,10,0.26,0,'Kém'),(44,'Lâm Đồng','2022-10-19','07:29:00',20,'Mây cụm',93,10,0.43,0,'Khá'),(45,'Bình Phước','2022-10-19','07:29:00',23,'Mây cụm',96,10,0.48,0,'Trung bình'),(46,'Tây Ninh','2022-10-19','07:29:00',25,'Mây cụm',89,10,2,0,'Rất kém'),(47,'Bình Dương','2022-10-19','07:29:00',26,'Mưa vừa',94,8,1.54,0.5,'Rất kém'),(48,'Đồng Nai','2022-10-19','07:29:00',26,'Mưa vừa',90,10,1.82,0.5,'Rất kém'),(49,'Bà Rịa - Vũng Tàu','2022-10-19','07:29:00',25,'Mây cụm',88,10,1.58,0.53,'Rất kém'),(50,'Hồ Chí Minh','2022-10-19','07:29:00',26,'Mưa vừa',94,8,1.54,0,'Rất kém'),(51,'Long An','2022-10-19','07:29:00',25,'Mây cụm',91,9,2.44,0.47,'Rất kém'),(52,'Tiền Giang','2022-10-19','07:29:00',25,'Mây cụm',93,10,1.92,0,'Rất kém'),(53,'Bến Tre','2022-10-19','07:29:00',25,'Nhiều mây',93,10,1.67,0.47,'Rất kém'),(54,'Trà Vinh','2022-10-19','07:29:00',25,'Nhiều mây',91,10,2.25,0.48,'Rất kém'),(55,'Vĩnh Long','2022-10-19','07:29:00',24,'Mây cụm',89,7,2.58,0.28,'Rất kém'),(56,'Đồng Tháp','2022-10-19','07:29:00',24,'Mây cụm',82,10,1.57,0,'Rất kém'),(57,'An Giang','2022-10-19','07:29:00',24,'Mây cụm',82,10,1.35,0.05,'Rất kém'),(58,'Kiên Giang','2022-10-19','07:29:00',26,'Mây cụm',85,10,2.36,0.39,'Kém'),(59,'Cần Thơ','2022-10-19','07:29:00',24,'Mây cụm',100,8,0.51,0,'Rất kém'),(60,'Hậu Giang','2022-10-19','07:29:00',24,'Mây cụm',88,10,2.34,0.39,'Kém'),(61,'Sóc Trăng','2022-10-19','07:29:00',26,'Mây cụm',88,10,2.31,0.29,'Rất kém'),(62,'Bạc Liêu','2022-10-19','07:29:00',26,'Nhiều mây',85,10,2.71,0.31,'Rất kém'),(63,'Cà Mau','2022-10-19','07:29:00',25,'Nhiều mây',89,10,1.05,0,'Khá');
/*!40000 ALTER TABLE `staging_raw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 12:59:30
