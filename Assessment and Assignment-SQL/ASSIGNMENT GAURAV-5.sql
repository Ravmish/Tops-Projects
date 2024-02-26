use TCS;

-- 1.	Write a query to display employee numbers and employee name (first name, last name) of all the sales employees who received an amount of 2000 in bonus.
SELECT employee_id, first_name, last_name
FROM employees
WHERE bonus = 2000;               -- Comments: No bonus column only commission

-- 2.	Fetch address details of employees belonging to the state CA. If address is null, provide default value N/A.
SELECT first_name, COALESCE(address, 'N/A') AS address
FROM employees
WHERE state = 'CA';               -- Comments: No address or state column

-- 3.	Write a query that displays all the products along with the Sales OrderID even if an order has never been placed for that product.
SELECT p.ProductID, p.ProductName, e.SalesOrderID
FROM Products p
LEFT JOIN Employees e ON p.ProductID = e.ProductID;            -- Comments: Question not belong to this table

-- 4.	Find the subcategories that have at least two different prices less than $15.
SELECT subcategory
FROM employees
WHERE price < 15
GROUP BY subcategory
HAVING COUNT(DISTINCT price) >= 2;           -- Comments: Question not belong to this table

-- 5.	A. Write a query to display employees and their manager details. Fetch employee id, employee first name, and manager id, manager name.
-- B. Display the employee id and employee name of employees who do not have manager.

-- A
SELECT employee_id, first_name, manager_id
FROM employees;                                              -- Comments: Manager name not available

-- B
SELECT employee_id, first_name
FROM employees
WHERE manager_id IS NULL;

-- 6.	A. Display the names of all products of a particular subcategory 15 and the names of their vendors.
-- B. Find the products that have more than one vendor.

-- A
SELECT p.product_name, e.vendor_name
FROM products p
JOIN employees e ON p.vendor_id = e.vendor_id
WHERE p.subcategory_id = 15;                            -- Comments: Question not belong to this table

-- B
SELECT product_id, COUNT(DISTINCT vendor_id) AS num_vendors
FROM products
GROUP BY product_id
HAVING num_vendors > 1;                                -- Comments: Question not belong to this table

-- 7.	Find all the customers who do not belong to any store.
SELECT customers.*
FROM customers
LEFT JOIN store ON customers.store_id = store.store_id
WHERE store.store_id IS NULL;                          -- Comments: Question not belong to this table

-- 8.	Find sales prices of product 718 that are less than the list price recommended for that product.
SELECT sales_price
FROM products
WHERE product_id = 718 AND sales_price < list_price;        -- Comments: Question not belong to this table

-- 9.	Display product number, description and sales of each product in the year 2001.
SELECT product_number, description, sales
FROM products
WHERE YEAR(sale_date) = 2001;                              -- Comments: Question not belong to this table

-- 10.	Build the logic on the above question to extract sales for each category by year. Fetch Product Name, Sales_2001, Sales_2002, Sales_2003.
SELECT 
    ProductName,
    SUM(CASE WHEN Year = 2001 THEN Sales ELSE 0 END) AS Sales_2001,
    SUM(CASE WHEN Year = 2002 THEN Sales ELSE 0 END) AS Sales_2002,
    SUM(CASE WHEN Year = 2003 THEN Sales ELSE 0 END) AS Sales_2003
FROM employees
GROUP BY ProductName;                                      -- Comments: Question not belong to this table

-- 
