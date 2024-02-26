USE TCS;
-- 1.	Write a query to display the last name and hire date of any employee in the same department as SALES.
SELECT last_name, hire_date
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE job_id = 'SALES');

-- 2.	Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
SELECT employee_id, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

-- 3.	Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE last_name LIKE '%u%'
);

-- 4.	Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
SELECT last_name, department_id, job_id
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE departments.department_location = 'ATLANTA';

-- 5.	Display the last name and salary of every employee who reports to FILLMORE.
SELECT last_name, salary
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees WHERE last_name = 'FILLMORE');

-- 6.	Display the department number, last name, and job ID for every employee in the OPERATIONS department.
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = 'OPERATIONS';

-- 7.	Modify the above query to display the employee numbers, last names, and salaries of all employees 
-- who earn more than the average salary and who work in a department with any employee with a 'u'in their name.
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');

-- 8.	Display the names of all employees whose job title is the same as anyone in the sales dept.
SELECT first_name, last_name
FROM employees
WHERE job_id IN (SELECT job_id FROM employees WHERE job_id = 'SA_REP');

-- 9.	Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. 
-- Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, 
-- employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.

