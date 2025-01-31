/*1.Llista el nom de tots els productes que hi ha en la taula "producto".
List the name of all the products in the "producto" table.*/
SELECT nombre FROM producto;


/*2.Llista els noms i els preus de tots els productes de la taula "producto".
List the names and prices of all the products in the "producto" table.*/
SELECT nombre, precio FROM producto;


/*3.Llista totes les columnes de la taula "producto".
List all the columns from the "producto" table.*/
SHOW COLUMNS FROM producto; DESCRIBE producto; SELECT * FROM `producto`;

-- /4. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
List the name of the "productos", the price in euros, and the price in US dollars (USD)./
SELECT `nombre`, `precio` AS €, ROUND(`precio`*1.11,2) AS USD FROM `producto`;

-- /5. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
List the name of the "productos", the price in euros, and the price in US dollars. Use the following aliases for the columns: "producto" name, euros, US dollars./
??SELECT nombre AS producto, precio AS euros, precio * 1.1 AS `dólares norteamericanos` FROM producto;

-- Task 6: List the names and prices of all the products in the producto table, converting the names to uppercase.
SELECT UPPER(nombre) AS producto, precio FROM producto;

-- /7. Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
List the names and prices of all products from the "producto" table, converting the names to lowercase./
SELECT LOWER(nombre) AS producto, precio FROM producto;

-- /8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
List the name of all manufacturers in one column, and in another column, display the first two characters of the manufacturer name in uppercase./
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS primeros_dos_caracteres FROM fabricante;

-- /9. Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
List the names and prices of all products from the "producto" table, rounding the price value./
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;


-- /10. Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
List the names and prices of all products from the "producto" table, truncating the price value to show it without any decimal digits./
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

-- /11. Llista el codi dels fabricants que tenen productes en la taula "producto".
List the codes of manufacturers that have products in the "producto" table./
SELECT DISTINCT codigo_fabricante FROM producto WHERE codigo_fabricante IS NOT NULL;

-- /*12. Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
List the codes of manufacturers that have products in the "producto" table, removing duplicate codes
SELECT codigo_fabricante FROM producto GROUP BY codigo_fabricante;.*/
SELECT DISTINCT codigo_fabricante FROM producto;

-- /13. Llista els noms dels fabricants ordenats de manera ascendent.
-- List the names of manufacturers ordered in ascending order./
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- /14. Llista els noms dels fabricants ordenats de manera descendent.
-- List the names of manufacturers ordered in descending order./
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- /15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
-- List the names of products ordered firstly by name in ascending order and secondly by price in descending order./
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- /16. Retorna una llista amb les 5 primeres files de la taula "fabricante".
-- Return a list of the first 5 rows from the "fabricante" table./
SELECT * FROM fabricante LIMIT 5;

-- /17. Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
-- Return a list of 2 rows starting from the fourth row of the "fabricante" table. The fourth row must also be included in the result./
SELECT * FROM fabricante LIMIT 3, 2;


-- Task 18: List the name and price of the cheapest product. (Use only the ORDER BY and LIMIT clauses)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;


-- Task 19: List the name and price of the most expensive product. (Use only the ORDER BY and LIMIT clauses).
-- SELECT nombre, precio FROM producto WHERE precio = (SELECT MAX(precio) FROM producto);
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;


-- Task 20: List the names of all the products from the manufacturer whose manufacturer code is 2.
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;

---Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
--21 Return a list with the product name, price and manufacturer name of all the products in the database.
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;

--Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
-- Task 22: Return a list with the product name, price, and manufacturer name of all products in the database, sorted by the manufacturer's name alphabetically.
SELECT f.nombre AS fabricante, p.nombre, p.precio FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;

--Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
-- Task 23: Return a list with the product code, product name, manufacturer code, and manufacturer name of all products in the database.
SELECT p.codigo AS cod_producto, p.nombre AS producto, p.codigo_fabricante AS cod_fabricante, f.nombre AS fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- Task 24: Return the name of the product, its price and the name of its manufacturer, from the cheapest product.. 
SELECT p.nombre AS producto, p.precio AS "precio €", f.nombre AS fabricante FROM producto p JOIN fabricante f ORDER BY p.precio ASC LIMIT 1;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- Task 25:Return the name of the product, its price and the name of its manufacturer, from the most expensive product..
SELECT p.nombre AS producto, p.precio AS "precio €", f.nombre AS fabricante FROM producto p JOIN fabricante f ORDER BY p.precio DESC LIMIT 1;


-- Retorna una llista de tots els productes del fabricant Lenovo.
-- Task 26:Returns a list of all products from manufacturer Lenovo.
SELECT p.nombre AS "productos_Lenovo" FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";


-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
-- Task 27: Returns a list of all Crucial manufacturer products that are priced higher than 200 €.
SELECT p.nombre AS "Crucial_products > 200 €" FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial_products" AND p.precio > 200;

-- Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
-- Task 28:Returns a list with all products from manufacturers Asus, Hewlett-Packard and Seagate. Without using the IN operator.
SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
-- task 29:Return a list with all products from manufacturers Asus, Hewlett-Packard and Seagate. Using the IN operator.
SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");


-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Task 30: Return a list with the name and price of all the products of the manufacturers whose name ends with the vowel e.
SELECT p.nombre AS producto, ROUND(p.precio, 2) AS 'precio €', f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%e"; 

-- 31:Returns a list with the name and price of all products from manufacturers whose name contains the character w.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

-- task 32: Return a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to 180 €. 
-- Sort the result, first, by the price (en descending order) and, secondly, by the name (en ascending order).
--Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. 
-- Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.nombre AS producto, ROUND(p.precio, 2) AS 'precio €', f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio > 180 ORDER BY p.precio DESC, p.nombre ASC;

-- task 33:
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
--  Return a list with the code and the name of manufacturer, only those manufacturers that have associated products in the database.
SELECT f.codigo, f.nombre AS 'fabricante' FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre;

-- 34:Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list should also show those manufacturers that do not have associated products.
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35:Returns a list where only those manufacturers that do not have any associated products appear.
SELECT f.nombre AS fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

-- task 36:
-- .Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
-- .Return all products from manufacturer Lenovo. (Sense to use INNER JOIN).
SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";

-- 37:Returns all data for products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38:List the name of the most expensive product from the manufacturer Lenovo.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

-- task  39:
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- List manufacturer Hewlett-Packard cheapest product name.
SELECT p.nombre AS "Hewlett-Packard cheapest product", MIN(p.precio) AS "MIN price in stock" FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard";


-- task 40: 
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- Return all the products in the database that are priced at or equal to the most expensive product from manufacturer Lenovo.
SELECT * FROM producto p WHERE p.precio > (SELECT MAX(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "Lenovo");


-- task 41: 
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
-- It lists all Asus manufacturer products that have a price higher than the average price of all its products.
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "Asus" AND p.precio > (SELECT AVG(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "Asus");



-- "Universidad" database"-- 
-- *****************************************************************************************************

1:Return a list with the first surname, second surname and the name of all/the students. The list must be arranged alphabetically from minor to major by first surname, second surname and name.
SELECT apellido1, apellido2, nombre FROM persona WHERE  tipo ='alumno' order by nombre ASC, apellido1 ASC, apellido1;

2:Find out the name and two surnames of the/students who have not registered their phone number in the database.
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo = "alumno";


3:Return the list of the/students who were born in 1999.
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;


4:Return the list of teachers/who have not registered their phone number in the database and also their NIF ends in K.
SELECT nombre,apellido1,apellido2,telefono,tipo,nif FROM persona WHERE telefono IS NULL AND tipo = "profesor" AND nif LIKE '%K';

5:Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

--6:Return a list of teachers/is together with the name of the department to which they are linked/from. The list must return four columns, first surname, 
--ssecond_surname, name and name of the department. The result will be arranged alphabetically from minor to major by surnames and name.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departmento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
--
--7:Return a list with the name of the subjects, year of start and year of end of the student school year/to with NIF 26902806M.
SELECT a.nombre AS nombre_asignatura, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura ama JOIN asignatura a ON ama.id_asignatura = a.id JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id JOIN persona p ON ama.id_alumno = p.id WHERE p.nif = '26902806M';

--
--8:Return a list with the name of all departments that have professors/are taught some subject in the Degree in Computer Engineering (Pla 2015).
SELECT DISTINCT d.nombre AS nombre_departamento FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id  WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

--
--9:Return a list with all/students who have enrolled in a subject during the 2018/2019 school year.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, CONCAT(ce.anyo_inicio, '-', ce.anyo_fin) AS curso_escolar FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE p.tipo = 'alumno' AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 ORDER BY p.apellido1, p.apellido2, p.nombre;


-- "Summary consultations:" database"-- 
-- *****************************************************************************************************

-- task 1: 
-- 
-- Returns the total number of students there.
SELECT COUNT(p.id) AS 'total_num_alumnos' FROM persona p WHERE p.tipo IN ('alumno');

-- task 2: 
-- 
-- Calculate how many/students were born in 1999.
SELECT COUNT(p.id) AS 'total_alumnos_nacidos_en_1999' FROM persona p WHERE p.tipo IN ('alumno') AND p.fecha_nacimiento LIKE "1999%";

-- task3: rectified
-- 
-- Calculate how many/are teachers/are in each department. The result should only show two columns, one with the department name and one with the number of teachers/is in this department. The result should only include departments that have professors/associates and must be ordered from highest to lowest by the number of professors/s.
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS numero_profesores FROM departamento d JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id, d.nombre HAVING COUNT(p.id_profesor) > 0 ORDER BY numero_profesores DESC; 

-- task 4: 
-- 
-- Return a list with all departments and the number of teachers/are in each of them. It takes into account that departments that do not have professors/are associated/from may exist. These departments must also appear in the list.
SELECT d.nombre AS 'departamento', COUNT(pro.id_profesor) AS 'profesores asociados' FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento GROUP BY d.id ORDER BY COUNT(pro.id_profesor) DESC, d.nombre;


-- task 5:
--
-- Return a list with the name of all existing degrees in the database and the number of subjects each has. It takes into account that degrees that do not have associated subjects may exist. These degrees must also appear in the list. The result must be ordered from highest to lowest by the number of subjects.
SELECT g.nombre AS 'grado', COUNT(a.id) AS 'número asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY COUNT(a.id) DESC, g.nombre; 


-- task 6: 
-- 
-- Return a list with the name of all existing degrees in the database and the number of subjects each has, of degrees that have more than 40 associated subjects.
SELECT g.nombre AS 'grado', COUNT(a.id) AS 'número asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id HAVING COUNT(a.id) >= 40 ORDER BY COUNT(a.id) DESC, g.nombre;

-- task 7:
-- 
-- Return a list showing the name of the degrees and the sum of the total number of credits for each type of subject. The result must have three columns: degree name, subject type, and the sum of credits for all subjects of this type.
SELECT g.nombre, a.tipo, SUM(a.creditos) AS 'total créditos' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo; 


-- task 8:
-- 
-- Return a list showing how many/years of students have enrolled in some subject in each of the school years. The result will have to show two columns, one column with the start year of the school year and another with the number of students enrolled/from.
SELECT YEAR(curso_escolar.anyo_inicio) as start_year,COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) as enrolled_students  FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura   ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio; 
 

-- task 9:
-- 
-- Return a list with the number of subjects taught by each teacher/to. The list must take into account those teachers/s who do not teach any subject. The result will show five columns: id, name, first surname, second surname and number of subjects. The result will be ordered from largest to lowest by the number of subjects.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS 'total asignaturas' FROM persona p JOIN profesor pro ON p.id = pro.id_profesor LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor GROUP BY pro.id_profesor ORDER BY COUNT(a.id) DESC, p.apellido1; 


-- task 10: fixed
-- 
-- Return all the data of the youngest student.
SELECT * FROM persona WHERE tipo = 'alumno'AND fecha_nacimiento = ( SELECT MAX(fecha_nacimiento)FROM persona WHERE tipo = 'alumno' );

-- task 11:
-- 
-- Return a list with the professors/s who have an associated department and who do not teach any subject.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, d.nombre AS nombre_departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id  LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL ORDER BY p.apellido1, p.apellido2, p.nombre; 




-- Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.
-- .........................................................................................................................


--1:Return a list with the names of all teachers/es and the departments that have linked/from. The listing must also show those teachers/s who do not have any associated departments. The list must return four columns, department name, first surname, second surname and teacher name/to. The result will be arranged alphabetically from minor to major by department name, surnames and name.
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 2:Return a list with professors/s who are not associated with a department. WORKSS
SELECT p.*, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE pr.id_departamento IS NULL AND p.tipo = 'profesor';


-- 3:Return a list with departments that do not have professors/associates.
SELECT * FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento  WHERE p.id_profesor IS NULL;

--4:Return a list with teachers/s who do not teach any subject.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

--5:Return a list with subjects that do not have a teacher/assigned.
SELECT * FROM asignatura a WHERE a.id_profesor IS NULL;

--6:Return a list with all departments that have not taught subjects in any school year.
SELECT d.nombre FROM departamento d JOIN profesor pro ON d.id = pro.id_departamento JOIN asignatura a ON pro.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura ama ON a.id = ama.id_asignatura GROUP BY d.nombre HAVING COUNT(ama.id_curso_escolar) = 0;








