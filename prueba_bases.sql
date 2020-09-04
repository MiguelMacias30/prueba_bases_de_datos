--crear base de datos prueba 
CREATE DATABASE prueba;
--crear tabla clientes
CREATE TABLE clientes(id_cliente SERIAL, nombre_cliente VARCHAR(70) NOT NULL, rut_cliente INT NOT NULL UNIQUE, direccion_cliente VARCHAR(100), PRIMARY KEY(id_cliente));
--crear tabla categorias
CREATE TABLE categorias(id_categoria SERIAL, nombre_categoria VARCHAR(70) NOT NULL, descripcion_categoria VARCHAR(100), PRIMARY KEY(id_categoria));
--crear tabla productos
CREATE TABLE productos(id_producto SERIAL, nombre_producto VARCHAR(100) NOT NULL, descripcion_producto VARCHAR(200), valor_unitario FLOAT, id_categoria INT, PRIMARY KEY(id_producto), FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria));
--crear tabla facturas
CREATE TABLE facturas(numero_factura INT NOT NULL UNIQUE , id_cliente INT, fecha_factura DATE, subtotal FLOAT, iva Float, precio_total FLOAT, PRIMARY KEY(numero_factura), FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente));
--crear tabla facturas_productos
CREATE TABLE facturas_productos(numero_factura INT NOT NULL, id_producto INT NOT NULL, cantidad INT NOT NULL, precio_unitario FLOAT NOT NULL, valor_total FLOAT NOT NULL, FOREIGN KEY(numero_factura) REFERENCES facturas(numero_factura), FOREIGN KEY(id_producto) REFERENCES productos(id_producto));
--insertas 5 cientes
INSERT INTO clientes(nombre_cliente, rut_cliente, direccion_cliente) VALUES('pedro', 70321416, 'calle vista hermosa'), ('fabiola', 51222333, 'calle vista gorda'), ('julian', 1126968, 'calle no te veo'), ('miguel', 1020753245, 'calle siempre hermoso'), ('paola', 1103322, 'calle tomates finos');
-- insertar 3 categorias 
INSERT INTO categorias(nombre_categoria, descripcion_categoria) VALUES('hojaldres', 'masa en capas a base de grasa'), ('pan rustico','pan hecho con masa madre'), ('pan saludable', 'pan a base de granos y cereales');
--insertar 8 productos
INSERT INTO productos(nombre_producto, descripcion_producto, valor_unitario, id_categoria) VALUES('pan au chocolat', 'pan de chocolate', 50, 1), ('croisant', 'masa laminada en capas', 120, 1), ('palmeritas', 'masa laminada en forma de palmera', 75, 1), ('pan de campo', 'pan a base de masa madre', 200, 2), ('pan criollo', 'pan a base de grasa de cerdo', 175, 2), ('pan baguette', 'pan a base de mantequilla', 120, 2), ('pan de sarraceno', 'pan a base de sarraceno', 250, 3), ('pan de sesamo', 'pan a base de semillas de sesamo', 95, 3);
--insertar 1 factura
INSERT INTO facturas(numero_factura, id_cliente, fecha_factura, subtotal, iva, precio_total) VALUES(1, 1, '2020-08-10', 900, 171.00, 1071.00);
--insertando 9 facturas restantes 
INSERT INTO facturas(numero_factura, id_cliente, fecha_factura, subtotal, iva, precio_total) VALUES(2, 1, '2020-08-12', 1140, 216.60, 1356.60), (3, 2, '2020-08-27', 1515, 287.85, 1802.85), (4, 2, '2020-09-02', 1280, 243.20, 1523.20), (5, 2, '2020-09-17', 1090, 207.10, 1297.10), (6, 3, '2020-09-25', 1200, 228.00, 1428.00), (7, 4, '2020-09-30', 1155, 219.45, 1374.45), (8, 4, '2020-10-09', 3625, 688.75, 4313.75), (9, 4, '2020-10-17', 4795, 911.05, 5706.05), (10, 4, '2020-10-28', 675, 128.25, 803.25);
--insertando datos tabla facturas_productos
INSERT INTO facturas_productos(numero_factura, id_producto, cantidad, precio_unitario, valor_total) VALUES(1, 3, 5, 75, 375), (1, 5, 3, 175, 525);
INSERT INTO facturas_productos(numero_factura, id_producto, cantidad, precio_unitario, valor_total) VALUES (2, 2, 3, 120, 360), (2, 8, 4, 95, 380), (2, 1, 8, 50, 400), (3, 7, 3, 250, 750), (3, 6, 2, 120, 240), (3, 5, 3, 175, 525), (4, 2, 4, 120, 480), (4, 4, 4, 200, 800), (5, 1, 3, 50, 150), (5, 5, 4, 175, 700), (5, 2, 2, 120, 240), (6, 4, 6, 200, 1200), (7, 3, 9, 75, 675), (7, 6, 4, 120, 480), (8, 8, 15, 95, 1425), (8, 4, 2, 200, 400), (8, 2, 15, 120, 1800), (9, 7, 8, 250, 2000), (9, 2, 6, 120, 720), (9, 3, 9, 75, 675), (9, 5, 8, 175, 1400), (10, 3, 9, 75, 675);