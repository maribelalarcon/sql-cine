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


INSERT INTO Ticket (idfuncion, idasiento) 
VALUES 
(2, 1), 
(2, 2),
(3, 6); 




