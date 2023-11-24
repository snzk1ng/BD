SELECT *
FROM aeropuerto JOIN vuelo ON (id_aeropuerto=desde);

/*manera correcta de hacerlo*/
/*join cruzado*/
SELECT *
FROM employees CROSS JOIN departments;

/*natural join*/
SELECT *
FROM countries NATURAL JOIN regions;

/*join using*/
SELECT *
FROM employees JOIN departments USING (department_id);
/*join on*/
SELECT *
FROM aeropuerto JOIN vuelo ON (id_aeropuerto=desde);

/*VUELOS DESDE MADRID A SEVILLA*/
SELECT *
FROM aeropuerto a1 JOIN vuelo ON (id_aeropuerto=desde)
	JOIN aeropuerto a2 ON (a2.id_aeropuerto=hasta)
WHERE a1.ciudad = 'Madrid'
	AND a2.ciudad = 'Sevilla';

