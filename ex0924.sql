USE exdb;
SHOW TABLES;

SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM Shippers;

SELECT o.customerID, c.CustomerName, o.OrderDate, s.ShipperID, s.ShipperName
FROM orders AS o
INNER JOIN customers AS c
	ON o.CustomerID = c.CustomerID; 
INNER JOIN shippers AS s
	ON o.shipperID = shipperID;


--- Left Join 테이블 2개 
SELECT * FROM customers c
LEFT JOIN orders o
	ON c.CustomerID = o.CustomerID;
	

-- Right Join 테이블 2개

SELECT o.OrderID, e.employeeID, e.FirstName 
FROM orders o
RIGHT JOIN employees e
	ON o.EmployeeID = e.employeeID 
ORDER BY o.OrderID;


-- CROSS JOIN

SELECT c.CustomerID, c.CustomerName
FROM customers c
CROSS JOIN orders o;
WHERE c.customerID = o.CustomersID;


-- SELF JOIN

SELECT a.customerName cn1, b.customerName cn2, a.city
FROM Customers a, Customers b
WHERE a.customerID <> b.CustomerID
AND a.city = b.city
ORDER BY a.city;


-- Union

SELECT City FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;


SELECT city, country FROM customers
WHERE country = 'Germany'
UNION
SELECT city,country FROM Suppliers
WHERE country = 'Germany'
ORDER BY city;


SELECT 'Customer' AS TYPE, Customer, city, country 
FROM customers
union
SELECT 'Supplier', ContactName, city, country
FROM suppliers;


SELECT CustomerName, City, Country
FROM customers
ORDER BY 
(CASE
	WHEN City IS NULL then country
	ELSE city
END);

