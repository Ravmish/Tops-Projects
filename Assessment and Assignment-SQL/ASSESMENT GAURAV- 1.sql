CREATE DATABASE THEMIS;
USE THEMIS;
CREATE TABLE WORKER(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
SALARY INT ,
joining_date DATETIME,
DEPARTMENT VARCHAR(50)
);
DROP TABLE WORKER;
DROP DATABASE THEMIS;
USE WORKER;
INSERT INTO WORKER VALUES(1, 'MONIKA', 'ARORA', 10000, '2014-02-20 09:00:00', 'HR');
SELECT * FROM WORKER;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
SELECT * FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
SELECT * FROM Worker 
WHERE first_name IN ('Vipul', 'Satish');

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
SELECT * FROM Worker
WHERE FIRST_NAME LIKE '%H' AND '______';

-- Write an SQL query to print details of the Workers whose SALARY lies between 1LAKHS AND 5LAKHS
SELECT * FROM Worker
WHERE Salary BETWEEN 100000 AND 500000;

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT DEPARTMENT, COUNT(*) as duplicate_count FROM WORKER
GROUP BY DEPARTMENT
HAVING COUNT(*) > 1;

-- Write an SQL query to show the top 6 records of a table. 
SELECT * FROM WORKER
ORDER BY WORKER_ID
LIMIT 6;

-- Write an SQL query to fetch the departments that have less than five people in them. 
SELECT department FROM WORKER
GROUP BY department
HAVING COUNT(*) < 5;

-- Write an SQL query to show all departments along with the number of people in there
SELECT DEPARTMENT, COUNT(*) as NUMBER_OF_PEOPLE FROM WORKER
GROUP BY DEPARTMENT
HAVING COUNT(*) > 1;

-- Write an SQL query to print the name of employees having the highest salary in each department. 

SELECT  MAX(SALARY) FROM WORKER
GROUP BY DEPARTMENT;

SELECT * FROM WORKER
WHERE SALARY IN(SELECT  MAX(SALARY) FROM WORKER
GROUP BY DEPARTMENT );
