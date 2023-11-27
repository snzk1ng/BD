
	


/*1*/
SELECT count(*)
FROM employees  JOIN departments USING  (department_id)
		 JOIN locations USING (location_id)
		 JOIN countries USING (country_id)
WHERE country_name ILIKE  ('Belgium')
	AND TO_CHAR (hire_date,'YYYY')= '1997'
	
/*1 CORRECCION*/
SELECT count(*)
FROM employees RIGHT JOIN departments USING  (department_id)
		RIGHT JOIN locations USING (location_id)
		RIGHT JOIN countries USING (country_id)
WHERE country_name ILIKE  ('Belgium')
	AND TO_CHAR (hire_date,'YYYY')= '1997'
	
/*2*/

SELECT COALESCE (ROUND(AVG(max_salary),2))
FROM jobs JOIN employees USING (job_id)
	JOIN departments USING (department_id)
	JOIN locations USING (location_id)
	JOIN countries USING (country_id)
	JOIN regions USING (region_id)
WHERE department_name = 'Administration'
	AND region_name = 'Asia'

/*3*/


SELECT c.nombre, v.nombre, i.provincia, o.fecha_operacion
FROM inmueble i JOIN operacion o USING (id_inmueble)
    JOIN comprador c USING (id_cliente)
    JOIN vendedor v USING (id_vendedor)
    JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE t.nombre IN ('Casa','Piso')
    AND tipo_operacion = 'Alquiler'
    AND EXTRACT(MON from fecha_operacion) BETWEEN 7 and 9
    AND provincia IN ('Huelva','Sevilla','Almería')
ORDER BY fecha_operacion DESC;

/*4*/

SELECT c.nombre, v.nombre, i.provincia, o.fecha_operacion
FROM inmueble i JOIN operacion o USING (id_inmueble)
    JOIN comprador c USING (id_cliente)
    JOIN vendedor v USING (id_vendedor)
    JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE t.nombre IN ('Casa','Piso')
    AND i.tipo_operacion = 'Alquiler'
    AND EXTRACT(MON from fecha_operacion) BETWEEN 7 and 9
	AND  (AGE(fecha_operacion,fecha_alta)) BETWEEN '35 day'::interval AND '45 day'::interval
    AND provincia IN ('Huelva','Sevilla','Almería')
ORDER BY fecha_operacion DESC;

/*OTRA MANERA DE HACERLO SIN INTERVALO AGE SERIA*/
--AND fecha_operacion BETWEEN fecha_alta + 35 AND fecha_alta + 45

/*5*/

SELECT MAX(precio_final/superficie)  AS precio_max_cuadrado , 
		MIN (precio_final/superficie) AS precio_min_cuadrado
 FROM inmueble i JOIN operacion o USING (id_inmueble)
    JOIN comprador c USING (id_cliente)
    JOIN vendedor v USING (id_vendedor)
    JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE t.nombre NOT IN ('Casa','Piso') /*NOT IN (DECIR QUE NO SEA EN ())*/
	AND i.tipo_operacion = 'Venta'
	AND provincia ILIKE ('%N%')
	AND TO_CHAR (fecha_contratacion,'month') BETWEEN '_____' AND '_______'

/*5CORRECCION*/
SELECT MAX(precio_final/superficie)  AS precio_max_cuadrado , 
		MIN (precio_final/superficie) AS precio_min_cuadrado
 FROM inmueble i JOIN operacion o USING (id_inmueble)
    JOIN comprador c USING (id_cliente)
    JOIN vendedor v USING (id_vendedor)
    JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE t.nombre NOT IN ('Casa','Piso') /*NOT IN (DECIR QUE NO SEA EN ())*/
	AND i.tipo_operacion = 'Venta'
	AND provincia ILIKE ('%N%')
	AND LENGTH( TO_CHAR (fecha_operacion,'FMmonth')) BETWEEN 5 AND 7 /*usamos lenght para contar el numero
																	de caracteres y FM para los espacios
																	en blanco*/

/*6*/


SELECT ROUND(AVG(descuento),2)
FROM vuelo v JOIN aeropuerto origen ON (origen.id_aeropuerto=v.desde)
		JOIN aeropuerto llegada ON (llegada.id_aeropuerto=v.hasta)
WHERE origen.ciudad IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
AND llegada.ciudad NOT IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
	AND TO_CHAR(v.desde, 'D') != ('6') 
		AND TO_CHAR(v.desde, 'D') != ('7')
			AND TO_CHAR(v.desde, 'D') != ('5')	
AND EXTRACT (hour FROM salida) > '15'


/*6 correccion*/

SELECT ROUND(AVG(coalesce(descuento,0)),2)
FROM vuelo v JOIN aeropuerto origen ON (origen.id_aeropuerto=v.desde)
		JOIN aeropuerto llegada ON (llegada.id_aeropuerto=v.hasta)
WHERE origen.ciudad IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
	AND llegada.ciudad NOT IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
	AND (EXTRACT (isodow from salida) --usamos isodow para extraer dia de la semana en español
		 BETWEEN 1 AND 4 
		 OR
		 (
		 EXTRACT(isodow from salida)=5
			 AND EXTRACT (hour from salida)<15))
		 									
					
				
	
