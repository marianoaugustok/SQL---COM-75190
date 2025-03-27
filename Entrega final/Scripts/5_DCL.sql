USE gestionViajes;				/*Uso mi DB*/
DROP USER IF EXISTS 'gerencia'@'localhost';
DROP USER IF EXISTS 'ventas'@'localhost';
-- Se crea el usuario 'gerencia' con permisos de solo lectura de registros de todas las tablas
CREATE USER 'gerencia'@'localhost' IDENTIFIED BY 'gerencia1100'; 
GRANT SELECT ON gestionViajes.empleado TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.sucursal TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.destino TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.hospedaje TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.vuelo TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.paquete TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.gestion TO 'gerencia'@'localhost';
GRANT SELECT ON gestionViajes.auditoria TO 'gerencia'@'localhost';

-- Se crea el usuario 'ventas' con permisos de lectura, modificacion e insercion de registros en todas las tablas
CREATE USER 'ventas'@'localhost' IDENTIFIED BY 'ventas1100'; 
GRANT SELECT, INSERT, UPDATE ON gestionViajes.empleado TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.sucursal TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.destino TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.hospedaje TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.vuelo TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.paquete TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.gestion TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE  ON gestionViajes.auditoria TO 'ventas'@'localhost';