# library_management.sql
📚 Library Management System — SQL Project

A simple, practical SQL database project for managing books, authors, members, and borrowing transactions.





🌟 About the Project

This project implements a Library Management System using MySQL.

It demonstrates how a relational database can be used to store and manage:

📖 Books
✍️ Authors
👥 Library Members
🔄 Book Borrowing Transactions
💰 Fines
📊 Book statistics and borrowing information

The project is designed as a hands-on SQL practice project covering everything from database creation and data insertion to joins, aggregate functions, subqueries, date functions, string functions, CASE, and window functions.

🗂️ Database Structure

The database is named:

l

📌 Tables
                    ┌──────────────┐
                    │   AUTHORS    │
                    │──────────────│
                    │ author_id PK │
                    │ name         │
                    │ email        │
                    └──────┬───────┘
                           │
                           │
                    ┌──────▼───────┐
                    │    BOOKS     │
                    │──────────────│
                    │ book_id PK   │
                    │ title        │
                    │ author_id FK │
                    │ category     │
                    │ isbn         │
                    │ published... │
                    │ price        │
                    │ copies       │
                    └──────┬───────┘
                           │
                           │
                    ┌──────▼────────────┐
                    │   TRANSACTIONS    │
                    │───────────────────│
                    │ transaction_id PK │
                    │ member_id FK      │
                    │ book_id FK        │
                    │ borrow_date       │
                    │ return_date       │
                    │ fine_amount       │
                    └──────▲────────────┘
                           │
                           │
                    ┌──────┴───────┐
                    │   MEMBERS    │
                    │──────────────│
                    │ member_id PK │
                    │ name         │
                    │ email        │
                    │ phone_number │
                    │ membership...│
                    └──────────────┘

🧱 Tables at a Glance
Table	Purpose
authors	Stores author information
books	Stores book details and availability
members	Stores library member information
transactions	Tracks borrowing, returning, and fines
🔑 Relationships

The database uses Primary Keys and Foreign Keys to maintain relationships between tables.

Books → Authors
books.author_id → authors.author_id


Each book is associated with an author.

Transactions → Members
transactions.member_id → members.member_id


Each transaction belongs to a library member.

Transactions → Books
transactions.book_id → books.book_id


Each transaction records the book that was borrowed.

🛠️ SQL Concepts Demonstrated

This project covers a wide range of MySQL concepts:

🏗️ Database & Table Creation
CREATE DATABASE
USE
CREATE TABLE
Primary Keys
Foreign Keys
✏️ Data Manipulation
INSERT
UPDATE
DELETE
SELECT
🔍 Filtering
WHERE
AND
OR
NOT
Comparison operators
📊 Sorting & Aggregation
ORDER BY
GROUP BY
COUNT()
AVG()
MAX()
MIN()
🔗 Joins
INNER JOIN
LEFT JOIN
🧠 Advanced SQL
Subqueries
EXISTS
NOT IN
CASE
COALESCE
Window Functions
RANK()
Cumulative calculations
Moving calculations
📅 Date Functions
YEAR()
DATEDIFF()
DATE_FORMAT()
DATE_SUB()
CURDATE()
🔤 String Functions
UPPER()
TRIM()
📈 Example Queries
📚 Find the Most Expensive Books
SELECT *
FROM books
ORDER BY price DESC
LIMIT 5;

👥 Count Books Borrowed by Each Member
SELECT
    m.member_id,
    m.name,
    COUNT(t.transaction_id) AS book_borrowed
FROM members m
LEFT JOIN transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;

✍️ Display Books with Their Authors
SELECT
    b.book_id,
    b.title,
    a.name AS author_name
FROM books b
INNER JOIN authors a
ON b.author_id = a.author_id;

🏆 Rank Books by Borrowing Count
SELECT
    b.book_id,
    b.title,
    COUNT(t.transaction_id) AS borrow_count,
    RANK() OVER (
        ORDER BY COUNT(t.transaction_id) DESC
    ) AS book_rank
FROM books b
LEFT JOIN transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;

📊 Current Sample Data
📖 Books

The database currently contains books such as:

The Alchemist
Wings of Fire
Harry Potter
The Hobbit
Rich Dad Poor Dad
✍️ Authors

Sample authors include:

Paulo Coelho
A. P. J. Abdul Kalam
J. K. Rowling
J. R. R. Tolkien
James Clear
👥 Members

The database contains five sample library members.

🔄 Transactions

Five sample borrowing transactions are included, with different return dates and fine amounts.

⚠️ Important Notes
1. Table Creation Order

Because books has a foreign key referencing authors, the authors table should be created before the books table.

Recommended order:

1. CREATE DATABASE
2. USE DATABASE
3. CREATE authors
4. INSERT authors
5. CREATE books
6. INSERT books
7. CREATE members
8. INSERT members
9. CREATE transactions
10. INSERT transactions

2. Correct Availability Check

Instead of:

SELECT * FROM books
WHERE available_copies;


use:

SELECT *
FROM books
WHERE available_copies > 0;

3. Books Published After 2015

Use:

SELECT *
FROM books
WHERE published_data >= '2015-01-01';

4. Most Borrowed Book

The query:

SELECT MAX(price)
FROM books;


returns the most expensive book, not the most borrowed book.

A correct approach is:

SELECT
    b.book_id,
    b.title,
    COUNT(t.transaction_id) AS borrow_count
FROM books b
LEFT JOIN transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 1;

🚀 How to Run
Step 1 — Open MySQL

Open MySQL Workbench or the MySQL command line.

Step 2 — Create the Database
CREATE DATABASE l;
USE l;

Step 3 — Run the Table Creation Queries

Create the tables in the correct dependency order.

Step 4 — Insert Sample Data

Run the INSERT statements provided in the SQL file.

Step 5 — Execute the Queries

Run the query sections individually to explore the database.

🎯 Learning Objectives

By completing this project, you can practice:

Database Design → Data Insertion → Data Manipulation → Filtering → Aggregation → Joins → Subqueries → Date Functions → String Functions → CASE → Window Functions

This makes the project useful for SQL practice, database assignments, interviews, and beginner-level portfolio projects.

🔮 Possible Future Improvements

The database can be extended with:

📦 Book reservation system
🔔 Due-date notifications
👤 Admin and librarian accounts
📊 Monthly borrowing reports
💳 Fine payment tracking
📚 Multiple copies of the same ISBN
🔎 Book search functionality
📈 Library analytics dashboard
🏷️ Book publisher table
🗃️ Book genre/category table
💡 Project Highlights
📚  Library Management
✍️  Author Management
👥  Member Management
🔄  Borrow/Return Tracking
💰  Fine Management
🔗  Relational Database Design
📊  Data Analysis with SQL
🧠  Advanced SQL Queries

👨‍💻 Technologies Used
MySQL
SQL
Relational Database Concepts
⭐ Conclusion

This project provides a compact example of how SQL can be used to build and analyze a real-world Library Management System.

From simple SELECT statements to advanced joins, subqueries, CASE expressions, and window functions, the project demonstrates a strong foundation in SQL and relational database management.

Happy Querying! 🚀📚
