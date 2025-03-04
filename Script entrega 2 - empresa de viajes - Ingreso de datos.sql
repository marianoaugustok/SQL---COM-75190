USE gestionViajes;				/*Uso mi DB*/

/*--------------------------------------------------------------------Ingreso datos--------------------------------------------------------------------*/  
INSERT INTO sucursal (id_sucursal, ubicacion, cantidad_empleados) 
	VALUES 	(NULL, 'La Matanza', 5),
			(NULL, 'Palermo', 8),
			(NULL, 'Recoleta', 7),
			(NULL, 'Retiro', 5),
			(NULL, 'Villa Urquiza', 5),
			(NULL, 'Florencio Varela', 8),
			(NULL, 'Zarate', 2),
			(NULL, 'Campana', 3),
			(NULL, 'Ezeiza', 5),
			(NULL, 'Villa Lugano', 5)
    ; 
INSERT INTO destino (id_destino, nombre, excursiones, meses_temporada_alta, meses_temporada_baja) 
	VALUES 	(NULL, 'Mendoza', 'Rafting', 'Marzo', 'Junio'),
			(NULL, 'San Martin De Los Andes', 'Rapel', 'Junio', 'Julio'),
			(NULL, 'Cordoba', 'Trekking', 'Abril', 'Enero'),
			(NULL, 'Bariloche', 'Navegacion', 'Marzo', 'Diciembre'),
			(NULL, 'Buenos Aires', 'Museos', 'Febrero', 'Junio'),
			(NULL, 'Salta', 'Paracaidismo', 'Marzo', 'Julio'),
			(NULL, 'Rio Gallegos', 'Cayak', 'Enero', 'Junio'),
			(NULL, 'Jujuy', 'Ciclismo', 'Marzo', 'Noviembre'),
			(NULL, 'Santa Fe', 'Polo', 'Abril', 'Octubre'),
			(NULL, 'La Pampa', 'Running', 'Septiembre', 'Junio')			
    ; 
INSERT INTO empleado (id_empleado, id_sucursal, nombre_apellido) 
	VALUES 	(NULL, 5, 'Alfredo Vargas'),
			(NULL, 1, 'Eugenia Perez'),
			(NULL, 3, 'Juan Quintana'),
			(NULL, 4, 'Alvaro Fernandez'),
			(NULL, 1, 'Eugenia Perez'),
			(NULL, 3, 'Juan Quintana'),
			(NULL, 4, 'Alvaro Fernandez'),
			(NULL, 1, 'Eugenia Perez'),
			(NULL, 3, 'Juan Quintana'),
			(NULL, 4, 'Alvaro Fernandez')
    ; 
INSERT INTO hospedaje (id_hospedaje, id_destino, nombre, ubicacion) 
	VALUES 	(NULL, 1, 'Quorum Hotel', fc_retorno_ubi(1)),
			(NULL, 3, 'San Remo Hotel', fc_retorno_ubi(3)),
			(NULL, 1, 'Demetrio Hotel', fc_retorno_ubi(1)),
			(NULL, 5, 'Fix Hotel', fc_retorno_ubi(5)),
			(NULL, 7, 'Terrazas Hotel', fc_retorno_ubi(7)),
			(NULL, 7, 'Solar Hotel', fc_retorno_ubi(7)),
			(NULL, 9, 'La Belle Hotel', fc_retorno_ubi(9)),
			(NULL, 8, 'Santa Rosa Hotel', fc_retorno_ubi(8)),
			(NULL, 4, 'Calamuchita Hotel', fc_retorno_ubi(4)),
			(NULL, 6, 'Cabaña Las Seis Maravillas', fc_retorno_ubi(6))
    ; 
INSERT INTO vuelo (id_vuelo, id_destino, fecha, destino, escalas) 
	VALUES 	(NULL, 1, '2025-12-31', fc_retorno_ubi(5), 2),
			(NULL, 8, '2025-11-01', fc_retorno_ubi(1), 3),
			(NULL, 3, '2025-01-12', fc_retorno_ubi(6), 0),
			(NULL, 4, '2025-05-09', fc_retorno_ubi(4), 1),
			(NULL, 9, '2025-05-21', fc_retorno_ubi(3), 0),
			(NULL, 7, '2025-03-20', fc_retorno_ubi(7), 2),
			(NULL, 6, '2025-10-16', fc_retorno_ubi(2), 3),
			(NULL, 5, '2025-11-17', fc_retorno_ubi(10), 1),
			(NULL, 8, '2025-12-08', fc_retorno_ubi(8), 0),
			(NULL, 2, '2025-09-05', fc_retorno_ubi(9), 3)
    ; 
INSERT INTO paquete (id_paquete, id_vuelo, id_hospedaje, excursiones) 
	VALUES 	(NULL, 1, 10, fc_retorno_excursion(10)),
			(NULL, 9, 5, fc_retorno_excursion(5)),
			(NULL, 10, 7, fc_retorno_excursion(7)),
			(NULL, 2, 6, fc_retorno_excursion(6)),
			(NULL, 3, 4, fc_retorno_excursion(4)),
			(NULL, 8, 3, fc_retorno_excursion(3)),
			(NULL, 7, 2, fc_retorno_excursion(2)),
			(NULL, 2, 9, fc_retorno_excursion(9)),
			(NULL, 3, 1, fc_retorno_excursion(1)),
			(NULL, 4, 3, fc_retorno_excursion(3))
    ;
INSERT INTO gestion (id_gestion, id_paquete, cantidad_pasajeros, nombre_apellido_cliente) 
	VALUES 	(NULL, 4, 10, 'Juan Alvarez'),
			(NULL, 3, 1, 'Pedro Zeballos'),
			(NULL, 1, 2, 'Florencia Grande'),
			(NULL, 2, 2, 'Ramiro Fernandez'),
			(NULL, 9, 4, 'Alfredo Zafer'),
			(NULL, 8, 2, 'Marcelo Lopez'),
			(NULL, 10, 3, 'Camila Zuckerberg'),
			(NULL, 6, 4, 'Yamila Paez'),
			(NULL, 5, 1, 'Brenda Soles'),
			(NULL, 7, 5, 'Patricio Ramirez')
    ; 
/*------------------------------------------Fin de ingreso de datos------------------------------------------
*   
*  
*
*
*------------------------------------------Consulto datos------------------------------------------*/  
SELECT * FROM sucursal;
SELECT * FROM empleado;
SELECT * FROM destino;
SELECT * FROM hospedaje;
SELECT * FROM vuelo;
SELECT * FROM paquete;
SELECT * FROM gestion;
SELECT * FROM auditoria;
/*------------------------------------------Fin de consulta de datos------------------------------------------
*   
*  
*
*
*
-------------------------------------------------------------------Prueba de triggers --------------------------------------------------------------------*/
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
/*--------------------------------------------------------------------Fin de prueba de triggers--------------------------------------------------------------------  
*   
*  
*
*
*-------------------------------------------------------------------Prueba de vistas --------------------------------------------------------------------*/
SELECT * FROM Vw_Rrhh; 
SELECT * FROM Vw_Ventas_paq; 
SELECT * FROM Vw_Gerencia; 
/*--------------------------------------------------------------------Fin de prueba de vistas--------------------------------------------------------------------  
*   
*  
*
*
*-------------------------------------------------------------------Prueba de funciones --------------------------------------------------------------------*/
SELECT fc_retorno_ubi(1);
SELECT Fc_retorno_excursion(1);
SELECT fc_cambio_nom('Juan','Juan');
SELECT fc_cambio_nom('Juan','Pedro');
SELECT fc_cambio_pas(1,1);
SELECT fc_cambio_pas(1,2);
/*--------------------------------------------------------------------Fin de prueba de funciones--------------------------------------------------------------------  
*   
*  
*
*
*-------------------------------------------------------------------Prueba de procedures --------------------------------------------------------------------*/
CALL Pr_temporada_dest('Cordoba');
CALL Pr_paquete_por_nombre('Juan Alvarez');
/*--------------------------------------------------------------------Fin de prueba de procedures--------------------------------------------------------------------  */
