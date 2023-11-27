/*1*/
SELECT *
FROM inmueble  JOIN tipo t ON (id_inmueble=t.id_tipo)
	JOIN operacion USING (id_inmueble)
WHERE provincia = 'Sevilla'
		AND tipo_operacion ='Venta'
 			AND TO_CHAR (fecha_alta,'YYYY') IN ('2019')
 				AND t.nombre = 'Piso'
	ORDER BY precio_final DESC
	LIMIT 3
 
 
/*2*/


	
	SELECT ROUND(AVG(precio_final),2) AS "precio medio de los alquileres"
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE tipo_operacion= 'Alquiler'
    AND provincia='Málaga'
    AND EXTRACT(mon from fecha_operacion) IN (7,8);

	
/*3*/

SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
WHERE provincia IN  ('Jaén','Córdoba')
	AND TO_CHAR(fecha_operacion,'MM') IN ('10','11','12')
	AND TO_CHAR(fecha_operacion, 'YYYY') IN ('2019','2020')
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
	FROM inmueble i JOIN tipo t ON (t.id_tipo=id_inmueble)
		JOIN operacion USING (id_inmueble)
	WHERE i.tipo_operacion = 'Venta'
		AND provincia='Granada'
		AND t.nombre = 'Piso'
		AND (AGE(fecha_operacion,fecha_alta)) BETWEEN '3 mon'::interval AND '6 mon'::interval 	

/*6*/

SELECT (AVG(precio_final))
FROM inmueble JOIN operacion USING (id_inmueble)
		JOIN tipo t ON (t.id_tipo=id_inmueble)
WHERE provincia IN  ('Sevilla')
	AND TO_CHAR(fecha_operacion,'MM') IN ('05')
	AND TO_CHAR(fecha_operacion, 'YYYY') IN ('2017')
	AND tipo_operacion = 'Alquiler'
ORDER BY precio_final DESC
	LIMIT 10
