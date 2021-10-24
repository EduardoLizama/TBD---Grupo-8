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

--5
SELECT EDIFICIO.ID_EDIFICIO, EDIFICIO.NOMBRE_EDIFICIO, EDIFICIO.ID_COMUNA, COMUNA.NOMBRE_COMUNA, T.CANTIDAD_DEPTOS
FROM COMUNA, EDIFICIO, (SELECT ID_EDIFICIO, COUNT(ID_EDIFICIO) AS CANTIDAD_DEPTOS
FROM DEPTO
GROUP BY ID_EDIFICIO) AS T
WHERE T.ID_EDIFICIO = EDIFICIO.ID_EDIFICIO AND EDIFICIO.ID_COMUNA = COMUNA.ID_COMUNA;

--6
SELECT ad.id_administrador, ad.nombre_administrador, count(*) FROM administrador AS ad, edificio AS ed
WHERE ad.id_administrador = ed.id_administrador 
GROUP BY ad.id_administrador 
ORDER BY count(*) DESC
FETCH FIRST 1 ROW ONLY;

--7
SELECT d.id_edificio, d.piso, MAX(d.habitantes) AS habitantes
FROM depto AS d
GROUP BY d.id_edificio, d.piso;

--8
SELECT d.id_edificio, td.id_tipo_depto, COUNT(*) AS total_deptos
FROM DEPTO AS d, TIPO_DEPTO AS td, EDIFICIO AS e
WHERE d.id_tipo_depto = td.id_tipo_depto AND d.id_edificio = e.id_edificio
GROUP BY d.id_edificio, td.id_tipo_depto;

--10
SELECT DISTINCT ON (id_edificio)
	*
FROM
	(SELECT depto.id_edificio, depto.id_tipo_depto, MIN(tpd.dimension) AS minimo
	FROM edificio AS ed, depto, tipo_depto AS tpd
	WHERE ed.id_edificio = depto.id_edificio AND depto.id_tipo_depto = tpd.id_tipo_depto
	GROUP BY depto.id_edificio, depto.id_tipo_depto
	ORDER BY id_edificio) AS listatipos
	GROUP BY id_edificio, id_tipo_depto, minimo
	ORDER BY id_edificio;
