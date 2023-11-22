
SELECT v.salida , v.llegada , fecha_reserva , desde , hasta 
FROM aeropuerto a JOIN avion ON (id_aeropuerto=id_avion)
			JOIN vuelo v USING (id_avion)
			JOIN reserva USING (id_vuelo)
WHERE GET_CHAR (fecha_reserva,'1 mon') 
	AND desde = 'Berlin'
	
	
	
	
SELECT *
FROM vuelos v JOIN aeropuerto origen
				ON (v.desde=origen.id_aeropuerto)
			JOIN aeropuerto llegada
				ON (v.hasta=llegada.id_aeropuerto)
				JOIN reserva r USING (id_vuelo)
WHERE origen.ciudad = 'Berlín'
	AND EXTRACT (month from salida) BETWEEN 1 AND 6
	AND AGE(salida,fecha_reserva) >= '1'::interval
ORDER BY r.fecha_reserva
