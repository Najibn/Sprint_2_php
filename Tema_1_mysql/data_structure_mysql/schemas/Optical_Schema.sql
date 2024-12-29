DROP DATABASE IF EXISTS Cul_d_Ampolla;
CREATE DATABASE Cul_d_Ampolla CHARACTER SET utf8mb4;
USE Cul_d_Ampolla;


-- //tables supplier.
CREATE TABLE Proveedor (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion_Calle VARCHAR(100),
    Direccion_Numero VARCHAR(100),
    Direccion_Piso VARCHAR(100),
    Direccion_Puerta VARCHAR(100),
    Direccion_Ciudad VARCHAR(500),
    Direccion_Codigo_Postal VARCHAR(20),
    Direccion_Pais VARCHAR(50),
    Telefono VARCHAR(20)NOT NULL,
    Fax VARCHAR(20),
    NIF VARCHAR(25) NOT NULL
);

-- product table 
CREATE TABLE Ulleres (
    ID_Ulleres INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Graduacion_Dret_Esquerre DECIMAL(4,2),
    Tipo_Montura ENUM("Floating", "Pasta", "Metallica") NOT NULL,
    Color_Montura VARCHAR(30),
    Color_Vidre_Derecho VARCHAR(30),
    Color_Vidre_Izquierdo VARCHAR(30),
    Precio DECIMAL(9,2) NOT NULL,
    ID_Proveedor INT NOT NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

-- customers table
CREATE TABLE Client (
    ID_Client INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Apellido_1 VARCHAR(30) NOT NULL,
    Apellido_2 VARCHAR(30)NULL,
    Direccion VARCHAR(250),
    Telefono VARCHAR(20),
    Correo VARCHAR(170),
    Fecha_Registro DATE NOT NULL,
    Recomendado_Por INT,
    FOREIGN KEY (Recomendado_Por) REFERENCES Client(ID_Client)
);



CREATE TABLE Empleado (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Apellido VARCHAR(150) NOT NULL,
    Apellido_2 VARCHAR(30)NULL,
    Telefono VARCHAR(20)NOT NULL,
    Correo VARCHAR(100)NOT NULL,
     Direccion VARCHAR(250)
);


CREATE TABLE Venta (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Ulleres INT NOT NULL,
    ID_Client INT NOT NULL,
    ID_Empleado INT NOT NULL,
    FOREIGN KEY (ID_Ulleres) REFERENCES Ulleres(ID_Ulleres),
    FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);