DELIMITER //

CREATE FUNCTION FN_ObtenerDisponibilidadAsientos(idfuncion INT) 
RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE disponibilidad JSON;

    SELECT 
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'idasiento', a.idasiento,
                'fila', a.fila,
                'numero', a.numero
            )
        )
    INTO disponibilidad
    FROM 
        Asiento a
    JOIN 
        Sala s ON a.idsala = s.idsala
    JOIN 
        Funcion f ON s.idsala = f.idsala
    WHERE 
        f.idfuncion = idfuncion
        AND a.idasiento NOT IN (SELECT idasiento FROM Ticket WHERE idfuncion = idfuncion);

    RETURN disponibilidad;
END //

DELIMITER ;

