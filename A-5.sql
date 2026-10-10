CREATE TABLE employee_E (
    employee_id NUMBER(5) PRIMARY KEY,
    full_name   VARCHAR2(50),
    email       VARCHAR2(50),
    salary      NUMBER(10,2)
);

INSERT INTO employee_E VALUES (100, 'Steven King', 'sking@gmail.com', 24000);
INSERT INTO employee_E VALUES (101, 'Neena Kochhar', 'nkochhar@gmail.com', 20000);
INSERT INTO employee_E VALUES (102, 'Lex De Haan', 'ldehaan@gmail.com', 17000);
INSERT INTO employee_E VALUES (103, 'Alexander Hunold', 'ahunold@gmail.com', 9000);
INSERT INTO employee_E VALUES (104, 'Bruce Ernst', 'bernst@gmail.com', 6000);
INSERT INTO employee_E VALUES (105, 'David Austin', 'daustin@gmail.com', 4800);
INSERT INTO employee_E VALUES (106, 'Valli Pataballa', 'vpatabal@gmail.com', 4800);

select*from employee_E;
drop table employee_E;

--Q1. Write a query to generate following output.
Select employee_id,full_name,email,salary from employee_E;

---Q2. Write a query to display job_id and number of manager under particular job. Show only those jobs that have more than one manager.
CREATE TABLE job_managers (
    job_id    VARCHAR2(20),
    managers  NUMBER(2)
);


INSERT INTO job_managers VALUES ('IT_PROG', 3);
INSERT INTO job_managers VALUES ('SH_CLERK', 5);
INSERT INTO job_managers VALUES ('SA_REP', 5);
INSERT INTO job_managers VALUES ('ST_CLERK', 5);

select*from job_managers;

select job_id,managers from job_managers;

SELECT job_id, managers FROM job_managers
WHERE managers > 1;

--Q3. Display the country name and number of employees those working in particular city that count of employee is greater than 30.(Hint: Using Equijoin and Group by )   --**Table not available

SELECT count(employee_id),c.country_name
FROM employees e,departments d,locations l,countries c
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND l.country_id=c.country_id
group by c.country_name
HAVING count(employee_id)>30;


-- Q4. Display cities name and number of departments present those cities. And exculde departments there are no any employees.
SELECT l.city,count(d.department_id)
from employees e,departments d,locations l
WHERE e.department_id=d.department_id 
AND d.location_id=l.location_id
AND employee_id is not null
group by l.city


--Q5. Display the salary range and number of employees how are salary in between of range. (Hint : Job_Grade table , Equijoin , Group by )

CREATE TABLE salary_range_summary (
    low_sal             NUMBER(6),
    high_sal            NUMBER(6),
    number_of_employees NUMBER(5)
);

INSERT INTO salary_range_summary VALUES (1000, 2999, 24);
INSERT INTO salary_range_summary VALUES (3000, 4999, 25);
INSERT INTO salary_range_summary VALUES (5000, 9999, 40);
INSERT INTO salary_range_summary VALUES (10000, 14999, 16);
INSERT INTO salary_range_summary VALUES (15000, 19999, 1);
INSERT INTO salary_range_summary VALUES (20000, 25000, 2);

select*from salary_range_summary;

SELECT  s.low_sal, s.high_sal, COUNT(e.employee_id) AS number_of_employees FROM salary_range_summary s
JOIN employees e
ON e.salary BETWEEN s.low_sal AND s.high_sal
GROUP BY s.low_sal, s.high_sal
ORDER BY s.low_sal;

--Q6. Display Year list and number of Employees join in particular year.(Hint: Group by and To_Char Function)
CREATE TABLE employee_year_summary (
    year                NUMBER(4),
    number_of_employees NUMBER(5)
);

INSERT INTO employee_year_summary VALUES (2001, 1);
INSERT INTO employee_year_summary VALUES (2002, 7);
INSERT INTO employee_year_summary VALUES (2003, 6);
INSERT INTO employee_year_summary VALUES (2004, 10);
INSERT INTO employee_year_summary VALUES (2005, 29);
INSERT INTO employee_year_summary VALUES (2006, 24);
INSERT INTO employee_year_summary VALUES (2007, 19);
INSERT INTO employee_year_summary VALUES (2008, 11);


Select*from employee_year_summary;
drop table employee_year_summary;

SELECT
    TO_CHAR(hire_date, 'YYYY') AS year,
    COUNT(*) AS number_of_employees
FROM employee_year_summary
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY year;

SELECT to_char(hire_date,'yyyy'),count(employee_id)
FROM employees
group by to_char(hire_date,'yyyy')
order by 1;

--Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers how have more than 5 employees under working. Result sort by manager_ID

CREATE TABLE manager_employee_count (
    manager_id           NUMBER(5),
    full_name            VARCHAR2(50),
    number_of_employees  NUMBER(5)
);

INSERT INTO manager_employee_count VALUES (100, 'Steven King', 14);
INSERT INTO manager_employee_count VALUES (120, 'Matthew Weiss', 8);
INSERT INTO manager_employee_count VALUES (121, 'Adam Fripp', 8);
INSERT INTO manager_employee_count VALUES (122, 'Payam Kaufling', 8);
INSERT INTO manager_employee_count VALUES (123, 'Shanta Vollman', 8);

select* from manager_employee_count;

SELECT m.employee_id AS manager_id, m.full_name AS full_name,
    COUNT(e.employee_id) AS number_of_employees
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY
    m.employee_id,
    m.first_name,
    m.last_name
HAVING COUNT(e.employee_id) > 5
ORDER BY manager_id;












