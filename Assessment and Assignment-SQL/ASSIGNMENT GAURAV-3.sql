USE TCS;

-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercas,
-- Give each column an appropriate label. 
SELECT CONCAT(UCASE(SUBSTRING(last_name, 2, 1)), LCASE(SUBSTRING(last_name, 3, 4))) AS 'Capitalized_Last_Name'
FROM employees;

-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name, MONTH(hire_date) AS joining_month FROM employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 
SELECT last_name,
       CASE
           WHEN salary / 2 > 10000 THEN salary * 1.1
           ELSE salary * 1.115
       END AS adjusted_salary,
       1500 AS bonus_amount
FROM employees;

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case,
-- if the Manager name consists of 'z' replace it with '$! 
SELECT CONCAT(SUBSTRING(employee_ID, 1, 2), '00', SUBSTRING(employee_ID, 3), 'E') AS employee_ID,
       UPPER(department_id) AS department_id,
       UPPER(salary) AS salary,
       UPPER(manager_id) AS manager_id
FROM employees;

-- 5. Write a query that displays the employee's last names with the first letter capitalized andall other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 
SELECT 
CONCAT(UCASE(LEFT(last_name, 1)), LCASE(SUBSTRING(last_name, 2))) AS capitalized_last_name,
LENGTH(last_name) AS name_length FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 
SELECT last_name, LPAD(CONCAT('$', salary), 15, '$') AS SALARY
FROM employees;

-- 7. Display the employee's name if it is a palindrome 
SELECT first_name FROM employees WHERE first_name = REVERSE(first_name);

-- 8. Display First names of all employees with initcaps. 
SELECT INITCAP(first_name) AS initcap_first_name
FROM employees;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2), ' ', -1) AS extracted_word
FROM locations;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name. 
SELECT CONCAT(LOWER(SUBSTRING(First_Name, 1, 1)), Last_Name, '@systechusa.com') AS `e-mail address`, First_Name
FROM employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 
SELECT first_name, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE first_name = 'Trenna');

-- 12. Display the names and department name of all employees working in the same city as Trenna. 
SELECT first_name, job_id
FROM employees
WHERE city = (
    SELECT city
    FROM employees
    WHERE first_name = 'Trenna'
);

-- 13. Display the name of the employee whose salary is the lowest. 
SELECT first_name FROM employees
WHERE salary = ( SELECT MIN(salary) FROM employees);

-- 14. Display the names of all employees except the lowest paid.
SELECT first_name FROM employees
WHERE salary = ( SELECT MIN(salary) FROM employees);

