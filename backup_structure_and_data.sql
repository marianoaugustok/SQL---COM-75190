-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gestionviajes
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_gestion` int NOT NULL,
  `accion` varchar(200) NOT NULL,
  `dato` varchar(100) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`),
  KEY `fk_idGestion_auditoria` (`id_gestion`),
  CONSTRAINT `fk_idGestion_auditoria` FOREIGN KEY (`id_gestion`) REFERENCES `gestion` (`id_gestion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,1,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(2,2,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(3,3,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(4,4,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(5,5,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(6,6,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(7,7,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(8,8,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(9,9,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(10,10,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `excursiones` varchar(100) NOT NULL,
  `meses_temporada_alta` varchar(100) DEFAULT NULL,
  `meses_temporada_baja` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (1,'Mendoza','Rafting','Marzo','Junio'),(2,'San Martin De Los Andes','Rapel','Junio','Julio'),(3,'Cordoba','Trekking','Abril','Enero'),(4,'Bariloche','Navegacion','Marzo','Diciembre'),(5,'Buenos Aires','Museos','Febrero','Junio'),(6,'Salta','Paracaidismo','Marzo','Julio'),(7,'Rio Gallegos','Cayak','Enero','Junio'),(8,'Jujuy','Ciclismo','Marzo','Noviembre'),(9,'Santa Fe','Polo','Abril','Octubre'),(10,'La Pampa','Running','Septiembre','Junio');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `nombre_apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_idSucursal_empleado` (`id_sucursal`),
  CONSTRAINT `fk_idSucursal_empleado` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,3,'Alfredo Cestares'),(2,1,'Eugenia Perez'),(3,3,'Juan Quintana'),(4,4,'Alvaro Fernandez'),(5,1,'Eugenia Perez'),(6,3,'Juan Quintana'),(7,4,'Alvaro Fernandez'),(8,1,'Eugenia Perez'),(9,3,'Juan Quintana'),(10,4,'Alvaro Fernandez');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion` (
  `id_gestion` int NOT NULL AUTO_INCREMENT,
  `id_paquete` int DEFAULT NULL,
  `cantidad_pasajeros` int NOT NULL,
  `nombre_apellido_cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`id_gestion`),
  KEY `fk_idPaquete_gestion` (`id_paquete`),
  CONSTRAINT `fk_idPaquete_gestion` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (1,4,10,'Juan Alvarez'),(2,3,1,'Pedro Zeballos'),(3,1,2,'Florencia Grande'),(4,2,2,'Ramiro Fernandez'),(5,9,4,'Alfredo Zafer'),(6,8,2,'Marcelo Lopez'),(7,10,3,'Camila Zuckerberg'),(8,6,4,'Yamila Paez'),(9,5,1,'Brenda Soles'),(10,7,5,'Patricio Ramirez');
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedaje`
--

DROP TABLE IF EXISTS `hospedaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedaje` (
  `id_hospedaje` int NOT NULL AUTO_INCREMENT,
  `id_destino` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_hospedaje`),
  KEY `fk_idDestino_hospedaje` (`id_destino`),
  CONSTRAINT `fk_idDestino_hospedaje` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedaje`
--

LOCK TABLES `hospedaje` WRITE;
/*!40000 ALTER TABLE `hospedaje` DISABLE KEYS */;
INSERT INTO `hospedaje` VALUES (1,1,'Quorum Hotel','Mendoza'),(2,3,'San Remo Hotel','Cordoba'),(3,1,'Demetrio Hotel','Mendoza'),(4,5,'Fix Hotel','Buenos Aires'),(5,7,'Terrazas Hotel','Rio Gallegos'),(6,7,'Solar Hotel','Rio Gallegos'),(7,9,'La Belle Hotel','Santa Fe'),(8,8,'Santa Rosa Hotel','Jujuy'),(9,4,'Calamuchita Hotel','Bariloche'),(10,6,'Cabaña Las Seis Maravillas','Salta');
/*!40000 ALTER TABLE `hospedaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `id_paquete` int NOT NULL AUTO_INCREMENT,
  `id_vuelo` int NOT NULL,
  `id_hospedaje` int NOT NULL,
  `excursiones` varchar(100) NOT NULL,
  PRIMARY KEY (`id_paquete`),
  KEY `fk_idVuelo_paquete` (`id_vuelo`),
  KEY `fk_idHospedaje_paquete` (`id_hospedaje`),
  CONSTRAINT `fk_idHospedaje_paquete` FOREIGN KEY (`id_hospedaje`) REFERENCES `hospedaje` (`id_hospedaje`),
  CONSTRAINT `fk_idVuelo_paquete` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo` (`id_vuelo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,1,10,'Paracaidismo'),(2,9,5,'Cayak'),(3,10,7,'Polo'),(4,2,6,'Cayak'),(5,3,4,'Museos'),(6,8,3,'Rafting'),(7,7,2,'Trekking'),(8,2,9,'Navegacion'),(9,3,1,'Rafting'),(10,4,3,'Rafting');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(100) NOT NULL,
  `cantidad_empleados` int DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'La Matanza',5),(2,'Palermo',8),(3,'Recoleta',7),(4,'Retiro',5),(5,'Villa Urquiza',5),(6,'Florencio Varela',8),(7,'Zarate',2),(8,'Campana',3),(9,'Ezeiza',5),(10,'Villa Lugano',5);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `id_vuelo` int NOT NULL AUTO_INCREMENT,
  `id_destino` int NOT NULL,
  `fecha` date NOT NULL,
  `destino` varchar(100) NOT NULL,
  `escalas` int NOT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `fk_idDestino_vuelo` (`id_destino`),
  CONSTRAINT `fk_idDestino_vuelo` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,1,'2025-12-31','Buenos Aires',2),(2,8,'2025-11-01','Mendoza',3),(3,3,'2025-01-12','Salta',0),(4,4,'2025-05-09','Bariloche',1),(5,9,'2025-05-21','Cordoba',0),(6,7,'2025-03-20','Rio Gallegos',2),(7,6,'2025-10-16','San Martin De Los Andes',3),(8,5,'2025-11-17','La Pampa',1),(9,8,'2025-12-08','Jujuy',0),(10,2,'2025-09-05','Santa Fe',3);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_gerencia`
--

DROP TABLE IF EXISTS `vw_gerencia`;
/*!50001 DROP VIEW IF EXISTS `vw_gerencia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gerencia` AS SELECT 
 1 AS `id_auditoria`,
 1 AS `id_gestion`,
 1 AS `accion`,
 1 AS `dato`,
 1 AS `usuario`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rrhh`
--

DROP TABLE IF EXISTS `vw_rrhh`;
/*!50001 DROP VIEW IF EXISTS `vw_rrhh`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rrhh` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre_apellido`,
 1 AS `ubicacion_sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_paq`
--

DROP TABLE IF EXISTS `vw_ventas_paq`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_paq`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_paq` AS SELECT 
 1 AS `id_paquete`,
 1 AS `destino`,
 1 AS `fecha_vuelo`,
 1 AS `hospedaje`,
 1 AS `excursiones`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'gestionviajes'
--
/*!50003 DROP FUNCTION IF EXISTS `fc_cambio_nom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_cambio_nom`(param1 VARCHAR(100), param2 VARCHAR(100)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	CASE
	  WHEN param1 = param2 then RETURN '';
	  ELSE RETURN CONCAT('nombre ant: ', param1, ' -> ', 'nombre act: ', param2, ';');
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_cambio_pas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_cambio_pas`(param1 INT, param2 INT) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	CASE
	  WHEN param1 = param2 then RETURN '';
	  ELSE RETURN CONCAT('cant. pasaj. ant: ', param1, ' -> ', 'cant. pasaj. act: ', param2, ';');
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_retorno_excursion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_retorno_excursion`(param INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE var  INT;
    SET var = (SELECT id_destino
	   FROM hospedaje
	   WHERE id_hospedaje = param);
    RETURN
	(
	   SELECT excursiones
	   FROM destino
	   WHERE id_destino = var
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_retorno_ubi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_retorno_ubi`(param INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN
	(
	   SELECT nombre
	   FROM destino
	   WHERE id_destino = param
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_paquete_por_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pr_paquete_por_nombre`(IN param1 VARCHAR(100))
BEGIN
	SELECT ge.id_paquete, ge.nombre_apellido_cliente, vue.fecha AS Fecha, hos.ubicacion AS Destino, hos.nombre AS Hospedaje,ge.cantidad_pasajeros AS Pasajeros, paq.excursiones
	FROM gestion ge
	INNER JOIN paquete paq ON (ge.id_paquete = paq.id_paquete)
	INNER JOIN hospedaje hos ON (paq.id_hospedaje = hos.id_hospedaje)
    INNER JOIN vuelo vue ON (paq.id_vuelo = vue.id_vuelo)
	WHERE ge.nombre_apellido_cliente = param1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pr_temporada_dest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pr_temporada_dest`(IN param1 VARCHAR(100))
BEGIN
	SELECT  meses_temporada_alta, meses_temporada_baja
    FROM destino
    WHERE nombre = param1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_gerencia`
--

/*!50001 DROP VIEW IF EXISTS `vw_gerencia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gerencia` AS select `auditoria`.`id_auditoria` AS `id_auditoria`,`auditoria`.`id_gestion` AS `id_gestion`,`auditoria`.`accion` AS `accion`,`auditoria`.`dato` AS `dato`,`auditoria`.`usuario` AS `usuario`,`auditoria`.`fecha` AS `fecha` from `auditoria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rrhh`
--

/*!50001 DROP VIEW IF EXISTS `vw_rrhh`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rrhh` AS select `em`.`id_empleado` AS `id_empleado`,`em`.`nombre_apellido` AS `nombre_apellido`,`suc`.`ubicacion` AS `ubicacion_sucursal` from (`empleado` `em` join `sucursal` `suc` on((`suc`.`id_sucursal` = `em`.`id_sucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_paq`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_paq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_paq` AS select `paq`.`id_paquete` AS `id_paquete`,`vue`.`destino` AS `destino`,`vue`.`fecha` AS `fecha_vuelo`,`hos`.`nombre` AS `hospedaje`,`paq`.`excursiones` AS `excursiones` from ((`paquete` `paq` join `vuelo` `vue` on((`vue`.`id_vuelo` = `paq`.`id_vuelo`))) join `hospedaje` `hos` on((`hos`.`id_hospedaje` = `paq`.`id_hospedaje`))) */;
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

-- Dump completed on 2025-03-26 22:19:35
