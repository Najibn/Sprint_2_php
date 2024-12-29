CREATE DATABASE pizzeria;
USE pizzeria;


CREATE TABLE Client (
    ID_Client INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Cognom1 VARCHAR(50) NOT NULL,
     Cognom2 VARCHAR(50)  NULL,
    Adreça VARCHAR(250) NOT NULL,
    Codi_Postal VARCHAR(20) NOT NULL,
    Localitat VARCHAR(50) NOT NULL,
    Provincia VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

-- restaurant table 
CREATE TABLE Botiga (
    ID_Botiga INT AUTO_INCREMENT PRIMARY KEY,
    Adreça VARCHAR(255) NOT NULL,
    Codi_Postal VARCHAR(10) NOT NULL,
    Localitat VARCHAR(50) NOT NULL,
    Provincia VARCHAR(50) NOT NULL
);

-- employee table
CREATE TABLE Empleat (
    ID_Empleat INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Cognoms VARCHAR(50) NOT NULL,
    NIF VARCHAR(20) NOT NULL,
    Telefon VARCHAR(15) NOT NULL,
    Rol ENUM("cook", "Repartidor") NOT NULL,
    ID_Botiga INT NOT NULL,
    FOREIGN KEY (ID_Botiga) REFERENCES Botiga(ID_Botiga)
);

-- order table
CREATE TABLE Comanda (
    ID_Comanda INT AUTO_INCREMENT PRIMARY KEY,
    Data_Hora DATETIME NOT NULL,
    Tipus ENUM("Delivery", "takeAway") NOT NULL,
    Quantitat_Productes INT NOT NULL,
    Preu_Total DECIMAL(10, 2) NOT NULL,
    ID_Client INT NOT NULL,
    ID_Botiga INT NOT NULL,
    ID_Empleat INT,
    Data_Hora_Lliurament DATETIME,
    FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client),
    FOREIGN KEY (ID_Botiga) REFERENCES Botiga(ID_Botiga),
    FOREIGN KEY (ID_Empleat) REFERENCES Empleat(ID_Empleat)
);


CREATE TABLE Producte (
    ID_Producte INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Descripcio TEXT NOT NULL,
    Imatje VARCHAR(255),
    Preu DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Pizza_Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL
);


CREATE TABLE Pizza (
    ID_Pizza INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Descripcio TEXT NOT NULL,
    Imatge VARCHAR(255),
    Preu DECIMAL(10, 2) NOT NULL,
    ID_Categoria INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Pizza_Categoria(ID_Categoria)
);



CREATE TABLE Comanda_Producte (
    ID_Comanda INT NOT NULL,
    ID_Producte INT NOT NULL,
    Quantitat INT NOT NULL,
    PRIMARY KEY (ID_Comanda, ID_Producte),
    FOREIGN KEY (ID_Comanda) REFERENCES Comanda(ID_Comanda),
    FOREIGN KEY (ID_Producte) REFERENCES Producte(ID_Producte)
);


-- many-to-many relationship between orders and products and Comanda_Producte table