/***************************/
/* Name: Aaron Cummings    */
/* Class: CS3410           */
/* Term: Spring 2021       */
/* Assgn #: 4              */
/***************************/
USE WPC;
/* A */
SELECT *
FROM PROJECT;

/* B */
SELECT ProjectID, Name, StartDate, EndDate
FROM PROJECT;

/* C */
SELECT *
FROM PROJECT
WHERE StartDate < '2008-08-01';

/* D */
SELECT *
FROM PROJECT
WHERE EndDate IS null;

/* E */
SELECT ProjectID, EMPLOYEE.EmployeeNumber, LastName, FirstName, Phone
FROM EMPLOYEE, ASSIGNMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber;

/* F */
SELECT ASSIGNMENT.ProjectID, PROJECT.Name, PROJECT.Department, EMPLOYEE.EmployeeNumber, LastName, FirstName, Phone
FROM EMPLOYEE, PROJECT, ASSIGNMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber AND PROJECT.ProjectID = ASSIGNMENT.ProjectID;

/* G */
SELECT ASSIGNMENT.ProjectID, PROJECT.Name, PROJECT.Department,DEPARTMENT.Phone, EMPLOYEE.EmployeeNumber, LastName, FirstName, EMPLOYEE.Phone
FROM EMPLOYEE, PROJECT, ASSIGNMENT, DEPARTMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber AND PROJECT.ProjectID = ASSIGNMENT.ProjectID AND PROJECT.Department = DEPARTMENT.DepartmentName
ORDER BY ProjectID ASC;

/* H */
SELECT ASSIGNMENT.ProjectID, PROJECT.Name, PROJECT.Department,DEPARTMENT.Phone, EMPLOYEE.EmployeeNumber, LastName, FirstName, EMPLOYEE.Phone
FROM EMPLOYEE, PROJECT, ASSIGNMENT, DEPARTMENT
WHERE EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber AND PROJECT.ProjectID = ASSIGNMENT.ProjectID AND PROJECT.Department = DEPARTMENT.DepartmentName AND DEPARTMENT.DepartmentName = 'Marketing'
ORDER BY ProjectID ASC;

/* I */
SELECT COUNT(ProjectID) as NumMarketingProj
FROM PROJECT
WHERE Department = 'Marketing';

/* J */
SELECT SUM(MaxHours) as SumMarketingProjMaxHours
FROM PROJECT
WHERE Department = 'Marketing';

/* K */
SELECT AVG(MaxHours) as AvgMarketingProjMaxHours
FROM PROJECT
WHERE Department = 'Marketing';

/* L */
SELECT DISTINCT Department, COUNT(ProjectID) as NumProj
FROM PROJECT
GROUP BY Department;