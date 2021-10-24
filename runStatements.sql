--1
SELECT * FROM pago_gg_depto
WHERE morosidad = false AND fecha_emision > Current_Date - interval '3 months';

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

--4
SELECT nombre_tipo_depto, monto_base
FROM tipo_gg AS tg, tipo_depto AS td
WHERE tg.id_tipo_depto = td.id_tipo_depto
GROUP BY nombre_tipo_depto, monto_base
ORDER BY monto_base DESC
LIMIT 1;

--7
SELECT d.id_edificio, d.piso, MAX(d.habitantes) AS habitantes
FROM depto AS d
GROUP BY d.id_edificio, d.piso;

--10
SELECT DISTINCT ON (id_edificio)
	*
FROM
	(SELECT depto.id_edificio, depto.id_tipo_depto, MIN(tpd.dimension) AS minimo
	FROM edificio AS ed, depto, tipo_depto AS tpd
	WHERE ed.id_edificio = depto.id_edificio AND depto.id_tipo_depto = tpd.id_tipo_depto
	GROUP BY depto.id_edificio, depto.id_tipo_depto
	ORDER BY id_edificio) as listatipos
	GROUP BY id_edificio, id_tipo_depto, minimo
	ORDER BY id_edificio;
