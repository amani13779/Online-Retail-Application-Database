-- Online Retail Application Database (Oracle SQL)
-- Queries (35)
-- Note: several queries modify data (UPDATE / DELETE / ALTER). Run them in order on a fresh copy
-- of the database, because later queries and their outputs depend on the earlier changes.

-- 1. Retrieve the first and last names of all customers from Saudi Arabia
SELECT FirstName, LastName
FROM Customers
JOIN Country ON Customers.CountryID = Country.CountryID
WHERE Country.CountryName = 'Saudi Arabia';

-- 2. Show the number of customers in each country
SELECT Country.CountryName, COUNT(CustomerID) AS CustomerCount
FROM Customers
JOIN Country ON Customers.CountryID = Country.CountryID
GROUP BY Country.CountryName;

-- 3. List all categories in alphabetical order
SELECT Name
FROM Categories
ORDER BY Name;

-- 4. Calculate the average price of products in the "Mobile Phones" category
SELECT AVG(Price) AS AveragePrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.Name = 'Mobile Phones';

-- 5. Determine the total sales amount for each product category
SELECT Categories.Name AS CategoryName,
       SUM(OrderDetails.Price * OrderDetails.Quantity) AS TotalSales
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.Name;

-- 6. Find pending orders made by customers residing in Dammam
SELECT OrderID, OrderDate
FROM Orders
WHERE Status = 'Pending'
  AND CustomerID IN (
      SELECT CustomerID FROM Customers WHERE AddressCity = 'Dammam');

-- 7. Add a new category called "Wearables" with a description
INSERT INTO Categories (CategoryID, Name, Description)
VALUES (9, 'Wearables', 'Wearable tech gadgets such as smartwatches and fitness trackers');
SELECT * FROM Categories;

-- 8. Change the stock of all products in the "Audio Devices" category to 20 units
UPDATE Products
SET Stock = 20
WHERE CategoryID = (
    SELECT CategoryID FROM Categories WHERE Name = 'Audio Devices');
SELECT * FROM Products;

-- 9. Delete all orders with a status of "Cancelled"
DELETE FROM Orders
WHERE Status = 'Cancelled';
SELECT * FROM Orders;

-- 10. Show the highest price among all products
SELECT MAX(Price) AS HighestPrice
FROM Products;

-- 11. List all customers who have placed two orders
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) = 2;

-- 12. Determine which countries have customers who made payments using "Credit Card"
SELECT DISTINCT c.CountryID, CountryName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Country co ON c.CountryID = co.CountryID
JOIN Payments p ON o.OrderID = p.OrderID
JOIN PaymentMethods pm ON p.PaymentMethodID = pm.PaymentMethodID
WHERE pm.Method = 'Credit Card';

-- 13. Find all products within the price range of $100 to $500
SELECT ProductID, Name, Price
FROM Products
WHERE Price BETWEEN 100 AND 500;

-- 14. Update the order status to 'Completed' for the order with OrderID = 3
UPDATE Orders
SET Status = 'Completed'
WHERE OrderID = 3;
SELECT OrderID, Status FROM Orders
WHERE OrderID = 3;

-- 15. Rename the ContactEmail column in the Suppliers table to Email
ALTER TABLE Suppliers
RENAME COLUMN ContactEmail TO Email;
SELECT Email FROM Suppliers;

-- 16. Retrieve the list of products that have "Samsung" in their name or description
SELECT ProductID, Name, Description
FROM Products
WHERE Name LIKE '%Samsung%' OR Description LIKE '%Samsung%';

-- 17. Calculate the average rating for each product based on customer reviews
SELECT ProductID, AVG(Rating) AS AverageRating
FROM Reviews
GROUP BY ProductID;

-- 18. Determine which products are part of a promotion with a discount of 50%
SELECT p.ProductID, p.Name, p.Price, c.Name AS Category, pr.DiscountPercentage
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Promotions pr ON c.CategoryID = pr.CategoryID
WHERE pr.DiscountPercentage = 50;

-- 19. Find all orders placed in 2024 and sort them by order date
SELECT OrderID, OrderDate, Status
FROM Orders
WHERE OrderDate >= TO_DATE('2024-01-01', 'YYYY-MM-DD')
ORDER BY OrderDate;

-- 20. Update the status to 'Cancelled' for orders placed before 2024
UPDATE Orders
SET Status = 'Cancelled'
WHERE OrderDate < TO_DATE('2024-01-01', 'YYYY-MM-DD');
SELECT OrderID, OrderDate, Status
FROM Orders
WHERE OrderDate < TO_DATE('2024-01-01', 'YYYY-MM-DD');

-- 21. Retrieve the names of all products in the Tablets category
SELECT p.Name, c.Name AS CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Tablets';

-- 22. Show the total sales for each order, sorted from highest to lowest
SELECT OrderID, SUM(Price * Quantity) AS total_sales
FROM OrderDetails
GROUP BY OrderID
ORDER BY total_sales DESC;

-- 23. List CustomerID who have a "Completed" order and also left a review
SELECT DISTINCT CustomerID, Status
FROM Orders
WHERE Status = 'Completed'
  AND CustomerID IN (
      SELECT CustomerID
      FROM Reviews);

-- 24. Calculate the average price of products for each supplier
SELECT s.Name AS SupplierName,
       AVG(p.Price) AS AveragePrice
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY s.Name;

-- 25. What are the top 5 most expensive products?
SELECT Name
FROM (
    SELECT Name
    FROM Products
    ORDER BY Price DESC)
WHERE ROWNUM <= 5;

-- 26. Find the total number of products available in each category
SELECT
    c.Name AS CategoryName,
    COUNT(p.ProductID) AS TotalProducts
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.Name;

-- 27. Update the status of all "Shipped" orders that have a NULL DeliveryDate to "Pending"
UPDATE Orders
SET Status = 'Pending'
WHERE Status = 'Shipped' AND OrderID IN (
    SELECT OrderID FROM Shipping WHERE DeliveryDate IS NULL
);
SELECT * FROM Orders;

-- 28. Delete all promotions for categories that do not have any products
DELETE FROM Promotions
WHERE CategoryID IN (
    SELECT c.CategoryID
    FROM Categories c
    LEFT JOIN Products p ON c.CategoryID = p.CategoryID
    WHERE p.ProductID IS NULL
);

-- 29. Add a new column DiscountAmount to the Promotions table to store the amount after discount
ALTER TABLE Promotions
ADD DiscountAmount DECIMAL(10, 2);
SELECT * FROM Promotions;

-- 30. Show the count of products in each customer's wishlist
SELECT c.CustomerID, COUNT(w.ProductID) AS WishlistCount
FROM Customers c
LEFT JOIN Wishlist w ON c.CustomerID = w.CustomerID
GROUP BY c.CustomerID;

-- 31. List all customers who have placed an order but have not left a review
SELECT DISTINCT c.CustomerID,
       c.FirstName || ' ' || c.LastName AS Customer_Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Reviews r ON o.CustomerID = r.CustomerID
WHERE r.CustomerID IS NULL;

-- 32. Retrieve all customers along with the items in their wishlist,
--     including customers who have no items in their wishlist
SELECT
    c.CustomerID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    w.ProductID
FROM Wishlist w
RIGHT JOIN Customers c ON w.CustomerID = c.CustomerID;

-- 33. Show the product names and a label for each based on stock availability
--     ("In Stock" if stock > 10, "Low Stock" otherwise)
SELECT
    Name AS ProductName,
    CASE
        WHEN Stock > 10 THEN 'In Stock'
        ELSE 'Low Stock'
    END AS StockStatus
FROM Products;

-- 34. Retrieve all products and their corresponding categories
SELECT
    Products.ProductID,
    Products.Name AS ProductName,
    Categories.CategoryID,
    Categories.Name AS CategoryName
FROM
    Products
FULL JOIN
    Categories
ON
    Products.CategoryID = Categories.CategoryID;

-- 35. Display all orders and their associated customer details
SELECT *
FROM Orders
NATURAL JOIN Customers
ORDER BY CustomerID;
