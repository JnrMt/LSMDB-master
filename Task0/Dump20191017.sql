CREATE DATABASE  IF NOT EXISTS `esercizio1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esercizio1`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: esercizio1
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `azienda` (
  `nomeAzienda` varchar(500) NOT NULL DEFAULT '',
  `urlLogo` varchar(500) DEFAULT NULL,
  `urlSito` varchar(500) DEFAULT NULL,
  `indirizzo` varchar(500) DEFAULT NULL,
  `cap` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nomeAzienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `finanziamento`
--

DROP TABLE IF EXISTS `finanziamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finanziamento` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `budget` int(11) unsigned DEFAULT NULL,
  `azienda` varchar(500) NOT NULL DEFAULT '',
  `progetto` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `azienda` (`azienda`),
  KEY `progetto` (`progetto`),
  CONSTRAINT `azienda_ibfk_1` FOREIGN KEY (`azienda`) REFERENCES `azienda` (`nomeAzienda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `progetto_ibfk_1` FOREIGN KEY (`progetto`) REFERENCES `progetto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messaggio`
--

DROP TABLE IF EXISTS `messaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaggio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mittente` varchar(500) NOT NULL,
  `destinatario` varchar(500) NOT NULL,
  `progetto` int(11) unsigned NOT NULL,
  `testo` varchar(500) NOT NULL,
  `stake` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `mittente_idx` (`mittente`),
  KEY `destinatario_idx` (`destinatario`),
  KEY `progetto_idx` (`progetto`),
  CONSTRAINT `destinatario` FOREIGN KEY (`destinatario`) REFERENCES `azienda` (`nomeAzienda`),
  CONSTRAINT `mittente` FOREIGN KEY (`mittente`) REFERENCES `azienda` (`nomeAzienda`),
  CONSTRAINT `progetto` FOREIGN KEY (`progetto`) REFERENCES `progetto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `descrizione` varchar(500) DEFAULT NULL,
  `azienda` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `azienda` (`azienda`),
  CONSTRAINT `azienda_ibfk_2` FOREIGN KEY (`azienda`) REFERENCES `azienda` (`nomeAzienda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-17 20:06:43
