create database Hotel;
use Hotel;

create table customers( Customer_Id int not null primary key, 
  Customer_Name varchar(60) not null,
  Customer_Email varchar(80) not null,
  Customer_Phone varchar(15),
  Customer_Address varchar(100));
  
  insert into customers values
(1, 'Ravi Kumar', 'ravikumar@mail.com', '9876543210', 'Hyderabad'),
(2, 'Anjali Sharma', 'anjalisharma@mail.com', '8765432109', 'Delhi'),
(3, 'Priya Singh', 'priyasingh@mail.com', '7654321098', 'Bangalore'),
(4, 'Sunil Patel', 'sunilpatel@mail.com', '6543210987', 'Ahmedabad'),
(5, 'Divya Rao', 'divyarao@mail.com', '5432109876', 'Chennai'),
(6, 'Akash Mehta', 'akashmehta@mail.com', '4321098765', 'Pune'),
(7, 'Neha Jain', 'nehajain@mail.com', '3210987654', 'Kolkata'),
(8, 'Vijay Verma', 'vijayverma@mail.com', '2109876543', 'Mumbai'),
(9, 'Suman Gupta', 'sumangupta@mail.com', '1098765432', 'Jaipur'),
(10, 'Meera Das', 'meeradas@mail.com', '9988776655', 'Visakhapatnam');

  
  create table Orders ( Order_ID int not null primary key,
  Order_Date date not null,
  Customer_ID int not null,
  Product_Name varchar(50) not null,
  Quantity int not null,
  Total_Amount double not null,
  foreign key (Customer_ID) references customers(Customer_ID));
  
insert into Orders values
(1, '2025-10-01', 1, 'Idly', 2, 50.00),
(2, '2025-10-02', 2, 'Chapathi', 3, 90.00),
(3, '2025-10-03', 3, 'Water Bottle', 1, 120.00),
(4, '2025-10-04', 4, 'Egg Curry', 2, 200.00),
(5, '2025-10-05', 5, 'Dum Biryani', 1, 150.00),
(6, '2025-10-06', 6, 'Fry Family Pack',1, 850.00),
(7, '2025-10-07', 7, 'Boiled Egg', 4, 180.00),
(8, '2025-10-08', 8, 'Panner', 1, 75.00),
(9, '2025-10-09', 9, 'Dosa', 2, 60.00),
(10,'2025-10-10',10, 'Fry Biryani',1, 220.00);

----- Inner join -----
select
  Orders.Order_ID,
  Orders.Order_Date,
  customers.Customer_Name,
  Orders.Product_Name,
  Orders.Quantity,
  Orders.Total_Amount
from
  Orders
inner join
  customers
on
  Orders.Customer_ID = customers.Customer_ID;
  
  ---- Left join ----
  select
  customers.Customer_ID,
  customers.Customer_Name,
  Orders.Order_ID,
  Orders.Order_Date,
  Orders.Product_Name,
  Orders.Quantity,
  Orders.Total_Amount
from
  customers
left join
  Orders
on
  customers.Customer_ID = Orders.Customer_ID;
  
  ---- Right Join ----
  select
  customers.Customer_ID,
  customers.Customer_Name,
  Orders.Order_ID,
  Orders.Order_Date,
  Orders.Product_Name,
  Orders.Quantity,
  Orders.Total_Amount
from
  Customers
right join
  Orders
on
  customers.Customer_ID = Orders.Customer_ID;
  
  ---- Full Outer Join ----
  select
  customers.Customer_ID,
  customers.Customer_Name,
  Orders.Order_ID,
  Orders.Order_Date,
  Orders.Product_Name,
  Orders.Quantity,
  Orders.Total_Amount
from customers
left join Orders
on customers.Customer_ID = Orders.Customer_ID
union
select
  customers.Customer_ID,
  customers.Customer_Name,
  Orders.Order_ID,
  Orders.Order_Date,
  Orders.Product_Name,
  Orders.Quantity,
  Orders.Total_Amount
from customers
right join Orders
on customers.Customer_ID = Orders.Customer_ID;

Interview Questions......

1.Difference between INNER and LEFT JOIN?
 The main difference between INNER JOIN and LEFT JOIN relates to how unmatched rows are handled when combining two tables in SQL.
 INNER JOIN only returns rows where there is a match in both tables, while LEFT JOIN returns all rows from the left table, 
 along with matching rows from the right table; unmatched rows from the right table appear as NULLs in the result.

2.What is a FULL OUTER JOIN?
 A FULL OUTER JOIN in SQL returns all records from both tables, including those that have matching rows and those that do not have matches 
 in the counterpart table.
 Here we want to use both left join and right join with "union" keyword.

3.Can joins be nested?
 Yes, joins can be nested in SQL, allowing you to combine data from multiple tables in a sophisticated way.
Example:-
  SELECT *
  FROM Table1
  LEFT JOIN (
  Table2 INNER JOIN Table3 ON Table2.col = Table3.col)
  ON Table1.id = Table2.id;

4.How to join more than 2 tables?
 To join more than two tables in SQL, you simply add additional JOIN clauses to your query, 
 chaining them together based on the defined relationships or keys.
Example:-
  SELECT s.s_name, m.score, d.address_city
  FROM student s
  INNER JOIN marks m ON s.s_id = m.s_id
  INNER JOIN details d ON m.school_id = d.school_id;

5.What is a cross join?
 A cross join in SQL is a join operation that returns the Cartesian product of two tables, 
 meaning every row from the first table is paired with every row from the second table.
Example:- 
  SELECT *
  FROM table1
  CROSS JOIN table2;

6.What is a natural join?
  A natural join in SQL is a type of join that automatically combines rows from two tables based on all columns with matching names 
  and compatible data types, without requiring an explicit join condition.
Example:-
    SELECT s.Name, s.Contact, f.Amount, f.Paid
    FROM Student s
    NATURAL JOIN Fee f;

7.Can you join tables without foreign key?
 Yes, tables can be joined in SQL even if there are no foreign key constraints defined between them.
Example:-
  SELECT e.emp_id, e.name, e.department, d.manager
  FROM employee e
  JOIN department d
  ON e.department = d.dept_name;

8.What is a self-join?
 A self-join is a join in which a table is joined with itself, allowing you to compare or relate rows within the same table 
 by using aliases to treat the table as if it were two separate entities in the query.
Example:-
  SELECT e.employee_name AS employee, m.employee_name AS manager
  FROM Employees e
  JOIN Employees m ON e.manager_id = m.employee_id;

9.What causes Cartesian product?
 A Cartesian product in SQL is caused when tables are combined without a proper join condition, 
 resulting in every row from the first table being paired with every row from the second table.

10.How to optimize joins?
  Joins in SQL can be optimized using careful schema design, indexing, and query-writing techniques
  to ensure efficient data retrieval and avoid performance bottlenecks.










































































