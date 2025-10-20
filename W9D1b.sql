CREATE DATABASE podcastDB;

CREATE TABLE podcast (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    categoria VARCHAR(50),
    duracion_min INT,
    descargas INT,
    calificacion DECIMAL(3,1),
    fecha_publicacion DATE
);


INSERT INTO podcast (titulo, categoria, duracion_min, descargas, calificacion, fecha_publicacion)
VALUES
('Mind Matters', 'Psicología', 45, 1500, 4.5, '2023-03-10'),
('Tech Trends', 'Tecnología', 60, 2500, 4.8, '2023-06-22'),
('Food Lovers', 'Gastronomía', 30, 800, 4.0, '2023-04-05'),
('Daily Calm', 'Wellness', 25, 3200, 4.9, '2023-05-18'),
('Music Talks', 'Música', 55, 1800, NULL, '2023-07-01'),
('True Crime Zone', 'Crimen', 70, 4000, 4.7, NULL);


SELECT COUNT(*) AS total_podcasts,
       AVG(duracion_min) AS duracion_media,
       SUM(descargas) AS total_descargas
FROM podcast;


SELECT categoria, COUNT(*) AS cantidad, AVG(calificacion) AS media_calificacion
FROM podcast
GROUP BY categoria
ORDER BY media_calificacion DESC;


SELECT categoria, AVG(descargas) AS media_descargas
FROM podcast
GROUP BY categoria
HAVING AVG(descargas) > 1500;


SELECT * FROM podcast
WHERE titulo LIKE '%Talk%';


SELECT * FROM podcast
WHERE calificacion IS NULL;

// TABLA
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    fecha_pedido DATETIME,
    total DECIMAL(8,2)
);

CREATE TABLE detalles_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    peso_archivo DECIMAL(6,2),
    duracion_seg INT,
    enlace_descarga VARCHAR(255),
    formato VARCHAR(20),
    estado VARCHAR(20),
    pedido_id INT UNIQUE,  -- clave foránea única = relación 1:1
    FOREIGN KEY (pedido_id) REFERENCES pedido(id)
);

INSERT INTO pedido (usuario, fecha_pedido, total)
VALUES
('Irene', NOW(), 9.99),
('Hugo', NOW(), 12.50),
('Ingrid', NOW(), 7.00);

INSERT INTO detalles_pedido (peso_archivo, duracion_seg, enlace_descarga, formato, estado, pedido_id)
VALUES
(125.5, 1800, 'http://ejemplo.com/ep1', 'MP3', 'Completado', 1),
(210.0, 2400, 'http://ejemplo.com/ep2', 'WAV', 'En proceso', 2),
(90.3, 1200, 'http://ejemplo.com/ep3', 'MP3', 'Completado', 3);


SELECT p.id AS id_pedido,
       p.usuario,
       p.fecha_pedido,
       p.total,
       d.formato,
       d.estado,
       d.peso_archivo,
       d.enlace_descarga
FROM pedido p
JOIN detalles_pedido d ON p.id = d.pedido_id;
