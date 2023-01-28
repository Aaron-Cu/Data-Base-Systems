/***************************/
/* Name: Aaron Cummings    */
/* Class: CS3410           */
/* Term: Spring 2021       */
/* Assgn #: 3              */
/***************************/
USE Cape_Codd
/*2.28*/
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

/*2.29*/
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

/*2.30*/
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 and 9;

/*2.31*/
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-dome%';

/*2.32*/
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

/*2.33*/
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

/*2.34*/
SELECT AVG(QuantityOnHand) AS 'Avg', SUM(QuantityOnHand) AS 'Sum', MIN(QuantityOnHand) AS 'Min', MAX(QuantityOnHand) AS 'Max', COUNT(QuantityOnHand) AS 'Count'
FROM INVENTORY;

/*2.35*/
/*SQL COUNT function is used to count the number of rows in a table,*/
/*where as the SUM function calculates the sum of all the values in */
/*every row beloging to a given columb.                             */

/*2.36*/
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

/*2.37*/
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandT3 DESC;

/*2.38*/
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandT3
FROM INVENTORY
WHERE QuantityOnHand < 3 
GROUP BY WarehouseID
HAVING COUNT(QuantityOnHand) < 2
ORDER BY TotalItemsOnHandT3 DESC;

/*2.39*/
/*The results are first grouped by the WHERE and then filtered by HAVING*/
/*This is because where directly effects what is chosen with SELECT     */

/*2.40*/
SELECT SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
Where INVENTORY.WarehouseID <= 300;

/*2.41*/
SELECT SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
Where WAREHOUSE.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

/*2.42*/
SELECT SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
Where INVENTORY.WarehouseID > 300;

/*2.43*/
SELECT SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
Where WAREHOUSE.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

/*2.44*/
SELECT (SKU_Description + 'is located in '+WarehouseCity) AS 'ItemLocation'
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

/*2.45*/
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID = 
	(SELECT WarehouseID
	FROM WAREHOUSE
	WHERE WAREHOUSE.Manager IN ('Lucille Smith'));

/*2.46*/
SELECT SKU, SKU_Description, i.WarehouseID
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID and w.Manager = 'Lucille Smith';

/*2.47*/
SELECT SKU, SKU_Description, INVENTORY.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager IN ('Lucille Smith');

/*2.48*/
SELECT WarehouseID, AVG(QuantityOnHand) AS 'AvgQuantityOnHand'
FROM INVENTORY
WHERE WarehouseID = 
	(SELECT WarehouseID
	FROM WAREHOUSE
	WHERE WAREHOUSE.Manager IN ('Lucille Smith'))
GROUP BY WarehouseID;

/*2.49*/
SELECT i.WarehouseID, AVG(QuantityOnHand) AS 'AvgQuantityOnHand'
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID and w.Manager = 'Lucille Smith'
GROUP BY i.WarehouseID;

/*2.50*/
SELECT INVENTORY.WarehouseID, AVG(QuantityOnHand) AS 'AvgQuantityOnHand'
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE WAREHOUSE.Manager IN ('Lucille Smith')
GROUP BY INVENTORY.WarehouseID;