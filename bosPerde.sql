-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: beyazperde
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `cinema_artists`
--

DROP TABLE IF EXISTS `cinema_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_artists` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_artists`
--

LOCK TABLES `cinema_artists` WRITE;
/*!40000 ALTER TABLE `cinema_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_cast`
--

DROP TABLE IF EXISTS `cinema_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_cast` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_cast`
--

LOCK TABLES `cinema_cast` WRITE;
/*!40000 ALTER TABLE `cinema_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_directors`
--

DROP TABLE IF EXISTS `cinema_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_directors` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_directors`
--

LOCK TABLES `cinema_directors` WRITE;
/*!40000 ALTER TABLE `cinema_directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_genres`
--

DROP TABLE IF EXISTS `cinema_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_genres` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_2` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_genres`
--

LOCK TABLES `cinema_genres` WRITE;
/*!40000 ALTER TABLE `cinema_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_movieCast`
--

DROP TABLE IF EXISTS `cinema_movieCast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movieCast` (
  `movieId` smallint(5) unsigned NOT NULL,
  `personId` smallint(5) unsigned NOT NULL,
  KEY `movieId` (`movieId`,`personId`),
  KEY `directorId` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movieCast`
--

LOCK TABLES `cinema_movieCast` WRITE;
/*!40000 ALTER TABLE `cinema_movieCast` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_movieCast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_movieDirectors`
--

DROP TABLE IF EXISTS `cinema_movieDirectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movieDirectors` (
  `movieId` smallint(5) unsigned NOT NULL,
  `directorId` smallint(5) unsigned NOT NULL,
  KEY `movieId` (`movieId`,`directorId`),
  KEY `directorId` (`directorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movieDirectors`
--

LOCK TABLES `cinema_movieDirectors` WRITE;
/*!40000 ALTER TABLE `cinema_movieDirectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_movieDirectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_movieScenarists`
--

DROP TABLE IF EXISTS `cinema_movieScenarists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movieScenarists` (
  `movieId` smallint(5) unsigned NOT NULL,
  `scenaristId` smallint(5) unsigned NOT NULL,
  KEY `movieId` (`movieId`,`scenaristId`),
  KEY `directorId` (`scenaristId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movieScenarists`
--

LOCK TABLES `cinema_movieScenarists` WRITE;
/*!40000 ALTER TABLE `cinema_movieScenarists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_movieScenarists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_movieYears`
--

DROP TABLE IF EXISTS `cinema_movieYears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movieYears` (
  `movieId` smallint(5) unsigned NOT NULL,
  `year` year(4) NOT NULL,
  UNIQUE KEY `movieId_2` (`movieId`),
  KEY `movieId` (`movieId`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filmlerin yayın yıllarını tutar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movieYears`
--

LOCK TABLES `cinema_movieYears` WRITE;
/*!40000 ALTER TABLE `cinema_movieYears` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_movieYears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_movies`
--

DROP TABLE IF EXISTS `cinema_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_movies` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `href` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=işlenmemiş,1=işlenmiş,2=işleniyor,3=işlenmiş',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_2` (`title`),
  KEY `title` (`title`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_movies`
--

LOCK TABLES `cinema_movies` WRITE;
/*!40000 ALTER TABLE `cinema_movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_properties`
--

DROP TABLE IF EXISTS `cinema_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_properties` (
  `movieId` smallint(5) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `value` text NOT NULL,
  KEY `movieId` (`movieId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='çeşitli film özellikleri tutan tablo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_properties`
--

LOCK TABLES `cinema_properties` WRITE;
/*!40000 ALTER TABLE `cinema_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_scenarists`
--

DROP TABLE IF EXISTS `cinema_scenarists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_scenarists` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_scenarists`
--

LOCK TABLES `cinema_scenarists` WRITE;
/*!40000 ALTER TABLE `cinema_scenarists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_scenarists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_years`
--

DROP TABLE IF EXISTS `cinema_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema_years` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=islenmemiş, 1=işlenmiş,2=işleniyor',
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_years`
--

LOCK TABLES `cinema_years` WRITE;
/*!40000 ALTER TABLE `cinema_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_years` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-11 15:28:45
