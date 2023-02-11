USE SQLStoredProcedurePractice
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Carrey', 30, 'Male'),
(1002, 'John', 'Smith', 30, 'Female'),
(1003, 'Kevin', 'Durrant', 29, 'Male'),
(1004, 'Angelina', 'Joly', 31, 'Female'),
(1005, 'Toad', 'Flanders', 32, 'Male'),
(1006, 'Michael', 'Jackson', 35, 'Male'),
(1007, 'Jack', 'Smack', 32, 'Female'),
(1008, 'Stanley', 'Tools', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)