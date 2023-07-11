CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventory`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20230707002618_FirstMigration','6.0.18');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressing`
--

DROP TABLE IF EXISTS `addressing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressing` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `WarehouseId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Addressing_WarehouseId` (`WarehouseId`),
  CONSTRAINT `FK_Addressing_Warehouse_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouse` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressing`
--

LOCK TABLES `addressing` WRITE;
/*!40000 ALTER TABLE `addressing` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressingsinventorystart`
--

DROP TABLE IF EXISTS `addressingsinventorystart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressingsinventorystart` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AddressingId` int NOT NULL,
  `InventoryStartId` int NOT NULL,
  `AddressingCountRealized` tinyint(1) NOT NULL,
  `AddressingCountEnded` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AddressingsInventoryStart_AddressingId` (`AddressingId`),
  KEY `IX_AddressingsInventoryStart_InventoryStartId` (`InventoryStartId`),
  CONSTRAINT `FK_AddressingsInventoryStart_Addressing_AddressingId` FOREIGN KEY (`AddressingId`) REFERENCES `addressing` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AddressingsInventoryStart_InventoryStart_InventoryStartId` FOREIGN KEY (`InventoryStartId`) REFERENCES `inventorystart` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressingsinventorystart`
--

LOCK TABLES `addressingsinventorystart` WRITE;
/*!40000 ALTER TABLE `addressingsinventorystart` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressingsinventorystart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES (1,'Admin','ADMIN','8cfb0866-26cb-4935-a707-bca74f8a8a56'),(2,'Gerente','GERENTE','c28a65ab-8694-40a1-9e42-ff2debd9ca59'),(3,'Contagem','CONTAGEM','e7d33245-05d3-47bc-9448-0c6c3bff6051'),(4,'Relatorio','RELATORIO','2cc23780-70de-4102-9cc6-b3e5732fc5b6');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` int NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  `Discriminator` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES (1,1,'IdentityUserRole<int>');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Available` tinyint(1) NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES (1,'Elanã',0,'esesena','ESESENA','elana.scarabeli@rcproconsultoria.com.br','ELANA.SCARABELI@RCPROCONSULTORIA.COM.BR',1,'AQAAAAEAACcQAAAAEJle5e/SqaeMZWaGX8KiXGRaY5iwqnYR0JGz4Of1bYAGVTuOiz0zpUJ2o+MAaKDUog==','UGSBALGLBB5AMWEBGTVTGQGIBYIU6YY7','5be0df3c-a530-4064-b5b0-56578b209671',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` int NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorymovement`
--

DROP TABLE IF EXISTS `inventorymovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventorymovement` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ItemId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MovementeType` int NOT NULL,
  `WarehouseId` int NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `MovementDate` datetime(6) NOT NULL,
  `ImportDate` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_InventoryMovement_ItemId` (`ItemId`),
  KEY `IX_InventoryMovement_WarehouseId` (`WarehouseId`),
  CONSTRAINT `FK_InventoryMovement_Item_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`),
  CONSTRAINT `FK_InventoryMovement_Warehouse_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `warehouse` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorymovement`
--

LOCK TABLES `inventorymovement` WRITE;
/*!40000 ALTER TABLE `inventorymovement` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventorymovement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventorystart`
--

DROP TABLE IF EXISTS `inventorystart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventorystart` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `InventoryStartDate` datetime(6) NOT NULL,
  `StockTakingFinishDate` datetime(6) NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventorystart`
--

LOCK TABLES `inventorystart` WRITE;
/*!40000 ALTER TABLE `inventorystart` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventorystart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UnitOfMeasurement` int NOT NULL,
  `Observation` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ImageUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsaddressing`
--

DROP TABLE IF EXISTS `itemsaddressing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemsaddressing` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AddressingId` int NOT NULL,
  `ItemId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Quantity` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ItemsAddressing_AddressingId` (`AddressingId`),
  KEY `IX_ItemsAddressing_ItemId` (`ItemId`),
  CONSTRAINT `FK_ItemsAddressing_Addressing_AddressingId` FOREIGN KEY (`AddressingId`) REFERENCES `addressing` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ItemsAddressing_Item_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsaddressing`
--

LOCK TABLES `itemsaddressing` WRITE;
/*!40000 ALTER TABLE `itemsaddressing` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemsaddressing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perishableitem`
--

DROP TABLE IF EXISTS `perishableitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perishableitem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FabricationDate` datetime(6) DEFAULT NULL,
  `ExpirationDate` datetime(6) DEFAULT NULL,
  `ItemBatch` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PerishableItemQuantity` decimal(18,2) NOT NULL,
  `StockTakingId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PerishableItem_StockTakingId` (`StockTakingId`),
  CONSTRAINT `FK_PerishableItem_StockTaking_StockTakingId` FOREIGN KEY (`StockTakingId`) REFERENCES `stocktaking` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perishableitem`
--

LOCK TABLES `perishableitem` WRITE;
/*!40000 ALTER TABLE `perishableitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `perishableitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocktaking`
--

DROP TABLE IF EXISTS `stocktaking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocktaking` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StockTakingDate` datetime(6) DEFAULT NULL,
  `ItemId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AddressingsInventoryStartId` int NOT NULL,
  `StockTakingQuantity` decimal(18,2) NOT NULL,
  `IsPerishableItem` tinyint(1) NOT NULL,
  `StockTakingObservation` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumberOfCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_StockTaking_AddressingsInventoryStartId` (`AddressingsInventoryStartId`),
  KEY `IX_StockTaking_ItemId` (`ItemId`),
  CONSTRAINT `FK_StockTaking_AddressingsInventoryStart_AddressingsInventorySt~` FOREIGN KEY (`AddressingsInventoryStartId`) REFERENCES `addressingsinventorystart` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_StockTaking_Item_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocktaking`
--

LOCK TABLES `stocktaking` WRITE;
/*!40000 ALTER TABLE `stocktaking` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocktaking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewstocktakingfinalreport`
--

DROP TABLE IF EXISTS `viewstocktakingfinalreport`;
/*!50001 DROP VIEW IF EXISTS `viewstocktakingfinalreport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewstocktakingfinalreport` AS SELECT 
 1 AS `ItemId`,
 1 AS `ItemName`,
 1 AS `UnitOfMeasurement`,
 1 AS `SystemQuantity`,
 1 AS `QuantityStockTaking`,
 1 AS `QuantityMovement`,
 1 AS `MovementDate`,
 1 AS `StockTakingDate`,
 1 AS `ItemsAddressingId`,
 1 AS `WarehouseAddressingId`,
 1 AS `WarehouseStocktakingId`,
 1 AS `StockSituation`,
 1 AS `AddressingSituation`,
 1 AS `Divergence`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
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
-- Final view structure for view `viewstocktakingfinalreport`
--

/*!50001 DROP VIEW IF EXISTS `viewstocktakingfinalreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewstocktakingfinalreport` AS select `i`.`Id` AS `ItemId`,`i`.`Name` AS `ItemName`,`i`.`UnitOfMeasurement` AS `UnitOfMeasurement`,coalesce(`ia`.`Quantity`,0) AS `SystemQuantity`,coalesce(`st`.`StockTakingQuantity`,0) AS `QuantityStockTaking`,coalesce(`im`.`Amount`,0) AS `QuantityMovement`,`im`.`MovementDate` AS `MovementDate`,`st`.`StockTakingDate` AS `StockTakingDate`,`ia`.`Id` AS `ItemsAddressingId`,coalesce(`ad`.`WarehouseId`,0) AS `WarehouseAddressingId`,coalesce(`st`.`AddressingsInventoryStartId`,`ais`.`AddressingId`,0) AS `WarehouseStocktakingId`,(case when (coalesce(`st`.`AddressingsInventoryStartId`,`ais`.`AddressingId`,0) = 0) then 1 when ((((coalesce(`ia`.`Quantity`,0) + coalesce(`im`.`Amount`,0)) - coalesce(`st`.`StockTakingQuantity`,0)) = 0) and (coalesce(`st`.`StockTakingQuantity`,0) = 0)) then 1 when (((coalesce(`ia`.`Quantity`,0) + coalesce(`im`.`Amount`,0)) - coalesce(`st`.`StockTakingQuantity`,0)) = 0) then 0 when (((coalesce(`ia`.`Quantity`,0) + coalesce(`im`.`Amount`,0)) - coalesce(`st`.`StockTakingQuantity`,0)) > 0) then 2 when (((coalesce(`ia`.`Quantity`,0) + coalesce(`im`.`Amount`,0)) - coalesce(`st`.`StockTakingQuantity`,0)) < 0) then 3 end) AS `StockSituation`,(case when (`ia`.`Id` is null) then 3 when (count(distinct `ia`.`AddressingId`) > 1) then 2 when (count(distinct `ia`.`AddressingId`) = 0) then (case when ((coalesce(`ia`.`Quantity`,0) = 0) and (coalesce(`st`.`StockTakingQuantity`,0) <> 0)) then 3 else 1 end) when (coalesce(`st`.`AddressingsInventoryStartId`,`ais`.`AddressingId`,0) = 0) then 1 else 0 end) AS `AddressingSituation`,((coalesce(`ia`.`Quantity`,0) + coalesce(`im`.`Amount`,0)) - coalesce(`st`.`StockTakingQuantity`,0)) AS `Divergence` from (((((`item` `i` left join `itemsaddressing` `ia` on((`i`.`Id` = `ia`.`ItemId`))) left join `stocktaking` `st` on((`i`.`Id` = `st`.`ItemId`))) left join `inventorymovement` `im` on((`i`.`Id` = `im`.`ItemId`))) left join `addressing` `ad` on((`ia`.`AddressingId` = `ad`.`Id`))) left join `addressingsinventorystart` `ais` on((`st`.`AddressingsInventoryStartId` = `ais`.`Id`))) group by `i`.`Id`,`i`.`Name`,`i`.`UnitOfMeasurement`,`im`.`MovementDate`,`st`.`StockTakingDate`,`ia`.`Id`,`st`.`Id`,`im`.`Id` order by `i`.`Id` */;
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

-- Dump completed on 2023-07-11  9:41:01