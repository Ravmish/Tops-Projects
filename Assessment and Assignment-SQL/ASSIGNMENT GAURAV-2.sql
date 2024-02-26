USE TCS;

-- 1) Display the maximum, minimum and average salary and commission earned. 
SELECT
MAX(salary) AS max_salary,
MIN(salary) AS min_salary,
AVG(salary) AS avg_salary,
MAX(commission_pct) AS max_commission,
MIN(commission_pct) AS min_commission,
AVG(commission_pct) AS avg_commission
FROM employees;

-- 2) Display the department number, total salary payout and total commission payout for each department. 
SELECT department_id, SUM(salary) AS total_salary_payout, SUM(commission_pct) AS total_commission_payout
FROM employees
GROUP BY department_id;

-- 3) Display the department number and number of employees in each department. 
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;

-- 4) Display the department number and total salary of employees in each department.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
SELECT first_name
FROM employees
WHERE commission_pct IS NULL;

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
SELECT first_name, department_id, 
       IF(commission_pct IS NULL, 'No commission', commission_pct) AS commission_percentage
FROM employees;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns 
-- appropriately
SELECT first_name, salary, IFNULL(CONCAT(commission_pct * 2, '%'), 'No commission') AS commission
FROM employees;

-- 8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT e1.first_name, e1.department_id, e1.employee_id
FROM employees as e1
JOIN employees as e2 ON e1.first_name = e2.first_name
WHERE e1.department_id = e2.department_id
AND e1.employee_id != e2.employee_id
GROUP BY e1.employee_id, e1.department_id
ORDER BY e1.department_id, e1.first_name;

-- 9) Display the sum of salaries of the employees working under each Manager.
SELECT manager_id, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY manager_id;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 
select manager_id, count(*) from employees
group by manager_id
order by manager_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT last_name, department_id, salary, manager_id
FROM employees
WHERE last_name LIKE '_a%'
GROUP BY manager_id, last_name, department_id, salary
order by manager_id;

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
select department_id, avg(Sum_of_Salaries) as Average_Salary from
(Select department_id, sum(salary) as Sum_of_Salaries from employees
group by department_id) AS subquery
GROUP BY department_id
ORDER BY department_id;

-- 13) Select the maximum salary of each department along with the department id 
SELECT job_id, department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id, department_id
order by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT IFNULL(commission_pct, IF(salary IS NOT NULL, salary * 0.1, 1)) AS commission_percentage FROM employees;
