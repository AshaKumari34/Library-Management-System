# Library-Management-System
**PROJECT OVERVIEW**<BR>
**Project Title**:-Library-Management-System
# 📚 Library Management System (SQL Project for Beginners)

A first -level SQL project simulating a simple Library Management System. It covers foundational concepts of relational database design, CRUD operations, and basic to intermediate querying skills.

## 🧠 What I Learned
- ✅ Table Creation with primary & foreign keys  
- ✅ Basic Relationships between entities like Books, Members, Staff  
- ✅ CRUD Operations – Insert, Update, Delete, Select  
- ✅ JOINs and Aggregate Functions for useful data insights  
- ✅ Normalization & Schema Design for better data structure

## 🛠 Tools Used
- pgAdmin / VS Code for SQL scripting  
- GitHub for version control and project showcase  
- Basic Markdown for documentation

## 📊 Sample Queries
```sql
-- Retrieve details of most issued books
SELECT book_title, COUNT(*) AS issue_count
FROM issue_records
GROUP BY book_title
ORDER BY issue_count DESC;

-- Join Members and Issue Records
SELECT m.member_name, i.book_title, i.issue_date
FROM members m
JOIN issue_records i ON m.member_id = i.member_id;
```

## 📁 Project Structure
```
📦 LibraryManagementSystem_SQL
├── 📜 schema.sql
├── 📜 queries.sql
├── 📜 README.md
```

## 🚀 Project Goals
- Apply theoretical SQL knowledge to a hands-on project  
- Build confidence in writing and debugging queries  
- Create a strong foundation for advanced database projects  
- Showcase beginner-friendly work to recruiters and peers

## 📌 Future Enhancements
- Add stored procedures and triggers  
- Integrate Power BI dashboard for data visualization  
- Explore transaction control and error handling


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
# 3.CRUD Operations
**Create**:-Insert sample records into the books table.<br>
**Read**:-Retrieved and displayed data from various tables.<br>
**Update**:-Update records in e table.<br>
**Delete**:-Remove reocords from the table.<br>
**Task 1. Create a New Book Record** -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
```sql
INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT* FROM books;
```
**Task 2: Update an Existing Member's Address**
```sql
UPDATE members
SET member_address= '125 Main St'
WHERE member_id='C101';
```
**Task 3: Delete a Record from the Issued Status Table** -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
```sql
DELETE  FROM issued_status 
WHERE issued_id='IS121';
```
**Task 4: Retrieve All Books Issued by a Specific Employee** -- Objective: Select all books issued by the employee with emp_id = 'E101'.
```sql
SELECT* FROM  employees
WHERE emp_id = 'E101'
```
**Task 5: List Members Who Have Issued More Than One Book** -- Objective: Use GROUP BY to find members who have issued more than one book.
```SQL
SELECT issued_emp_id,count( *) 
FROM issued_status
 GROUP BY 1
 HAVING COUNT(*)>1;
```
# CTAS(Create Table As Select)
**Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results**- each book and total book_issued_cnt
```sql
 CREATE TABLE book_count
AS
SELECT b.isbn,b.book_title,COUNT(i.issued_id) FROM books b
JOIN issued_status i
ON i.issued_book_isbn=b.isbn
GROUP BY 1,2;
```
**Task 7: Retrieve all books in a specific category**
```sql
SELECT * FROM books
where category ='Classic'
```
**Task 8:Find Total Rental Income by category**
```sql
SELECT b.category,SUM(rental_price),COUNT(*) FROM books b
JOIN issued_status i
ON i.issued_book_isbn=b.isbn
GROUP BY 1;
```
**Task 9:Members who Resgistered  in the last 180 Days**
```sql
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE -INTERVAL '180 Days';
```
**Task 10:Create a Table of Books with Rental Price Above a Certain Threshold:**
```sql
CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;
```
# Conslustion

Through this project i learn CRUD ,CTAS(CREATE TABLE AS SELECT)& DATA MODELING which  help me learning new things like how to create table to store the data of another table ,use crud operation and the best one data modeling in which i use FOREIGN KEY  for the first .















