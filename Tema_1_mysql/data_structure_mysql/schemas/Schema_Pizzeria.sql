CREATE DATABASE pizzeria;
USE pizzeria;

-- Client table
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognom1 VARCHAR(50) NOT NULL,
    cognom2 VARCHAR(50) NULL,
    adreca VARCHAR(250) NOT NULL,
    codi_postal VARCHAR(20) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);


-- restaurant table 
CREATE TABLE botiga (
    id_botiga INT AUTO_INCREMENT PRIMARY KEY,
    adreca VARCHAR(255) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

-- employee table
CREATE TABLE Empleat (
    id_empleat INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(50) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    rol ENUM("cook", "repartidor") NOT NULL,
    id_botiga INT NOT NULL,
    FOREIGN KEY (id_botiga) REFERENCES botiga(id_botiga)
);


-- order table
CREATE TABLE Comanda (
    id_comanda INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    tipus ENUM("delivery", "takeaway") NOT NULL,
    quantitat_productes INT NOT NULL,
    preu_total DECIMAL(10, 2) NOT NULL,
    id_client INT NOT NULL,
    id_botiga INT NOT NULL,
    id_empleat INT,
    data_hora_lliurament DATETIME,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_botiga) REFERENCES botiga(id_botiga),
    FOREIGN KEY (id_empleat) REFERENCES empleat(id_empleat)
);

-- //added an enum of produc types on the producte table
CREATE TABLE Producte (
    id_producte INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    descripcio TEXT NOT NULL,
    imatge VARCHAR(255),
    preu DECIMAL(10, 2) NOT NULL,
    tipus ENUM('pizzas', 'bebidas', 'postres', 'acompanants') NOT NULL
);

CREATE TABLE Pizza_Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);


-- //adjusted a product type(id_producte)  to my pizza
CREATE TABLE Pizza (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    descripcio TEXT NOT NULL,
    imatge VARCHAR(255),
    preu DECIMAL(10, 2) NOT NULL,
    id_categoria INT NOT NULL,
    id_producte INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES pizza_categoria(id_categoria),
    FOREIGN KEY (id_producte) REFERENCES producte(id_producte) 
);

-- //connects the commanda (orders) and products(producte)
CREATE TABLE Comanda_Producte (
    id_comanda INT NOT NULL,
    id_producte INT NOT NULL,
    quantitat INT NOT NULL,
    PRIMARY KEY (id_comanda, id_producte),
    FOREIGN KEY (id_comanda) REFERENCES comanda(id_comanda),
    FOREIGN KEY (id_producte) REFERENCES producte(id_producte)
);
