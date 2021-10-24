select * from pago_gg_depto
where morosidad = false and fecha_emision > Current_Date - interval '3 months'

select d.id_edificio, d.piso, MAX(d.habitantes)
From depto as d
group by d.id_edificio, d.piso;