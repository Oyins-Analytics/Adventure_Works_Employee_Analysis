---CLEAN
SELECT [EmployeeKey]
      ,[ParentEmployeeKey]
      ,[EmployeeNationalIDAlternateKey]
      ,[SalesTerritoryKey]
      ,ISNULL(FirstName,' ') + ' ' + ISNULL(FirstName,' ') + ' ' +  ISNULL(MiddleName, ' ') FirstName
      ,[NameStyle]
      ,[Title]
      ,DATEDIFF(YEAR,BirthDate,GETDATE()) Age
      ,DATEDIFF(YEAR,HireDate,GETDATE()) EmpYear
      ,[LoginID]
      ,[EmailAddress]
      ,[Phone]
      ,CASE WHEN MaritalStatus = 'M' THEN 'Married'
       ELSE 'Single'
       END MaritalStatus
      ,[EmergencyContactName]
      ,[EmergencyContactPhone]
      ,[SalariedFlag]
      ,CASE WHEN Gender = 'M' THEN 'Male'
       ELSE 'Female'
       END Gender
      ,[PayFrequency]
      ,[BaseRate]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[SalesPersonFlag]
      ,[DepartmentName]
      ,[StartDate]
      --,[EndDate]
      ,CASE WHEN DATEDIFF(YEAR,StartDate,EndDate) IS NULL THEN 0
       ELSE DATEDIFF(YEAR,StartDate,EndDate)
       END UsedYear
      ,CASE WHEN [Status] = 'Current' THEN 'Working'
       ELSE 'NotWorking'
       END [Status]
  FROM [AdventureWorks2019].[dbo].[DimEmployee]
  --WHERE NameStyle != 0

--Number of Employee
  SELECT COUNT(DISTINCT EmployeeKey) NumEmp
  FROM [AdventureWorks2019].[dbo].[DimEmployee]

--MAX and MIN Emp
  SELECT MAX(DATEDIFF(YEAR,BirthDate,GETDATE())) YoungestEmp
        ,MIN(DATEDIFF(YEAR,BirthDate,GETDATE())) OldestEmp
  FROM [AdventureWorks2019].[dbo].[DimEmployee]

--Gender by Emp
  SELECT CASE WHEN Gender = 'M' THEN 'Male'
         ELSE 'Female'
         END Gender
        ,COUNT(DISTINCT(EmployeeKey)) NumEmp
         FROM [AdventureWorks2019].[dbo].[DimEmployee]
         GROUP BY GENDER

--MaritalStatus by Emp
  SELECT CASE WHEN MaritalStatus = 'M' THEN 'Married'
       ELSE 'Single'
       END MaritalStatus
      ,COUNT(DISTINCT EmployeeKey) NumEmp
       FROM [AdventureWorks2019].[dbo].[DimEmployee]
       GROUP BY MaritalStatus
        
--Dept by Emp
  SELECT [DepartmentName],CASE WHEN MaritalStatus = 'M' THEN 'Married'
         ELSE 'Single'
         END MaritalStatus
        ,CASE WHEN Gender = 'M' THEN 'Male'
         ELSE 'Female'
         END Gender
        ,COUNT(DISTINCT EmployeeKey) NumEmp
        FROM [AdventureWorks2019].[dbo].[DimEmployee]
        GROUP BY MaritalStatus,Gender,DepartmentName

--Status by Emp
  SELECT CASE WHEN [Status] = 'Current' THEN 'Working'
         ELSE 'NotWorking'
         END [Status]
        ,COUNT(DISTINCT EmployeeKey) NumEmp
         FROM [AdventureWorks2019].[dbo].[DimEmployee]
         GROUP BY Status