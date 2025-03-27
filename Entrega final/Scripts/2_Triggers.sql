USE gestionViajes;				/*Uso mi DB*/
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