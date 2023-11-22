SELECT '2004-05-15'::date ,
		'2008-12-10 12:00:00'::timestamp;

SELECT 'today'::date ,
		'now'::timestamp;
		
SELECT CURRENT_DATE + '1 year  1 month'::interval

SELECT CURRENT_DATE +1

SELECT '1 year'::interval + '2 year'::interval


SELECT CURRENT_DATE - '2004-05-15'::date 

SELECT CURRENT_DATE + '2004-05-15'::date 

SELECT TO_CHAR(salida, 'DD/FMmon/YYYY HH24:MI:SS')
FROM vuelos;

SELECT *
FROM vuelos 
WHERE TO_CHAR(salida, 'MM')='04';


SELECT *
FROM vuelos
WHERE salida = '2020-07-05'::date

SELECT *
FROM vuelos 
