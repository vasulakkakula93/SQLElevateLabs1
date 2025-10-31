create database employee_db;
use employee_db;

create table employee (
    Emp_Id int primary key auto_increment,
    Emp_Name varchar(50) not null,
    Emp_City varchar(100),
	Emp_Country varchar(50),
    Emp_Phone varchar(15),
    Emp_Age int,
    Emp_Salary decimal(10,2)
);

insert into employee (Emp_Name, Emp_City, Emp_Country, Emp_Phone, Emp_Age, Emp_Salary) values
('Anil Kumar','Delhi', 'India', '9876543210', 30, 55000.00),
('Priya Sharma', 'Mumbai', 'India', '8855443322', 28, 60000.00),
('John Smith', 'New York', 'USA', '2125557890', 35, 75000.50),
('Meera Patel', 'Ahmedabad', 'India', '9090909090', 32, 52000.75),
('David Lee', 'London', 'UK', '4412345678', 40, 82000.00),
('Emily Wong', 'Beijing', 'China', '1011234567', 25, 47000.20),
('Carlos Ruiz', 'Mexico City', 'Mexico', '5551234567', 38, 66000.00),
('Sara Müller', 'Berlin', 'Germany', '3045678901', 29, 64000.25),
('Ahmed Hassan', 'Cairo', 'Egypt', '20102345678', 33, 58500.80),
('Yuki Tanaka', 'Tokyo', 'Japan', '81345678910', 27, 73000.00);

DELIMITER //
create procedure AddEmployee(
    in Emp_Name varchar(50),
    in Emp_City varchar(100),
    in Emp_Country varchar(50),
    in Emp_Phone varchar(15),
    in Emp_Age int,
    in Emp_Salary decimal(10,2)
)
begin
    insert into employee (Emp_Name, Emp_City, Emp_Country, Emp_Phone, Emp_Age, Emp_Salary)
    values (Emp_Name, Emp_City, Emp_Country, Emp_Phone, Emp_Age, Emp_Salary);
end //
DELIMITER ;
call AddEmployee('Jane Doe','Pune','India','9988776655',31,63000.00);

use employee_db;
DELIMITER //
create procedure UpdateSalary(
    in emp_id int,
    in new_salary decimal(10,2)
)
begin
    update employee
    set Emp_Salary = new_salary
    where Emp_Id = emp_id;
end //
DELIMITER ;

set SQL_SAFE_UPDATES = 0;
call UpdateSalary(1,90000);

DELIMITER //
create procedure DeleteEmployee(
    in emp_id int
)
begin
    delete from employee where Emp_Id = emp_id;
end //
DELIMITER ;
call DeleteEmployee(8);

DELIMITER //
create procedure ListAllEmployees()
begin
    select * from employee;
end //
DELIMITER ;

call ListAllEmployees();

use employee_db;
DELIMITER //
create procedure GetEmployeesByCountry(
    in country varchar(50)
)
begin
    select * from employee where Emp_Country = country;
end //
DELIMITER ;

call GetEmployeesByCountry('India');

DELIMITER //
create procedure GetHighSalaryEmployees(
    in min_salary decimal(10,2)
)
begin
    select * from employee where Emp_Salary > min_salary;
end //
DELIMITER ;

call GetHighSalaryEmployees(9000);

DELIMITER //
create function GetEmployeeCountByCountry(emp_country varchar(50))
returns int
deterministic
begin
    declare country_count int;
    select count(*) into country_count
    from employee
    where Emp_Country = emp_country;
    return country_count;
end //
DELIMITER ;

select GetEmployeeCountByCountry('india') as country_count;

SHOW PROCEDURE STATUS WHERE Db = 'employee_db';


Interview Questions........

1.Difference between procedure and function?
 A procedure is used to execute a series of SQL statements and can perform actions such as 
 insert, update, or delete, but does not return a value directly, while a function must return a single value 
 and is typically used for calculations or data transformations within SQL queries.

2.What is IN/OUT parameter?
 In SQL procedures, an IN parameter is used to pass a value into the procedure, allowing you to input data, 
 while an OUT parameter is used to send a value back from the procedure to the caller, allowing the procedure to return results.

3.Can functions return tables?
 No, functions in MySQL cannot return tables; they must return a single value such as a number, string, or date.

4.What is RETURN used for?
  The RETURN statement in a function is used to send back a single value as the function’s result when it finishes execution.
  It defines the output of the function, which can then be used in SQL queries or expressions.

5.How to cal stored procedures?
  To call a stored procedure in MySQL, use the CALL statement followed by the procedure name and any required parameters in parentheses.
Example:-
  CALL UpdateSalary(1, 90000.00);

6.What is the benefit of stored routines?
  The benefit of stored routines (procedures and functions) is that they make database code reusable, help organize complex logic in one place, 
  improve performance by running on the server, and increase security by allowing controlled, parameterized access to data and operations.

7.Can procedures have loops?
  Yes, procedures can have loops in SQL; you can use loop constructs like LOOP, WHILE, or REPEAT inside a procedure to 
   repeatedly execute blocks of code until a condition is met.

Example:- 
      DELIMITER //
CREATE PROCEDURE IncreaseSalaryForYoungEmployees(
    IN age_limit INT,
    IN increment DECIMAL(10,2)
)
BEGIN
    DECLARE emp_cursor CURSOR FOR
        SELECT Emp_Id FROM employee WHERE Emp_Age < age_limit;
    DECLARE emp_id INT;
    
    OPEN emp_cursor;
    emp_loop: LOOP
        FETCH emp_cursor INTO emp_id;
        IF emp_id IS NULL THEN
            LEAVE emp_loop;
        END IF;
        UPDATE employee
        SET Emp_Salary = Emp_Salary + increment
        WHERE Emp_Id = emp_id;
    END LOOP;
    CLOSE emp_cursor;
END //
DELIMITER ;

8.Difference between scalar and table-valued functions?
  A scalar function returns a single value such as a number or string, while a table-valued function returns an entire table or 
   result set with multiple rows and columns.
  In MySQL, only scalar functions are supported, but in databases like SQL Server or PostgreSQL, you can create both scalar and table-valued functions.

9.What is a trigger?
 A trigger is a special type of database object that automatically executes a specified set of actions in response
 to certain events—such as INSERT, UPDATE, or DELETE—on a table. It helps enforce data integrity, automate auditing,
 and perform complex checks without manual intervention.
Example:-
 -- First, create an audit table
CREATE TABLE employee_audit (
    Audit_Id INT PRIMARY KEY AUTO_INCREMENT,
    Emp_Id INT,
    Action VARCHAR(20),
    Action_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Now, create the trigger
DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (Emp_Id, Action)
    VALUES (NEW.Emp_Id, 'INSERT');
END //
DELIMITER ;

10.How to debug stored procedures?
   To debug stored procedures in MySQL, you can use these methods:
     Use SELECT statements: Insert SELECT statements inside your procedure to display the values of variables and track execution flow.
     Use SHOW ERRORS / SHOW WARNINGS: After running your procedure, execute SHOW ERRORS; or SHOW WARNINGS; to view any errors or warnings generated.
     Check syntax errors upon creation: Errors are shown during creation if syntax is incorrect—fix as needed.
     Test with different input values: Call the procedure with various parameter values to check logic and catch edge cases.
     Log to a debugging table: Create a temporary table for logging steps and messages from the procedure.
These are only for MYSQL not for other databases :-
   MySQL does not have a built-in step-by-step debugger like some other databases, so these techniques help you understand
   and troubleshoot procedure behavior.


























