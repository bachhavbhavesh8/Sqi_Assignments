-- SALESPEOPLE TABLE
CREATE TABLE salespeople (
    snum NUMBER PRIMARY KEY,
    sname VARCHAR2(20),
    city VARCHAR2(20),
    comm NUMBER(4,2)
);

SELECT* FROM salespeople;



-- CUSTOMERS TABLE
CREATE TABLE customers (
    cnum NUMBER PRIMARY KEY,
    cname VARCHAR2(20),
    city VARCHAR2(20),
    rating NUMBER,
    snum NUMBER,
    CONSTRAINT fk_cust_sales FOREIGN KEY (snum) REFERENCES salespeople(snum)
);
SELECT* FROM CUSTOMERS;

-- ORDERS TABLE
CREATE TABLE orders (
    onum NUMBER PRIMARY KEY,
    amt NUMBER(10,2),
    odate DATE,
    cnum NUMBER,
    snum NUMBER,
    CONSTRAINT fk_ord_cust FOREIGN KEY (cnum) REFERENCES customers(cnum),
    CONSTRAINT fk_ord_sales FOREIGN KEY (snum) REFERENCES salespeople(snum)
);


-- SALESPEOPLE DATA
INSERT INTO salespeople VALUES (1001,'Peel','London',0.12);
INSERT INTO salespeople VALUES (1002,'Serres','San Jose',0.13);
INSERT INTO salespeople VALUES (1004,'Monika','London',0.11);
INSERT INTO salespeople VALUES (1007,'Rifkin','Barcelona',0.15);
INSERT INTO salespeople VALUES (1003,'Axelrod','New York',0.10);
INSERT INTO salespeople VALUES (1005,'Franc','London',0.26);

SELECT* FROM salespeople;


-- CUSTOMERS DATA
INSERT INTO customers VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO customers VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO customers VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO customers VALUES (2004,'Grass','Berlin',300,1002);
INSERT INTO customers VALUES (2006,'Clemens','London',100,1001);
INSERT INTO customers VALUES (2007,'Pereira','Rome',100,1004);
INSERT INTO customers VALUES (2008,'Cisneros','San Jose',300,1007);

select*from customers;

-- ORDERS DATA


INSERT INTO orders VALUES (3001,18.69,TO_DATE('03-Oct-1996 12:30','DD-MM-YYYY HH24:MI'),2008,1007);
INSERT INTO orders VALUES (3003,767.19,TO_DATE('03-Oct-1996 13:45','DD-MM-YYYY HH24:MI'),2001,1001);
INSERT INTO orders VALUES (3002,1900.10,TO_DATE('03-Oct-1996 12:05','DD-MM-YYYY HH24:MI'),2007,1004);
INSERT INTO orders VALUES (3005,5160.45,TO_DATE('03-Oct-1996 14:00','DD-MM-YYYY HH24:MI'),2003,1002);
INSERT INTO orders VALUES (3006,1098.16,TO_DATE('03-Oct-1996 13:37','DD-MM-YYYY HH24:MI'),2008,1007);
INSERT INTO orders VALUES (3009,1713.23,TO_DATE('04-Oct-1996 15:21','DD-MM-YYYY HH24:MI'),2002,1003);
INSERT INTO orders VALUES (3007,75.75,TO_DATE('04-Oct-1996 16:02','DD-MM-YYYY HH24:MI'),2002,1003);
INSERT INTO orders VALUES (3008,4723.00,TO_DATE('05-Oct-1996 12:07','DD-MM-YYYY HH24:MI'),2006,1001);
INSERT INTO orders VALUES (3010,1309.95,TO_DATE('06-Oct-1996 13:12','DD-MM-YYYY HH24:MI'),2004,1002);
INSERT INTO orders VALUES (3011,9891.88,TO_DATE('06-Oct-1996 13:09','DD-MM-YYYY HH24:MI'),2006,1001);
INSERT INTO orders VALUES (3012,3455.78,TO_DATE('04-Oct-1996 15:21','DD-MM-YYYY HH24:MI'),2002,1003);
INSERT INTO orders VALUES (3013,1245.98,TO_DATE('04-Oct-1996 16:32','DD-MM-YYYY HH24:MI'),2002,1003);
INSERT INTO orders VALUES (3014,3721.53,TO_DATE('05-Oct-1996 12:45','DD-MM-YYYY HH24:MI'),2006,1001);
INSERT INTO orders VALUES (3015,734.50,TO_DATE('06-Oct-1996 13:16','DD-MM-YYYY HH24:MI'),2004,1002);
INSERT INTO orders VALUES (3016,1729.67,TO_DATE('06-Oct-1996 13:07','DD-MM-YYYY HH24:MI'),2006,1001);

COMMIT;

select* from orders;
drop table orders;

--------------------------------------------------------------------------

select * from customers
order by cnum;




----------------------------------------------------------------------------
-- 1.	List all customers with a rating of 100.
SELECT * FROM customers 
WHERE rating = 100;

-- 2.	Find all records in the Customer table with NULL values in the city column.
SELECT * FROM customers 
WHERE city IS NULL;

-- 3.	Find the largest order taken by each salesperson on each date.
SELECT snum, MAX(amt) FROM orders 
GROUP BY snum;

-- 4.	Arrange the Orders table by descending customer number.
SELECT * FROM orders 
ORDER BY cnum DESC;



-- 5.	Find which salespeople currently have orders in the Orders table.
SELECT DISTINCT s.* FROM salespeople s
JOIN orders o 
ON s.snum = o.snum;

-- 6.	List names of all customers matched with the salespeople serving them.
SELECT c.cname, s.sname FROM customers c 
JOIN salespeople s
ON c.snum = s.snum;

-- 7.	Find the names and numbers of all salespeople who had more than one customer.
SELECT s.snum,s.sname FROM salespeople s
JOIN customers c
ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) > 1;


-- 8.	Count the orders of each of the salespeople and output the results in descending order.
SELECT s.snum, s.sname,
       COUNT(o.onum) AS total_orders
FROM salespeople s
LEFT JOIN orders o
  ON s.snum = o.snum
GROUP BY s.snum, s.sname
ORDER BY total_orders DESC;




-- 9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.

SELECT * FROM customers
WHERE EXISTS (
    SELECT *
    FROM customers
    WHERE city = 'San Jose'
);


SELECT *
FROM customers
WHERE 'San Jose' IN (
    SELECT city
    FROM customers
);

-- 10. Match salespeople to customers according to what city they lived in.
SELECT s.sname AS Salespeople, c.cname AS CustomerName, s.city
FROM Salespeople s
JOIN Customers c 
ON s.city = c.city;


--- 11. Find the largest order taken by each salesperson.
SELECT snum, MAX(amt) AS max_order
FROM orders
GROUP BY snum;


--12. Find customers in San Jose who has a rating above 200.
SELECT * FROM customers 
WHERE city = 'San Jose' AND rating > 200;



-- 13. List the names and commissions of all salespeople in London.
SELECT sname, comm FROM salespeople
 WHERE city = 'London';




-- 14.	List all the orders of salesperson Monika from the Orders table.
SELECT o.* FROM orders o
JOIN salespeople s 
ON o.snum = s.snum
WHERE s.sname='Monika';


-- 15.	Find all customers with orders on October 3.
SELECT * FROM orders
WHERE TRUNC(odate)=TO_DATE('03-10-1996','DD-MM-YYYY');

select distinct * from customers c
join orders o
on c.cnum =  o.cnum
where TRUNC(odate) = to_date('03-10-1996','dd-mm-yyyy');


--16. Give the sums of the amounts from the orders table, grouped by date. 


SELECT TRUNC(odate) AS order_date,
       SUM(amt)     AS total_amount
       FROM orders
GROUP BY TRUNC(odate)
ORDER BY order_date;


--17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
SELECT TRUNC(odate) AS order_date,
       SUM(amt)     AS total_amount,
       MAX(amt)     AS max_amount
FROM orders
GROUP BY TRUNC(odate)
HAVING SUM(amt) >= MAX(amt) + 2000;


---18. Select all orders that had amounts that were greater than at least one of the orders from October 6.
SELECT *FROM   orders
       WHERE  amt > ANY (                                         --ANY- amount greater than at least one of those values
       SELECT amt FROM orders
       WHERE  TRUNC(odate) = TO_DATE('06-10-1996','dd-mm-yyyy'));
       
---
SELECT *FROM   orders
       WHERE  amt > (
       SELECT MIN(amt)FROM   orders                               -- Min -  
       WHERE  TRUNC(odate) = DATE '1996-10-06'
);
---
SELECT *
FROM Orders o1
WHERE EXISTS (
   SELECT 1 
   FROM Orders o2
   WHERE TRUNC(o2.odate) = TO_DATE('06-10-1996','dd-mm-yyyy')
   AND o1.amt > o2.amt
);





--19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
SELECT s.snum, s.sname FROM   salespeople s                                                      --EXIST _          
WHERE  EXISTS ( SELECT 1
       FROM   customers c
       WHERE  c.snum = s.snum
       AND    c.rating = 300);
       
Select * from salespeople;


-----20. Find all pairs of customers having the same rating.
                                                            ---- Self Join
SELECT c1.cnum   AS customer1_id,
       c1.cname  AS customer1_name,
       c2.cnum   AS customer2_id,
       c2.cname  AS customer2_name,
       c1.rating
FROM customers c1
JOIN customers c2
  ON c1.rating = c2.rating
 AND c1.cnum < c2.cnum
ORDER BY c1.rating;



-- 21. Find all customers with CNUM, 1000 above the SNUM of Serres.
SELECT *
FROM customers
WHERE cnum > (                                       ---(1002)+1000
    SELECT snum 
    FROM salespeople 
    WHERE sname = 'Serres') + 1000;



---22. Give the salespeople’s commissions as percentage instead of decimal numbers.
SELECT snum,sname,city, comm * 100 AS comm_percent
FROM salespeople;
--
SELECT snum,
       sname,
       city,
       TO_CHAR(comm * 100, '990.00') || '%' AS commission_percentage       ---'990.00' --> Allows numbers up to 3 digits before decimal
FROM salespeople;



---23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders which are less than $3000.00 in value.

SELECT snum,
       TRUNC(odate) AS order_date,
       MAX(amt)     AS max_order_amount
FROM orders
GROUP BY snum, TRUNC(odate)
HAVING MAX(amt) >= 3000
ORDER BY snum, order_date;
---------------------------------



---24. List the largest orders on October 3, for each salesperson.


SELECT snum,
       TRUNC(odate) AS odate,
       MAX(amt)     AS largest_order
FROM orders
WHERE TRUNC(odate) = DATE '1996-10-03'
GROUP BY snum, TRUNC(odate)
ORDER BY snum;

--------------------------
SELECT snum,
       trunc(odate) as order_date,
       max(amt)  as largest_order
from orders
where Trunc(odate)= to_date('03-10-1996','dd-mm-yyyy')
Group by snum, Trunc(odate)
Order by snum;
--------------------




---25. Find all customers located in cities where Serres (SNUM 1002) has customers.
SELECT *
FROM customers
WHERE city IN (
      SELECT city
      FROM customers
      WHERE snum = 1002
);

---26. Select all customers with a rating above 200.00.
SELECT *
FROM Customers
WHERE Rating > 200;

---27. Count the number of salespeople currently listing orders in the Orders table.
SELECT COUNT(DISTINCT Snum) AS salesperson_count
FROM Orders;

SELECT DISTINCT Snum
FROM Orders;


---28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.

SELECT 
    c.Cname AS Customer_Name,
    s.Comm  AS Commission
FROM Customers c
JOIN Salespeople s
ON c.Snum = s.Snum
WHERE s.Comm > 0.12;


--29. Find salespeople who have multiple customers.
SELECT s.snum, s.sname, COUNT(c.cnum) AS total_customers
FROM salespeople s
JOIN customers c
ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) > 1;


---30. Find salespeople with customers located in their city.
SELECT DISTINCT
    s.Snum,
    s.Sname,
    s.City
FROM Salespeople s
JOIN Customers c
ON s.Snum = c.Snum
WHERE s.City = c.City;

---31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
SELECT * FROM Salespeople
WHERE Sname LIKE 'P__l%';

---32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
SELECT *
FROM Orders
WHERE Cnum = (
    SELECT Cnum
    FROM Customers
    WHERE Cname = 'Cisneros'
);

---33. Find the largest orders for ‘Serres’ and ‘Rifkin’.

SELECT Sname, MAX(Amt) AS Largest_Order
FROM Orders
JOIN Salespeople 
ON Orders.Snum = Salespeople.Snum
WHERE Sname IN ('Serres', 'Rifkin')
GROUP BY Sname; 

---34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
SELECT Snum, Sname, Comm, City FROM Salespeople;

---35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.

SELECT * FROM Customers 
WHERE Cname >= 'A' AND Cname < 'G';

--36. Select all the possible combinations of customers that you can assign.
SELECT 
    c1.cnum  AS customer1_id,
    c1.cname AS customer1_name,
    c2.cnum  AS customer2_id,
    c2.cname AS customer2_name
FROM customers c1
JOIN customers c2
ON c1.cnum < c2.cnum
ORDER BY c1.cnum, c2.cnum;


--37. Select all orders that are greater than the average for October 4.
SELECT onum, amt, odate, cnum, snum FROM orders
WHERE amt >
      ( SELECT AVG(amt)
        FROM orders
        WHERE TRUNC(odate) = DATE '1996-10-04'
      )
ORDER BY amt desc;


---38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city. ---c1&c2 - short names given to the same table 
SELECT c1.cnum, c1.cname, c1.city, c1.rating
FROM customers c1
WHERE c1.rating = (
    SELECT MAX(c2.rating)
    FROM customers c2
    WHERE c2.city = c1.city
);

--39. Write a query that totals the orders for each day and places the results in descending order.
SELECT 
    TRUNC(odate) AS order_date,
    COUNT(*) AS total_orders,                                                  
    SUM(amt) AS total_amount
FROM orders
GROUP BY TRUNC(odate)
ORDER BY total_amount DESC;


---40. Write a select command that produces the rating followed by the name of each customer in San Jose.
SELECT CNUM,CNAME,RATING
FROM customers
WHERE city = 'San Jose';

---41. Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT *
FROM orders o
WHERE o.amt < ANY (                                           -- ANY MEANS ONE OF THOSE VALUES OF 'SAN JOSE'
    SELECT o2.amt
    FROM orders o2
    JOIN customers c
      ON o2.cnum = c.cnum
    WHERE c.city = 'San Jose'
);

SELECT *
FROM orders 
WHERE amt < (
    SELECT MAX(o2.amt)                                        --HERE ONLY MAX AMT IS TAKEN
    FROM orders o2
    JOIN customers c
      ON o2.cnum = c.cnum
    WHERE c.city = 'San Jose'
);



--42. Find all orders with above average amounts for their customers.
SELECT * FROM Orders O1
WHERE Amt > (
    SELECT AVG(Amt) FROM Orders O2
    WHERE O1.Cnum = O2.Cnum
);

-- 43.	Write a query that selects the highest rating in each city.
SELECT city, MAX(rating) FROM customers
 GROUP BY city;


---44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
SELECT O.Onum, C.Cname, C.Rating, S.Sname,  (O.Amt * S.Comm) AS Commission_Amount
FROM Orders O
JOIN Customers C ON O.Cnum = C.Cnum
JOIN Salespeople S ON O.Snum = S.Snum
WHERE C.Rating > 100;

---45. Count the customers with rating above San Jose’s average.
SELECT COUNT(*) 
FROM Customers 
WHERE Rating > (
    SELECT AVG(Rating) 
    FROM Customers 
    WHERE City = 'San Jose'
);
---46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.

SELECT s1.snum AS salesperson1_id,
       s1.sname AS salesperson1_name,
       s2.snum AS salesperson2_id,
       s2.sname AS salesperson2_name
FROM salespeople s1
JOIN salespeople s2
ON s1.snum >= s2.snum
ORDER BY s1.snum, s2.snum;

---47. Find all salespeople that are located in either Barcelona or London.
SELECT * FROM Salespeople 
WHERE City IN ('Barcelona', 'London');

---48. Find all salespeople with only one customer.
SELECT S.Sname
FROM Salespeople S
GROUP BY S.Sname
HAVING COUNT(C.Cnum) = 1;


---49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
SELECT 
    A.Cname AS Customer_1, 
    B.Cname AS Customer_2, 
    A.Snum
FROM Customers A
JOIN Customers B ON A.Snum = B.Snum
WHERE A.Cnum < B.Cnum;

---50. Write a query that will give you all orders for more than $1000.00.
SELECT *FROM Orders
WHERE Amt > 1000.00;

---51. Write a query that lists each order number followed by the name of the customer who made that order.
SELECT  O.Onum,  C.Cname FROM Orders O
JOIN Customers C ON O.Cnum = C.Cnum;

--52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
---JOIN
SELECT DISTINCT S.Snum, S.Sname
FROM Salespeople S
JOIN Customers C 
ON S.City = C.City
WHERE S.Snum != C.Snum;

---correlated subquery
SELECT Snum, Sname
FROM Salespeople S
WHERE EXISTS (
    SELECT * FROM Customers C
    WHERE C.City = S.City
    AND C.Snum != S.Snum
);


---53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
SELECT *
FROM Customers
WHERE Rating = ANY (
    SELECT Rating
    FROM Customers
    WHERE Snum = (
        SELECT Snum 
        FROM Salespeople 
        WHERE Sname = 'Serres'
    )
);
---54. Write 2 queries that will produce all orders taken on October3 or October 4.
SELECT * FROM Orders 
WHERE Odate LIKE '03-Oct-96%' 
   OR Odate LIKE '04-Oct-96%';
---55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
SELECT DISTINCT 
    C.Cname, 
    O1.Onum AS Order_1, 
    O2.Onum AS Order_2
FROM Orders O1
JOIN Orders O2 ON O1.Cnum = O2.Cnum
JOIN Customers C ON O1.Cnum = C.Cnum
WHERE O1.Onum < O2.Onum;


--56. Find only those customers whose ratings are higher than every customer in Rome.
SELECT * FROM customers
WHERE rating > (SELECT MAX(rating) FROM customers WHERE city = 'Rome');


---57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
SELECT * FROM Customers
WHERE Rating > 100 OR City = 'Rome';


---58. Find all rows from the Customer table for which the salesperson number is 1001.
SELECT * FROM Customers 
WHERE Snum = 1001;



--59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.

SELECT Snum, SUM(Amt) AS Total_Sales
FROM Orders
GROUP BY Snum
HAVING SUM(Amt) > (SELECT MAX(Amt) FROM Orders);


SELECT Snum, SUM(amt) AS total_amt
FROM orders
GROUP BY Snum;

---60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.
SELECT *
FROM Orders
WHERE Amt = 0 OR Amt IS NULL;

---61. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
SELECT S.Sname, C.Cname
FROM Salespeople S, Customers C
WHERE S.Sname < C.Cname
AND C.Rating < 200;


---62. List all salespeople’s names and the commission they have earned.
SELECT  S.Sname, SUM(O.Amt * S.Comm) AS Total_Commission
FROM Salespeople S
LEFT JOIN Orders O ON S.Snum = O.Snum
GROUP BY S.Sname;

---63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.

SELECT Cname, City
FROM Customers
WHERE Rating = (
    SELECT Rating
    FROM Customers
    WHERE Cnum = 2001
);

---Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.

SELECT Cname, City
FROM Customers
WHERE Rating = (
    SELECT Rating
    FROM Customers
    WHERE Cnum = 2001
);

--64. Find all salespeople for whom there are customers that follow them in alphabetical order.
SELECT DISTINCT S.Sname FROM Salespeople S
JOIN Customers C ON S.Snum = C.Snum
WHERE C.Cname > S.Sname;

--65. Write a query that produces the names and ratings of all customers of all who have above average orders.
SELECT DISTINCT C.Cname, C.Rating
FROM Customers C
JOIN Orders O ON C.Cnum = O.Cnum
WHERE O.Amt > (SELECT AVG(Amt) FROM Orders);


---66. Find the sum of all purchases from the Orders table.
SELECT SUM(Amt) AS Total_Purchases
FROM Orders;

---67. Write a select command that produces the order number, amount, and date for all rows in the Order table.

SELECT Onum, Amt, Odate
FROM Orders;

---68. Count the number of not null rating fields in the Customer table including duplicates.
SELECT COUNT(Rating) 
FROM Customers;


---69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.

SELECT O.Onum, 
    S.Sname AS Salesperson_Name, 
    C.Cname AS Customer_Name
FROM Orders O
JOIN Salespeople S ON O.Snum = S.Snum
JOIN Customers C ON O.Cnum = C.Cnum;

---70. List the commissions of all salespeople servicing customers in London.
SELECT DISTINCT S.Comm
FROM Salespeople S
JOIN Customers C ON S.Snum = C.Snum
WHERE C.City = 'London';

--71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
SELECT *FROM salespeople
WHERE snum NOT IN (SELECT snum FROM customers);

---72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
SELECT Snum, Sname, City
FROM Salespeople S
WHERE EXISTS (
    SELECT * FROM Customers C
    WHERE C.City = S.City
    AND C.Snum != S.Snum
);

---73. Write a query that selects all customers serviced by Peel or Motika.

SELECT C.*
FROM Customers C
JOIN Salespeople S ON C.Snum = S.Snum
WHERE S.Sname IN ('Peel', 'Monika');

---74. Count the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
SELECT 
    Odate, 
    COUNT(DISTINCT Snum) AS Number_of_Salespeople
FROM Orders
GROUP BY Odate;


---75. Find all orders attributed to salespeople in London.

SELECT O.*
FROM Orders O
JOIN Salespeople S ON O.Snum = S.Snum
WHERE S.City = 'London';

---76. Find all orders by customers not located in the same cities as their salespeople.
SELECT O.Onum, O.Amt, C.Cname, C.City AS Cust_City, S.Sname, S.City AS Sales_City
FROM Orders O
JOIN Customers C ON O.Cnum = C.Cnum
JOIN Salespeople S ON O.Snum = S.Snum
WHERE C.City != S.City;

---77. Find all salespeople who have customers with more than one current order.
SELECT DISTINCT S.Sname
FROM Salespeople S
JOIN Orders O ON S.Snum = O.Snum
WHERE O.Cnum IN (
    SELECT Cnum
    FROM Orders
    GROUP BY Cnum
    HAVING COUNT(Onum) > 1
);


---78. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer (besides the customer being selected) with orders in the Orders table.
SELECT *
FROM Customers c1
WHERE EXISTS (
    SELECT 1
    FROM Customers c2
    INNER JOIN Orders o ON c2.Cnum = o.Cnum
    WHERE c1.Snum = c2.Snum
      AND c1.Cnum <> c2.Cnum
);



---79. Write a query that selects all customers whose name begins with ‘C’.
SELECT *
FROM Customers
WHERE Cname LIKE 'C%';

---80. Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  for the city (city) the highest rating is : (rating).
SELECT 'For the city ' || City || ' the highest rating is: ' || MAX(Rating)
FROM Customers
GROUP BY City;


---81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
SELECT DISTINCT Snum
FROM Orders;


---82. Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
SELECT Rating, Cname, Cnum
FROM Customers
ORDER BY Rating DESC;

---83. Find the average commission for salespeople in London.
SELECT AVG(Comm) AS Average_London_Commission
FROM Salespeople
WHERE City = 'London';

---84. Find all orders credited to the same salesperson that services Hoffman.
SELECT * FROM Orders 
WHERE Snum = (
    SELECT Snum 
    FROM Customers 
    WHERE Cname = 'Hoffman'
);


---85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

SELECT *
FROM Salespeople
WHERE Comm BETWEEN 0.10 AND 0.12;

---86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10

SELECT Sname, City
FROM Salespeople
WHERE City = 'London' 
  AND Comm > 0.10;

---87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));


---88. Write a query that selects each customer’s smallest order.

SELECT Cnum, MIN(Amt) AS Smallest_Order
FROM Orders
GROUP BY Cnum;

---89. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
SELECT MIN(Cname) AS First_G_Customer
FROM Customers
WHERE Cname LIKE 'G%';


---90. Write a query that counts the number of different not NULL city values in the Customers table.

SELECT COUNT(DISTINCT City) AS Unique_City_Count
FROM Customers;


---91. Find the average amount from the Orders table.

SELECT AVG(Amt) AS Average_Purchase_Amount
FROM Orders;


---92. What would be the output from the following query?
SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);


---93. Find all customers who are not located in San Jose & whose rating is above 200.
SELECT *
FROM Customers
WHERE City <> 'San Jose' 
  AND Rating > 200;

---94. Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);


---95. Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);





---96. Which salespeople attend to customers not in the city they have been assigned to?
SELECT DISTINCT S.Sname, S.City AS Sales_City, C.Cname, C.City AS Cust_City
FROM Salespeople S
JOIN Customers C ON S.Snum = C.Snum
WHERE S.City <> C.City;

---97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
SELECT DISTINCT S.Sname, S.Comm, C.Cname, C.Rating
FROM Salespeople S
JOIN Customers C ON S.Snum = C.Snum
WHERE S.Comm > 0.11 
  AND C.Rating < 250;

---98. Which salespeople have been assigned to the same city but get different commission percentages?
SELECT DISTINCT 
    s1.Sname AS Salesperson_A, 
    s2.Sname AS Salesperson_B, 
    s1.City, 
    s1.Comm AS Comm_A, 
    s2.Comm AS Comm_B
FROM Salespeople s1
JOIN Salespeople s2 ON s1.City = s2.City
WHERE s1.Comm <> s2.Comm
  AND s1.Snum < s2.Snum;

---99. Which salesperson has earned the most by way of commission?
SELECT S.Sname, SUM(O.Amt * S.Comm) AS Total_Commission
FROM Salespeople S
JOIN Orders O ON S.Snum = O.Snum
GROUP BY S.Sname
ORDER BY Total_Commission DESC
LIMIT 1;

--100.  Does the customer who has placed the maximum number of orders have the maximum rating?
SELECT 
CASE 
    WHEN 
        (SELECT rating FROM customers
         WHERE cnum = (
             SELECT cnum FROM orders
             GROUP BY cnum
             ORDER BY COUNT(*) DESC
             FETCH FIRST 1 ROW ONLY
         ))
         
        =
        
        (SELECT MAX(rating) FROM customers)
        
    THEN 'YES'
    ELSE 'NO'
END AS result
FROM dual;

--- 101.  Has the customer who has spent the largest amount of money been given the highest rating?

SELECT 
CASE 
    WHEN 
        (SELECT rating
         FROM customers
         WHERE cnum = (
             SELECT cnum
             FROM orders
             GROUP BY cnum
             ORDER BY SUM(amt) DESC
             FETCH FIRST 1 ROW ONLY
         ))
         
        =
        
        (SELECT MAX(rating) FROM customers)
        
    THEN 'YES'
    ELSE 'NO'
END AS result
FROM dual;
---102.  List all customers in descending order of customer rating.
SELECT *
FROM Customers
ORDER BY Rating DESC;

---103.  On which days has Hoffman placed orders?
SELECT O.Odate
FROM Orders O
JOIN Customers C ON O.Cnum = C.Cnum
WHERE C.Cname = 'Hoffman';

---104.  Do all salespeople have different commissions?

SELECT 
    CASE 
        WHEN COUNT(Comm) = COUNT(DISTINCT Comm) THEN 'Yes'
        ELSE 'No'
    END AS All_Commissions_Unique
FROM Salespeople;

---105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
SELECT Sname
FROM Salespeople
WHERE Snum NOT IN (
    SELECT Snum 
    FROM Orders 
    WHERE Odate BETWEEN '1996-10-03' AND '1996-10-05'
);

---106.  How many salespersons have succeeded in getting orders?

SELECT COUNT(DISTINCT Snum) AS Active_Salespeople_Count
FROM Orders;

---107.  How many customers have placed orders?
SELECT COUNT(DISTINCT Cnum) AS Customers_With_Orders
FROM Orders;

---108.  On which date has each salesperson booked an order of maximum value?
SELECT O.Snum, O.Amt, O.Odate
FROM Orders O
WHERE O.Amt = (
    SELECT MAX(Amt) 
    FROM Orders Sub                                             ---Sub is just an alias (temporary name) for the Orders table inside the subquery.
    WHERE Sub.Snum = O.Snum
);

---109.  Who is the most successful salesperson?
SELECT S.Sname, SUM(O.Amt) AS Total_Sales
FROM Salespeople S
JOIN Orders O ON S.Snum = O.Snum
GROUP BY S.Sname
ORDER BY Total_Sales DESC
LIMIT 1;

---110.  Who is the worst customer with respect to the company?
SELECT c.Cname, SUM(o.Amt) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.Cnum = o.Cnum
GROUP BY c.Cname
ORDER BY Total_Spent ASC
LIMIT 1;

---111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
SELECT c.Cname, s.Sname
FROM Customers c
JOIN Salespeople s ON c.Snum = s.Snum
WHERE c.Cnum NOT IN (
    SELECT Cnum 
    FROM Orders 
    WHERE Amt > 200
);

---112.  Which customers have the same rating?
SELECT 
    a.Cname AS Customer_1, 
    b.Cname AS Customer_2, 
    a.Rating
FROM Customers a
JOIN Customers b ON a.Rating = b.Rating
WHERE a.Cnum < b.Cnum
ORDER BY a.Rating DESC;

---113.  Find all orders greater than the average for October 4th.
SELECT *
FROM Orders
WHERE Amt > (
    SELECT AVG(Amt)
    FROM Orders
    WHERE Odate = '1996-10-04'
);

---114.  Which customers have above average orders?
SELECT DISTINCT C.Cname
FROM Customers C
JOIN Orders O ON C.Cnum = O.Cnum
WHERE O.Amt > (SELECT AVG(Amt) FROM Orders);


---115.  List all customers with ratings above San Jose’s average.

SELECT *
FROM Customers
WHERE Rating > (
    SELECT AVG(Rating)
    FROM Customers
    WHERE City = 'San Jose'
);

---116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
SELECT Snum, SUM(Amt) AS Total_Sales
FROM Orders
GROUP BY Snum
HAVING SUM(Amt) > (SELECT MAX(Amt) FROM Orders);


---117.  Give names and numbers of all salesperson that have more than one customer.
select s.snum,s.sname from salespeople s
join customers c 
on s.snum = c.snum
Group by  s.snum,s.sname
having count(cnum) > 1;

---118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.

SELECT DISTINCT S.Snum, S.Sname
FROM Salespeople S
JOIN Customers C ON S.City = C.City
WHERE S.Snum <> C.Snum;

---119.  Which customers’ rating should be lowered?
SELECT c.Cname, c.Rating, SUM(o.Amt) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.Cnum = o.Cnum
GROUP BY c.Cname, c.Rating
HAVING SUM(o.Amt) < (
    SELECT AVG(Customer_Total)
    FROM (
        SELECT SUM(Amt) AS Customer_Total
        FROM Orders
        GROUP BY Cnum
    ) AS SpendingTable
);
---120.  Is there a case for assigning a salesperson to Berlin?
SELECT 
    C.City AS Customer_City, 
    COUNT(C.Cnum) AS Total_Customers, 
    S_Local.Sname AS Local_Salesperson,
    S_Assigned.Sname AS Currently_Servicing
FROM Customers C
LEFT JOIN Salespeople S_Local ON C.City = S_Local.City
JOIN Salespeople S_Assigned ON C.Snum = S_Assigned.Snum
GROUP BY C.City, S_Local.Sname, S_Assigned.Sname
HAVING S_Local.Sname IS NULL;

---121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
SELECT 
    S.Sname, 
    SUM(O.Amt) AS Total_Sales_Performance,
    SUM(O.Amt * S.Comm) AS Total_Commission_Paid
FROM Salespeople S
LEFT JOIN Orders O ON S.Snum = O.Snum
GROUP BY S.Sname
ORDER BY Total_Sales_Performance DESC;


---122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in London and New York by more than 5 times?
SELECT
CASE
  WHEN
    ( SELECT SUM(o.amt) FROM   orders o
      JOIN   customers c ON o.cnum = c.cnum
      WHERE  c.city IN ('Rome', 'London')
    ) > 5 *( SELECT SUM(o.amt * s.comm)FROM   orders o
              JOIN   salespeople ON o.snum = s.snum
              WHERE  s.city IN ('London', 'New York')
              )
              THEN 'YES'
               ELSE 'NO'
END AS result
FROM dual;

--123.  Which is the date, order number, amt and city for each salesperson (byname) for the maximum order he has obtained?
SELECT s.sname, o.odate,o.onum,o.amt, c.city FROM  salespeople s
JOIN   orders o ON s.snum = o.snum
JOIN   customers c ON o.cnum = c.cnum
WHERE  o.amt = (
       SELECT MAX(o2.amt)
       FROM   orders o2
       WHERE  o2.snum = o.snum
);


--124.  Which salesperson(s) should be fired?
SELECT s.snum,s.sname, FROM  salespeople s
WHERE  s.snum NOT IN (
       SELECT DISTINCT snum
       FROM   orders
);


-- 125.	What is the total income for the company? 
SELECT SUM(amt) AS total_income FROM orders;
