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
  `date` varchar(255) NOT NULL,
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
  CONSTRAINT `fk_type_pay` FOREIGN KEY (`fk_type_pay`) REFERENCES `types_pay` (`id_type_pay`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,'5/5/2024',1,1,1),(2,'7/5/2024',2,2,2),(3,'7/5/2024',1,1,1);
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
  CONSTRAINT `fk_product` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_brand`),
  UNIQUE KEY `idmarcas_UNIQUE` (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'RogStrig'),(2,'Razor'),(3,'Apple'),(4,'Microsoft'),(5,'Dell'),(6,'HP'),(7,'Lenovo'),(8,'Asus'),(9,'Acer'),(10,'Samsung'),(11,'Sony'),(12,'LG'),(13,'AMD'),(14,'Intel'),(15,'Playsation'),(16,'xbox');
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
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `idcategoria_UNIQUE` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'categoria 1');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `fk_province` int NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_UNIQUE` (`id_client`),
  KEY `fk_province_idx` (`fk_province`),
  CONSTRAINT `fk_pronvice` FOREIGN KEY (`fk_province`) REFERENCES `provinces` (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Jacques','Martinez','Jacques','1234','jck.alexander7@gmail.cm','1234',1),(2,'John','PEREZ','johndoe','password123','john.doe@example.com','1234567890',1),(3,'Jennifer','Santamaria','Jenni','4321','jenni@gmail.com','434567',1),(4,'luis','leiva','pendejo','123','pendejo@','435353',1),(5,'Jazmina','PEREZ','Colombiana','12345','jazmina@gmail.com','224121',1),(6,'Jean','Castrellon','Jean','1234','jean@gmail.com','3123231',1),(8,'Janina','rodriguez','janialicesan','1234','xxxxx','4242',1),(9,'PEPE','CASTRELLON','PEPE','1234','pepegmail','432442',1);
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
  `url` varchar(255) NOT NULL,
  `fk_product` int NOT NULL,
  PRIMARY KEY (`id_images`),
  UNIQUE KEY `id_UNIQUE` (`id_images`),
  KEY `fk_images_idx` (`fk_product`),
  CONSTRAINT `FK7oe6rjlu7l6t5rexxkwrbxm72` FOREIGN KEY (`fk_product`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_images` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images_products`
--

LOCK TABLES `images_products` WRITE;
/*!40000 ALTER TABLE `images_products` DISABLE KEYS */;
INSERT INTO `images_products` VALUES (1,'assets/images/products/5.png',5);
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
  `name` varchar(255) NOT NULL,
  `especifications` varchar(255) NOT NULL,
  `unique_product_code` varchar(255) NOT NULL,
  `item_number` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `fk_brand` int NOT NULL,
  `fk_subcategory` int NOT NULL,
  `mensaje_tienda` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `id_UNIQUE` (`id_product`),
  KEY `fk_marca_idx` (`fk_brand`),
  KEY `fk_subcategory_idx` (`fk_subcategory`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`fk_brand`) REFERENCES `brands` (`id_brand`),
  CONSTRAINT `fk_subcategory` FOREIGN KEY (`fk_subcategory`) REFERENCES `subcategories` (`id_subcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'MSI GE66 Raider','15.6\" Gaming Laptop, Intel Core i7-11800H, RTX 3070, 16GB RAM, 1TB SSD','MSIGE66RAIDER','GE66RAIDER',1999.99,2,4,'Potencia y estilo con MSI GE66 Raider!'),(2,'Apple MacBook Pro','13.3\" Laptop, M1 chip, 8GB RAM, 256GB SSD, Retina Display','APPLEMACBOOKPRO','MACBOOKPRO',1299.99,3,5,'Rendimiento excepcional con MacBook Pro!'),(3,'Dell XPS 15','15.6\" Laptop, Intel Core i7-11800H, GTX 1650 Ti, 16GB RAM, 512GB SSD','DELLXPS15','XPS15',1599.99,5,7,'Elegancia y potencia con Dell XPS 15!'),(4,'Samsung Galaxy Tab S7','11\" Tablet, Snapdragon 865+, 6GB RAM, 128GB storage, S Pen included','SAMSUNGTABS7','TABS7',699.99,10,8,'Productividad en cualquier lugar con Samsung Galaxy Tab S7!'),(5,'ASUS ROG Zephyrus G14','14\" Gaming Laptop, Ryzen 9 5900HS, RTX 3060, 16GB RAM, 1TB SSD','ASUSROGZEPHYRUSG14','ZEPHYRUSG14',1499.99,8,4,'Portabilidad y rendimiento con ASUS ROG Zephyrus G14!'),(6,'AMD Ryzen 7 5800X','8-core 16-thread processor, 3.8GHz base clock, 4.7GHz boost clock','RYZEN5800X','RYZEN5800X',399.99,14,6,'Alto rendimiento con AMD Ryzen 7 5800X!'),(7,'Sony WH-1000XM4','Wireless Noise-Canceling Headphones, 30-hour battery life, Alexa built-in','SONYWH1000XM4','WH1000XM4',349.99,11,5,'Experiencia auditiva superior con Sony WH-1000XM4!'),(8,'Intel Core i9-11900K','8-core 16-thread processor, 3.5GHz base clock, 5.3GHz boost clock','INTELI911900K','I911900K',529.99,14,7,'Potencia extrema con Intel Core i9-11900K!'),(9,'LG UltraGear 27GN950-B','27\" 4K Gaming Monitor, Nano IPS, 144Hz refresh rate, G-Sync Compatible','LG27GN950B','27GN950B',899.99,12,6,'Imágenes impresionantes con LG UltraGear 27GN950-B!'),(10,'ASUS ROG Strix RTX 3080','10GB GDDR6X, triple-fan cooling, Aura Sync RGB lighting','ASUSROGSTRIXRTX3080','ROGSTRIXRTX3080',999.99,8,7,'Gráficos de alta gama con ASUS ROG Strix RTX 3080!'),(11,'Acer Nitro 5','15.6\" Gaming Laptop, AMD Ryzen 7 5800H, GTX 1650, 16GB RAM, 512GB SSD','ACERNITRO5','NITRO5',899.99,9,4,'Rendimiento gaming con Acer Nitro 5!'),(12,'Microsoft Surface Laptop 4','13.5\" Laptop, Intel Core i5, 8GB RAM, 256GB SSD, PixelSense Display','SURFACELAPTOP4','LAPTOP4',1099.99,4,5,'Elegancia y productividad con Surface Laptop 4!'),(13,'AMD Radeon RX 6700 XT','12GB GDDR6, PCI Express 4.0, AMD RDNA 2 architecture','AMDRX6700XT','RX6700XT',449.99,13,8,'Gráficos de alto rendimiento con AMD Radeon RX 6700 XT!'),(14,'Logitech G Pro X Superlight','Wireless Gaming Mouse, HERO 25K sensor, LIGHTSPEED technology, 70-hour battery life','LOGITECHGPROX','GPROXSUPERLIGHT',149.99,16,9,'Precisión y ligereza con Logitech G Pro X Superlight!'),(15,'Razer BlackWidow V3 Pro','Wireless Mechanical Gaming Keyboard, Razer Green switches, RGB Chroma backlighting','RAZERBLACKWIDOWV3PRO','BLACKWIDOWV3PRO',229.99,2,6,'Tacto superior con Razer BlackWidow V3 Pro!'),(16,'OnePlus 9 Pro','6.7\" Smartphone, Snapdragon 888, 12GB RAM, 256GB storage, Hasselblad camera','ONEPLUS9PRO','ONEPLUS9PRO',1069.99,10,9,'Innovación fotográfica con OnePlus 9 Pro!'),(17,'AMD Ryzen 5 5600G','6-core 12-thread processor, integrated Radeon Vega 7 graphics, 3.9GHz boost clock','RYZEN5600G','RYZEN5600G',199.99,14,4,'Rendimiento y gráficos integrados con AMD Ryzen 5 5600G!'),(18,'MSI MAG B550M Mortar WiFi','Micro-ATX motherboard, AM4 socket, PCIe 4.0, WiFi 6, Mystic Light RGB','MSIMAGB550MMORTAR','MAGB550MMORTARWIFI',129.99,12,7,'Compacta y potente con MSI MAG B550M Mortar WiFi!'),(19,'Samsung Odyssey G7','27\" QHD Curved Gaming Monitor, 240Hz refresh rate, 1ms response time, G-Sync & FreeSync Premium Pro','SAMSUNGODYSSEYG7','ODYSSEYG7',699.99,10,6,'Immersión total con Samsung Odyssey G7!'),(20,'ASUS TUF Gaming GeForce GTX 1660 Super','6GB GDDR6, IP5X dust resistance, Auto-Extreme technology','ASUSTUFGTX1660S','TUFGTX1660S',299.99,8,7,'Rendimiento robusto con ASUS TUF Gaming GTX 1660 Super!'),(21,'Intel Core i7-11700K','8-core 16-thread processor, 3.6GHz base clock, 5.0GHz boost clock','INTELI711700K','I711700K',399.99,14,9,'Potencia excepcional con Intel Core i7-11700K!'),(22,'Logitech G Pro X Wireless','Wireless Gaming Headset, Pro-G 50mm drivers, DTS Headphone:X 2.0, 20-hour battery life','LOGITECHGPROXWIRELESS','GPROXWIRELESS',199.99,16,5,'Sonido profesional con Logitech G Pro X Wireless!'),(23,'Gigabyte AORUS RTX 3090 Xtreme','24GB GDDR6X, water-cooling system, RGB Fusion 2.0 lighting','GIGABYTEAORUSRTX3090','AORUSRTX3090XTREME',1999.99,16,8,'Potencia extrema con Gigabyte AORUS RTX 3090 Xtreme!'),(24,'Apple iPad Air','10.9\" Tablet, A14 Bionic chip, 64GB storage, Liquid Retina display, Touch ID','APPLEIPADAIR','IPADAIR',599.99,3,8,'Innovación y versatilidad con Apple iPad Air!'),(25,'Corsair Vengeance RGB Pro','32GB (2x16GB) DDR4 RAM, 3200MHz, RGB lighting, XMP 2.0 support','CORSAIRVENGEANCERGBPRO','VENGEANCERGBPRO',199.99,7,6,'Rendimiento y estilo con Corsair Vengeance RGB Pro!'),(26,'Samsung Odyssey G9','49\" Dual QHD Curved Gaming Monitor, 240Hz refresh rate, 1ms response time, HDR1000','SAMSUNGODYSSEYG9','ODYSSEYG9',1499.99,10,6,'Curvas impresionantes con Samsung Odyssey G9!'),(27,'AMD Ryzen 9 5900HX','8-core 16-thread processor, 4.6GHz boost clock, 45W TDP','RYZEN5900HX','RYZEN5900HX',499.99,14,4,'Potencia portátil con AMD Ryzen 9 5900HX!'),(28,'Sony PlayStation 5','Disc Version, AMD Ryzen Zen 2, 16GB GDDR6 RAM, 825GB SSD','SONYPLAYSTATION5','PLAYSTATION5',499.99,11,7,'Experiencia gaming de próxima generación con PlayStation 5!'),(29,'Razer DeathAdder V2','Wired Gaming Mouse, Razer Optical Mouse Switches, Focus+ 20K DPI Optical Sensor','RAZERDEATHADDERV2','DEATHADDERV2',69.99,2,9,'Precisión letal con Razer DeathAdder V2!'),(30,'Logitech G502 HERO','Wired Gaming Mouse, HERO 25K sensor, customizable weights, LIGHTSYNC RGB lighting','LOGITECHG502HERO','G502HERO',79.99,16,9,'Personalización y precisión con Logitech G502 HERO!'),(31,'AMD Ryzen Threadripper 3990X','64-core 128-thread processor, 2.9GHz base clock, 4.3GHz boost clock','RYZENTHREADRIPPER3990X','THREADRIPPER3990X',3999.99,14,6,'El máximo rendimiento con AMD Ryzen Threadripper 3990X!'),(32,'LG 27GL850-B','27\" QHD Nano IPS Gaming Monitor, 144Hz refresh rate, NVIDIA G-Sync compatible, HDR10','LG27GL850B','27GL850B',499.99,12,8,'Imágenes vibrantes con LG 27GL850-B!'),(33,'ASUS ROG Ryuo 240','240mm AIO liquid CPU cooler, OLED display, Aura Sync RGB','ASUSROGRYUO240','ROGRYUO240',149.99,8,5,'Refrigeración superior con ASUS ROG Ryuo 240!'),(34,'Intel Core i5-11600K','6-core 12-thread processor, 3.9GHz base clock, 4.9GHz boost clock','INTELI511600K','I511600K',269.99,14,7,'Rendimiento potente con Intel Core i5-11600K!'),(35,'SteelSeries Arctis 7P','Wireless Gaming Headset, Lossless 2.4GHz connection, ClearCast bidirectional microphone','STEELSERIESARCTIS7P','ARCTIS7P',149.99,15,5,'Audio de alta calidad con SteelSeries Arctis 7P!'),(36,'MSI MAG B550 Tomahawk','ATX motherboard, AM4 socket, PCIe 4.0, Mystic Light RGB, Flash BIOS Button','MSIMAGB550TOMAHAWK','MAGB550TOMAHAWK',179.99,12,7,'Potencia y estilo con MSI MAG B550 Tomahawk!'),(37,'NVIDIA GeForce RTX 3060 Ti','8GB GDDR6, Ampere architecture, Ray Tracing cores, DLSS AI acceleration','NVIDIARTX3060TI','RTX3060TI',399.99,15,8,'Gráficos avanzados con NVIDIA GeForce RTX 3060 Ti!'),(38,'Apple iPhone 12 Pro Max','6.7\" Smartphone, A14 Bionic chip, 128GB storage, Ceramic Shield, LiDAR scanner','APPLEIPHONE12PROMAX','IPHONE12PROMAX',1099.99,3,9,'Fotografía profesional con Apple iPhone 12 Pro Max!'),(39,'AMD Ryzen 3 3300X','4-core 8-thread processor, 3.8GHz base clock, 4.3GHz boost clock','RYZEN3300X','RYZEN3300X',149.99,14,6,'Rendimiento eficiente con AMD Ryzen 3 3300X!'),(40,'Samsung Odyssey G5','32\" WQHD Gaming Monitor, 144Hz refresh rate, 1ms response time, FreeSync Premium','SAMSUNGODYSSEYG5','ODYSSEYG5',349.99,10,7,'Inmersión total con Samsung Odyssey G5!'),(41,'ASUS ROG Swift PG279Q','27\" WQHD Gaming Monitor, 165Hz refresh rate, IPS panel, G-Sync','ASUSROGPG279Q','ROGPG279Q',699.99,8,6,'Imágenes suaves con ASUS ROG Swift PG279Q!'),(42,'Intel Core i3-10100','4-core 8-thread processor, 3.6GHz base clock, 4.3GHz boost clock','INTELI310100','I310100',129.99,14,5,'Rendimiento esencial con Intel Core i3-10100!'),(43,'Logitech G Pro X Keyboard','Mechanical Gaming Keyboard, GX Blue Clicky switches, LIGHTSYNC RGB','LOGITECHGPROXKEYBOARD','GPROXKEYBOARD',149.99,16,4,'Precisión y durabilidad con Logitech G Pro X Keyboard!'),(44,'HyperX Cloud Alpha','Wired Gaming Headset, Dual Chamber Drivers, Detachable Noise Cancelling Microphone','HYPERXCLOUDALPHA','CLOUDALPHA',99.99,9,5,'Sonido envolvente con HyperX Cloud Alpha!'),(45,'Gigabyte AORUS RTX 3080 Xtreme','10GB GDDR6X, water-cooling system, RGB Fusion 2.0 lighting','GIGABYTEAORUSRTX3080','AORUSRTX3080XTREME',1499.99,16,7,'Rendimiento extremo con Gigabyte AORUS RTX 3080 Xtreme!'),(46,'Apple MacBook Air','13.3\" Laptop, M1 chip, 8GB RAM, 256GB SSD, Retina Display','APPLEMACBOOKAIR','MACBOOKAIR',999.99,3,4,'Potencia y ligereza con MacBook Air!'),(47,'Corsair K95 RGB Platinum XT','Mechanical Gaming Keyboard, Cherry MX Speed switches, RGB backlighting','CORSAIRK95RGBPLATINUMXT','K95RGBPLATINUMXT',179.99,7,5,'Rendimiento y estilo con Corsair K95 RGB Platinum XT!'),(48,'AMD Ryzen 5 3600','6-core 12-thread processor, 3.6GHz base clock, 4.2GHz boost clock','RYZEN53600','RYZEN53600',199.99,14,9,'Rendimiento multitarea con AMD Ryzen 5 3600!'),(49,'Samsung 970 EVO Plus','1TB NVMe PCIe M.2 SSD, Sequential read speeds up to 3500MB/s, V-NAND technology','SAMSUNG970EVOPLUS','970EVOPLUS',149.99,10,8,'Almacenamiento veloz con Samsung 970 EVO Plus!'),(50,'ASUS ROG Crosshair VIII Hero','ATX motherboard, AM4 socket, PCIe 4.0, Aura Sync RGB lighting, SupremeFX audio','ASUSROGCROSSHAIRVIIIHERO','CROSSHAIRVIIIHERO',379.99,8,7,'Potencia y personalización con ASUS ROG Crosshair VIII Hero!'),(51,'Intel Core i9-9900K','8-core 16-thread processor, 3.6GHz base clock, 5.0GHz boost clock','INTELI99900K','I99900K',399.99,14,6,'Rendimiento extremo con Intel Core i9-9900K!'),(52,'Sony WH-1000XM4','Wireless Noise-Canceling Headphones, Dual Noise Sensor technology, up to 30 hours battery life','SONYWH1000XM4','WH1000XM4',349.99,11,9,'Cancelación de ruido superior con Sony WH-1000XM4!'),(53,'NZXT H510 Elite','Mid Tower ATX Case, tempered glass side panel, RGB lighting, Aer RGB 2 fans','NZXTH510ELITE','H510ELITE',149.99,13,7,'Estilo y rendimiento con NZXT H510 Elite!'),(54,'Logitech G Pro X Superlight','Wireless Gaming Mouse, HERO 25K sensor, LIGHTSPEED wireless technology, 63g lightweight design','LOGITECHGPROXSUPERLIGHT','GPROXSUPERLIGHT',149.99,16,9,'Precisión ligera con Logitech G Pro X Superlight!'),(55,'G.SKILL Trident Z RGB','16GB (2 x 8GB) DDR4-3200MHz, CAS latency 16, XMP 2.0 support, Trident Z RGB lighting','GSKILLTRIDENTZRGB','TRIDENTZRGB',109.99,7,8,'Rendimiento y estilo con G.SKILL Trident Z RGB!'),(56,'AMD Ryzen 7 5800X','8-core 16-thread processor, 3.8GHz base clock, 4.7GHz boost clock','RYZEN75800X','RYZEN75800X',449.99,14,6,'Potencia gaming con AMD Ryzen 7 5800X!'),(57,'LG 34GN850-B','34\" UltraWide QHD Nano IPS Gaming Monitor, 144Hz refresh rate, 1ms response time, NVIDIA G-Sync','LG34GN850B','34GN850B',999.99,12,6,'Inmersión visual con LG 34GN850-B!'),(58,'NVIDIA GeForce RTX 3090','24GB GDDR6X, Ampere architecture, Ray Tracing cores, DLSS AI acceleration','NVIDIARTX3090','RTX3090',1499.99,15,7,'Gráficos de alta gama con NVIDIA GeForce RTX 3090!'),(59,'Apple iPad Pro','12.9\" Tablet, M1 chip, Liquid Retina XDR display, 128GB storage, Thunderbolt / USB 4','APPLEIPADPRO','IPADPRO',1099.99,3,8,'Potencia y portabilidad con Apple iPad Pro!'),(60,'Corsair Vengeance LPX','16GB (2 x 8GB) DDR4-3200MHz, CAS latency 16, designed for high-performance overclocking','CORSAIRVENGEANCEL','VENGEANCEL',99.99,7,8,'Rendimiento extremo con Corsair Vengeance LPX!'),(61,'Razer Blade 15','15.6\" Gaming Laptop, Intel Core i7-10750H, NVIDIA GeForce RTX 2070 Max-Q, 16GB RAM, 512GB SSD','RAZERBLADE15','BLADE15',1799.99,2,4,'Potencia portátil con Razer Blade 15!'),(62,'Apple MacBook Pro','16\" Laptop, Apple M1 Pro chip, 16GB RAM, 512GB SSD, Retina Display','APPLEMACBOOKPRO','MACBOOKPRO',2499.99,3,5,'Rendimiento profesional con MacBook Pro!'),(63,'AMD Radeon RX 6900 XT','16GB GDDR6, RDNA 2 architecture, Ray Accelerators, Infinity Cache','RADEONRX6900XT','RX6900XT',999.99,14,6,'Gráficos extremos con AMD Radeon RX 6900 XT!'),(64,'Logitech MX Master 3','Advanced Wireless Mouse, MagSpeed wheel, customizable buttons, ergonomic design','LOGITECHMXMASTER3','MXMASTER3',99.99,16,9,'Control avanzado con Logitech MX Master 3!'),(65,'Samsung Galaxy Tab S7+','12.4\" Tablet, Snapdragon 865 Plus, 8GB RAM, 256GB storage, Super AMOLED display','SAMSUNGGALAXYTAB7PLUS','GALAXYTAB7PLUS',849.99,10,8,'Productividad superior con Samsung Galaxy Tab S7+!'),(66,'ASUS TUF Gaming A15','15.6\" Gaming Laptop, AMD Ryzen 7 4800H, NVIDIA GeForce GTX 1660 Ti, 16GB RAM, 512GB SSD','ASUSTUFGAMINGA15','TUFGAMINGA15',1199.99,8,4,'Rendimiento gaming con ASUS TUF Gaming A15!'),(67,'Corsair Dark Core RGB Pro','Wireless Gaming Mouse, custom PixArt PAW3392 sensor, RGB backlighting','CORSAIRDARKCORERGBPRO','DARKCORERGBPRO',79.99,7,5,'Precisión inalámbrica con Corsair Dark Core RGB Pro!'),(68,'Intel Core i7-11700K','8-core 16-thread processor, 3.6GHz base clock, 5.0GHz boost clock','INTELI711700K','I711700K',399.99,14,7,'Rendimiento superior con Intel Core i7-11700K!'),(69,'Sony WH-CH710N','Wireless Noise-Canceling Headphones, 35 hours battery life, AI Noise Cancelation','SONYWHCH710N','WHCH710N',149.99,11,5,'Cancelación de ruido con Sony WH-CH710N!'),(70,'Samsung Odyssey G7','32\" QHD Curved Gaming Monitor, 240Hz refresh rate, 1ms response time, G-Sync','SAMSUNGODYSSEYG7','ODYSSEYG7',699.99,10,7,'Inmersión gaming con Samsung Odyssey G7!'),(71,'ASUS ROG Strix Scar 15','15.6\" Gaming Laptop, AMD Ryzen 9 5900HX, NVIDIA GeForce RTX 3080, 32GB RAM, 1TB SSD','ASUSROGSCAR15','ROGSCAR15',2499.99,8,4,'Potencia extrema con ASUS ROG Strix Scar 15!'),(72,'Logitech G560','RGB PC Gaming Speakers, LIGHTSYNC technology, DTS:X Ultra surround sound','LOGITECHG560','G560',199.99,16,9,'Audio inmersivo con Logitech G560!'),(73,'AMD Ryzen 5 5600X','6-core 12-thread processor, 3.7GHz base clock, 4.6GHz boost clock','RYZEN55600X','RYZEN55600X',299.99,14,6,'Rendimiento multitarea con AMD Ryzen 5 5600X!'),(74,'Samsung CRG9','49\" Super Ultra-Wide Curved Gaming Monitor, Dual QHD resolution, 120Hz refresh rate','SAMSUNGCRG9','CRG9',1299.99,10,7,'Experiencia envolvente con Samsung CRG9!'),(75,'Corsair HS70','Wireless Gaming Headset, 50mm neodymium drivers, memory foam earpads, Discord-certified microphone','CORSAIRHS70','HS70',99.99,7,5,'Audio claro con Corsair HS70!'),(76,'Intel Core i9-11900K','8-core 16-thread processor, 3.5GHz base clock, 5.3GHz boost clock','INTELI911900K','I911900K',549.99,14,6,'Rendimiento extremo con Intel Core i9-11900K!'),(77,'Razer BlackWidow V3 Pro','Wireless Mechanical Gaming Keyboard, Razer Green Mechanical Switches, RGB backlighting','RAZERBLACKWIDOWV3PRO','BLACKWIDOWV3PRO',229.99,2,5,'Rendimiento y libertad con Razer BlackWidow V3 Pro!'),(78,'Apple AirPods Pro','Wireless Earbuds, Active Noise Cancellation, Transparency mode, Adaptive EQ','APPLEAIRPODSPRO','AIRPODSPRO',249.99,3,9,'Sonido inmersivo con Apple AirPods Pro!'),(79,'Gigabyte AORUS FI27Q-X','27\" QHD Gaming Monitor, 240Hz refresh rate, 1ms response time, Tactical OSD','GIGABYTEAORUSFI27QX','AORUSFI27QX',799.99,16,7,'Precisión gaming con Gigabyte AORUS FI27Q-X!'),(80,'Logitech MX Keys','Advanced Wireless Keyboard, Perfect Stroke keys, USB-C rechargeable, Flow cross-computer control','LOGITECHMXKEYS','MXKEYS',99.99,16,5,'Productividad con Logitech MX Keys!'),(81,'AMD Radeon RX 6800 XT','16GB GDDR6, RDNA 2 architecture, Ray Accelerators, Infinity Cache','RADEONRX6800XT','RX6800XT',649.99,14,6,'Gráficos de alta gama con AMD Radeon RX 6800 XT!'),(82,'Samsung Galaxy Watch 4','40mm Smartwatch, Wear OS by Google, BioActive Sensor, 16GB storage','SAMSUNGGALAXYWATCH4','GALAXYWATCH4',249.99,10,4,'Tecnología en tu muñeca con Samsung Galaxy Watch 4!'),(83,'ASUS ROG Swift PG259QN','24.5\" Full HD Gaming Monitor, 360Hz refresh rate, Fast IPS panel, NVIDIA G-Sync','ASUSROGPG259QN','ROGPG259QN',699.99,8,5,'Rendimiento extremo con ASUS ROG Swift PG259QN!'),(84,'Intel Core i5-11400F','6-core 12-thread processor, 2.6GHz base clock, 4.4GHz boost clock','INTELI511400F','I511400F',179.99,14,8,'Rendimiento esencial con Intel Core i5-11400F!'),(85,'Logitech G733 Lightspeed','Wireless Gaming Headset, LIGHTSPEED wireless technology, Blue VO!CE microphone technology','LOGITECHG733LIGHTSPEED','G733LIGHTSPEED',129.99,16,5,'Comodidad y calidad con Logitech G733 Lightspeed!'),(126,'MSI MAG B550 TOMAHAWK','ATX Motherboard, AMD B550 chipset, Mystic Light RGB, DDR4 Boost, PCIe 4.0','MSIMAGB550TOMAHAWK','MAGB550TOMAHAWK',179.99,5,11,'Rendimiento robusto con MSI MAG B550 Tomahawk!'),(127,'Crucial Ballistix RGB','16GB (2 x 8GB) DDR4-3200MHz, CAS latency 16, customizable RGB lighting','CRUCIALBALLISTICSRGB','BALLISTICSRGB',89.99,7,12,'Ilumina tu sistema con Crucial Ballistix RGB!'),(128,'ASRock B550M-ITX/ac','Mini-ITX Motherboard, AMD B550 chipset, Dual M.2 slots, USB 3.2 Gen2 Type-C','ASROCKB550MITXAC','B550MITXAC',129.99,9,11,'Compacto y potente con ASRock B550M-ITX/ac!'),(129,'Corsair Vengeance LPX','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 18, designed for high-performance overclocking','CORSAIRVENGEANCELPX','VENGEANCELPX',199.99,7,12,'Rendimiento extremo con Corsair Vengeance LPX!'),(130,'Gigabyte Z590 AORUS MASTER','ATX Motherboard, Intel Z590 chipset, Direct 20-phase Digital VRM, Thermal Guard II','GIGABYTEZ590AORUSMASTER','Z590AORUSMASTER',349.99,6,11,'Maestría en rendimiento con Gigabyte Z590 AORUS MASTER!'),(131,'Kingston HyperX Fury','16GB (2 x 8GB) DDR4-3200MHz, CAS latency 16, stylish low-profile heat spreader','KINGSTONHYPERXFURY','HYPERXFURY',79.99,8,12,'Estilo y rendimiento con Kingston HyperX Fury!'),(132,'ASUS ROG Crosshair VIII Hero','ATX Motherboard, AMD X570 chipset, Aura Sync RGB lighting, SupremeFX audio','ASUSROGCROSSHAIRVIIIHERO','ROGCROSSHAIRVIIIHERO',379.99,8,11,'Heroica potencia con ASUS ROG Crosshair VIII Hero!'),(133,'Crucial Ballistix Max','32GB (2 x 16GB) DDR4-4000MHz, CAS latency 18, high-performance memory, RGB lighting','CRUCIALBALLISTIXMAX','BALLISTIXMAX',229.99,7,12,'Máximo rendimiento con Crucial Ballistix Max!'),(134,'MSI MAG X570 TOMAHAWK WIFI','ATX Motherboard, AMD X570 chipset, Mystic Light RGB, DDR4 Boost, PCIe 4.0','MSIMAGX570TOMAHAWKWIFI','MAGX570TOMAHAWKWIFI',249.99,5,11,'WiFi y rendimiento con MSI MAG X570 Tomahawk WIFI!'),(135,'Corsair Vengeance RGB Pro','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 18, dynamic multi-zone RGB lighting','CORSAIRVENGEANCERGBPRO','VENGEANCERGBPRO',219.99,7,12,'Ilumina tu build con Corsair Vengeance RGB Pro!'),(136,'ASRock B550 Phantom Gaming-ITX/ax','Mini-ITX Motherboard, AMD B550 chipset, Thunderbolt 3, 8 Power Phase Design','ASROCKB550PHANTOMGAMINGITXAX','B550PHANTOMGAMINGITXAX',169.99,9,11,'Gaming compacto con ASRock B550 Phantom Gaming-ITX/ax!'),(137,'G.Skill Trident Z Neo','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 16, optimized for AMD Ryzen processors, RGB lighting','GSKILLTRIDENTZNEO','TRIDENTZNEO',249.99,9,12,'Rendimiento y estilo con G.Skill Trident Z Neo!'),(138,'ASUS ROG Strix X570-E Gaming','ATX Motherboard, AMD X570 chipset, Aura Sync RGB lighting, SupremeFX audio','ASUSROGSTRIXX570EGAMING','ROGSTRIXX570EGAMING',329.99,8,11,'Juego supremo con ASUS ROG Strix X570-E Gaming!'),(139,'Kingston HyperX Predator','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 17, aggressive styling, high-performance','KINGSTONHYPERXPREDATOR','HYPERXPREDATOR',259.99,11,12,'Predador del rendimiento con Kingston HyperX Predator!'),(140,'MSI MEG X570 ACE','ATX Motherboard, AMD X570 chipset, Mystic Light Infinity RGB, 12+2+1 IR digital power','MSIMEGX570ACE','MEGX570ACE',369.99,5,11,'ACE del rendimiento con MSI MEG X570 ACE!'),(141,'Corsair Dominator Platinum RGB','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 18, hand-sorted memory chips, customizable RGB lighting','CORSAIRDOMINATORPLATINUMRGB','DOMINATORPLATINUMRGB',299.99,7,12,'Platinum RGB de Corsair con Dominator!'),(142,'ASRock Z590 Phantom Gaming-ITX/TB4','Mini-ITX Motherboard, Intel Z590 chipset, Thunderbolt 4, 8 Power Phase Design','ASROCKZ590PHANTOMGAMINGITXTB4','Z590PHANTOMGAMINGITXTB4',239.99,9,11,'Gaming con ASRock Z590 Phantom Gaming-ITX/TB4!'),(143,'G.Skill Trident Z Royal','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 16, royal golden heatsinks, synchronized lighting effects','GSKILLTRIDENTZROYAL','TRIDENTZROYAL',279.99,11,12,'Elegancia y rendimiento con G.Skill Trident Z Royal!'),(144,'ASUS ROG Crosshair VIII Dark Hero','ATX Motherboard, AMD X570 chipset, AI overclocking, ProCool II connectors','ASUSROGCROSSHAIRVIIIDARKHERO','ROGCROSSHAIRVIIIDARKHERO',399.99,8,11,'Dark Hero del gaming con ASUS ROG Crosshair VIII Dark Hero!'),(145,'Crucial Ballistix DDR4','32GB (2 x 16GB) DDR4-3200MHz, CAS latency 16, stylish low-profile heat spreader','CRUCIALBALLISTIXDDR4','BALLISTIXDDR4',159.99,12,12,'Estilo y rendimiento con Crucial Ballistix DDR4!'),(146,'MSI MEG Z590 ACE','ATX Motherboard, Intel Z590 chipset, Mystic Light RGB, DDR4 Boost, PCIe 4.0','MSIMEGZ590ACE','MEGZ590ACE',389.99,5,11,'ACE en rendimiento con MSI MEG Z590 ACE!'),(147,'Corsair Vengeance LPX DDR4','16GB (2 x 8GB) DDR4-3600MHz, CAS latency 18, designed for high-performance overclocking','CORSAIRVENGEANCELPXDDR4','VENGEANCELPXDDR4',89.99,7,12,'Rendimiento extremo con Corsair Vengeance LPX DDR4!'),(148,'ASRock X570 Taichi','ATX Motherboard, AMD X570 chipset, Polychrome RGB, 14 Power Phase Design, XXL Aluminum Alloy Heatsinks','ASROCKX570TAICHI','X570TAICHI',299.99,9,11,'Taichi en potencia con ASRock X570 Taichi!'),(149,'G.Skill Ripjaws V Series','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 16, tested for compatibility and reliability, heatsink design','GSKILLRIPJAWSV','RIPJAWSV',219.99,10,12,'Compatibilidad y fiabilidad con G.Skill Ripjaws V Series!'),(150,'ASUS ROG Maximus XIII Hero','ATX Motherboard, Intel Z590 chipset, Aura Sync RGB lighting, AI overclocking, SupremeFX audio','ASUSROGMAXIMUSXIIIHERO','ROGMAXIMUSXIIIHERO',449.99,8,11,'Heroica potencia con ASUS ROG Maximus XIII Hero!'),(151,'Kingston HyperX Impact','16GB (2 x 8GB) DDR4-3200MHz, CAS latency 16, powerful SODIMM performance, low-voltage DDR4','KINGSTONHYPERXIMPACT','HYPERXIMPACT',79.99,11,12,'Impacto poderoso con Kingston HyperX Impact!'),(152,'MSI MPG B550 GAMING PLUS','ATX Motherboard, AMD B550 chipset, Mystic Light RGB, DDR4 Boost, PCIe 4.0','MSIMPGB550GAMINGPLUS','MPGB550GAMINGPLUS',149.99,5,11,'Gaming plus con MSI MPG B550 GAMING PLUS!'),(153,'Corsair Dominator Platinum','32GB (2 x 16GB) DDR4-3200MHz, CAS latency 16, hand-sorted memory chips, polished aluminum heatspreaders','CORSAIRDOMINATORPLATINUM','DOMINATORPLATINUM',269.99,7,12,'Platinum en rendimiento con Corsair Dominator Platinum!'),(154,'ASRock B550 Phantom Gaming 4','ATX Motherboard, AMD B550 chipset, 8 Power Phase Design, supports 3rd Gen AMD Ryzen CPUs','ASROCKB550PHANTOMGAMING4','B550PHANTOMGAMING4',109.99,9,11,'Gaming potente con ASRock B550 Phantom Gaming 4!'),(155,'G.Skill Trident Z RGB','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 16, customizable RGB lighting, optimized for AMD Ryzen processors','GSKILLTRIDENTZRGB','TRIDENTZRGB',249.99,13,12,'Rendimiento RGB con G.Skill Trident Z RGB!'),(156,'ASUS ROG Strix B550-E Gaming','ATX Motherboard, AMD B550 chipset, Aura Sync RGB lighting, SupremeFX audio','ASUSROGSTRIXB550EGAMING','ROGSTRIXB550EGAMING',229.99,8,11,'Gaming estelar con ASUS ROG Strix B550-E Gaming!'),(157,'Kingston HyperX FURY','32GB (2 x 16GB) DDR4-3200MHz, CAS latency 16, stylish low-profile heat spreader','KINGSTONHYPERXFURY','HYPERXFURY',159.99,5,12,'FURY de rendimiento con Kingston HyperX FURY!'),(158,'MSI MAG B550M MORTAR WIFI','Micro-ATX Motherboard, AMD B550 chipset, Mystic Light RGB, DDR4 Boost, Wi-Fi 6','MSIMAGB550MMORTARWIFI','MAGB550MMORTARWIFI',139.99,5,11,'MORTAR con WiFi 6 con MSI MAG B550M MORTAR WIFI!'),(159,'Corsair Vengeance RGB Pro DDR4','16GB (2 x 8GB) DDR4-3600MHz, CAS latency 18, dynamic multi-zone RGB lighting','CORSAIRVENGEANCERGBPRODDR4','VENGEANCERGBPRODDR4',89.99,7,12,'Ilumina tu build con Corsair Vengeance RGB Pro DDR4!'),(160,'ASRock Z590 Extreme','ATX Motherboard, Intel Z590 chipset, 12 Power Phase Design, supports 10th and 11th Gen Intel CPUs','ASROCKZ590EXTREME','Z590EXTREME',279.99,9,11,'Extreme performance con ASRock Z590 Extreme!'),(161,'G.Skill Trident Z Neo DDR4','32GB (2 x 16GB) DDR4-3600MHz, CAS latency 16, optimized for AMD Ryzen processors, RGB lighting','GSKILLTRIDENTZNEODDR4','TRIDENTZNEODDR4',249.99,9,12,'Estilo y rendimiento con G.Skill Trident Z Neo DDR4!'),(847,'ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','ROGSCAR17RTX3080',2499.99,1,1,'¡Descuento especial en ROG Strix Scar 17!'),(848,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Oferta exclusiva en Razer Blade 15 Advanced!'),(849,'Apple MacBook Pro','16-inch Retina display, 1TB SSD, 16GB RAM','MACBOOKPRO2024','MP001',1999.99,3,1,'¡Nuevo MacBook Pro a precio increíble!'),(850,'Microsoft Surface Laptop 4','15-inch PixelSense touchscreen, 512GB SSD, 16GB RAM','SURFACE2024','SL004',1599.99,4,2,'¡Oferta en Surface Laptop 4, no te la pierdas!'),(851,'Dell XPS 15','4K UHD+ InfinityEdge touch display, 1TB SSD, 32GB RAM','XPS15-2024','DX001',2199.99,5,2,'¡Precio especial en Dell XPS 15!'),(852,'HP Spectre x360','13.3-inch 4K OLED touch display, 512GB SSD, 16GB RAM','SPECTRE2024','HPX360',1499.99,6,2,'¡Increíble oferta en HP Spectre x360!'),(853,'Lenovo ThinkPad X1 Carbon','14-inch 4K HDR display, 1TB SSD, 16GB RAM','THINKPAD2024','LTP001',1899.99,7,2,'¡Descuento especial en ThinkPad X1 Carbon!'),(854,'Asus ROG Zephyrus G14','14-inch FHD 120Hz display, Ryzen 9 5900HS, 1TB SSD, 32GB RAM','ROG2024','ROG001',1799.99,8,1,'¡Oferta exclusiva en Asus ROG Zephyrus G14!'),(855,'Acer Predator Helios 300','15.6-inch FHD 144Hz display, RTX 3070, 1TB SSD, 16GB RAM','PREDATOR2024','ACERPH300',1699.99,9,1,'¡Descuento en Acer Predator Helios 300, aprovecha!'),(856,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Oferta en Samsung Galaxy Tab S7+!'),(857,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Auriculares Sony WH-1000XM4 a precio increíble!'),(858,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGGRAM17',1399.99,12,2,'¡Descuento especial en LG Gram 17!'),(859,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(860,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(861,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(862,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(863,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(864,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(865,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(866,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(867,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(868,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(869,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(870,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(871,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(872,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(873,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(874,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(875,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(876,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(877,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(878,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(879,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(880,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(881,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(882,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(883,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(884,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(885,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(886,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(887,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(888,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(889,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(890,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(891,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(892,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(893,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(894,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(895,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(896,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(897,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(898,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(899,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(900,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(901,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(902,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(903,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(904,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(905,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(906,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(907,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(908,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(909,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(910,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(911,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(912,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(913,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(914,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(915,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(916,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(917,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(918,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(919,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(920,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(921,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(922,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(923,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(924,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(925,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(926,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(927,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(928,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(929,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(930,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(931,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(932,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(933,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(934,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(935,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(936,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(937,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(938,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(939,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(940,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(941,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(942,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(943,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(944,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(945,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!'),(946,'Microsoft Surface Pro 8','13-inch PixelSense touchscreen, Intel Core i7, 1TB SSD, 16GB RAM','SURFACEPRO8','SP8I7',1799.99,4,2,'¡Potencia y versatilidad con Surface Pro 8!'),(947,'Dell Alienware Aurora R12','Intel Core i9-11900KF, RTX 3090, 2TB SSD, 32GB RAM','ALIENWAREAURORA','AURORAR12',2999.99,5,1,'¡Desempeño extremo con Dell Alienware Aurora R12!'),(948,'HP Omen 15','15.6-inch FHD 300Hz display, Ryzen 9 5900HX, RTX 3080, 1TB SSD, 32GB RAM','HPOMEN15','OMEN15R9',2199.99,6,1,'¡Rendimiento gaming con HP Omen 15!'),(949,'Lenovo Legion 7i','15.6-inch FHD 240Hz display, Intel Core i7-11800H, RTX 3080, 1TB SSD, 16GB RAM','LEGION7I','L7IRTX3080',1799.99,7,1,'¡Potencia y diseño con Lenovo Legion 7i!'),(950,'Asus ROG Strix Scar 17','17.3-inch QHD 165Hz display, Ryzen 9 5900HX, RTX 3080, 2TB SSD, 32GB RAM','ROGSCAR17','SCAR17RTX3080',2499.99,8,1,'¡Rendimiento extremo con ROG Strix Scar 17!'),(951,'Acer Nitro 5','15.6-inch FHD 144Hz display, Ryzen 7 5800H, RTX 3060, 1TB SSD, 16GB RAM','NITRO5','N5RYZEN3060',1199.99,9,1,'¡Potencia asequible con Acer Nitro 5!'),(952,'Samsung Galaxy Tab S7+','12.4-inch Super AMOLED display, 256GB storage, 8GB RAM','TAB2024','SGTS7P',849.99,10,3,'¡Experiencia multimedia con Samsung Galaxy Tab S7+!'),(953,'Sony WH-1000XM4','Noise Cancelling Wireless Headphones, 30-hour battery life','WH1000XM4','SONYWH',299.99,11,15,'¡Sumérgete en el sonido con Sony WH-1000XM4!'),(954,'LG Gram 17','17-inch WQXGA IPS display, 1TB SSD, 16GB RAM','LGGRAM2024','LGG17',1399.99,12,2,'¡Portabilidad y durabilidad con LG Gram 17!'),(955,'Apple iPhone 13 Pro Max','6.7-inch Super Retina XDR display, A15 Bionic chip, 1TB storage','IPHONE13PM','IP13PM',1299.99,3,10,'¡Última tecnología en iPhone 13 Pro Max!'),(956,'NVIDIA GeForce RTX 3080 Ti','12GB GDDR6X, Ampere architecture, Ray tracing cores','RTX3080TI','RTX3080TI',899.99,13,13,'¡Potencia gráfica con NVIDIA RTX 3080 Ti!'),(957,'AMD Ryzen 9 5900X','12 cores, 24 threads, 4.8GHz boost clock, Zen 3 architecture','RYZEN5900X','RYZEN5900X',549.99,14,14,'¡Rendimiento extremo con AMD Ryzen 9 5900X!'),(958,'Logitech G Pro X Superlight','Wireless gaming mouse, HERO sensor, 25,000 DPI','GPROXSL','GPROXSL',149.99,15,16,'¡Precisión y velocidad con Logitech G Pro X Superlight!'),(959,'Samsung Odyssey G9','49-inch DQHD 240Hz curved gaming monitor, 1000R curvature, QLED','ODYSSEYG9','SGODG9',1699.99,10,1,'¡Sumérgete en el juego con Samsung Odyssey G9!'),(960,'Razer Blade 15 Advanced','15.6-inch 4K OLED touch display, RTX 3080, 1TB SSD, 32GB RAM','RAZERBLADE15','RB15ADV',2499.99,2,1,'¡Potencia y portabilidad con Razer Blade 15!'),(961,'Apple Watch Series 7','45mm GPS + Cellular, Always-On Retina display, Ceramic Shield','APPLEWATCH7','AW7GPS',399.99,3,15,'¡Conectividad y estilo con Apple Watch Series 7!');
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
  `name` varchar(255) NOT NULL,
  `acronym` varchar(255) NOT NULL,
  PRIMARY KEY (`id_province`),
  UNIQUE KEY `id_province_UNIQUE` (`id_province`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'chiriqui','ch'),(2,'panama','pa');
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
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `id_statu_UNIQUE` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Pagado'),(2,'Pendiente');
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
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Gaming'),(2,'Working'),(3,'Parts'),(4,'Gaming'),(5,'Apple'),(6,'Linux'),(7,'Windows'),(8,'Tablets'),(9,'Android'),(10,'iPhone'),(11,'Motherboards'),(12,'Memories'),(13,'Graphic cards'),(14,'Processors'),(15,'Headphones'),(16,'Keyboards'),(17,'more');
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
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_type_pay`),
  UNIQUE KEY `id_type:pay_UNIQUE` (`id_type_pay`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_pay`
--

LOCK TABLES `types_pay` WRITE;
/*!40000 ALTER TABLE `types_pay` DISABLE KEYS */;
INSERT INTO `types_pay` VALUES (1,'efectivo'),(2,'Yappy');
/*!40000 ALTER TABLE `types_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-11 12:22:00
