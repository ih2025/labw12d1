#create database tienda_db;
#use tienda_db;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónica'),
('Ropa'),
('Alimentación');

-- Productos
INSERT INTO productos (nombre_producto, precio, id_categoria) VALUES
('Televisor', 450.50, 1),
('Smartphone', 299.99, 1),
('Camiseta', 19.90, 2),
('Pantalón', 39.99, 2),
('Manzanas', 2.50, 3),
('Pan', 1.20, 3);
