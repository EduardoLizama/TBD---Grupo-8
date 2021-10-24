insert into COMUNA(ID_COMUNA, NOMBRE_COMUNA) 
values 
(1,'Penalolen'),
(2,'La Pintana'),
(3,'Huechuraba'),
(4,'Providencia'),
(5, 'Conchali'),
(6, 'Recoleta'),
(7, 'Independencia'),
(8, 'Las Condes'),
(9, 'El Bosque'),
(10, 'Santiago'),
(11, 'La Florida'),
(12, 'Puente Alto'),
(13, 'La Granja'),
(14, 'Renca'),
(15, 'San Bernardo');

insert into ADMINISTRADOR (ID_ADMINISTRADOR, NOMBRE_ADMINISTRADOR) 
values 
(1,'ADMIN 1'),
(2,'ADMIN 2'),
(3,'ADMIN 3'),
(4,'ADMIN 4'),
(5,'ADMIN 5'),
(6,'ADMIN 6'),
(7,'ADMIN 7'),
(8,'ADMIN 8'),
(9,'ADMIN 9'),
(10,'ADMIN 10'),
(11,'ADMIN 11'),
(12,'ADMIN 12'),
(13,'ADMIN 13'),
(14,'ADMIN 14'),
(15,'ADMIN 15');

insert into GASTO_EDIFICIO (ID_GASTO_EDIFICIO, MONTO) 
values 
(1, 50),
(2, 125),
(3, 14),
(4, 2000),
(5, 1500),
(6, 300),
(7, 200),
(8, 150),
(9, 100),
(10, 175),
(11, 325),
(12, 478),
(13, 546),
(14, 3568),
(15, 2148),
(16, 9754);




insert into EDIFICIO (ID_EDIFICIO, NOMBRE_EDIFICIO, ID_ADMINISTRADOR, ID_COMUNA, CANTIDAD_PISOS) 
values 
(1, 'EDIFICIO 1', 1, 2, 10),
(2, 'EDIFICIO 2', 2, 5, 10),
(3, 'EDIFICIO 3', 3, 6, 10),
(4, 'EDIFICIO 4', 4, 4, 10),
(5, 'EDIFICIO 5', 1, 10, 10),
(6, 'EDIFICIO 6', 2, 5, 10),
(7, 'EDIFICIO 7', 4, 1, 20),
(8, 'EDIFICIO 8', 3, 8, 20),
(9, 'EDIFICIO 9', 1, 12, 20),
(10, 'EDIFICIO 10', 2, 3,  20),
(11, 'EDIFICIO 11', 3, 8, 20),
(12, 'EDIFICIO 12', 4, 10, 20),
(13, 'EDIFICIO 13', 6, 5, 20),
(14, 'EDIFICIO 14', 8, 15, 20),
(15, 'EDIFICIO 15', 4, 1, 20);

insert into PAGO_GASTO_EDIFICIO (ID_PAGO_GASTO_EDIFICIO, FECHA_EMISION, ID_GASTO_EDIFICIO , ID_EDIFICIO, MOROSIDAD) 
values 
(1, '2019-01-01', 1, 1, False),
(2, '2020-01-01', 2, 2, True),
(3, '2021-02-01', 3, 3, True),
(4, '2021-02-01', 4, 4, False),
(5, '2020-03-01', 5, 5, True),
(6, '2021-03-01', 6, 6, True),
(7, '2021-04-01', 7, 7, False),
(8, '2021-04-01', 8, 8, True),
(9, '2021-05-01', 9, 9, False),
(10, '2020-05-01', 10, 10, True),
(11, '2021-06-01', 11, 11, False),
(12, '2021-06-01', 12, 12, True),
(13, '2020-07-01', 13, 1, True),
(14, '2019-07-01', 14, 2, True),
(15, '2020-08-01', 15, 3, False),
(16, '2021-08-01', 16, 4, True);

insert into TIPO_DEPTO (ID_TIPO_DEPTO, NOMBRE_TIPO_DEPTO, DIMENSION) 
values 
(1, 'TIPO DEPTO 1', 50),
(2, 'TIPO DEPTO 2', 200),
(3, 'TIPO DEPTO 3', 1500),
(4, 'TIPO DEPTO 4', 1000),
(5, 'TIPO DEPTO 5', 62),
(6, 'TIPO DEPTO 6', 105),
(7, 'TIPO DEPTO 7', 300),
(8, 'TIPO DEPTO 8', 520),
(9, 'TIPO DEPTO 9', 75),
(10, 'TIPO DEPTO 10', 90),
(11, 'TIPO DEPTO 11', 1505),
(12, 'TIPO DEPTO 12', 1350),
(13, 'TIPO DEPTO 13', 1100),
(14, 'TIPO DEPTO 14', 970),
(15, 'TIPO DEPTO 15', 1500);


insert into TIPO_GG (ID_TIPO_GG, MONTO_BASE, ID_TIPO_DEPTO) 
values 
(1, 10000, 1),
(2, 25000, 2),
(3, 90000, 3),
(4, 50000, 4),
(5, 20000, 5),
(6, 35000, 6),
(7, 98000, 7),
(8, 50500, 8),
(9, 100000, 9),
(10, 250000, 10),
(11, 400000, 11),
(12, 500000, 12),
(13, 255000, 13),
(14, 405000, 14),
(15, 510000, 15);



insert into GASTO_COMUN (ID_GASTO_COMUN, ID_EDIFICIO, ID_TIPO_GG, MONTO) 
values 
(1, 2, 4, 50050),
(2, 4, 3, 90125),
(3, 3, 2, 26000),
(4, 1, 1, 12000),
(5, 5, 5, 22000),
(6, 6, 6, 36000),
(7, 7, 7, 99000),
(8, 8, 8, 52000),
(9, 9, 9, 102000),
(10, 10, 10, 260000),
(11, 11, 11, 412000),
(12, 12, 12, 512000),
(13, 13, 13, 262000),
(14, 14, 14, 412000),
(15, 15, 15, 515000);

insert into DEPTO (ID_DEPTO, HABITANTES, PISO, ID_EDIFICIO, ID_TIPO_DEPTO) 
values 
(1, 4, 1, 2, 1),
(2, 5, 2, 1, 3),
(3, 10, 4, 4, 3),
(4, 1, 4, 4, 2),
(5, 3, 6, 8, 11),
(6, 5, 10, 9, 9),
(7, 3, 10, 9, 6),
(8, 2, 5, 6, 8),
(9, 4, 7, 4, 9),
(10, 3, 12, 12, 7),
(11, 3, 10, 10, 10),
(12, 2, 8, 11, 9),
(13, 1, 7, 6, 4),
(14, 4, 5, 8, 3),
(15, 1, 5, 8, 9);


insert into PAGO_GG_DEPTO (ID_PAGO_GG_DEPTO, FECHA_EMISION, ID_DEPTO, ID_GASTO_COMUN, MOROSIDAD) 
values 
(1, '2021-06-16', 1, 1, False),
(2, '2021-07-01', 2, 2, True),
(3, '2021-08-19', 3, 3, True),
(4, '2021-09-10', 4, 4, False),
(5, '2020-09-16', 5, 4, False),
(6, '2021-10-2', 6, 5, True),
(7, '2021-05-12', 7, 8, True),
(8, '2021-01-16', 8, 9, False),
(9, '2020-12-20', 9, 10, True),
(10, '2020-03-25', 10, 11, False),
(11, '2020-11-28', 11, 14, True),
(12, '2021-03-08', 12, 5, False),
(13, '2021-07-29', 13, 7, True),
(14, '2021-04-03', 14, 10, True),
(15, '2020-10-30', 15, 3, False);
