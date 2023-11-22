
/*EJERCICIO 2*/	
/*1*/

SELECT e.first_name , e.last_name
FROM employees e  JOIN departments USING (department_id)
	WHERE department_name IN ('IT', 'Fincance')
	AND SUBSTR(hire_date::text,6,2)::int IN (4,6)
	
/*2*/
SELECT e.first_name , e.last_name
FROM employees e JOIN departments USING (department_id)
	JOIN employees m ON (e.manager_id = m.employee_id)
	WHERE department_name= 'Administration'
/*correccion 2*/

SELECT DISTINCT m.first_name , m.last_name
FROM employees m JOIN employees e
		ON (m.employee_id = e.manager_id)
		JOIN departments d ON (e.department_id = d.department_id)
WHERE department_name = 'Administration'
	
/*3*/
SELECT country_name
FROM countries JOIN locations USING(country_id)
	JOIN departments USING (location_id)
WHERE department_name='Public Relations'

/*4*/

SELECT e.*
FROM employees e JOIN departments d USING (department_id)
    JOIN locations l USING (location_id)
    JOIN countries c USING (country_id)
    JOIN regions r USING (region_id)
WHERE r.region_name = 'Americas';

/*5*/
SELECT dep.first_name, dep.last_name, e.first_name, e.last_name
FROM dependents dep
    JOIN employees e USING (employee_id)
    JOIN departments d USING (department_id)
    JOIN locations l USING (location_id)
    JOIN countries c USING (country_id)
WHERE country_name IN ('Mexico', 'Argentina', 'United States of America', 'Brazil', 'Canada')
	AND d.relationship = 'Child'
ORDER BY country_name;

/*6*/

SELECT first_name
FROM employees
    JOIN departments ON employees.department_id = departments.department_id
    JOIN locations ON departments.location_id = locations.location_id
    WHERE (employees.employee_id= 100 
    OR locations.location_id = 1400)
ORDER BY employees.first_name ASC