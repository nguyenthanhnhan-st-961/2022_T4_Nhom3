-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: control
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `source_url` varchar(2048) NOT NULL,
  `ftp_ip` varchar(15) NOT NULL,
  `ftp_user` varchar(50) NOT NULL,
  `ftp_password` varchar(10) NOT NULL,
  `ftp_port` varchar(5) NOT NULL,
  `host` varchar(15) NOT NULL,
  `db_user` varchar(20) NOT NULL,
  `db_pw` varchar(10) NOT NULL,
  `db_staging` varchar(50) NOT NULL,
  `db_dw` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'https://thoitiet.vn/','103.97.126.30','nhan123@demoxii.tk','123456','21','localhost','nhannguyen','123123','staging','data_warehouse');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_log`
--

DROP TABLE IF EXISTS `file_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_config` tinyint NOT NULL,
  `filename` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(2) NOT NULL,
  `author` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_config_idx` (`id_config`),
  CONSTRAINT `fk_config` FOREIGN KEY (`id_config`) REFERENCES `config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_log`
--

LOCK TABLES `file_log` WRITE;
/*!40000 ALTER TABLE `file_log` DISABLE KEYS */;
INSERT INTO `file_log` VALUES (1,1,'202211181152_preprocessed_data.csv','2022-11-18','re','Nhan'),(2,1,'202211181410_preprocessed_data.csv','2022-11-18','re','Nhan'),(3,1,'202211181719_preprocessed_data.csv','2022-11-18','re','Nhan'),(4,1,'202211190808_preprocessed_data.csv','2022-11-19','re','Nhan'),(5,1,'202211190812_preprocessed_data.csv','2022-11-19','re','Nhan'),(6,1,'202211191109_preprocessed_data.csv','2022-11-19','re','Nhan'),(7,1,'202211191411_preprocessed_data.csv','2022-11-19','re','Nhan'),(8,1,'202211191413_preprocessed_data.csv','2022-11-19','re','Nhan'),(9,1,'202211191446_preprocessed_data.csv','2022-11-19','re','Nhan'),(10,1,'202211301405_preprocessed_data.csv','2022-11-30','re','Nhan'),(11,1,'202211302112_preprocessed_data.csv','2022-11-30','re','Nhan'),(12,1,'202211302129_preprocessed_data.csv','2022-11-30','re','Nhan'),(13,1,'202211302150_preprocessed_data.csv','2022-11-30','re','Nhan'),(14,1,'202212011001_preprocessed_data.csv','2022-12-01','re','Nhan'),(15,1,'202212011050_preprocessed_data.csv','2022-12-01','re','Nhan'),(16,1,'202212012306_preprocessed_data.csv','2022-12-01','re','Nhan'),(17,1,'202212012309_preprocessed_data.csv','2022-12-01','re','Nhan'),(18,1,'202212051046_preprocessed_data.csv','2022-12-05','re','Nhan'),(19,1,'202212051209_preprocessed_data.csv','2022-12-05','re','Nhan'),(20,1,'202212051437_preprocessed_data.csv','2022-12-05','re','Nhan');
/*!40000 ALTER TABLE `file_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'control'
--

--
-- Dumping routines for database 'control'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_config` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_config`(in_source varchar(100), in_ftpip varchar(15), in_ftpuser varchar(50), in_ftppw varchar(20), in_ftpport varchar(5))
begin
insert into control.config(source_url, ftp_ip, ftp_user, ftp_pw, ftp_port)
values (in_source, in_ftpip, in_ftpuser, in_ftppw, in_ftpport);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_log`(in_idconfig int, in_filename varchar(50), in_date date, in_author varchar(4))
begin
	insert into control.file_log(id_config, filename, date, status, author)
	values(in_idconfig, in_filename, in_date, 'st',in_author);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_config` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_config`(in_id int)
begin
select * from control.config where id = in_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_status_file` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_status_file`()
begin
select filename, status from control.file_log where id = (select max(id) from control.file_log);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_log_status_er` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_log_status_er`()
begin
	update control.file_log 
    set status = 'er' 
    where status = 'st' and id = (select * from (select max(id) as max from control.file_log) as b);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_log_status_re` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_log_status_re`()
begin
	update control.file_log 
    set status = 're' 
    where status = 'st' and id = (select * from (select max(id) as max from control.file_log) as b);
end ;;
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

-- Dump completed on 2022-12-05 11:35:47
