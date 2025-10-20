-- Creamos la base de datos (solo la primera vez)
CREATE DATABASE tienda;
USE tienda;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (id_cliente)
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT,
    nombre_producto VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    PRIMARY KEY (id_producto)
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT,
    id_cliente INT,
    id_producto INT,
    fecha DATE,
    cantidad INT,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


-- Insertar clientes
INSERT INTO clientes VALUES
(1, 'Ana López', 'Madrid', 'ana@example.com'),
(2, 'Carlos Ruiz', NULL, 'carlos@example.com'),
(3, 'María Gómez', 'Sevilla', NULL),
(4, NULL, 'Barcelona', 'barcelona@example.com'),
(5, 'Lucía Torres', NULL, NULL);

-- Insertar productos
INSERT INTO productos VALUES
(1, 'Camiseta', 'Ropa', 19.99),
(2, 'Pantalón', 'Ropa', NULL),
(3, 'Zapatillas', NULL, 59.90),
(4, 'Bolso', 'Accesorios', 29.95),
(5, 'Gorra', NULL, NULL);

-- Insertar pedidos
INSERT INTO pedidos VALUES
(1, 1, 1, '2024-05-01', 2),
(2, 2, 3, '2024-05-03', 1),
(3, 3, 2, NULL, 3),
(4, NULL, 4, '2024-05-05', 1),
(5, 5, NULL, '2024-05-06', NULL);


SELECT c.nombre, p.nombre_producto, pd.fecha, pd.cantidad
FROM pedidos pd
INNER JOIN clientes c ON pd.id_cliente = c.id_cliente
INNER JOIN productos p ON pd.id_producto = p.id_producto;


SELECT pd.id_pedido, c.nombre AS cliente, p.nombre_producto
FROM pedidos pd
LEFT JOIN clientes c ON pd.id_cliente = c.id_cliente
LEFT JOIN productos p ON pd.id_producto = p.id_producto;


SELECT p.nombre_producto, c.nombre AS cliente, pd.fecha
FROM pedidos pd
RIGHT JOIN productos p ON pd.id_producto = p.id_producto
RIGHT JOIN clientes c ON pd.id_cliente = c.id_cliente;
