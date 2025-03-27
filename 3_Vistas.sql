USE gestionViajes;				/*Uso mi DB*/
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