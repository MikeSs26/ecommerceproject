-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id_bill` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `fk_client` int NOT NULL,
  `fk_status` int NOT NULL,
  `fk_type_pay` int NOT NULL,
  PRIMARY KEY (`id_bill`),
  UNIQUE KEY `id_UNIQUE` (`id_bill`),
  KEY `fk_status_idx` (`fk_status`),
  KEY `fk_type_idx` (`fk_type_pay`),
  KEY `fk_client_idx` (`fk_client`),
  CONSTRAINT `fk_client` FOREIGN KEY (`fk_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_status` FOREIGN KEY (`fk_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_type` FOREIGN KEY (`fk_type_pay`) REFERENCES `types_pay` (`id_type_pay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billxproduct`
--

DROP TABLE IF EXISTS `billxproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billxproduct` (
  `id_billxproduct` int NOT NULL AUTO_INCREMENT,
  `fk_product` int NOT NULL,
  `fk_bill` int NOT NULL,
  PRIMARY KEY (`id_billxproduct`),
  UNIQUE KEY `id_UNIQUE` (`id_billxproduct`),
  KEY `fk_bill_idx` (`fk_bill`),
  KEY `fk_product_idx` (`fk_product`),
  CONSTRAINT `fk_bill` FOREIGN KEY (`fk_bill`) REFERENCES `bills` (`id_bill`),
  CONSTRAINT `fk_productP` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billxproduct`
--

LOCK TABLES `billxproduct` WRITE;
/*!40000 ALTER TABLE `billxproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `billxproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id_brand` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_brand`),
  UNIQUE KEY `idmarcas_UNIQUE` (`id_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `idcategoria_UNIQUE` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryxsubcategory`
--

DROP TABLE IF EXISTS `categoryxsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryxsubcategory` (
  `id_categoryxsubcategory` int NOT NULL AUTO_INCREMENT,
  `fk_category` int NOT NULL,
  `fk_subcategory` int NOT NULL,
  PRIMARY KEY (`id_categoryxsubcategory`),
  UNIQUE KEY `id_categoryxsubcategory_UNIQUE` (`id_categoryxsubcategory`),
  KEY `fk_category_idx` (`fk_category`),
  KEY `fk_subcategory_idx` (`fk_subcategory`),
  CONSTRAINT `fk_category` FOREIGN KEY (`fk_category`) REFERENCES `categories` (`id_category`),
  CONSTRAINT `fk_subategory` FOREIGN KEY (`fk_subcategory`) REFERENCES `subcategories` (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryxsubcategory`
--

LOCK TABLES `categoryxsubcategory` WRITE;
/*!40000 ALTER TABLE `categoryxsubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoryxsubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `fk_province` int NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_UNIQUE` (`id_client`),
  KEY `fk_province_idx` (`fk_province`),
  CONSTRAINT `fk_pronvice` FOREIGN KEY (`fk_province`) REFERENCES `provinces` (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images_products`
--

DROP TABLE IF EXISTS `images_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images_products` (
  `id_images` int NOT NULL AUTO_INCREMENT,
  `url` varchar(45) NOT NULL,
  `fk_product` int NOT NULL,
  PRIMARY KEY (`id_images`),
  UNIQUE KEY `id_UNIQUE` (`id_images`),
  KEY `fk_images_idx` (`fk_product`),
  CONSTRAINT `fk_images` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images_products`
--

LOCK TABLES `images_products` WRITE;
/*!40000 ALTER TABLE `images_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `images_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `especifications` varchar(45) NOT NULL,
  `unique_product_code` varchar(45) NOT NULL,
  `item_number` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `fk_brand` int NOT NULL,
  `fk_subcategory` int NOT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `id_UNIQUE` (`id_product`),
  KEY `fk_marca_idx` (`fk_brand`),
  KEY `fk_subcategory_idx` (`fk_subcategory`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`fk_brand`) REFERENCES `brands` (`id_brand`),
  CONSTRAINT `fk_subcategory` FOREIGN KEY (`fk_subcategory`) REFERENCES `subcategories` (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `id_province` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `acronym` varchar(45) NOT NULL,
  PRIMARY KEY (`id_province`),
  UNIQUE KEY `id_province_UNIQUE` (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `id_statu_UNIQUE` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id_subcategory` int NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_pay`
--

DROP TABLE IF EXISTS `types_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_pay` (
  `id_type_pay` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type_pay`),
  UNIQUE KEY `id_type:pay_UNIQUE` (`id_type_pay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_pay`
--

LOCK TABLES `types_pay` WRITE;
/*!40000 ALTER TABLE `types_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_pay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 19:04:42
