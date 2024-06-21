CREATE OR REPLACE VIEW VW_VistaFuncionesPeliculas AS (
SELECT 
    f.idfuncion,
    p.titulo AS pelicula,
    s.nombre AS sala,
	f.fecha_hora,
    f.precio
FROM 
    Funcion AS f
JOIN 
    Pelicula AS p ON f.idpelicula = p.idpelicula
JOIN 
    Sala AS s ON f.idsala = s.idsala
WHERE 
    f.fecha_hora > NOW()
ORDER BY 
    f.fecha_hora
);
SELECT * FROM VW_VistaFuncionesPeliculas;
SELECT * FROM Funcion;

CREATE OR REPLACE VIEW VW_VistaalasCapacidades AS (
SELECT 
    c.nombre AS cine,
	s.nombre AS sala,
    s.capacidad
FROM 
    Sala AS s
JOIN 
    Cine AS c ON s.idcine = c.idcine
WHERE 
    s.capacidad > 100
ORDER BY 
	c.nombre, s.nombre
);
SELECT * FROM VW_VistaalasCapacidades;
SELECT * FROM Sala;


CREATE OR REPLACE VIEW VW_VistaTicketsVendidos AS (
SELECT 
	t.idticket,
    f.fecha_hora,
    p.titulo AS pelicula,
    s.nombre AS sala,
    a.fila,
    a.numero
FROM 
    Ticket AS t
JOIN 
    Funcion AS f ON t.idfuncion = f.idfuncion
JOIN 
    Pelicula AS p ON f.idpelicula = p.idpelicula
JOIN 
    Sala AS s ON f.idsala = s.idsala
JOIN 
    Asiento AS a ON t.idasiento = a.idasiento
WHERE 
    f.fecha_hora > NOW()
ORDER BY 
    f.fecha_hora, t.idticket
);
SELECT * FROM VW_VistaTicketsVendidos;
SELECT * FROM Ticket;

CREATE OR REPLACE VIEW VW_VistaAsientosDisponibles AS (
SELECT 
    s.nombre,
    a.fila,
    a.numero
FROM 
    Asiento AS a
JOIN 
    Sala AS s ON a.idsala = s.idsala
WHERE 
    a.idasiento NOT IN (SELECT idasiento FROM Ticket)
    AND s.capacidad > 50
ORDER BY 
    s.nombre, a.fila, a.numero
);
SELECT * FROM VW_VistaAsientosDisponibles;
SELECT * FROM Asiento;

CREATE OR REPLACE VIEW VW_VistaCinesFunciones AS (
SELECT 
    c.nombre AS cine,
    s.nombre AS sala,
    f.fecha_hora,
    p.titulo AS pelicula
FROM 
    Cine AS c
JOIN 
    Sala AS s ON c.idcine = s.idcine
JOIN 
    Funcion AS f ON s.idsala = f.idsala
JOIN 
    Pelicula AS p ON f.idpelicula = p.idpelicula
WHERE 
    p.clasificacion IN ('4', '5')
ORDER BY 
    c.nombre, s.nombre, f.fecha_hora
);
SELECT * FROM VW_VistaCinesFunciones;
SELECT * FROM Cine;