create database institute;

use institute
							-- Table creation--
 create table InstituteForm(SNO int primary key,
							 Candidate_Name varchar(100) not null,
							 Surname varchar(50), 
							 Email varchar(50) unique not null, 
							 PhoneNumber int  not null,
                             Course_Name varchar(100) not null,
                             Course_Type varchar(100) not null,
                             DateOfJoining date not null,
                             Course_Price double not null);
                             
                             alter table InstituteForm modify PhoneNumber varchar(10) not null;
                             
                            -- Insert Operations-- 
insert INTO InstituteForm Values
(1, 'Rohit', 'Sharma', 'rohitsharma99@gmail.com.com', 9876543210, 'Data Science', 'Full-Time', '2025-01-15', 75000.00),
(2, 'Tilak', 'Varma', 'tilakvarma98@gmail.com', 9876543211, 'Web Development', 'Part-Time', '2025-02-01', 45000.00),
(3, 'Rjun', 'Mehta', 'ajjumehta97@gmail.com', 9876543212, 'AI & ML', 'Full-Time', '2025-03-10', 80000.00),
(4, 'Axar', 'Patel', 'axarpatel96@gmail.com', 9876543213, 'Cybersecurity', 'Weekend', '2025-04-05', 60000.00),
(5, 'Yuvaraj', 'Singh', 'uvsingh@gmail.com', 9876543214, 'Cloud Computing', 'Full-Time', '2025-05-20', 70000.00),
(6, 'Nithish', 'Reddy', 'nithisreddy95@gmail.com', 9876543215, 'UI/UX Design', 'Part-Time', '2025-06-15', 40000.00),
(7, 'Aditya', 'Joshi', 'adityajoshi95@gmail.com', 9876543216, 'Python Programming', 'Weekend', '2025-07-01', 35000.00),
(8, 'Ranveer', 'Kapoor', 'ranveerkapoor@gmail.com', 9876543217, 'Digital Marketing', 'Full-Time', '2025-08-10', 50000.00),
(9, 'Vikram', 'Naik', 'vikramnaik422@gmail.com', 9876543218, 'Blockchain', 'Part-Time', '2025-09-05', 65000.00),
(10, 'Ravi', 'Gupta', 'ravigupta1122@gmail.com', 9876543219, 'DevOps', 'Full-Time', '2025-10-01', 72000.00);

                            -- Delete Operations
delete from InstituteForm where sno=10;
delete from InstituteForm where Course_Price > 70000 limit 5; -- Whenever we want to delete multiple rows use the keyword limit--

                            -- Update Operations--
update InstituteForm set Course_Price= Course_Price-10000 where sno=2; 
update InstituteForm set Course_Type = 'Full-Time', Course_Price=70000 where sno=6;
update instituteForm set Course_Name ='DotNet' where sno=9;

                           -- select query--
                             select * FROM InstituteForm 



Interview Questions......

1) Difference between NULL and 0?
A) Null is not a value, it indicates the fields as null, feild we can give it as empty. 0 is the value we have to give to the field.

2) What is a default constraint?
A) A default constraint in SQL is used to automatically assign a value to a column when no value is explicitly provided during an INSERT operation.

  ex:-CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50) DEFAULT 'India',
    EnrollmentDate DATE DEFAULT CURRENT_DATE
       );
 
  INSERT INTO Students (StudentID, Name)
  VALUES (1, 'Vasu');

   Here no need to give any external values to the Country and EnrollmentDate why because it takes as default.

3) How does IS NULL work?
   Null is a keyword null is defined in table fields can take empty also. simply says null can take empty values.
   No need to give null keyword for perticular field it is by default,
    with out not null or primary key or unique key or foriegn key it is null field.

4) How do you update multiple rows?
   Condition or fields seperated by the ','
   ex:- UPDATE InstituteForm
         SET Course_Type = 'Online'
         WHERE Course_Name IN ('Data Science', 'AI & ML', 'DevOps');

5) Can we insert partial values?
   Yes we can. by using the Default Constraint or 'allow null' values.
   ex:-
      CREATE TABLE Students (
      StudentID INT PRIMARY KEY,
      Name VARCHAR(100) NOT NULL,
      Country VARCHAR(50) DEFAULT 'India',
      Age INT
       );

     INSERT INTO Students (StudentID, Name)
     VALUES (1, 'Vasu');

     here age doesn't have primary key or not null or ....... so it is default constraint.
     so if you want to give the value you can give, if you dont want you wont give.. 


6) What happens if a NOT NULL field is left empty?
   If a column defined with the NOT NULL constraint is left empty during an INSERT or UPDATE operation, 
   MySQL will throw an error and reject the query.

7) How do you rolback a deletion?
   Rolling back a deletion in SQL depends on whether you're using transactions and whether the deletion has been committed yet.
   You can roll back a deletion before it's committed.
   Once a COMMIT is issued or auto-commit is enabled:-
     * You cannot roll back the deletion.
     * The data is permanently removed unless you have a backup or audit log.

    To Prevent this :-
        * Use START TRANSACTION before risky operations.
        * Preview with SELECT before running DELETE.

    ex:- This is the best way to go for transactions...
         START TRANSACTION;

         DELETE FROM InstituteForm WHERE SNO = 5;

            -- If you want to change your mind if you want to get back the data
            ROLLBACK;

8) Can we insert values into specific columns only?
   YES, By using Default Constraints or allow null. 

9) How to insert values using SELECT?
   You can insert values using a SELECT statement in SQL by combining it with INSERT INTO.
   This is especially useful when you want to copy data from one table to another or transform data during insertion.
   ex:-
     CREATE TABLE EnrolledStudents (
       StudentID INT,
       Name VARCHAR(100),
       Course VARCHAR(100)
      );

    CREATE TABLE Alumni (
      StudentID INT,
      Name VARCHAR(100),
      Course VARCHAR(100)
     );

    INSERT INTO Alumni (StudentID, Name, Course)
     SELECT StudentID, Name, Course
     FROM EnrolledStudents
     WHERE Course = 'Completed';

10) What is ON DELETE CASCADE?
    To maintain referential integrity between tables.
    It is an optional clause that can be added to a foreign key constraint.
    When this clause is applied, if a row in the parent table (the table referenced by the foreign key) is deleted, 
    all corresponding rows in the child table (the table containing the foreign key) are automatically deleted as well.

    CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
     );

    CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ProductName VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
       );



                  

















      



					
                             
                             