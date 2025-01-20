
INSERT INTO proveedor (
    nombre, 
    calle, 
    numero, 
    piso, 
    puerta, 
    ciudad, 
    codigo_postal, 
    pais, 
    telefono, 
    fax, 
    nif
) VALUES
    ('Apple Inc.', 'Infinite Loop', '1', '1', 'A', 'Cupertino', '95014', 'USA', '+14085551234', '+14085551235', 'A123456789'),
    ('Nike', 'One Bowerman Drive', '4', '2', 'B', 'Beaverton', '97005', 'USA', '+15033567890', '+15033567891', 'N987654321'),
    ('Tesla Inc.', '3500 Deer Creek Road', '2', '3', 'C', 'Palo Alto', '94304', 'USA', '+16505551234', '+16505551235', 'T123456789'),
    ('Microsoft', 'One Microsoft Way', '7', '1', 'D', 'Redmond', '98052', 'USA', '+14252811234', '+14252811235', 'M123456789'),
    ('Amazon', '410 Terry Avenue North', '6', '5', 'E', 'Seattle', '98109', 'USA', '+12065551234', '+12065551235', 'AM123456789');

INSERT INTO marca (
    nombre,
    id_proveedor
) VALUES
    ('Ray-Ban', 1),
    ('Oakley', 2),
    ('Maui Jim', 3),
    ('Gucci', 4),
    ('Prada', 5);

INSERT INTO ulleres (
    id_marca, 
    graduacion_izquierda, 
    graduacion_derecha, 
    tipo_montura, 
    color_montura, 
    color_vidrio_izquierdo, 
    color_vidrio_derecho, 
    precio
) VALUES
    (1, 1.50, 1.50, 'Pasta', 'Negra', 'Transparente', 'Transparente', 120.50),
    (2, 2.00, 2.00, 'Metallica', 'Negro', 'Verde', 'Verde', 250.00),
    (3, 1.75, 1.75, 'Floating', 'Dorado', 'Azul', 'Azul', 300.00),
    (4, 2.25, 2.25, 'Pasta', 'Plata', 'Transparente', 'Transparente', 180.75),
    (5, 1.00, 1.00, 'Metallica', 'Plata', 'Gris', 'Gris', 215.60);



INSERT INTO client (
    nombre, 
    apellido_1, 
    apellido_2, 
    direccion, 
    telefono, 
    correo, 
    fecha_registro,
    recomendado_por
) VALUES
    ('Leonardo', 'DiCaprio', 'DiCaprio', 'Hollywood Blvd, Los Angeles', '+13234567890', 'leonardo@email.com', '2024-01-01', NULL),
    ('Taylor', 'Swift', NULL, 'Beverly Hills, Los Angeles', '+13234567891', 'taylor.swift@email.com', '2024-01-02', 1),
    ('Dwayne', 'Johnson', 'Johnson', 'Miami, Florida', '+13234567892', 'dwayne.johnson@email.com', '2024-01-03', 2),
    ('Beyoncé', 'Knowles', 'Carter', 'Parkwood Drive, Los Angeles', '+13234567893', 'beyonce@email.com', '2024-01-04', 1),
    ('Elon', 'Musk', NULL, 'SpaceX Road, Hawthorne', '+13234567894', 'elon.musk@email.com', '2024-01-05', 3);

-- UPDATE client 
-- SET recomendado_por = 2 
-- WHERE nombre = 'Juan' AND apellido_1 = 'Perez';

-- UPDATE client 
-- SET recomendado_por = 1 
-- WHERE nombre = 'Maria' AND apellido_1 = 'Lopez';

INSERT INTO empleado (
    nombre, 
    apellido_1, 
    apellido_2, 
    telefono, 
    correo, 
    direccion
) VALUES
    ('Emma', 'Watson', NULL, '+14251234567', 'emma.watson@email.com', 'London, England'),
    ('Chris', 'Hemsworth', NULL, '+14251234568', 'chris.hemsworth@email.com', 'Sydney, Australia'),
    ('Ariana', 'Grande', NULL, '+14251234569', 'ariana.grande@email.com', 'Los Angeles, USA'),
    ('Ryan', 'Reynolds', NULL, '+14251234570', 'ryan.reynolds@email.com', 'Vancouver, Canada'),
    ('Megan', 'Fox', NULL, '+14251234571', 'megan.fox@email.com', 'Los Angeles, USA');

INSERT INTO venta (
    fecha, 
    id_ulleres, 
    id_client, 
    id_empleado
) VALUES
    ('2024-01-01', 1, 1, 1),
    ('2024-01-02', 2, 2, 2),
    ('2024-01-03', 3, 3, 3),
    ('2024-01-04', 4, 4, 4),
    ('2024-01-05', 5, 5, 5);


-- check that they return correct results:
-- Optics:

-- List the total purchases of a customer/a.
SELECT c.id, CONCAT(c.nombre, ' ', c.apellido_1) AS cliente, SUM(u.precio) AS total_purchases FROM venta v JOIN client c ON v.id_client = c.id JOIN ulleres u ON v.id_ulleres = u.id GROUP BY c.id ORDER BY total_purchases DESC LIMIT 0, 1000;

-- List the  glasses an employee has sold for a year. //(2025)
SELECT e.id, CONCAT(e.nombre, ' ', e.apellido_1) AS empleado, u.id_marca, u.tipo_montura, COUNT(v.id) AS total_sold FROM venta v JOIN empleado e ON v.id_empleado = e.id JOIN ulleres u ON v.id_ulleres = u.id WHERE YEAR(v.fecha) = 2024 GROUP BY e.id, u.id_marca, u.tipo_montura ORDER BY total_sold DESC LIMIT 0, 1000;

-- List the various suppliers who have supplied glasses successfully sold by optics.
SELECT p.id AS supplier_id, p.nombre AS supplier_name, COUNT(v.id) AS glasses_sold FROM venta v JOIN ulleres u ON v.id_ulleres = u.id JOIN marca m ON u.id_marca = m.id JOIN proveedor p ON m.id_proveedor = p.id GROUP BY p.id, p.nombre;

