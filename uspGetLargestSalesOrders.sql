--This procedure gets the largest sales orders by revenue and qty, and displays
--the product name, subcategory name, order id, order qty, and total order revenue

USE AdventureWorks2014;
/*--------------------------------------------
SELECT * FROM [Production].[ProductSubcategory];
SELECT * FROM [Production].[Product];
SELECT * FROM [Sales].[SalesOrderDetail];
----------------------------------------------*/
CREATE SCHEMA [Strategy] AUTHORIZATION [dbo];

CREATE PROC Strategy.uspGetLargestSalesOrders
AS
SELECT a.Name 'ProductName', b.Name 'SubcategoryName', c.SalesOrderID, c.OrderQty, c.LineTotal
FROM 
Production.Product a
INNER JOIN Production.ProductSubcategory b ON b.ProductSubcategoryID = a.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail c ON c.ProductID = a.ProductID
WHERE LineTotal > 15000.00
AND OrderQty > 3
;