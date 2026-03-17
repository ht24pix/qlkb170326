-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: warehouse_lease
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_name_en` varchar(100) DEFAULT NULL COMMENT 'Company name in English',
  `taxcode` varchar(15) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `legal_representive` varchar(100) DEFAULT NULL,
  `bank_acc_no` varchar(50) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxcode_unique` (`taxcode`),
  UNIQUE KEY `bank_acc_no_unique` (`bank_acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `contract_code` varchar(100) NOT NULL,
  `date_signed` date DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_code_unique` (`contract_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_appendix`
--

DROP TABLE IF EXISTS `contract_appendix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_appendix` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `appendix_no` varchar(100) NOT NULL,
  `sign_date` date NOT NULL,
  `effective_date` date DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_appendix_no_unique` (`appendix_no`),
  KEY `contract_appendix_contract_FK` (`contract_id`),
  CONSTRAINT `contract_appendix_contract_FK` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_appendix`
--

LOCK TABLES `contract_appendix` WRITE;
/*!40000 ALTER TABLE `contract_appendix` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_appendix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_service_policy`
--

DROP TABLE IF EXISTS `contract_service_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_service_policy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `appendix_id` bigint NOT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `surcharge_percent` tinyint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_service_policy_contract_FK` (`contract_id`),
  KEY `contract_service_policy_contract_appendix_FK` (`appendix_id`),
  CONSTRAINT `contract_service_policy_contract_appendix_FK` FOREIGN KEY (`appendix_id`) REFERENCES `contract_appendix` (`id`),
  CONSTRAINT `contract_service_policy_contract_FK` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_service_policy`
--

LOCK TABLES `contract_service_policy` WRITE;
/*!40000 ALTER TABLE `contract_service_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_service_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_warehouse_history`
--

DROP TABLE IF EXISTS `contract_warehouse_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_warehouse_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `appendix_id` bigint NOT NULL,
  `warehouse_id` bigint NOT NULL,
  `rent_type` varchar(100) DEFAULT NULL,
  `price` double unsigned DEFAULT NULL,
  `area_m2` double unsigned DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `contract_warehouse_history_contract_FK` (`contract_id`),
  KEY `contract_warehouse_history_contract_appendix_FK` (`appendix_id`),
  KEY `contract_warehouse_history_warehouse_FK` (`warehouse_id`),
  CONSTRAINT `contract_warehouse_history_contract_appendix_FK` FOREIGN KEY (`appendix_id`) REFERENCES `contract_appendix` (`id`),
  CONSTRAINT `contract_warehouse_history_contract_FK` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`),
  CONSTRAINT `contract_warehouse_history_warehouse_FK` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_warehouse_history`
--

LOCK TABLES `contract_warehouse_history` WRITE;
/*!40000 ALTER TABLE `contract_warehouse_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_warehouse_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `customer_type` enum('DOANHNGHIEP','CANHAN','HOKINHDOANH','HOPTACXA') NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `taxcode` varchar(50) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `legal_representive` varchar(100) DEFAULT NULL,
  `bank_acc_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_taxcode_unique` (`taxcode`),
  UNIQUE KEY `idcard_unique` (`id_card`),
  KEY `customer_companyinfo_FK` (`company_id`),
  CONSTRAINT `customer_companyinfo_FK` FOREIGN KEY (`company_id`) REFERENCES `companyinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electric_price_history`
--

DROP TABLE IF EXISTS `electric_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_price_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `station_id` bigint NOT NULL,
  `price_peak` double DEFAULT NULL,
  `price_normal` double DEFAULT NULL,
  `price_offpeak` double DEFAULT NULL,
  `vat_percent` varchar(10) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `electric_price_history_electric_station_FK` (`station_id`),
  CONSTRAINT `electric_price_history_electric_station_FK` FOREIGN KEY (`station_id`) REFERENCES `electric_station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_price_history`
--

LOCK TABLES `electric_price_history` WRITE;
/*!40000 ALTER TABLE `electric_price_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `electric_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electric_station`
--

DROP TABLE IF EXISTS `electric_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_station`
--

LOCK TABLES `electric_station` WRITE;
/*!40000 ALTER TABLE `electric_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `electric_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `billing_month` int DEFAULT NULL,
  `billing_year` int DEFAULT NULL,
  `rent_fee` double DEFAULT NULL,
  `electric_fee` double DEFAULT NULL,
  `water_fee` double DEFAULT NULL,
  `other_fee` double DEFAULT NULL,
  `total_fee` double DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invoice_contract_FK` (`contract_id`),
  CONSTRAINT `invoice_contract_FK` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_detail_invoice_FK` (`invoice_id`),
  CONSTRAINT `invoice_detail_invoice_FK` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_detail`
--

LOCK TABLES `invoice_detail` WRITE;
/*!40000 ALTER TABLE `invoice_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter`
--

DROP TABLE IF EXISTS `meter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `warehouse_id` bigint NOT NULL,
  `meter_code` varchar(50) NOT NULL COMMENT 'quan ly theo cong to cho tung cong ty',
  `meter_type` varchar(100) DEFAULT NULL,
  `station_id` bigint NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metercode_unique` (`meter_code`),
  KEY `meter_warehouse_FK` (`warehouse_id`),
  CONSTRAINT `meter_warehouse_FK` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter`
--

LOCK TABLES `meter` WRITE;
/*!40000 ALTER TABLE `meter` DISABLE KEYS */;
/*!40000 ALTER TABLE `meter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meter_reading`
--

DROP TABLE IF EXISTS `meter_reading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meter_reading` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `meter_id` bigint NOT NULL,
  `period_month` int unsigned DEFAULT NULL,
  `period_year` int unsigned DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `old_peak` double DEFAULT NULL,
  `new_peak` double DEFAULT NULL,
  `old_normal` double DEFAULT NULL,
  `new_normal` double DEFAULT NULL,
  `old_offpeak` double DEFAULT NULL,
  `new_offpeak` double DEFAULT NULL,
  `old_water` double DEFAULT NULL,
  `new_water` double DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `meter_reading_meter_FK` (`meter_id`),
  CONSTRAINT `meter_reading_meter_FK` FOREIGN KEY (`meter_id`) REFERENCES `meter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_reading`
--

LOCK TABLES `meter_reading` WRITE;
/*!40000 ALTER TABLE `meter_reading` DISABLE KEYS */;
/*!40000 ALTER TABLE `meter_reading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_invoice_FK` (`invoice_id`),
  CONSTRAINT `payment_invoice_FK` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `warehouse_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `area_m2` double unsigned DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `warehouse_companyinfo_FK` (`company_id`),
  CONSTRAINT `warehouse_companyinfo_FK` FOREIGN KEY (`company_id`) REFERENCES `companyinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'warehouse_lease'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 23:38:45
