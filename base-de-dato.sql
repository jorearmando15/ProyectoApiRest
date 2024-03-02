CREATE SCHEMA db_peliculas_series;
use db_peliculas_series;

CREATE TABLE Genero (
    id_genero INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Director (
    id_director INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Productora (
    id_productora INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Tipo (
    id_tipo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Media (
    id_media INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_genero INT,
    id_director INT,
    id_productora INT,
    id_tipo INT,
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero),
    FOREIGN KEY (id_director) REFERENCES Director(id_director),
    FOREIGN KEY (id_productora) REFERENCES Productora(id_productora),
    FOREIGN KEY (id_tipo) REFERENCES Tipo(id_tipo)
);

-- Insertar 10 registros en la tabla Genero
INSERT INTO Genero (id_genero, nombre) VALUES 
    (1, 'Acción'), 
    (2, 'Drama'), 
    (3, 'Comedia'), 
    (4, 'Ciencia ficción'), 
    (5, 'Terror'), 
    (6, 'Romance'), 
    (7, 'Suspenso'), 
    (8, 'Aventura'), 
    (9, 'Fantasía'), 
    (10, 'Misterio');

-- Insertar 10 registros en la tabla Director
INSERT INTO Director (id_director, nombre) VALUES 
    (1, 'Juan Pérez'), 
    (2, 'Ana Gómez'), 
    (3, 'Miguel Rodríguez'), 
    (4, 'Elena García'), 
    (5, 'Carlos López'), 
    (6, 'Jessica Torres'), 
    (7, 'David Vargas'), 
    (8, 'Sara Molina'), 
    (9, 'Daniel Blanco'), 
    (10, 'Olivia Fernández');

-- Insertar 10 registros en la tabla Productora
INSERT INTO Productora (id_productora, nombre) VALUES 
    (1, 'Estudios ABC'), 
    (2, 'Producciones XYZ'), 
    (3, 'Películas DEF'), 
    (4, 'Entretenimiento LMN'), 
    (5, 'Imágenes GHI'), 
    (6, 'Estudios JKL'), 
    (7, 'Producciones MNO'), 
    (8, 'Películas PQR'), 
    (9, 'Entretenimiento STU'), 
    (10, 'Estudios VWX');

-- Insertar 10 registros en la tabla Tipo
INSERT INTO Tipo (id_tipo, nombre) VALUES 
    (1, 'Película'), 
    (2, 'Serie de TV'), 
    (3, 'Documental'), 
    (4, 'Animación'), 
    (5, 'Miniserie'), 
    (6, 'Serie Web'), 
    (7, 'Cortometraje'), 
    (8, 'Reality Show'), 
    (9, 'Talk Show'), 
    (10, 'Musical');

-- Insertar 10 registros en la tabla Media
INSERT INTO Media (id_media, titulo, id_genero, id_director, id_productora, id_tipo) VALUES 
    (1, 'Película 1', 1, 1, 1, 1),
    (2, 'Serie de TV 1', 2, 2, 2, 2),
    (3, 'Documental 1', 3, 3, 3, 3),
    (4, 'Animación 1', 4, 4, 4, 4),
    (5, 'Miniserie 1', 5, 5, 5, 5),
    (6, 'Serie Web 1', 6, 6, 6, 6),
    (7, 'Cortometraje 1', 7, 7, 7, 7),
    (8, 'Reality Show 1', 8, 8, 8, 8),
    (9, 'Talk Show 1', 9, 9, 9, 9),
    (10, 'Musical 1', 10, 10, 10, 10);


-- Obtener todos los géneros:    
SELECT * FROM Genero;

-- Obtener todos los directores:

SELECT * FROM Director;

-- Obtener todas las productoras:
SELECT * FROM Productora;

-- Obtener todos los tipos:
SELECT * FROM Tipo;

-- Obtener todos los medios (películas, series, etc.) con información adicional:
SELECT
    Media.id_media,
    Media.titulo,
    Genero.nombre AS genero,
    Director.nombre AS director,
    Productora.nombre AS productora,
    Tipo.nombre AS tipo
FROM
    Media
JOIN Genero ON Media.id_genero = Genero.id_genero
JOIN Director ON Media.id_director = Director.id_director
JOIN Productora ON Media.id_productora = Productora.id_productora
JOIN Tipo ON Media.id_tipo = Tipo.id_tipo;

