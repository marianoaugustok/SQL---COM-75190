USE gestionViajes;				/*Uso mi DB*/
/*-------------------------------------------------------------------Prueba de triggers --------------------------------------------------------------------*/
INSERT INTO gestion (id_gestion, id_paquete, cantidad_pasajeros, nombre_apellido_cliente) 
	VALUES 	(NULL, 1, 5, 'Pedro Zeballos');
/*--------------*/
UPDATE gestion
SET nombre_apellido_cliente = 'Juan Janson'
WHERE id_gestion = 10;
/*--------------*/
UPDATE gestion
SET cantidad_pasajeros = 1
WHERE id_gestion = 5;
/*--------------*/
UPDATE gestion
SET cantidad_pasajeros = 4, nombre_apellido_cliente = 'Pedro Ruiz'
WHERE id_gestion = 6;
 /*-------------*/ 
SELECT * FROM gestion; 
SELECT * FROM auditoria; 