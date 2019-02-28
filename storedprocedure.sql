/*-- Design a Stored Procedure that has at least two joins and two parameters--*/


use AdventureWorks2014

create proc dbo.paychangeinfo @businessentityid INT, @payrate MONEY
as
SELECT a1.Rate, a1.RateChangeDate, a2.EmailAddress
from  humanresources.EmployeePayHistory a1
inner join HumanResources.EmployeeDepartmentHistory a3 ON a3.BusinessEntityID = a1.BusinessEntityID
inner join person.EmailAddress a2 on a2.BusinessEntityID = a1.BusinessEntityID
WHERE a1.BusinessEntityID = @businessentityid
AND a1.rate >= @payrate
go

exec dbo.paychangeinfo @businessentityid = 4, @payrate = 15