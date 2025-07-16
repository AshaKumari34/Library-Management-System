# Library-Management-System
A SQL-based Library Management System with multiple tables (Members, Books, Transactions) to practice CRUD operations, advanced joins, subqueries, and CTAS for real-world database management.
![library](https://github.com/AshaKumari34/Library-Management-System/blob/main/Library%20img.png)
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
-- Create  members  table
DROP TABLE IF EXISTS members;
CREATE TABLE members(
    member_id VARCHAR(15) primary key,
	member_name	 VARCHAR(15),
	member_address	 VARCHAR(15),
	reg_date DATE

);
--Create issue-related table
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
    issued_id  VARCHAR(10) PRIMARY KEY,
	issued_member_id  VARCHAR(10),	--FK
	issued_book_name  VARCHAR(70),
	issued_date DATE,
	issued_book_isbn  VARCHAR(15),--FK
	issued_emp_id	 VARCHAR(10)--FK

);
--create table for book return
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
     return_id	VARCHAR(10) PRIMARY KEY,
	 issued_id	VARCHAR(10),--FK
	 return_book_name	VARCHAR(70),
	 return_date DATE,	
	 return_book_isbn VARCHAR(20)	


);
```
# DATA MODELING
In this i use **ALTER** for modify/update the table , add  **CONSTRAINT** for rule/restriction,**FOREIGN KEY**  links a column in one table to a unique column in another, ensuring valid relationships between the two .<br>
(adding a rule  ensuring column are valid and both linked with each other)
```sql
--FOREIGN KEY MEMBER_ID
ALTER  TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id ) 
REFERENCES members(member_id);

--FOREIGN KEY  books isbn
ALTER  TABLE issued_status
ADD CONSTRAINT fk_return
FOREIGN KEY (issued_book_isbn )
REFERENCES  books(isbn);


--FOREIGN KEY status
ALTER  TABLE return_status
ADD CONSTRAINT fk_status
FOREIGN KEY (issued_id)
REFERENCES  issued_status(issued_id);

--FOREIGN KEY branch
ALTER  TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch (branch_id);

--FOREIGN KEY emp
ALTER  TABLE issued_status
ADD CONSTRAINT fk_emp
FOREIGN KEY (issued_emp_id)
REFERENCES employees (emp_id);

```
![data model](https://github.com/AshaKumari34/Library-Management-System/blob/main/ERD%20img.png) 

