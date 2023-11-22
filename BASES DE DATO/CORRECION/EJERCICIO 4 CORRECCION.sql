1.

/*MIO*/

SELECT *
FROM demografia_basica;

SELECT provincia , anio , hombres
FROM demografia_basica
WHERE provincia IN('Cáceres','Badajoz') 
AND anio IN ('2002','2003');

/*Correcion*/

SELECT *
FROM demografia_basica
WHERE (anio = 2002 OR anio=2003)
AND (provincia='Cáceres'
OR provincia='Badajoz')
WHERE anio IN  2002 AND 2003;


/*
2. MIO*/

SELECT *
FROM demografia_basica;

SELECT provincia , anio , hombres , mujeres
FROM demografia_basica
WHERE hombres >= 600000 AND mujeres >=00000
ORDER BY hombres DESC , mujeres DESC;

/*CORRECION*/

SELECT *
FROM demografia_basica
WHERE hombres >= 600000 
OR mujeres >= 600000
ORDER BY (hombres+mujeres) DESC;

/*
3.MIO*/

SELECT *
FROM demografia_basica;

SELECT provincia , anio , hombres , mujeres
FROM demografia_basica
WHERE hombres >= 600000 AND mujeres >=00000 
AND anio BETWEEN 2015 AND 2019
ORDER BY hombres DESC , mujeres DESC;


/*CORRECCION*/
SELECT *
FROM demografia_basica
WHERE ((hombres >= 600000) 
OR (mujeres >= 600000))
AND anio >=2018
ORDER BY (hombres+mujeres) DESC;

/*
4.MIO*/

SELECT provincia, rango_edad, edad_mayor, sexo, anio,
numero_habitantes
FROM demografia_avanzada
WHERE sexo='M'
AND (edad_menor BETWEEN 20 AND 25)
AND (edad_mayor BETWEEN 24 AND 29)
AND provincia IN ('Sevilla', 'Granada', 'Córdoba','Cádiz', 'Málaga',
'Huelva','Almería', 'Jaén')
AND anio=2018
ORDER BY numero_habitantes;

/*CORRECION*/

SELECT *
FROM demografia_avanzada
WHERE edad_menor >= 20 
AND edad_mayor <=29
AND anio = 2018
AND sexo = 'M'
AND provincia IN ('Sevilla', 'Granada', 'Córdoba','Cádiz', 'Málaga',
'Huelva','Almería', 'Jaén')
ORDER BY numero_habitantes;

/*
5. MIO*/

SELECT sexo , numero_habitantes ,provincia ,anio ,rango_edad
FROM demografia_avanzada
WHERE anio BETWEEN 2010 AND 2015
AND rango_edad < '20' OR rango_edad > '65'
AND sexo ='M'
AND provincia= 'Madrid'
ORDER BY anio ASC  , numero_habitantes DESC , rango_edad ASC ;

/*CORRECCION*/

SELECT *
FROM demografia_avanzada
WHERE anio BETWEEN 2012 AND 2015
AND (edad_mayor < 20 OR edad_menor > 65)
AND sexo = 'H'
ORDER BY anio , numero_habitantes DESC, edad_menor;
