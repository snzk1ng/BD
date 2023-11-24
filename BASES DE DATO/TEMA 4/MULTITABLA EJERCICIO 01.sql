/*1*/

SELECT first_name , last_name , email 
FROM employees  e
			JOIN jobs j USING (job_id)
			JOIN departments d  USING (department_id)
			JOIN locations l USING (location_id)
			JOIN countries c USING (country_id)			  
WHERE country_name LIKE 'United Kingdom';
	
/*2*/

SELECT *
FROM departments;

SELECT DISTINCT department_name
FROM employees 
	JOIN departments USING (department_id)
	JOIN jobs USING (job_id)
WHERE hire_date::text ILIKE '%1993%';


/*3*/

SELECT DISTINCT region_name
FROM employees JOIN departments USING (department_id)
	JOIN locations USING (location_id)
	JOIN countries USING (country_id)
	JOIN regions USING (region_id)
WHERE salary < 10000

/*4*/

SELECT e.first_name , e.last_name
FROM employees e JOIN employees j 
	ON (e.manager_id=j.employee_id)
WHERE j.last_name ILIKE ('D%') OR e.last_name ILIKE ('H%') OR e.last_name ILIKE('S%')


/*5*/

SELECT COUNT (*)
FROM dependents 
	JOIN employees USING (employee_id)
	JOIN departments USING (department_id)
WHERE relationship = 'Child'
	AND department_name IN ('Marketing', 'Administration','IT')