
-- Assignment 4–5

CREATE TABLE EMPLOYEES (
            Employee_id NUMBER(6) PRIMARY KEY,
            Full_Name VARCHAR2(100),
            Salary NUMBER(8, 2),
            Hire_date DATE
        );
        
SELECT *FROM EMPLOYEES;
DROP TABLE EMPLOYEES;
  


INSERT INTO Employees VALUES (100, 'S.King', 24000, TO_DATE('17/06/2003', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (116, 'S.Baida', 2900, TO_DATE('24/12/2005', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (117, 'S.Tobias', 2800, TO_DATE('24/07/2005', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (123, 'S.Vollman', 6500, TO_DATE('10/10/2005', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (128, 'S.Markle', 2200, TO_DATE('03/08/2008', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (138, 'S.Stiles', 3200, TO_DATE('26/10/2005', 'DD-MM-YYYY'));
INSERT INTO Employees VALUES (161, 'S.Sewall', 7000, TO_DATE('03/11/2006', 'DD-MM-YYYY'));

        
-- Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character.

        
SELECT Full_Name FROM employees
WHERE Full_Name like 'S%';
  

SELECT employee_id,Full_Name,salary,hire_date
FROM employees
WHERE Full_Name like 'S%';


--Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

SELECT
round(max(salary)) highest,
round(min(salary)) lowest,
round(sum(salary)) sum,
round(avg(salary)) avg
FROM employees;

/*Q3. Display following output .
Employee Details
--------------------------------------------------------------------------------------
King earns $24,000.00 monthly but wants $72,000.00.
Kochhar earns $20,000.00 monthly but wants $60,000.00.
De Haan earns $17,000.00 monthly but wants $51,000.00.
Hunold earns $9,000.00 monthly but wants $27,000.00.
Ernst earns $6,000.00 monthly but wants $18,000.00.
Austin earns $4,800.00 monthly but wants $14,400.00.*/

create table emp(
          Employee_name VARCHAR2(100),
          Monthly_salary Number(10,2)
          );

Insert Into emp Values ('king',   24000.00);
Insert Into emp Values ('Kochhar',20000.00);
Insert Into emp Values ('De Haan',17000.00);
Insert Into emp Values ('Hunold',  9000.00);
Insert Into emp Values ('Ernst',   6000.00);
Insert Into emp Values ('Austin',  4800.00);

Select * from emp;
SELECT Employee_name || ' earns ' ||TO_CHAR(Monthly_salary,'$24000.00') ||' monthly but wants ' || TO_CHAR(Monthly_salary * 3, '$72000.00') || '.' As  FROM employees;









--Q4. Determine the number of managers without listing them. Label the column  Number of Managers. Hint: Use the MANAGER_ID column to determine the number of managers. 
SELECT COUNT(DISTINCT manager_id) AS number_of_managers
FROM employees
WHERE manager_id IS NOT NULL;


--Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE

SELECT max(salary)-min(salary) difference
FROM employees;

---Q6. Display how many employees joined in each month
Hint: Grouping by month and count the employees .use TO_CHAR functions also

SELECT TO_CHAR(hire_date, 'Month') AS month,
       COUNT(*) AS total_employees
FROM employees
GROUP BY TO_CHAR(hire_date, 'Month'),
         TO_CHAR(hire_date, 'MM')
ORDER BY TO_CHAR(hire_date, 'MM');


SELECT to_char(hire_date,'Month')month,count(employee_id)
FROM employees
group by to_char(hire_date,'Month')
order by month;

--Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.

SELECT employee_id,Full_name,hire_date
FROM employees
--WHERE (to_char(hire_date)<sysdate-365*10);
WHERE hire_date <= ADD_MONTHS(SYSDATE, -120);


--Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.Hint: Commission column contain null values

SELECT ROUND(AVG(salary * NVL(commission_pct, 1))) AS avg_salary
FROM employees;


--Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
Hint: Grouping on department id


SELECT department_id,count(manager_id)
FROM departments
WHERE department_id is not null
group by department_id;


---Q10.Display job title and number of employees working those job and number of manager they perform job.
CREATE TABLE job_summary (
    job_title   VARCHAR2(50),
    employees   NUMBER,
    managers    NUMBER
);


INSERT INTO job_summary VALUES ('Accountant', 5, 1);
INSERT INTO job_summary VALUES ('Accounting Manager', 1, 1);
INSERT INTO job_summary VALUES ('Administration Assistant', 1, 1);
INSERT INTO job_summary VALUES ('Administration Vice President', 2, 1);
INSERT INTO job_summary VALUES ('Finance Manager', 1, 1);
INSERT INTO job_summary VALUES ('Human Resources Representative', 1, 1);
INSERT INTO job_summary VALUES ('Marketing Manager', 1, 1);
INSERT INTO job_summary VALUES ('Sales Representative', 30, 5);
INSERT INTO job_summary VALUES ('Shipping Clerk', 20, 5);
INSERT INTO job_summary VALUES ('Stock Clerk', 20, 5);

COMMIT;
SELECT * FROM job_summary;

SELECT count(employee_id),count(manager_id),j.job_title
FROM employees e,jobs j
WHERE e.job_id=j.job_id and manager_id is not null
group by j.job_title;


/*SELECT j.job_title,
       COUNT(e.employee_id) AS employees,
       COUNT(DISTINCT e.manager_id) AS managers
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY j.job_title;*/





--Q11. Display employee full name and pad both side asterisk sing 10 time . 
CREATE TABLE employee_details (
    full_name  VARCHAR2(100)
);

INSERT INTO employee_details VALUES ('Ellen Abel');
INSERT INTO employee_details VALUES ('Sundar Ande');
INSERT INTO employee_details VALUES ('ozhe Atkinson');
INSERT INTO employee_details VALUES ('David Austin');
INSERT INTO employee_details VALUES ('Hermann Baer');
INSERT INTO employee_details VALUES ('Shelli Baida');
INSERT INTO employee_details VALUES ('Amit Banda');
INSERT INTO employee_details VALUES ('Elizabeth Bates');

COMMIT;
select* from employee_details;
drop table employee_details;


SELECT
       RPAD('*', 10, '*')
       || full_name ||
       RPAD('*', 10, '*') AS full_name
FROM employee_details;

---Q12. Display following output. (Hint: Use Months_between Function)

CREATE TABLE employee_experience (
    employee_id NUMBER(5) PRIMARY KEY,
    last_name   VARCHAR2(50),
    weeks       NUMBER(3),
    months      NUMBER(4),
    year        NUMBER(3)
);

INSERT INTO employee_experience VALUES (100, 'King',    24, 166, 14);
INSERT INTO employee_experience VALUES (101, 'Kochhar', 20, 139, 12);
INSERT INTO employee_experience VALUES (102, 'De Haan', 28, 195, 16);
INSERT INTO employee_experience VALUES (103, 'Hunold',  19, 136, 11);
INSERT INTO employee_experience VALUES (104, 'Ernst',   17, 119, 10);
INSERT INTO employee_experience VALUES (105, 'Austin',  20, 142, 12);


select *from employee_experience;

SELECT employee_id,last_name,hire_date,round(months_between(sysdate,hire_date)/7) weeks,
round(months_between(sysdate,hire_date)) months,
round(months_between(sysdate,hire_date)/12) years
FROM employees;
























        
        

 Q1. Display full name of employees whose first name 
     starts with 'S'
SELECT employee_id,
       SUBSTR(first_name,1,1) || '.' || last_name AS full_name,
       salary,
       hire_date
FROM employees
WHERE first_name LIKE 'S%';


-- Q2. Find highest, lowest, sum and average salary

SELECT ROUND(MAX(salary)) AS maximum,
       ROUND(MIN(salary)) AS minimum,
       ROUND(SUM(salary)) AS sum,
       ROUND(AVG(salary)) AS average
FROM employees;


-- Q3. Display employee salary and expected salary

SELECT last_name || ' earns ' ||
       TO_CHAR(salary,'$99,999.00') ||
       ' monthly but wants ' ||
       TO_CHAR(salary*3,'$99,999.00') AS employee_details
FROM employees;

-- Q4. Determine number of managers

SELECT COUNT(DISTINCT manager_id) AS number_of_managers
FROM employees
WHERE manager_id IS NOT NULL;

-- Q5. Difference between highest and lowest salary

SELECT MAX(salary) - MIN(salary) AS difference
FROM employees;


-- Q6. Display how many employees joined in each month

SELECT TO_CHAR(hire_date,'Month') AS month,
       COUNT(employee_id) AS total_employees
FROM employees
GROUP BY TO_CHAR(hire_date,'Month')
ORDER BY month;


 -- Q7. Employees having more than 10 years experience

SELECT employee_id,
       first_name || ' ' || last_name AS full_name,
       hire_date
FROM employees
WHERE hire_date <= ADD_MONTHS(SYSDATE,-120);

-- Q8. Multiply salary with commission and calculate
     average salary (handle NULL commission)

SELECT ROUND(AVG(salary * NVL(commission_pct,1))) AS avg_salary
FROM employees;


-- Q9. Display department_id and number of managers

SELECT department_id,
       COUNT(DISTINCT manager_id) AS managers
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

 -- Q10. Display job title, number of employees and number of managers
 
SELECT j.job_title,
       COUNT(e.employee_id) AS employees,
       COUNT(DISTINCT e.manager_id) AS managers
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title;


-- Q11. Display employee name padded with asterisks

SELECT LPAD(RPAD(first_name || ' ' || last_name,
                 LENGTH(first_name || ' ' || last_name) + 10,
                 '*'),
            LENGTH(first_name || ' ' || last_name) + 20,
            '*') AS employee_details
FROM employees;


 Q12. Display experience in weeks, months and years

SELECT employee_id,
       last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/7)  AS weeks,
       ROUND(MONTHS_BETWEEN(SYSDATE,hire_date))    AS months,
       ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12) AS years
FROM employees;
