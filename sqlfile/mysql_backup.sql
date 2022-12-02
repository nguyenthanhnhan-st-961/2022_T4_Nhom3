-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: staging
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
-- Table structure for table `staging_dim_date`
--

DROP TABLE IF EXISTS `staging_dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_dim_date` (
  `id` int NOT NULL,
  `full_date` date DEFAULT NULL,
  `day_since_2005` smallint DEFAULT NULL,
  `month_since_2005` smallint DEFAULT NULL,
  `day_of_week` varchar(9) DEFAULT NULL,
  `calendar_month` varchar(10) DEFAULT NULL,
  `calendar_year` smallint DEFAULT NULL,
  `calendar_year_month` varchar(8) DEFAULT NULL,
  `day_of_month` tinyint DEFAULT NULL,
  `day_of_year` smallint DEFAULT NULL,
  `week_of_year_sunday` tinyint DEFAULT NULL,
  `year_week_sunday` varchar(8) DEFAULT NULL,
  `week_sunday_start` date DEFAULT NULL,
  `week_of_year_monday` tinyint DEFAULT NULL,
  `year_week_monday` varchar(8) DEFAULT NULL,
  `week_monday_start` date DEFAULT NULL,
  `holiday` varchar(11) DEFAULT NULL,
  `day_type` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_dim_date`
--

LOCK TABLES `staging_dim_date` WRITE;
/*!40000 ALTER TABLE `staging_dim_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_dim_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_dim_province`
--

DROP TABLE IF EXISTS `staging_dim_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_dim_province` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_dim_province`
--

LOCK TABLES `staging_dim_province` WRITE;
/*!40000 ALTER TABLE `staging_dim_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_dim_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_dim_time`
--

DROP TABLE IF EXISTS `staging_dim_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_dim_time` (
  `id` smallint NOT NULL,
  `hour_time` time DEFAULT NULL,
  `hour` tinyint DEFAULT NULL,
  `minute` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_dim_time`
--

LOCK TABLES `staging_dim_time` WRITE;
/*!40000 ALTER TABLE `staging_dim_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_dim_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_fact_weather`
--

DROP TABLE IF EXISTS `staging_fact_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_fact_weather` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_province` tinyint DEFAULT NULL,
  `id_time` smallint DEFAULT NULL,
  `id_date` int DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `humidity` tinyint DEFAULT NULL,
  `vision` tinyint DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `uv_index` float DEFAULT NULL,
  `air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_fact_weather`
--

LOCK TABLES `staging_fact_weather` WRITE;
/*!40000 ALTER TABLE `staging_fact_weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_fact_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_raw`
--

DROP TABLE IF EXISTS `staging_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_raw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `humidity` tinyint DEFAULT NULL,
  `vision` tinyint DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `uv_index` float DEFAULT NULL,
  `air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_raw`
--

LOCK TABLES `staging_raw` WRITE;
/*!40000 ALTER TABLE `staging_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_transform1`
--

DROP TABLE IF EXISTS `staging_transform1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_transform1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `humidity` tinyint DEFAULT NULL,
  `vision` tinyint DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `uv_index` float DEFAULT NULL,
  `air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_transform1`
--

LOCK TABLES `staging_transform1` WRITE;
/*!40000 ALTER TABLE `staging_transform1` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_transform1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging_transform2`
--

DROP TABLE IF EXISTS `staging_transform2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_transform2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `humidity` tinyint DEFAULT NULL,
  `vision` tinyint DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `uv_index` float DEFAULT NULL,
  `air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging_transform2`
--

LOCK TABLES `staging_transform2` WRITE;
/*!40000 ALTER TABLE `staging_transform2` DISABLE KEYS */;
/*!40000 ALTER TABLE `staging_transform2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'staging'
--

--
-- Dumping routines for database 'staging'
--
/*!50003 DROP PROCEDURE IF EXISTS `load_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_data`(
in_name nvarchar(20),
in_date date,
in_time time,
in_temperature tinyint,
in_description nvarchar(50),
in_humidity tinyint,
in_vision tinyint,
in_wind float,
in_uv_index float,
in_air_quality nvarchar(10))
begin
insert into staging_raw (Name,Date, Time,Temperature,Description,Humidity,Vision,Wind,UV_index,Air_quality)
values
(in_name,
in_date,
in_time,
in_temperature,
in_description,
in_humidity,
in_vision,
in_wind,
in_uv_index,
in_air_quality);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_staging_dim_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_staging_dim_date`(in_id int,
in_full_date date ,
in_day_since_2005 smallint ,
in_month_since_2005 smallint ,
in_day_of_week varchar(9) ,
in_calendar_month varchar(10) ,
in_calendar_year smallint ,
in_calendar_year_month varchar(8) ,
in_day_of_month tinyint ,
in_day_of_year smallint ,
in_week_of_year_sunday tinyint ,
in_year_week_sunday varchar(8) ,
in_week_sunday_start date ,
in_week_of_year_monday tinyint ,
in_year_week_monday varchar(8) ,
in_week_monday_start date ,
in_holiday varchar(11) ,
in_day_type varchar(7))
begin
insert into staging.staging_dim_date
(id ,
full_date ,
day_since_2005  ,
month_since_2005  ,
day_of_week ,
calendar_month ,
calendar_year  ,
calendar_year_month ,
day_of_month ,
day_of_year ,
week_of_year_sunday ,
year_week_sunday ,
week_sunday_start ,
week_of_year_monday ,
year_week_monday ,
week_monday_start ,
holiday ,
day_type)
values 
(in_id ,
in_full_date ,
in_day_since_2005 ,
in_month_since_2005 ,
in_day_of_week ,
in_calendar_month ,
in_calendar_year ,
in_calendar_year_month,
in_day_of_month ,
in_day_of_year ,
in_week_of_year_sunday ,
in_year_week_sunday ,
in_week_sunday_start ,
in_week_of_year_monday ,
in_year_week_monday ,
in_week_monday_start ,
in_holiday ,
in_day_type);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_staging_dim_province` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_staging_dim_province`()
begin
insert into staging.staging_dim_province (name, start_date, start_time)
select name, date, time from staging.staging_transform2;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_staging_dim_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_staging_dim_time`(in_id smallint, in_hour_time time, in_hour tinyint, in_minute tinyint)
begin
insert into staging.staging_dim_time (id, hour_time, hour, minute)
values
(in_id, in_hour_time, in_hour, in_minute);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_staging_fact_weather` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_staging_fact_weather`()
begin
insert into staging.staging_fact_weather
(id_province, id_time, id_date, temperature, description, humidity, vision, wind, uv_index, air_quality)
select dp.id, dt.id, dd.id, tf.temperature, tf.description, tf.humidity, tf.vision, tf.wind, tf.uv_index, tf.air_quality
from staging.staging_transform2 tf
join staging.staging_dim_province dp on tf.name = dp.name
join staging.staging_dim_time dt on tf.time = dt.hour_time
join staging.staging_dim_date dd on tf.date = dd.full_date
;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transform1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transform1`()
begin
	insert into staging.staging_transform1
    (name,date, time,temperature,description,humidity,vision,wind,uv_index,air_quality)
    select 
		name,
		date,
		time,
		temperature,
		description,
		humidity,
		vision,
		wind,
		uv_index,
		air_quality
	from staging.staging_raw
    where
		name is not null and
		date is not null and
		time is not null and
		temperature is not null and
		description is not null and
		humidity is not null and
		vision is not null and
		wind is not null and
		uv_index is not null and
		air_quality is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transform2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transform2`()
begin
insert into staging.staging_transform2
    (name,date, time,temperature,description,humidity,vision,wind,uv_index,air_quality)
    select 
		name,
		cast(date as date) as date,
		cast(time as time) as time,
		temperature,
		description,
        case
			when humidity < 0 then 0
            else humidity
		end as humidity,
         case
			when vision < 0 then 0
            else vision
		end as vision,
         case
			when wind < 0.0 then 0.0
            else cast(wind as decimal(5,2))
		end as wind,
		 case
			when uv_index < 0.0 then 0.0
            else cast(uv_index as decimal(5,2))
		end as uv_index,
		air_quality
	from staging.staging_transform1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `truncate_staging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `truncate_staging`()
begin
	truncate staging.staging_fact_weather;
    truncate staging.staging_dim_province;
    truncate staging.staging_dim_date;
    truncate staging.staging_dim_time;
    truncate staging.staging_raw;
    truncate staging.staging_transform1;
    truncate staging.staging_transform2;
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

-- Dump completed on 2022-12-02 11:33:08
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_log`
--

LOCK TABLES `file_log` WRITE;
/*!40000 ALTER TABLE `file_log` DISABLE KEYS */;
INSERT INTO `file_log` VALUES (1,1,'202211181152_preprocessed_data.csv','2022-11-18','re','Nhan'),(2,1,'202211181410_preprocessed_data.csv','2022-11-18','re','Nhan'),(3,1,'202211181719_preprocessed_data.csv','2022-11-18','re','Nhan'),(4,1,'202211190808_preprocessed_data.csv','2022-11-19','re','Nhan'),(5,1,'202211190812_preprocessed_data.csv','2022-11-19','re','Nhan'),(6,1,'202211191109_preprocessed_data.csv','2022-11-19','re','Nhan'),(7,1,'202211191411_preprocessed_data.csv','2022-11-19','re','Nhan'),(8,1,'202211191413_preprocessed_data.csv','2022-11-19','re','Nhan'),(9,1,'202211191446_preprocessed_data.csv','2022-11-19','re','Nhan'),(10,1,'202211301405_preprocessed_data.csv','2022-11-30','re','Nhan'),(11,1,'202211302112_preprocessed_data.csv','2022-11-30','re','Nhan'),(12,1,'202211302129_preprocessed_data.csv','2022-11-30','re','Nhan'),(13,1,'202211302150_preprocessed_data.csv','2022-11-30','re','Nhan'),(14,1,'202212011001_preprocessed_data.csv','2022-12-01','re','Nhan'),(15,1,'202212011050_preprocessed_data.csv','2022-12-01','re','Nhan'),(16,1,'202212012306_preprocessed_data.csv','2022-12-01','re','Nhan'),(17,1,'202212012309_preprocessed_data.csv','2022-12-01','re','Nhan');
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

-- Dump completed on 2022-12-02 11:33:08
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: data_warehouse
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
-- Table structure for table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_date` (
  `id` int NOT NULL,
  `full_date` date DEFAULT NULL,
  `day_since_2005` smallint DEFAULT NULL,
  `month_since_2005` smallint DEFAULT NULL,
  `day_of_week` varchar(9) DEFAULT NULL,
  `calendar_month` varchar(10) DEFAULT NULL,
  `calendar_year` smallint DEFAULT NULL,
  `calendar_year_month` varchar(8) DEFAULT NULL,
  `day_of_month` tinyint DEFAULT NULL,
  `day_of_year` smallint DEFAULT NULL,
  `week_of_year_sunday` tinyint DEFAULT NULL,
  `year_week_sunday` varchar(8) DEFAULT NULL,
  `week_sunday_start` date DEFAULT NULL,
  `week_of_year_monday` tinyint DEFAULT NULL,
  `year_week_monday` varchar(8) DEFAULT NULL,
  `week_monday_start` date DEFAULT NULL,
  `holiday` varchar(11) DEFAULT NULL,
  `day_type` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_date`
--

LOCK TABLES `dim_date` WRITE;
/*!40000 ALTER TABLE `dim_date` DISABLE KEYS */;
INSERT INTO `dim_date` VALUES (7045,'2024-04-15',7045,232,'Monday','April',2024,'2024-Apr',15,106,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekday'),(7046,'2024-04-16',7046,232,'Tuesday','April',2024,'2024-Apr',16,107,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekday'),(7047,'2024-04-17',7047,232,'Wednesday','April',2024,'2024-Apr',17,108,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekday'),(7048,'2024-04-18',7048,232,'Thursday','April',2024,'2024-Apr',18,109,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekday'),(7049,'2024-04-19',7049,232,'Friday','April',2024,'2024-Apr',19,110,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekday'),(7050,'2024-04-20',7050,232,'Saturday','April',2024,'2024-Apr',20,111,15,'2024-W15','2024-04-14',16,'2024-W16','2024-04-15','Non-Holiday','Weekend'),(7051,'2024-04-21',7051,232,'Sunday','April',2024,'2024-Apr',21,112,16,'2024-W16','2024-04-21',16,'2024-W16','2024-04-15','Non-Holiday','Weekend'),(7052,'2024-04-22',7052,232,'Monday','April',2024,'2024-Apr',22,113,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekday'),(7053,'2024-04-23',7053,232,'Tuesday','April',2024,'2024-Apr',23,114,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekday'),(7054,'2024-04-24',7054,232,'Wednesday','April',2024,'2024-Apr',24,115,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekday'),(7055,'2024-04-25',7055,232,'Thursday','April',2024,'2024-Apr',25,116,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekday'),(7056,'2024-04-26',7056,232,'Friday','April',2024,'2024-Apr',26,117,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekday'),(7057,'2024-04-27',7057,232,'Saturday','April',2024,'2024-Apr',27,118,16,'2024-W16','2024-04-21',17,'2024-W17','2024-04-22','Non-Holiday','Weekend'),(7058,'2024-04-28',7058,232,'Sunday','April',2024,'2024-Apr',28,119,17,'2024-W17','2024-04-28',17,'2024-W17','2024-04-22','Non-Holiday','Weekend'),(7059,'2024-04-29',7059,232,'Monday','April',2024,'2024-Apr',29,120,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekday'),(7060,'2024-04-30',7060,232,'Tuesday','April',2024,'2024-Apr',30,121,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekday'),(7061,'2024-05-01',7061,233,'Wednesday','May',2024,'2024-May',1,122,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekday'),(7062,'2024-05-02',7062,233,'Thursday','May',2024,'2024-May',2,123,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekday'),(7063,'2024-05-03',7063,233,'Friday','May',2024,'2024-May',3,124,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekday'),(7064,'2024-05-04',7064,233,'Saturday','May',2024,'2024-May',4,125,17,'2024-W17','2024-04-28',18,'2024-W18','2024-04-29','Non-Holiday','Weekend'),(7065,'2024-05-05',7065,233,'Sunday','May',2024,'2024-May',5,126,18,'2024-W18','2024-05-05',18,'2024-W18','2024-04-29','Non-Holiday','Weekend'),(7066,'2024-05-06',7066,233,'Monday','May',2024,'2024-May',6,127,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekday'),(7067,'2024-05-07',7067,233,'Tuesday','May',2024,'2024-May',7,128,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekday'),(7068,'2024-05-08',7068,233,'Wednesday','May',2024,'2024-May',8,129,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekday'),(7069,'2024-05-09',7069,233,'Thursday','May',2024,'2024-May',9,130,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekday'),(7070,'2024-05-10',7070,233,'Friday','May',2024,'2024-May',10,131,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekday'),(7071,'2024-05-11',7071,233,'Saturday','May',2024,'2024-May',11,132,18,'2024-W18','2024-05-05',19,'2024-W19','2024-05-06','Non-Holiday','Weekend'),(7072,'2024-05-12',7072,233,'Sunday','May',2024,'2024-May',12,133,19,'2024-W19','2024-05-12',19,'2024-W19','2024-05-06','Non-Holiday','Weekend'),(7073,'2024-05-13',7073,233,'Monday','May',2024,'2024-May',13,134,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekday'),(7074,'2024-05-14',7074,233,'Tuesday','May',2024,'2024-May',14,135,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekday'),(7075,'2024-05-15',7075,233,'Wednesday','May',2024,'2024-May',15,136,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekday'),(7076,'2024-05-16',7076,233,'Thursday','May',2024,'2024-May',16,137,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekday'),(7077,'2024-05-17',7077,233,'Friday','May',2024,'2024-May',17,138,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekday'),(7078,'2024-05-18',7078,233,'Saturday','May',2024,'2024-May',18,139,19,'2024-W19','2024-05-12',20,'2024-W20','2024-05-13','Non-Holiday','Weekend'),(7079,'2024-05-19',7079,233,'Sunday','May',2024,'2024-May',19,140,20,'2024-W20','2024-05-19',20,'2024-W20','2024-05-13','Non-Holiday','Weekend'),(7080,'2024-05-20',7080,233,'Monday','May',2024,'2024-May',20,141,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekday'),(7081,'2024-05-21',7081,233,'Tuesday','May',2024,'2024-May',21,142,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekday'),(7082,'2024-05-22',7082,233,'Wednesday','May',2024,'2024-May',22,143,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekday'),(7083,'2024-05-23',7083,233,'Thursday','May',2024,'2024-May',23,144,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekday'),(7084,'2024-05-24',7084,233,'Friday','May',2024,'2024-May',24,145,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekday'),(7085,'2024-05-25',7085,233,'Saturday','May',2024,'2024-May',25,146,20,'2024-W20','2024-05-19',21,'2024-W21','2024-05-20','Non-Holiday','Weekend'),(7086,'2024-05-26',7086,233,'Sunday','May',2024,'2024-May',26,147,21,'2024-W21','2024-05-26',21,'2024-W21','2024-05-20','Non-Holiday','Weekend'),(7087,'2024-05-27',7087,233,'Monday','May',2024,'2024-May',27,148,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekday'),(7088,'2024-05-28',7088,233,'Tuesday','May',2024,'2024-May',28,149,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekday'),(7089,'2024-05-29',7089,233,'Wednesday','May',2024,'2024-May',29,150,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekday'),(7090,'2024-05-30',7090,233,'Thursday','May',2024,'2024-May',30,151,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekday'),(7091,'2024-05-31',7091,233,'Friday','May',2024,'2024-May',31,152,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekday'),(7092,'2024-06-01',7092,234,'Saturday','June',2024,'2024-Jun',1,153,21,'2024-W21','2024-05-26',22,'2024-W22','2024-05-27','Non-Holiday','Weekend'),(7093,'2024-06-02',7093,234,'Sunday','June',2024,'2024-Jun',2,154,22,'2024-W22','2024-06-02',22,'2024-W22','2024-05-27','Non-Holiday','Weekend'),(7094,'2024-06-03',7094,234,'Monday','June',2024,'2024-Jun',3,155,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekday'),(7095,'2024-06-04',7095,234,'Tuesday','June',2024,'2024-Jun',4,156,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekday'),(7096,'2024-06-05',7096,234,'Wednesday','June',2024,'2024-Jun',5,157,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekday'),(7097,'2024-06-06',7097,234,'Thursday','June',2024,'2024-Jun',6,158,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekday'),(7098,'2024-06-07',7098,234,'Friday','June',2024,'2024-Jun',7,159,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekday'),(7099,'2024-06-08',7099,234,'Saturday','June',2024,'2024-Jun',8,160,22,'2024-W22','2024-06-02',23,'2024-W23','2024-06-03','Non-Holiday','Weekend'),(7100,'2024-06-09',7100,234,'Sunday','June',2024,'2024-Jun',9,161,23,'2024-W23','2024-06-09',23,'2024-W23','2024-06-03','Non-Holiday','Weekend'),(7101,'2024-06-10',7101,234,'Monday','June',2024,'2024-Jun',10,162,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekday'),(7102,'2024-06-11',7102,234,'Tuesday','June',2024,'2024-Jun',11,163,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekday'),(7103,'2024-06-12',7103,234,'Wednesday','June',2024,'2024-Jun',12,164,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekday'),(7104,'2024-06-13',7104,234,'Thursday','June',2024,'2024-Jun',13,165,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekday'),(7105,'2024-06-14',7105,234,'Friday','June',2024,'2024-Jun',14,166,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekday'),(7106,'2024-06-15',7106,234,'Saturday','June',2024,'2024-Jun',15,167,23,'2024-W23','2024-06-09',24,'2024-W24','2024-06-10','Non-Holiday','Weekend'),(7107,'2024-06-16',7107,234,'Sunday','June',2024,'2024-Jun',16,168,24,'2024-W24','2024-06-16',24,'2024-W24','2024-06-10','Non-Holiday','Weekend'),(7108,'2024-06-17',7108,234,'Monday','June',2024,'2024-Jun',17,169,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekday'),(7109,'2024-06-18',7109,234,'Tuesday','June',2024,'2024-Jun',18,170,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekday'),(7110,'2024-06-19',7110,234,'Wednesday','June',2024,'2024-Jun',19,171,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekday'),(7111,'2024-06-20',7111,234,'Thursday','June',2024,'2024-Jun',20,172,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekday'),(7112,'2024-06-21',7112,234,'Friday','June',2024,'2024-Jun',21,173,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekday'),(7113,'2024-06-22',7113,234,'Saturday','June',2024,'2024-Jun',22,174,24,'2024-W24','2024-06-16',25,'2024-W25','2024-06-17','Non-Holiday','Weekend'),(7114,'2024-06-23',7114,234,'Sunday','June',2024,'2024-Jun',23,175,25,'2024-W25','2024-06-23',25,'2024-W25','2024-06-17','Non-Holiday','Weekend'),(7115,'2024-06-24',7115,234,'Monday','June',2024,'2024-Jun',24,176,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekday'),(7116,'2024-06-25',7116,234,'Tuesday','June',2024,'2024-Jun',25,177,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekday'),(7117,'2024-06-26',7117,234,'Wednesday','June',2024,'2024-Jun',26,178,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekday'),(7118,'2024-06-27',7118,234,'Thursday','June',2024,'2024-Jun',27,179,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekday'),(7119,'2024-06-28',7119,234,'Friday','June',2024,'2024-Jun',28,180,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekday'),(7120,'2024-06-29',7120,234,'Saturday','June',2024,'2024-Jun',29,181,25,'2024-W25','2024-06-23',26,'2024-W26','2024-06-24','Non-Holiday','Weekend'),(7121,'2024-06-30',7121,234,'Sunday','June',2024,'2024-Jun',30,182,26,'2024-W26','2024-06-30',26,'2024-W26','2024-06-24','Non-Holiday','Weekend'),(7122,'2024-07-01',7122,235,'Monday','July',2024,'2024-Jul',1,183,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekday'),(7123,'2024-07-02',7123,235,'Tuesday','July',2024,'2024-Jul',2,184,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekday'),(7124,'2024-07-03',7124,235,'Wednesday','July',2024,'2024-Jul',3,185,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekday'),(7125,'2024-07-04',7125,235,'Thursday','July',2024,'2024-Jul',4,186,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekday'),(7126,'2024-07-05',7126,235,'Friday','July',2024,'2024-Jul',5,187,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekday'),(7127,'2024-07-06',7127,235,'Saturday','July',2024,'2024-Jul',6,188,26,'2024-W26','2024-06-30',27,'2024-W27','2024-07-01','Non-Holiday','Weekend'),(7128,'2024-07-07',7128,235,'Sunday','July',2024,'2024-Jul',7,189,27,'2024-W27','2024-07-07',27,'2024-W27','2024-07-01','Non-Holiday','Weekend'),(7129,'2024-07-08',7129,235,'Monday','July',2024,'2024-Jul',8,190,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekday'),(7130,'2024-07-09',7130,235,'Tuesday','July',2024,'2024-Jul',9,191,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekday'),(7131,'2024-07-10',7131,235,'Wednesday','July',2024,'2024-Jul',10,192,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekday'),(7132,'2024-07-11',7132,235,'Thursday','July',2024,'2024-Jul',11,193,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekday'),(7133,'2024-07-12',7133,235,'Friday','July',2024,'2024-Jul',12,194,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekday'),(7134,'2024-07-13',7134,235,'Saturday','July',2024,'2024-Jul',13,195,27,'2024-W27','2024-07-07',28,'2024-W28','2024-07-08','Non-Holiday','Weekend'),(7135,'2024-07-14',7135,235,'Sunday','July',2024,'2024-Jul',14,196,28,'2024-W28','2024-07-14',28,'2024-W28','2024-07-08','Non-Holiday','Weekend'),(7136,'2024-07-15',7136,235,'Monday','July',2024,'2024-Jul',15,197,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekday'),(7137,'2024-07-16',7137,235,'Tuesday','July',2024,'2024-Jul',16,198,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekday'),(7138,'2024-07-17',7138,235,'Wednesday','July',2024,'2024-Jul',17,199,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekday'),(7139,'2024-07-18',7139,235,'Thursday','July',2024,'2024-Jul',18,200,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekday'),(7140,'2024-07-19',7140,235,'Friday','July',2024,'2024-Jul',19,201,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekday'),(7141,'2024-07-20',7141,235,'Saturday','July',2024,'2024-Jul',20,202,28,'2024-W28','2024-07-14',29,'2024-W29','2024-07-15','Non-Holiday','Weekend'),(7142,'2024-07-21',7142,235,'Sunday','July',2024,'2024-Jul',21,203,29,'2024-W29','2024-07-21',29,'2024-W29','2024-07-15','Non-Holiday','Weekend'),(7143,'2024-07-22',7143,235,'Monday','July',2024,'2024-Jul',22,204,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekday'),(7144,'2024-07-23',7144,235,'Tuesday','July',2024,'2024-Jul',23,205,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekday'),(7145,'2024-07-24',7145,235,'Wednesday','July',2024,'2024-Jul',24,206,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekday'),(7146,'2024-07-25',7146,235,'Thursday','July',2024,'2024-Jul',25,207,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekday'),(7147,'2024-07-26',7147,235,'Friday','July',2024,'2024-Jul',26,208,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekday'),(7148,'2024-07-27',7148,235,'Saturday','July',2024,'2024-Jul',27,209,29,'2024-W29','2024-07-21',30,'2024-W30','2024-07-22','Non-Holiday','Weekend'),(7149,'2024-07-28',7149,235,'Sunday','July',2024,'2024-Jul',28,210,30,'2024-W30','2024-07-28',30,'2024-W30','2024-07-22','Non-Holiday','Weekend'),(7150,'2024-07-29',7150,235,'Monday','July',2024,'2024-Jul',29,211,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekday'),(7151,'2024-07-30',7151,235,'Tuesday','July',2024,'2024-Jul',30,212,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekday'),(7152,'2024-07-31',7152,235,'Wednesday','July',2024,'2024-Jul',31,213,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekday'),(7153,'2024-08-01',7153,236,'Thursday','August',2024,'2024-Aug',1,214,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekday'),(7154,'2024-08-02',7154,236,'Friday','August',2024,'2024-Aug',2,215,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekday'),(7155,'2024-08-03',7155,236,'Saturday','August',2024,'2024-Aug',3,216,30,'2024-W30','2024-07-28',31,'2024-W31','2024-07-29','Non-Holiday','Weekend'),(7156,'2024-08-04',7156,236,'Sunday','August',2024,'2024-Aug',4,217,31,'2024-W31','2024-08-04',31,'2024-W31','2024-07-29','Non-Holiday','Weekend'),(7157,'2024-08-05',7157,236,'Monday','August',2024,'2024-Aug',5,218,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekday'),(7158,'2024-08-06',7158,236,'Tuesday','August',2024,'2024-Aug',6,219,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekday'),(7159,'2024-08-07',7159,236,'Wednesday','August',2024,'2024-Aug',7,220,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekday'),(7160,'2024-08-08',7160,236,'Thursday','August',2024,'2024-Aug',8,221,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekday'),(7161,'2024-08-09',7161,236,'Friday','August',2024,'2024-Aug',9,222,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekday'),(7162,'2024-08-10',7162,236,'Saturday','August',2024,'2024-Aug',10,223,31,'2024-W31','2024-08-04',32,'2024-W32','2024-08-05','Non-Holiday','Weekend'),(7163,'2024-08-11',7163,236,'Sunday','August',2024,'2024-Aug',11,224,32,'2024-W32','2024-08-11',32,'2024-W32','2024-08-05','Non-Holiday','Weekend'),(7164,'2024-08-12',7164,236,'Monday','August',2024,'2024-Aug',12,225,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekday'),(7165,'2024-08-13',7165,236,'Tuesday','August',2024,'2024-Aug',13,226,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekday'),(7166,'2024-08-14',7166,236,'Wednesday','August',2024,'2024-Aug',14,227,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekday'),(7167,'2024-08-15',7167,236,'Thursday','August',2024,'2024-Aug',15,228,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekday'),(7168,'2024-08-16',7168,236,'Friday','August',2024,'2024-Aug',16,229,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekday'),(7169,'2024-08-17',7169,236,'Saturday','August',2024,'2024-Aug',17,230,32,'2024-W32','2024-08-11',33,'2024-W33','2024-08-12','Non-Holiday','Weekend'),(7170,'2024-08-18',7170,236,'Sunday','August',2024,'2024-Aug',18,231,33,'2024-W33','2024-08-18',33,'2024-W33','2024-08-12','Non-Holiday','Weekend'),(7171,'2024-08-19',7171,236,'Monday','August',2024,'2024-Aug',19,232,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekday'),(7172,'2024-08-20',7172,236,'Tuesday','August',2024,'2024-Aug',20,233,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekday'),(7173,'2024-08-21',7173,236,'Wednesday','August',2024,'2024-Aug',21,234,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekday'),(7174,'2024-08-22',7174,236,'Thursday','August',2024,'2024-Aug',22,235,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekday'),(7175,'2024-08-23',7175,236,'Friday','August',2024,'2024-Aug',23,236,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekday'),(7176,'2024-08-24',7176,236,'Saturday','August',2024,'2024-Aug',24,237,33,'2024-W33','2024-08-18',34,'2024-W34','2024-08-19','Non-Holiday','Weekend'),(7177,'2024-08-25',7177,236,'Sunday','August',2024,'2024-Aug',25,238,34,'2024-W34','2024-08-25',34,'2024-W34','2024-08-19','Non-Holiday','Weekend'),(7178,'2024-08-26',7178,236,'Monday','August',2024,'2024-Aug',26,239,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekday'),(7179,'2024-08-27',7179,236,'Tuesday','August',2024,'2024-Aug',27,240,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekday'),(7180,'2024-08-28',7180,236,'Wednesday','August',2024,'2024-Aug',28,241,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekday'),(7181,'2024-08-29',7181,236,'Thursday','August',2024,'2024-Aug',29,242,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekday'),(7182,'2024-08-30',7182,236,'Friday','August',2024,'2024-Aug',30,243,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekday'),(7183,'2024-08-31',7183,236,'Saturday','August',2024,'2024-Aug',31,244,34,'2024-W34','2024-08-25',35,'2024-W35','2024-08-26','Non-Holiday','Weekend'),(7184,'2024-09-01',7184,237,'Sunday','September',2024,'2024-Sep',1,245,35,'2024-W35','2024-09-01',35,'2024-W35','2024-08-26','Non-Holiday','Weekend'),(7185,'2024-09-02',7185,237,'Monday','September',2024,'2024-Sep',2,246,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekday'),(7186,'2024-09-03',7186,237,'Tuesday','September',2024,'2024-Sep',3,247,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekday'),(7187,'2024-09-04',7187,237,'Wednesday','September',2024,'2024-Sep',4,248,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekday'),(7188,'2024-09-05',7188,237,'Thursday','September',2024,'2024-Sep',5,249,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekday'),(7189,'2024-09-06',7189,237,'Friday','September',2024,'2024-Sep',6,250,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekday'),(7190,'2024-09-07',7190,237,'Saturday','September',2024,'2024-Sep',7,251,35,'2024-W35','2024-09-01',36,'2024-W36','2024-09-02','Non-Holiday','Weekend'),(7191,'2024-09-08',7191,237,'Sunday','September',2024,'2024-Sep',8,252,36,'2024-W36','2024-09-08',36,'2024-W36','2024-09-02','Non-Holiday','Weekend'),(7192,'2024-09-09',7192,237,'Monday','September',2024,'2024-Sep',9,253,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekday'),(7193,'2024-09-10',7193,237,'Tuesday','September',2024,'2024-Sep',10,254,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekday'),(7194,'2024-09-11',7194,237,'Wednesday','September',2024,'2024-Sep',11,255,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekday'),(7195,'2024-09-12',7195,237,'Thursday','September',2024,'2024-Sep',12,256,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekday'),(7196,'2024-09-13',7196,237,'Friday','September',2024,'2024-Sep',13,257,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekday'),(7197,'2024-09-14',7197,237,'Saturday','September',2024,'2024-Sep',14,258,36,'2024-W36','2024-09-08',37,'2024-W37','2024-09-09','Non-Holiday','Weekend'),(7198,'2024-09-15',7198,237,'Sunday','September',2024,'2024-Sep',15,259,37,'2024-W37','2024-09-15',37,'2024-W37','2024-09-09','Non-Holiday','Weekend'),(7199,'2024-09-16',7199,237,'Monday','September',2024,'2024-Sep',16,260,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekday'),(7200,'2024-09-17',7200,237,'Tuesday','September',2024,'2024-Sep',17,261,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekday'),(7201,'2024-09-18',7201,237,'Wednesday','September',2024,'2024-Sep',18,262,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekday'),(7202,'2024-09-19',7202,237,'Thursday','September',2024,'2024-Sep',19,263,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekday'),(7203,'2024-09-20',7203,237,'Friday','September',2024,'2024-Sep',20,264,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekday'),(7204,'2024-09-21',7204,237,'Saturday','September',2024,'2024-Sep',21,265,37,'2024-W37','2024-09-15',38,'2024-W38','2024-09-16','Non-Holiday','Weekend'),(7205,'2024-09-22',7205,237,'Sunday','September',2024,'2024-Sep',22,266,38,'2024-W38','2024-09-22',38,'2024-W38','2024-09-16','Non-Holiday','Weekend'),(7206,'2024-09-23',7206,237,'Monday','September',2024,'2024-Sep',23,267,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekday'),(7207,'2024-09-24',7207,237,'Tuesday','September',2024,'2024-Sep',24,268,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekday'),(7208,'2024-09-25',7208,237,'Wednesday','September',2024,'2024-Sep',25,269,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekday'),(7209,'2024-09-26',7209,237,'Thursday','September',2024,'2024-Sep',26,270,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekday'),(7210,'2024-09-27',7210,237,'Friday','September',2024,'2024-Sep',27,271,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekday'),(7211,'2024-09-28',7211,237,'Saturday','September',2024,'2024-Sep',28,272,38,'2024-W38','2024-09-22',39,'2024-W39','2024-09-23','Non-Holiday','Weekend'),(7212,'2024-09-29',7212,237,'Sunday','September',2024,'2024-Sep',29,273,39,'2024-W39','2024-09-29',39,'2024-W39','2024-09-23','Non-Holiday','Weekend'),(7213,'2024-09-30',7213,237,'Monday','September',2024,'2024-Sep',30,274,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekday'),(7214,'2024-10-01',7214,238,'Tuesday','October',2024,'2024-Oct',1,275,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekday'),(7215,'2024-10-02',7215,238,'Wednesday','October',2024,'2024-Oct',2,276,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekday'),(7216,'2024-10-03',7216,238,'Thursday','October',2024,'2024-Oct',3,277,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekday'),(7217,'2024-10-04',7217,238,'Friday','October',2024,'2024-Oct',4,278,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekday'),(7218,'2024-10-05',7218,238,'Saturday','October',2024,'2024-Oct',5,279,39,'2024-W39','2024-09-29',40,'2024-W40','2024-09-30','Non-Holiday','Weekend'),(7219,'2024-10-06',7219,238,'Sunday','October',2024,'2024-Oct',6,280,40,'2024-W40','2024-10-06',40,'2024-W40','2024-09-30','Non-Holiday','Weekend'),(7220,'2024-10-07',7220,238,'Monday','October',2024,'2024-Oct',7,281,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekday'),(7221,'2024-10-08',7221,238,'Tuesday','October',2024,'2024-Oct',8,282,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekday'),(7222,'2024-10-09',7222,238,'Wednesday','October',2024,'2024-Oct',9,283,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekday'),(7223,'2024-10-10',7223,238,'Thursday','October',2024,'2024-Oct',10,284,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekday'),(7224,'2024-10-11',7224,238,'Friday','October',2024,'2024-Oct',11,285,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekday'),(7225,'2024-10-12',7225,238,'Saturday','October',2024,'2024-Oct',12,286,40,'2024-W40','2024-10-06',41,'2024-W41','2024-10-07','Non-Holiday','Weekend'),(7226,'2024-10-13',7226,238,'Sunday','October',2024,'2024-Oct',13,287,41,'2024-W41','2024-10-13',41,'2024-W41','2024-10-07','Non-Holiday','Weekend'),(7227,'2024-10-14',7227,238,'Monday','October',2024,'2024-Oct',14,288,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekday'),(7228,'2024-10-15',7228,238,'Tuesday','October',2024,'2024-Oct',15,289,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekday'),(7229,'2024-10-16',7229,238,'Wednesday','October',2024,'2024-Oct',16,290,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekday'),(7230,'2024-10-17',7230,238,'Thursday','October',2024,'2024-Oct',17,291,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekday'),(7231,'2024-10-18',7231,238,'Friday','October',2024,'2024-Oct',18,292,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekday'),(7232,'2024-10-19',7232,238,'Saturday','October',2024,'2024-Oct',19,293,41,'2024-W41','2024-10-13',42,'2024-W42','2024-10-14','Non-Holiday','Weekend'),(7233,'2024-10-20',7233,238,'Sunday','October',2024,'2024-Oct',20,294,42,'2024-W42','2024-10-20',42,'2024-W42','2024-10-14','Non-Holiday','Weekend'),(7234,'2024-10-21',7234,238,'Monday','October',2024,'2024-Oct',21,295,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekday'),(7235,'2024-10-22',7235,238,'Tuesday','October',2024,'2024-Oct',22,296,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekday'),(7236,'2024-10-23',7236,238,'Wednesday','October',2024,'2024-Oct',23,297,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekday'),(7237,'2024-10-24',7237,238,'Thursday','October',2024,'2024-Oct',24,298,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekday'),(7238,'2024-10-25',7238,238,'Friday','October',2024,'2024-Oct',25,299,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekday'),(7239,'2024-10-26',7239,238,'Saturday','October',2024,'2024-Oct',26,300,42,'2024-W42','2024-10-20',43,'2024-W43','2024-10-21','Non-Holiday','Weekend'),(7240,'2024-10-27',7240,238,'Sunday','October',2024,'2024-Oct',27,301,43,'2024-W43','2024-10-27',43,'2024-W43','2024-10-21','Non-Holiday','Weekend'),(7241,'2024-10-28',7241,238,'Monday','October',2024,'2024-Oct',28,302,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekday'),(7242,'2024-10-29',7242,238,'Tuesday','October',2024,'2024-Oct',29,303,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekday'),(7243,'2024-10-30',7243,238,'Wednesday','October',2024,'2024-Oct',30,304,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekday'),(7244,'2024-10-31',7244,238,'Thursday','October',2024,'2024-Oct',31,305,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekday'),(7245,'2024-11-01',7245,239,'Friday','November',2024,'2024-Nov',1,306,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekday'),(7246,'2024-11-02',7246,239,'Saturday','November',2024,'2024-Nov',2,307,43,'2024-W43','2024-10-27',44,'2024-W44','2024-10-28','Non-Holiday','Weekend'),(7247,'2024-11-03',7247,239,'Sunday','November',2024,'2024-Nov',3,308,44,'2024-W44','2024-11-03',44,'2024-W44','2024-10-28','Non-Holiday','Weekend'),(7248,'2024-11-04',7248,239,'Monday','November',2024,'2024-Nov',4,309,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekday'),(7249,'2024-11-05',7249,239,'Tuesday','November',2024,'2024-Nov',5,310,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekday'),(7250,'2024-11-06',7250,239,'Wednesday','November',2024,'2024-Nov',6,311,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekday'),(7251,'2024-11-07',7251,239,'Thursday','November',2024,'2024-Nov',7,312,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekday'),(7252,'2024-11-08',7252,239,'Friday','November',2024,'2024-Nov',8,313,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekday'),(7253,'2024-11-09',7253,239,'Saturday','November',2024,'2024-Nov',9,314,44,'2024-W44','2024-11-03',45,'2024-W45','2024-11-04','Non-Holiday','Weekend'),(7254,'2024-11-10',7254,239,'Sunday','November',2024,'2024-Nov',10,315,45,'2024-W45','2024-11-10',45,'2024-W45','2024-11-04','Non-Holiday','Weekend'),(7255,'2024-11-11',7255,239,'Monday','November',2024,'2024-Nov',11,316,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekday'),(7256,'2024-11-12',7256,239,'Tuesday','November',2024,'2024-Nov',12,317,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekday'),(7257,'2024-11-13',7257,239,'Wednesday','November',2024,'2024-Nov',13,318,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekday'),(7258,'2024-11-14',7258,239,'Thursday','November',2024,'2024-Nov',14,319,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekday'),(7259,'2024-11-15',7259,239,'Friday','November',2024,'2024-Nov',15,320,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekday'),(7260,'2024-11-16',7260,239,'Saturday','November',2024,'2024-Nov',16,321,45,'2024-W45','2024-11-10',46,'2024-W46','2024-11-11','Non-Holiday','Weekend'),(7261,'2024-11-17',7261,239,'Sunday','November',2024,'2024-Nov',17,322,46,'2024-W46','2024-11-17',46,'2024-W46','2024-11-11','Non-Holiday','Weekend'),(7262,'2024-11-18',7262,239,'Monday','November',2024,'2024-Nov',18,323,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekday'),(7263,'2024-11-19',7263,239,'Tuesday','November',2024,'2024-Nov',19,324,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekday'),(7264,'2024-11-20',7264,239,'Wednesday','November',2024,'2024-Nov',20,325,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekday'),(7265,'2024-11-21',7265,239,'Thursday','November',2024,'2024-Nov',21,326,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekday'),(7266,'2024-11-22',7266,239,'Friday','November',2024,'2024-Nov',22,327,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekday'),(7267,'2024-11-23',7267,239,'Saturday','November',2024,'2024-Nov',23,328,46,'2024-W46','2024-11-17',47,'2024-W47','2024-11-18','Non-Holiday','Weekend'),(7268,'2024-11-24',7268,239,'Sunday','November',2024,'2024-Nov',24,329,47,'2024-W47','2024-11-24',47,'2024-W47','2024-11-18','Non-Holiday','Weekend'),(7269,'2024-11-25',7269,239,'Monday','November',2024,'2024-Nov',25,330,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekday'),(7270,'2024-11-26',7270,239,'Tuesday','November',2024,'2024-Nov',26,331,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekday'),(7271,'2024-11-27',7271,239,'Wednesday','November',2024,'2024-Nov',27,332,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekday'),(7272,'2024-11-28',7272,239,'Thursday','November',2024,'2024-Nov',28,333,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekday'),(7273,'2024-11-29',7273,239,'Friday','November',2024,'2024-Nov',29,334,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekday'),(7274,'2024-11-30',7274,239,'Saturday','November',2024,'2024-Nov',30,335,47,'2024-W47','2024-11-24',48,'2024-W48','2024-11-25','Non-Holiday','Weekend'),(7275,'2024-12-01',7275,240,'Sunday','December',2024,'2024-Dec',1,336,48,'2024-W48','2024-12-01',48,'2024-W48','2024-11-25','Non-Holiday','Weekend'),(7276,'2024-12-02',7276,240,'Monday','December',2024,'2024-Dec',2,337,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekday'),(7277,'2024-12-03',7277,240,'Tuesday','December',2024,'2024-Dec',3,338,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekday'),(7278,'2024-12-04',7278,240,'Wednesday','December',2024,'2024-Dec',4,339,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekday'),(7279,'2024-12-05',7279,240,'Thursday','December',2024,'2024-Dec',5,340,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekday'),(7280,'2024-12-06',7280,240,'Friday','December',2024,'2024-Dec',6,341,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekday'),(7281,'2024-12-07',7281,240,'Saturday','December',2024,'2024-Dec',7,342,48,'2024-W48','2024-12-01',49,'2024-W49','2024-12-02','Non-Holiday','Weekend'),(7282,'2024-12-08',7282,240,'Sunday','December',2024,'2024-Dec',8,343,49,'2024-W49','2024-12-08',49,'2024-W49','2024-12-02','Non-Holiday','Weekend'),(7283,'2024-12-09',7283,240,'Monday','December',2024,'2024-Dec',9,344,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekday'),(7284,'2024-12-10',7284,240,'Tuesday','December',2024,'2024-Dec',10,345,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekday'),(7285,'2024-12-11',7285,240,'Wednesday','December',2024,'2024-Dec',11,346,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekday'),(7286,'2024-12-12',7286,240,'Thursday','December',2024,'2024-Dec',12,347,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekday'),(7287,'2024-12-13',7287,240,'Friday','December',2024,'2024-Dec',13,348,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekday'),(7288,'2024-12-14',7288,240,'Saturday','December',2024,'2024-Dec',14,349,49,'2024-W49','2024-12-08',50,'2024-W50','2024-12-09','Non-Holiday','Weekend'),(7289,'2024-12-15',7289,240,'Sunday','December',2024,'2024-Dec',15,350,50,'2024-W50','2024-12-15',50,'2024-W50','2024-12-09','Non-Holiday','Weekend'),(7290,'2024-12-16',7290,240,'Monday','December',2024,'2024-Dec',16,351,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekday'),(7291,'2024-12-17',7291,240,'Tuesday','December',2024,'2024-Dec',17,352,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekday'),(7292,'2024-12-18',7292,240,'Wednesday','December',2024,'2024-Dec',18,353,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekday'),(7293,'2024-12-19',7293,240,'Thursday','December',2024,'2024-Dec',19,354,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekday'),(7294,'2024-12-20',7294,240,'Friday','December',2024,'2024-Dec',20,355,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekday'),(7295,'2024-12-21',7295,240,'Saturday','December',2024,'2024-Dec',21,356,50,'2024-W50','2024-12-15',51,'2024-W51','2024-12-16','Non-Holiday','Weekend'),(7296,'2024-12-22',7296,240,'Sunday','December',2024,'2024-Dec',22,357,51,'2024-W51','2024-12-22',51,'2024-W51','2024-12-16','Non-Holiday','Weekend'),(7297,'2024-12-23',7297,240,'Monday','December',2024,'2024-Dec',23,358,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekday'),(7298,'2024-12-24',7298,240,'Tuesday','December',2024,'2024-Dec',24,359,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekday'),(7299,'2024-12-25',7299,240,'Wednesday','December',2024,'2024-Dec',25,360,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekday'),(7300,'2024-12-26',7300,240,'Thursday','December',2024,'2024-Dec',26,361,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekday'),(7301,'2024-12-27',7301,240,'Friday','December',2024,'2024-Dec',27,362,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekday'),(7302,'2024-12-28',7302,240,'Saturday','December',2024,'2024-Dec',28,363,51,'2024-W51','2024-12-22',52,'2024-W52','2024-12-23','Non-Holiday','Weekend'),(7303,'2024-12-29',7303,240,'Sunday','December',2024,'2024-Dec',29,364,52,'2024-W52','2024-12-29',52,'2024-W52','2024-12-23','Non-Holiday','Weekend'),(7304,'2024-12-30',7304,240,'Monday','December',2024,'2024-Dec',30,365,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekday'),(7305,'2024-12-31',7305,240,'Tuesday','December',2024,'2024-Dec',31,366,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekday'),(7306,'2025-01-01',7306,241,'Wednesday','January',2025,'2025-Jan',1,1,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekday'),(7307,'2025-01-02',7307,241,'Thursday','January',2025,'2025-Jan',2,2,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekday'),(7308,'2025-01-03',7308,241,'Friday','January',2025,'2025-Jan',3,3,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekday'),(7309,'2025-01-04',7309,241,'Saturday','January',2025,'2025-Jan',4,4,52,'2024-W52','2024-12-29',1,'2024-W01','2024-12-30','Non-Holiday','Weekend'),(7310,'2025-01-05',7310,241,'Sunday','January',2025,'2025-Jan',5,5,1,'2025-W01','2025-01-05',1,'2024-W01','2024-12-30','Non-Holiday','Weekend'),(7311,'2025-01-06',7311,241,'Monday','January',2025,'2025-Jan',6,6,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekday'),(7312,'2025-01-07',7312,241,'Tuesday','January',2025,'2025-Jan',7,7,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekday'),(7313,'2025-01-08',7313,241,'Wednesday','January',2025,'2025-Jan',8,8,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekday'),(7314,'2025-01-09',7314,241,'Thursday','January',2025,'2025-Jan',9,9,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekday'),(7315,'2025-01-10',7315,241,'Friday','January',2025,'2025-Jan',10,10,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekday'),(7316,'2025-01-11',7316,241,'Saturday','January',2025,'2025-Jan',11,11,1,'2025-W01','2025-01-05',2,'2025-W02','2025-01-06','Non-Holiday','Weekend'),(7317,'2025-01-12',7317,241,'Sunday','January',2025,'2025-Jan',12,12,2,'2025-W02','2025-01-12',2,'2025-W02','2025-01-06','Non-Holiday','Weekend'),(7318,'2025-01-13',7318,241,'Monday','January',2025,'2025-Jan',13,13,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekday'),(7319,'2025-01-14',7319,241,'Tuesday','January',2025,'2025-Jan',14,14,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekday'),(7320,'2025-01-15',7320,241,'Wednesday','January',2025,'2025-Jan',15,15,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekday'),(7321,'2025-01-16',7321,241,'Thursday','January',2025,'2025-Jan',16,16,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekday'),(7322,'2025-01-17',7322,241,'Friday','January',2025,'2025-Jan',17,17,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekday'),(7323,'2025-01-18',7323,241,'Saturday','January',2025,'2025-Jan',18,18,2,'2025-W02','2025-01-12',3,'2025-W03','2025-01-13','Non-Holiday','Weekend'),(7324,'2025-01-19',7324,241,'Sunday','January',2025,'2025-Jan',19,19,3,'2025-W03','2025-01-19',3,'2025-W03','2025-01-13','Non-Holiday','Weekend'),(7325,'2025-01-20',7325,241,'Monday','January',2025,'2025-Jan',20,20,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekday'),(7326,'2025-01-21',7326,241,'Tuesday','January',2025,'2025-Jan',21,21,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekday'),(7327,'2025-01-22',7327,241,'Wednesday','January',2025,'2025-Jan',22,22,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekday'),(7328,'2025-01-23',7328,241,'Thursday','January',2025,'2025-Jan',23,23,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekday'),(7329,'2025-01-24',7329,241,'Friday','January',2025,'2025-Jan',24,24,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekday'),(7330,'2025-01-25',7330,241,'Saturday','January',2025,'2025-Jan',25,25,3,'2025-W03','2025-01-19',4,'2025-W04','2025-01-20','Non-Holiday','Weekend'),(7331,'2025-01-26',7331,241,'Sunday','January',2025,'2025-Jan',26,26,4,'2025-W04','2025-01-26',4,'2025-W04','2025-01-20','Non-Holiday','Weekend'),(7332,'2025-01-27',7332,241,'Monday','January',2025,'2025-Jan',27,27,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekday'),(7333,'2025-01-28',7333,241,'Tuesday','January',2025,'2025-Jan',28,28,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekday'),(7334,'2025-01-29',7334,241,'Wednesday','January',2025,'2025-Jan',29,29,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekday'),(7335,'2025-01-30',7335,241,'Thursday','January',2025,'2025-Jan',30,30,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekday'),(7336,'2025-01-31',7336,241,'Friday','January',2025,'2025-Jan',31,31,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekday'),(7337,'2025-02-01',7337,242,'Saturday','February',2025,'2025-Feb',1,32,4,'2025-W04','2025-01-26',5,'2025-W05','2025-01-27','Non-Holiday','Weekend'),(7338,'2025-02-02',7338,242,'Sunday','February',2025,'2025-Feb',2,33,5,'2025-W05','2025-02-02',5,'2025-W05','2025-01-27','Non-Holiday','Weekend'),(7339,'2025-02-03',7339,242,'Monday','February',2025,'2025-Feb',3,34,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekday'),(7340,'2025-02-04',7340,242,'Tuesday','February',2025,'2025-Feb',4,35,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekday'),(7341,'2025-02-05',7341,242,'Wednesday','February',2025,'2025-Feb',5,36,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekday'),(7342,'2025-02-06',7342,242,'Thursday','February',2025,'2025-Feb',6,37,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekday'),(7343,'2025-02-07',7343,242,'Friday','February',2025,'2025-Feb',7,38,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekday'),(7344,'2025-02-08',7344,242,'Saturday','February',2025,'2025-Feb',8,39,5,'2025-W05','2025-02-02',6,'2025-W06','2025-02-03','Non-Holiday','Weekend'),(7345,'2025-02-09',7345,242,'Sunday','February',2025,'2025-Feb',9,40,6,'2025-W06','2025-02-09',6,'2025-W06','2025-02-03','Non-Holiday','Weekend'),(7346,'2025-02-10',7346,242,'Monday','February',2025,'2025-Feb',10,41,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekday'),(7347,'2025-02-11',7347,242,'Tuesday','February',2025,'2025-Feb',11,42,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekday'),(7348,'2025-02-12',7348,242,'Wednesday','February',2025,'2025-Feb',12,43,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekday'),(7349,'2025-02-13',7349,242,'Thursday','February',2025,'2025-Feb',13,44,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekday'),(7350,'2025-02-14',7350,242,'Friday','February',2025,'2025-Feb',14,45,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekday'),(7351,'2025-02-15',7351,242,'Saturday','February',2025,'2025-Feb',15,46,6,'2025-W06','2025-02-09',7,'2025-W07','2025-02-10','Non-Holiday','Weekend'),(7352,'2025-02-16',7352,242,'Sunday','February',2025,'2025-Feb',16,47,7,'2025-W07','2025-02-16',7,'2025-W07','2025-02-10','Non-Holiday','Weekend'),(7353,'2025-02-17',7353,242,'Monday','February',2025,'2025-Feb',17,48,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekday'),(7354,'2025-02-18',7354,242,'Tuesday','February',2025,'2025-Feb',18,49,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekday'),(7355,'2025-02-19',7355,242,'Wednesday','February',2025,'2025-Feb',19,50,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekday'),(7356,'2025-02-20',7356,242,'Thursday','February',2025,'2025-Feb',20,51,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekday'),(7357,'2025-02-21',7357,242,'Friday','February',2025,'2025-Feb',21,52,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekday'),(7358,'2025-02-22',7358,242,'Saturday','February',2025,'2025-Feb',22,53,7,'2025-W07','2025-02-16',8,'2025-W08','2025-02-17','Non-Holiday','Weekend'),(7359,'2025-02-23',7359,242,'Sunday','February',2025,'2025-Feb',23,54,8,'2025-W08','2025-02-23',8,'2025-W08','2025-02-17','Non-Holiday','Weekend'),(7360,'2025-02-24',7360,242,'Monday','February',2025,'2025-Feb',24,55,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekday'),(7361,'2025-02-25',7361,242,'Tuesday','February',2025,'2025-Feb',25,56,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekday'),(7362,'2025-02-26',7362,242,'Wednesday','February',2025,'2025-Feb',26,57,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekday'),(7363,'2025-02-27',7363,242,'Thursday','February',2025,'2025-Feb',27,58,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekday'),(7364,'2025-02-28',7364,242,'Friday','February',2025,'2025-Feb',28,59,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekday'),(7365,'2025-03-01',7365,243,'Saturday','March',2025,'2025-Mar',1,60,8,'2025-W08','2025-02-23',9,'2025-W09','2025-02-24','Non-Holiday','Weekend'),(7366,'2025-03-02',7366,243,'Sunday','March',2025,'2025-Mar',2,61,9,'2025-W09','2025-03-02',9,'2025-W09','2025-02-24','Non-Holiday','Weekend'),(7367,'2025-03-03',7367,243,'Monday','March',2025,'2025-Mar',3,62,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekday'),(7368,'2025-03-04',7368,243,'Tuesday','March',2025,'2025-Mar',4,63,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekday'),(7369,'2025-03-05',7369,243,'Wednesday','March',2025,'2025-Mar',5,64,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekday'),(7370,'2025-03-06',7370,243,'Thursday','March',2025,'2025-Mar',6,65,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekday'),(7371,'2025-03-07',7371,243,'Friday','March',2025,'2025-Mar',7,66,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekday'),(7372,'2025-03-08',7372,243,'Saturday','March',2025,'2025-Mar',8,67,9,'2025-W09','2025-03-02',10,'2025-W10','2025-03-03','Non-Holiday','Weekend'),(7373,'2025-03-09',7373,243,'Sunday','March',2025,'2025-Mar',9,68,10,'2025-W10','2025-03-09',10,'2025-W10','2025-03-03','Non-Holiday','Weekend'),(7374,'2025-03-10',7374,243,'Monday','March',2025,'2025-Mar',10,69,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekday'),(7375,'2025-03-11',7375,243,'Tuesday','March',2025,'2025-Mar',11,70,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekday'),(7376,'2025-03-12',7376,243,'Wednesday','March',2025,'2025-Mar',12,71,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekday'),(7377,'2025-03-13',7377,243,'Thursday','March',2025,'2025-Mar',13,72,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekday'),(7378,'2025-03-14',7378,243,'Friday','March',2025,'2025-Mar',14,73,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekday'),(7379,'2025-03-15',7379,243,'Saturday','March',2025,'2025-Mar',15,74,10,'2025-W10','2025-03-09',11,'2025-W11','2025-03-10','Non-Holiday','Weekend'),(7380,'2025-03-16',7380,243,'Sunday','March',2025,'2025-Mar',16,75,11,'2025-W11','2025-03-16',11,'2025-W11','2025-03-10','Non-Holiday','Weekend'),(7381,'2025-03-17',7381,243,'Monday','March',2025,'2025-Mar',17,76,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekday'),(7382,'2025-03-18',7382,243,'Tuesday','March',2025,'2025-Mar',18,77,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekday'),(7383,'2025-03-19',7383,243,'Wednesday','March',2025,'2025-Mar',19,78,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekday'),(7384,'2025-03-20',7384,243,'Thursday','March',2025,'2025-Mar',20,79,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekday'),(7385,'2025-03-21',7385,243,'Friday','March',2025,'2025-Mar',21,80,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekday'),(7386,'2025-03-22',7386,243,'Saturday','March',2025,'2025-Mar',22,81,11,'2025-W11','2025-03-16',12,'2025-W12','2025-03-17','Non-Holiday','Weekend'),(7387,'2025-03-23',7387,243,'Sunday','March',2025,'2025-Mar',23,82,12,'2025-W12','2025-03-23',12,'2025-W12','2025-03-17','Non-Holiday','Weekend'),(7388,'2025-03-24',7388,243,'Monday','March',2025,'2025-Mar',24,83,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekday'),(7389,'2025-03-25',7389,243,'Tuesday','March',2025,'2025-Mar',25,84,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekday'),(7390,'2025-03-26',7390,243,'Wednesday','March',2025,'2025-Mar',26,85,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekday'),(7391,'2025-03-27',7391,243,'Thursday','March',2025,'2025-Mar',27,86,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekday'),(7392,'2025-03-28',7392,243,'Friday','March',2025,'2025-Mar',28,87,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekday'),(7393,'2025-03-29',7393,243,'Saturday','March',2025,'2025-Mar',29,88,12,'2025-W12','2025-03-23',13,'2025-W13','2025-03-24','Non-Holiday','Weekend'),(7394,'2025-03-30',7394,243,'Sunday','March',2025,'2025-Mar',30,89,13,'2025-W13','2025-03-30',13,'2025-W13','2025-03-24','Non-Holiday','Weekend'),(7395,'2025-03-31',7395,243,'Monday','March',2025,'2025-Mar',31,90,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekday'),(7396,'2025-04-01',7396,244,'Tuesday','April',2025,'2025-Apr',1,91,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekday'),(7397,'2025-04-02',7397,244,'Wednesday','April',2025,'2025-Apr',2,92,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekday'),(7398,'2025-04-03',7398,244,'Thursday','April',2025,'2025-Apr',3,93,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekday'),(7399,'2025-04-04',7399,244,'Friday','April',2025,'2025-Apr',4,94,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekday'),(7400,'2025-04-05',7400,244,'Saturday','April',2025,'2025-Apr',5,95,13,'2025-W13','2025-03-30',14,'2025-W14','2025-03-31','Non-Holiday','Weekend'),(7401,'2025-04-06',7401,244,'Sunday','April',2025,'2025-Apr',6,96,14,'2025-W14','2025-04-06',14,'2025-W14','2025-03-31','Non-Holiday','Weekend'),(7402,'2025-04-07',7402,244,'Monday','April',2025,'2025-Apr',7,97,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekday'),(7403,'2025-04-08',7403,244,'Tuesday','April',2025,'2025-Apr',8,98,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekday'),(7404,'2025-04-09',7404,244,'Wednesday','April',2025,'2025-Apr',9,99,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekday'),(7405,'2025-04-10',7405,244,'Thursday','April',2025,'2025-Apr',10,100,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekday'),(7406,'2025-04-11',7406,244,'Friday','April',2025,'2025-Apr',11,101,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekday'),(7407,'2025-04-12',7407,244,'Saturday','April',2025,'2025-Apr',12,102,14,'2025-W14','2025-04-06',15,'2025-W15','2025-04-07','Non-Holiday','Weekend'),(7408,'2025-04-13',7408,244,'Sunday','April',2025,'2025-Apr',13,103,15,'2025-W15','2025-04-13',15,'2025-W15','2025-04-07','Non-Holiday','Weekend'),(7409,'2025-04-14',7409,244,'Monday','April',2025,'2025-Apr',14,104,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekday'),(7410,'2025-04-15',7410,244,'Tuesday','April',2025,'2025-Apr',15,105,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekday'),(7411,'2025-04-16',7411,244,'Wednesday','April',2025,'2025-Apr',16,106,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekday'),(7412,'2025-04-17',7412,244,'Thursday','April',2025,'2025-Apr',17,107,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekday'),(7413,'2025-04-18',7413,244,'Friday','April',2025,'2025-Apr',18,108,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekday'),(7414,'2025-04-19',7414,244,'Saturday','April',2025,'2025-Apr',19,109,15,'2025-W15','2025-04-13',16,'2025-W16','2025-04-14','Non-Holiday','Weekend'),(7415,'2025-04-20',7415,244,'Sunday','April',2025,'2025-Apr',20,110,16,'2025-W16','2025-04-20',16,'2025-W16','2025-04-14','Non-Holiday','Weekend'),(7416,'2025-04-21',7416,244,'Monday','April',2025,'2025-Apr',21,111,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekday'),(7417,'2025-04-22',7417,244,'Tuesday','April',2025,'2025-Apr',22,112,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekday'),(7418,'2025-04-23',7418,244,'Wednesday','April',2025,'2025-Apr',23,113,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekday'),(7419,'2025-04-24',7419,244,'Thursday','April',2025,'2025-Apr',24,114,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekday'),(7420,'2025-04-25',7420,244,'Friday','April',2025,'2025-Apr',25,115,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekday'),(7421,'2025-04-26',7421,244,'Saturday','April',2025,'2025-Apr',26,116,16,'2025-W16','2025-04-20',17,'2025-W17','2025-04-21','Non-Holiday','Weekend'),(7422,'2025-04-27',7422,244,'Sunday','April',2025,'2025-Apr',27,117,17,'2025-W17','2025-04-27',17,'2025-W17','2025-04-21','Non-Holiday','Weekend'),(7423,'2025-04-28',7423,244,'Monday','April',2025,'2025-Apr',28,118,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekday'),(7424,'2025-04-29',7424,244,'Tuesday','April',2025,'2025-Apr',29,119,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekday'),(7425,'2025-04-30',7425,244,'Wednesday','April',2025,'2025-Apr',30,120,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekday'),(7426,'2025-05-01',7426,245,'Thursday','May',2025,'2025-May',1,121,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekday'),(7427,'2025-05-02',7427,245,'Friday','May',2025,'2025-May',2,122,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekday'),(7428,'2025-05-03',7428,245,'Saturday','May',2025,'2025-May',3,123,17,'2025-W17','2025-04-27',18,'2025-W18','2025-04-28','Non-Holiday','Weekend'),(7429,'2025-05-04',7429,245,'Sunday','May',2025,'2025-May',4,124,18,'2025-W18','2025-05-04',18,'2025-W18','2025-04-28','Non-Holiday','Weekend'),(7430,'2025-05-05',7430,245,'Monday','May',2025,'2025-May',5,125,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekday'),(7431,'2025-05-06',7431,245,'Tuesday','May',2025,'2025-May',6,126,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekday'),(7432,'2025-05-07',7432,245,'Wednesday','May',2025,'2025-May',7,127,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekday'),(7433,'2025-05-08',7433,245,'Thursday','May',2025,'2025-May',8,128,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekday'),(7434,'2025-05-09',7434,245,'Friday','May',2025,'2025-May',9,129,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekday'),(7435,'2025-05-10',7435,245,'Saturday','May',2025,'2025-May',10,130,18,'2025-W18','2025-05-04',19,'2025-W19','2025-05-05','Non-Holiday','Weekend'),(7436,'2025-05-11',7436,245,'Sunday','May',2025,'2025-May',11,131,19,'2025-W19','2025-05-11',19,'2025-W19','2025-05-05','Non-Holiday','Weekend'),(7437,'2025-05-12',7437,245,'Monday','May',2025,'2025-May',12,132,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekday'),(7438,'2025-05-13',7438,245,'Tuesday','May',2025,'2025-May',13,133,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekday'),(7439,'2025-05-14',7439,245,'Wednesday','May',2025,'2025-May',14,134,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekday'),(7440,'2025-05-15',7440,245,'Thursday','May',2025,'2025-May',15,135,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekday'),(7441,'2025-05-16',7441,245,'Friday','May',2025,'2025-May',16,136,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekday'),(7442,'2025-05-17',7442,245,'Saturday','May',2025,'2025-May',17,137,19,'2025-W19','2025-05-11',20,'2025-W20','2025-05-12','Non-Holiday','Weekend'),(7443,'2025-05-18',7443,245,'Sunday','May',2025,'2025-May',18,138,20,'2025-W20','2025-05-18',20,'2025-W20','2025-05-12','Non-Holiday','Weekend'),(7444,'2025-05-19',7444,245,'Monday','May',2025,'2025-May',19,139,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekday'),(7445,'2025-05-20',7445,245,'Tuesday','May',2025,'2025-May',20,140,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekday'),(7446,'2025-05-21',7446,245,'Wednesday','May',2025,'2025-May',21,141,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekday'),(7447,'2025-05-22',7447,245,'Thursday','May',2025,'2025-May',22,142,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekday'),(7448,'2025-05-23',7448,245,'Friday','May',2025,'2025-May',23,143,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekday'),(7449,'2025-05-24',7449,245,'Saturday','May',2025,'2025-May',24,144,20,'2025-W20','2025-05-18',21,'2025-W21','2025-05-19','Non-Holiday','Weekend'),(7450,'2025-05-25',7450,245,'Sunday','May',2025,'2025-May',25,145,21,'2025-W21','2025-05-25',21,'2025-W21','2025-05-19','Non-Holiday','Weekend'),(7451,'2025-05-26',7451,245,'Monday','May',2025,'2025-May',26,146,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekday'),(7452,'2025-05-27',7452,245,'Tuesday','May',2025,'2025-May',27,147,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekday'),(7453,'2025-05-28',7453,245,'Wednesday','May',2025,'2025-May',28,148,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekday'),(7454,'2025-05-29',7454,245,'Thursday','May',2025,'2025-May',29,149,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekday'),(7455,'2025-05-30',7455,245,'Friday','May',2025,'2025-May',30,150,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekday'),(7456,'2025-05-31',7456,245,'Saturday','May',2025,'2025-May',31,151,21,'2025-W21','2025-05-25',22,'2025-W22','2025-05-26','Non-Holiday','Weekend'),(7457,'2025-06-01',7457,246,'Sunday','June',2025,'2025-Jun',1,152,22,'2025-W22','2025-06-01',22,'2025-W22','2025-05-26','Non-Holiday','Weekend'),(7458,'2025-06-02',7458,246,'Monday','June',2025,'2025-Jun',2,153,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekday'),(7459,'2025-06-03',7459,246,'Tuesday','June',2025,'2025-Jun',3,154,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekday'),(7460,'2025-06-04',7460,246,'Wednesday','June',2025,'2025-Jun',4,155,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekday'),(7461,'2025-06-05',7461,246,'Thursday','June',2025,'2025-Jun',5,156,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekday'),(7462,'2025-06-06',7462,246,'Friday','June',2025,'2025-Jun',6,157,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekday'),(7463,'2025-06-07',7463,246,'Saturday','June',2025,'2025-Jun',7,158,22,'2025-W22','2025-06-01',23,'2025-W23','2025-06-02','Non-Holiday','Weekend'),(7464,'2025-06-08',7464,246,'Sunday','June',2025,'2025-Jun',8,159,23,'2025-W23','2025-06-08',23,'2025-W23','2025-06-02','Non-Holiday','Weekend'),(7465,'2025-06-09',7465,246,'Monday','June',2025,'2025-Jun',9,160,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekday'),(7466,'2025-06-10',7466,246,'Tuesday','June',2025,'2025-Jun',10,161,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekday'),(7467,'2025-06-11',7467,246,'Wednesday','June',2025,'2025-Jun',11,162,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekday'),(7468,'2025-06-12',7468,246,'Thursday','June',2025,'2025-Jun',12,163,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekday'),(7469,'2025-06-13',7469,246,'Friday','June',2025,'2025-Jun',13,164,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekday'),(7470,'2025-06-14',7470,246,'Saturday','June',2025,'2025-Jun',14,165,23,'2025-W23','2025-06-08',24,'2025-W24','2025-06-09','Non-Holiday','Weekend'),(7471,'2025-06-15',7471,246,'Sunday','June',2025,'2025-Jun',15,166,24,'2025-W24','2025-06-15',24,'2025-W24','2025-06-09','Non-Holiday','Weekend'),(7472,'2025-06-16',7472,246,'Monday','June',2025,'2025-Jun',16,167,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekday'),(7473,'2025-06-17',7473,246,'Tuesday','June',2025,'2025-Jun',17,168,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekday'),(7474,'2025-06-18',7474,246,'Wednesday','June',2025,'2025-Jun',18,169,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekday'),(7475,'2025-06-19',7475,246,'Thursday','June',2025,'2025-Jun',19,170,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekday'),(7476,'2025-06-20',7476,246,'Friday','June',2025,'2025-Jun',20,171,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekday'),(7477,'2025-06-21',7477,246,'Saturday','June',2025,'2025-Jun',21,172,24,'2025-W24','2025-06-15',25,'2025-W25','2025-06-16','Non-Holiday','Weekend'),(7478,'2025-06-22',7478,246,'Sunday','June',2025,'2025-Jun',22,173,25,'2025-W25','2025-06-22',25,'2025-W25','2025-06-16','Non-Holiday','Weekend'),(7479,'2025-06-23',7479,246,'Monday','June',2025,'2025-Jun',23,174,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekday'),(7480,'2025-06-24',7480,246,'Tuesday','June',2025,'2025-Jun',24,175,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekday'),(7481,'2025-06-25',7481,246,'Wednesday','June',2025,'2025-Jun',25,176,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekday'),(7482,'2025-06-26',7482,246,'Thursday','June',2025,'2025-Jun',26,177,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekday'),(7483,'2025-06-27',7483,246,'Friday','June',2025,'2025-Jun',27,178,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekday'),(7484,'2025-06-28',7484,246,'Saturday','June',2025,'2025-Jun',28,179,25,'2025-W25','2025-06-22',26,'2025-W26','2025-06-23','Non-Holiday','Weekend'),(7485,'2025-06-29',7485,246,'Sunday','June',2025,'2025-Jun',29,180,26,'2025-W26','2025-06-29',26,'2025-W26','2025-06-23','Non-Holiday','Weekend'),(7486,'2025-06-30',7486,246,'Monday','June',2025,'2025-Jun',30,181,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekday'),(7487,'2025-07-01',7487,247,'Tuesday','July',2025,'2025-Jul',1,182,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekday'),(7488,'2025-07-02',7488,247,'Wednesday','July',2025,'2025-Jul',2,183,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekday'),(7489,'2025-07-03',7489,247,'Thursday','July',2025,'2025-Jul',3,184,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekday'),(7490,'2025-07-04',7490,247,'Friday','July',2025,'2025-Jul',4,185,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekday'),(7491,'2025-07-05',7491,247,'Saturday','July',2025,'2025-Jul',5,186,26,'2025-W26','2025-06-29',27,'2025-W27','2025-06-30','Non-Holiday','Weekend'),(7492,'2025-07-06',7492,247,'Sunday','July',2025,'2025-Jul',6,187,27,'2025-W27','2025-07-06',27,'2025-W27','2025-06-30','Non-Holiday','Weekend'),(7493,'2025-07-07',7493,247,'Monday','July',2025,'2025-Jul',7,188,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekday'),(7494,'2025-07-08',7494,247,'Tuesday','July',2025,'2025-Jul',8,189,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekday'),(7495,'2025-07-09',7495,247,'Wednesday','July',2025,'2025-Jul',9,190,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekday'),(7496,'2025-07-10',7496,247,'Thursday','July',2025,'2025-Jul',10,191,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekday'),(7497,'2025-07-11',7497,247,'Friday','July',2025,'2025-Jul',11,192,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekday'),(7498,'2025-07-12',7498,247,'Saturday','July',2025,'2025-Jul',12,193,27,'2025-W27','2025-07-06',28,'2025-W28','2025-07-07','Non-Holiday','Weekend'),(7499,'2025-07-13',7499,247,'Sunday','July',2025,'2025-Jul',13,194,28,'2025-W28','2025-07-13',28,'2025-W28','2025-07-07','Non-Holiday','Weekend'),(7500,'2025-07-14',7500,247,'Monday','July',2025,'2025-Jul',14,195,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekday'),(7501,'2025-07-15',7501,247,'Tuesday','July',2025,'2025-Jul',15,196,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekday'),(7502,'2025-07-16',7502,247,'Wednesday','July',2025,'2025-Jul',16,197,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekday'),(7503,'2025-07-17',7503,247,'Thursday','July',2025,'2025-Jul',17,198,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekday'),(7504,'2025-07-18',7504,247,'Friday','July',2025,'2025-Jul',18,199,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekday'),(7505,'2025-07-19',7505,247,'Saturday','July',2025,'2025-Jul',19,200,28,'2025-W28','2025-07-13',29,'2025-W29','2025-07-14','Non-Holiday','Weekend'),(7506,'2025-07-20',7506,247,'Sunday','July',2025,'2025-Jul',20,201,29,'2025-W29','2025-07-20',29,'2025-W29','2025-07-14','Non-Holiday','Weekend'),(7507,'2025-07-21',7507,247,'Monday','July',2025,'2025-Jul',21,202,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekday'),(7508,'2025-07-22',7508,247,'Tuesday','July',2025,'2025-Jul',22,203,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekday'),(7509,'2025-07-23',7509,247,'Wednesday','July',2025,'2025-Jul',23,204,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekday'),(7510,'2025-07-24',7510,247,'Thursday','July',2025,'2025-Jul',24,205,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekday'),(7511,'2025-07-25',7511,247,'Friday','July',2025,'2025-Jul',25,206,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekday'),(7512,'2025-07-26',7512,247,'Saturday','July',2025,'2025-Jul',26,207,29,'2025-W29','2025-07-20',30,'2025-W30','2025-07-21','Non-Holiday','Weekend'),(7513,'2025-07-27',7513,247,'Sunday','July',2025,'2025-Jul',27,208,30,'2025-W30','2025-07-27',30,'2025-W30','2025-07-21','Non-Holiday','Weekend'),(7514,'2025-07-28',7514,247,'Monday','July',2025,'2025-Jul',28,209,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekday'),(7515,'2025-07-29',7515,247,'Tuesday','July',2025,'2025-Jul',29,210,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekday'),(7516,'2025-07-30',7516,247,'Wednesday','July',2025,'2025-Jul',30,211,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekday'),(7517,'2025-07-31',7517,247,'Thursday','July',2025,'2025-Jul',31,212,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekday'),(7518,'2025-08-01',7518,248,'Friday','August',2025,'2025-Aug',1,213,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekday'),(7519,'2025-08-02',7519,248,'Saturday','August',2025,'2025-Aug',2,214,30,'2025-W30','2025-07-27',31,'2025-W31','2025-07-28','Non-Holiday','Weekend'),(7520,'2025-08-03',7520,248,'Sunday','August',2025,'2025-Aug',3,215,31,'2025-W31','2025-08-03',31,'2025-W31','2025-07-28','Non-Holiday','Weekend'),(7521,'2025-08-04',7521,248,'Monday','August',2025,'2025-Aug',4,216,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekday'),(7522,'2025-08-05',7522,248,'Tuesday','August',2025,'2025-Aug',5,217,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekday'),(7523,'2025-08-06',7523,248,'Wednesday','August',2025,'2025-Aug',6,218,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekday'),(7524,'2025-08-07',7524,248,'Thursday','August',2025,'2025-Aug',7,219,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekday'),(7525,'2025-08-08',7525,248,'Friday','August',2025,'2025-Aug',8,220,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekday'),(7526,'2025-08-09',7526,248,'Saturday','August',2025,'2025-Aug',9,221,31,'2025-W31','2025-08-03',32,'2025-W32','2025-08-04','Non-Holiday','Weekend'),(7527,'2025-08-10',7527,248,'Sunday','August',2025,'2025-Aug',10,222,32,'2025-W32','2025-08-10',32,'2025-W32','2025-08-04','Non-Holiday','Weekend'),(7528,'2025-08-11',7528,248,'Monday','August',2025,'2025-Aug',11,223,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekday'),(7529,'2025-08-12',7529,248,'Tuesday','August',2025,'2025-Aug',12,224,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekday'),(7530,'2025-08-13',7530,248,'Wednesday','August',2025,'2025-Aug',13,225,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekday'),(7531,'2025-08-14',7531,248,'Thursday','August',2025,'2025-Aug',14,226,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekday'),(7532,'2025-08-15',7532,248,'Friday','August',2025,'2025-Aug',15,227,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekday'),(7533,'2025-08-16',7533,248,'Saturday','August',2025,'2025-Aug',16,228,32,'2025-W32','2025-08-10',33,'2025-W33','2025-08-11','Non-Holiday','Weekend'),(7534,'2025-08-17',7534,248,'Sunday','August',2025,'2025-Aug',17,229,33,'2025-W33','2025-08-17',33,'2025-W33','2025-08-11','Non-Holiday','Weekend'),(7535,'2025-08-18',7535,248,'Monday','August',2025,'2025-Aug',18,230,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekday'),(7536,'2025-08-19',7536,248,'Tuesday','August',2025,'2025-Aug',19,231,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekday'),(7537,'2025-08-20',7537,248,'Wednesday','August',2025,'2025-Aug',20,232,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekday'),(7538,'2025-08-21',7538,248,'Thursday','August',2025,'2025-Aug',21,233,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekday'),(7539,'2025-08-22',7539,248,'Friday','August',2025,'2025-Aug',22,234,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekday'),(7540,'2025-08-23',7540,248,'Saturday','August',2025,'2025-Aug',23,235,33,'2025-W33','2025-08-17',34,'2025-W34','2025-08-18','Non-Holiday','Weekend'),(7541,'2025-08-24',7541,248,'Sunday','August',2025,'2025-Aug',24,236,34,'2025-W34','2025-08-24',34,'2025-W34','2025-08-18','Non-Holiday','Weekend'),(7542,'2025-08-25',7542,248,'Monday','August',2025,'2025-Aug',25,237,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekday'),(7543,'2025-08-26',7543,248,'Tuesday','August',2025,'2025-Aug',26,238,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekday'),(7544,'2025-08-27',7544,248,'Wednesday','August',2025,'2025-Aug',27,239,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekday'),(7545,'2025-08-28',7545,248,'Thursday','August',2025,'2025-Aug',28,240,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekday'),(7546,'2025-08-29',7546,248,'Friday','August',2025,'2025-Aug',29,241,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekday'),(7547,'2025-08-30',7547,248,'Saturday','August',2025,'2025-Aug',30,242,34,'2025-W34','2025-08-24',35,'2025-W35','2025-08-25','Non-Holiday','Weekend'),(7548,'2025-08-31',7548,248,'Sunday','August',2025,'2025-Aug',31,243,35,'2025-W35','2025-08-31',35,'2025-W35','2025-08-25','Non-Holiday','Weekend'),(7549,'2025-09-01',7549,249,'Monday','September',2025,'2025-Sep',1,244,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekday'),(7550,'2025-09-02',7550,249,'Tuesday','September',2025,'2025-Sep',2,245,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekday'),(7551,'2025-09-03',7551,249,'Wednesday','September',2025,'2025-Sep',3,246,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekday'),(7552,'2025-09-04',7552,249,'Thursday','September',2025,'2025-Sep',4,247,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekday'),(7553,'2025-09-05',7553,249,'Friday','September',2025,'2025-Sep',5,248,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekday'),(7554,'2025-09-06',7554,249,'Saturday','September',2025,'2025-Sep',6,249,35,'2025-W35','2025-08-31',36,'2025-W36','2025-09-01','Non-Holiday','Weekend'),(7555,'2025-09-07',7555,249,'Sunday','September',2025,'2025-Sep',7,250,36,'2025-W36','2025-09-07',36,'2025-W36','2025-09-01','Non-Holiday','Weekend'),(7556,'2025-09-08',7556,249,'Monday','September',2025,'2025-Sep',8,251,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekday'),(7557,'2025-09-09',7557,249,'Tuesday','September',2025,'2025-Sep',9,252,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekday'),(7558,'2025-09-10',7558,249,'Wednesday','September',2025,'2025-Sep',10,253,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekday'),(7559,'2025-09-11',7559,249,'Thursday','September',2025,'2025-Sep',11,254,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekday'),(7560,'2025-09-12',7560,249,'Friday','September',2025,'2025-Sep',12,255,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekday'),(7561,'2025-09-13',7561,249,'Saturday','September',2025,'2025-Sep',13,256,36,'2025-W36','2025-09-07',37,'2025-W37','2025-09-08','Non-Holiday','Weekend'),(7562,'2025-09-14',7562,249,'Sunday','September',2025,'2025-Sep',14,257,37,'2025-W37','2025-09-14',37,'2025-W37','2025-09-08','Non-Holiday','Weekend'),(7563,'2025-09-15',7563,249,'Monday','September',2025,'2025-Sep',15,258,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekday'),(7564,'2025-09-16',7564,249,'Tuesday','September',2025,'2025-Sep',16,259,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekday'),(7565,'2025-09-17',7565,249,'Wednesday','September',2025,'2025-Sep',17,260,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekday'),(7566,'2025-09-18',7566,249,'Thursday','September',2025,'2025-Sep',18,261,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekday'),(7567,'2025-09-19',7567,249,'Friday','September',2025,'2025-Sep',19,262,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekday'),(7568,'2025-09-20',7568,249,'Saturday','September',2025,'2025-Sep',20,263,37,'2025-W37','2025-09-14',38,'2025-W38','2025-09-15','Non-Holiday','Weekend'),(7569,'2025-09-21',7569,249,'Sunday','September',2025,'2025-Sep',21,264,38,'2025-W38','2025-09-21',38,'2025-W38','2025-09-15','Non-Holiday','Weekend'),(7570,'2025-09-22',7570,249,'Monday','September',2025,'2025-Sep',22,265,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekday'),(7571,'2025-09-23',7571,249,'Tuesday','September',2025,'2025-Sep',23,266,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekday'),(7572,'2025-09-24',7572,249,'Wednesday','September',2025,'2025-Sep',24,267,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekday'),(7573,'2025-09-25',7573,249,'Thursday','September',2025,'2025-Sep',25,268,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekday'),(7574,'2025-09-26',7574,249,'Friday','September',2025,'2025-Sep',26,269,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekday'),(7575,'2025-09-27',7575,249,'Saturday','September',2025,'2025-Sep',27,270,38,'2025-W38','2025-09-21',39,'2025-W39','2025-09-22','Non-Holiday','Weekend'),(7576,'2025-09-28',7576,249,'Sunday','September',2025,'2025-Sep',28,271,39,'2025-W39','2025-09-28',39,'2025-W39','2025-09-22','Non-Holiday','Weekend'),(7577,'2025-09-29',7577,249,'Monday','September',2025,'2025-Sep',29,272,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekday'),(7578,'2025-09-30',7578,249,'Tuesday','September',2025,'2025-Sep',30,273,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekday'),(7579,'2025-10-01',7579,250,'Wednesday','October',2025,'2025-Oct',1,274,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekday'),(7580,'2025-10-02',7580,250,'Thursday','October',2025,'2025-Oct',2,275,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekday'),(7581,'2025-10-03',7581,250,'Friday','October',2025,'2025-Oct',3,276,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekday'),(7582,'2025-10-04',7582,250,'Saturday','October',2025,'2025-Oct',4,277,39,'2025-W39','2025-09-28',40,'2025-W40','2025-09-29','Non-Holiday','Weekend'),(7583,'2025-10-05',7583,250,'Sunday','October',2025,'2025-Oct',5,278,40,'2025-W40','2025-10-05',40,'2025-W40','2025-09-29','Non-Holiday','Weekend'),(7584,'2025-10-06',7584,250,'Monday','October',2025,'2025-Oct',6,279,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekday'),(7585,'2025-10-07',7585,250,'Tuesday','October',2025,'2025-Oct',7,280,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekday'),(7586,'2025-10-08',7586,250,'Wednesday','October',2025,'2025-Oct',8,281,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekday'),(7587,'2025-10-09',7587,250,'Thursday','October',2025,'2025-Oct',9,282,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekday'),(7588,'2025-10-10',7588,250,'Friday','October',2025,'2025-Oct',10,283,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekday'),(7589,'2025-10-11',7589,250,'Saturday','October',2025,'2025-Oct',11,284,40,'2025-W40','2025-10-05',41,'2025-W41','2025-10-06','Non-Holiday','Weekend'),(7590,'2025-10-12',7590,250,'Sunday','October',2025,'2025-Oct',12,285,41,'2025-W41','2025-10-12',41,'2025-W41','2025-10-06','Non-Holiday','Weekend'),(7591,'2025-10-13',7591,250,'Monday','October',2025,'2025-Oct',13,286,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekday'),(7592,'2025-10-14',7592,250,'Tuesday','October',2025,'2025-Oct',14,287,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekday'),(7593,'2025-10-15',7593,250,'Wednesday','October',2025,'2025-Oct',15,288,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekday'),(7594,'2025-10-16',7594,250,'Thursday','October',2025,'2025-Oct',16,289,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekday'),(7595,'2025-10-17',7595,250,'Friday','October',2025,'2025-Oct',17,290,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekday'),(7596,'2025-10-18',7596,250,'Saturday','October',2025,'2025-Oct',18,291,41,'2025-W41','2025-10-12',42,'2025-W42','2025-10-13','Non-Holiday','Weekend'),(7597,'2025-10-19',7597,250,'Sunday','October',2025,'2025-Oct',19,292,42,'2025-W42','2025-10-19',42,'2025-W42','2025-10-13','Non-Holiday','Weekend'),(7598,'2025-10-20',7598,250,'Monday','October',2025,'2025-Oct',20,293,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekday'),(7599,'2025-10-21',7599,250,'Tuesday','October',2025,'2025-Oct',21,294,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekday'),(7600,'2025-10-22',7600,250,'Wednesday','October',2025,'2025-Oct',22,295,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekday'),(7601,'2025-10-23',7601,250,'Thursday','October',2025,'2025-Oct',23,296,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekday'),(7602,'2025-10-24',7602,250,'Friday','October',2025,'2025-Oct',24,297,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekday'),(7603,'2025-10-25',7603,250,'Saturday','October',2025,'2025-Oct',25,298,42,'2025-W42','2025-10-19',43,'2025-W43','2025-10-20','Non-Holiday','Weekend'),(7604,'2025-10-26',7604,250,'Sunday','October',2025,'2025-Oct',26,299,43,'2025-W43','2025-10-26',43,'2025-W43','2025-10-20','Non-Holiday','Weekend'),(7605,'2025-10-27',7605,250,'Monday','October',2025,'2025-Oct',27,300,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekday'),(7606,'2025-10-28',7606,250,'Tuesday','October',2025,'2025-Oct',28,301,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekday'),(7607,'2025-10-29',7607,250,'Wednesday','October',2025,'2025-Oct',29,302,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekday'),(7608,'2025-10-30',7608,250,'Thursday','October',2025,'2025-Oct',30,303,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekday'),(7609,'2025-10-31',7609,250,'Friday','October',2025,'2025-Oct',31,304,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekday'),(7610,'2025-11-01',7610,251,'Saturday','November',2025,'2025-Nov',1,305,43,'2025-W43','2025-10-26',44,'2025-W44','2025-10-27','Non-Holiday','Weekend'),(7611,'2025-11-02',7611,251,'Sunday','November',2025,'2025-Nov',2,306,44,'2025-W44','2025-11-02',44,'2025-W44','2025-10-27','Non-Holiday','Weekend'),(7612,'2025-11-03',7612,251,'Monday','November',2025,'2025-Nov',3,307,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekday'),(7613,'2025-11-04',7613,251,'Tuesday','November',2025,'2025-Nov',4,308,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekday'),(7614,'2025-11-05',7614,251,'Wednesday','November',2025,'2025-Nov',5,309,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekday'),(7615,'2025-11-06',7615,251,'Thursday','November',2025,'2025-Nov',6,310,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekday'),(7616,'2025-11-07',7616,251,'Friday','November',2025,'2025-Nov',7,311,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekday'),(7617,'2025-11-08',7617,251,'Saturday','November',2025,'2025-Nov',8,312,44,'2025-W44','2025-11-02',45,'2025-W45','2025-11-03','Non-Holiday','Weekend'),(7618,'2025-11-09',7618,251,'Sunday','November',2025,'2025-Nov',9,313,45,'2025-W45','2025-11-09',45,'2025-W45','2025-11-03','Non-Holiday','Weekend'),(7619,'2025-11-10',7619,251,'Monday','November',2025,'2025-Nov',10,314,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekday'),(7620,'2025-11-11',7620,251,'Tuesday','November',2025,'2025-Nov',11,315,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekday'),(7621,'2025-11-12',7621,251,'Wednesday','November',2025,'2025-Nov',12,316,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekday'),(7622,'2025-11-13',7622,251,'Thursday','November',2025,'2025-Nov',13,317,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekday'),(7623,'2025-11-14',7623,251,'Friday','November',2025,'2025-Nov',14,318,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekday'),(7624,'2025-11-15',7624,251,'Saturday','November',2025,'2025-Nov',15,319,45,'2025-W45','2025-11-09',46,'2025-W46','2025-11-10','Non-Holiday','Weekend'),(7625,'2025-11-16',7625,251,'Sunday','November',2025,'2025-Nov',16,320,46,'2025-W46','2025-11-16',46,'2025-W46','2025-11-10','Non-Holiday','Weekend'),(7626,'2025-11-17',7626,251,'Monday','November',2025,'2025-Nov',17,321,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekday'),(7627,'2025-11-18',7627,251,'Tuesday','November',2025,'2025-Nov',18,322,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekday'),(7628,'2025-11-19',7628,251,'Wednesday','November',2025,'2025-Nov',19,323,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekday'),(7629,'2025-11-20',7629,251,'Thursday','November',2025,'2025-Nov',20,324,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekday'),(7630,'2025-11-21',7630,251,'Friday','November',2025,'2025-Nov',21,325,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekday'),(7631,'2025-11-22',7631,251,'Saturday','November',2025,'2025-Nov',22,326,46,'2025-W46','2025-11-16',47,'2025-W47','2025-11-17','Non-Holiday','Weekend'),(7632,'2025-11-23',7632,251,'Sunday','November',2025,'2025-Nov',23,327,47,'2025-W47','2025-11-23',47,'2025-W47','2025-11-17','Non-Holiday','Weekend'),(7633,'2025-11-24',7633,251,'Monday','November',2025,'2025-Nov',24,328,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekday'),(7634,'2025-11-25',7634,251,'Tuesday','November',2025,'2025-Nov',25,329,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekday'),(7635,'2025-11-26',7635,251,'Wednesday','November',2025,'2025-Nov',26,330,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekday'),(7636,'2025-11-27',7636,251,'Thursday','November',2025,'2025-Nov',27,331,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekday'),(7637,'2025-11-28',7637,251,'Friday','November',2025,'2025-Nov',28,332,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekday'),(7638,'2025-11-29',7638,251,'Saturday','November',2025,'2025-Nov',29,333,47,'2025-W47','2025-11-23',48,'2025-W48','2025-11-24','Non-Holiday','Weekend'),(7639,'2025-11-30',7639,251,'Sunday','November',2025,'2025-Nov',30,334,48,'2025-W48','2025-11-30',48,'2025-W48','2025-11-24','Non-Holiday','Weekend'),(7640,'2025-12-01',7640,252,'Monday','December',2025,'2025-Dec',1,335,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekday'),(7641,'2025-12-02',7641,252,'Tuesday','December',2025,'2025-Dec',2,336,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekday'),(7642,'2025-12-03',7642,252,'Wednesday','December',2025,'2025-Dec',3,337,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekday'),(7643,'2025-12-04',7643,252,'Thursday','December',2025,'2025-Dec',4,338,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekday'),(7644,'2025-12-05',7644,252,'Friday','December',2025,'2025-Dec',5,339,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekday'),(7645,'2025-12-06',7645,252,'Saturday','December',2025,'2025-Dec',6,340,48,'2025-W48','2025-11-30',49,'2025-W49','2025-12-01','Non-Holiday','Weekend'),(7646,'2025-12-07',7646,252,'Sunday','December',2025,'2025-Dec',7,341,49,'2025-W49','2025-12-07',49,'2025-W49','2025-12-01','Non-Holiday','Weekend'),(7647,'2025-12-08',7647,252,'Monday','December',2025,'2025-Dec',8,342,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekday'),(7648,'2025-12-09',7648,252,'Tuesday','December',2025,'2025-Dec',9,343,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekday'),(7649,'2025-12-10',7649,252,'Wednesday','December',2025,'2025-Dec',10,344,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekday'),(7650,'2025-12-11',7650,252,'Thursday','December',2025,'2025-Dec',11,345,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekday'),(7651,'2025-12-12',7651,252,'Friday','December',2025,'2025-Dec',12,346,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekday'),(7652,'2025-12-13',7652,252,'Saturday','December',2025,'2025-Dec',13,347,49,'2025-W49','2025-12-07',50,'2025-W50','2025-12-08','Non-Holiday','Weekend'),(7653,'2025-12-14',7653,252,'Sunday','December',2025,'2025-Dec',14,348,50,'2025-W50','2025-12-14',50,'2025-W50','2025-12-08','Non-Holiday','Weekend'),(7654,'2025-12-15',7654,252,'Monday','December',2025,'2025-Dec',15,349,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekday'),(7655,'2025-12-16',7655,252,'Tuesday','December',2025,'2025-Dec',16,350,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekday'),(7656,'2025-12-17',7656,252,'Wednesday','December',2025,'2025-Dec',17,351,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekday'),(7657,'2025-12-18',7657,252,'Thursday','December',2025,'2025-Dec',18,352,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekday'),(7658,'2025-12-19',7658,252,'Friday','December',2025,'2025-Dec',19,353,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekday'),(7659,'2025-12-20',7659,252,'Saturday','December',2025,'2025-Dec',20,354,50,'2025-W50','2025-12-14',51,'2025-W51','2025-12-15','Non-Holiday','Weekend'),(7660,'2025-12-21',7660,252,'Sunday','December',2025,'2025-Dec',21,355,51,'2025-W51','2025-12-21',51,'2025-W51','2025-12-15','Non-Holiday','Weekend'),(7661,'2025-12-22',7661,252,'Monday','December',2025,'2025-Dec',22,356,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekday'),(7662,'2025-12-23',7662,252,'Tuesday','December',2025,'2025-Dec',23,357,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekday'),(7663,'2025-12-24',7663,252,'Wednesday','December',2025,'2025-Dec',24,358,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekday'),(7664,'2025-12-25',7664,252,'Thursday','December',2025,'2025-Dec',25,359,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekday'),(7665,'2025-12-26',7665,252,'Friday','December',2025,'2025-Dec',26,360,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekday'),(7666,'2025-12-27',7666,252,'Saturday','December',2025,'2025-Dec',27,361,51,'2025-W51','2025-12-21',52,'2025-W52','2025-12-22','Non-Holiday','Weekend'),(7667,'2025-12-28',7667,252,'Sunday','December',2025,'2025-Dec',28,362,52,'2025-W52','2025-12-28',52,'2025-W52','2025-12-22','Non-Holiday','Weekend'),(7668,'2025-12-29',7668,252,'Monday','December',2025,'2025-Dec',29,363,52,'2025-W52','2025-12-28',1,'2025-W01','2025-12-29','Non-Holiday','Weekday'),(7669,'2025-12-30',7669,252,'Tuesday','December',2025,'2025-Dec',30,364,52,'2025-W52','2025-12-28',1,'2025-W01','2025-12-29','Non-Holiday','Weekday'),(7670,'2025-12-31',7670,252,'Wednesday','December',2025,'2025-Dec',31,365,52,'2025-W52','2025-12-28',1,'2025-W01','2025-12-29','Non-Holiday','Weekday'),(7671,'2026-01-01',7671,253,'Thursday','January',2026,'2026-Jan',1,1,52,'2025-W52','2025-12-28',1,'2025-W01','2025-12-29','Non-Holiday','Weekday');
/*!40000 ALTER TABLE `dim_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_province`
--

DROP TABLE IF EXISTS `dim_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_province` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `expired_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_province`
--

LOCK TABLES `dim_province` WRITE;
/*!40000 ALTER TABLE `dim_province` DISABLE KEYS */;
INSERT INTO `dim_province` VALUES (1,1,'Hà Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(2,2,'Cao Bằng','2022-12-01','10:01:00','2022-12-01','10:50:00'),(3,3,'Bắc Kạn','2022-12-01','10:01:00','2026-01-01','23:59:00'),(4,4,'Tuyên Quang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(5,5,'Thái Nguyên','2022-12-01','10:01:00','2026-01-01','23:59:00'),(6,6,'Lạng Sơn','2022-12-01','10:01:00','2026-01-01','23:59:00'),(7,7,'Quảng Ninh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(8,8,'Bắc Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(9,9,'Phú Thọ','2022-12-01','10:01:00','2026-01-01','23:59:00'),(10,10,'Lào Cai','2022-12-01','10:01:00','2026-01-01','23:59:00'),(11,11,'Điện Biên','2022-12-01','10:01:00','2026-01-01','23:59:00'),(12,12,'Lai Châu','2022-12-01','10:01:00','2026-01-01','23:59:00'),(13,13,'Sơn La','2022-12-01','10:01:00','2026-01-01','23:59:00'),(14,14,'Yên Bái','2022-12-01','10:01:00','2026-01-01','23:59:00'),(15,15,'Hoà Bình','2022-12-01','10:01:00','2026-01-01','23:59:00'),(16,16,'Hà Nội','2022-12-01','10:01:00','2026-01-01','23:59:00'),(17,17,'Vĩnh Phúc','2022-12-01','10:01:00','2026-01-01','23:59:00'),(18,18,'Bắc Ninh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(19,19,'Hải Dương','2022-12-01','10:01:00','2026-01-01','23:59:00'),(20,20,'Hải Phòng','2022-12-01','10:01:00','2026-01-01','23:59:00'),(21,21,'Hưng Yên','2022-12-01','10:01:00','2026-01-01','23:59:00'),(22,22,'Thái Bình','2022-12-01','10:01:00','2026-01-01','23:59:00'),(23,23,'Hà Nam','2022-12-01','10:01:00','2026-01-01','23:59:00'),(24,24,'Nam Định','2022-12-01','10:01:00','2026-01-01','23:59:00'),(25,25,'Ninh Bình','2022-12-01','10:01:00','2026-01-01','23:59:00'),(26,26,'Thanh Hóa','2022-12-01','10:01:00','2026-01-01','23:59:00'),(27,27,'Nghệ An','2022-12-01','10:01:00','2026-01-01','23:59:00'),(28,28,'Hà Tĩnh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(29,29,'Quảng Bình','2022-12-01','10:01:00','2026-01-01','23:59:00'),(30,30,'Quảng Trị','2022-12-01','10:01:00','2026-01-01','23:59:00'),(31,31,'Thừa Thiên Huế','2022-12-01','10:01:00','2026-01-01','23:59:00'),(32,32,'Đà Nẵng','2022-12-01','10:01:00','2026-01-01','23:59:00'),(33,33,'Quảng Nam','2022-12-01','10:01:00','2026-01-01','23:59:00'),(34,34,'Quảng Ngãi','2022-12-01','10:01:00','2026-01-01','23:59:00'),(35,35,'Bình Định','2022-12-01','10:01:00','2026-01-01','23:59:00'),(36,36,'Phú Yên','2022-12-01','10:01:00','2026-01-01','23:59:00'),(37,37,'Khánh Hòa','2022-12-01','10:01:00','2026-01-01','23:59:00'),(38,38,'Ninh Thuận','2022-12-01','10:01:00','2026-01-01','23:59:00'),(39,39,'Bình Thuận','2022-12-01','10:01:00','2026-01-01','23:59:00'),(40,40,'Kon Tum','2022-12-01','10:01:00','2026-01-01','23:59:00'),(41,41,'Gia Lai','2022-12-01','10:01:00','2026-01-01','23:59:00'),(42,42,'Đắk Lắk','2022-12-01','10:01:00','2026-01-01','23:59:00'),(43,43,'Đắk Nông','2022-12-01','10:01:00','2026-01-01','23:59:00'),(44,44,'Lâm Đồng','2022-12-01','10:01:00','2026-01-01','23:59:00'),(45,45,'Bình Phước','2022-12-01','10:01:00','2026-01-01','23:59:00'),(46,46,'Tây Ninh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(47,47,'Bình Dương','2022-12-01','10:01:00','2026-01-01','23:59:00'),(48,48,'Đồng Nai','2022-12-01','10:01:00','2026-01-01','23:59:00'),(49,49,'Bà Rịa - Vũng Tàu','2022-12-01','10:01:00','2026-01-01','23:59:00'),(50,50,'Hồ Chí Minh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(51,51,'Long An','2022-12-01','10:01:00','2026-01-01','23:59:00'),(52,52,'Tiền Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(53,53,'Bến Tre','2022-12-01','10:01:00','2026-01-01','23:59:00'),(54,54,'Trà Vinh','2022-12-01','10:01:00','2026-01-01','23:59:00'),(55,55,'Vĩnh Long','2022-12-01','10:01:00','2026-01-01','23:59:00'),(56,56,'Đồng Tháp','2022-12-01','10:01:00','2026-01-01','23:59:00'),(57,57,'An Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(58,58,'Kiên Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(59,59,'Cần Thơ','2022-12-01','10:01:00','2026-01-01','23:59:00'),(60,60,'Hậu Giang','2022-12-01','10:01:00','2026-01-01','23:59:00'),(61,61,'Sóc Trăng','2022-12-01','10:01:00','2026-01-01','23:59:00'),(62,62,'Bạc Liêu','2022-12-01','10:01:00','2026-01-01','23:59:00'),(63,63,'Cà Mau','2022-12-01','10:01:00','2026-01-01','23:59:00'),(64,2,'Hà Nam','2022-12-01','10:50:00','2026-01-01','23:59:00');
/*!40000 ALTER TABLE `dim_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_time`
--

DROP TABLE IF EXISTS `dim_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_time` (
  `id` smallint NOT NULL,
  `hour_time` time DEFAULT NULL,
  `hour` tinyint DEFAULT NULL,
  `minute` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_time`
--

LOCK TABLES `dim_time` WRITE;
/*!40000 ALTER TABLE `dim_time` DISABLE KEYS */;
INSERT INTO `dim_time` VALUES (0,'00:00:00',0,0),(1,'00:01:00',0,1),(2,'00:02:00',0,2),(3,'00:03:00',0,3),(4,'00:04:00',0,4),(5,'00:05:00',0,5),(6,'00:06:00',0,6),(7,'00:07:00',0,7),(8,'00:08:00',0,8),(9,'00:09:00',0,9),(10,'00:10:00',0,10),(11,'00:11:00',0,11),(12,'00:12:00',0,12),(13,'00:13:00',0,13),(14,'00:14:00',0,14),(15,'00:15:00',0,15),(16,'00:16:00',0,16),(17,'00:17:00',0,17),(18,'00:18:00',0,18),(19,'00:19:00',0,19),(20,'00:20:00',0,20),(21,'00:21:00',0,21),(22,'00:22:00',0,22),(23,'00:23:00',0,23),(24,'00:24:00',0,24),(25,'00:25:00',0,25),(26,'00:26:00',0,26),(27,'00:27:00',0,27),(28,'00:28:00',0,28),(29,'00:29:00',0,29),(30,'00:30:00',0,30),(31,'00:31:00',0,31),(32,'00:32:00',0,32),(33,'00:33:00',0,33),(34,'00:34:00',0,34),(35,'00:35:00',0,35),(36,'00:36:00',0,36),(37,'00:37:00',0,37),(38,'00:38:00',0,38),(39,'00:39:00',0,39),(40,'00:40:00',0,40),(41,'00:41:00',0,41),(42,'00:42:00',0,42),(43,'00:43:00',0,43),(44,'00:44:00',0,44),(45,'00:45:00',0,45),(46,'00:46:00',0,46),(47,'00:47:00',0,47),(48,'00:48:00',0,48),(49,'00:49:00',0,49),(50,'00:50:00',0,50),(51,'00:51:00',0,51),(52,'00:52:00',0,52),(53,'00:53:00',0,53),(54,'00:54:00',0,54),(55,'00:55:00',0,55),(56,'00:56:00',0,56),(57,'00:57:00',0,57),(58,'00:58:00',0,58),(59,'00:59:00',0,59),(60,'01:00:00',1,0),(61,'01:01:00',1,1),(62,'01:02:00',1,2),(63,'01:03:00',1,3),(64,'01:04:00',1,4),(65,'01:05:00',1,5),(66,'01:06:00',1,6),(67,'01:07:00',1,7),(68,'01:08:00',1,8),(69,'01:09:00',1,9),(70,'01:10:00',1,10),(71,'01:11:00',1,11),(72,'01:12:00',1,12),(73,'01:13:00',1,13),(74,'01:14:00',1,14),(75,'01:15:00',1,15),(76,'01:16:00',1,16),(77,'01:17:00',1,17),(78,'01:18:00',1,18),(79,'01:19:00',1,19),(80,'01:20:00',1,20),(81,'01:21:00',1,21),(82,'01:22:00',1,22),(83,'01:23:00',1,23),(84,'01:24:00',1,24),(85,'01:25:00',1,25),(86,'01:26:00',1,26),(87,'01:27:00',1,27),(88,'01:28:00',1,28),(89,'01:29:00',1,29),(90,'01:30:00',1,30),(91,'01:31:00',1,31),(92,'01:32:00',1,32),(93,'01:33:00',1,33),(94,'01:34:00',1,34),(95,'01:35:00',1,35),(96,'01:36:00',1,36),(97,'01:37:00',1,37),(98,'01:38:00',1,38),(99,'01:39:00',1,39),(100,'01:40:00',1,40),(101,'01:41:00',1,41),(102,'01:42:00',1,42),(103,'01:43:00',1,43),(104,'01:44:00',1,44),(105,'01:45:00',1,45),(106,'01:46:00',1,46),(107,'01:47:00',1,47),(108,'01:48:00',1,48),(109,'01:49:00',1,49),(110,'01:50:00',1,50),(111,'01:51:00',1,51),(112,'01:52:00',1,52),(113,'01:53:00',1,53),(114,'01:54:00',1,54),(115,'01:55:00',1,55),(116,'01:56:00',1,56),(117,'01:57:00',1,57),(118,'01:58:00',1,58),(119,'01:59:00',1,59),(120,'02:00:00',2,0),(121,'02:01:00',2,1),(122,'02:02:00',2,2),(123,'02:03:00',2,3),(124,'02:04:00',2,4),(125,'02:05:00',2,5),(126,'02:06:00',2,6),(127,'02:07:00',2,7),(128,'02:08:00',2,8),(129,'02:09:00',2,9),(130,'02:10:00',2,10),(131,'02:11:00',2,11),(132,'02:12:00',2,12),(133,'02:13:00',2,13),(134,'02:14:00',2,14),(135,'02:15:00',2,15),(136,'02:16:00',2,16),(137,'02:17:00',2,17),(138,'02:18:00',2,18),(139,'02:19:00',2,19),(140,'02:20:00',2,20),(141,'02:21:00',2,21),(142,'02:22:00',2,22),(143,'02:23:00',2,23),(144,'02:24:00',2,24),(145,'02:25:00',2,25),(146,'02:26:00',2,26),(147,'02:27:00',2,27),(148,'02:28:00',2,28),(149,'02:29:00',2,29),(150,'02:30:00',2,30),(151,'02:31:00',2,31),(152,'02:32:00',2,32),(153,'02:33:00',2,33),(154,'02:34:00',2,34),(155,'02:35:00',2,35),(156,'02:36:00',2,36),(157,'02:37:00',2,37),(158,'02:38:00',2,38),(159,'02:39:00',2,39),(160,'02:40:00',2,40),(161,'02:41:00',2,41),(162,'02:42:00',2,42),(163,'02:43:00',2,43),(164,'02:44:00',2,44),(165,'02:45:00',2,45),(166,'02:46:00',2,46),(167,'02:47:00',2,47),(168,'02:48:00',2,48),(169,'02:49:00',2,49),(170,'02:50:00',2,50),(171,'02:51:00',2,51),(172,'02:52:00',2,52),(173,'02:53:00',2,53),(174,'02:54:00',2,54),(175,'02:55:00',2,55),(176,'02:56:00',2,56),(177,'02:57:00',2,57),(178,'02:58:00',2,58),(179,'02:59:00',2,59),(180,'03:00:00',3,0),(181,'03:01:00',3,1),(182,'03:02:00',3,2),(183,'03:03:00',3,3),(184,'03:04:00',3,4),(185,'03:05:00',3,5),(186,'03:06:00',3,6),(187,'03:07:00',3,7),(188,'03:08:00',3,8),(189,'03:09:00',3,9),(190,'03:10:00',3,10),(191,'03:11:00',3,11),(192,'03:12:00',3,12),(193,'03:13:00',3,13),(194,'03:14:00',3,14),(195,'03:15:00',3,15),(196,'03:16:00',3,16),(197,'03:17:00',3,17),(198,'03:18:00',3,18),(199,'03:19:00',3,19),(200,'03:20:00',3,20),(201,'03:21:00',3,21),(202,'03:22:00',3,22),(203,'03:23:00',3,23),(204,'03:24:00',3,24),(205,'03:25:00',3,25),(206,'03:26:00',3,26),(207,'03:27:00',3,27),(208,'03:28:00',3,28),(209,'03:29:00',3,29),(210,'03:30:00',3,30),(211,'03:31:00',3,31),(212,'03:32:00',3,32),(213,'03:33:00',3,33),(214,'03:34:00',3,34),(215,'03:35:00',3,35),(216,'03:36:00',3,36),(217,'03:37:00',3,37),(218,'03:38:00',3,38),(219,'03:39:00',3,39),(220,'03:40:00',3,40),(221,'03:41:00',3,41),(222,'03:42:00',3,42),(223,'03:43:00',3,43),(224,'03:44:00',3,44),(225,'03:45:00',3,45),(226,'03:46:00',3,46),(227,'03:47:00',3,47),(228,'03:48:00',3,48),(229,'03:49:00',3,49),(230,'03:50:00',3,50),(231,'03:51:00',3,51),(232,'03:52:00',3,52),(233,'03:53:00',3,53),(234,'03:54:00',3,54),(235,'03:55:00',3,55),(236,'03:56:00',3,56),(237,'03:57:00',3,57),(238,'03:58:00',3,58),(239,'03:59:00',3,59),(240,'04:00:00',4,0),(241,'04:01:00',4,1),(242,'04:02:00',4,2),(243,'04:03:00',4,3),(244,'04:04:00',4,4),(245,'04:05:00',4,5),(246,'04:06:00',4,6),(247,'04:07:00',4,7),(248,'04:08:00',4,8),(249,'04:09:00',4,9),(250,'04:10:00',4,10),(251,'04:11:00',4,11),(252,'04:12:00',4,12),(253,'04:13:00',4,13),(254,'04:14:00',4,14),(255,'04:15:00',4,15),(256,'04:16:00',4,16),(257,'04:17:00',4,17),(258,'04:18:00',4,18),(259,'04:19:00',4,19),(260,'04:20:00',4,20),(261,'04:21:00',4,21),(262,'04:22:00',4,22),(263,'04:23:00',4,23),(264,'04:24:00',4,24),(265,'04:25:00',4,25),(266,'04:26:00',4,26),(267,'04:27:00',4,27),(268,'04:28:00',4,28),(269,'04:29:00',4,29),(270,'04:30:00',4,30),(271,'04:31:00',4,31),(272,'04:32:00',4,32),(273,'04:33:00',4,33),(274,'04:34:00',4,34),(275,'04:35:00',4,35),(276,'04:36:00',4,36),(277,'04:37:00',4,37),(278,'04:38:00',4,38),(279,'04:39:00',4,39),(280,'04:40:00',4,40),(281,'04:41:00',4,41),(282,'04:42:00',4,42),(283,'04:43:00',4,43),(284,'04:44:00',4,44),(285,'04:45:00',4,45),(286,'04:46:00',4,46),(287,'04:47:00',4,47),(288,'04:48:00',4,48),(289,'04:49:00',4,49),(290,'04:50:00',4,50),(291,'04:51:00',4,51),(292,'04:52:00',4,52),(293,'04:53:00',4,53),(294,'04:54:00',4,54),(295,'04:55:00',4,55),(296,'04:56:00',4,56),(297,'04:57:00',4,57),(298,'04:58:00',4,58),(299,'04:59:00',4,59),(300,'05:00:00',5,0),(301,'05:01:00',5,1),(302,'05:02:00',5,2),(303,'05:03:00',5,3),(304,'05:04:00',5,4),(305,'05:05:00',5,5),(306,'05:06:00',5,6),(307,'05:07:00',5,7),(308,'05:08:00',5,8),(309,'05:09:00',5,9),(310,'05:10:00',5,10),(311,'05:11:00',5,11),(312,'05:12:00',5,12),(313,'05:13:00',5,13),(314,'05:14:00',5,14),(315,'05:15:00',5,15),(316,'05:16:00',5,16),(317,'05:17:00',5,17),(318,'05:18:00',5,18),(319,'05:19:00',5,19),(320,'05:20:00',5,20),(321,'05:21:00',5,21),(322,'05:22:00',5,22),(323,'05:23:00',5,23),(324,'05:24:00',5,24),(325,'05:25:00',5,25),(326,'05:26:00',5,26),(327,'05:27:00',5,27),(328,'05:28:00',5,28),(329,'05:29:00',5,29),(330,'05:30:00',5,30),(331,'05:31:00',5,31),(332,'05:32:00',5,32),(333,'05:33:00',5,33),(334,'05:34:00',5,34),(335,'05:35:00',5,35),(336,'05:36:00',5,36),(337,'05:37:00',5,37),(338,'05:38:00',5,38),(339,'05:39:00',5,39),(340,'05:40:00',5,40),(341,'05:41:00',5,41),(342,'05:42:00',5,42),(343,'05:43:00',5,43),(344,'05:44:00',5,44),(345,'05:45:00',5,45),(346,'05:46:00',5,46),(347,'05:47:00',5,47),(348,'05:48:00',5,48),(349,'05:49:00',5,49),(350,'05:50:00',5,50),(351,'05:51:00',5,51),(352,'05:52:00',5,52),(353,'05:53:00',5,53),(354,'05:54:00',5,54),(355,'05:55:00',5,55),(356,'05:56:00',5,56),(357,'05:57:00',5,57),(358,'05:58:00',5,58),(359,'05:59:00',5,59),(360,'06:00:00',6,0),(361,'06:01:00',6,1),(362,'06:02:00',6,2),(363,'06:03:00',6,3),(364,'06:04:00',6,4),(365,'06:05:00',6,5),(366,'06:06:00',6,6),(367,'06:07:00',6,7),(368,'06:08:00',6,8),(369,'06:09:00',6,9),(370,'06:10:00',6,10),(371,'06:11:00',6,11),(372,'06:12:00',6,12),(373,'06:13:00',6,13),(374,'06:14:00',6,14),(375,'06:15:00',6,15),(376,'06:16:00',6,16),(377,'06:17:00',6,17),(378,'06:18:00',6,18),(379,'06:19:00',6,19),(380,'06:20:00',6,20),(381,'06:21:00',6,21),(382,'06:22:00',6,22),(383,'06:23:00',6,23),(384,'06:24:00',6,24),(385,'06:25:00',6,25),(386,'06:26:00',6,26),(387,'06:27:00',6,27),(388,'06:28:00',6,28),(389,'06:29:00',6,29),(390,'06:30:00',6,30),(391,'06:31:00',6,31),(392,'06:32:00',6,32),(393,'06:33:00',6,33),(394,'06:34:00',6,34),(395,'06:35:00',6,35),(396,'06:36:00',6,36),(397,'06:37:00',6,37),(398,'06:38:00',6,38),(399,'06:39:00',6,39),(400,'06:40:00',6,40),(401,'06:41:00',6,41),(402,'06:42:00',6,42),(403,'06:43:00',6,43),(404,'06:44:00',6,44),(405,'06:45:00',6,45),(406,'06:46:00',6,46),(407,'06:47:00',6,47),(408,'06:48:00',6,48),(409,'06:49:00',6,49),(410,'06:50:00',6,50),(411,'06:51:00',6,51),(412,'06:52:00',6,52),(413,'06:53:00',6,53),(414,'06:54:00',6,54),(415,'06:55:00',6,55),(416,'06:56:00',6,56),(417,'06:57:00',6,57),(418,'06:58:00',6,58),(419,'06:59:00',6,59),(420,'07:00:00',7,0),(421,'07:01:00',7,1),(422,'07:02:00',7,2),(423,'07:03:00',7,3),(424,'07:04:00',7,4),(425,'07:05:00',7,5),(426,'07:06:00',7,6),(427,'07:07:00',7,7),(428,'07:08:00',7,8),(429,'07:09:00',7,9),(430,'07:10:00',7,10),(431,'07:11:00',7,11),(432,'07:12:00',7,12),(433,'07:13:00',7,13),(434,'07:14:00',7,14),(435,'07:15:00',7,15),(436,'07:16:00',7,16),(437,'07:17:00',7,17),(438,'07:18:00',7,18),(439,'07:19:00',7,19),(440,'07:20:00',7,20),(441,'07:21:00',7,21),(442,'07:22:00',7,22),(443,'07:23:00',7,23),(444,'07:24:00',7,24),(445,'07:25:00',7,25),(446,'07:26:00',7,26),(447,'07:27:00',7,27),(448,'07:28:00',7,28),(449,'07:29:00',7,29),(450,'07:30:00',7,30),(451,'07:31:00',7,31),(452,'07:32:00',7,32),(453,'07:33:00',7,33),(454,'07:34:00',7,34),(455,'07:35:00',7,35),(456,'07:36:00',7,36),(457,'07:37:00',7,37),(458,'07:38:00',7,38),(459,'07:39:00',7,39),(460,'07:40:00',7,40),(461,'07:41:00',7,41),(462,'07:42:00',7,42),(463,'07:43:00',7,43),(464,'07:44:00',7,44),(465,'07:45:00',7,45),(466,'07:46:00',7,46),(467,'07:47:00',7,47),(468,'07:48:00',7,48),(469,'07:49:00',7,49),(470,'07:50:00',7,50),(471,'07:51:00',7,51),(472,'07:52:00',7,52),(473,'07:53:00',7,53),(474,'07:54:00',7,54),(475,'07:55:00',7,55),(476,'07:56:00',7,56),(477,'07:57:00',7,57),(478,'07:58:00',7,58),(479,'07:59:00',7,59),(480,'08:00:00',8,0),(481,'08:01:00',8,1),(482,'08:02:00',8,2),(483,'08:03:00',8,3),(484,'08:04:00',8,4),(485,'08:05:00',8,5),(486,'08:06:00',8,6),(487,'08:07:00',8,7),(488,'08:08:00',8,8),(489,'08:09:00',8,9),(490,'08:10:00',8,10),(491,'08:11:00',8,11),(492,'08:12:00',8,12),(493,'08:13:00',8,13),(494,'08:14:00',8,14),(495,'08:15:00',8,15),(496,'08:16:00',8,16),(497,'08:17:00',8,17),(498,'08:18:00',8,18),(499,'08:19:00',8,19),(500,'08:20:00',8,20),(501,'08:21:00',8,21),(502,'08:22:00',8,22),(503,'08:23:00',8,23),(504,'08:24:00',8,24),(505,'08:25:00',8,25),(506,'08:26:00',8,26),(507,'08:27:00',8,27),(508,'08:28:00',8,28),(509,'08:29:00',8,29),(510,'08:30:00',8,30),(511,'08:31:00',8,31),(512,'08:32:00',8,32),(513,'08:33:00',8,33),(514,'08:34:00',8,34),(515,'08:35:00',8,35),(516,'08:36:00',8,36),(517,'08:37:00',8,37),(518,'08:38:00',8,38),(519,'08:39:00',8,39),(520,'08:40:00',8,40),(521,'08:41:00',8,41),(522,'08:42:00',8,42),(523,'08:43:00',8,43),(524,'08:44:00',8,44),(525,'08:45:00',8,45),(526,'08:46:00',8,46),(527,'08:47:00',8,47),(528,'08:48:00',8,48),(529,'08:49:00',8,49),(530,'08:50:00',8,50),(531,'08:51:00',8,51),(532,'08:52:00',8,52),(533,'08:53:00',8,53),(534,'08:54:00',8,54),(535,'08:55:00',8,55),(536,'08:56:00',8,56),(537,'08:57:00',8,57),(538,'08:58:00',8,58),(539,'08:59:00',8,59),(540,'09:00:00',9,0),(541,'09:01:00',9,1),(542,'09:02:00',9,2),(543,'09:03:00',9,3),(544,'09:04:00',9,4),(545,'09:05:00',9,5),(546,'09:06:00',9,6),(547,'09:07:00',9,7),(548,'09:08:00',9,8),(549,'09:09:00',9,9),(550,'09:10:00',9,10),(551,'09:11:00',9,11),(552,'09:12:00',9,12),(553,'09:13:00',9,13),(554,'09:14:00',9,14),(555,'09:15:00',9,15),(556,'09:16:00',9,16),(557,'09:17:00',9,17),(558,'09:18:00',9,18),(559,'09:19:00',9,19),(560,'09:20:00',9,20),(561,'09:21:00',9,21),(562,'09:22:00',9,22),(563,'09:23:00',9,23),(564,'09:24:00',9,24),(565,'09:25:00',9,25),(566,'09:26:00',9,26),(567,'09:27:00',9,27),(568,'09:28:00',9,28),(569,'09:29:00',9,29),(570,'09:30:00',9,30),(571,'09:31:00',9,31),(572,'09:32:00',9,32),(573,'09:33:00',9,33),(574,'09:34:00',9,34),(575,'09:35:00',9,35),(576,'09:36:00',9,36),(577,'09:37:00',9,37),(578,'09:38:00',9,38),(579,'09:39:00',9,39),(580,'09:40:00',9,40),(581,'09:41:00',9,41),(582,'09:42:00',9,42),(583,'09:43:00',9,43),(584,'09:44:00',9,44),(585,'09:45:00',9,45),(586,'09:46:00',9,46),(587,'09:47:00',9,47),(588,'09:48:00',9,48),(589,'09:49:00',9,49),(590,'09:50:00',9,50),(591,'09:51:00',9,51),(592,'09:52:00',9,52),(593,'09:53:00',9,53),(594,'09:54:00',9,54),(595,'09:55:00',9,55),(596,'09:56:00',9,56),(597,'09:57:00',9,57),(598,'09:58:00',9,58),(599,'09:59:00',9,59),(600,'10:00:00',10,0),(601,'10:01:00',10,1),(602,'10:02:00',10,2),(603,'10:03:00',10,3),(604,'10:04:00',10,4),(605,'10:05:00',10,5),(606,'10:06:00',10,6),(607,'10:07:00',10,7),(608,'10:08:00',10,8),(609,'10:09:00',10,9),(610,'10:10:00',10,10),(611,'10:11:00',10,11),(612,'10:12:00',10,12),(613,'10:13:00',10,13),(614,'10:14:00',10,14),(615,'10:15:00',10,15),(616,'10:16:00',10,16),(617,'10:17:00',10,17),(618,'10:18:00',10,18),(619,'10:19:00',10,19),(620,'10:20:00',10,20),(621,'10:21:00',10,21),(622,'10:22:00',10,22),(623,'10:23:00',10,23),(624,'10:24:00',10,24),(625,'10:25:00',10,25),(626,'10:26:00',10,26),(627,'10:27:00',10,27),(628,'10:28:00',10,28),(629,'10:29:00',10,29),(630,'10:30:00',10,30),(631,'10:31:00',10,31),(632,'10:32:00',10,32),(633,'10:33:00',10,33),(634,'10:34:00',10,34),(635,'10:35:00',10,35),(636,'10:36:00',10,36),(637,'10:37:00',10,37),(638,'10:38:00',10,38),(639,'10:39:00',10,39),(640,'10:40:00',10,40),(641,'10:41:00',10,41),(642,'10:42:00',10,42),(643,'10:43:00',10,43),(644,'10:44:00',10,44),(645,'10:45:00',10,45),(646,'10:46:00',10,46),(647,'10:47:00',10,47),(648,'10:48:00',10,48),(649,'10:49:00',10,49),(650,'10:50:00',10,50),(651,'10:51:00',10,51),(652,'10:52:00',10,52),(653,'10:53:00',10,53),(654,'10:54:00',10,54),(655,'10:55:00',10,55),(656,'10:56:00',10,56),(657,'10:57:00',10,57),(658,'10:58:00',10,58),(659,'10:59:00',10,59),(660,'11:00:00',11,0),(661,'11:01:00',11,1),(662,'11:02:00',11,2),(663,'11:03:00',11,3),(664,'11:04:00',11,4),(665,'11:05:00',11,5),(666,'11:06:00',11,6),(667,'11:07:00',11,7),(668,'11:08:00',11,8),(669,'11:09:00',11,9),(670,'11:10:00',11,10),(671,'11:11:00',11,11),(672,'11:12:00',11,12),(673,'11:13:00',11,13),(674,'11:14:00',11,14),(675,'11:15:00',11,15),(676,'11:16:00',11,16),(677,'11:17:00',11,17),(678,'11:18:00',11,18),(679,'11:19:00',11,19),(680,'11:20:00',11,20),(681,'11:21:00',11,21),(682,'11:22:00',11,22),(683,'11:23:00',11,23),(684,'11:24:00',11,24),(685,'11:25:00',11,25),(686,'11:26:00',11,26),(687,'11:27:00',11,27),(688,'11:28:00',11,28),(689,'11:29:00',11,29),(690,'11:30:00',11,30),(691,'11:31:00',11,31),(692,'11:32:00',11,32),(693,'11:33:00',11,33),(694,'11:34:00',11,34),(695,'11:35:00',11,35),(696,'11:36:00',11,36),(697,'11:37:00',11,37),(698,'11:38:00',11,38),(699,'11:39:00',11,39),(700,'11:40:00',11,40),(701,'11:41:00',11,41),(702,'11:42:00',11,42),(703,'11:43:00',11,43),(704,'11:44:00',11,44),(705,'11:45:00',11,45),(706,'11:46:00',11,46),(707,'11:47:00',11,47),(708,'11:48:00',11,48),(709,'11:49:00',11,49),(710,'11:50:00',11,50),(711,'11:51:00',11,51),(712,'11:52:00',11,52),(713,'11:53:00',11,53),(714,'11:54:00',11,54),(715,'11:55:00',11,55),(716,'11:56:00',11,56),(717,'11:57:00',11,57),(718,'11:58:00',11,58),(719,'11:59:00',11,59),(720,'12:00:00',12,0),(721,'12:01:00',12,1),(722,'12:02:00',12,2),(723,'12:03:00',12,3),(724,'12:04:00',12,4),(725,'12:05:00',12,5),(726,'12:06:00',12,6),(727,'12:07:00',12,7),(728,'12:08:00',12,8),(729,'12:09:00',12,9),(730,'12:10:00',12,10),(731,'12:11:00',12,11),(732,'12:12:00',12,12),(733,'12:13:00',12,13),(734,'12:14:00',12,14),(735,'12:15:00',12,15),(736,'12:16:00',12,16),(737,'12:17:00',12,17),(738,'12:18:00',12,18),(739,'12:19:00',12,19),(740,'12:20:00',12,20),(741,'12:21:00',12,21),(742,'12:22:00',12,22),(743,'12:23:00',12,23),(744,'12:24:00',12,24),(745,'12:25:00',12,25),(746,'12:26:00',12,26),(747,'12:27:00',12,27),(748,'12:28:00',12,28),(749,'12:29:00',12,29),(750,'12:30:00',12,30),(751,'12:31:00',12,31),(752,'12:32:00',12,32),(753,'12:33:00',12,33),(754,'12:34:00',12,34),(755,'12:35:00',12,35),(756,'12:36:00',12,36),(757,'12:37:00',12,37),(758,'12:38:00',12,38),(759,'12:39:00',12,39),(760,'12:40:00',12,40),(761,'12:41:00',12,41),(762,'12:42:00',12,42),(763,'12:43:00',12,43),(764,'12:44:00',12,44),(765,'12:45:00',12,45),(766,'12:46:00',12,46),(767,'12:47:00',12,47),(768,'12:48:00',12,48),(769,'12:49:00',12,49),(770,'12:50:00',12,50),(771,'12:51:00',12,51),(772,'12:52:00',12,52),(773,'12:53:00',12,53),(774,'12:54:00',12,54),(775,'12:55:00',12,55),(776,'12:56:00',12,56),(777,'12:57:00',12,57),(778,'12:58:00',12,58),(779,'12:59:00',12,59),(780,'13:00:00',13,0),(781,'13:01:00',13,1),(782,'13:02:00',13,2),(783,'13:03:00',13,3),(784,'13:04:00',13,4),(785,'13:05:00',13,5),(786,'13:06:00',13,6),(787,'13:07:00',13,7),(788,'13:08:00',13,8),(789,'13:09:00',13,9),(790,'13:10:00',13,10),(791,'13:11:00',13,11),(792,'13:12:00',13,12),(793,'13:13:00',13,13),(794,'13:14:00',13,14),(795,'13:15:00',13,15),(796,'13:16:00',13,16),(797,'13:17:00',13,17),(798,'13:18:00',13,18),(799,'13:19:00',13,19),(800,'13:20:00',13,20),(801,'13:21:00',13,21),(802,'13:22:00',13,22),(803,'13:23:00',13,23),(804,'13:24:00',13,24),(805,'13:25:00',13,25),(806,'13:26:00',13,26),(807,'13:27:00',13,27),(808,'13:28:00',13,28),(809,'13:29:00',13,29),(810,'13:30:00',13,30),(811,'13:31:00',13,31),(812,'13:32:00',13,32),(813,'13:33:00',13,33),(814,'13:34:00',13,34),(815,'13:35:00',13,35),(816,'13:36:00',13,36),(817,'13:37:00',13,37),(818,'13:38:00',13,38),(819,'13:39:00',13,39),(820,'13:40:00',13,40),(821,'13:41:00',13,41),(822,'13:42:00',13,42),(823,'13:43:00',13,43),(824,'13:44:00',13,44),(825,'13:45:00',13,45),(826,'13:46:00',13,46),(827,'13:47:00',13,47),(828,'13:48:00',13,48),(829,'13:49:00',13,49),(830,'13:50:00',13,50),(831,'13:51:00',13,51),(832,'13:52:00',13,52),(833,'13:53:00',13,53),(834,'13:54:00',13,54),(835,'13:55:00',13,55),(836,'13:56:00',13,56),(837,'13:57:00',13,57),(838,'13:58:00',13,58),(839,'13:59:00',13,59),(840,'14:00:00',14,0),(841,'14:01:00',14,1),(842,'14:02:00',14,2),(843,'14:03:00',14,3),(844,'14:04:00',14,4),(845,'14:05:00',14,5),(846,'14:06:00',14,6),(847,'14:07:00',14,7),(848,'14:08:00',14,8),(849,'14:09:00',14,9),(850,'14:10:00',14,10),(851,'14:11:00',14,11),(852,'14:12:00',14,12),(853,'14:13:00',14,13),(854,'14:14:00',14,14),(855,'14:15:00',14,15),(856,'14:16:00',14,16),(857,'14:17:00',14,17),(858,'14:18:00',14,18),(859,'14:19:00',14,19),(860,'14:20:00',14,20),(861,'14:21:00',14,21),(862,'14:22:00',14,22),(863,'14:23:00',14,23),(864,'14:24:00',14,24),(865,'14:25:00',14,25),(866,'14:26:00',14,26),(867,'14:27:00',14,27),(868,'14:28:00',14,28),(869,'14:29:00',14,29),(870,'14:30:00',14,30),(871,'14:31:00',14,31),(872,'14:32:00',14,32),(873,'14:33:00',14,33),(874,'14:34:00',14,34),(875,'14:35:00',14,35),(876,'14:36:00',14,36),(877,'14:37:00',14,37),(878,'14:38:00',14,38),(879,'14:39:00',14,39),(880,'14:40:00',14,40),(881,'14:41:00',14,41),(882,'14:42:00',14,42),(883,'14:43:00',14,43),(884,'14:44:00',14,44),(885,'14:45:00',14,45),(886,'14:46:00',14,46),(887,'14:47:00',14,47),(888,'14:48:00',14,48),(889,'14:49:00',14,49),(890,'14:50:00',14,50),(891,'14:51:00',14,51),(892,'14:52:00',14,52),(893,'14:53:00',14,53),(894,'14:54:00',14,54),(895,'14:55:00',14,55),(896,'14:56:00',14,56),(897,'14:57:00',14,57),(898,'14:58:00',14,58),(899,'14:59:00',14,59),(900,'15:00:00',15,0),(901,'15:01:00',15,1),(902,'15:02:00',15,2),(903,'15:03:00',15,3),(904,'15:04:00',15,4),(905,'15:05:00',15,5),(906,'15:06:00',15,6),(907,'15:07:00',15,7),(908,'15:08:00',15,8),(909,'15:09:00',15,9),(910,'15:10:00',15,10),(911,'15:11:00',15,11),(912,'15:12:00',15,12),(913,'15:13:00',15,13),(914,'15:14:00',15,14),(915,'15:15:00',15,15),(916,'15:16:00',15,16),(917,'15:17:00',15,17),(918,'15:18:00',15,18),(919,'15:19:00',15,19),(920,'15:20:00',15,20),(921,'15:21:00',15,21),(922,'15:22:00',15,22),(923,'15:23:00',15,23),(924,'15:24:00',15,24),(925,'15:25:00',15,25),(926,'15:26:00',15,26),(927,'15:27:00',15,27),(928,'15:28:00',15,28),(929,'15:29:00',15,29),(930,'15:30:00',15,30),(931,'15:31:00',15,31),(932,'15:32:00',15,32),(933,'15:33:00',15,33),(934,'15:34:00',15,34),(935,'15:35:00',15,35),(936,'15:36:00',15,36),(937,'15:37:00',15,37),(938,'15:38:00',15,38),(939,'15:39:00',15,39),(940,'15:40:00',15,40),(941,'15:41:00',15,41),(942,'15:42:00',15,42),(943,'15:43:00',15,43),(944,'15:44:00',15,44),(945,'15:45:00',15,45),(946,'15:46:00',15,46),(947,'15:47:00',15,47),(948,'15:48:00',15,48),(949,'15:49:00',15,49),(950,'15:50:00',15,50),(951,'15:51:00',15,51),(952,'15:52:00',15,52),(953,'15:53:00',15,53),(954,'15:54:00',15,54),(955,'15:55:00',15,55),(956,'15:56:00',15,56),(957,'15:57:00',15,57),(958,'15:58:00',15,58),(959,'15:59:00',15,59),(960,'16:00:00',16,0),(961,'16:01:00',16,1),(962,'16:02:00',16,2),(963,'16:03:00',16,3),(964,'16:04:00',16,4),(965,'16:05:00',16,5),(966,'16:06:00',16,6),(967,'16:07:00',16,7),(968,'16:08:00',16,8),(969,'16:09:00',16,9),(970,'16:10:00',16,10),(971,'16:11:00',16,11),(972,'16:12:00',16,12),(973,'16:13:00',16,13),(974,'16:14:00',16,14),(975,'16:15:00',16,15),(976,'16:16:00',16,16),(977,'16:17:00',16,17),(978,'16:18:00',16,18),(979,'16:19:00',16,19),(980,'16:20:00',16,20),(981,'16:21:00',16,21),(982,'16:22:00',16,22),(983,'16:23:00',16,23),(984,'16:24:00',16,24),(985,'16:25:00',16,25),(986,'16:26:00',16,26),(987,'16:27:00',16,27),(988,'16:28:00',16,28),(989,'16:29:00',16,29),(990,'16:30:00',16,30),(991,'16:31:00',16,31),(992,'16:32:00',16,32),(993,'16:33:00',16,33),(994,'16:34:00',16,34),(995,'16:35:00',16,35),(996,'16:36:00',16,36),(997,'16:37:00',16,37),(998,'16:38:00',16,38),(999,'16:39:00',16,39),(1000,'16:40:00',16,40),(1001,'16:41:00',16,41),(1002,'16:42:00',16,42),(1003,'16:43:00',16,43),(1004,'16:44:00',16,44),(1005,'16:45:00',16,45),(1006,'16:46:00',16,46),(1007,'16:47:00',16,47),(1008,'16:48:00',16,48),(1009,'16:49:00',16,49),(1010,'16:50:00',16,50),(1011,'16:51:00',16,51),(1012,'16:52:00',16,52),(1013,'16:53:00',16,53),(1014,'16:54:00',16,54),(1015,'16:55:00',16,55),(1016,'16:56:00',16,56),(1017,'16:57:00',16,57),(1018,'16:58:00',16,58),(1019,'16:59:00',16,59),(1020,'17:00:00',17,0),(1021,'17:01:00',17,1),(1022,'17:02:00',17,2),(1023,'17:03:00',17,3),(1024,'17:04:00',17,4),(1025,'17:05:00',17,5),(1026,'17:06:00',17,6),(1027,'17:07:00',17,7),(1028,'17:08:00',17,8),(1029,'17:09:00',17,9),(1030,'17:10:00',17,10),(1031,'17:11:00',17,11),(1032,'17:12:00',17,12),(1033,'17:13:00',17,13),(1034,'17:14:00',17,14),(1035,'17:15:00',17,15),(1036,'17:16:00',17,16),(1037,'17:17:00',17,17),(1038,'17:18:00',17,18),(1039,'17:19:00',17,19),(1040,'17:20:00',17,20),(1041,'17:21:00',17,21),(1042,'17:22:00',17,22),(1043,'17:23:00',17,23),(1044,'17:24:00',17,24),(1045,'17:25:00',17,25),(1046,'17:26:00',17,26),(1047,'17:27:00',17,27),(1048,'17:28:00',17,28),(1049,'17:29:00',17,29),(1050,'17:30:00',17,30),(1051,'17:31:00',17,31),(1052,'17:32:00',17,32),(1053,'17:33:00',17,33),(1054,'17:34:00',17,34),(1055,'17:35:00',17,35),(1056,'17:36:00',17,36),(1057,'17:37:00',17,37),(1058,'17:38:00',17,38),(1059,'17:39:00',17,39),(1060,'17:40:00',17,40),(1061,'17:41:00',17,41),(1062,'17:42:00',17,42),(1063,'17:43:00',17,43),(1064,'17:44:00',17,44),(1065,'17:45:00',17,45),(1066,'17:46:00',17,46),(1067,'17:47:00',17,47),(1068,'17:48:00',17,48),(1069,'17:49:00',17,49),(1070,'17:50:00',17,50),(1071,'17:51:00',17,51),(1072,'17:52:00',17,52),(1073,'17:53:00',17,53),(1074,'17:54:00',17,54),(1075,'17:55:00',17,55),(1076,'17:56:00',17,56),(1077,'17:57:00',17,57),(1078,'17:58:00',17,58),(1079,'17:59:00',17,59),(1080,'18:00:00',18,0),(1081,'18:01:00',18,1),(1082,'18:02:00',18,2),(1083,'18:03:00',18,3),(1084,'18:04:00',18,4),(1085,'18:05:00',18,5),(1086,'18:06:00',18,6),(1087,'18:07:00',18,7),(1088,'18:08:00',18,8),(1089,'18:09:00',18,9),(1090,'18:10:00',18,10),(1091,'18:11:00',18,11),(1092,'18:12:00',18,12),(1093,'18:13:00',18,13),(1094,'18:14:00',18,14),(1095,'18:15:00',18,15),(1096,'18:16:00',18,16),(1097,'18:17:00',18,17),(1098,'18:18:00',18,18),(1099,'18:19:00',18,19),(1100,'18:20:00',18,20),(1101,'18:21:00',18,21),(1102,'18:22:00',18,22),(1103,'18:23:00',18,23),(1104,'18:24:00',18,24),(1105,'18:25:00',18,25),(1106,'18:26:00',18,26),(1107,'18:27:00',18,27),(1108,'18:28:00',18,28),(1109,'18:29:00',18,29),(1110,'18:30:00',18,30),(1111,'18:31:00',18,31),(1112,'18:32:00',18,32),(1113,'18:33:00',18,33),(1114,'18:34:00',18,34),(1115,'18:35:00',18,35),(1116,'18:36:00',18,36),(1117,'18:37:00',18,37),(1118,'18:38:00',18,38),(1119,'18:39:00',18,39),(1120,'18:40:00',18,40),(1121,'18:41:00',18,41),(1122,'18:42:00',18,42),(1123,'18:43:00',18,43),(1124,'18:44:00',18,44),(1125,'18:45:00',18,45),(1126,'18:46:00',18,46),(1127,'18:47:00',18,47),(1128,'18:48:00',18,48),(1129,'18:49:00',18,49),(1130,'18:50:00',18,50),(1131,'18:51:00',18,51),(1132,'18:52:00',18,52),(1133,'18:53:00',18,53),(1134,'18:54:00',18,54),(1135,'18:55:00',18,55),(1136,'18:56:00',18,56),(1137,'18:57:00',18,57),(1138,'18:58:00',18,58),(1139,'18:59:00',18,59),(1140,'19:00:00',19,0),(1141,'19:01:00',19,1),(1142,'19:02:00',19,2),(1143,'19:03:00',19,3),(1144,'19:04:00',19,4),(1145,'19:05:00',19,5),(1146,'19:06:00',19,6),(1147,'19:07:00',19,7),(1148,'19:08:00',19,8),(1149,'19:09:00',19,9),(1150,'19:10:00',19,10),(1151,'19:11:00',19,11),(1152,'19:12:00',19,12),(1153,'19:13:00',19,13),(1154,'19:14:00',19,14),(1155,'19:15:00',19,15),(1156,'19:16:00',19,16),(1157,'19:17:00',19,17),(1158,'19:18:00',19,18),(1159,'19:19:00',19,19),(1160,'19:20:00',19,20),(1161,'19:21:00',19,21),(1162,'19:22:00',19,22),(1163,'19:23:00',19,23),(1164,'19:24:00',19,24),(1165,'19:25:00',19,25),(1166,'19:26:00',19,26),(1167,'19:27:00',19,27),(1168,'19:28:00',19,28),(1169,'19:29:00',19,29),(1170,'19:30:00',19,30),(1171,'19:31:00',19,31),(1172,'19:32:00',19,32),(1173,'19:33:00',19,33),(1174,'19:34:00',19,34),(1175,'19:35:00',19,35),(1176,'19:36:00',19,36),(1177,'19:37:00',19,37),(1178,'19:38:00',19,38),(1179,'19:39:00',19,39),(1180,'19:40:00',19,40),(1181,'19:41:00',19,41),(1182,'19:42:00',19,42),(1183,'19:43:00',19,43),(1184,'19:44:00',19,44),(1185,'19:45:00',19,45),(1186,'19:46:00',19,46),(1187,'19:47:00',19,47),(1188,'19:48:00',19,48),(1189,'19:49:00',19,49),(1190,'19:50:00',19,50),(1191,'19:51:00',19,51),(1192,'19:52:00',19,52),(1193,'19:53:00',19,53),(1194,'19:54:00',19,54),(1195,'19:55:00',19,55),(1196,'19:56:00',19,56),(1197,'19:57:00',19,57),(1198,'19:58:00',19,58),(1199,'19:59:00',19,59),(1200,'20:00:00',20,0),(1201,'20:01:00',20,1),(1202,'20:02:00',20,2),(1203,'20:03:00',20,3),(1204,'20:04:00',20,4),(1205,'20:05:00',20,5),(1206,'20:06:00',20,6),(1207,'20:07:00',20,7),(1208,'20:08:00',20,8),(1209,'20:09:00',20,9),(1210,'20:10:00',20,10),(1211,'20:11:00',20,11),(1212,'20:12:00',20,12),(1213,'20:13:00',20,13),(1214,'20:14:00',20,14),(1215,'20:15:00',20,15),(1216,'20:16:00',20,16),(1217,'20:17:00',20,17),(1218,'20:18:00',20,18),(1219,'20:19:00',20,19),(1220,'20:20:00',20,20),(1221,'20:21:00',20,21),(1222,'20:22:00',20,22),(1223,'20:23:00',20,23),(1224,'20:24:00',20,24),(1225,'20:25:00',20,25),(1226,'20:26:00',20,26),(1227,'20:27:00',20,27),(1228,'20:28:00',20,28),(1229,'20:29:00',20,29),(1230,'20:30:00',20,30),(1231,'20:31:00',20,31),(1232,'20:32:00',20,32),(1233,'20:33:00',20,33),(1234,'20:34:00',20,34),(1235,'20:35:00',20,35),(1236,'20:36:00',20,36),(1237,'20:37:00',20,37),(1238,'20:38:00',20,38),(1239,'20:39:00',20,39),(1240,'20:40:00',20,40),(1241,'20:41:00',20,41),(1242,'20:42:00',20,42),(1243,'20:43:00',20,43),(1244,'20:44:00',20,44),(1245,'20:45:00',20,45),(1246,'20:46:00',20,46),(1247,'20:47:00',20,47),(1248,'20:48:00',20,48),(1249,'20:49:00',20,49),(1250,'20:50:00',20,50),(1251,'20:51:00',20,51),(1252,'20:52:00',20,52),(1253,'20:53:00',20,53),(1254,'20:54:00',20,54),(1255,'20:55:00',20,55),(1256,'20:56:00',20,56),(1257,'20:57:00',20,57),(1258,'20:58:00',20,58),(1259,'20:59:00',20,59),(1260,'21:00:00',21,0),(1261,'21:01:00',21,1),(1262,'21:02:00',21,2),(1263,'21:03:00',21,3),(1264,'21:04:00',21,4),(1265,'21:05:00',21,5),(1266,'21:06:00',21,6),(1267,'21:07:00',21,7),(1268,'21:08:00',21,8),(1269,'21:09:00',21,9),(1270,'21:10:00',21,10),(1271,'21:11:00',21,11),(1272,'21:12:00',21,12),(1273,'21:13:00',21,13),(1274,'21:14:00',21,14),(1275,'21:15:00',21,15),(1276,'21:16:00',21,16),(1277,'21:17:00',21,17),(1278,'21:18:00',21,18),(1279,'21:19:00',21,19),(1280,'21:20:00',21,20),(1281,'21:21:00',21,21),(1282,'21:22:00',21,22),(1283,'21:23:00',21,23),(1284,'21:24:00',21,24),(1285,'21:25:00',21,25),(1286,'21:26:00',21,26),(1287,'21:27:00',21,27),(1288,'21:28:00',21,28),(1289,'21:29:00',21,29),(1290,'21:30:00',21,30),(1291,'21:31:00',21,31),(1292,'21:32:00',21,32),(1293,'21:33:00',21,33),(1294,'21:34:00',21,34),(1295,'21:35:00',21,35),(1296,'21:36:00',21,36),(1297,'21:37:00',21,37),(1298,'21:38:00',21,38),(1299,'21:39:00',21,39),(1300,'21:40:00',21,40),(1301,'21:41:00',21,41),(1302,'21:42:00',21,42),(1303,'21:43:00',21,43),(1304,'21:44:00',21,44),(1305,'21:45:00',21,45),(1306,'21:46:00',21,46),(1307,'21:47:00',21,47),(1308,'21:48:00',21,48),(1309,'21:49:00',21,49),(1310,'21:50:00',21,50),(1311,'21:51:00',21,51),(1312,'21:52:00',21,52),(1313,'21:53:00',21,53),(1314,'21:54:00',21,54),(1315,'21:55:00',21,55),(1316,'21:56:00',21,56),(1317,'21:57:00',21,57),(1318,'21:58:00',21,58),(1319,'21:59:00',21,59),(1320,'22:00:00',22,0),(1321,'22:01:00',22,1),(1322,'22:02:00',22,2),(1323,'22:03:00',22,3),(1324,'22:04:00',22,4),(1325,'22:05:00',22,5),(1326,'22:06:00',22,6),(1327,'22:07:00',22,7),(1328,'22:08:00',22,8),(1329,'22:09:00',22,9),(1330,'22:10:00',22,10),(1331,'22:11:00',22,11),(1332,'22:12:00',22,12),(1333,'22:13:00',22,13),(1334,'22:14:00',22,14),(1335,'22:15:00',22,15),(1336,'22:16:00',22,16),(1337,'22:17:00',22,17),(1338,'22:18:00',22,18),(1339,'22:19:00',22,19),(1340,'22:20:00',22,20),(1341,'22:21:00',22,21),(1342,'22:22:00',22,22),(1343,'22:23:00',22,23),(1344,'22:24:00',22,24),(1345,'22:25:00',22,25),(1346,'22:26:00',22,26),(1347,'22:27:00',22,27),(1348,'22:28:00',22,28),(1349,'22:29:00',22,29),(1350,'22:30:00',22,30),(1351,'22:31:00',22,31),(1352,'22:32:00',22,32),(1353,'22:33:00',22,33),(1354,'22:34:00',22,34),(1355,'22:35:00',22,35),(1356,'22:36:00',22,36),(1357,'22:37:00',22,37),(1358,'22:38:00',22,38),(1359,'22:39:00',22,39),(1360,'22:40:00',22,40),(1361,'22:41:00',22,41),(1362,'22:42:00',22,42),(1363,'22:43:00',22,43),(1364,'22:44:00',22,44),(1365,'22:45:00',22,45),(1366,'22:46:00',22,46),(1367,'22:47:00',22,47),(1368,'22:48:00',22,48),(1369,'22:49:00',22,49),(1370,'22:50:00',22,50),(1371,'22:51:00',22,51),(1372,'22:52:00',22,52),(1373,'22:53:00',22,53),(1374,'22:54:00',22,54),(1375,'22:55:00',22,55),(1376,'22:56:00',22,56),(1377,'22:57:00',22,57),(1378,'22:58:00',22,58),(1379,'22:59:00',22,59),(1380,'23:00:00',23,0),(1381,'23:01:00',23,1),(1382,'23:02:00',23,2),(1383,'23:03:00',23,3),(1384,'23:04:00',23,4),(1385,'23:05:00',23,5),(1386,'23:06:00',23,6),(1387,'23:07:00',23,7),(1388,'23:08:00',23,8),(1389,'23:09:00',23,9),(1390,'23:10:00',23,10),(1391,'23:11:00',23,11),(1392,'23:12:00',23,12),(1393,'23:13:00',23,13),(1394,'23:14:00',23,14),(1395,'23:15:00',23,15),(1396,'23:16:00',23,16),(1397,'23:17:00',23,17),(1398,'23:18:00',23,18),(1399,'23:19:00',23,19),(1400,'23:20:00',23,20),(1401,'23:21:00',23,21),(1402,'23:22:00',23,22),(1403,'23:23:00',23,23),(1404,'23:24:00',23,24),(1405,'23:25:00',23,25),(1406,'23:26:00',23,26),(1407,'23:27:00',23,27),(1408,'23:28:00',23,28),(1409,'23:29:00',23,29),(1410,'23:30:00',23,30),(1411,'23:31:00',23,31),(1412,'23:32:00',23,32),(1413,'23:33:00',23,33),(1414,'23:34:00',23,34),(1415,'23:35:00',23,35),(1416,'23:36:00',23,36),(1417,'23:37:00',23,37),(1418,'23:38:00',23,38),(1419,'23:39:00',23,39),(1420,'23:40:00',23,40),(1421,'23:41:00',23,41),(1422,'23:42:00',23,42),(1423,'23:43:00',23,43),(1424,'23:44:00',23,44),(1425,'23:45:00',23,45),(1426,'23:46:00',23,46),(1427,'23:47:00',23,47),(1428,'23:48:00',23,48),(1429,'23:49:00',23,49),(1430,'23:50:00',23,50),(1431,'23:51:00',23,51),(1432,'23:52:00',23,52),(1433,'23:53:00',23,53),(1434,'23:54:00',23,54),(1435,'23:55:00',23,55),(1436,'23:56:00',23,56),(1437,'23:57:00',23,57),(1438,'23:58:00',23,58),(1439,'23:59:00',23,59);
/*!40000 ALTER TABLE `dim_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_weather`
--

DROP TABLE IF EXISTS `fact_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_weather` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_province` int DEFAULT NULL,
  `id_time` smallint DEFAULT NULL,
  `id_date` int DEFAULT NULL,
  `id_staging_fact` int DEFAULT NULL,
  `temperature` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `humidity` tinyint DEFAULT NULL,
  `vision` tinyint DEFAULT NULL,
  `wind` float DEFAULT NULL,
  `uv_index` float DEFAULT NULL,
  `air_quality` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `expired_date` int DEFAULT NULL,
  `expired_time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_date` (`id_date`),
  KEY `fk_time` (`id_time`),
  KEY `fk_province_idx` (`id_province`),
  CONSTRAINT `fk_date` FOREIGN KEY (`id_date`) REFERENCES `dim_date` (`id`),
  CONSTRAINT `fk_province` FOREIGN KEY (`id_province`) REFERENCES `dim_province` (`id`),
  CONSTRAINT `fk_time` FOREIGN KEY (`id_time`) REFERENCES `dim_time` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_weather`
--

LOCK TABLES `fact_weather` WRITE;
/*!40000 ALTER TABLE `fact_weather` DISABLE KEYS */;
INSERT INTO `fact_weather` VALUES (1,1,601,6544,1,17,'Nhiều mây',98,10,1.19,0,'Khá',6544,601),(2,2,601,6544,2,12,'Nhiều mây',94,10,1.17,0,'Khá',6544,601),(3,3,601,6544,3,12,'Nhiều mây',96,10,1.98,0.34,'Khá',6544,601),(4,4,601,6544,4,15,'Nhiều mây',95,10,1.07,0,'Khá',6544,601),(5,5,601,6544,5,15,'Nhiều mây',88,10,3.09,0.55,'Khá',6544,601),(6,6,601,6544,6,10,'Nhiều mây',90,10,3.6,0,'Khá',6544,601),(7,7,601,6544,7,15,'Nhiều mây',90,10,1.65,1.04,'Tốt',6544,601),(8,8,601,6544,8,14,'Nhiều mây',79,10,5.66,0,'Khá',6544,601),(9,9,601,6544,9,16,'Nhiều mây',88,10,0.78,0,'Khá',6544,601),(10,10,601,6544,10,20,'Nhiều mây',98,1,1.46,0,'Khá',6544,601),(11,11,601,6544,11,22,'Nhiều mây',93,10,0.83,0,'Tốt',6544,601),(12,12,601,6544,12,24,'Nhiều mây',85,9,1.4,0,'Tốt',6544,601),(13,13,601,6544,13,22,'Nhiều mây',90,10,2.17,0,'Khá',6544,601),(14,14,601,6544,14,17,'Nhiều mây',91,10,1.61,0,'Khá',6544,601),(15,15,601,6544,15,17,'Nhiều mây',95,10,1.62,0.27,'Kém',6544,601),(16,16,601,6544,16,15,'Nhiều mây',82,10,6.17,0.75,'Khá',6544,601),(17,17,601,6544,17,15,'Nhiều mây',84,10,2.77,0.75,'Khá',6544,601),(18,18,601,6544,18,15,'Nhiều mây',80,10,5.79,0.44,'Khá',6544,601),(19,19,601,6544,19,17,'Nhiều mây',79,10,4.36,0,'Khá',6544,601),(20,20,601,6544,20,17,'Nhiều mây',82,10,3.6,0,'Khá',6544,601),(21,21,601,6544,21,16,'Nhiều mây',85,10,3.8,0.54,'Trung bình',6544,601),(22,22,601,6544,22,18,'Nhiều mây',86,10,3.91,0.5,'Khá',6544,601),(23,23,601,6544,23,16,'Nhiều mây',87,10,3.75,0,'Trung bình',6544,601),(24,24,601,6544,24,17,'Nhiều mây',86,10,3.7,0,'Trung bình',6544,601),(25,25,601,6544,25,17,'Nhiều mây',89,10,3.95,0,'Trung bình',6544,601),(26,26,601,6544,26,20,'Nhiều mây',92,10,5.12,0,'Trung bình',6544,601),(27,27,601,6544,27,24,'Nhiều mây',88,10,7.62,0,'Kém',6544,601),(28,28,601,6544,28,26,'Mây cụm',83,9,4.44,1.09,'Kém',6544,601),(29,29,601,6544,29,26,'Mây cụm',80,10,2.79,0,'Kém',6544,601),(30,30,601,6544,30,27,'Nhiều mây',75,10,3.91,0,'Trung bình',6544,601),(31,31,601,6544,31,28,'Mây cụm',83,10,2.06,0,'Kém',6544,601),(32,32,601,6544,32,29,'Mây rải rác',74,10,3.09,0,'Trung bình',6544,601),(33,33,601,6544,33,27,'Mây rải rác',74,10,1.69,0,'Trung bình',6544,601),(34,34,601,6544,34,27,'Mây rải rác',76,10,2.95,0,'Tốt',6544,601),(35,35,601,6544,35,27,'Nhiều mây',84,10,6.23,0,'Tốt',6544,601),(36,36,601,6544,36,26,'Mây cụm',80,10,3.72,0,'Tốt',6544,601),(37,37,601,6544,37,29,'Nhiều mây',70,10,3.04,0,'Tốt',6544,601),(38,38,601,6544,38,29,'Mây cụm',70,10,5.44,0,'Tốt',6544,601),(39,39,601,6544,39,29,'Nhiều mây',54,10,2.03,0,'Tốt',6544,601),(40,40,601,6544,40,28,'Mây cụm',54,10,3.68,6.4,'Tốt',6544,601),(41,41,601,6544,41,25,'Mây cụm',76,10,3.93,0,'Tốt',6544,601),(42,42,601,6544,42,26,'Mây cụm',63,10,4.56,0,'Tốt',6544,601),(43,43,601,6544,43,26,'Mây cụm',63,10,4.56,0,'Tốt',6544,601),(44,44,601,6544,44,27,'Nhiều mây',49,10,2.15,0,'Tốt',6544,601),(45,45,601,6544,45,29,'Nhiều mây',57,10,2.06,0,'Tốt',6544,601),(46,46,601,6544,46,29,'Nhiều mây',72,10,2.44,5.96,'Khá',6544,601),(47,47,601,6544,47,30,'Mây rải rác',79,6,1.03,6.47,'Trung bình',6544,601),(48,48,601,6544,48,29,'Nhiều mây',70,10,2.14,6.47,'Khá',6544,601),(49,49,601,6544,49,30,'Nhiều mây',62,10,0.71,5.86,'Trung bình',6544,601),(50,50,601,6544,50,30,'Mây rải rác',79,6,1.03,0,'Rất kém',6544,601),(51,51,601,6544,51,29,'Nhiều mây',71,10,3.1,6.23,'Rất kém',6544,601),(52,52,601,6544,52,30,'Mây cụm',68,10,2.39,0,'Rất kém',6544,601),(53,53,601,6544,53,30,'Mây cụm',67,10,2.15,0,'Rất kém',6544,601),(54,54,601,6544,54,30,'Nhiều mây',70,10,2.65,0,'Rất kém',6544,601),(55,55,601,6544,55,29,'Nhiều mây',71,10,3.14,6.02,'Rất kém',6544,601),(56,56,601,6544,56,29,'Nhiều mây',70,10,3.26,0,'Rất kém',6544,601),(57,57,601,6544,57,29,'Nhiều mây',68,10,3.08,0,'Rất kém',6544,601),(58,58,601,6544,58,28,'Nhiều mây',77,8,3.07,0,'Kém',6544,601),(59,59,601,6544,59,29,'Mây thưa',84,10,1.54,0,'Rất kém',6544,601),(60,60,601,6544,60,28,'Nhiều mây',78,9,3.88,0,'Kém',6544,601),(61,61,601,6544,61,28,'Nhiều mây',76,10,4.34,0,'Kém',6544,601),(62,62,601,6544,62,29,'Nhiều mây',73,10,7.18,5.65,'Khá',6544,601),(63,63,601,6544,63,29,'Nhiều mây',71,10,4.9,0,'Tốt',6544,601),(64,1,601,6544,1,17,'Nhiều mây',98,10,1.19,0,'Khá',6544,650),(65,2,601,6544,2,12,'Nhiều mây',94,10,1.17,0,'Khá',6544,650),(66,3,601,6544,3,12,'Nhiều mây',96,10,1.98,0.34,'Khá',6544,650),(67,4,601,6544,4,15,'Nhiều mây',95,10,1.07,0,'Khá',6544,650),(68,5,601,6544,5,15,'Nhiều mây',88,10,3.09,0.55,'Khá',6544,650),(69,6,601,6544,6,10,'Nhiều mây',90,10,3.6,0,'Khá',6544,650),(70,7,601,6544,7,15,'Nhiều mây',90,10,1.65,1.04,'Tốt',6544,650),(71,8,601,6544,8,14,'Nhiều mây',79,10,5.66,0,'Khá',6544,650),(72,9,601,6544,9,16,'Nhiều mây',88,10,0.78,0,'Khá',6544,650),(73,10,601,6544,10,20,'Nhiều mây',98,1,1.46,0,'Khá',6544,650),(74,11,601,6544,11,22,'Nhiều mây',93,10,0.83,0,'Tốt',6544,650),(75,12,601,6544,12,24,'Nhiều mây',85,9,1.4,0,'Tốt',6544,650),(76,13,601,6544,13,22,'Nhiều mây',90,10,2.17,0,'Khá',6544,650),(77,14,601,6544,14,17,'Nhiều mây',91,10,1.61,0,'Khá',6544,650),(78,15,601,6544,15,17,'Nhiều mây',95,10,1.62,0.27,'Kém',6544,650),(79,16,601,6544,16,15,'Nhiều mây',82,10,6.17,0.75,'Khá',6544,650),(80,17,601,6544,17,15,'Nhiều mây',84,10,2.77,0.75,'Khá',6544,650),(81,18,601,6544,18,15,'Nhiều mây',80,10,5.79,0.44,'Khá',6544,650),(82,19,601,6544,19,17,'Nhiều mây',79,10,4.36,0,'Khá',6544,650),(83,20,601,6544,20,17,'Nhiều mây',82,10,3.6,0,'Khá',6544,650),(84,21,601,6544,21,16,'Nhiều mây',85,10,3.8,0.54,'Trung bình',6544,650),(85,22,601,6544,22,18,'Nhiều mây',86,10,3.91,0.5,'Khá',6544,650),(86,23,601,6544,23,16,'Nhiều mây',87,10,3.75,0,'Trung bình',6544,650),(87,24,601,6544,24,17,'Nhiều mây',86,10,3.7,0,'Trung bình',6544,650),(88,25,601,6544,25,17,'Nhiều mây',89,10,3.95,0,'Trung bình',6544,650),(89,26,601,6544,26,20,'Nhiều mây',92,10,5.12,0,'Trung bình',6544,650),(90,27,601,6544,27,24,'Nhiều mây',88,10,7.62,0,'Kém',6544,650),(91,28,601,6544,28,26,'Mây cụm',83,9,4.44,1.09,'Kém',6544,650),(92,29,601,6544,29,26,'Mây cụm',80,10,2.79,0,'Kém',6544,650),(93,30,601,6544,30,27,'Nhiều mây',75,10,3.91,0,'Trung bình',6544,650),(94,31,601,6544,31,28,'Mây cụm',83,10,2.06,0,'Kém',6544,650),(95,32,601,6544,32,29,'Mây rải rác',74,10,3.09,0,'Trung bình',6544,650),(96,33,601,6544,33,27,'Mây rải rác',74,10,1.69,0,'Trung bình',6544,650),(97,34,601,6544,34,27,'Mây rải rác',76,10,2.95,0,'Tốt',6544,650),(98,35,601,6544,35,27,'Nhiều mây',84,10,6.23,0,'Tốt',6544,650),(99,36,601,6544,36,26,'Mây cụm',80,10,3.72,0,'Tốt',6544,650),(100,37,601,6544,37,29,'Nhiều mây',70,10,3.04,0,'Tốt',6544,650),(101,38,601,6544,38,29,'Mây cụm',70,10,5.44,0,'Tốt',6544,650),(102,39,601,6544,39,29,'Nhiều mây',54,10,2.03,0,'Tốt',6544,650),(103,40,601,6544,40,28,'Mây cụm',54,10,3.68,6.4,'Tốt',6544,650),(104,41,601,6544,41,25,'Mây cụm',76,10,3.93,0,'Tốt',6544,650),(105,42,601,6544,42,26,'Mây cụm',63,10,4.56,0,'Tốt',6544,650),(106,43,601,6544,43,26,'Mây cụm',63,10,4.56,0,'Tốt',6544,650),(107,44,601,6544,44,27,'Nhiều mây',49,10,2.15,0,'Tốt',6544,650),(108,45,601,6544,45,29,'Nhiều mây',57,10,2.06,0,'Tốt',6544,650),(109,46,601,6544,46,29,'Nhiều mây',72,10,2.44,5.96,'Khá',6544,650),(110,47,601,6544,47,30,'Mây rải rác',79,6,1.03,6.47,'Trung bình',6544,650),(111,48,601,6544,48,29,'Nhiều mây',70,10,2.14,6.47,'Khá',6544,650),(112,49,601,6544,49,30,'Nhiều mây',62,10,0.71,5.86,'Trung bình',6544,650),(113,50,601,6544,50,30,'Mây rải rác',79,6,1.03,0,'Rất kém',6544,650),(114,51,601,6544,51,29,'Nhiều mây',71,10,3.1,6.23,'Rất kém',6544,650),(115,52,601,6544,52,30,'Mây cụm',68,10,2.39,0,'Rất kém',6544,650),(116,53,601,6544,53,30,'Mây cụm',67,10,2.15,0,'Rất kém',6544,650),(117,54,601,6544,54,30,'Nhiều mây',70,10,2.65,0,'Rất kém',6544,650),(118,55,601,6544,55,29,'Nhiều mây',71,10,3.14,6.02,'Rất kém',6544,650),(119,56,601,6544,56,29,'Nhiều mây',70,10,3.26,0,'Rất kém',6544,650),(120,57,601,6544,57,29,'Nhiều mây',68,10,3.08,0,'Rất kém',6544,650),(121,58,601,6544,58,28,'Nhiều mây',77,8,3.07,0,'Kém',6544,650),(122,59,601,6544,59,29,'Mây thưa',84,10,1.54,0,'Rất kém',6544,650),(123,60,601,6544,60,28,'Nhiều mây',78,9,3.88,0,'Kém',6544,650),(124,61,601,6544,61,28,'Nhiều mây',76,10,4.34,0,'Kém',6544,650),(125,62,601,6544,62,29,'Nhiều mây',73,10,7.18,5.65,'Khá',6544,650),(126,63,601,6544,63,29,'Nhiều mây',71,10,4.9,0,'Tốt',6544,650),(127,1,650,6544,1,17,'Nhiều mây',98,10,1.18,0.4,'Tốt',6544,650),(128,2,650,6544,2,15,'Nhiều mây',86,10,3.98,0.49,'Trung bình',6544,650),(129,2,650,6544,3,12,'Nhiều mây',92,10,1.12,0,'Tốt',6544,650),(130,3,650,6544,4,12,'Nhiều mây',96,10,1.87,0.8,'Khá',6544,650),(131,4,650,6544,5,15,'Nhiều mây',94,10,1.06,0,'Khá',6544,650),(132,5,650,6544,6,13,'Nhiều mây',88,10,2.92,0,'Khá',6544,650),(133,6,650,6544,7,9,'Nhiều mây',89,10,3.51,0,'Tốt',6544,650),(134,7,650,6544,8,15,'Nhiều mây',88,10,1.69,0,'Tốt',6544,650),(135,8,650,6544,9,15,'Nhiều mây',79,10,5.63,0.49,'Khá',6544,650),(136,9,650,6544,10,16,'Nhiều mây',88,10,0.81,0.36,'Khá',6544,650),(137,10,650,6544,11,20,'Nhiều mây',98,4,1.42,2.94,'Khá',6544,650),(138,11,650,6544,12,23,'Nhiều mây',89,10,0.7,2.65,'Tốt',6544,650),(139,12,650,6544,13,24,'Nhiều mây',89,10,1.4,4.92,'Khá',6544,650),(140,13,650,6544,14,23,'Nhiều mây',82,10,2.35,0,'Khá',6544,650),(141,14,650,6544,15,16,'Nhiều mây',92,10,1.69,0,'Khá',6544,650),(142,15,650,6544,16,17,'Nhiều mây',95,10,1.66,0,'Trung bình',6544,650),(143,16,650,6544,17,15,'Nhiều mây',82,10,6.69,0,'Khá',6544,650),(144,17,650,6544,18,15,'Nhiều mây',84,10,2.59,0.52,'Khá',6544,650),(145,18,650,6544,19,15,'Nhiều mây',80,10,5.89,0.44,'Khá',6544,650),(146,19,650,6544,20,18,'Nhiều mây',79,10,4.52,0.61,'Khá',6544,650),(147,20,650,6544,21,18,'Nhiều mây',72,10,4.12,0.71,'Khá',6544,650),(148,21,650,6544,22,16,'Nhiều mây',84,10,4.04,0,'Khá',6544,650),(149,22,650,6544,23,18,'Nhiều mây',84,10,4.04,1.14,'Khá',6544,650),(150,23,650,6544,24,15,'Nhiều mây',86,10,3.98,0.49,'Trung bình',6544,650),(151,23,650,6544,25,12,'Nhiều mây',92,10,1.12,0,'Tốt',6544,650),(152,24,650,6544,26,17,'Nhiều mây',85,10,4.07,1.14,'Khá',6544,650),(153,25,650,6544,27,17,'Nhiều mây',88,10,4.19,0,'Trung bình',6544,650),(154,26,650,6544,28,20,'Nhiều mây',92,10,4.84,0.47,'Khá',6544,650),(155,27,650,6544,29,24,'Nhiều mây',89,10,7.45,0.52,'Trung bình',6544,650),(156,28,650,6544,30,26,'Mây cụm',82,10,4.3,1.43,'Kém',6544,650),(157,29,650,6544,31,27,'Mây cụm',77,10,3.39,4.83,'Kém',6544,650),(158,30,650,6544,32,28,'Mây cụm',74,10,4.75,5.42,'Khá',6544,650),(159,31,650,6544,33,28,'Nhiều mây',72,10,3.43,7.19,'Khá',6544,650),(160,32,650,6544,34,29,'Mây thưa',74,10,3.09,0,'Trung bình',6544,650),(161,33,650,6544,35,28,'Mây cụm',72,10,2.42,0,'Khá',6544,650),(162,34,650,6544,36,28,'Mây rải rác',74,10,3.19,0,'Tốt',6544,650),(163,35,650,6544,37,27,'Nhiều mây',83,10,6.33,0,'Tốt',6544,650),(164,36,650,6544,38,26,'Mây cụm',77,10,4.01,0,'Tốt',6544,650),(165,37,650,6544,39,29,'Mây cụm',66,10,3.7,0,'Tốt',6544,650),(166,38,650,6544,40,29,'Mây cụm',68,10,6.19,0,'Tốt',6544,650),(167,39,650,6544,41,30,'Nhiều mây',51,10,2.47,8.41,'Tốt',6544,650),(168,40,650,6544,42,29,'Mây cụm',49,10,4,8.43,'Tốt',6544,650),(169,41,650,6544,43,26,'Mây cụm',72,10,4.61,5.99,'Tốt',6544,650),(170,42,650,6544,44,27,'Mây cụm',59,10,4.64,8.32,'Tốt',6544,650),(171,43,650,6544,45,27,'Mây cụm',59,10,4.64,8.32,'Tốt',6544,650),(172,44,650,6544,46,28,'Nhiều mây',45,10,2.4,6.32,'Tốt',6544,650),(173,45,650,6544,47,31,'Nhiều mây',50,10,1.92,0,'Tốt',6544,650),(174,46,650,6544,48,30,'Nhiều mây',67,10,2.47,8.52,'Tốt',6544,650),(175,47,650,6544,49,31,'Mây rải rác',74,6,1.03,8.77,'Khá',6544,650),(176,48,650,6544,50,30,'Nhiều mây',66,10,1.67,0,'Khá',6544,650),(177,49,650,6544,51,31,'Nhiều mây',56,10,1.52,0,'Khá',6544,650),(178,50,650,6544,52,31,'Mây rải rác',74,6,1.03,8.77,'Kém',6544,650),(179,51,650,6544,53,30,'Mây cụm',66,10,2.92,0,'Kém',6544,650),(180,52,650,6544,54,31,'Mây cụm',63,10,2.29,8.01,'Rất kém',6544,650),(181,53,650,6544,55,31,'Mây cụm',62,10,2.15,8.01,'Rất kém',6544,650),(182,54,650,6544,56,31,'Nhiều mây',62,10,2.58,0,'Rất kém',6544,650),(183,55,650,6544,57,29,'Nhiều mây',65,10,3.04,0,'Rất kém',6544,650),(184,56,650,6544,58,30,'Nhiều mây',65,10,3.02,0,'Rất kém',6544,650),(185,57,650,6544,59,30,'Nhiều mây',64,10,2.89,0,'Rất kém',6544,650),(186,58,650,6544,60,28,'Nhiều mây',76,7,3.1,6.11,'Kém',6544,650),(187,59,650,6544,61,29,'Mây rải rác',84,8,2.57,0,'Rất kém',6544,650),(188,60,650,6544,62,29,'Nhiều mây',77,10,3.9,0,'Kém',6544,650),(189,61,650,6544,63,29,'Nhiều mây',74,10,3.69,0,'Kém',6544,650),(190,62,650,6544,64,29,'Nhiều mây',71,10,6.57,8.43,'Khá',6544,650),(191,63,650,6544,65,30,'Nhiều mây',67,10,4.47,6.07,'Khá',6544,650),(254,1,650,6544,1,17,'Nhiều mây',98,10,1.18,0.4,'Tốt',7671,1439),(255,2,650,6544,2,15,'Nhiều mây',86,10,3.98,0.49,'Trung bình',7671,1439),(256,2,650,6544,3,12,'Nhiều mây',92,10,1.12,0,'Tốt',7671,1439),(257,3,650,6544,4,12,'Nhiều mây',96,10,1.87,0.8,'Khá',7671,1439),(258,4,650,6544,5,15,'Nhiều mây',94,10,1.06,0,'Khá',7671,1439),(259,5,650,6544,6,13,'Nhiều mây',88,10,2.92,0,'Khá',7671,1439),(260,6,650,6544,7,9,'Nhiều mây',89,10,3.51,0,'Tốt',7671,1439),(261,7,650,6544,8,15,'Nhiều mây',88,10,1.69,0,'Tốt',7671,1439),(262,8,650,6544,9,15,'Nhiều mây',79,10,5.63,0.49,'Khá',7671,1439),(263,9,650,6544,10,16,'Nhiều mây',88,10,0.81,0.36,'Khá',7671,1439),(264,10,650,6544,11,20,'Nhiều mây',98,4,1.42,2.94,'Khá',7671,1439),(265,11,650,6544,12,23,'Nhiều mây',89,10,0.7,2.65,'Tốt',7671,1439),(266,12,650,6544,13,24,'Nhiều mây',89,10,1.4,4.92,'Khá',7671,1439),(267,13,650,6544,14,23,'Nhiều mây',82,10,2.35,0,'Khá',7671,1439),(268,14,650,6544,15,16,'Nhiều mây',92,10,1.69,0,'Khá',7671,1439),(269,15,650,6544,16,17,'Nhiều mây',95,10,1.66,0,'Trung bình',7671,1439),(270,16,650,6544,17,15,'Nhiều mây',82,10,6.69,0,'Khá',7671,1439),(271,17,650,6544,18,15,'Nhiều mây',84,10,2.59,0.52,'Khá',7671,1439),(272,18,650,6544,19,15,'Nhiều mây',80,10,5.89,0.44,'Khá',7671,1439),(273,19,650,6544,20,18,'Nhiều mây',79,10,4.52,0.61,'Khá',7671,1439),(274,20,650,6544,21,18,'Nhiều mây',72,10,4.12,0.71,'Khá',7671,1439),(275,21,650,6544,22,16,'Nhiều mây',84,10,4.04,0,'Khá',7671,1439),(276,22,650,6544,23,18,'Nhiều mây',84,10,4.04,1.14,'Khá',7671,1439),(277,23,650,6544,24,15,'Nhiều mây',86,10,3.98,0.49,'Trung bình',7671,1439),(278,23,650,6544,25,12,'Nhiều mây',92,10,1.12,0,'Tốt',7671,1439),(279,24,650,6544,26,17,'Nhiều mây',85,10,4.07,1.14,'Khá',7671,1439),(280,25,650,6544,27,17,'Nhiều mây',88,10,4.19,0,'Trung bình',7671,1439),(281,26,650,6544,28,20,'Nhiều mây',92,10,4.84,0.47,'Khá',7671,1439),(282,27,650,6544,29,24,'Nhiều mây',89,10,7.45,0.52,'Trung bình',7671,1439),(283,28,650,6544,30,26,'Mây cụm',82,10,4.3,1.43,'Kém',7671,1439),(284,29,650,6544,31,27,'Mây cụm',77,10,3.39,4.83,'Kém',7671,1439),(285,30,650,6544,32,28,'Mây cụm',74,10,4.75,5.42,'Khá',7671,1439),(286,31,650,6544,33,28,'Nhiều mây',72,10,3.43,7.19,'Khá',7671,1439),(287,32,650,6544,34,29,'Mây thưa',74,10,3.09,0,'Trung bình',7671,1439),(288,33,650,6544,35,28,'Mây cụm',72,10,2.42,0,'Khá',7671,1439),(289,34,650,6544,36,28,'Mây rải rác',74,10,3.19,0,'Tốt',7671,1439),(290,35,650,6544,37,27,'Nhiều mây',83,10,6.33,0,'Tốt',7671,1439),(291,36,650,6544,38,26,'Mây cụm',77,10,4.01,0,'Tốt',7671,1439),(292,37,650,6544,39,29,'Mây cụm',66,10,3.7,0,'Tốt',7671,1439),(293,38,650,6544,40,29,'Mây cụm',68,10,6.19,0,'Tốt',7671,1439),(294,39,650,6544,41,30,'Nhiều mây',51,10,2.47,8.41,'Tốt',7671,1439),(295,40,650,6544,42,29,'Mây cụm',49,10,4,8.43,'Tốt',7671,1439),(296,41,650,6544,43,26,'Mây cụm',72,10,4.61,5.99,'Tốt',7671,1439),(297,42,650,6544,44,27,'Mây cụm',59,10,4.64,8.32,'Tốt',7671,1439),(298,43,650,6544,45,27,'Mây cụm',59,10,4.64,8.32,'Tốt',7671,1439),(299,44,650,6544,46,28,'Nhiều mây',45,10,2.4,6.32,'Tốt',7671,1439),(300,45,650,6544,47,31,'Nhiều mây',50,10,1.92,0,'Tốt',7671,1439),(301,46,650,6544,48,30,'Nhiều mây',67,10,2.47,8.52,'Tốt',7671,1439),(302,47,650,6544,49,31,'Mây rải rác',74,6,1.03,8.77,'Khá',7671,1439),(303,48,650,6544,50,30,'Nhiều mây',66,10,1.67,0,'Khá',7671,1439),(304,49,650,6544,51,31,'Nhiều mây',56,10,1.52,0,'Khá',7671,1439),(305,50,650,6544,52,31,'Mây rải rác',74,6,1.03,8.77,'Kém',7671,1439),(306,51,650,6544,53,30,'Mây cụm',66,10,2.92,0,'Kém',7671,1439),(307,52,650,6544,54,31,'Mây cụm',63,10,2.29,8.01,'Rất kém',7671,1439),(308,53,650,6544,55,31,'Mây cụm',62,10,2.15,8.01,'Rất kém',7671,1439),(309,54,650,6544,56,31,'Nhiều mây',62,10,2.58,0,'Rất kém',7671,1439),(310,55,650,6544,57,29,'Nhiều mây',65,10,3.04,0,'Rất kém',7671,1439),(311,56,650,6544,58,30,'Nhiều mây',65,10,3.02,0,'Rất kém',7671,1439),(312,57,650,6544,59,30,'Nhiều mây',64,10,2.89,0,'Rất kém',7671,1439),(313,58,650,6544,60,28,'Nhiều mây',76,7,3.1,6.11,'Kém',7671,1439),(314,59,650,6544,61,29,'Mây rải rác',84,8,2.57,0,'Rất kém',7671,1439),(315,60,650,6544,62,29,'Nhiều mây',77,10,3.9,0,'Kém',7671,1439),(316,61,650,6544,63,29,'Nhiều mây',74,10,3.69,0,'Kém',7671,1439),(317,62,650,6544,64,29,'Nhiều mây',71,10,6.57,8.43,'Khá',7671,1439),(318,63,650,6544,65,30,'Nhiều mây',67,10,4.47,6.07,'Khá',7671,1439);
/*!40000 ALTER TABLE `fact_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'data_warehouse'
--

--
-- Dumping routines for database 'data_warehouse'
--
/*!50003 DROP PROCEDURE IF EXISTS `load_dw_dim_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_dw_dim_date`()
begin
declare v_rows int default 0;
select count(*) from data_warehouse.dim_date into v_rows;
if v_rows = 0 then
	insert into data_warehouse.dim_date
    select * from staging.staging_dim_date;
else
	insert into data_warehouse.dim_date
	select *
    from staging.staging_dim_date sd
   -- join data_warehouse.dim_date dwd on dwd.id = sd.id
	where sd.id in (select * from 
	(select id from staging.staging_dim_date sd
	where /*not*/ not exists
	(select * from data_warehouse.dim_date dwd where sd.id = dwd.id and sd.full_date = dwd.full_date)) as x);
    
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_dw_dim_province` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_dw_dim_province`()
begin
declare v_rows int default 0;
select count(*) from data_warehouse.dim_province into v_rows;
if v_rows = 0 then
	insert into data_warehouse.dim_province(id_province, name, start_date, start_time, expired_date, expired_time)
    select id, name, start_date, start_time,
    (select full_date from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date)) as max_date,
    (select hour_time from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time)) as max_time
    from staging.staging_dim_province;
else
	update data_warehouse.dim_province dwp
    join staging.staging_dim_province sp on dwp.id_province = sp.id
    set expired_date = sp.start_date, expired_time = sp.start_time
	where id_province in (select * from 
	(select id_province from data_warehouse.dim_province dwp
	where not exists (select * from staging.staging_dim_province sp where sp.id = dwp.id_province and sp.name = dwp.name)) as y)
	and expired_date = (select full_date from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date))
	and expired_time = (select hour_time from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time));


	insert into data_warehouse.dim_province(id_province, name, start_date, start_time, expired_date, expired_time)
	select sp.id, sp.name, sp.start_date, sp.start_time,
    (select full_date from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date)) as max_date,
    (select hour_time from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time)) as max_time
    from staging.staging_dim_province sp
    -- join data_warehouse.dim_province dwp on dwp.id_province = sp.id
	where sp.id in (select * from 
	(select id from staging.staging_dim_province sp
	where not exists
	(select * from data_warehouse.dim_province dwp where sp.id = dwp.id_province and sp.name = dwp.name)) as x);
    
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_dw_dim_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_dw_dim_time`()
begin
declare v_rows int default 0;
select count(*) from data_warehouse.dim_time into v_rows;
if v_rows = 0 then
	insert into data_warehouse.dim_time
    select * from staging.staging_dim_time;
else
	insert into data_warehouse.dim_time
	select *
    from staging.staging_dim_time
	where id in (select * from 
	(select id from staging.staging_dim_time st
	where not exists
	(select * from data_warehouse.dim_time dwt where st.id = dwt.id and st.hour_time = dwt.hour_time)) as x);
    
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_dw_fact_weather` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_dw_fact_weather`()
begin

declare v_rows int default 0;
select count(*) from data_warehouse.fact_weather into v_rows;

if v_rows = 0 then
	insert into data_warehouse.fact_weather
    (id_province, id_time, id_date, id_staging_fact, temperature, description, humidity, vision, wind, uv_index, air_quality, expired_date, expired_time)
    select id_province, id_time, id_date, id, temperature, description, humidity, vision, wind, uv_index, air_quality,
    (select id from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date)) as max_date,
    (select id from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time)) as max_time
    from staging.staging_fact_weather;
else
	update data_warehouse.fact_weather dwf
    right join staging.staging_fact_weather sf on dwf.id_staging_fact = sf.id
    set 
		dwf.expired_date = sf.id_date,
		dwf.expired_time = sf.id_time
	where 
		expired_date = (select id from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date)) and
		expired_time = (select id from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time));

	insert into data_warehouse.fact_weather
    (id_province, id_time, id_date, id_staging_fact, temperature, description, humidity, vision, wind, uv_index, air_quality, expired_date, expired_time)
    select id_province, id_time, id_date, id, temperature, description, humidity, vision, wind, uv_index, air_quality,
    (select id from data_warehouse.dim_date where id = (select max(id) from data_warehouse.dim_date)) as max_date,
    (select id from data_warehouse.dim_time where id = (select max(id) from data_warehouse.dim_time)) as max_time
    from staging.staging_fact_weather;
end if;
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

-- Dump completed on 2022-12-02 11:33:09