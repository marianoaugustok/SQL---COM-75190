USE gestionViajes;				/*Uso mi DB*/
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