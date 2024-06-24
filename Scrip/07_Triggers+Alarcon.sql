-- AFTER

DELIMITER //
CREATE TRIGGER AFTER_INSERT_Ticket
AFTER INSERT ON Ticket
FOR EACH ROW
BEGIN
    -- Verificar si ya existe un registro para la fecha actual
    IF EXISTS (SELECT 1 FROM VentasDiaAFTER_INSERT_Ticketrias WHERE fecha = CURDATE()) THEN
    
        -- Actualizar el registro existente incrementando el contador de tickets vendidos
        UPDATE VentasDiarias
        SET tickets_vendidos = tickets_vendidos + 1
        WHERE fecha = CURDATE();
    ELSE
        -- Insertar un nuevo registro para la fecha actual
        INSERT INTO Ticket (fecha, tickets_vendidos)
        VALUES (CURDATE(), 1);
    END IF;
END //

DELIMITER ;

CREATE TABLE VentasDiarias (
    fecha DATE PRIMARY KEY,
    tickets_vendidos INT NOT NULL
);

INSERT INTO Ticket (idfuncion, idasiento) 
VALUES 
(2, 1), 
(2, 2),
(3, 6); 

SELECT * FROM VentasDiarias;

-- BEFORE

DELIMITER //
CREATE TRIGGER BEFORE_UPDATE_Funcion
BEFORE UPDATE ON Funcion
FOR EACH ROW
BEGIN
    -- Verificar que la nueva fecha y hora de la función no sea en el pasado
    IF NEW.fecha_hora < NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha y hora de la función no puede estar en el pasado.';
    END IF;
END //
DELIMITER ;


UPDATE Funcion
SET fecha_hora = '2020-01-01 12:00:00'
WHERE idfuncion = 2;

-- Esta actualización es la correcta
UPDATE Funcion
SET fecha_hora = '2024-07-01 20:00:00'
WHERE idfuncion = 2;




