create database Student;
use student

create TABLE students (
    S_Id varchar(15) NOT NULL PRIMARY KEY,
    S_Name varchar(50),
    S_Address varchar(50),
    S_Phone varchar(15),
    S_Age int
);

insert into students (S_Id, S_Name, S_Address, S_Phone, S_Age) values
('S1', 'Ram', 'Delhi', '9455123451', 18),
('S2', 'Ramesh', 'Gurgaon', '9652431543', 18),
('S3', 'Sujit', 'Rohtak', '9156253131', 20),
('S4', 'Suresh', 'Delhi', '9156768971', 18),
('S5', 'Anita', 'Noida', '9856234321', 19);

create table course (
    C_Id varchar(5) primary key,
    C_Name varchar(50)
);
insert into course (C_Id, C_Name) values
('C1', 'DSA'),
('C2', 'Programming'),
('C3', 'DBMS'),
('C4', 'Networks'),
('C5', 'Mathematics');
create table student_course (
    S_Id varchar(15),
    C_Id varchar(5),
    foreign key  (S_Id) references students(S_Id),
    FOREIGN KEY (C_Id) references course(C_Id)
);
insert into student_course (S_Id, C_Id) values
('S1', 'C1'),
('S1', 'C3'),
('S2', 'C1'),
('S3', 'C2'),
('S4', 'C2');

-- IN --

select S_Name from students where S_Id in (select S_Id from student_course
    where C_Id = (select C_Id from course where C_Name = 'DBMS'));
    
    -- NOT IN --

select S_Name from students where S_Id not in (select S_Id from student_course
    where C_Id = (select C_Id from course where C_Name = 'Programming'));
    
    -- EXISTS --

select s.S_Name from students s where exists (select 1 from student_course sc
    join course c on sc.C_Id = c.C_Id
    where sc.S_Id = s.S_Id and c.C_Name = 'DBMS');
    
    -- CASE --
    
select s.S_Name,
    case
        when count(sc.C_Id) = 1 then 'Single Course'
        when count(sc.C_Id) > 1 then 'Multi Course'
        else 'No Course' end as Course_Status from students s
left join student_course sc on s.S_Id = sc.S_Id group by s.S_Id, s.S_Name;

Interview Questions ........

1.What is a subquery?
  A subquery is a SQL query nested inside another SQL query. It is also known as an inner query or nested query.

2.Difference between subquery and join?
  Use joins when you want to combine related data from tables.
  Use subqueries for advanced filtering or when join logic would be complex or less readable.

3.What is a correlated subquery?
  A correlated subquery is a subquery that references columns from the outer (parent) query. 
  Unlike a regular (non-correlated) subquery, which runs independently, a correlated subquery is executed once 
  for each row processed by the outer query.
Example:-
   SELECT s.S_Name
    FROM students s
     WHERE (
      SELECT COUNT(*)
        FROM student_course sc
       WHERE sc.S_Id = s.S_Id) > 1;

4.Can subqueries return multiple rows?
  Yes, subqueries can return multiple rows in SQL, but how you use their results in the outer query 
   determines if this is allowed or will cause an error.

5.How does EXISTS work?
  The EXISTS operator in SQL is used to check if a subquery returns any rows. 
  It returns TRUE if the subquery produces at least one row, and FALSE if it returns none.

6.How is performance affected by subqueries?
Subqueries can affect SQL performance in several ways, depending on how they are written and used:
  Type of Subquery.....
  Query Complexity.....
  Subquery Location....
  Joins vs. Subqueries.
  Indexes and Optimization

7.What is scalar subquery?
  A scalar subquery is a subquery that returns exactly one value (one row, one column). 
  It’s commonly used when you need a single result to insert into a SELECT, WHERE, or SET clause. 
Example:-
     SELECT S_Name
      FROM students
      WHERE S_Age = (
       SELECT MIN(S_Age)
      FROM students);

8.Where can we use subqueries?
  Subqueries can be used in multiple parts of a SQL statement for a variety of purposes:
  1. WHERE Clause
  2. HAVING Clause
  3. FROM Clause
  4. SELECT Clause
  5. UPDATE and DELETE Statements

9.Can a subquery be in FROM clause?
  Yes, a subquery can be used in the FROM clause—this is known as a derived table or inline view. 
  The subquery acts like a temporary table that you can join or query further in your outer SQL statement.

10.What is a derived table?
  A derived table is a subquery placed in the FROM clause of a SQL statement. It acts as a temporary, 
  in-memory table that you can reference and join in the outer query.






























