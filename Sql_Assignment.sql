--1.Insert a new record in your Orders table.
--2.Add Primary key constraint for SalesmanId column in Salesman table. Add default
     --constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
        --column in Customer table. Add not null constraint in Customer_name column for the
            --Customer table.
--3.Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
   --amount value greater than 500.
--4.Using SET operators, retrieve the first result with unique SalesmanId values from two
  --tables, and the other result containing SalesmanId with duplicates from two tables.
--5.Display the below columns which has the matching data.
     --Orderdate, Salesman Name, Customer Name, Commission, and City which has the
         --range of Purchase Amount between 500 to 1500.
--6-Using right join fetch all the results from Salesman and Orders table.





CREATE TABLE Salesman(
   SalesmanId INT PRIMARY KEY,
   SalesmanName VARCHAR(100),
   Commision INT,
   City VARCHAR(100) DEFAULT 'unknown' ,
   Age INT
   );

   INSERT INTO Salesman(SalesmanId,SalesmanName,Commision,City,Age)
   VALUES
       (101,'Joe',50,'California',17),
       (102,'Simon',75,'Texas',25),
       (103,'Jessie',105,'Florida',35),
       (104,'Danny',100,'Texas',22),
       (105,'Lia',65,'New Jersy',30);

       SELECT * FROM Salesman

   CREATE TABLE Customer(
    CustomerId INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    PurchaseAmount DECIMAL(10,2),
    SalesmanId INT,
    FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)
   );
  

    INSERT INTO Customer(CustomerId,CustomerName,PurchaseAmount,SalesmanId)

   VALUES
    (2345,'Andrew',550,101),
    (1575,'Lucky',4500,102),
    (2346,'Andrew',4000,103),
    (2347,'Remona',2700,104),
    (2348,'Julia',4545,105);


    SELECT * FROM Customer
    
    INSERT INTO Customer(CustomerId,CustomerName,PurchaseAmount,SalesmanId)

   VALUES
   (2349,'Thor',4545,105);
    

    CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    SalesmanId INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)
);

INSERT INTO  Orders(OrderId,CustomerId, SalesmanId,OrderDate,Amount)

VALUES
(5001,2345,101,'2021-07-04',500),
(5002,2346,104,'2022-02-15',1500);

SELECT * FROM Orders

--Insert a new record in your Orders table.
INSERT INTO  Orders(OrderId,CustomerId, SalesmanId,OrderDate,Amount)

VALUES
(5003,2347,102,'2023-07-04',5100);

/*Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.*/

SELECT * FROM Customer
Where CustomerName LIKE '%w'
AND PurchaseAmount >500;

/*
Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.*/

--SET OPERATOR--->UNION AND UNION ALL

SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer;

SELECT SalesmanId FROM Salesman
UNION 
SELECT SalesmanId FROM Customer;

/*
Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.*/

SELECT 
    O.OrderDate,
    S.SalesmanName,
    C.CustomerName,
    S.Commision,
    S.City,
    C.PurchaseAmount
    
FROM 
Orders O 
JOIN Customer C ON O.CustomerId = C.CustomerId
JOIN Salesman S ON O.SalesmanId = S.SalesmanId
WHERE C.PurchaseAmount BETWEEN 500 AND 1500;

select * from Salesman
select * from Orders
select * from Customer

--Using right join fetch all the results from Salesman and Orders table.

SELECT *
FROM Orders O
RIGHT JOIN Salesman S ON O.SalesmanId = S.SalesmanId;

   --ASSIGNMENT 2

--Tasks To Be Performed:
--1.Create a customer table which comprises of these columns:
--‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’,
--‘city’,’state’,’zip’
--2.Insert 5 new records into the table
--3.Select only the ‘first_name’ and ‘last_name’ columns from
--the customer table
--4.Select those records where ‘first_name’ starts with “B”
--and city is ‘San Jose’.
--5.Select those records where Email has only ‘gmail’.
--6.Select those records where the ‘last_name’ doesn't end with
--“K”.


CREATE TABLE Custome_2(
customer_id INT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100),
email VARCHAR(100) NOT NULL,
address VARCHAR(100) DEFAULT 'UNKNOWN',
city VARCHAR(100),
state VARCHAR(100),
zip INT
);

INSERT INTO Custome_2(customer_id,first_name,last_name,email,address,city,state,zip)
VALUES(1,'Biswanath','Bhuyan','biswa@gmail.com','India','Kendrapara','Odisha',754210),
      (2,'Bishnu','Prasad','bishnu@gmail.com','India','Bhubaneswae','Odisha',754211),
      (3,'Chikun','Sahoo','chikun@gmail.com','India','Patna','Bihar',754212),
      (4,'Happy','Nayak','happy@gmail.com','India','Kendrapara','Odisha',754210),
      (5,'JB','Nayak','jaga@gmail.com','India','Bhubaneswar','Odisha',754210);

      SELECT * FROM Custome_2

--3.Select only the ‘first_name’ and ‘last_name’ columns from
--the customer table
SELECT first_name,last_name
FROM Custome_2

--4.Select those records where ‘first_name’ starts with “B”

SELECT * -- first_name
FROM Custome_2
WHERE first_name LIKE 'b%'

--4.Select those records where ‘last_name’ ENDS with “K”
 
 SELECT last_name
 FROM Custome_2
 WHERE last_name LIKE '%k'

 --5.Select those records where Email has only ‘gmail’.
SELECT email
FROM Custome_2
WHERE email LIKE '%gmail.com'

--6.Select those records where the ‘last_name’ doesn't end with
--“K”.
SELECT * 
FROM Custome_2
WHERE last_name NOT LIKE '%k'      


--ASSIGNMENT-3
--Tasks To Be Performed:
--1.Create an ‘Orders’ table which comprises of these columns:
--‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’.
--2.Insert 5 new records.
--3.Make an inner join on ‘Customer’ and ‘Orders’ tables on the
--‘customer_id’ column.
--4.Make left and right joins on ‘Customer’ and ‘Orders’
--tables on the ‘customer_id’ column.
--5.Make a full outer join on ‘Customer’ and ‘Orders’ table on the
--‘customer_id’ column.
--6.Update the ‘Orders’table and set the amount to
--be 100 where ‘customer_id’ is 3.



--1.Create an ‘Orders’ table which comprises of these columns:
--‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’.

CREATE TABLE Orders_2(
order_id INT PRIMARY KEY,
order_date VARCHAR(100),
amount INT NOT NULL, 
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES Custome_2(customer_id)
);

--2.Insert 5 new records.

   INSERT INTO Orders_2(order_id,order_date,amount,customer_id)
   VALUES
    (1101,'2021-07-01',550,2),
    (1202,'2021-09-23',4500,1),
    (1303,'2022-03-15',4000,2),
    (2024,'2023-06-06',2700,3),
    (2025,'2025-11-09',4545,5);

    SELECT * FROM Orders_2

 --3.Make an inner join on ‘Customer’ and ‘Orders’ tables on the
--‘customer_id’ column.

SELECT C.* ,O.customer_id
FROM Custome_2 AS C 
INNER JOIN Orders_2 AS O
ON C.customer_id=O.customer_id

--4.Make left and right joins on ‘Customer’ and ‘Orders’
--tables on the ‘customer_id’ column.
SELECT * FROM Custome_2
SELECT * FROM Orders_2

SELECT C.*,O.customer_id
FROM Custome_2 AS C
LEFT JOIN Orders_2 AS O
ON C.customer_id=O.customer_id

SELECT C.*,O.customer_id
FROM Custome_2 AS C
RIGHT JOIN Orders_2 AS O
ON C.customer_id=O.customer_id

--5.Make a full outer join on ‘Customer’ and ‘Orders’ table on the
--‘customer_id’ column.

SELECT C.*,O.customer_id
FROM Custome_2 AS C
FULL JOIN Orders_2 AS O
ON C.customer_id=O.customer_id

--6.Update the ‘Orders’table and set the amount to
--be 100 where ‘customer_id’ is 3.

UPDATE Orders_2
SET amount=100
WHERE customer_id=3