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
FOREIGN KEY issued_member_id  
REFERENCES members(member_id);

