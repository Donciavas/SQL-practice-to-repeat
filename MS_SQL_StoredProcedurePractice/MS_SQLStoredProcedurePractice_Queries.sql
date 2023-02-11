--USE SQLStoredProcedurePractice
CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLStoredProcedurePractice..EmployeeDemographics emp
JOIN SQLStoredProcedurePractice..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;

CREATE PROCEDURE Temp_Employee2 
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLStoredProcedurePractice..EmployeeDemographics emp
JOIN SQLStoredProcedurePractice..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle 
group by JobTitle

Select * 
From #temp_employee3
GO;

CREATE PROCEDURE People_GetByLastName
	@LastName nvarchar(50),
	@FirstName nvarchar(50) = ''
AS
BEGIN
	SELECT EmployeeID, FirstName, LastName
	FROM EmployeeDemographics
	WHERE LastName = @LastName;
END

exec Temp_Employee2 @jobtitle = 'Salesman'
exec Temp_Employee2 @jobtitle = 'Accountant'

EXEC People_GetByLastName @LastName = 'Smith'

CREATE ROLE dbStoredProcedureOnlyAccess

grant execute to dbStoredProcedureOnlyAccess