-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: toysgroup
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `typeCateg` varchar(50) NOT NULL,
  `themeGame` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Peluche','Animali selvatici'),(2,'Peluche','Personaggi dei cartoni animati'),(3,'Peluche','Peluche interattivi'),(4,'Costruzione','Città futuristiche'),(5,'Costruzione','Veicoli spaziali e astronavi'),(6,'Gioco da esterno','Sport all\'aria aperta'),(7,'Gioco da esterno','Acqua e divertimento estivo'),(8,'Elettronico','Robot e intelligenza artificiale'),(9,'Elettronico','Giocattoli STEM'),(10,'Istruzione','Arte e creatività'),(11,'Istruzione','Geometria e matematica');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `country` varchar(50) DEFAULT NULL,
  `salesregionID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `salesregionID` (`salesregionID`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`salesregionID`) REFERENCES `Salesregion` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Italia',1),(2,'Francia',1),(3,'Germania',1),(4,'Belgio',1),(5,'Paesi Bassi',1),(6,'Svizzera',1),(7,'Regno Unito',2),(8,'Finlandia',2),(9,'Danimarca',2),(10,'Polonia',4),(11,'Repubblica Ceca',4),(12,'Ungheria',4),(13,'Spagna',3),(14,'Portogallo',3),(15,'Grecia',3),(16,'Italia',3),(17,'Brasile',7),(18,'Argentina',7),(19,'Cile',7),(20,'Perù',7),(21,'Colombia',7),(22,'Stati Uniti',5),(23,'Canada',5),(24,'Messico',5),(25,'Cuba',8);
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `infogeo`
--

DROP TABLE IF EXISTS `infogeo`;
/*!50001 DROP VIEW IF EXISTS `infogeo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infogeo` AS SELECT 
 1 AS `country`,
 1 AS `geoArea`,
 1 AS `nameProduct`,
 1 AS `typeCateg`,
 1 AS `totalAmount`,
 1 AS `orderQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `infoutili`
--

DROP TABLE IF EXISTS `infoutili`;
/*!50001 DROP VIEW IF EXISTS `infoutili`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoutili` AS SELECT 
 1 AS `ID`,
 1 AS `nameProduct`,
 1 AS `typeCateg`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nameProduct` varchar(50) NOT NULL,
  `recommendedAge` varchar(3) DEFAULT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `categoryID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `Category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Peluche Leone','3+',22.99,1),(2,'Peluche Elefante','4+',25.99,1),(3,'Peluche Giraffa','3+',22.99,1),(4,'Peluche Interattivo Orso','4+',34.99,3),(5,'Peluche Interattivo Robot','5+',29.99,3),(6,'Peluche Mickey Mouse','2+',14.99,2),(7,'Peluche Minnie Mouse','2+',14.99,2),(8,'Peluche Bugs Bunny','4+',16.99,2),(9,'Peluche Superman','5+',24.99,2),(10,'Costruzione Città Futuristica','7+',39.99,4),(11,'Costruzione Astronave','8+',49.99,5),(12,'Costruzione Torre','6+',29.99,4),(13,'Costruzione Robot','8+',55.99,5),(14,'Gioco da Esterno Frisbee','5+',12.99,6),(15,'Gioco Esterno Skateboard','8+',34.99,6),(16,'Gioco da Esterno Avventura','7+',19.99,7),(17,'Gioco da Esterno Piscina','6+',25.99,7),(18,'Robot Interattivo','8+',79.99,8),(19,'Drone Giocattolo','10+',99.99,8),(20,'Giocattolo STEM','10+',59.99,9),(21,'Giocattolo STEM Scienza','10+',41.99,9),(22,'Kit Coding','10+',45.99,9),(23,'Kit di Robotica','10+',59.99,9),(24,'Macchina da corsa RC','9+',39.99,8),(25,'Set Arte Creatività','3+',17.99,10),(26,'Kit Pittura','4+',14.99,10),(27,'Libri di Geometria','6+',12.99,11),(28,'Puzzle Matematico','7+',9.99,11),(29,'Gioco di Geometria 3D','10+',34.99,11),(30,'Set Creativo per Bambini','4+',19.99,10);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(8) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `salesDate` date NOT NULL,
  `orderQuantity` smallint NOT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `productID` int DEFAULT NULL,
  `countryID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `productID` (`productID`),
  KEY `countryID` (`countryID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `Product` (`ID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`countryID`) REFERENCES `Country` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,'ord-0000','2023-03-23','2023-03-25',3,39.99,119.97,10,5),(2,'ord-0001','2023-03-29','2023-03-31',2,29.99,59.98,5,18),(3,'ord-0002','2023-04-17','2023-04-20',4,14.99,59.96,7,14),(4,'ord-0003','2023-06-07','2023-06-08',1,34.99,34.99,4,20),(5,'ord-0004','2023-12-17','2023-12-22',2,22.99,45.98,3,6),(6,'ord-0005','2024-01-17','2024-01-22',3,14.99,44.97,7,7),(7,'ord-0006','2024-01-25','2024-01-25',5,22.99,114.95,1,2),(8,'ord-0007','2024-01-30','2024-01-31',2,14.99,329.98,6,1),(9,'ord-0008','2024-02-02','2024-02-04',4,25.99,103.96,2,16),(10,'ord-0009','2024-02-22','2024-02-23',3,16.99,50.97,8,15),(11,'ord-0010','2024-02-29','2024-02-29',2,34.99,69.98,15,12),(12,'ord-0011','2024-03-01','2024-03-02',1,59.99,59.99,20,17),(13,'ord-0012','2024-04-15','2024-04-17',5,99.99,499.95,19,7),(14,'ord-0013','2024-05-17','2024-05-17',4,55.99,223.96,13,23),(15,'ord-0014','2024-05-30','2024-06-02',2,17.99,35.98,25,10),(16,'ord-0015','2024-06-06','2024-06-08',3,25.99,77.97,17,25),(17,'ord-0016','2024-06-07','2024-06-09',1,29.99,29.99,12,8),(18,'ord-0017','2024-06-24','2024-06-26',2,25.99,51.98,17,4),(19,'ord-0018','2024-07-16','2024-07-19',4,49.99,199.96,11,9),(20,'ord-0019','2024-07-31','2024-08-02',3,79.99,239.97,18,22),(21,'ord-0020','2024-08-05','2024-08-08',2,19.99,39.98,16,21),(22,'ord-0021','2024-09-18','2024-09-18',1,45.99,45.99,22,19),(23,'ord-0022','2024-10-10','2024-10-12',5,22.99,114.95,3,17),(24,'ord-0023','2024-11-20','2024-11-24',3,29.99,89.97,5,13),(25,'ord-0024','2024-12-20','2024-12-23',4,59.99,239.96,23,11),(26,'ord-0025','2025-01-20','2025-01-20',2,39.99,79.98,10,23),(27,'ord-0026','2025-01-22','2025-01-23',1,12.99,12.99,27,5),(28,'ord-0027','2025-01-25','2025-01-26',3,34.99,104.97,29,15),(29,'ord-0028','2025-01-28','2025-01-29',4,34.99,139.96,4,24),(30,'ord-0029','2025-01-31','2025-02-02',5,41.99,209.95,21,18),(31,'ord-0030','2025-02-01','2025-02-01',2,19.99,39.98,30,3),(32,'ord-0031','2025-02-04','2025-02-06',3,22.99,68.97,1,5),(33,'ord-0032','2025-02-07','2025-02-08',2,59.99,119.98,23,1),(34,'ord-0033','2025-02-12','2025-02-13',5,79.99,399.95,18,2),(35,'ord-0034','2025-02-13','2025-02-13',3,19.99,59.97,16,15),(36,'ord-0035','2025-02-15','2025-02-18',4,39.99,159.96,10,23),(37,'ord-0036','2025-02-18','2025-02-18',3,45.99,137.97,22,22),(38,'ord-0037','2025-02-19','2025-02-21',4,99.99,399.96,19,11),(39,'ord-0038','2025-02-20','2025-02-20',3,59.99,179.97,23,13),(40,'ord-0039','2025-02-21','2025-02-21',4,29.99,119.96,5,24);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salesregion`
--

DROP TABLE IF EXISTS `Salesregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Salesregion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `continent` varchar(50) DEFAULT NULL,
  `geoArea` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salesregion`
--

LOCK TABLES `Salesregion` WRITE;
/*!40000 ALTER TABLE `Salesregion` DISABLE KEYS */;
INSERT INTO `Salesregion` VALUES (1,'Europa','Western Europe'),(2,'Europa','Northern Europe'),(3,'Europa','Southern Europe'),(4,'Europa','Eastern Europe'),(5,'America','North America'),(6,'America','Central America'),(7,'America','South America'),(8,'America','Caribbean');
/*!40000 ALTER TABLE `Salesregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `infogeo`
--

/*!50001 DROP VIEW IF EXISTS `infogeo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infogeo` AS select `CS`.`country` AS `country`,`R`.`geoArea` AS `geoArea`,`P`.`nameProduct` AS `nameProduct`,`C`.`typeCateg` AS `typeCateg`,`S`.`totalAmount` AS `totalAmount`,`S`.`orderQuantity` AS `orderQuantity` from ((((`salesregion` `R` join `country` `CS` on((`R`.`ID` = `CS`.`salesregionID`))) join `sales` `S` on((`CS`.`ID` = `S`.`countryID`))) join `product` `P` on((`S`.`productID` = `P`.`ID`))) join `category` `C` on((`P`.`categoryID` = `C`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infoutili`
--

/*!50001 DROP VIEW IF EXISTS `infoutili`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoutili` AS select `P`.`ID` AS `ID`,`P`.`nameProduct` AS `nameProduct`,`C`.`typeCateg` AS `typeCateg` from (`product` `P` join `category` `C` on((`P`.`categoryID` = `C`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 16:16:19
