DROP SCHEMA IF EXISTS PROYECTO_FINAL;
CREATE SCHEMA IF NOT EXISTS PROYECTO_FINAL;
USE PROYECTO_FINAL;

CREATE TABLE Cine (
    idcine INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15)
);

CREATE TABLE Sala (
    idsala INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    idcine INT,
    FOREIGN KEY (idcine) REFERENCES Cine(idcine)
);

CREATE TABLE Pelicula (
    idpelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    duracion_minutos INT NOT NULL,
    genero VARCHAR(50),
    director VARCHAR(100),
    clasificacion VARCHAR(10),
    sinopsis TEXT
);

CREATE TABLE Funcion (
    idfuncion INT PRIMARY KEY AUTO_INCREMENT,
    idsala INT,
    fecha_hora DATETIME NOT NULL,
    precio DECIMAL(8, 2) NOT NULL,
    idpelicula INT,
    FOREIGN KEY (idpelicula) REFERENCES Pelicula(idpelicula),
    FOREIGN KEY (idsala) REFERENCES Sala(idsala)
);

CREATE TABLE Asiento (
    idasiento INT PRIMARY KEY AUTO_INCREMENT,
    fila CHAR(1) NOT NULL,
    numero INT NOT NULL,
    idsala INT,
    FOREIGN KEY (idsala) REFERENCES Sala(idsala)
);

CREATE TABLE Ticket (
    idticket INT PRIMARY KEY AUTO_INCREMENT,
    idfuncion INT,
    idasiento INT,
    FOREIGN KEY (idfuncion) REFERENCES Funcion(idfuncion),
    FOREIGN KEY (idasiento) REFERENCES Asiento(idasiento)
);

SELECT * FROM Cine;
SELECT * FROM Sala;
SELECT * FROM Pelicula;
SELECT * FROM Funcion;
SELECT * FROM Asciento;
SELECT * FROM Ticket;



