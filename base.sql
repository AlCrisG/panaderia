CREATE DATABASE  IF NOT EXISTS `panaderia` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `panaderia`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: panaderia
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `ApellidoPat` varchar(20) NOT NULL,
  `ApellidoMat` varchar(45) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `LugarNacimiento` varchar(45) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Colonia` varchar(30) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Teléfono` varchar(10) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `Contraseña` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Mauricio','Benítez','Sevilla','2025-11-11','2000-01-01','Morelia','Av. Madero Ote 454','Centro','Morelia','4433221144','admin','admin','123'),(2,'Juan','Hernández','Pérez','2025-12-09','1997-06-26','Uruapan, Mich.','Juan Escutia 90','Chapultepec Nte.','Morelia','4434937697','empleado',NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradamateria`
--

DROP TABLE IF EXISTS `entradamateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradamateria` (
  `Folio` int NOT NULL AUTO_INCREMENT,
  `ID_Materia` int NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `Costo` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Folio`),
  KEY `fk_MovimientoMateria_MateriaPrima1_idx` (`ID_Materia`),
  CONSTRAINT `fk_MovimientoMateria_MateriaPrima1` FOREIGN KEY (`ID_Materia`) REFERENCES `materiaprima` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradamateria`
--

LOCK TABLES `entradamateria` WRITE;
/*!40000 ALTER TABLE `entradamateria` DISABLE KEYS */;
INSERT INTO `entradamateria` VALUES (1,1,'2025-12-08',1,1.00);
/*!40000 ALTER TABLE `entradamateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loteproducción`
--

DROP TABLE IF EXISTS `loteproducción`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loteproducción` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `ID_Empleado` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_LoteProducción_Producto1_idx` (`ID_Producto`),
  KEY `fk_LoteProducción_Empleado1_idx` (`ID_Empleado`),
  CONSTRAINT `fk_LoteProducción_Empleado1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID`),
  CONSTRAINT `fk_LoteProducción_Producto1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loteproducción`
--

LOCK TABLES `loteproducción` WRITE;
/*!40000 ALTER TABLE `loteproducción` DISABLE KEYS */;
INSERT INTO `loteproducción` VALUES (1,'2025-12-10',1,1,10);
/*!40000 ALTER TABLE `loteproducción` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Código` varchar(8) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Existencia` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Código_UNIQUE` (`Código`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,'MAT-001','Harina de Trigo',10.6),(2,'MAT-002','Azúcar Std',6.95),(3,'MAT-003','Mantequilla',4.8),(4,'MAT-004','Levadura',7.99),(5,'MAT-005','Leche Entera',8.95),(6,'MAT-006','Sal Refinada',7.995),(7,'MAT-007','Agua Purificada',19.85),(8,'MAT-008','Manteca Vegetal',12),(9,'MAT-009','Huevo Fresco',6.98);
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Código` varchar(8) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Existencia` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Código_UNIQUE` (`Código`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'PAN-001','Cuernito',5),(2,'PAN-002','Concha',10),(3,'PAN-003','Bolillo',20),(4,'PAN-004','Dona',6),(5,'PAN-005','Bisquet',8);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `ID_Producto` int NOT NULL,
  `ID_MateriaPrima` int NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`ID_Producto`,`ID_MateriaPrima`),
  KEY `fk_Formulación_MateriaPrima1_idx` (`ID_MateriaPrima`),
  CONSTRAINT `fk_Formulación_MateriaPrima1` FOREIGN KEY (`ID_MateriaPrima`) REFERENCES `materiaprima` (`ID`),
  CONSTRAINT `fk_Formulación_Producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,1,0.4),(1,2,0.05),(1,3,0.2),(1,4,0.01),(1,5,0.05),(1,6,0.005),(1,7,0.15),(1,9,0.02),(2,1,0.5),(2,2,0.2),(2,3,0.03),(2,4,0.015),(2,5,0.1),(2,6,0.005),(2,8,0.1),(2,9,0.08),(3,1,0.6),(3,2,0.01),(3,4,0.02),(3,6,0.015),(3,7,0.35),(4,1,0.35),(4,2,0.08),(4,4,0.02),(4,6,0.005),(4,7,0.1),(4,8,0.1),(4,9,0.05),(5,1,0.5),(5,2,0.05),(5,3,0.15),(5,4,0.02),(5,5,0.1),(5,6,0.005),(5,9,0.1);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidaproducto`
--

DROP TABLE IF EXISTS `salidaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidaproducto` (
  `Folio` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `Precio` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Folio`),
  KEY `fk_MovimientoProducto_Producto1_idx` (`ID_Producto`),
  CONSTRAINT `fk_MovimientoProducto_Producto1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidaproducto`
--

LOCK TABLES `salidaproducto` WRITE;
/*!40000 ALTER TABLE `salidaproducto` DISABLE KEYS */;
INSERT INTO `salidaproducto` VALUES (1,1,'2025-12-09',10,10.00);
/*!40000 ALTER TABLE `salidaproducto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09 23:20:00
