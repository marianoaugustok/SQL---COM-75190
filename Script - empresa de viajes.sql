CREATE SCHEMA gestionViajes; 	/*Creo mi DB*/
USE gestionViajes;				/*Uso mi DB*/

/*Creo mis tablas*/
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
	categoria INT NOT NULL,
    excursiones VARCHAR(100) NOT NULL,
    meses_temporada_alta VARCHAR(100),
    meses_temporada_baja VARCHAR(100)
);
CREATE TABLE hospedaje(
	id_hospedaje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_destino VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    categoria INT NOT NULL
);
CREATE TABLE vuelo(
	id_vuelo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_destino INT NOT NULL,
    fecha DATE NOT NULL,
    categoria INT NOT NULL,
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
    cantidad_pasajeros INT NOT NULL,
    nombre_apellido_cliente VARCHAR(100) NOT NULL
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
    
