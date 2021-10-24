--1
select * from pago_gg_depto
where morosidad = false and fecha_emision > Current_Date - interval '3 months';

--2
SELECT e.id_edificio,EXTRACT(MONTH FROM pgd.fecha_emision) AS mes,SUM(gc.monto) as Total_gasto_comun
FROM edificio AS e, pago_gg_depto AS pgd, gasto_comun AS gc
WHERE (pgd.id_gasto_comun=gc.id_gasto_comun AND gc.id_edificio=e.id_edificio) AND pgd.morosidad=False
GROUP BY mes, e.id_edificio;

--3
SELECT EXTRACT(MONTH FROM pge.fecha_emision) AS mes,e.id_edificio,SUM(ge.monto) as Total_gasto_edificio
FROM edificio AS e, pago_gasto_edificio AS pge, gasto_edificio as ge
WHERE e.id_edificio=pge.id_edificio AND pge.id_gasto_edificio=ge.id_gasto_edificio AND pge.morosidad=False
GROUP BY mes, e.id_edificio;

--7
select d.id_edificio, d.piso, MAX(d.habitantes) AS habitantes
From depto as d
group by d.id_edificio, d.piso;
