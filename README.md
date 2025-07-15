# Library-Management-System
A SQL-based Library Management System with multiple tables (Members, Books, Transactions) to practice CRUD operations, advanced joins, subqueries, and CTAS for real-world database management.
# PROJECT SETUP
**Database create**:-Create the data base**
 ```sql
CREATE DATABASE library_management;
```
**Table Create**:-Create all the 6 tables
```sql
--Library Management System using SQL Project --P2
--Create First table branch
DROP TABLE IF EXISTS Barnch;
CREATE TABLE Branch(
    branch_id  VARCHAR( 10) PRIMARY KEY,
	manager_id  VARCHAR( 10),
	branch_address VARCHAR( 10),
	contact_no VARCHAR( 10)
); 
--Create second table employees 
DROP TABLE IF EXISTS employees;
 CREATE TABLE  employees(
emp_id	 VARCHAR( 10) PRIMARY KEY, 
emp_name  VARCHAR( 10),	
position VARCHAR( 10),	
salary	INT,
branch_id  VARCHAR( 10)

);
-- Create Books  table 
DROP TABLE IF EXISTS books;
CREATE TABLE  books(
   isbn VARCHAR(35) PRIMARY KEY,	
   book_title VARCHAR( 70),	
   category	 VARCHAR(15),
   rental_price FLOAT,
   status VARCHAR(15),
   author VARCHAR(45),
   publisher VARCHAR(37)

);

