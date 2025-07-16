--Library Management System using SQL Project --P2
--create database 
CREATE DATABASE library management;
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

--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT* FROM books;
--Task 2: Update an Existing Member's Address
UPDATE members
SET member_address= '125 Main St'
WHERE member_id='C101';
--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
DELETE  FROM issued_status 
WHERE issued_id='IS121'
--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT* FROM  employees
WHERE emp_id = 'E101'
--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_emp_id,count( *) 
FROM issued_status
 GROUP BY 1
 HAVING COUNT(*)>1;
