-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: sprint_final_g4_v2
-- ------------------------------------------------------
-- Server version	8.0.25



DROP DATABASE IF EXISTS sprint_final_g4_v2;

CREATE DATABASE sprint_final_g4_v2;

USE sprint_final_g4_v2;

DROP USER if exists 'sprintg4'@'localhost';

CREATE USER 'sprintg4'@'localhost' IDENTIFIED BY 'pass12345';

GRANT ALL PRIVILEGES ON sprint_final_g4_v2.* TO 'sprintg4'@'localhost';

use sprint_final_g4_v2;





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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'cliente','uno','serena','cliente_1@gmail.com',111),(2,'cliente','dos','ovale','cliente_2@gmail.com',222),(3,'cliente','tres','coquimbo','cliente_3@gmail.com',333),(4,'cliente','cuatro','coquimbo','cliente_4@gmail.com',444),(5,'cliente','cinco','coquimbo','cliente_5@gmail.com',555),(6,'cliente','seis','coquimbo','cliente_6@gmail.com',666),(7,'cliente','siete','coquimbo','cliente_7@gmail.com',777),(8,'cliente','ocho','coquimbo','cliente_8@gmail.com',888);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'empleado','uno','gerente'),(2,'empleado','dos','telefonista'),(3,'empleado','tres','vendedor');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_de_pago`
--

DROP TABLE IF EXISTS `forma_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_de_pago` (
  `idforma_de_pago` int NOT NULL AUTO_INCREMENT,
  `tipo_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idforma_de_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_de_pago`
--

LOCK TABLES `forma_de_pago` WRITE;
/*!40000 ALTER TABLE `forma_de_pago` DISABLE KEYS */;
INSERT INTO `forma_de_pago` VALUES (1,'efectivo'),(2,'credito'),(3,'debito');
/*!40000 ALTER TABLE `forma_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pedido`
--

DROP TABLE IF EXISTS `forma_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pedido` (
  `idforma_pedido` int NOT NULL AUTO_INCREMENT,
  `tipo_forma_pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idforma_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pedido`
--

LOCK TABLES `forma_pedido` WRITE;
/*!40000 ALTER TABLE `forma_pedido` DISABLE KEYS */;
INSERT INTO `forma_pedido` VALUES (1,'telefono'),(2,'email'),(3,'redes sociales'),(4,'pagina web');
/*!40000 ALTER TABLE `forma_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_productos_empresa`
--

DROP TABLE IF EXISTS `pedido_productos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_productos_empresa` (
  `idpedido_productos_empresa` int NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(45) DEFAULT NULL,
  `productos_empresa_idproductos` int NOT NULL,
  `proveedores_rut_proveedor` int NOT NULL,
  `cantidades_solicitadas_proveedor` int DEFAULT NULL,
  `empleados_idempleado` int NOT NULL,
  PRIMARY KEY (`idpedido_productos_empresa`),
  KEY `fk_pedido_productos_empresa_productos_empresa1_idx` (`productos_empresa_idproductos`),
  KEY `fk_pedido_productos_empresa_proveedores1_idx` (`proveedores_rut_proveedor`),
  KEY `fk_pedido_productos_empresa_empleados1_idx` (`empleados_idempleado`),
  CONSTRAINT `fk_pedido_productos_empresa_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`),
  CONSTRAINT `fk_pedido_productos_empresa_productos_empresa1` FOREIGN KEY (`productos_empresa_idproductos`) REFERENCES `productos_empresa` (`idproductos`),
  CONSTRAINT `fk_pedido_productos_empresa_proveedores1` FOREIGN KEY (`proveedores_rut_proveedor`) REFERENCES `proveedores` (`rut_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_productos_empresa`
--

LOCK TABLES `pedido_productos_empresa` WRITE;
/*!40000 ALTER TABLE `pedido_productos_empresa` DISABLE KEYS */;
INSERT INTO `pedido_productos_empresa` VALUES (1,'5',1,1,5,1),(2,'2',2,1,4,1);
/*!40000 ALTER TABLE `pedido_productos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_clientes`
--

DROP TABLE IF EXISTS `pedidos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_clientes` (
  `idpedido_clientes` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `monto_total` int DEFAULT NULL,
  `hora_pedido` time DEFAULT NULL,
  `idclientes` int NOT NULL,
  `idforma_pedido` int NOT NULL,
  `idforma_de_pago` int NOT NULL,
  `drepartidores` int NOT NULL,
  PRIMARY KEY (`idpedido_clientes`),
  KEY `fk_pedidos_clientes_clientes1_idx` (`idclientes`),
  KEY `fk_pedidos_clientes_forma_pedido1_idx` (`idforma_pedido`),
  KEY `fk_pedidos_clientes_forma_de_pago1_idx` (`idforma_de_pago`),
  KEY `fk_pedidos_clientes_repartidores1_idx` (`drepartidores`),
  CONSTRAINT `fk_pedidos_clientes_clientes1` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`),
  CONSTRAINT `fk_pedidos_clientes_forma_de_pago1` FOREIGN KEY (`idforma_de_pago`) REFERENCES `forma_de_pago` (`idforma_de_pago`),
  CONSTRAINT `fk_pedidos_clientes_forma_pedido1` FOREIGN KEY (`idforma_pedido`) REFERENCES `forma_pedido` (`idforma_pedido`),
  CONSTRAINT `fk_pedidos_clientes_repartidores1` FOREIGN KEY (`drepartidores`) REFERENCES `repartidores` (`idrepartidores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_clientes`
--

LOCK TABLES `pedidos_clientes` WRITE;
/*!40000 ALTER TABLE `pedidos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_clientes_has_productos_empresa`
--

DROP TABLE IF EXISTS `pedidos_clientes_has_productos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_clientes_has_productos_empresa` (
  `pedidos_clientes_idpedido_clientes` int NOT NULL,
  `productos_empresa_idproductos` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` int NOT NULL,
  `sub_total` int NOT NULL,
  PRIMARY KEY (`pedidos_clientes_idpedido_clientes`,`productos_empresa_idproductos`),
  KEY `fk_pedidos_clientes_has_productos_empresa_productos_empresa_idx` (`productos_empresa_idproductos`),
  KEY `fk_pedidos_clientes_has_productos_empresa_pedidos_clientes1_idx` (`pedidos_clientes_idpedido_clientes`),
  CONSTRAINT `fk_pedidos_clientes_has_productos_empresa_pedidos_clientes1` FOREIGN KEY (`pedidos_clientes_idpedido_clientes`) REFERENCES `pedidos_clientes` (`idpedido_clientes`),
  CONSTRAINT `fk_pedidos_clientes_has_productos_empresa_productos_empresa1` FOREIGN KEY (`productos_empresa_idproductos`) REFERENCES `productos_empresa` (`idproductos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_clientes_has_productos_empresa`
--

LOCK TABLES `pedidos_clientes_has_productos_empresa` WRITE;
/*!40000 ALTER TABLE `pedidos_clientes_has_productos_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_clientes_has_productos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_empresa`
--

DROP TABLE IF EXISTS `productos_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_empresa` (
  `idproductos` int NOT NULL AUTO_INCREMENT,
  `precio` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `stock` int DEFAULT 0,
  PRIMARY KEY (`idproductos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_empresa`
--

LOCK TABLES `productos_empresa` WRITE;
/*!40000 ALTER TABLE `productos_empresa` DISABLE KEYS */;
INSERT INTO `productos_empresa` VALUES (1,'100','computacion','negro','notebook','10'),(2,'100','computacion','negro','notebook','10'),(3,'200','electronica','negro','radio','50'),(4,'100','computacion','blanco','equipo torre','10'),(5,'100','computacion','negro','macbook pro','10'),(6,'200','electronica','negro','mp4','50'),(7,'100','computacion','blanco','all in one','10'),(8,'100','computacion','negro','notebook dell','10'),(9,'200','electronica','negro','mp3','50'),(10,'100','computacion','blanco','equipo torre','10'),(11,'100','computacion','negro','notebook','10'),(12,'200','electronica','negro','radio auto','50'),(13,'100','computacion','blanco','equipo torre','10'),(14,'100','computacion','negro','notebook','100'),(15,'200','electronica','negro','radio','50'),(16,'100','computacion','blanco','equipo torre','10'),(17,'100','computacion','negro','macbook pro','10'),(18,'200','electronica','negro','mp4','50'),(19,'100','computacion','blanco','all in one','10'),(20,'100','computacion','negro','notebook dell','10'),(21,'200','electronica','negro','mp3','50'),(22,'100','computacion','blanco','equipo torre','10'),(23,'100','computacion','negro','notebook','10'),(24,'200','electronica','negro','radio auto','50'),(25,'100','computacion','blanco','equipo torre','10');
/*!40000 ALTER TABLE `productos_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `rut_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_corporativo` varchar(45) DEFAULT NULL,
  `representante_legal` varchar(45) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `nombre_contacto` varchar(45) DEFAULT NULL,
  `categoria_giro_productos` varchar(45) DEFAULT NULL,
  `email_proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rut_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'empresa_1','gerente 1','111','222','vendedor','producto_electronico','empresa_1@gmail.com'),(2,'empresa_2','gerente_2','222','333','vendedor','producto_hogar','empresa_2@gmail.com'),(3,'empresa_1','gerente_1','111','222','vendedor','producto_electricista','empresa_1@gmail.com'),(4,'empresa_2','gerente_2','222','333','vendedor','producto_hogar','empresa_2@gmail.com'),(5,'empresa_3','gerente_3','333','444','vendedor','producto_construccion','empresa_3@gmail.com'),(6,'empresa_4','gerente_4','444','555','vendedor','producto_limpieza','empresa_4@gmail.com'),(7,'empresa_5','gerente_5','555','666','vendedor','producto_electronico','empresa_6@gmail.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `idrepartidores` int NOT NULL AUTO_INCREMENT,
  `nombre_repartidor` varchar(20) DEFAULT NULL,
  `apellido_repartidor` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrepartidores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
INSERT INTO `repartidores` VALUES (1,'repartidor','1',111,'repartidor_1@gmail.com'),(2,'repatidor','1',111,'repartidor_1@hotmail.com');
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05 22:32:06
