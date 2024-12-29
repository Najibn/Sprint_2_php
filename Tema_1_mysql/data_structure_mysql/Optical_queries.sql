
INSERT INTO Proveedor (
    Nombre, 
    Direccion_Calle, 
    Direccion_Numero, 
    Direccion_Piso, 
    Direccion_Puerta, 
    Direccion_Ciudad, 
    Direccion_Codigo_Postal, 
    Direccion_Pais, 
    Telefono, 
    Fax, 
    NIF
) VALUES
    ('Proveedor A', 'Calle Ficticia', '123', '1', 'A', 'Ciudad Ficticia', '12345', 'Pais Ficticio', '123456789', '987654321', 'NIF123456789'),
    ('Proveedor B', 'Avenida Real', '456', '2', 'B', 'Ciudad Real', '67890', 'Pais Real', '234567890', '876543210', 'NIF987654321'),
    ('Luxottica Group', 'Calle Industrial', '45', '2', 'B', 'Barcelona', '08001', 'España', '+34931234567', '+34931234568', 'B12345678'),
    ('Safilo Group', 'Avenida Diagonal', '123', '4', 'A', 'Barcelona', '08028', 'España', '+34932345678', '+34932345679', 'B23456789'),
    ('Vision Lab SL', 'Calle Valencia', '78', '1', 'C', 'Madrid', '28001', 'España', '+34913456789', '+34913456780', 'B34567890');





INSERT INTO Ulleres (
    Marca,
    Graduacion_Dret_Esquerre,
    Tipo_Montura, 
    Color_Montura, 
    Color_Vidre_Derecho,
    Color_Vidre_Izquierdo,
    Precio, 
    ID_Proveedor)
VALUES
      ('Marca X', 1.50, 'Pasta', 'Negra', 'Transparente', 'Transparente', 100.50, 1),
      ('Ray-Ban', 2.25, 'Metallica', 'Negro', 'Transparente', 'Transparente', 159.99, 1),
      ('Oakley', 1.75, 'Pasta', 'Azul', 'Gris', 'Gris', 189.99, 1),
      ('Prada', NULL, 'Floating', 'Dorado', 'Verde', 'Verde', 249.99, 2),
      ('Gucci', 3.50, 'Metallica', 'Plateado', 'Transparente', 'Transparente', 299.99, 2),
      ('Nike', 1.25, 'Pasta', 'Negro', 'Azul', 'Azul', 149.99, 3),
      ('Marca Y', 2.00, 'Metallica', 'Plata', 'Verde', 'Verde', 150.75, 2);


INSERT INTO Client (
    Nombre,
    Apellido_1, 
    Apellido_2, 
    Direccion, 
    Telefono, 
    Correo, 
    Fecha_Registro, 
    Recomendado_Por)
VALUES
      ('Harry', 'Potter',null,'johnsons street  USA 10' , '33244785789','potter.@email.com', '2023-01-11',2),
      ('Juan', 'Perez', 'Garcia', 'Calle Principal 10', '123456789', 'juan.perez@email.com', '2024-01-01', NULL),
      ('Maria', 'Lopez', 'Martinez', 'Avenida Central 20', '987654321', 'maria.lopez@email.com', '2024-01-15', 1),
      ('Ana', 'Rodríguez', 'Sánchez', 'Calle Alcalá 89, Madrid', '+34633456789', 'ana.rodriguez@email.com', '2023-03-10', 1),
      ('alejandro', 'munoz', '', 'Avenida Diagonal 456, Barcelona', '+34622345678', 'alej.mz@email.com', '2023-02-20', 1),
      ('jose', 'ferrer', '', 'Calle Gran Vía 23, Madrid', '+34611234567', 'jose.ffa@email.com', '2023-01-15', NULL),
      ('Carlos', 'Fernández', 'Gómez', 'Plaza Catalunya 12, Barcelona', '+34644567890', 'carlos.fernandez@email.com', '2023-04-05', 2),
      ('Mariana', 'jimenez', 'Martinez', 'Avenida Central 20', '987654321', 'maria.lopez@email.com', '2024-01-15', 1);


INSERT INTO Empleado (
    Nombre, 
    Apellido, 
    Apellido_2, 
    Telefono, 
    Correo, 
    Direccion)
VALUES
      ('Carlos', 'Sanchez', 'Morales', '112233445', 'carlos.sanchez@email.com', 'Calle Empleado 5'),
      ('celine', 'dione', 'Perez', '223344556', 'ana.gomez@email.com', 'Avenida Empleado 10'),
       ('Ana', 'Gomez', 'Perez', '223344556', 'ana.gomez@email.com', 'Avenida Empleado 10'),
       ('Laura', 'Sánchez', 'Martín', '+34655678901', 'laura.chez@optica.com', 'Calle Serrano 34, Madrid'),
      ('Pedro', 'Gómez', 'Ruiz', '+34666789012', 'pgomez@optica.com', 'Calle Provenza 78, Barcelona'),
      ('Carmen', 'López', 'García', '+34677890123', 'carmen.lopez@optica.com', 'Calle Mayor 45, Madrid');


INSERT INTO Venta (
    Fecha, 
    ID_Ulleres, 
    ID_Client, 
    ID_Empleado)
VALUES
       ('2024-12-01', 1, 1, 1),
       ('2024-12-15', 2, 2, 2),
       ('2024-01-15', 1, 1, 1),
       ('2024-01-20', 2, 2, 1),
       ('2024-02-01', 3, 3, 2),
       ('2024-02-15', 4, 4, 2),
       ('2024-03-01', 5, 1, 3),
       ('2024-12-15', 2, 2, 2);


-- check that they return correct results:
-- Optics:

-- List the total purchases of a customer/a.
SELECT c.ID_Client, CONCAT(c.Nombre, ' ', c.Apellido_1) AS Cliente, SUM(u.Precio) AS Total_Purchases FROM Venta v JOIN Client c ON v.ID_Client = c.ID_Client JOIN Ulleres u ON v.ID_Ulleres = u.ID_Ulleres GROUP BY c.ID_Client ORDER BY Total_Purchases DESC;

-- List the various glasses an employee has sold for a year.
SELECT e.ID_Empleado,CONCAT(e.Nombre, ' ', e.Apellido) AS Empleado, u.Marca, u.Tipo_Montura, COUNT(v.ID_Venta) AS Total_Sold FROM  Venta v JOIN Empleado e ON v.ID_Empleado = e.ID_Empleado JOIN Ulleres u ON v.ID_Ulleres = u.ID_Ulleres WHERE YEAR(v.Fecha) = 2023  GROUP BY  e.ID_Empleado, u.ID_Ulleres ORDER BY  Total_Sold DESC;

--3 List the various suppliers who have supplied glasses successfully sold by optics.
SELECT p.ID_Proveedor, p.Nombre AS Supplier_Name,COUNT(v.ID_Venta) AS Glasses_Sold FROM Venta v JOIN  Ulleres u ON v.ID_Ulleres = u.ID_Ulleres JOIN  Proveedor p ON u.ID_Proveedor = p.ID_Proveedor GROUP BY  p.ID_Proveedor;