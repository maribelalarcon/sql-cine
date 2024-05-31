USE PROYECTO_FINAL;

INSERT INTO Cine (nombre, direccion, telefono) VALUES
('Cineplex A', '123 Main St, Ciudad', '555-0100'),
('Cineplex B', '456 Elm St, Ciudad', '555-0101'),
('Cineplex C', '789 Oak St, Ciudad', '555-0102'),
('Cineplex D', '101 Pine St, Ciudad', '555-0103'),
('Cineplex E', '202 Maple St, Ciudad', '555-0104'),
('Cineplex F', '303 Birch St, Ciudad', '555-0105'),
('Cineplex G', '404 Cedar St, Ciudad', '555-0106'),
('Cineplex H', '505 Willow St, Ciudad', '555-0107'),
('Cineplex I', '606 Spruce St, Ciudad', '555-0108'),
('Cineplex J', '707 Fir St, Ciudad', '555-0109'),
('Cineplex K', '808 Aspen St, Ciudad', '555-0110'),
('Cineplex L', '909 Walnut St, Ciudad', '555-0111'),
('Cineplex M', '1010 Chestnut St, Ciudad', '555-0112'),
('Cineplex N', '1111 Redwood St, Ciudad', '555-0113'),
('Cineplex O', '1212 Palm St, Ciudad', '555-0114');

INSERT INTO Sala (idcine, nombre, capacidad) VALUES
(1, 'Sala 1', 100),
(1, 'Sala 2', 150),
(2, 'Sala 1', 120),
(2, 'Sala 2', 130),
(3, 'Sala 1', 110),
(3, 'Sala 2', 140),
(4, 'Sala 1', 160),
(4, 'Sala 2', 170),
(5, 'Sala 1', 90),
(5, 'Sala 2', 200),
(6, 'Sala 1', 110),
(6, 'Sala 2', 130),
(7, 'Sala 1', 150),
(7, 'Sala 2', 120),
(8, 'Sala 1', 140);

INSERT INTO Funcion (idfuncion, idsala, fecha_hora, precio) VALUES
(1, 1, '2024-06-01 14:00:00', 10.00),
(2, 2, '2024-06-01 16:00:00', 12.00),
(3, 3, '2024-06-01 18:00:00', 11.00),
(4, 4, '2024-06-01 20:00:00', 9.00),
(5, 5, '2024-06-02 14:00:00', 10.00),
(6, 6, '2024-06-02 16:00:00', 8.00),
(7, 7, '2024-06-02 18:00:00', 12.00),
(8, 8, '2024-06-02 20:00:00', 11.00),
(9, 9, '2024-06-03 14:00:00', 10.00),
(10, 10, '2024-06-03 16:00:00', 15.00),
(11, 11, '2024-06-03 18:00:00', 9.00),
(12, 12, '2024-06-03 20:00:00', 12.00),
(13, 13, '2024-06-04 14:00:00', 11.00),
(14, 14, '2024-06-04 16:00:00', 13.00),
(15, 15, '2024-06-04 18:00:00', 10.00);

INSERT INTO Asiento (idsala, fila, numero) VALUES
(1, 'A', 1),
(1, 'A', 2),
(2, 'B', 1),
(2, 'B', 2),
(3, 'C', 1),
(3, 'C', 2),
(4, 'D', 1),
(4, 'D', 2),
(5, 'E', 1),
(5, 'E', 2),
(6, 'F', 1),
(6, 'F', 2),
(7, 'G', 1),
(7, 'G', 2),
(8, 'H', 1);

