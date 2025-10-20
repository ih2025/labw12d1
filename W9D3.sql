-- Tabla usuario
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla podcast
CREATE TABLE IF NOT EXISTS podcast (
    id_podcast INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100),
    categoria VARCHAR(100)
);

-- Tabla descargas (tabla intermedia)
CREATE TABLE IF NOT EXISTS descargas (
    id_descarga INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_podcast INT NOT NULL,
    fecha_descarga DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_podcast) REFERENCES podcast(id_podcast)
);


-- Usuarios
INSERT INTO usuario (nombre, email) VALUES
('Irene', 'irene@gmail.com'),
('Hugo', 'hugo@gmail.com'),
('Ingrid', 'ingrid@gmail.com');

-- Podcasts
INSERT INTO podcast (titulo, autor, categoria) VALUES
('Cómo emprender sin morir en el intento', 'Juan Pérez', 'Negocios'),
('Pilates para principiantes', 'María López', 'Salud'),
('Música y emociones', 'Carlos Ruiz', 'Cultura');

-- Descargas (relacionamos usuarios con podcasts)
INSERT INTO descargas (id_usuario, id_podcast) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);


SELECT * FROM usuario;
SELECT * FROM podcast;
SELECT * FROM descargas;


-- Qué podcast se ha descargado Irene
SELECT u.nombre, p.titulo, d.fecha_descarga
FROM descargas d
JOIN usuario u ON d.id_usuario = u.id_usuario
JOIN podcast p ON d.id_podcast = p.id_podcast
WHERE u.nombre = 'Irene';

-- Todas las descargas (ordenadas)
SELECT u.nombre AS Usuario, p.titulo AS Podcast, d.fecha_descarga
FROM descargas d
JOIN usuario u ON d.id_usuario = u.id_usuario
JOIN podcast p ON d.id_podcast = p.id_podcast
ORDER BY d.fecha_descarga DESC;
