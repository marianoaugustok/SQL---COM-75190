USE gestionViajes;				/*Uso mi DB*/
/*Funcion nro 1: Ingreso id_ubicacion y recibo el nombre de la misma*/
DELIMITER //
CREATE FUNCTION fc_retorno_ubi(param INT)
RETURNS VARCHAR (100) DETERMINISTIC
BEGIN
    RETURN
	(
	   SELECT nombre
	   FROM destino
	   WHERE id_destino = param
	);
END;
//
DELIMITER ;
/*Fin de Funcion nro 1*/

/*Funcion nro 2: Ingreso id_hospedaje y a traves de la tabla destino, recibo el nombre de la excursion (anidamiento)*/
DELIMITER //
CREATE FUNCTION fc_retorno_excursion(param INT)
RETURNS VARCHAR (100) DETERMINISTIC
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