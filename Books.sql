create database Books;
use Books;
create table Book(Book_NO int not null primary key,
 Book_Name varchar(50) not null, 
 Book_Type varchar(50) not null,
 Author varchar(60) not null,
 Book_Price double not null, 
 Publish_Date date not null,
 No_Of_Purchases int not null);
 
 insert into Book values
(1, 'Stories of Our Village', 'Story', 'Raju', 290.00, '2025-01-05', 150),
(2, 'Balahuthi', 'Lecture', 'Sushila', 180.00, '2023-11-25', 80),
(3, 'Telugu Dictionary', 'Development', 'Yadav', 500.00, '2024-07-12', 205),
(4, 'Mother\'s Recipes', 'Cookbook', 'Anitha', 325.00, '2024-10-02', 120),
(5, 'Sanchi Descriptions', 'Lexicon', 'Devanand', 250.00, '2022-12-18', 70),
(6, 'Telugu Lessons', 'Lessons', 'Raman', 399.00, '2023-08-15', 98),
(7, 'Bhagavad Gita in Telugu', 'Spiritual', 'Padmanabham', 150.00, '2019-04-04', 600),
(8, 'Telugu Cinema', 'Cinema', 'Rekha', 550.00, '2021-06-30', 210),
(9, 'Vyasa Writings', 'Poetry', 'Umamaheswara', 350.00, '2018-11-21', 75),
(10, 'Telugu Novels', 'Novel', 'Murali', 420.00, '2025-05-11', 155);

    -- specific columns--
select Book_Name, Book_Type from Book;

-- By using where condition--
select * from Book where Book_Price>300;

-- By using where with and--
Select * from Book
where Book_Type = 'Novel' and Book_Price < 500;

-- By using where with or -- 
Select * from Book
where Book_Type = 'Novel' or Book_Type = 'Poetry';
-- like:- 
  -- 1) it display all which start with teluguin Book_Name -- 
Select * from Book where Book_Name like 'Telugu%';

-- 2) it display all which end with tales Book_Name -- 
select * from Book where Book_Name like '%a';

-- 3) it display all which contains letter b in author

select * from Book where Author like '%b%'; 

-- here displays all the book price in between 200-500 or author name starts with R
Select Book_Name, Book_Price, Author, Book_Type
from Book
where Book_Type = 'Novel'
  and Book_Price between 200 and 500
  or Author like 'R%';
  
  -- order by with limit --
  select * from Book
  order by No_Of_Purchases desc limit 5;
-- It returns all records --
select * from Book;

Interview questions........

1.What does SELECT * do?
  This command returns all columns like (Book_NO, Book_Name, Book_Type, Author, Book_Price, Publish_Date, No_Of_Purchases) 
  and every row in the Book table.

2.How do you filter rows?
   filter rows in SQL using the WHERE clause.
   Add WHERE followed by a condition to your SELECT statement.

3.What is LIKE '%value%'?
   It returns any column contains the "value" then it diplays the that record.

4.What is BETWEEN used for?
  it is condition based, It returns only in between records for example i want salary in between 20k to 30k only that records only returns.

5.How do you limit output rows?
  Add LIMIT at the end of your query, followed by the maximum number of rows you want.
Example:-
  SELECT * FROM Book LIMIT 3; --> it Returns only three records or three rows from table.

6.Difference between = and IN
  Example1:-
     SELECT * FROM Book
    WHERE Author = 'Raju';
Example2:-
   SELECT * FROM Book
   WHERE Author IN ('Raju', 'Sushila', 'Murali');


  Operator	Checks against  	Usage Example	                    Best for
    =	          One value	       Author = 'Raju'	                Exact single match
   IN	       List of values	   Author IN ('Raju','Murali')    	Multiple possible matches

7.How to sort in descending order?
  By using keyword "desc".
  Example:-
    SELECT * FROM Book
    ORDER BY Publish_Date DESC;

8.What is aliasing?
  Aliasing in SQL is the process of giving a temporary name (alias) to a table or column in your query results.
  Makes column names easier to read or understand.
Example:- 
      SELECT Book_Name AS Title, Book_Price AS Price
        FROM Book;

 9.Explain DISTINCT.
   DISTINCT in SQL is used to remove duplicate values from the results of a SELECT query.
   Returns only unique values for the specified column(s).
 Example:-
    SELECT DISTINCT Book_Type
    FROM Book;

 10.What is the default sort order?
  The default sort order in SQL is ascending order (ASC).
Example:-
   SELECT * FROM Book
    ORDER BY Book_Price;

 



























