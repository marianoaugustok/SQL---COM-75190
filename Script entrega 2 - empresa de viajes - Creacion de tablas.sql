DROP SCHEMA IF EXISTS gestionViajes;
CREATE SCHEMA gestionViajes; 	/*Creo mi DB*/
USE gestionViajes;				/*Uso mi DB*/

/*--------------------------------------------------------------------Creo tablas--------------------------------------------------------------------*/  
CREATE TABLE empleado(
	id_empleado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_sucursal INT NOT NULL,
    nombre_apellido VARCHAR(100) NOT NULL
);
CREATE TABLE sucursal(
	id_sucursal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ubicacion VARCHAR(100) NOT NULL,
    cantidad_empleados INT
);
CREATE TABLE destino(
	id_destino INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
    excursiones VARCHAR(100) NOT NULL,
    meses_temporada_alta VARCHAR(100),
    meses_temporada_baja VARCHAR(100)
);
CREATE TABLE hospedaje(
	id_hospedaje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_destino VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100)  NOT NULL
);
ALTER TABLE hospedaje 
MODIFY COLUMN id_destino INT NOT NULL;  -- Correccion de data type (1er entrega), no puede ser un VARCHAR un id. Tampoco coincide en la FK de HOSPEDAJE TABLE.
CREATE TABLE vuelo(
	id_vuelo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_destino INT NOT NULL,
    fecha DATE NOT NULL,
    destino VARCHAR(100) NOT NULL,
    escalas INT NOT NULL
);
CREATE TABLE paquete(
	id_paquete INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_vuelo INT NOT NULL,
    id_hospedaje INT NOT NULL,
    excursiones  VARCHAR(100) NOT NULL
);
CREATE TABLE gestion(
	id_gestion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_paquete INT,
    cantidad_pasajeros INT NOT NULL,
    nombre_apellido_cliente VARCHAR(100) NOT NULL
);
CREATE TABLE auditoria(
	id_auditoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_gestion INT NOT NULL,
    accion VARCHAR(200) NOT NULL,
    dato VARCHAR(100) NOT NULL,
    usuario VARCHAR(30) NOT NULL,
    fecha DATETIME
);
ALTER TABLE empleado ADD CONSTRAINT fk_idSucursal_empleado
	FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal);
ALTER TABLE hospedaje ADD CONSTRAINT fk_idDestino_hospedaje
	FOREIGN KEY (id_destino) REFERENCES destino (id_destino);
ALTER TABLE vuelo ADD CONSTRAINT fk_idDestino_vuelo
	FOREIGN KEY (id_destino) REFERENCES destino (id_destino);    
ALTER TABLE paquete ADD CONSTRAINT fk_idVuelo_paquete
	FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo);
ALTER TABLE paquete ADD CONSTRAINT fk_idHospedaje_paquete
	FOREIGN KEY (id_hospedaje) REFERENCES hospedaje (id_hospedaje);
ALTER TABLE gestion ADD CONSTRAINT fk_idPaquete_gestion
	FOREIGN KEY (id_paquete) REFERENCES paquete (id_paquete);
ALTER TABLE auditoria ADD CONSTRAINT fk_idGestion_auditoria
	FOREIGN KEY (id_gestion) REFERENCES gestion (id_gestion);
/*--------------------------------------------------------------------Fin de creacion de tablas--------------------------------------------------------------------  
*   
*  
*
*
*
--------------------------------------------------------------------Creo mis funciones-------------------------------------------------------------------*/
/*Funcion nro 1: Ingreso id_ubicacion y recibo el nombre de la misma*/
DELIMITER //
CREATE FUNCTION fc_retorno_ubi(param1 INT)
RETURNS VARCHAR (100) DETERMINISTIC
BEGIN
	DECLARE var1  INT;
    SET var1 = param1;
    RETURN
	(
	   SELECT nombre
	   FROM destino
	   WHERE id_destino = var1
	);
END;
//
DELIMITER ;
/*Fin de Funcion nro 1*/

/*Funcion nro 2: Ingreso id_hospedaje y a traves de la tabla destino, recibo el nombre de la excursion (anidamiento)*/
DELIMITER //
CREATE FUNCTION fc_retorno_excursion(param1 INT)
RETURNS VARCHAR (100) DETERMINISTIC
BEGIN
	DECLARE var1  INT;
    DECLARE var2  INT;
    SET var1 = param1;
    SET var2 = (SELECT id_destino
	   FROM hospedaje
	   WHERE id_hospedaje = var1);
    RETURN
	(
	   SELECT excursiones
	   FROM destino
	   WHERE id_destino = var2
	);
END;
//
DELIMITER ;
/*Fin de Funcion nro 2*/

/*Funcion nro 3: Ingreso nombre y apellido de gestion y si fueron modificados, recibo sus valores anteriores y actuales*/
DELIMITER //
CREATE FUNCTION fc_cambio_nom(param1 VARCHAR(100), param2 VARCHAR(100))
RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
	CASE
	  WHEN param1 = param2 then RETURN '';
	  ELSE RETURN CONCAT('nombre ant: ', param1, ' -> ', 'nombre act: ', param2, ';');
	END CASE;
END;
//
DELIMITER ;
/*Fin de Funcion nro 3*/

/*Funcion nro 4: Ingreso id_paquete de gestion y si fue modificado, recibo sus valores anterores y actuales*/
DELIMITER //
CREATE FUNCTION fc_cambio_pas(param1 INT, param2 INT)
RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
	CASE
	  WHEN param1 = param2 then RETURN '';
	  ELSE RETURN CONCAT('cant. pasaj. ant: ', param1, ' -> ', 'cant. pasaj. act: ', param2, ';');
	END CASE;
END;
//
DELIMITER ;
/*Fin de Funcion nro 4*/
/*--------------------------------------------------------------------Fin de funciones--------------------------------------------------------------------  
*   
*  
*
*
*
--------------------------------------------------------------------Creo mis triggers--------------------------------------------------------------------*/  
/*-- Trigger nr1: Agrego un registro en la tabla Auditoria para mostrar cuando se agrega un nuevo registro en la tabla gestion  --*/  
DELIMITER //
CREATE TRIGGER Tr_agrega_reg
AFTER INSERT ON gestion
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (id_auditoria, id_gestion, accion, dato, usuario, fecha)
    VALUES (NULL, new.id_gestion, 'INSERTED REGISTER', '', USER(), NOW());
END;
//
DELIMITER ;
/*--------- Fin de Trigger nro1 ----------------*/

/*-- Trigger nr2: Agrego un registro en la tabla Auditoria para mostrar cuando se modifica un registro en la tabla gestion  --*/  
DELIMITER //
CREATE TRIGGER Tr_modifico_reg
AFTER UPDATE ON gestion
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (id_auditoria, id_gestion, accion, dato, usuario, fecha)
    VALUES (NULL, old.id_gestion, Concat('ALTERED REGISTER: ', fc_cambio_nom(old.nombre_apellido_cliente,new.nombre_apellido_cliente), ' ', fc_cambio_pas(old.cantidad_pasajeros, new.cantidad_pasajeros)), '', USER(), NOW());
END;
//
DELIMITER ;
/*--------- Fin de Trigger nro2 ----------------*/
/*--------------------------------------------------------------------Fin de triggers--------------------------------------------------------------------  
*   
*  
*
*
*
-------------------------------------------------------------------- Creo mis vistas--------------------------------------------------------------------*/
/* Vista nro 1: RRHH controla los empleados con sus identificaciones y la sucursal donde trabajan*/
CREATE OR REPLACE VIEW VW_Rrhh AS
SELECT em.id_empleado, em.nombre_apellido, suc.ubicacion AS ubicacion_sucursal
FROM empleado em
	INNER JOIN sucursal suc ON (suc.id_sucursal = em.id_sucursal);
/*--------- Fin de Vista nro1 ----------------*/

/* Vista nro 2: Los empleados del sector de ventas que vendan paquetes de viajes, solo podran acceder a determinados datos */
CREATE OR REPLACE VIEW VW_Ventas_paq AS
SELECT paq.id_paquete, vue.destino AS destino, vue.fecha AS fecha_vuelo, hos.nombre AS hospedaje, paq.excursiones
FROM paquete paq
	INNER JOIN vuelo vue ON (vue.id_vuelo = paq.id_vuelo )
	INNER JOIN hospedaje hos ON (hos.id_hospedaje = paq.id_hospedaje);
/*--------- Fin de Vista nro2 ----------------*/

/* Vista nro 3: La gerencia puede acceder a la tabla de auditoria */
CREATE OR REPLACE VIEW VW_Gerencia AS
SELECT *
FROM auditoria;
/*--------- Fin de Vista nro3 ----------------*/
/*--------------------------------------------------------------------Fin de vistas--------------------------------------------------------------------
*   
*  
*
*
*
--------------------------------------------------------------------Creo mis procedures--------------------------------------------------------------------*/
/* Procedure nro 1: El vendedor recibe una tabla con los meses de temporada baja y alta del destino que el cliente solicita averiguar */
DELIMITER //
CREATE PROCEDURE Pr_temporada_dest(IN param1 VARCHAR(100))
BEGIN
	SELECT  meses_temporada_alta, meses_temporada_baja
    FROM destino
    WHERE nombre = param1;
END;
//
DELIMITER ;
/*--------- Fin de Procedure nro1 ----------------*/

/* Procedure nro 2: El vendedor consulta el nombre y apellido de un cliente y recibe una tabla con un resumen de su paquete*/
DELIMITER //
CREATE PROCEDURE Pr_paquete_por_nombre(IN param1 VARCHAR(100))
BEGIN
	SELECT ge.id_paquete, ge.nombre_apellido_cliente, vue.fecha AS Fecha, hos.ubicacion AS Destino, hos.nombre AS Hospedaje,ge.cantidad_pasajeros AS Pasajeros, paq.excursiones
	FROM gestion ge
	INNER JOIN paquete paq ON (ge.id_paquete = paq.id_paquete)
	INNER JOIN hospedaje hos ON (paq.id_hospedaje = hos.id_hospedaje)
    INNER JOIN vuelo vue ON (paq.id_vuelo = vue.id_vuelo)
	WHERE ge.nombre_apellido_cliente = param1;
END;
//
DELIMITER ;
/*--------- Fin de Procedure nro2 ----------------*/
/*---------------------------------------------------------------------Fin de procedures--------------------------------------------------------------------*/  

