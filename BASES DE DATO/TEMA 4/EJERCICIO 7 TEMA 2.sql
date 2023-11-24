/*1*/
SELECT *
FROM employees JOIN departments USING  (department_id)
		JOIN locations USING (location_id)
		JOIN countries USING (country_id)
WHERE country_name ILIKE  ('Belgium')
	AND TO_CHAR (hire_date,'YYYY')= '1997'
	
/*2*/

SELECT ROUND(AVG(min_salary),2)
FROM jobs JOIN employees USING (job_id)
	JOIN departments USING (department_id)
	JOIN locations USING (location_id)
	JOIN countries USING (country_id)
	JOIN regions USING (region_id)
WHERE department_name = 'Administration'
	AND region_name = 'Asia'

