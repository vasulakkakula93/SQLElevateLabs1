use College;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY ,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth  DATE NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    enrollment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
    
    
    
    insert into students(first_name,last_name,date_of_birth,email,phone_number) values	
    ('vasu','lakkakula','2004-05-04','vasulakkakula872@gmail.com',6309490610),
    ('Roy','lakkakula','2004-05-04','vasulakkakula872@gmail.com',9908941805),
    ('Raghu','Gogu','2003-11-23','raghuroy@gmail.com',9907065491),
    ('Shiva','lakkakula','2005-09-18','shivalakkakula81@gmail.com',8143941805);
  select * from students;
  
  
  
  create table Courses( Course_id int  auto_increment not null primary key, 
  Course_Name nvarchar(100) not null, 
  Start_Date datetime not null,
  End_Date datetime not null, 
  student_id int not null,
  foreign key(student_id) references students(student_id))
  
  
  insert into Courses(Course_Name, Start_Date, End_Date,student_id) values 
  ('Java', '2025-10-20','2026-04-20',1),
  ('Python','2025-01-30','2025-07-30',6),
  ('Core java' , '2025-06-01', '2025-12-30',7),
  ('dotnet', '2025-05-04', '2025-11-05',8);
  
   select * from Courses;
   
ALTER TABLE students ENGINE = InnoDB;
ALTER TABLE Courses ENGINE = InnoDB;

Interview Questions..........

1) What is normalization?
A) Normalization is an important process in database design that helps improve the database's efficiency, 
   consistency, and accuracy. It makes it easier to manage and maintain the data and ensures that the 
   database is adaptable to changing business needs.

2) Explain primary vs foreign key?
A) Keys are one of the most important elements in a relational database to maintain the relationship between the tables
   and it also helps in uniquely identifying the data from a table. The primary key is a key that helps uniquely identify 
   the tuple of the database. In contrast, the Foreign Key is a key used to determine the relationship between the tables
   through the primary key of one table that is the primary key of one table acts as a foreign key to another table.

3) What are constraints?
   SQL constraints are essential elements in relational database design that ensure the integrity, accuracy,
   and reliability of the data stored in a database.
   SQL constraints help maintain data consistency, preventing invalid data entries and optimizing query performance.

   NOT NULL:-The NOT NULL constraint ensures that a column cannot contain NULL values.
PRIMARY KEY:-A PRIMARY KEY constraint is a combination of the NOT NULL and UNIQUE constraints. 
             It uniquely identifies each row in a table. A table can only have one PRIMARY KEY, and it cannot accept NULL values.
     UNIQUE:-The UNIQUE constraint ensures that all values in a column are distinct across all rows in a table.
             Unlike the PRIMARY KEY, which requires uniqueness and does not allow NULLs, the UNIQUE constraint allows NULL values.
FOREIGN KEY:-A FOREIGN KEY constraint links a column in one table to the primary key in another table. 
             This relationship helps maintain referential integrity by ensuring that the value in the foreign key
      CHECK:-The CHECK constraint allows us to specify a condition that data must satisfy before it is inserted into the table.
             This can be used to enforce rules, such as ensuring that a column’s value meets certain criteria (eX: age must be greater than 18)

4) What is a surrogate key?
   A surrogate key also called a synthetic primary key, is generated when a new record is inserted into a table automatically
   by a database that can be declared as the primary key of that table. It is the sequential number outside of the database
   that is made available to the user and the application or it acts as an object that is present in the database 
   but is not visible to the user or application.

5) How do you avoid data redundancy?
   redundancy:- Code complexity or query complexity
  To effectively avoid data redundancy in database systems:-
   1.Normalize Your Database
   2.Use Foreign Keys to Establish Relationships
   3.Utilize Data Deduplication Techniques.

6) What is ER diagram?
   The Entity-Relationship Model (ER Model) is a conceptual model for designing a databases. 
   This model represents the logical structure of a database, including entities, 
   their attributes and relationships between them in diagrams.

7) What are the types of relationships in DBMS?
   1) one to one 
   2) one to many
   3) many to many

8) Explain the purpose of AUTO_INCREMENT.
   whenever apply AUTO_INCREMENT to the integer columns the number will increase automatically.

9) What is the default storage engine in MySQL?
   The default storage engine in MySQL is InnoDB.
   
10) What is a composite key?
   One Primary key Applicable on multiple colunms in a single table.
    example :- 
    CREATE TABLE StudentCourses (
       StudentID INT,
       CourseID INT,
       Semester VARCHAR(10),
    PRIMARY KEY (StudentID, CourseID, Semester)
    );









