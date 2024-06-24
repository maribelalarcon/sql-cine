DELIMITER //

CREATE FUNCTION FN_CalcularIngresosPelicula(idpelicula INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalIngresos DECIMAL(10, 2);
    
    SELECT 
        SUM(f.precio) INTO totalIngresos
    FROM 
        Funcion AS f
    JOIN 
        Ticket AS t ON f.funcion_id = t.funcion_id
    WHERE 
        f.pelicula_id = idpelicula;
    
    RETURN totalIngresos;
END //

DELIMITER ;
