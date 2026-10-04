-- Online Retail Application Database (Oracle SQL)
-- Views (7)

-- 1. Customers located in Saudi Arabia
CREATE VIEW SaudiCustomers AS
SELECT CustomerID,
       FirstName || ' ' || LastName AS Name,
       CountryID
FROM Customers
WHERE CountryID = 1
WITH CHECK OPTION;

-- 2. Products that belong to the "Accessories" category
CREATE VIEW AccessoriesProducts AS
SELECT ProductID,
       Name AS ProductName,
       CategoryID,
       Price
FROM Products
WHERE CategoryID = 8
WITH CHECK OPTION;

-- 3. Summary of each customer's orders
CREATE VIEW CustomerOrderSummary AS
SELECT
    c.CustomerID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(CASE WHEN o.Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedOrders,
    SUM(CASE WHEN o.Status = 'Pending'   THEN 1 ELSE 0 END) AS PendingOrders,
    SUM(CASE WHEN o.Status = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 4. Stock status of each product with the supplier name
CREATE VIEW ProductStockStatus AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    s.Name AS SupplierName,
    p.Stock AS AvailableStock
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- 5. Shipping details of each order
CREATE VIEW ShippingOverview AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.Status AS OrderStatus,
    s.ShippingDate,
    s.DeliveryDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Shipping s ON o.OrderID = s.OrderID
ORDER BY c.CustomerID, o.OrderDate;

-- 6. Products with an active discount
CREATE VIEW DiscountedProducts AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.Price AS OriginalPrice,
    c.Name AS CategoryName,
    pr.DiscountPercentage,
    (p.Price - (p.Price * pr.DiscountPercentage / 100)) AS DiscountedPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Promotions pr ON c.CategoryID = pr.CategoryID
WHERE pr.DiscountPercentage IS NOT NULL;

-- 7. Completed orders placed on or after January 1, 2024
CREATE VIEW RecentCompletedOrders AS
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    Status
FROM Orders
WHERE OrderDate >= TO_DATE('2024-01-01', 'YYYY-MM-DD')
  AND Status = 'Completed'
WITH CHECK OPTION;

-- Note about the last view:
-- Inserting a row that does not satisfy the view condition (for example Status = 'Pending')
-- raises ORA-01402: view WITH CHECK OPTION where-clause violation,
-- which shows that WITH CHECK OPTION works as expected.
