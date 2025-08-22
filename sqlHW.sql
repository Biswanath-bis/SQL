CREATE DATABASE pratice_set

-- DEPARMENTS TABLE 
CREATE TABLE Departments
(DepartmentID INT PRIMARY KEY,DepartmentName VARCHAR(50) NOT NULL UNIQUE);
INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES
(1,'Computer Science'),
(2,'Mechanical'),
(3,'Civil'),
(4,'Electrical'),
(5,'Electronics');

SELECT * FROM Departments

-- STUDENT TABLE HAS USED DEPARTMENTID AS FOREGIN KEY
CREATE TABLE Student
(student_id int PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age int CHECK(age >=17),
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

INSERT INTO Student(student_id,name,age,DepartmentID)
VALUES
(1,'biswa',20,2),
(2,'babu',22,3),
(3,'rakesh',21,1),
(4,'bishnu',21,5),
(5,'chikun',18,2);

SELECT * FROM Student

--COURSE TABLE HAS USED   DEPARTMENTID AS A FOREIGN KEY
CREATE TABLE course
(CourseID INT  Primary Key
,CourseName VARCHAR(50) NOT NULL,
DepartmentID INT ,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

INSERT INTO course(CourseID,CourseName,DepartmentID)
VALUES
(3,'java',1),
(5,'AI',1),
(6,'DBMS',3),
(7,'Thermodynamics',2),
(8,'Circuits',4),
(9,'Structures',5);

SELECT * FROM Student
SELECT * FROM Departments
SELECT * FROM course


	-- where clause
--Display all students whose age is greater than 20.
SELECT * FROM Student WHERE age>=20

--Display all courses of the "Computer Science" department.
SELECT CourseName from course
WHERE DepartmentID=(
SELECT DepartmentID from Departments
WHERE DepartmentName='Computer Science');

--Display all students who belong to the "Electronics" department.
SELECT name from Student
where DepartmentID=(
SELECT DepartmentID FROM Departments
WHERE DepartmentName='Electronics');

--Display students whose age is between 18 and 22.
SELECT age FROM Student
WHERE age BETWEEN 18 AND 22;

--JOINS
--INNER JOIN Students with Departments (to show student names with their department names).
