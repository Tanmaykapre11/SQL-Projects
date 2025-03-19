--database name [AdventureWorks2019]
--download link https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

--Query 1 : If User wants to check the data for Employee from Employee table whose department 
--is IT and HR. —> Simple SQL
--In this case user wants to use IN operator to check the department data from Employee table.

Select * from [HumanResources].[Department] where name IN ('Sales','finance');

--Query 2 : If the departement column is not present in Employee table and it is present is Department table.
--The joining condition will be Dept_id.User need to find out the data for Employees whose associated department is 'IT' or 'HR'. —> Use of IN clause
select top 10 BusinessEntityID from person.person
Select top 10 DepartmentID from [HumanResources].[Department] where name IN ('Sales','finance');


select * from person.person join [HumanResources].department
on BusinessEntityID=DepartmentID
where name IN ('Sales','finance');

--In above query user needs to use joining condition to fetch the information.
--Query 3 : If user wants to fetch data for Employees whose name Starts with 'A'? —> 
--Use of Pattern Matching

select * from person.person
where FirstName like 'A%'

--The above query will fetch all Employee whose name starts with A.
--Query 4 : If user wants to fetch data for Employees whose department
--is 'IT' and Salary is greater than 30. —> Use of AND clause
select top 1 * from person.person
Select top 1  * from [HumanResources].department
select top 1  * from [HumanResources].[EmployeePayHistory]

select pp.FirstName,Name,Rate from person.person as pp join [HumanResources].department
on pp.BusinessEntityID=DepartmentID
inner join [HumanResources].[EmployeePayHistory] as ep
on ep.BusinessEntityID=DepartmentID
where rate >30  and name = 'Sales'


--Query 5 : If user wants to count the number of employees whose department is 'IT'
--and salary is greater than 30000. —> Use of Count Function


select pp.FirstName,name, count (Name) as total 
,Rate from person.person as pp join [HumanResources].department
on pp.BusinessEntityID=DepartmentID
inner join [HumanResources].[EmployeePayHistory] as ep
on ep.BusinessEntityID=DepartmentID

group by pp.FirstName,name,Rate
having rate >30  and name = 'Sales'

--Query 6 : If user wants to calculate Employess with its department. —> Group by Clause
select pp.FirstName,name, count (Name) as total 
 from person.person as pp join [HumanResources].department
on pp.BusinessEntityID=DepartmentID
group by pp.FirstName,name



--Query 7 : If user wants to calculate Employees with its department 
--which is order by descending order.-–> Group by and Order by clause

select pp.FirstName,name, count (Name) as total 
 from person.person as pp join [HumanResources].department
on pp.BusinessEntityID=DepartmentID
group by pp.FirstName,name
 order by name asc

--Query 8 : If user wants to fetch the name of distinct department from Department table.

Select distinct(DepartmentID) ,*from [HumanResources].department order by name asc

--The above query will fetch the distinct department names from department table.
--Query 9 : If user wants to fetch the employee data from employee table where department names are IT and Finance.

SELECT FirstName, count(FirstName )  FROM [Person].[Person]
group by FirstName
having count(FirstName )<=1


--Query 10 : If Employee salary is greater than 30000 the Employee will be High Salaried else it is regular pay. 
--If user wants to fetch this using queries which query do we need to use.

Select *,
Case 
	when rate  > 30 then 'High Salaried' 
	else 'Regular Pay' 
end as salary
from [HumanResources].[EmployeePayHistory];



--The user needs to follow the order of Keywords in SQL as follows.
	--SELECT
	--FROM
	--WHERE
	--GROUP BY
	--ORDER BY
	--With using the same user can build up the query for SQL Analytics to fetch the data from the table.
