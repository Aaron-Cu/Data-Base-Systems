/***************************/
/* Name: Aaron Cummings    */
/* Class: CS3410           */
/* Term: Spring 2021       */
/* Lab #: 3 part2          */
/***************************/
USE lab3
/*List the name of all products for which an order was placed. (Interactive SQL-->Queries-Advanced-->Join)*/
SELECT DISTINCT PRODUCTS.Pname
FROM PRODUCTS JOIN ORDERS
ON PRODUCTS.pid = ORDERS.pid;

/*List the name of customers that ordered product ‘p07’ (Interactive SQL -> Queries-Advanced-->Join and Queries-Basic -> Restriction)*/
SELECT CUSTOMERS.cname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid
WHERE ORDERS.Pid = 'p07';

/*List name of agents that placed an order for customer c003 or customer c006 (Interactive SQL -> QueriesAdvanced-->Join and Queries-Basic ->Restriction)*/
SELECT DISTINCT aname
FROM AGENTS JOIN ORDERS
ON AGENTS.Aid = ORDERS.Aid
WHERE ORDERS.Cid = 'c003' OR ORDERS.Cid = 'c006';

/*List name of customers that ordered product ‘p01’ through agent 'a01' (Interactive SQL -> QueriesAdvanced-->Join and Queries-Basic ->Restriction)*/
SELECT DISTINCT CUSTOMERS.Cname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid
WHERE ORDERS.Pid = 'p01' AND ORDERS.Aid = 'a01';

/*List the name of each customer that placed an order, the pid of what they ordered. (Interactive SQL ->Queries-Advanced-->Join)*/
SELECT DISTINCT CUSTOMERS.Cname, ORDERS.Pid
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid;

/*List the name of each customer that placed an order and the product name for each product they ordered. (Interactive SQL ->Queries-Advanced-->Join)*/
SELECT DISTINCT CUSTOMERS.Cname, PRODUCTS.Pname
FROM CUSTOMERS JOIN ORDERS 
ON CUSTOMERS.Cid = ORDERS.Cid 
JOIN PRODUCTS
ON ORDERS.Pid = PRODUCTS.Pid;

/*List the name of each customer and the total amount ordered by the customer. (Interactive SQL ->Queries-Advanced-> Outer Join and Queries - Basic -> Functions, GroupBy)*/
SELECT CUSTOMERS.Cname, SUM(ORDERS.Dollars) AS 'Total'
FROM CUSTOMERS LEFT OUTER JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid
GROUP BY CUSTOMERS.Cname;

/*List the name and the sum of dollars for each customer that ordered more than $1,000 (SQL-->QueriesAdvanced-->Join and Queries-Basic ->Having)*/
SELECT CUSTOMERS.Cname, SUM(ORDERS.Dollars) AS 'Total'
FROM CUSTOMERS LEFT OUTER JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid
GROUP BY CUSTOMERS.Cname
HAVING SUM(ORDERS.Dollars) > 1000;

/*List the agent name, product name and customer name for each product ordered. (Interactive SQL-->Queries-Advanced-->Join)*/
SELECT AGENTS.Aname, PRODUCTS.Pname, CUSTOMERS.Cname
FROM CUSTOMERS JOIN ORDERS
ON CUSTOMERS.Cid = ORDERS.Cid
JOIN PRODUCTS
ON ORDERS.Pid = PRODUCTS.Pid
JOIN AGENTS
ON ORDERS.Aid = AGENTS.Aid;

/*What would be the result of the following SQLStatement:(Interactive SQL -> Queries-Advanced-->Multiplication)*/

SELECT * from CUSTOMERS, PRODUCTS;

/*The result is the cartisian product of the two tables*/
