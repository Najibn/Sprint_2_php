
INSERT INTO client (nom, cognom1, cognom2, adreca, codi_postal, localitat, provincia, telefono)
 VALUES
    ('Joan', 'Martinez', 'Garcia', 'Carrer Gran, 15', '08001', 'Barcelona', 'Barcelona', '612345678'),
    ('Maria', 'García', 'Mendaz', 'Carrer del Mar 23', '08001', 'Barcelona', 'Barcelona', '634567890'),
    ('Joana', 'Martinez', 'Silva', 'Avinguda Diagonal 145', '08018', 'Barcelona', 'Barcelona', '612345678'),
    ('Pepe', 'Soler', 'Pujol', 'Carrer Mallorca 67', '08029', 'Barcelona', 'Barcelona', '698765432'),
    ('Anna', 'Ferrera', 'Vidal', 'Passeig de Gràcia 89', '08008', 'Barcelona', 'Barcelona', '645678901'),
    ('San-Jordi', 'Riera', 'Costa', 'Carrer València 234', '08007', 'Barcelona', 'Barcelona', '678901234'),
    ('Mariana', 'Lopez', NULL, 'Avinguda Diagonal, 45', '08029', 'Barcelona', 'Barcelona', '633456789');


INSERT INTO botiga (adreca, codi_postal, localitat, provincia) 
VALUES
    ('Carrer de la Pau, 10', '08002', 'Barcelona', 'Barcelona'),
    ('Avinguda Catalunya, 120', '08020', 'Barcelona', 'Barcelona'),
    ('Carrer Gran de Gràcia 122', '08012', 'Palamos', 'Barcelona'),
    ('Rambla Catalunya 45', '08007', 'Barcelona', 'Barcelona'),
    ('Carrer Balmes 89', '08008', 'Barcelona', 'Sabadell');


INSERT INTO Empleat (nom, cognoms, nif, telefon, rol, id_botiga) 
VALUES
    ('Carlos', 'Sánchez', '12345678A', '601234567', 'cook', 1),
    ('Marc', 'López Serra', '46789012B', '678123456', 'cook', 1),
    ('Laura', 'Vila Martí', '34567890C', '645789012', 'Repartidor', 1),
    ('Pau', 'Casals Roca', '23456789D', '634567890', 'cook', 2),
    ('Clara', 'Puig Font', '12345678E', '612345678', 'Repartidor', 2),
    ('Alex', 'Mir Costa', '89012345F', '698765432', 'cook', 3),
    ('Ana', 'Gomez', '87654321B', '609876543', 'Repartidor', 2);

INSERT INTO Producte (Nom, Descripcio, Imatge, Preu)
VALUES
    ('Coca-Cola', 'Bebida refrescante', 'https://example.com/coca-cola.jpg', 1.50),
    ('CoKE', 'Bebida ENERGIA', 'https://example.com/coca-cola.jpg', 1.80),
    ('Patates Fregides', 'Patates fritas crujientes', 'https://example.com/patates.jpg', 2.00);

-- ALTER TABLE Producte
-- ADD COLUMN Tipus ENUM('Drink', 'Pizza', 'Dessert', 'Side') NOT NULL;

INSERT INTO Producte (nom, descripcio, imatge, preu, tipus) 
VALUES
    ('Coca-Cola', 'Bebida refrescante', 'https://example.com/coca-cola.jpg', 1.50, 'bebidas'),
    ('CoKE', 'Bebida ENERGIA', 'https://example.com/coca-cola.jpg', 1.80, 'bebidas'),
    ('Patates Fregides', 'Patates fritas crujientes', 'https://example.com/patates.jpg', 2.00, 'acompanants');

INSERT INTO Pizza_Categoria (nom)
 VALUES
    ('Margarita'),
    ('Premium'),
    ('Especials'),
    ('Clàssiques'),
    ('Pepperoni'),
    ('Vegetariana');

INSERT INTO Pizza (nom, descripcio, imatge, preu, id_categoria, id_producte) 
VALUES
    ('Pizza basic', 'Pizza amb tomate, mozzarella y albahaca', 'https://demdem.com/pizza-margarita.jpg', 7.99, 1, 1),
    ('Pizza moderate', 'Pizza amb tomate, mozzarella y pepperoni', 'https://lemlem.com/pizza-pepperoni.jpg', 8.99, 2, 1),
    ('Pizza vege', 'Pizza con tomate, mozzarella, y verduras', 'https://example.com/pizza-vegetariana.jpg', 8.49, 3, 1),
    ('Margherita', 'Tomàquet, mozzarella i alfàbrega', 'margherita.jpg', 10.50, 1, 1),
    ('Quatre Formatges', 'Mozzarella, gorgonzola, parmesà i fontina', 'quattro.jpg', 13.95, 1, 1),
    ('Vegetal', 'Verdures de temporada i mozzarella', 'vegetal.jpg', 12.95, 2, 1),
    ('BBQ Pollastre', 'Pollastre, salsa BBQ i ceba', 'bbq.jpg', 14.50, 3, 1),
    ('Tòfona', 'Mozzarella, tòfona negra i ou', 'trufa.jpg', 18.95, 4, 1);


INSERT INTO Comanda (data_hora, tipus, quantitat_productes, preu_total, id_client, id_botiga, id_empleat, data_hora_lliurament) 
VALUES
    ('2024-12-20 12:30:00', 'Delivery', 2, 17.48, 1, 1, 1, '2024-12-20 13:00:00'),
    ('2024-03-15 19:30:00', 'Delivery', 3, 28.90, 1, 1, 2, '2024-03-15 20:15:00'),
    ('2024-03-15 20:00:00', 'takeAway', 2, 15.45, 2, 2, 3, '2024-03-15 20:30:00'),
    ('2024-03-16 13:15:00', 'Delivery', 4, 45.80, 3, 3, 5, '2024-03-16 14:00:00'),
    ('2024-03-16 19:45:00', 'takeAway', 2, 23.90, 4, 1, 1, '2024-03-16 20:15:00'),
    ('2024-12-20 13:00:00', 'takeAway', 3, 26.47, 2, 2, 2, NULL);


INSERT INTO Comanda_Producte (id_comanda, id_producte, quantitat)
VALUES
    (1, 2, 1),  -- Order Patates Fregides
    (2, 3, 1),  -- Order Pizza Vegetariana
    (1, 5, 1),  -- 1 Caesar Salad
    (2, 2, 2),  -- 2 Waters
    (3, 3, 2),  -- 2 Beers
    (3, 6, 1);  -- 1 Garlic Bread


      -- Insert data into Pizza table
INSERT INTO Pizza (Nom, Descripcio, Imatge, Preu, ID_Categoria, ID_Producte)
 VALUES
  ('Pizza Margarita', 'Tomato, mozzarella, and basil', 'margarita.jpg', 8.50, 1, 1),
  ('Pizza Pepperoni', 'Tomato, mozzarella, and pepperoni', 'pepperoni.jpg', 9.50, 2, 2),
  ('Pizza Vegetariana', 'Tomato, mozzarella, and vegetables', 'vegetariana.jpg', 9.00, 3, 3),
  ('Pizza BBQ', 'BBQ sauce, chicken, and onions', 'bbq.jpg', 10.00, 4, 4);

      -- Insert data into Comanda_Producte table
INSERT INTO Comanda_Producte (ID_Comanda, ID_Producte, Quantitat)
VALUES
    (1, 1, 2),  -- 2 Coca-Colas
    (1, 2, 1);  -- 1 Patates Fregides

-- ALTER TABLE Producte
-- ADD COLUMN Tipus ENUM('Drink', 'Pizza', 'Dessert', 'aSide') NOT NULL;


-- check that they return correct results:
-- Pizzeria:

-- Lists how many products of type “Drinks” have been sold in a given location.
SELECT  b.Localitat, p.Nom AS Drink_Name, SUM(cp.Quantitat) AS Total_Sold FROM Comanda c JOIN Comanda_Producte cp ON c.ID_Comanda = cp.ID_Comanda JOIN Producte p ON cp.ID_Producte = p.ID_Producte JOIN Botiga b ON c.ID_Botiga = b.ID_Botiga WHERE  p.Nom LIKE '%Drink%'  AND b.Localitat = 'sabadell' GROUP BY   b.Localitat, p.Nom;

-- Lists how many orders a given employee has placed.
--
SELECT e.ID_Empleat, e.Nom, e.Cognoms, e.Rol,b.Localitat as Store_Location,COUNT(c.ID_Comanda) as Total_Orders FROM Empleat e LEFT JOIN Comanda c ON e.ID_Empleat = c.ID_Empleat LEFT JOIN Botiga b ON e.ID_Botiga = b.ID_Botiga GROUP BY e.ID_Empleat, e.Nom, e.Cognoms, e.Rol, b.Localitat ORDER BY Total_Orders DESC;




