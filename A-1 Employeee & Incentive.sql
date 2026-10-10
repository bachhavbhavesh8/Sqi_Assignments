--1.  Write create table syntax for employee table and Incentive table

      create table employeee
      ( Emp_id number,
        First_Name varchar2(30),
        Last_Name varchar2(30),
        Salary Number ,
        Joining_date Date,
        Department varchar2(50)
        );
        
        
        select*from employeee;
        drop table employeee;
    ----------------------------------    
       create table Incentive
       ( Employee_ref_id number,
         Incentive_date date ,
         Incentive_amount number
         );
         
         select*from Incentive;
         drop table Incentive;
         
2.  --Write syntax for insert data into table of employee table and Incentive table
    
    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (1, 'John', 'Abraham', 1000000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Banking');

    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (2, 'Michael', 'Clarke', 800000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (3, 'Roy', 'Thomas', 700000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Banking');

    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (4, 'Tom', 'Jose', 600000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (5, 'Jerry', 'Pinto', 650000, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 'Insurance');

    INSERT INTO employeee (emp_id, first_name, last_name, salary, joining_date, department)
    VALUES (6, 'Philip', 'Mathew', 750000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Services');
------------------------------------------------------------------------------------------------

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (1, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 5000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (2, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 3000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (3, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 4000);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (1, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 4500);

    INSERT INTO incentive (employee_ref_id, incentive_date, incentive_amount)
    VALUES (2, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 3500);

             select*from Incentive;


--3.  Get all employee details from the employee table
    select * from employeee;
    
--4.  Get First_Name,Last_Name from employee table
    SELECT First_Name,Last_Name from Employeee;

--5.  Get First_Name from employee table using alias name “Employee Name”
    select First_name as EmployeeName from Employeee;

--6.  Get First_Name from employee table in upper case
    select upper(First_name) from Employeee;

--7.  Select first 3 characters of FIRST_NAME from EMPLOYEE
    select SUBSTR(First_name,1,3) from Employeee;

--8.  Get position of 'o' in name 'John' from employee table
   SELECT first_name,
        INSTR(first_name, 'o') AS position_of_o
       FROM employeee
       WHERE first_name = 'John';


--9.  Get FIRST_NAME from employee table after removing white spaces from right side.
    select first_name,rtrim(First_name)as Trimed_spaces from employeee; 

--10. Get First_Name from employee table after replacing 'o' with '$'
    select first_name, replace(First_Name,'o','$') as Replace_charcters from Employeee;

--11. Get First_Name and Last_Name as single column from employee table separated by a '_'
      select first_name,last_name, First_name || '_' || Last_name as Full_name from employeee;


--12. Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
      select First_name, 
      extract(Year From joining_date) as Joining_year,
      extract(Month from joining_date) as Join_month,
      extract (day from joining_Date) as Joining_date
      from employeee;

--13. Get all employee details from the employee table order by First_Name Ascending
    select * from employeee 
    order By first_name asc;

--14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
      select * from employeee 
      order by first_name asc,Salary desc;
    

--15. Get employee details from employee table whose employee name is “John”
    select * from employeee
    where First_name = 'John';

--16. Get employee details from employee table whose employee name are “John” and “Roy”
    select * from employeee 
    where first_name = 'John'or First_name = 'Roy'; 

--17. Get employee details from employee table whose employee name are not “John” and “Roy”.
    select * from employeee 
    where First_name != 'John' and  first_name != 'Roy';

--18. Get employee details from employee table whose first name starts with 'J'.
    select * from employeee 
    where first_name like 'J%';

--19. Get employee details from employee table whose first name contains 'o'.
    select * from employeee 
    where first_name like 'o%';

--20. Get employee details from employee table whose first name ends with 'n'.
    select * from employeee 
    where First_name like '%n';

--21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
      select * from employeee 
      where first_name like '___n';

--22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
      select * from employeee 
      where first_name like 'J___';

--23. Get employee details from employee table who’s Salary greater than 600000. 
      select * from employeee 
      where salary > 600000;

--24. Get employee details from employee table whose joining year is “2013”.
      select * from employeee 
      where extract(Year from joining_date)= 2013;
      
      
--25. Get employee details from employee table whose joining month is “January”.
    select * from employeee 
    where extract (Month from joining_date)= 01;

--26. Get employee details from employee table who joined before January 1st 2013.
    SELECT * FROM employeee
    WHERE joining_date < TO_DATE('01-01-2013', 'DD-MM-YYYY');


--27. Get employee details from employee table who joined after January 31st
    select * from employeee 
    where joining_date >= TO_date('31-01-2013','DD-MM-YYYY');

--28. Get Joining Date and Time from employee table
    select to_char(Joining_date, 'DD-MM-YYYY')AS joining_date,
           to_char(joining_date, 'HH24:MI:SS') AS JOINING_TIME
           from employeee; 
    
    

--29. Get Joining Date, Time including milliseconds from employee table

    SELECT 
    CAST(joining_date AS TIMESTAMP) AS joining_timestamp
     FROM employeee;


--30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
    SELECT * FROM EMPLOYEEE; 
    SELECT * FROM INCENTIVE;
    
    SELECT E.EMP_ID,
           E.JOINING_DATE,
           I.INCENTIVE_DATE,
           (I.INCENTIVE_DATE-E.JOINING_DATE) AS DATE_DIFFERENCE
    FROM EMPLOYEEE E
    LEFT JOIN INCENTIVE I 
    ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--31. Get department, total salary with respect to a department from employee table.
    SELECT DEPARTMENT , SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEEE
    GROUP BY DEPARTMENT;     

--32. Get department, total salary with respect to a department from employee table order by total salary descending.
    SELECT DEPARTMENT, SUM(SALARY)AS TOTAL_SALARY FROM EMPLOYEEE
    GROUP BY DEPARTMENT 
   ORDER BY TOTAL_SALARY DESC;

--33. Get department, no of employees in a department, total salary with respect 
    --to a department from employee table order by total salary descending.
    
    SELECT DEPARTMENT, COUNT(*) AS NO_OF_EMP, SUM(SALARY) AS TOTAL_SALARY
    FROM EMPLOYEEE
    GROUP BY DEPARTMENT 
    ORDER BY TOTAL_SALARY DESC;

--34. Get department wise average salary from employee table order by salary ascending?
    SELECT DEPARTMENT ,round( AVG(SALARY),2) AS AVERAGE_SALARY 
    FROM EMPLOYEEE
    GROUP BY DEPARTMENT 
    ORDER BY AVERAGE_SALARY asc;

--35. Get department wise maximum salary from employee table order by salary ascending?
      select department , max(salary) as maximum_salary from employeee
      group by department 
      order by  maximum_salary asc;
      
      select * from employee


--36. Get department wise minimum salary from employee table order by salary ascending?
      select department, min(salary) as minimum_salary from employeee
      group by department 
      order by minimum_salary asc;

--37. Select no of employees joined with respect to year and month from employee table.
    SELECT 
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    EXTRACT(MONTH FROM joining_date) AS joining_month,
    COUNT(*) AS no_of_employees
    FROM employeee
    
    group by 
    EXTRACT(YEAR FROM joining_date),
    EXTRACT(MONTH FROM joining_date)
    
    order by 
      joining_year,
      joining_month



      
--38. 38.	Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending

    
    select department, sum(salary) as TOTAL_SALARY from employeee
    group by department
    having sum(salary) > 800000
    order by  TOTAL_SALARY;

--39. Select employee details from employee table if data in incentive table?
 
    select * from employee e 
    inner join incentive i
    on e.emp_id = i.employee_ref_id
        

---40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
           
    SELECT emp_id,first_name,last_name,salary,
       CASE
           WHEN first_name = 'John' THEN salary * 0.20
           WHEN first_name = 'Roy'  THEN salary * 0.10
           ELSE salary * 0.15
       END AS calculated_salary
FROM employeee;

   
    
    
----41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.
     SELECT emp_id,first_name,last_name,department, 
        CASE
           WHEN department = 'Banking'   THEN 'Bank Dept'
           WHEN department = 'Insurance' THEN 'Insurance Dept'
           ELSE 'Services Dept'
        END AS department_name
FROM employeee;

         


----42. Delete employee data from employee table who got incentives in incentive table
DELETE FROM employeee
WHERE emp_id IN (
    SELECT employee_ref_id FROM incentive
);
COMMIT;




--43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

    
    select e.first_name, i.incentive_amount from employeee e
    inner join incentive i 
    on e.emp_id = i.employee_ref_id
    
   

--44. Select first_name, incentive amount from employee and incentives 
      --table for those employees who have incentives and incentive amount greater than 3000
       
SELECT e.first_name, i.incentive_amount
FROM employeee e
INNER JOIN incentive i
    ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount > 3000;

--45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
    select e.first_name,i.incentive_amount from employeee e
    left join incentive i 
    on e.emp_id = i.employee_ref_id
    
    
--46. Select first_name, incentive amount from employee and incentives table for all employees
---- even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.

    select e.first_name, NVL(i.incentive_amount, 0) AS incentive_amount             --NVL IS USED FOR CONVERTING NULL TO 0
    from employeee e                                 
    left join incentive i 
    on e.emp_id = i.employee_ref_id

--47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
     select e.first_name, i.incentive_amount 
     from employeee e
     left join incentive i 
     on e.emp_id = i.employee_ref_id
     where i.incentive_amount is not null
     
--48. Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT E.First_name, I.Incentive_amount
FROM Employeee E
JOIN Incentive I 
ON E.Emp_id = I.Employee_ref_id

WHERE I.Incentive_amount = (
    SELECT MAX(Incentive_amount)                         --------------------------------------------- sub query.
    FROM Incentive
    WHERE Employee_ref_id = E.Emp_id
);























    


