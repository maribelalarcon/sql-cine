-- DCL --
USE mysql ;

-- Creacion de Usuarios--
CREATE USER IF NOT EXISTS 'mari'@'localhost'IDENTIFIED BY '1234';
CREATE USER IF NOT EXISTS 'leo'@'localhost'IDENTIFIED BY '5678';

-- Generar Permisos --
GRANT SELECT ON PROYECTO_FINAL.* TO 'mari'@'localhost';
GRANT SELECT,INSERT,UPDATE ON PROYECTO_FINAL.* TO 'leo'@'localhost';

-- Ver Permisos --
SHOW GRANTS FOR 'mari'@'localhost';
SHOW GRANTS FOR 'leo'@'localhost';
