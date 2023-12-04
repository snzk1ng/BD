/*Seleccionar el nombre de los vendedores, la operación, la provincia, la fechad de alta, 
fecha de operación y el precio final de la provincia de Sevilla que los vendedores contengan 
una 'e' en su nombre y el tipo de operación sea 'Alquiler' y se haya realizado los jueves de agosto
y los domingos de abril. 
Ordenarlo por fecha de alta ascendente y precio final descendente.*/


SELECT *
FROM vendedor v JOIN operacion o USING (id_vendedor)
		JOIN inmueble  i USING (id_inmueble)
WHERE v.nombre ILIKE ('%e%')
	AND i.provincia	='Sevilla'
	AND tipo_operacion = 'Alquiler'
	AND (EXTRACT (ISODOW from fecha_operacion) = 4
	AND EXTRACT (month from fecha_operacion) = 8
	or EXTRACT (ISODOW from fecha_operacion) = 7
	AND EXTRACT (month from fecha_operacion) = 4)
	
	SELECT v.nombre, tipo_operacion, provincia, fecha_alta, fecha_operacion, precio_final
FROM tipo t JOIN inmueble i ON (id_tipo = tipo_inmueble)
 JOIN operacion o USING (id_inmueble)
 JOIN vendedor v USING (id_vendedor)
WHERE i.provincia = 'Sevilla'
 AND v.nombre  LIKE '%e%'
 AND tipo_operacion = 'Alquiler'
 AND (date_part('Day', o.fecha_operacion) = 5
 AND date_part('Month', o.fecha_operacion) = 8
 OR date_part('Day', o.fecha_operacion) = 1
 AND date_part('Month', o.fecha_operacion) = 4)
 ORDER BY fecha_alta, precio_final DESC;
 
 
 /* Sacame los vuelos que hayan salido desde sevilla y lleguen a madrid donde el precio del vuelo
no sea mayor de 150 euros y
la diferencia desde que reserva el vuelo hasta que sale (el avion) no sea mas de 20 dias?*/

SELECT DISTINCT *
FROM vuelo v 
		JOIN aeropuerto origen ON (origen.id_aeropuerto=v.desde)
		JOIN aeropuerto llegada ON (llegada.id_aeropuerto=v.hasta)
		JOIN reserva USING (id_vuelo)
WHERE origen.ciudad = 'Sevilla'
		AND llegada.ciudad = 'Madrid'
		AND precio < 150
		AND ABS(salida::date-fecha_reserva::date) <= 20 
		
--6.¿Cuál es el descuento medio obtenido en vuelos donde el origen sea España y el destino 
--fuera de España, siempre que estos vuelos no se hayan realizado en fin de semana 
--contaremos como fin de semana los Viernes a partir de las 15:00)?
		
SELECT *
FROM vuelo v 
		JOIN aeropuerto origen ON (origen.id_aeropuerto=v.desde)
		JOIN aeropuerto llegada ON (llegada.id_aeropuerto=v.hasta)
	WHERE origen.ciudad IN ('Sevilla','Barcelona','Madrid','Málaga','Bilbao')
		AND llegada.ciudad NOT IN ('Sevilla','Barcelona','Madrid','Málaga','Bilbao')
		AND (EXTRACT (ISODOW from salida) BETWEEN 1 AND 4
		OR (EXTRACT(ISODOW from salida)=5
		AND EXTRACT (HOUR FROM SALIDA)<15))




