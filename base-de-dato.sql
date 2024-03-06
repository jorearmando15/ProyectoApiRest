CREATE SCHEMA db_peliculas_series;
use db_peliculas_series;

-- Módulo de Género
CREATE TABLE Genero (
    id_genero INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    descripcion TEXT
);

-- Módulo de Director
CREATE TABLE Director (
    id_director INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Módulo de Productora
CREATE TABLE Productora (
    id_productora INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    slogan VARCHAR(255),
    descripcion TEXT
);

-- Módulo de Tipo
CREATE TABLE Tipo (
    id_tipo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    descripcion TEXT
);

-- Módulo de Media (Películas y Series)
CREATE TABLE Media (
    id_media INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    sinopsis TEXT,
    url_pelicula VARCHAR(255) UNIQUE NOT NULL,
    imagen_portada VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    anno_estreno INT,
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
INSERT INTO Genero (id_genero, nombre, estado, descripcion) VALUES 
    (1, 'Acción', 'Activo', 'Películas llenas de acción y emoción'),
    (2, 'Drama', 'Activo', 'Historias emocionales y profundas'),
    (3, 'Comedia', 'Activo', 'Para reír y pasar un buen rato'),
    (4, 'Ciencia ficción', 'Activo', 'Explorando mundos futuristas y tecnología avanzada'),
    (5, 'Terror', 'Activo', 'Para aquellos que aman asustarse'),
    (6, 'Romance', 'Activo', 'Historias de amor y pasión'),
    (7, 'Suspenso', 'Activo', 'Manteniendo a la audiencia en vilo'),
    (8, 'Aventura', 'Activo', 'Viajes y descubrimientos emocionantes'),
    (9, 'Fantasía', 'Activo', 'Mundos mágicos y criaturas fantásticas'),
    (10, 'Misterio', 'Activo', 'Intriga y enigmas por resolver');

-- Insertar 10 registros en la tabla Director
INSERT INTO Director (id_director, nombre, estado) VALUES 
    (1, 'Juan Pérez', 'Activo'),
    (2, 'Ana Gómez', 'Activo'),
    (3, 'Miguel Rodríguez', 'Activo'),
    (4, 'Elena García', 'Activo'),
    (5, 'Carlos López', 'Activo'),
    (6, 'Jessica Torres', 'Activo'),
    (7, 'David Vargas', 'Activo'),
    (8, 'Sara Molina', 'Activo'),
    (9, 'Daniel Blanco', 'Activo'),
    (10, 'Olivia Fernández', 'Activo');

-- Insertar 10 registros en la tabla Productora
INSERT INTO Productora (id_productora, nombre, estado, slogan, descripcion) VALUES 
    (1, 'Estudios ABC', 'Activo', 'Donde nacen las historias', 'Producción de películas y series'),
    (2, 'Producciones XYZ', 'Activo', 'Calidad y creatividad', 'Comprometidos con la excelencia'),
    (3, 'Películas DEF', 'Activo', 'Imágenes que perduran', 'Creando experiencias cinematográficas'),
    (4, 'Entretenimiento LMN', 'Activo', 'Diversión sin límites', 'Entretenimiento para todos'),
    (5, 'Imágenes GHI', 'Activo', 'Capturando momentos', 'Producción visual de alta calidad'),
    (6, 'Estudios JKL', 'Activo', 'Innovación en cada historia', 'Explorando nuevas narrativas'),
    (7, 'Producciones MNO', 'Activo', 'Emoción en cada escena', 'Historias que cautivan'),
    (8, 'Películas PQR', 'Activo', 'Pasión por el cine', 'Creando impacto en la pantalla'),
    (9, 'Entretenimiento STU', 'Activo', 'Variedad y diversión', 'Ofreciendo entretenimiento para todos los gustos'),
    (10, 'Estudios VWX', 'Activo', 'Donde la magia cobra vida', 'Creando mundos extraordinarios');

-- Insertar 10 registros en la tabla Tipo
INSERT INTO Tipo (id_tipo, nombre, descripcion) VALUES 
    (1, 'Película', 'Producción cinematográfica para salas de cine'),
    (2, 'Serie de TV', 'Producción televisiva con varios episodios'),
    (3, 'Documental', 'Producción informativa y educativa'),
    (4, 'Animación', 'Producción con gráficos animados'),
    (5, 'Miniserie', 'Serie limitada con pocos episodios'),
    (6, 'Serie Web', 'Serie producida para plataformas en línea'),
    (7, 'Cortometraje', 'Producción cinematográfica breve'),
    (8, 'Reality Show', 'Programa de televisión con situaciones reales'),
    (9, 'Talk Show', 'Programa de entrevistas y conversación'),
    (10, 'Musical', 'Producción centrada en la música');

-- Insertar 10 registros en la tabla Media
INSERT INTO Media (id_media, titulo, sinopsis, url_pelicula, imagen_portada, anno_estreno, id_genero, id_director, id_productora, id_tipo) VALUES 
    (1, 'Película 1', 'Una emocionante película de acción', 'http://url_pelicula1.com', 'imagen1.jpg', 2022, 1, 1, 1, 1),
    (2, 'Serie de TV 1', 'Una serie llena de intriga y suspenso', 'http://url_serie1.com', 'imagen2.jpg', 2021, 2, 2, 2, 2),
    (3, 'Documental 1', 'Explorando hechos fascinantes', 'http://url_documental1.com', 'imagen3.jpg', 2023, 3, 3, 3, 3),
    (4, 'Animación 1', 'Aventuras animadas para todas las edades', 'http://url_animacion1.com', 'imagen4.jpg', 2020, 4, 4, 4, 4),
    (5, 'Miniserie 1', 'Una historia corta pero impactante', 'http://url_miniserie1.com', 'imagen5.jpg', 2022, 5, 5, 5, 5),
    (6, 'Serie Web 1', 'Entretenimiento en línea para todos', 'http://url_serie_web1.com', 'imagen6.jpg', 2021, 6, 6, 6, 6),
    (7, 'Cortometraje 1', 'Una breve pero intensa experiencia cinematográfica', 'http://url_cortometraje1.com', 'imagen7.jpg', 2023, 7, 7, 7, 7),
    (8, 'Reality Show 1', 'La realidad como nunca antes se ha visto', 'http://url_reality_show1.com', 'imagen8.jpg', 2020, 8, 8, 8, 8),
    (9, 'Talk Show 1', 'Conversaciones fascinantes con invitados especiales', 'http://url_talk_show1.com', 'imagen9.jpg', 2022, 9, 9, 9, 9),
    (10, 'Musical 1', 'Un espectáculo musical inolvidable', 'http://url_musical1.com', 'imagen10.jpg', 2021, 10, 10, 10, 10);
    
    -- consultar todos los generos
	SELECT * FROM Genero;

    -- consultar todos los directores
	SELECT * FROM Director;
	
    -- consultar todos las productoras
	SELECT * FROM Productora;
    
	-- consultar todos los tipos
	SELECT * FROM Tipo;
    
	-- consultar todos las media
    SELECT
		Media.id_media,
		Media.titulo,
		Media.sinopsis,
		Media.url_pelicula,
		Media.imagen_portada,
		Media.anno_estreno,
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

