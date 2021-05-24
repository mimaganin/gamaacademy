CREATE DATABASE  IF NOT EXISTS `minhaloja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `minhaloja`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: minhaloja
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cidadesestados`
--

DROP TABLE IF EXISTS `cidadesestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidadesestados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidadesestados`
--

LOCK TABLES `cidadesestados` WRITE;
/*!40000 ALTER TABLE `cidadesestados` DISABLE KEYS */;
INSERT INTO `cidadesestados` VALUES (1,'Recife','PE'),(2,'São Paulo','SP'),(3,'Rio de Janeiro','RJ'),(4,'Ribeirão Preto','SP'),(5,'Belo Horizonte','MG');
/*!40000 ALTER TABLE `cidadesestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `whatsapp` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'anaferraz@gmail.com','anaferraz','Ana Ferraz',16981170295),(3,'joaofrancisco@gmail.com','joaofrancisco','João Francisco',11981176545),(4,'beatrizsilva@gmail.com','beatriz1234','Beatriz Silva',11987624563),(5,'pauloferreira@gmail.com','pauloferreira','Paulo Ferreira',11976534120),(6,'mariaabreu@gmail.com','mariaabreu','Maria Fernanda Abreu',16987620987),(7,'adrianacosta@gmail.com','adrianacosta','Adriana Costa',11986543219);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Papelaria'),(2,'Informática'),(3,'Games'),(4,'Escritório'),(5,'Smartphones'),(6,'Impressoras');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `tipologradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidadesestados` int NOT NULL,
  `cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcidadesestados_idx` (`cidadesestados`),
  KEY `fkcliente_idx` (`cliente`),
  CONSTRAINT `fkcidadesestados` FOREIGN KEY (`cidadesestados`) REFERENCES `cidadesestados` (`id`),
  CONSTRAINT `fkcliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'residencial','Monte Alegre','Rua','76','ap18','14098331','Vila Nova',2,2),(2,'comercial','Pacaembu','Avenida','1213','ap9','05001113','Higienópolis',2,3),(3,'comerciall','Independência','Avenida','909',NULL,'14035000','Alto da Boa Vista',4,4),(4,'residencial','Ernesto José','Travessa','98',NULL,'30110-001','Tirandentes',5,5),(5,'comercial','Jequitibá','Rua','652',NULL,'50010-010','Alvorada',1,6),(6,'residencial','Atlântica','Avenida','1872','ap 109, bloco 2','22021-001','Copacabana',3,7);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produtoid` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkprodutoid_idx` (`produtoid`),
  CONSTRAINT `fkprodutoid` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,5),(2,2,20),(3,3,5),(4,4,30),(5,5,5),(6,6,10),(7,7,10),(8,8,0),(9,9,0),(10,10,0),(11,11,3);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `pedidostatusid` int NOT NULL,
  `clienteid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkpedidosstatus_idx` (`pedidostatusid`),
  KEY `fkclientes_idx` (`clienteid`),
  CONSTRAINT `fkclienteid` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fkpedidosstatusid` FOREIGN KEY (`pedidostatusid`) REFERENCES `pedidosstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,2,'2021-02-15 00:00:00',1,2),(8,3,'2021-03-09 00:00:00',1,3),(9,4,'2021-03-09 00:00:00',1,3),(10,5,'2021-04-17 00:00:00',17,4),(11,6,'2021-04-18 00:00:00',17,5),(12,7,'2021-04-30 00:00:00',2,6),(13,8,'2021-05-03 00:00:00',5,7),(14,9,'2021-05-13 00:00:00',2,2),(15,10,'2021-05-19 00:00:00',17,3),(16,11,'2021-05-21 00:00:00',6,4),(17,12,'2021-05-22 00:00:00',4,5),(18,13,'2021-05-22 00:00:00',3,5),(19,14,'2021-05-18 00:00:00',16,6),(20,15,'2021-05-23 00:00:00',1,4);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosstatus`
--

DROP TABLE IF EXISTS `pedidosstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosstatus`
--

LOCK TABLES `pedidosstatus` WRITE;
/*!40000 ALTER TABLE `pedidosstatus` DISABLE KEYS */;
INSERT INTO `pedidosstatus` VALUES (1,'novo pedido'),(2,'cancelado'),(3,'aguardando pagamento'),(4,'pagamento autorizado'),(5,'pagamento negado'),(6,'em separação'),(16,'em transporte'),(17,'entregue');
/*!40000 ALTER TABLE `pedidosstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` varchar(45) NOT NULL,
  `disponivel` varchar(45) NOT NULL,
  `destaque` varchar(45) NOT NULL,
  `departamentoid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkdepartamento_idx` (`departamentoid`),
  CONSTRAINT `fkdepartamento` FOREIGN KEY (`departamentoid`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'IF001','Headphone Multilaser PH246','Headphone Bluetooth Pop preto PH246 Multilaser','145','sim','sim',2),(2,'PP002','Caderno Espiral Capa Dura Tilibra','Caderno 1/4 espiral capa dura 200fls Tilibra Preto','15','sim','nao',1),(3,'GM005','Console PlayStation 5 Branco','Console Playstation 5 Branco C/ Controle sem fio 825gb 8K','8419','sim','sim',3),(4,'ES010','Agenda Planner Preta 90fls Pombo','Agenda Planner semanal 96fl 16,8x24cm Matra preto Pombo','40','sim','sim',4),(5,'SM002','Smartphone Samsung Galaxy S20 Cinza','Smartphone Samsung Galaxy S20 Cinza 128GB, 8GB RAM','3600','sim','sim',5),(6,'IM003','Impressora Multifuncional Epson L4160','Impressora Multifuncional Epson EcoTank L4160 Tanque de Tinta Colorido Wi-Fi USB','1500','sim','nao',6),(7,'IF002','HD Externo Seagate 1TB','HD Externo Portátil 1TB USB 3.0 Seagate Expansion STEA100040','420','sim','nao',2),(8,'PP003','Lapiseira 0.7mm Cis','Lapiseira 0.7mm técnica TecnoCis +1 mina de grafite rosa Cis','11','nao','nao',1),(9,'ES011','Calculadora Científica Casio FX82','Calculadora científica 2nd Edition FX-82MS-2- Casio','60','nao','nao',4),(10,'IM004','Cartucho HP 664XL','Cartucho HP 664XL preto Original (F6V31AB) Para HP Deskjet 2136, 2676, 3776, 5076, 5276','125','nao','nao',6),(11,'GM006','Console XBOX Series X 1TB','Console Xbox Series X 1Tb Ssd Preto Blu-Ray 4K Uhd ','7600','sim','nao',3);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtospedido`
--

DROP TABLE IF EXISTS `produtospedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtospedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `precounitario` int NOT NULL,
  `quantidade` int NOT NULL,
  `precototal` int NOT NULL,
  `pedidoid` int NOT NULL,
  `produtoid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkpedidoid_idx` (`pedidoid`),
  KEY `fkpedidoid_idx1` (`produtoid`),
  CONSTRAINT `fkpedidoid` FOREIGN KEY (`pedidoid`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fkprodutospedidoid` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtospedido`
--

LOCK TABLES `produtospedido` WRITE;
/*!40000 ALTER TABLE `produtospedido` DISABLE KEYS */;
INSERT INTO `produtospedido` VALUES (2,145,2,290,2,1),(3,15,1,15,8,2),(4,8419,1,8419,9,3),(5,40,3,120,10,4),(6,3600,1,3600,11,5),(16,1500,1,1500,12,6),(17,420,2,840,13,7),(18,11,5,55,14,8),(19,60,1,60,15,9),(20,125,5,625,16,10),(21,7600,1,7600,17,11),(22,145,1,145,18,1),(23,40,1,40,19,4),(24,1500,1,1500,20,6);
/*!40000 ALTER TABLE `produtospedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'minhaloja'
--

--
-- Dumping routines for database 'minhaloja'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 22:44:46
