-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: lab_mysql
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cars` (
  `ID_car` int(11) NOT NULL AUTO_INCREMENT,
  `VIN` varchar(45) DEFAULT NULL,
  `Manufacturer` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `color` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID_car`),
  UNIQUE KEY `ID_car_UNIQUE` (`ID_car`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),(2,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),(3,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),(4,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),(5,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_invoices`
--

DROP TABLE IF EXISTS `cars_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cars_invoices` (
  `cars_ID_car` int(11) NOT NULL,
  `invoices_ID_invoice` int(11) NOT NULL,
  PRIMARY KEY (`cars_ID_car`,`invoices_ID_invoice`),
  KEY `fk_cars_has_invoices_invoices1_idx` (`invoices_ID_invoice`),
  KEY `fk_cars_has_invoices_cars1_idx` (`cars_ID_car`),
  CONSTRAINT `fk_cars_has_invoices_cars1` FOREIGN KEY (`cars_ID_car`) REFERENCES `cars` (`id_car`),
  CONSTRAINT `fk_cars_has_invoices_invoices1` FOREIGN KEY (`invoices_ID_invoice`) REFERENCES `invoices` (`ID_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_invoices`
--

LOCK TABLES `cars_invoices` WRITE;
/*!40000 ALTER TABLE `cars_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `ID_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `e_mail` varchar(15) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(25) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `zip_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_customer`),
  UNIQUE KEY `ID_customer_UNIQUE` (`ID_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=30002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (10001,'Pablo Picasso','+34 636 17 63 82','ppicasso@gmail','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045'),(20001,'Abraham Lincoln','+1 305 907 7086','lincoln@us.gov','120 SW 8th Street','Miami','Florida','United States','33130'),(30001,'Napoléon Bonap','+33 1 79 75 40 00','hello@napoleon','40 Rue du Colisée','Paris','Île-de-France','France','75008');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_invoices`
--

DROP TABLE IF EXISTS `customers_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers_invoices` (
  `customers_ID_customer` int(11) NOT NULL,
  `invoices_ID_invoice` int(11) NOT NULL,
  PRIMARY KEY (`customers_ID_customer`,`invoices_ID_invoice`),
  KEY `fk_customers_has_invoices_invoices1_idx` (`invoices_ID_invoice`),
  KEY `fk_customers_has_invoices_customers_idx` (`customers_ID_customer`),
  CONSTRAINT `fk_customers_has_invoices_customers` FOREIGN KEY (`customers_ID_customer`) REFERENCES `customers` (`id_customer`),
  CONSTRAINT `fk_customers_has_invoices_invoices1` FOREIGN KEY (`invoices_ID_invoice`) REFERENCES `invoices` (`ID_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_invoices`
--

LOCK TABLES `customers_invoices` WRITE;
/*!40000 ALTER TABLE `customers_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `invoices` (
  `ID_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `number_invoice` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ID_car` int(11) NOT NULL,
  `ID_customer` int(10) NOT NULL,
  `ID_salesperson` int(11) NOT NULL,
  PRIMARY KEY (`ID_invoice`),
  UNIQUE KEY `ID_invoice_UNIQUE` (`ID_invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,852399038,'2018-08-22',1,10001,4),(2,731166526,'2018-12-31',4,10001,7),(3,271135104,'2019-01-22',3,30001,7);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sales` (
  `id_salesperson` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `store` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_salesperson`),
  UNIQUE KEY `id_salesperson_UNIQUE` (`id_salesperson`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'Petey Cruiser','Madrid'),(2,'Anna Sthesia','Barcelona'),(3,'Paul Molive','Berlin'),(4,'Gail Forcewind','Paris'),(5,'Paige Turner','Miami'),(6,'Bob Frapples','Mexico City'),(7,'Walter Melon','Amsterdam'),(8,'Shonda Leer','São Paulo');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoices`
--

DROP TABLE IF EXISTS `sales_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sales_invoices` (
  `sales_id_salesperson` int(11) NOT NULL,
  `invoices_ID_invoice` int(11) NOT NULL,
  PRIMARY KEY (`sales_id_salesperson`,`invoices_ID_invoice`),
  KEY `fk_sales_has_invoices_invoices1_idx` (`invoices_ID_invoice`),
  KEY `fk_sales_has_invoices_sales1_idx` (`sales_id_salesperson`),
  CONSTRAINT `fk_sales_has_invoices_invoices1` FOREIGN KEY (`invoices_ID_invoice`) REFERENCES `invoices` (`ID_invoice`),
  CONSTRAINT `fk_sales_has_invoices_sales1` FOREIGN KEY (`sales_id_salesperson`) REFERENCES `sales` (`id_salesperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoices`
--

LOCK TABLES `sales_invoices` WRITE;
/*!40000 ALTER TABLE `sales_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-28 19:59:40
