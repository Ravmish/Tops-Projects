use TCS;
-- 1. Write a query to display the last name, department number, department name for all employees. 
SELECT last_name, department_id, job_id
FROM employees;

-- 2.	Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
SELECT DISTINCT e.job_id, d.location
FROM employees e
JOIN departments d ON e.department_id = d.department_id;      -- Comments: Location not in table also what is department 4?

-- 3.	Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
SELECT e.last_name, e.job_id, e.location_id, l.city
FROM employees e
JOIN locations l ON e.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;                           -- Comments Location not in table, City not in table

-- 4.	Display the employee last name and department name of all employees who have an 'a' in their last name
SELECT last_name, job_id
FROM employees
WHERE last_name LIKE '%a%';

-- 5.	Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = (SELECT location_id FROM locations WHERE city = 'ATLANTA'));
-- Comments: Location not in table, City not in table, what is job meaning in Question(neglected)

-- 6.	Display the employee last name and employee number along with their manager's last name and manager number.
SELECT last_name, employee_id, manager_id
FROM employees;                                    -- Comments: Manager name not available

-- 7.	Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).
SELECT e1.last_name, e1.employee_id, e2.manager_id
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;           -- Comments: Manager name not available

-- 8.	Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
SELECT e1.last_name, e1.department_id, e2.last_name AS coworker
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id
ORDER BY e1.department_id, e1.last_name;

-- 9.	Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
SELECT first_name,
       CASE
           WHEN salary >= 50000 THEN 'A'
           WHEN salary >= 30000 THEN 'B'
           ELSE 'C'
       END AS job_id,
       salary
FROM employees;        -- Comments: what is job?, Grade column not in table, derived job_id based on salary

-- 10.	Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date.
--  Label the columns as Employee name, emp_hire_date,manager name,man_hire_date
SELECT e1.first_name AS 'Employee name', e1.hire_date AS 'emp_hire_date', e2.manager_id, e2.hire_date AS 'man_hire_date'
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.hire_date < e2.hire_date;                    -- Comments: Manager name not available

