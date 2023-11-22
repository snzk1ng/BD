SELECT * 
FROM climatologia;

SELECT sum(precipitacion_total)
FROM climatologia
WHERE provincia IN ('A Coruña', 'Lugo','Ourense','Pontevedra')
AND fecha::char varying LIKE '2019-09-__'


/*EJERCICIO 4 (CORRECCION Y HECHO YA QUE NO SABIA HACERLO*/

	SELECT *,

	CASE 
		WHEN precipitacion_total=0 THEN 0
		ELSE precipitacion_0_a_6 / precipitacion_total
		END AS " % 0 a 6" ,
		
	CASE
		WHEN precipitacion_total=0 THEN 0
		ELSE precipitacion_6_a_12 / precipitacion_total
		END AS " 6 a 12% " , 
		
	CASE
		WHEN precipitacion_total=0 THEN 0
		ELSE precipitacion_12_a_18 / precipitacion_total
		END AS " %12 a 18%" , 
		
	CASE 
		WHEN precipitacion_total=0 THEN 0
		ELSE precipitacion_18_a_24 / precipitacion_total
		END AS " %18 a 24" 
		
	
FROM climatologia
WHERE fecha BETWEEN '2019-03-21'::date
			AND '2019-06-20'::date
			AND provincia IN ('Toledo', 'Guadalajara', 
							  'Cuenca', 'Albacete''Ciudad Real')

ORDER BY fecha ASC;
				
/*EJERCICIO05 CORRECCION*/

SELECT *
FROM climatologia
WHERE precipitacion_total > 50
AND (precipitacion_6_a_12/precipitacion_total)
	BETWEEN 0.6 AND 0.8
	ORDER BY precipitacion_total DESC, fecha ASC;

				
				
				


