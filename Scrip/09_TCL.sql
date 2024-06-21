-- TCL --

-- Para controlar las TCL, se desactiva la variable de entorno
SELECT @@autocommit;
-- Desactivamos el Autocommit
SET AUTOCOMMIT = 0;

-- Variable de entorno de las FK de las tablas
SELECT @@foreign_key_checks;
SET @@foreign_key_checks = 0 ;

-- Tabla / Pelicula
START TRANSACTION;
INSERT INTO Pelicula ( titulo, duracion_minutos, genero, director, clasificacion, sinopsis) VALUE('Del revés 2', '96','Comedia','Kelsey Mann', '5', 'Secuela de Inside Out. Riley entra en la adolescencia y el Cuartel General sufre una repentina reforma para hacerle hueco a algo totalmente inesperado: ¡Nuevas emociones! Alegría, Tristeza, Ira, Miedo y Asco, con años de impecable gestión a sus espaldas');
INSERT INTO Pelicula (titulo, duracion_minutos, genero, director, clasificacion, sinopsis) VALUE('Amigos imaginarios','104', 'Aventura', 'John Krasinski', '4', 'La historia sigue a un joven que tiene el poder de ver y hablar con los amigos imaginarios de la gente que le rodea. Poco a poco se irá haciendo amigo de aquellos que han sido olvidados');


SAVEPOINT SP1;

INSERT INTO Pelicula ( titulo, duracion_minutos, genero, director, clasificacion, sinopsis) VALUE('Vidas perfectas', '93','Drama', 'Benoît Delhomme', '3', 'Las protagonistas de Mothers Instinct son dos mejores amigas y vecinas que viven en los primeros años de 1960. Alice y Céline viven una vida perfecta y maravillosa hasta que un terrible accidente sacuda sus vidas para siempre');
INSERT INTO Pelicula ( titulo, duracion_minutos, genero, director, clasificacion, sinopsis) VALUE('Furiosa: de la saga Mad Max', '148', 'Accion', 'George Miller', '4','En un mundo postapocalíptico donde todo ha perdido su valor, los pocos supervivientes se guían por la ley del más fuerte. Sin aprecio por la vida, lo único que despierta un brutal interés es la gasolina, sinónimo de poder y objetivo de bandas armadas hasta los dientes');
SAVEPOINT SP2;

ROLLBACK TO SP1;
SELECT * FROM Pelicula;
COMMIT;
