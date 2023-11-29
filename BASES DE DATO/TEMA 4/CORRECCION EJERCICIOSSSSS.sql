/*Seleccionar el nombre y los dos apellidos de aquellos clientes  que reservaron
un vuelo que salió en un miércoles con una antelación de 35 días (despreciando la hora),
y que su segundo apellido tenga exactamente 4 letras. La salida del nombre no debe ser totalmente 
en mayúsculas, 
sino con la primera letra de cada palabra en mayúsculas, y el resto en minúsculas*/

SELECT c.nombre , c.apellido1 , c.apellido2
FROM cliente c JOIN reserva USING (id_cliente)
	JOIN vuelo USING (id_vuelo)
WHERE TO_CHAR(fecha_reserva,'ID')='3'
 AND c.nombre ILIKE '____'
 AND AGE(fecha_reserva:date-salida::date,'DD')BETWEEN '1' AND '35'
 
/*correccion*/

SELECT INITCAP(c.nombre), INITCAP(c.apellido1), INITCAP(c.apellido2)
	FROM vuelo JOIN reserva USING (id_vuelo)
	JOIN cliente c USING (id_cliente)
WHERE TO_CHAR(salida,'MM/YYYY')='09/2022'
	