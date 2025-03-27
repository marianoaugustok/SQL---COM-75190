USE gestionViajes;				/*Uso mi DB*/
-- La idea es recuperar registros de empleados que dejan de formar parte de la compania
SET autocommit = 0;
START TRANSACTION;
DELETE FROM empleado
WHERE id_empleado= 1;
SELECT * FROM empleado; 
COMMIT;
-- Ingreso un nuevo empleado y recupero el registro
INSERT INTO empleado(id_empleado, id_sucursal, nombre_apellido)
VALUES (1, 3, 'Alfredo Cestares');

-- La idea del segundo TCL es la utilizacion de savepoints y rollbacks, utilizandolos en inserciones de registros
START TRANSACTION;
INSERT INTO empleado (id_empleado, id_sucursal, nombre_apellido) 
	VALUES 	(NULL, 9, 'Alfredo Fernandez'),
			(NULL, 7, 'Eugenia Perez'),
			(NULL, 5, 'Florencia Herrera'),
			(NULL, 8, 'Ernesto Gonzalez')
    ; 
SAVEPOINT ingresos_lunes;
INSERT INTO empleado (id_empleado, id_sucursal, nombre_apellido) 
	VALUES 	(NULL, 1, 'Roberto Citori'),
			(NULL, 5, 'Francisca Perez'),
			(NULL, 6, 'Sol Quevedo'),
			(NULL, 10, 'Alvaro Goura')
    ; 
SAVEPOINT ingresos_martes;
ROLLBACK TO SAVEPOINT ingresos_lunes;
-- ROLLBACK