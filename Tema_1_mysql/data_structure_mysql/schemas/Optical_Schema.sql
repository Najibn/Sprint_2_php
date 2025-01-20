DROP DATABASE IF EXISTS Cul_d_Ampolla;
CREATE DATABASE Cul_d_Ampolla CHARACTER SET utf8mb4;
USE Cul_d_Ampolla;


-- //tables supplier.
CREATE TABLE proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    calle VARCHAR(100),
    numero VARCHAR(100),
    piso VARCHAR(100),
    puerta VARCHAR(100),
    ciudad VARCHAR(500),
    codigo_postal VARCHAR(20),
    pais VARCHAR(50),
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(25) NOT NULL
);
-- product table glasses (adjusted with fk ID_Marca)
CREATE TABLE ulleres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT NOT NULL,
    graduacion_izquierda DECIMAL(4,2),
    graduacion_derecha DECIMAL(4,2),
    tipo_montura ENUM("Floating", "Pasta", "Metallica") NOT NULL,
    color_montura VARCHAR(30),
    color_vidrio_izquierdo VARCHAR(30),
    color_vidrio_derecho VARCHAR(30),
    precio DECIMAL(9,2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES Marca(id)
);

-- brand table (added table for strict branding to a supplier(ID_Proveedor) )
CREATE TABLE marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id)
);

-- customers table (maintained apellido repetion)
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    apellido_1 VARCHAR(30) NOT NULL,
    apellido_2 VARCHAR(30) NULL,
    direccion VARCHAR(250),
    telefono VARCHAR(20),
    correo VARCHAR(170),
    fecha_registro DATE NOT NULL,
    recomendado_por INT,
    FOREIGN KEY (recomendado_por) REFERENCES client(id)
);


-- //employee table
CREATE TABLE empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    apellido_1 VARCHAR(150) NOT NULL,
    apellido_2 VARCHAR(30) NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(250)
);

-- //sales table
CREATE TABLE venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_ulleres INT NOT NULL,
    id_client  INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_ulleres)  REFERENCES ulleres(id),
    FOREIGN KEY (id_client)   REFERENCES client(id),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id)
);