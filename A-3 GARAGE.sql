

------------------------Customer Table------------------------------

CREATE TABLE CUSTOMER (
    CID            NUMBER PRIMARY KEY,
    CNAME          VARCHAR2(50),
    CADD           VARCHAR2(50),
    C_CONTACT      NUMBER,
    C_CREDITDAYS   NUMBER,
    CJ_DATE        DATE,
    SEX            VARCHAR2(10)
);

INSERT INTO CUSTOMER VALUES
(1001, 'Cyona blake', 'NEW YORK', 1235684, 20, TO_DATE('20-01-2011','DD-MM-YYYY'), 'FEMALE');

INSERT INTO CUSTOMER VALUES
(1002, 'JOHN SMITH', 'NEW JERSI', 1341684, 20, TO_DATE('21-02-2011','DD-MM-YYYY'), 'MALE');

INSERT INTO CUSTOMER VALUES
(1003, 'JORDAN WOOD', 'PRAG', 1805184, 20, TO_DATE('22-03-2011','DD-MM-YYYY'), 'MALE');

INSERT INTO CUSTOMER VALUES
(1004, 'CHRISTNA', 'MANHATTON', 1125684, 31, TO_DATE('23-04-2013','DD-MM-YYYY'), 'FEMALE');

INSERT INTO CUSTOMER VALUES
(1005, 'TOM HILL', 'LONDON', 1239284, 10, TO_DATE('25-06-2015','DD-MM-YYYY'), 'MALE');

INSERT INTO CUSTOMER VALUES
(1006, 'KAMILA JOSEF', 'PARISE', 124568, 9, TO_DATE('28-07-2011','DD-MM-YYYY'), 'FEMALE');

INSERT INTO CUSTOMER VALUES
(1007, 'ANDRU SYMON', 'TAXES', 125654, 15, TO_DATE('01-04-2016','DD-MM-YYYY'), 'MALE');

INSERT INTO CUSTOMER VALUES
(1008, 'SANJU SAMSUNG', 'NEW YORK', 12346341, 4, TO_DATE('20-01-2016','DD-MM-YYYY'), 'MALE');

select * from CUSTOMER;


--------------------------------Vendors Table-----------------------------

CREATE TABLE VENDORS (
    VID            NUMBER PRIMARY KEY,
    VNAME          VARCHAR2(50),
    VADD           VARCHAR2(50),
    VCONTACT       NUMBER,
    VCREDITDAYS    NUMBER,
    VJ_DATE        DATE
);

INSERT INTO VENDORS VALUES
(2001, 'KIRAN PATIL', 'PUNE', 2053535, 20, TO_DATE('20-01-2010','DD-MM-YYYY'));

INSERT INTO VENDORS VALUES
(2002, 'PRAKASH JAIN', 'MUMBAI', 2063564, 10, TO_DATE('05-11-2011','DD-MM-YYYY'));

INSERT INTO VENDORS VALUES
(2003, 'SWAPNIL THETE', 'NASHIK', 25355352, 15, TO_DATE('18-03-2010','DD-MM-YYYY'));

INSERT INTO VENDORS VALUES
(2004, 'AMOL SHENDE', 'SATARA', 23674776, 18, TO_DATE('07-04-2015','DD-MM-YYYY'));

INSERT INTO VENDORS VALUES
(2005, 'KARAN SINTRE', 'BULDHANA', 256756, 30, TO_DATE('22-04-2009','DD-MM-YYYY'));

INSERT INTO VENDORS VALUES
(2006, 'RAM KULKARNI', 'OSMANABAD', 20367454, 21, TO_DATE('09-07-2010','DD-MM-YYYY'));

select * from VENDORS;


----------------------------Employee Table------------------

CREATE TABLE EMPLOYEE (
    EID        NUMBER PRIMARY KEY,
    ENAME      VARCHAR2(50),
    EJOB       VARCHAR2(30),
    EADD       VARCHAR2(50),
    ECONTACT   NUMBER,
    ESAL       NUMBER,
    EDOJ       DATE,
    EDOL       DATE
);

INSERT INTO EMPLOYEE VALUES
(3001, 'STEVEN KING', 'PAINTER', 'NEW YORK', 10367454, 1200,
 TO_DATE('09-07-2010','DD-MM-YYYY'), NULL);

INSERT INTO EMPLOYEE VALUES
(3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', 10367434, 1100,
 TO_DATE('19-08-2010','DD-MM-YYYY'), NULL);

INSERT INTO EMPLOYEE VALUES
(3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', 10367264, 2200,
 TO_DATE('08-09-2010','DD-MM-YYYY'), NULL);

INSERT INTO EMPLOYEE VALUES
(3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', 10367264, 1700,
 TO_DATE('19-10-2009','DD-MM-YYYY'), TO_DATE('06-09-2010','DD-MM-YYYY'));

INSERT INTO EMPLOYEE VALUES
(3005, 'SHERI GOMES', 'FITTER', 'PARIS', 10327264, 1000,
 TO_DATE('19-10-2009','DD-MM-YYYY'), TO_DATE('01-08-2010','DD-MM-YYYY'));

INSERT INTO EMPLOYEE VALUES
(3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', 10322264, NULL,
 TO_DATE('01-01-2008','DD-MM-YYYY'), NULL);

select * from EMPLOYEE;
drop table EMPLOYEE;


------------------------Sparepart Table--------------------------

CREATE TABLE SPAREPART (
    SPID     NUMBER PRIMARY KEY,
    SPNAME   VARCHAR2(100),
    SPRATE   NUMBER,
    SPUNIT   VARCHAR2(20)
);


INSERT INTO SPAREPART VALUES (4001, 'TWO WHEELER TUBE', 250, 'NOS');
INSERT INTO SPAREPART VALUES (4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');
INSERT INTO SPAREPART VALUES (4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');
INSERT INTO SPAREPART VALUES (4004, 'TWO WHEELER CARBORATOR', 680, 'NOS');
INSERT INTO SPAREPART VALUES (4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS');
INSERT INTO SPAREPART VALUES (4006, 'TWO WHEELER TAIL LIGHT', 100, 'NOS');
INSERT INTO SPAREPART VALUES (4007, 'TWO WHEELER INDICATORS', 150, 'NOS');
INSERT INTO SPAREPART VALUES (4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');
INSERT INTO SPAREPART VALUES (4009, 'WHITE COLOUR', 340, 'LTRS');
INSERT INTO SPAREPART VALUES (4010, 'BLACK COLOUR', 240, 'LTRS');
INSERT INTO SPAREPART VALUES (4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');
INSERT INTO SPAREPART VALUES (4012, 'FOUR WHEELER SIDE MIRROR', 450, 'NOS');
INSERT INTO SPAREPART VALUES (4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');
INSERT INTO SPAREPART VALUES (4014, 'FOUR WHEELER BUMPER', 6000, 'NOS');
INSERT INTO SPAREPART VALUES (4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');


SELECT * FROM SPAREPART;

--------------------------Purchase Table ---------------------------------

CREATE TABLE PURCHASE (
    PID        NUMBER PRIMARY KEY,
    VID        NUMBER,
    SPID       NUMBER,
    PQTY       NUMBER,
    SPRATE     NUMBER,
    SPGST      NUMBER,
    PDATE      DATE,
    TRANCOST   NUMBER,
    TOTAL      NUMBER,
    RCV_EID    NUMBER,

    CONSTRAINT FK_PURCHASE_VENDOR
        FOREIGN KEY (VID) REFERENCES VENDORS(VID),

    CONSTRAINT FK_PURCHASE_SPAREPART
        FOREIGN KEY (SPID) REFERENCES SPAREPART(SPID),

    CONSTRAINT FK_PURCHASE_EMP
        FOREIGN KEY (RCV_EID) REFERENCES EMPLOYEE(EID)
);

INSERT INTO PURCHASE VALUES
(5001, 2001, 4001, 10, 250, 350, TO_DATE('01-01-2011','DD-MM-YYYY'), 1300, 4150, 3001);

INSERT INTO PURCHASE VALUES
(5002, 2002, 4002, 4, 400, 288, TO_DATE('02-03-2011','DD-MM-YYYY'), 100, 1988, 3001);

INSERT INTO PURCHASE VALUES
(5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-06-2011','DD-MM-YYYY'), 50, 6251.6, 3003);

INSERT INTO PURCHASE VALUES
(5004, 2004, 4005, 10, 129, 154.8, TO_DATE('22-08-2011','DD-MM-YYYY'), 125, 1569.8, 3004);

INSERT INTO PURCHASE VALUES
(5005, 2005, 4006, 20, 100, 300, TO_DATE('07-09-2011','DD-MM-YYYY'), 20, 2320, 3003);

INSERT INTO PURCHASE VALUES
(5006, 2006, 4007, 30, 150, 630, TO_DATE('12-10-2011','DD-MM-YYYY'), 60, 5190, 3000);

INSERT INTO PURCHASE VALUES
(5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-09-2011','DD-MM-YYYY'), 1000, 115000, 3000);

INSERT INTO PURCHASE VALUES
(5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-10-2011','DD-MM-YYYY'), 50, 194.48, 3005);

INSERT INTO PURCHASE VALUES
(5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-10-2011','DD-MM-YYYY'), 50, 194.48, 3005);

INSERT INTO PURCHASE VALUES
(5010, 2006, 4009, 5, 340, 238, TO_DATE('20-10-2011','DD-MM-YYYY'), 0, 2938, 3005);


SELECT * FROM PURCHASE;
drop table PURCHASE;

----------------- SER_DET Table-----------------

CREATE TABLE SER_DET (
    SID        NUMBER PRIMARY KEY,
    CID        NUMBER,
    EID        NUMBER,
    SPID       NUMBER,
    TYP_VEH    VARCHAR2(30),
    VEH_NO     VARCHAR2(20),
    TYP_SER    VARCHAR2(50),
    SER_DATE   DATE,
    QTY        NUMBER,
    SP_RATE    NUMBER,
    SP_AMT     NUMBER,
    SP_GST     NUMBER,
    SER_AMT    NUMBER,
    COMM       NUMBER,
    TOTAL      NUMBER,

    CONSTRAINT FK_SERDET_CUSTOMER
        FOREIGN KEY (CID) REFERENCES CUSTOMER(CID),

    CONSTRAINT FK_SERDET_EMP
        FOREIGN KEY (EID) REFERENCES EMPLOYEE(EID),

    CONSTRAINT FK_SERDET_SPAREPART
        FOREIGN KEY (SPID) REFERENCES SPAREPART(SPID)
);


INSERT INTO SER_DET VALUES
(6001, 1001, 3001, 4001, 'TWO WHEELER', 'MH15CA3228',
 'TUBE DAMAGED', TO_DATE('02-01-2011','DD-MM-YYYY'),
 1, 250, 250, 35, 50, 0, 335);

INSERT INTO SER_DET VALUES
(6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH16U5713',
 'FULL SERVICING', TO_DATE('04-03-2011','DD-MM-YYYY'),
 1, 400, 400, 52, 300, 50, 752);

INSERT INTO SER_DET VALUES
(6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313',
 'CLUTCH WIRE', TO_DATE('22-08-2011','DD-MM-YYYY'),
 1, 129, 129, 0, 10, 0, 139);

INSERT INTO SER_DET VALUES
(6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH16U5713',
 'FULL SERVICING', TO_DATE('05-05-2011','DD-MM-YYYY'),
 1, 400, 400, 52, 300, 50, 752);

INSERT INTO SER_DET VALUES
(6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH14PA3355',
 'COLOR', TO_DATE('21-10-2011','DD-MM-YYYY'),
 2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO SER_DET VALUES
(6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH12WE334',
 'COLOR', TO_DATE('01-12-2011','DD-MM-YYYY'),
 2.5, 340, 850, 119, 500, 150, 1469);

INSERT INTO SER_DET VALUES
(6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345',
 'TUBE DAMAGED', TO_DATE('01-01-2012','DD-MM-YYYY'),
 1, 250, 250, 35, 150, 0, 435);



SELECT * FROM SER_DET;

drop table SER_DET;





----------------------------------------------Garage System Questions.

---Q.1 List all the customers serviced.
SELECT DISTINCT c.*
FROM customer c
JOIN ser_det s 
ON s.cid = c.cid;




---Q.2 Customers who are not serviced.

SELECT *
FROM customer c
WHERE NOT EXISTS (
    SELECT 1 FROM ser_det s WHERE s.cid = c.cid
);


---Q.3 Employees who have not received the commission.

SELECT *
FROM employee
WHERE NVL(commission,0) = 0;


---Q.4 Name the employee who have maximum Commission.
SELECT ename
FROM employee
WHERE commission = (SELECT MAX(commission) FROM employee);



----Q.5 Show employee name and minimum commission amount received by an employee.

SELECT ename, commission
FROM employee
WHERE commission = (SELECT MIN(commission) FROM employee);


---Q.6 Display the Middle record from any table.
SELECT *
FROM (
    SELECT e.*, ROW_NUMBER() OVER (ORDER BY eid) rn,
           COUNT(*) OVER () cnt
    FROM employee e
)
WHERE rn = CEIL(cnt/2);


----Q.7 Display last 4 records of any table.
SELECT *
FROM (
    SELECT * FROM employee ORDER BY eid DESC
)
WHERE ROWNUM <= 4;


----Q.8 Count the number of records without count function from any table.
SELECT SUM(1) total_rows FROM employee;


---Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
DELETE FROM ser_det
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM ser_det
    GROUP BY cid
);
ROLLBACK;

----Q.10 Show the name of Customer who have paid maximum amount 
SELECT c.cname
FROM customer c
JOIN ser_det s ON s.cid = c.cid
WHERE s.service_amt = (SELECT MAX(service_amt) FROM ser_det);

-----Q.11 Display Employees who are not currently working.
SELECT *
FROM employee
WHERE status = 'INACTIVE';

----Q.12 How many customers serviced their two wheelers.
SELECT COUNT(DISTINCT cid)
FROM ser_det
WHERE vehicle_type = 'TWO WHEELER';

----Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
SELECT sp.spname, sp.unit
FROM sparepart sp
JOIN ser_det s ON s.spid = sp.spid;

----Q.14 Customers who have Colored their vehicles.
SELECT DISTINCT c.cname
FROM customer c
JOIN ser_det s ON s.cid = c.cid
JOIN sparepart sp ON sp.spid = s.spid
WHERE sp.spname = 'COLOR';

-----Q.15 Find the annual income of each employee inclusive of Commission
SELECT ename,
       (salary*12) + NVL(commission,0) annual_income
FROM employee;


-----Q.16 Vendor Names who provides the engine oil.
SELECT DISTINCT v.vname
FROM vendors v
JOIN purchase p ON p.vid = v.vid
JOIN sparepart sp ON sp.spid = p.spid
WHERE sp.spname = 'ENGINE OIL';



------Q.17 Total Cost to purchase the Color and name the color purchased.
SELECT sp.spname, SUM(p.rate*p.qty) total_cost
FROM purchase p
JOIN sparepart sp ON sp.spid = p.spid
WHERE sp.spname = 'COLOR'
GROUP BY sp.spname;



----Q.18 Purchased Items which are not used in "Ser_det".
SELECT DISTINCT sp.spname
FROM sparepart sp
JOIN purchase p ON p.spid = sp.spid
WHERE sp.spid NOT IN (SELECT spid FROM ser_det);



Q.19 Spare Parts Not Purchased but existing in Sparepart
SELECT *
FROM sparepart
WHERE spid NOT IN (SELECT spid FROM purchase);

Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.
SELECT
(SELECT SUM(service_amt) FROM ser_det) -
((SELECT SUM(salary) FROM employee) +
 (SELECT SUM(rate*qty) FROM purchase)) AS profit_loss
FROM dual;



Q.21 Specify the names of customers who have serviced their vehicles more than one time.
SELECT cid
FROM ser_det
GROUP BY cid
HAVING COUNT(*) > 1;

Q.22 List the Items purchased from vendors locationwise.
SELECT location, sp.spname
FROM purchase p
JOIN sparepart sp ON sp.spid = p.spid;


Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT vehicle_type, COUNT(*)
FROM ser_det
GROUP BY vehicle_type;


----Q24 Display name of customers who paid highest SPGST and for which item 
SELECT c.cname, sp.spname
FROM purchase p
JOIN customer c ON c.cid = p.cid
JOIN sparepart sp ON sp.spid = p.spid
WHERE p.spgst = (SELECT MAX(spgst) FROM purchase);

------Q25 Display vendors name who have charged highest SPGST rate  for which item
SELECT v.vname, sp.spname
FROM vendors v
JOIN purchase p ON p.vid = v.vid
JOIN sparepart sp ON sp.spid = p.spid
WHERE p.spgst = (SELECT MAX(spgst) FROM purchase);


----Q26   list name of item and employee name who have received item 
SELECT sp.spname, e.ename
FROM purchase p
JOIN sparepart sp ON sp.spid = p.spid
JOIN employee e ON e.eid = p.rcv_eid;


---- Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'
SELECT c.cname, s.vehicle_no, sp.spname,
       p.pdate, v.vname, sp.unit, p.location, e.ename
FROM ser_det s
JOIN customer c ON c.cid = s.cid
JOIN sparepart sp ON sp.spid = s.spid
JOIN purchase p ON p.spid = sp.spid
JOIN vendors v ON v.vid = p.vid
JOIN employee e ON e.eid = s.eid
WHERE s.vehicle_no = 'MH-14PA335';

---Q28 who belong this vehicle  MH-14PA335" Display the customer name 
SELECT c.cname
FROM customer c
JOIN ser_det s ON s.cid = c.cid
WHERE s.vehicle_no = 'MH-14PA335';






--- Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date    
SELECT c.cname, s.service_date
FROM customer c
JOIN ser_det s ON s.cid = c.cid
WHERE c.cadd = 'NEW YORK';


---Q 30 from whom we have purchased items having maximum cost?
SELECT v.vname
FROM vendors v
JOIN purchase p ON p.vid = v.vid
WHERE p.rate*p.qty = (
    SELECT MAX(rate*qty) FROM purchase
);


----Q31 Display the names of employees who are not working as Mechanic and that employee done services   .
SELECT DISTINCT e.*
FROM employee e
JOIN ser_det s ON s.eid = e.eid
WHERE e.job <> 'MECHANIC';


----Q32 Display the various jobs along with total number of employees in each job. The output should
SELECT job, COUNT(*) total_employees
FROM employee
GROUP BY job
HAVING COUNT(*) > 2;


contain only those jobs with more than two employees.


---Q33 Display the details of employees who done service  and give them rank according to their no. of services .
SELECT e.eid, e.ename,
       COUNT(s.sid) total_services,
       RANK() OVER (ORDER BY COUNT(s.sid) DESC) rnk
FROM employee e
JOIN ser_det s ON s.eid = e.eid
GROUP BY e.eid, e.ename;


-----Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter  
SELECT e.job, COUNT(s.sid) total_services
FROM employee e
JOIN ser_det s ON s.eid = e.eid
WHERE e.job IN ('PAINTER','FITTER')
GROUP BY e.job;


----Q35 Display employee salary and as per highest  salary provide Grade to employee 
SELECT ename, salary,
       CASE
         WHEN salary = (SELECT MAX(salary) FROM employee) THEN 'A'
         WHEN salary >= (SELECT AVG(salary) FROM employee) THEN 'B'
         ELSE 'C'
       END grade
FROM employee;


----Q36  display the 4th record of emp table without using group by and rowid
SELECT *
FROM (
    SELECT e.*, ROW_NUMBER() OVER (ORDER BY eid) rn
    FROM employee e
)
WHERE rn = 4;


----Q37 Provide a commission 100 to employees who are not earning any commission.
UPDATE employee
SET commission = 100
WHERE NVL(commission,0) = 0;


---Q38 write a query that totals no. of services  for each day and place the results
in descending order
SELECT service_date, COUNT(*) total_services
FROM ser_det
GROUP BY service_date
ORDER BY total_services DESC;


----Q39 Display the service details of those customer who belong from same city 
SELECT c.cadd, c.cname, s.*
FROM customer c
JOIN ser_det s ON s.cid = c.cid
ORDER BY c.cadd;


----Q40 write a query join customers table to itself to find all pairs of
customers service by a single employee
SELECT s1.cid customer1, s2.cid customer2, s1.eid
FROM ser_det s1
JOIN ser_det s2
  ON s1.eid = s2.eid
 AND s1.cid < s2.cid;


----Q41 List each service number follow by name of the customer who
made  that service
SELECT s.sid, c.cname
FROM ser_det s
JOIN customer c ON c.cid = s.cid;


----Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee  .Note (rating should be like A,B,C,D)
SELECT e.eid, e.ename,
       COUNT(s.sid) total_services,
       CASE
         WHEN COUNT(s.sid) >= 10 THEN 'A'
         WHEN COUNT(s.sid) >= 7 THEN 'B'
         WHEN COUNT(s.sid) >= 4 THEN 'C'
         ELSE 'D'
       END rating
FROM employee e
LEFT JOIN ser_det s ON s.eid = e.eid
GROUP BY e.eid, e.ename;


----Q43 Write a query to get maximum service amount of each customer with their customer details ?
SELECT c.*, MAX(s.service_amt) max_service_amt
FROM customer c
JOIN ser_det s ON s.cid = c.cid
GROUP BY c.cid, c.cname, c.cadd, c.c_contact, c.c_creditdays, c.cj_date, c.sex;


----Q44 Get the details of customers with his total no of services ?
SELECT c.cname, COUNT(s.sid) total_services
FROM customer c
LEFT JOIN ser_det s ON s.cid = c.cid
GROUP BY c.cname;


---Q45 From which location sparpart purchased  with highest cost ?
SELECT location
FROM purchase
WHERE rate*qty = (SELECT MAX(rate*qty) FROM purchase);


---Q46 Get the details of employee with their service details who has salary is null
SELECT e.*, s.*
FROM employee e
JOIN ser_det s ON s.eid = e.eid
WHERE e.salary IS NULL;


---Q47 find the sum of purchase location wise 
SELECT location, SUM(rate*qty) total_purchase
FROM purchase
GROUP BY location;


---Q48 write a query sum of purchase amount in word location wise ?
SELECT location,
       TO_CHAR(SUM(rate*qty), 'FM999G999G999') total_amount
FROM purchase
GROUP BY location;


---Q49 Has the customer who has spent the largest amount money has
been give highest rating
SELECT c.cname, c.rating
FROM customer c
WHERE c.cid = (
    SELECT cid
    FROM ser_det
    GROUP BY cid
    HAVING SUM(service_amt) = (
        SELECT MAX(SUM(service_amt))
        FROM ser_det
        GROUP BY cid
    )
);


-----Q50 select the total amount in service for each customer for which
the total is greater than the amount of the largest service amount in the table
SELECT cid, SUM(service_amt) total_amt
FROM ser_det
GROUP BY cid
HAVING SUM(service_amt) >
       (SELECT MAX(service_amt) FROM ser_det);

-----Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
SELECT c.cname, sp.spname, s.vehicle_type
FROM ser_det s
JOIN customer c ON c.cid = s.cid
JOIN sparepart sp ON sp.spid = s.spid;

----Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 

SELECT sp.spname, e.ename, c.cname,
       s.qty, p.rate, s.service_amt
FROM ser_det s
JOIN sparepart sp ON sp.spid = s.spid
JOIN employee e ON e.eid = s.eid
JOIN customer c ON c.cid = s.cid
JOIN purchase p ON p.spid = s.spid;

---Q53 specify the vehicles owners who’s tube damaged.
SELECT DISTINCT c.cname
FROM customer c
JOIN ser_det s ON s.cid = c.cid
JOIN sparepart sp ON sp.spid = s.spid
WHERE sp.spname = 'TUBE';


-----Q.54 Specify the details who have taken full service.
SELECT DISTINCT c.cname
FROM customer c
JOIN ser_det s ON s.cid = c.cid
WHERE s.service_type = 'FULL';



-----Q.55 Select the employees who have not worked yet and left the job.
SELECT *
FROM employee
WHERE eid NOT IN (SELECT eid FROM ser_det)
AND status = 'LEFT';



-----Q.56  Select employee who have worked first ever.
SELECT e.*
FROM employee e
JOIN ser_det s ON s.eid = e.eid
WHERE s.service_date = (SELECT MIN(service_date) FROM ser_det);



----Q.57 Display all records falling in odd date
SELECT *
FROM ser_det
WHERE MOD(TO_NUMBER(TO_CHAR(service_date,'DD')),2) = 1;


-----Q.58 Display all records falling in even date
SELECT *
FROM ser_det
WHERE MOD(TO_NUMBER(TO_CHAR(service_date,'DD')),2) = 0;


----Q.59 Display the vendors whose material is not yet used.
SELECT DISTINCT v.vname
FROM vendors v
JOIN purchase p ON p.vid = v.vid
WHERE p.spid NOT IN (SELECT spid FROM ser_det);



----Q.60 Difference between purchase date and used date of spare part.
 SELECT p.spid,
       s.used_date - p.pdate AS days_difference
FROM purchase p
JOIN ser_det s ON s.spid = p.spid;






















