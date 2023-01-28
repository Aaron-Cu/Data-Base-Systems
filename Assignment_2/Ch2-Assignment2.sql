/***************************/
/* Name: Aaron Cummings    */
/* Class: CS 3410          */
/* Term: Spring 2021       */
/* Assgn #: 2 Part 1       */
/***************************/

USE Cape_Codd;
/* 2.17 */
Select SKU, SKU_Description
From Inventory;

USE Cape_Codd;
/* 2.27 */
Select SKU, SKU_Description, WarehouseID
From INVENTORY
Where QuantityOnHand >= 0
ORDER BY WarehouseID DESC, SKU ASC;

/***************************/
/* Name: Aaron Cummings    */
/* Class: CS 3410          */
/* Term: Spring 2021       */
/* Assgn #: 2 Part 2       */
/***************************/

USE QACS_CH02
/* A */
Select *
From CUSTOMER, ITEM, SALE, SALE_ITEM;

USE QACS_CH02
/* B */
Select LastName, FirstName, Phone
From CUSTOMER ;

USE QACS_CH02
/* C */
Select LastName, FirstName, Phone
From CUSTOMER
Where FirstName = 'John';

USE QACS_CH02
/* D */
Select LastName, FirstName, Phone
From CUSTOMER
Where FirstName LIKE 'D%';

USE QACS_CH02
/* E */
Select LastName, FirstName, Phone
From CUSTOMER
Where LastName LIKE '%ne%';

USE QACS_CH02
/* F */
Select LastName, FirstName, Phone
From CUSTOMER
Where Phone LIKE '%56_';

USE QACS_CH02
/* G */
Select MAX(Total) AS MaxTotal, MIN(Total) AS MinTotal
From SALE;

USE QACS_CH02
/* H */
Select Avg(Total) AS AvgTotal
From SALE;

USE QACS_CH02
/* I */
Select COUNT(CustomerID) AS CountCustomer
From CUSTOMER;

USE QACS_CH02
/* J */
Select LastName, FirstName
From CUSTOMER
ORDER BY LastName ASC, FirstName ASC;

USE QACS_CH02
/* K */
Select LastName, FirstName, COUNT (*) AS Last_First_Combination_Count
From CUSTOMER
GROUP BY LastName, FirstName;