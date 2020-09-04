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