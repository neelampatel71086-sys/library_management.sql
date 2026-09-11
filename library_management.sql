
---creating database---
create database l;

---using the database---
use l;

---create table books---
create table books(book_id int primary key,title varchar(20),author_id int,category varchar(20),isbn varchar(20),published_data date,price int,available_copies int,foreign key(author_id)references authors(author_id));

---insert the data---
insert into books(book_id,title,author_id,category,isbn,published_data,price,available_copies)
values(1, 'The Alchemist', 1, 'Fiction', '9780061122415', '1988-05-01', 350, 12),
(2, 'Wings of Fire', 2, 'Biography', '9788173711466', '1999-01-01', 299, 8),
(3, 'Harry Potter', 3, 'Fantasy', '9780747532743', '1997-06-26', 450, 15),
(4, 'The Hobbit', 4, 'Fantasy', '9780547928227', '1937-09-21', 399, 10),
(5, 'Rich Dad Poor Dad', 5, 'Finance', '9781612680194', '1997-04-01', 499, 7);


---create table authors---
create table authors(author_id int primary key,name varchar(30),email varchar(50));

---insert the data---
insert into authors(author_id,name,email)
values(1, 'Paulo Coelho', 'paulo@example.com'),
(2, 'A. P. J. Abdul Kalam', 'kalam@example.com'),
(3, 'J. K. Rowling', 'rowling@example.com'),
(4, 'J. R. R. Tolkien', 'tolkien@example.com'),
(5, 'James Clear', 'clear@example.com');

---create table members---
create table members(member_id int primary key,name varchar(30),email varchar(50),phone_number varchar(10),membership_date date);

---insert the data---
insert into members(member_id,name,email,phone_number,membership_date)
VALUES(1, 'Rahul Sharma', 'rahul@example.com', '9876543210', '2024-01-15'),
(2, 'Priya Patil', 'priya@example.com', '9876543211', '2024-02-20'),
(3, 'Amit Kumar', 'amit@example.com', '9876543212', '2024-03-10'),
(4, 'Sona Sharma', 'sona@example.com', '6754389765', '2024-01-17'),
(5, 'Rohit Singh', 'rohit@example.com', '9876543214', '2024-05-18');


---create table transactions---
create table transactions(transaction_id int primary key,member_id int,book_id int,borrow_date date,return_date date,fine_amount int,foreign key(member_id)references members(member_id),foreign key(book_id)references books(book_id));

---insert the data---
INSERT INTO transactions
(transaction_id, member_id, book_id, borrow_date, return_date, fine_amount)
VALUES
(1, 1, 1, '2024-06-01', '2024-06-10', 0),
(2, 2, 2, '2024-06-05', '2024-06-18', 20),
(3, 3, 3, '2024-06-10', '2024-06-20', 0),
(4, 4, 4, '2024-06-15', '2024-06-30', 30),
(5, 5, 5, '2024-06-20', '2024-07-01', 10);



---QUERIES---

---1---
---a insert new books authors and members into database---
 insert into books values(111,'SQL Basics',1,'technology','isbn011','2024-01-10',400,5);
Query OK, 1 row affected 

 select * from books;
+---------+-------------------+-----------+------------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category   | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+------------+---------------+----------------+-------+------------------+
|       1 | The Alchemist     |         1 | Fiction    | 9780061122415 | 1988-05-01     |   350 |               12 |
|       2 | Wings of Fire     |         2 | Biography  | 9788173711466 | 1999-01-01     |   299 |                8 |
|       3 | Harry Potter      |         3 | Fantasy    | 9780747532743 | 1997-06-26     |   450 |               15 |
|       4 | The Hobbit        |         4 | Fantasy    | 9780547928227 | 1937-09-21     |   399 |               10 |
|       5 | Rich Dad Poor Dad |         5 | Finance    | 9781612680194 | 1997-04-01     |   499 |                7 |
|     111 | SQL Basics        |         1 | technology | isbn011       | 2024-01-10     |   400 |                5 |
+---------+-------------------+-----------+------------+---------------+----------------+-------+------------------+

update books set price=450 where book_id=111;
Query OK, 1 row affected (0.205 sec)
Rows matched: 1  Changed: 1  Warnings: 0

delete from books where book_id=111;
Query OK, 1 row affected 

 select * from books;
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category  | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
|       1 | The Alchemist     |         1 | Fiction   | 9780061122415 | 1988-05-01     |   350 |               12 |
|       2 | Wings of Fire     |         2 | Biography | 9788173711466 | 1999-01-01     |   299 |                8 |
|       3 | Harry Potter      |         3 | Fantasy   | 9780747532743 | 1997-06-26     |   450 |               15 |
|       4 | The Hobbit        |         4 | Fantasy   | 9780547928227 | 1937-09-21     |   399 |               10 |
|       5 | Rich Dad Poor Dad |         5 | Finance   | 9781612680194 | 1997-04-01     |   499 |                7 |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+

---b update book availablity after book borrowed or returned---
update books set available_copies = available_copies -1 where book_id=1;
Query OK, 1 row affected (0.127 sec)
Rows matched: 1  Changed: 1  Warnings: 0


update books set available_copies = available_copies +1 where book_id=1;
Query OK, 1 row affected (0.101 sec)
Rows matched: 1  Changed: 1  Warnings: 0

---c fetch all books with available copies---

select * from books where available_copies;
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category  | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
|       1 | The Alchemist     |         1 | Fiction   | 9780061122415 | 1988-05-01     |   350 |               12 |
|       2 | Wings of Fire     |         2 | Biography | 9788173711466 | 1999-01-01     |   299 |                8 |
|       3 | Harry Potter      |         3 | Fantasy   | 9780747532743 | 1997-06-26     |   450 |               15 |
|       4 | The Hobbit        |         4 | Fantasy   | 9780547928227 | 1937-09-21     |   399 |               10 |
|       5 | Rich Dad Poor Dad |         5 | Finance   | 9781612680194 | 1997-04-01     |   499 |                7 |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+




---2---
---a books published after the year 2015---
select * from books where published_data>'2016-01-01';
Empty set

---b fetch top most 5 expensive books---
select * from books order by price desc limit 5;
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category  | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
|       5 | Rich Dad Poor Dad |         5 | Finance   | 9781612680194 | 1997-04-01     |   499 |                7 |
|       3 | Harry Potter      |         3 | Fantasy   | 9780747532743 | 1997-06-26     |   450 |               15 |
|       4 | The Hobbit        |         4 | Fantasy   | 9780547928227 | 1937-09-21     |   399 |               10 |
|       1 | The Alchemist     |         1 | Fiction   | 9780061122415 | 1988-05-01     |   350 |               12 |
|       2 | Wings of Fire     |         2 | Biography | 9788173711466 | 1999-01-01     |   299 |                8 |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
5 rows in set

---c memeber who joined before 2022---
select * from members where membership_date < '2022-02-02';
Empty set 
 



 
 ---3---
 ---a get books category=science and price<500---
 select * from books where category='science' and price<500;
Empty set 

---b all books that are not available for borrowing---
select * from books where not available_copies>0;
Empty set 

---c all members who joined after 2020 or have borrowed more than 3 books---
select m.member_id,m.name from members m left join transactions t on m.member_id=t.member_id group by m.member_id,m.name,m.membership_date having m.membership_date>'2020-12-31' or count(t.transaction_id)>3;
+-----------+--------------+
| member_id | name         |
+-----------+--------------+
|         1 | Rahul Sharma |
|         2 | Priya Patil  |
|         3 | Amit Kumar   |
|         4 | Sona Sharma  |
|         5 | Rohit Singh  |
+-----------+--------------+




---4---
---a sort in alphabetical order---
select * from books order by title asc;
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category  | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
|       3 | Harry Potter      |         3 | Fantasy   | 9780747532743 | 1997-06-26     |   450 |               15 |
|       5 | Rich Dad Poor Dad |         5 | Finance   | 9781612680194 | 1997-04-01     |   499 |                7 |
|       1 | The Alchemist     |         1 | Fiction   | 9780061122415 | 1988-05-01     |   350 |               12 |
|       4 | The Hobbit        |         4 | Fantasy   | 9780547928227 | 1937-09-21     |   399 |               10 |
|       2 | Wings of Fire     |         2 | Biography | 9788173711466 | 1999-01-01     |   299 |                8 |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+

---b number of books borrowed by each member---
 select m.member_id,m.name, count(t.transaction_id) as book_borrowed from members m left join transactions t on m.member_id=t.member_id group by m.member_id,m.name;
+-----------+--------------+---------------+
| member_id | name         | book_borrowed |
+-----------+--------------+---------------+
|         1 | Rahul Sharma |             1 |
|         2 | Priya Patil  |             1 |
|         3 | Amit Kumar   |             1 |
|         4 | Sona Sharma  |             1 |
|         5 | Rohit Singh  |             1 |
+-----------+--------------+---------------+

---c group books by category and show the total count---
 select category ,count(*) as total_books from books group by category;
+-----------+-------------+
| category  | total_books |
+-----------+-------------+
| Fiction   |           1 |
| Biography |           1 |
| Fantasy   |           2 |
| Finance   |           1 |
+-----------+-------------+




---5---
---a total number of books in each category---
 select category ,count(*) as total_books from books group by category;
+-----------+-------------+
| category  | total_books |
+-----------+-------------+
| Fiction   |           1 |
| Biography |           1 |
| Fantasy   |           2 |
| Finance   |           1 |
+-----------+-------------+

---b average price of the books---
 select avg(price) as total_price from books;
+-------------+
| total_price |
+-------------+
|    399.4000 |
+-------------+

---c most borrowed---
 select max(price) from books;
+------------+
| max(price) |
+------------+
|        499 |
+------------+

---d minimum price---
select min(price) from books;
+------------+
| min(price) |
+------------+
|        299 |
+------------+

---e total fines to count---
select fine_amount,count(*) from transactions group by fine_amount;
+-------------+----------+
| fine_amount | count(*) |
+-------------+----------+
|           0 |        2 |
|          20 |        1 |
|          30 |        1 |
|          10 |        1 |
+-------------+----------+




---6
---books->authors
---books.author_id references
---authors.author_id

---transactions->members
---transactions.member_id references
---members.member_id

---transactions->books
---transactions.book_id refernces
---books.book_id




---7---
---a inner join---
select b.book_id,b.title,a.name as author_name from books b inner join authors a on b.author_id = a.author_id;
+---------+-------------------+----------------------+
| book_id | title             | author_name          |
+---------+-------------------+----------------------+
|       1 | The Alchemist     | Paulo Coelho         |
|       2 | Wings of Fire     | A. P. J. Abdul Kalam |
|       3 | Harry Potter      | J. K. Rowling        |
|       4 | The Hobbit        | J. R. R. Tolkien     |
|       5 | Rich Dad Poor Dad | James Clear          |
+---------+-------------------+----------------------+

---b left join---
select m.member_id,m.name,t.transaction_id,t.book_id,t.borrow_date from members m left join transactions t on m.member_id=t.member_id;
+-----------+--------------+----------------+---------+-------------+
| member_id | name         | transaction_id | book_id | borrow_date |
+-----------+--------------+----------------+---------+-------------+
|         1 | Rahul Sharma |              1 |       1 | 2024-06-01  |
|         2 | Priya Patil  |              2 |       2 | 2024-06-05  |
|         3 | Amit Kumar   |              3 |       3 | 2024-06-10  |
|         4 | Sona Sharma  |              4 |       4 | 2024-06-15  |
|         5 | Rohit Singh  |              5 |       5 | 2024-06-20  |
+-----------+--------------+----------------+---------+-------------+




----8---
---a members registered after 2022---
mysql> SELECT *
    -> FROM Books
    -> WHERE book_id IN
    -> (
    ->     SELECT book_id
    ->     FROM Transactions
    ->     WHERE member_id IN
    ->     (
    ->         SELECT member_id
    ->         FROM Members
    ->         WHERE membership_date > '2022-12-31'
    ->     )
    -> );
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
| book_id | title             | author_id | category  | isbn          | published_data | price | available_copies |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+
|       1 | The Alchemist     |         1 | Fiction   | 9780061122415 | 1988-05-01     |   350 |               12 |
|       2 | Wings of Fire     |         2 | Biography | 9788173711466 | 1999-01-01     |   299 |                8 |
|       3 | Harry Potter      |         3 | Fantasy   | 9780747532743 | 1997-06-26     |   450 |               15 |
|       4 | The Hobbit        |         4 | Fantasy   | 9780547928227 | 1937-09-21     |   399 |               10 |
|       5 | Rich Dad Poor Dad |         5 | Finance   | 9781612680194 | 1997-04-01     |   499 |                7 |
+---------+-------------------+-----------+-----------+---------------+----------------+-------+------------------+

---b members who never borrowed a book---
SELECT *
    -> FROM Members
    -> WHERE member_id NOT IN
    -> (
    ->     SELECT DISTINCT member_id
    ->     FROM Transactions
    -> );
Empty set 




---9---
---a extract year from published date to count publication year---

 SELECT title,published_data, YEAR(published_data) AS publication_year FROM Books;
+-------------------+----------------+------------------+
| title             | published_data | publication_year |
+-------------------+----------------+------------------+
| The Alchemist     | 1988-05-01     |             1988 |
| Wings of Fire     | 1999-01-01     |             1999 |
| Harry Potter      | 1997-06-26     |             1997 |
| The Hobbit        | 1937-09-21     |             1937 |
| Rich Dad Poor Dad | 1997-04-01     |             1997 |
+-------------------+----------------+---------------

---b difference in days between borrowdate and return date---
 SELECT
    ->     transaction_id,
    ->     borrow_date,
    ->     return_date,
    ->     DATEDIFF(return_date, borrow_date) AS days_borrowed
    -> FROM Transactions
    -> WHERE return_date IS NOT NULL;
+----------------+-------------+-------------+---------------+
| transaction_id | borrow_date | return_date | days_borrowed |
+----------------+-------------+-------------+---------------+
|              1 | 2024-06-01  | 2024-06-10  |             9 |
|              2 | 2024-06-05  | 2024-06-18  |            13 |
|              3 | 2024-06-10  | 2024-06-20  |            10 |
|              4 | 2024-06-15  | 2024-06-30  |            15 |
|              5 | 2024-06-20  | 2024-07-01  |            11 |
+----------------+-------------+-------------+---------------+

---c borrowdate to DD-MM-YYYY---
select date_format(borrow_date,'%d-%m-%Y') from transactions;
+-------------------------------------+
| date_format(borrow_date,'%d-%m-%Y') |
+-------------------------------------+
| 01-06-2024                          |
| 05-06-2024                          |
| 10-06-2024                          |
| 15-06-2024                          |
| 20-06-2024                          |
+-------------------------------------+




---10
---a convert title into upper case---
select upper(title) from books;
+-------------------+
| upper(title)      |
+-------------------+
| THE ALCHEMIST     |
| WINGS OF FIRE     |
| HARRY POTTER      |
| THE HOBBIT        |
| RICH DAD POOR DAD |
+-------------------+

---b trim whitespace---
select trim(name) from authors;
+----------------------+
| trim(name)           |
+----------------------+
| Paulo Coelho         |
| A. P. J. Abdul Kalam |
| J. K. Rowling        |
| J. R. R. Tolkien     |
| James Clear          |
+----------------------+

---c replace missing email values with not provided---
 SELECT
    ->     author_id,
    ->     name,
    ->     COALESCE(email, 'Not Provided') AS email
    -> FROM Authors;
+-----------+----------------------+---------------------+
| author_id | name                 | email               |
+-----------+----------------------+---------------------+
|         1 | Paulo Coelho         | paulo@example.com   |
|         2 | A. P. J. Abdul Kalam | kalam@example.com   |
|         3 | J. K. Rowling        | rowling@example.com |
|         4 | J. R. R. Tolkien     | tolkien@example.com |
|         5 | James Clear          | clear@example.com   |
+-----------+----------------------+---------------------+




---11---
---a rank based on number of ti,es they have been borrowed---
SELECT
    ->     b.book_id,
    ->     b.title,
    ->     COUNT(t.transaction_id) AS borrow_count,
    ->     RANK() OVER (
    ->         ORDER BY COUNT(t.transaction_id) DESC
    ->     ) AS book_rank
    -> FROM Books b
    -> LEFT JOIN Transactions t
    -> ON b.book_id = t.book_id
    -> GROUP BY b.book_id, b.title;
+---------+-------------------+--------------+-----------+
| book_id | title             | borrow_count | book_rank |
+---------+-------------------+--------------+-----------+
|       1 | The Alchemist     |            1 |         1 |
|       2 | Wings of Fire     |            1 |         1 |
|       3 | Harry Potter      |            1 |         1 |
|       4 | The Hobbit        |            1 |         1 |
|       5 | Rich Dad Poor Dad |            1 |         1 |
+---------+-------------------+--------------+-----------+

---b cumulative number of books---
SELECT
    ->     member_id,
    ->     transaction_id,
    ->     borrow_date,
    ->     COUNT(*) OVER (
    ->         PARTITION BY member_id
    ->         ORDER BY borrow_date
    ->         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ->     ) AS cumulative_books_borrowed
    -> FROM Transactions;
+-----------+----------------+-------------+---------------------------+
| member_id | transaction_id | borrow_date | cumulative_books_borrowed |
+-----------+----------------+-------------+---------------------------+
|         1 |              1 | 2024-06-01  |                         1 |
|         2 |              2 | 2024-06-05  |                         1 |
|         3 |              3 | 2024-06-10  |                         1 |
|         4 |              4 | 2024-06-15  |                         1 |
|         5 |              5 | 2024-06-20  |                         1 |
+-----------+----------------+-------------+---------------------------+

---c moving average of books borrowed---
SELECT
    ->     member_id,
    ->     borrow_date,
    ->     COUNT(*) OVER (
    ->         PARTITION BY member_id
    ->         ORDER BY borrow_date
    ->         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ->     ) AS books_in_last_3_transactions
    -> FROM Transactions;
+-----------+-------------+------------------------------+
| member_id | borrow_date | books_in_last_3_transactions |
+-----------+-------------+------------------------------+
|         1 | 2024-06-01  |                            1 |
|         2 | 2024-06-05  |                            1 |
|         3 | 2024-06-10  |                            1 |
|         4 | 2024-06-15  |                            1 |
|         5 | 2024-06-20  |                            1 |
+-----------+-------------+------------------------------+




---12 apply sql case expression---
---a membership status---
SELECT
    ->     m.member_id,
    ->     m.name,
    ->     CASE
    ->         WHEN EXISTS
    ->         (
    ->             SELECT 1
    ->             FROM Transactions t
    ->             WHERE t.member_id = m.member_id
    ->             AND t.borrow_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    ->         )
    ->         THEN 'Active'
    ->         ELSE 'Inactive'
    ->     END AS Membership_Status
    -> FROM Members m;
+-----------+--------------+-------------------+
| member_id | name         | Membership_Status |
+-----------+--------------+-------------------+
|         1 | Rahul Sharma | Inactive          |
|         2 | Priya Patil  | Inactive          |
|         3 | Amit Kumar   | Inactive          |
|         4 | Sona Sharma  | Inactive          |
|         5 | Rohit Singh  | Inactive          |
+-----------+--------------+-------------------+

---b categorize books---
SELECT
    ->     book_id,
    ->     title,
    ->     published_data,
    ->     CASE
    ->         WHEN published_data > '2020-12-31'
    ->             THEN 'New Arrival'
    ->
    ->         WHEN published_data < '2000-01-01'
    ->             THEN 'Classic'
    ->
    ->         ELSE 'Regular'
    ->     END AS book_category
    -> FROM Books;
+---------+-------------------+----------------+---------------+
| book_id | title             | published_data | book_category |
+---------+-------------------+----------------+---------------+
|       1 | The Alchemist     | 1988-05-01     | Classic       |
|       2 | Wings of Fire     | 1999-01-01     | Classic       |
|       3 | Harry Potter      | 1997-06-26     | Classic       |
|       4 | The Hobbit        | 1937-09-21     | Classic       |
|       5 | Rich Dad Poor Dad | 1997-04-01     | Classic       |
+---------+-------------------+----------------+---------------+
