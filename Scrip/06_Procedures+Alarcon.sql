DELIMITER //

CREATE PROCEDURE SP_ObtenerResumenAsistenciaIngresos(
    IN p_idpelicula INT
)
BEGIN
    SELECT 
        p.titulo AS pelicula,
        COUNT(t.idticket) AS total_tickets_vendidos,
        SUM(f.precio) AS ingresos_totales
    FROM 
        Pelicula AS p
    JOIN 
        Funcion AS f ON p.idpelicula = f.idpelicula
    JOIN 
        Ticket AS t ON f.idfuncion = t.idfuncion
    WHERE 
        p.idpelicula = p_idpelicula
    GROUP BY 
        p.titulo;
END //
DELIMITER ;

CALL SP_ObtenerResumenAsistenciaIngresos(1);

