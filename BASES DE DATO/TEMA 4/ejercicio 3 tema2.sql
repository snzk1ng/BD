1
SELECT *
FROM inmueble JOIN operacion USING (id_inmueble)
	JOIN vendedor v USING (id_vendedor)
WHERE superficie > 200 
	AND v.nombre ILIKE '%a%'
	AND (TO_CHAR(fecha_operacion, 'ID') = '1'
		AND
		 TO_CHAR(fecha_operacion, 'MM') = '02')
	OR
	(TO_CHAR(fecha_operacion,'ID')='5'
	AND
	TO_CHAR (fecha_operacion, 'MM')='03')
2

SELECT ROUND (AVG(i.precio/superficie),2) AS "Precio medio m2"
FROM inmueble i JOIN tipo t  ON (i.tipo_inmueble=t.id_tipo)
WHERE date_part('month',fecha_alta)IN (3,4)
	AND tipo_operacion = 'Alquiler'
	AND nombre IN ('Casa','Piso')
	AND provincia IN ('Cádiz','Málaga','Almería','Huelva','Granada')
	
3

SELECT ROUND (AVG( (ABS (precio-precio_final)/precio)*100),2)
FROM inmueble i JOIN operacion o  USING (id_inmueble)
	JOIN tipo t ON (tipo_inmueble=t.id_tipo)
WHERE TO_CHAR(o.fecha_operacion,'MM') IN ('01')
	AND t.nombre IN ('Oficina','Local','Suelo')
	AND tipo_operacion = 'Alquiler'
	*/
	
4

SELECT  c.nombre 
FROM inmueble i JOIN tipo t ON (tipo_inmueble=t.id_tipo)
				JOIN  operacion o USING (id_inmueble)
				JOIN comprador c USING (id_cliente)
WHERE tipo_operacion = 'Venta'
	AND provincia IN ('Jaén','Córdoba')
	AND t.nombre IN ('Casa','Piso')
	AND precio_final BETWEEN 150000 AND 200000
	AND fecha_operacion BETWEEN 
	fecha_alta + '3mon'::interval AND
	fecha_alta + '4mon'::interval;
	
	
5



SELECT AVG (precio), AVG(precio_final),
	ROUND (((AVG(precio)-AVG(precio_final))/AVG(precio)*100),2)
FROM inmueble i JOIN operacion o USING (id_inmueble)
        JOIN tipo t ON (i.tipo_inmueble = t.id_tipo)
WHERE  t.nombre IN ('Casa','Piso')
  AND i.superficie < 100
  AND fecha_operacion >= fecha_alta + '1 mon'::interval
  	

6

SELECT MAX (o.precio_final)
FROM inmueble JOIN tipo ON (id_tipo=tipo_inmueble)
	JOIN operacion o USING (id_inmueble)
WHERE TO_CHAR(fecha_operacion,'MM') IN ('07','08')
	AND provincia = 'Huelva'
	AND nombre IN ('Casa','Piso')
	AND tipo_operacion = 'Alquiler'

	
7

SELECT i.provincia , i.precio ,o.id_cliente ,o.id_vendedor,o.fecha_operacion
FROM operacion o JOIN inmueble i USING (id_inmueble)
				JOIN tipo t ON (tipo_inmueble=t.id_tipo)
WHERE TO_CHAR(fecha_alta, 'MM') IN ('05')
	AND TO_CHAR (o.fecha_operacion, 'YYYY''MM') IN ('2022''10')
	AND i.provincia IN ('Jaén','Málaga','Granada')
ORDER BY precio DESC
				
				
