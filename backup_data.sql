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
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,1,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(2,2,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(3,3,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(4,4,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(5,5,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(6,6,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(7,7,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(8,8,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(9,9,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08'),(10,10,'INSERTED REGISTER','','root@localhost','2025-03-24 22:33:08');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (1,'Mendoza','Rafting','Marzo','Junio'),(2,'San Martin De Los Andes','Rapel','Junio','Julio'),(3,'Cordoba','Trekking','Abril','Enero'),(4,'Bariloche','Navegacion','Marzo','Diciembre'),(5,'Buenos Aires','Museos','Febrero','Junio'),(6,'Salta','Paracaidismo','Marzo','Julio'),(7,'Rio Gallegos','Cayak','Enero','Junio'),(8,'Jujuy','Ciclismo','Marzo','Noviembre'),(9,'Santa Fe','Polo','Abril','Octubre'),(10,'La Pampa','Running','Septiembre','Junio');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,3,'Alfredo Cestares'),(2,1,'Eugenia Perez'),(3,3,'Juan Quintana'),(4,4,'Alvaro Fernandez'),(5,1,'Eugenia Perez'),(6,3,'Juan Quintana'),(7,4,'Alvaro Fernandez'),(8,1,'Eugenia Perez'),(9,3,'Juan Quintana'),(10,4,'Alvaro Fernandez');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gestion`
--

LOCK TABLES `gestion` WRITE;
/*!40000 ALTER TABLE `gestion` DISABLE KEYS */;
INSERT INTO `gestion` VALUES (1,4,10,'Juan Alvarez'),(2,3,1,'Pedro Zeballos'),(3,1,2,'Florencia Grande'),(4,2,2,'Ramiro Fernandez'),(5,9,4,'Alfredo Zafer'),(6,8,2,'Marcelo Lopez'),(7,10,3,'Camila Zuckerberg'),(8,6,4,'Yamila Paez'),(9,5,1,'Brenda Soles'),(10,7,5,'Patricio Ramirez');
/*!40000 ALTER TABLE `gestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hospedaje`
--

LOCK TABLES `hospedaje` WRITE;
/*!40000 ALTER TABLE `hospedaje` DISABLE KEYS */;
INSERT INTO `hospedaje` VALUES (1,1,'Quorum Hotel','Mendoza'),(2,3,'San Remo Hotel','Cordoba'),(3,1,'Demetrio Hotel','Mendoza'),(4,5,'Fix Hotel','Buenos Aires'),(5,7,'Terrazas Hotel','Rio Gallegos'),(6,7,'Solar Hotel','Rio Gallegos'),(7,9,'La Belle Hotel','Santa Fe'),(8,8,'Santa Rosa Hotel','Jujuy'),(9,4,'Calamuchita Hotel','Bariloche'),(10,6,'Cabaña Las Seis Maravillas','Salta');
/*!40000 ALTER TABLE `hospedaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,1,10,'Paracaidismo'),(2,9,5,'Cayak'),(3,10,7,'Polo'),(4,2,6,'Cayak'),(5,3,4,'Museos'),(6,8,3,'Rafting'),(7,7,2,'Trekking'),(8,2,9,'Navegacion'),(9,3,1,'Rafting'),(10,4,3,'Rafting');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'La Matanza',5),(2,'Palermo',8),(3,'Recoleta',7),(4,'Retiro',5),(5,'Villa Urquiza',5),(6,'Florencio Varela',8),(7,'Zarate',2),(8,'Campana',3),(9,'Ezeiza',5),(10,'Villa Lugano',5);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,1,'2025-12-31','Buenos Aires',2),(2,8,'2025-11-01','Mendoza',3),(3,3,'2025-01-12','Salta',0),(4,4,'2025-05-09','Bariloche',1),(5,9,'2025-05-21','Cordoba',0),(6,7,'2025-03-20','Rio Gallegos',2),(7,6,'2025-10-16','San Martin De Los Andes',3),(8,5,'2025-11-17','La Pampa',1),(9,8,'2025-12-08','Jujuy',0),(10,2,'2025-09-05','Santa Fe',3);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 22:27:24
