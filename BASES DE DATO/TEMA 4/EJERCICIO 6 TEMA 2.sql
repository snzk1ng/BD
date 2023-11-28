/*1*/
SELECT *
FROM inmueble i JOIN  operacion USING (id_inmueble)
	JOIN tipo t ON (tipo_inmueble=t.id_tipo)
WHERE provincia = 'Sevilla'
		AND tipo_operacion ='Venta'
 			AND EXTRACT (year from fecha_operacion) = 2021
 				AND nombre = 'Piso'
	ORDER BY precio_final DESC
	LIMIT 3
 
 
/*2*/


	
	SELECT *
FROM inmueble left JOIN operacion o USING (id_inmueble)
WHERE tipo_operacion= 'Alquiler'
    AND provincia='Málaga'
    AND EXTRACT(mon from fecha_alta) IN (7,8)
	AND o.id_inmueble is null
	LIMIT 5
	

	
/*3*/

SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE provincia IN  ('Jaén','Córdoba')
	AND TO_CHAR(fecha_operacion,'MM') IN ('10','11','12')
	AND TO_CHAR(fecha_operacion, 'YYYY') IN ('2021','2022')
	AND tipo_operacion = 'Venta'
	
/*3 CORRECCION PARA PONER EL ULTIMO TRIMESTRE EN CASO DE QUE LO PIDA SIN MM*/
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE provincia IN  ('Jaén','Córdoba')
	AND TO_CHAR(fecha_operacion,'Q') IN ('1')
	AND TO_CHAR(fecha_operacion, 'YYYY') IN ('2021','2022')
	AND tipo_operacion = 'Venta'
	
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE provincia IN  ('Jaén','Córdoba')
	AND TO_CHAR(fecha_operacion,'Q') IN ('1')
	AND TO_date(fecha_operacion, 'MM-DD''MM-DD') BETWEEN '01-15' AND '03-15'
	AND tipo_operacion = 'Venta'
	
/*4*/

SELECT ROUND(AVG(precio_final),2) AS "media precio final parking"
FROM inmueble  JOIN tipo t ON (id_inmueble=t.id_tipo)
	 JOIN operacion USING (id_inmueble)
WHERE t.nombre = 'Parking'
 	AND provincia = 'Huelva'
 	AND tipo_operacion = 'Venta'
	AND TO_CHAR (fecha_operacion , 'ID') BETWEEN '1' AND '5'	
	
/*5*/
SELECT *
FROM tipo JOIN inmueble ON (tipo_inmueble=id_tipo)
    JOIN operacion USING (id_inmueble)
	WHERE tipo_operacion = 'Venta'
		AND provincia='Granada'
		AND nombre = 'Piso'
		AND (AGE(fecha_operacion,fecha_alta)) BETWEEN '3 mon'::interval AND '6 mon'::interval 	

/*6*/

SELECT (AVG(precio_final))
FROM inmueble JOIN operacion USING (id_inmueble)
		JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE provincia IN  ('Sevilla')
	AND TO_CHAR(fecha_operacion,'MM') IN ('05')
	AND TO_CHAR(fecha_operacion, 'YYYY') IN ('2017')
	AND tipo_operacion = 'Alquiler'
ORDER BY precio_final DESC
	LIMIT 10
