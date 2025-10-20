#create database cine_db;
#use comic_db;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    protagonista VARCHAR(100),
    anio INT,
    genero VARCHAR(50),
    recaudacion DECIMAL(15,2)  -- en euros o dólares
);

INSERT INTO peliculas (titulo, protagonista, año, genero, recaudacion) VALUES
('Inception', 'Leonardo DiCaprio', 2010, 'Ciencia ficción', 829895144),
('Titanic', 'Leonardo DiCaprio', 1997, 'Romance', 2187463944),
('The Dark Knight', 'Christian Bale', 2008, 'Acción', 1004558444),
('Forrest Gump', 'Tom Hanks', 1994, 'Drama', 678222284),
('Avatar', 'Sam Worthington', 2009, 'Ciencia ficción', 2847246203),
('Gladiator', 'Russell Crowe', 2000, 'Épica', 460583960),
('Jurassic Park', 'Sam Neill', 1993, 'Aventura', 1040000000),
('The Avengers', 'Robert Downey Jr.', 2012, 'Superhéroes', 1518812988),
('Pulp Fiction', 'John Travolta', 1994, 'Crimen', 213928762),
('Deadpool', 'Ryan Reynolds', 2016, 'Superhéroes', 782612979);

select * from peliculas;

select titulo, anio, from peliculas;

select * from peliculas where anio >=2010 order by anio asc;

select genero, count(*) as cantidad_pelicula from peliculas group by genero;

select titulo, anio from peliculas where anio between 2000 and 2015;

select sum(recaudacion) as total_recaudacion from peliculas;

alter select avg(recaudacion) as promedio_recaudacion from peliculas;
);