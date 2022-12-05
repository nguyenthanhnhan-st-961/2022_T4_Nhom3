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

-- Dump completed on 2022-12-05 11:36:32
