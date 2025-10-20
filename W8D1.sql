#create database comic_db;
#use comic_db;

create table personajes(
id int auto_increment primary key,
nombre varchar(50) not null,
especie varchar(50),
frase_favorita varchar(255)
);

insert into personajes (nombre, especie, frase_favorita) values
('Batman', 'Humano', "Soy la noche"),
('Spider-Man', 'Humano', 'Con gran poder viene gran responsabilidad'),
('Hulk', 'Mutante', 'Hulk aplasta'),
('Superman', 'Alien', '¡Por la verdad y la justicia!'),
('Deadpool', 'Mutante', 'Soy el Mercenario Bocazas');

select * from personajes;

update personajes set nombre = 'Superm' where nobre = 'superman';

delete from personajes where nombre = 'deadpool';

###################################################################

create table autores(
id int auto_increment primary key,
nombre varchar(50) not null,
apellido varchar(50),
fecha_nacimiento date,
fecha_alta timestamp default CURRENT_TIMESTAMP(),
fech_modificacion datetime
);

insert into autores (nombre, apellido, fecha_nacimiento)
values
('Stan', 'Lee', '1922-12-28'),
('Bob', 'Kane', '1915-10-24'),
('Alan', 'Moore', '1953-11-18'),
('Frank', 'Miller', '1957-01-27'),
('Todd', 'McFarlane', '1961-03-16')

create table paises(
id int auto_increment primary key,
nombre_pais varchar(50) not null,
capital varchar(50),
indice_riqueza decimal(10,2) # 99999,999
);
