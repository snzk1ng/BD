
	


/*1*/
SELECT *
FROM employees JOIN departments USING  (department_id)
		JOIN locations USING (location_id)
		JOIN countries USING (country_id)
WHERE country_name ILIKE  ('Belgium')
	AND TO_CHAR (hire_date,'YYYY')= '1997'
	
/*2*/

SELECT ROUND(AVG(min_salary),2)
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
	AND  AGE(fecha_alta,fecha_operacion) BETWEEN '35 day'::interval AND '45 day'::interval
    AND provincia IN ('Huelva','Sevilla','Almería')
ORDER BY fecha_operacion DESC;

/*5*/

SELECT MAX(precio_final)  AS precio_max_cuadrado , 
		MIN (precio_final) AS precio_min_cuadrado
 FROM inmueble i JOIN operacion o USING (id_inmueble)
    JOIN comprador c USING (id_cliente)
    JOIN vendedor v USING (id_vendedor)
    JOIN tipo t ON (id_tipo=tipo_inmueble)
WHERE t.nombre NOT IN ('Casa','Piso')
	AND i.tipo_operacion = 'Venta'
	AND provincia ILIKE ('%N%')
	AND TO_CHAR (fecha_contratacion,'month') BETWEEN '_____' AND '_______'



/*6*/


SELECT ROUND(AVG(descuento),2)
FROM vuelo v JOIN aeropuerto origen ON (origen.id_aeropuerto=v.desde)
		JOIN aeropuerto llegada ON (llegada.id_aeropuerto=v.hasta)
WHERE origen.ciudad IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
AND llegada.ciudad NOT IN ('Sevilla','Barcelona','Madrid','Bilbao','Málaga')
	AND TO_CHAR(v.desde, 'D') <> ('6') 
		AND TO_CHAR(v.desde, 'D') <> ('7')
			AND TO_CHAR(v.desde, 'D') <> ('5')	
AND EXTRACT (hour FROM salida) > '15'
		
				
	
