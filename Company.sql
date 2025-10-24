create database Company;

use Company;

create table Employee( Employee_ID int primary key,
 Employee_Name varchar(50) not null, 
 Job_Title varchar(60) not null, 
 Date_of_Birth date not null,
 Gender varchar(20) not null, 
 Hire_Date date not null , 
 Salary double not null);
 
 insert into Employee (Employee_ID, Employee_Name, Job_Title, Date_of_Birth, Gender, Hire_Date, Salary) values
(1,'Michel Johnson','Software Engineer','1990-04-15','Male', '2018-06-01', 75000.00),
(2,'Steve Smith','Senior Software Engineer', '1985-11-30', 'Male',   '2015-03-15', 95000.00),
(3,'Carolos BrathWhite','Quality Assurance Lead','1988-07-22','Male','2019-09-10',68000.00),
(4,'David Warner','DevOps Engineer','1992-02-05','Male','2020-01-20',72000.00),
(5,'Smriti Mandhana','Product Manager','1983-05-18','Female', '2014-11-05', 105000.00),
(6,'MS Dhoni','UX/UI Designer','1991-10-12','Male','2017-04-18',65000.00),
(7,'Kaur','Business Analyst','1989-08-30','Female','2016-12-01',80000.00),
(8,'King Kohli','Database Administrator','1987-01-09','Male','2013-08-22',89000.00),
(9,'Mithali','HR Specialist','1993-03-27','Female','2021-05-14',60000.00),
(10,'Vasu','Support Engineer','1994-12-02','Male','2022-10-01',55000.00);

select count(*) AS totalrows from employee; -- for getting how many rows we have in table --
select sum(Salary) as TotalSalary from employee; -- For gettiing total salary

select avg(Salary) as AverageSalary from employee; -- for getting average of the salary --
select Employee_Name, min(Salary) as MinimumSalary from employee group by Employee_Name having min(Salary); -- for getting lowest salary --
select max(Salary) as MaxSalary from employee; -- for getting highest salary

select Employee_Name, Job_Title,sum(Salary) as SumOfSalary from employee group by Employee_Name,Job_Title;
select count(distinct Job_Title ) as Unique_Jobs from employee;  -- it gives count of unique job titles
select Employee_Name, sum(Salary) AS TotalSalary from employee group by  Employee_Name
having sum(Salary) > 100300; -- it gives sum of salary which is greater than 100300 --

select * from employee;

Interview Questions......
1.What is GROUP BY?
  The GROUP BY clause in SQL is used to group rows that have the same values in specified columns into summary rows, 
   often for use with aggregate functions like COUNT(), SUM(), AVG(), MAX(), or MIN().
  Summarizes data by grouping rows with the same values in one or more columns.
  Commonly used to aggregate data, such as calculating totals, averages, or counts per group

2.Difference between WHERE and HAVING?
  WHERE filters rows before grouping, while HAVING filters groups after aggregation.

3.How does COUNT(*) differ from COUNT(column)?
  COUNT(*) counts all rows, including those with NULL values, while COUNT(column) only counts rows where the specified column is not null.

4.Can you group by multiple columns?
  Yes, you can absolutely use GROUP BY with multiple columns in SQL.
Example:-
   select Employee_Name, Job_Title,sum(Salary) as SumOfSalary from employee group by Employee_Name,Job_Title;

5.What is ROUND() used for?
  Rounds a number to the nearest value based on the number of decimal places you specify.
    example:- SELECT ROUND(235.415, 2);  --> Result: 235.42

6.How do you find the highest salary by department?

  select DeptID, max(Salary) AS HighestSalary
    from Employees
     group by DeptID;
7.What is the default behavior of GROUP BY?
  The default behavior of GROUP BY is to group rows based on unique combinations of the specified columns,
   and return one result per group, typically with aggregate functions applied.

8.Explain AVG and SUM.
   AVG() calculates the average of a numeric column, while SUM() adds up all the values in that column.

9.How to count distinct values?
  To count distinct values in SQL, use COUNT(DISTINCT column_name). This returns the number of unique non-null entries in that column.
example:-
     SELECT COUNT(DISTINCT Course) AS UniqueCourses
FROM Students;

10.What is an aggregate function?
 An aggregate function in SQL performs a calculation on a set of values and returns a single summary value.
 These functions are essential for analyzing and summarizing data, especially when used with GROUP BY.















































