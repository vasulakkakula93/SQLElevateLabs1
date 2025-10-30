create database Restaurant;
use Restaurant;
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

create table Status(Order_ID int not null primary key,
foreign key (Order_ID) references Orders(Order_ID),
Delivery_status varchar(10) not null, Order_Status varchar(20) not null); 

insert into Status (Order_ID, Delivery_status, Order_Status) values
(1,'Pending','Processing'),
(2,'Shipped','Dispatched'),
(3,'Delivered','Completed'),
(4,'Pending','Awaiting Payment'),
(5,'Shipped','In Transit'),
(6,'Delayed','Processing'),
(7,'Delivered','Completed'),
(8,'Cancelled','Cancelled'),
(9,'Shipped','Out for Delivery'),
(10,'Pending','New Order');

create view vw_CustomerBasic as
select
  Customer_Id,
  Customer_Name,
  Customer_Email,
  Customer_Phone
from customers;

select * from vw_CustomerBasic;

create view vw_CustomerOrders as
select
  c.Customer_Id,
  c.Customer_Name,
  o.Order_ID,
  o.Order_Date,
  o.Product_Name,
  o.Quantity,
  o.Total_Amount
from customers c
join Orders o
  on c.Customer_Id = o.Customer_ID;
  
select * from vw_CustomerOrders;

create view vw_OrderStatus as
select
  o.Order_ID,
  o.Customer_ID,
  o.Order_Date,
  s.Delivery_status,
  s.Order_Status
from Orders o
join Status s
  on o.Order_ID = s.Order_ID;
  
select * from vw_OrderStatus;

create view vw_CustomerAllDetails as
select
  c.Customer_Id,
  c.Customer_Name,
  o.Order_ID,
  o.Order_Date,
  o.Product_Name,
  o.Quantity,
  o.Total_Amount,
  s.Delivery_status,
  s.Order_Status
from customers c
join Orders o
  on c.Customer_Id = o.Customer_ID
join Status s
  on o.Order_ID = s.Order_ID;
  
  select * from vw_CustomerAllDetails;
  
create view vw_Above500 as
select
  o.Order_ID,
  o.Customer_ID,
  o.Order_Date,
  o.Total_Amount
from Orders o
where o.Total_Amount > 500;

select * from vw_Above500;

create view vw_PendingOrDelayedOrders as
select
  o.Order_ID,
  o.Customer_ID,
  o.Order_Date,
  s.Delivery_status,
  s.Order_Status
from Orders o
join Status s
  on o.Order_ID = s.Order_ID
where s.Delivery_status in ('Pending','Delayed');

select * from vw_PendingOrDelayedOrders;

create view vw_RecentOrders as
select
  o.Order_ID,
  o.Order_Date,
  o.Customer_ID,
  c.Customer_Name,
  o.Product_Name,
  o.Total_Amount
from Orders o
join customers c on o.Customer_ID = c.Customer_Id
where o.Order_Date >=  DATE_SUB(NOW(), INTERVAL 10 DAY);

select * from vw_RecentOrders;

create view vw_CancelledOrders as
select
  o.Order_ID,
  o.Order_Date,
  c.Customer_Name,
  s.Delivery_status,
  s.Order_Status
from Orders o
join customers c on o.Customer_ID = c.Customer_Id
join Status s on o.Order_ID = s.Order_ID
where s.Order_Status = 'Cancelled';

select * from vw_CancelledOrders;



Interview Questions.....

1.What is a view?
A view in SQL is a virtual table based on the result of a query. That means:

It has rows and columns just like a regular table. 

However, it doesn’t store its own data (in its basic form) — the data comes from one or more underlying tables when the view is queried. 

You can query a view just like you query a table (e.g., SELECT * FROM view_name).


2.Can we update data through a view?
Yes — you can update data through a view in SQL, but only under certain conditions. It depends on how the view is defined and 
 what underlying tables it uses.
Example:-
  UPDATE vw_CustomersSimple
  SET Customer_Email = 'new_email@mail.com'
  WHERE Customer_Id = 3;

3.What is a materialized view?
 A materialized view is a database object that stores the results of a query physically, rather than only storing the query itself.
  -->A regular view is a virtual table defined by a SELECT query; when you query the view, the database runs the underlying query each time.
  -->A materialized view, on the other hand, is defined by a query but the result of that query is computed and stored on disk 
     (or in whatever persistent storage) and so subsequent queries reading from the materialized view can be much faster.
Example:- 
   CREATE MATERIALIZED VIEW mv_SalesSummary AS
   SELECT product_id,
          SUM(quantity)   AS total_quantity,
       SUM(amount)     AS total_sales
    FROM Sales
    GROUP BY product_id;

4.Difference between view and table?
 A table is a physical object in the database that stores data in rows and columns. 

A view is a virtual table defined by a SELECT query on one or more tables, and it does not itself store the data. 

You can insert, update, or delete data directly in a table, but views often cannot support all these operations because they rely on underlying base tables. 

A table requires storage space for its data, whereas a standard view occupies little to no space because it only stores the query definition. 

Changes in the underlying tables are reflected naturally in a view, but a table holds its own independent data which only changes when you explicitly modify it.

5.How to drop a view?
 DROP VIEW view_name;

6.Why use views?
  Simplify complex queries.......................
  Provide data security and access control.......
  Data abstraction and independence..............
  Reusability and maintainability................
  Present a customized or simplified interface...

7.Can we create indexed views?
In MySQL, you cannot create true indexed views (i.e., you cannot place an index directly on a view itself).
We can create in MS Sql Server...

8.How to secure data using views?
  Expose only necessary columns....
  Example:-  CREATE VIEW vw_CustomerPublic AS
            SELECT Customer_Id,
            Customer_Name,
            Customer_Phone
             FROM customers;
  Restrict rows (row-level filtering)
  Example:-
    CREATE VIEW vw_MyOrders AS
    SELECT * FROM Orders
    WHERE Customer_ID = CURRENT_USER_ID();  -- replace logic accordingly
  Grant permissions on views, revoke from base tables.....
  Use DEFINER and SQL SECURITY in the view definition....
  Example:-
    CREATE VIEW vw_Sensitive AS
    SQL SECURITY DEFINER
     SELECT … FROM …;

9.What are limitations of views?
  Performance overhead..............................
  Limited updatability..............................
  Dependency and maintenance issues.................
  Lack of storage or indexing.......................
  Over-complexity or misuse.........................
  Security doesn’t fix everything...................

10.How does WITH CHECK OPTION work?
   The WITH CHECK OPTION clause in SQL (including MySQL) ensures that any INSERT or UPDATE operations performed through a view 
  adhere to the view’s defining WHERE condition.
Example:-
  CREATE VIEW vw_ActiveUsers AS
  SELECT user_id, username
    FROM users
   WHERE status = 'active'
  WITH CHECK OPTION;


































