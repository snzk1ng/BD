/*1*/
SELECT *
FROM climatologia;

SELECT  avg(precipitacion_total),2 
FROM climatologia
WHERE estacion IN ('Huesca', 'Zaragoza', 'Teruel')
	AND (fecha::text LIKE ('2019-06-%'))
	AND precipitacion_total < 20;

/*2*/

SELECT  count(*) AS "suma_columnas" 
FROM climatologia
WHERE fecha::text LIKE ('2019-02-%')
	AND (estacion ILIKE ('%F%'))
	OR estacion ILIKE ('%T%')
	OR estacion ILIKE ('%X%');
	
/*4*/

SELECT estacion , provincia , fecha , racha_viento ,
	CASE 
		WHEN 25 < racha_viento AND racha_viento <= 40 THEN 'Ventoso'
		WHEN 40 < racha_viento AND racha_viento <=60 THEN 'MUY VENTOSO'
		WHEN 60 < racha_viento THEN  'Huracanado'
		WHEN racha_viento IS NULL THEN 'Normal'
END
FROM climatologia
WHERE racha_viento::text > '25'
	AND (hora_racha_viento::text LIKE ('15:00'))
		AND (fecha::text LIKE ('%-03-%'))
		OR (fecha::text LIKE ('%-04-%'))
	AND temperatura_maxima > 23
ORDER BY racha_viento DESC;


/*3*/
SELECT *
FROM climatologia
WHERE substr(provincia,1,2) LIKE ('Ba')
	AND (temperatura_maxima::text BETWEEN '25' AND '30')
	AND (temperatura_minima::text < '15')
	AND (fecha::text LIKE ('2019-09%'))
		OR (fecha::text LIKE ('2019-10%'));

	