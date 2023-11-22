/*1MIO*/

SELECT *
FROM vuelos;

SELECT count (*)
FROM vuelos
WHERE salida::text ILIKE '2020-1%'
AND (desde = 'Berlín') AND (hasta = 'Londres') ;

/*1CORREGIDO*/

SELECT (*)
FROM vuelos
WHERE 

/*2MIO*/
SELECT * , 
ROUND (precio - (precio*descuento)/100,2)AS "precio_con_descuento"
FROM vuelos
WHERE salida::text ILIKE '2020-12%' 
	AND desde IN ('Sevilla' , 'Málaga')
	AND hasta IN ('Barcelona', 'Madrid');
/*2.CORREGIDO*/
SELECT  salida , desde , llegada , hasta , 
	ROUND (COALESCE (precio - precio * (descuento/100), precio),2)
FROM vuelos 
WHERE salida::text ILIKE '2020-12%'
	AND desde IN ('Sevilla', 'Málaga')
	AND hasta IN ('Madrid', 'Barcelona');
	
/*3MIO*/
SELECT *
FROM vuelos 
WHERE descuento IS null
AND (llegada BETWEEN '20-10-01 00:00:00'::date AND '20-10-15 00:00:00'::date
OR llegada BETWEEN '21-10-01 00:00:00'::date AND '21-10-15 00:00:00'::date)
AND hasta = 'Nueva York'
ORDER BY llegada;
 /*3.CORREGIDO*/
SELECT *
FROM vuelos 
WHERE descuento IS null
	AND hasta = 'Nueva York'
	AND SUBSTR(llegada::text,6,2) = '10'
	AND SUBSTR(llegada::text,9,2)::integer <=15;
/*4MIO*/
SELECT *
FROM vuelos 
WHERE salida::text ILIKE '2021-01%'
AND desde ILIKE 'Ámsterdam'
AND llegada::text ILIKE '%09:%%';

/*4CORREGIDO*/

SELECT *
FROM vuelos
WHERE desde = 'Ámsterdam'
	AND  salida::text ILIKE '2021-01%'
	AND SUBSTR (llegada::text,12,2)='09';


