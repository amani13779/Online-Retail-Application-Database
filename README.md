# Online Retail Application Database

A relational database for an electronics e-commerce platform: schema design (DDL), sample data (DML), views, 35 queries, an E-R model, and normalization of three tables. Written for **Oracle SQL**.

## Table of Contents

1. [Introduction](#1-introduction)
2. [Assumptions](#2-assumptions)
3. [Entities](#3-entities)
4. [Schema](#4-schema)
5. [Creation (DDL)](#5-creation-ddl)
6. [Insertion (DML)](#6-insertion-dml)
7. [Views](#7-views)
8. [Queries](#8-queries)
9. [E-R Model](#9-e-r-model)
10. [Normalization](#10-normalization)
11. [Repository Structure](#repository-structure)
12. [How to Run](#how-to-run)
13. [Resources](#resources)

---

## 1. Introduction

This project explores an online retail database that organizes critical data such as customer information, product listings, orders, and payments. By focusing on these key elements, the database supports smooth transaction processing, accurate inventory management, and a seamless customer experience.

## 2. Assumptions

The database models an electronics e-commerce platform that manages customers, orders, and products:

- The system supports managing customers, orders, products, and promotions.
- Customers from multiple countries can register and use different email domains.
- All products are categorized and provided by specific suppliers.
- Customers can create wishlists and place orders with shipping and payment details.
- The system supports multiple payment methods and order status updates.
- Customers can rate and review products.

## 3. Entities

| | | | |
|---|---|---|---|
| Customers | Categories | Suppliers | Products |
| Orders | OrderDetails | Payments | PaymentMethods |
| Wishlist | Review | Promotions | Shipping |
| EmailDomain | Country | | |

## 4. Schema

![Schema diagram](images/schema_diagram.png)

## 5. Creation (DDL)

14 tables in total. Full script: [`sql/01_schema.sql`](sql/01_schema.sql).

| Table | Primary key | Foreign keys | Notable constraints |
|-------|-------------|--------------|---------------------|
| Country | CountryID | – | `CountryName` unique |
| EmailDomain | DomainID | – | `DomainName` unique |
| Customers | CustomerID | CountryID, DomainID | name, address fields `NOT NULL` |
| Categories | CategoryID | – | `Name` unique |
| Suppliers | SupplierID | – | `ContactEmail` unique |
| Products | ProductID | CategoryID, SupplierID | `Price > 0`, `Stock >= 0` (default 0) |
| Wishlist | (CustomerID, ProductID) | CustomerID, ProductID | – |
| Orders | OrderID | CustomerID | `Status` in Pending / Completed / Shipped / Cancelled |
| OrderDetails | (OrderID, ProductID) | OrderID, ProductID | `Quantity > 0`, `Price > 0` |
| PaymentMethods | PaymentMethodID | – | `Method` unique |
| Payments | OrderID | OrderID, PaymentMethodID | `Amount > 0` |
| Shipping | OrderID | OrderID | – |
| Reviews | (ProductID, CustomerID) | ProductID, CustomerID | `Rating` between 1 and 5 |
| Promotions | PromotionID | CategoryID | `DiscountPercentage` in 20, 35, 50, 75 |

All foreign keys use `ON DELETE CASCADE`.

Example (Products table):

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(200),
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Stock INT DEFAULT 0 CHECK (Stock >= 0),
    CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE,
    CONSTRAINT FK_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE CASCADE
);
```

## 6. Insertion (DML)

Sample data for all 14 tables: [`sql/02_data.sql`](sql/02_data.sql). Run it after the schema, in the order given in the file.

| Table | Rows | Table | Rows |
|-------|------|-------|------|
| Country | 5 | Orders | 35 |
| EmailDomain | 5 | OrderDetails | 40 |
| Customers | 25 | PaymentMethods | 7 |
| Categories | 8 | Payments | 17 |
| Suppliers | 9 | Shipping | 25 |
| Products | 25 | Reviews | 11 |
| Wishlist | 25 | Promotions | 4 |

## 7. Views

7 views in [`sql/03_views.sql`](sql/03_views.sql):

| View | Description |
|------|-------------|
| `SaudiCustomers` | Customers located in Saudi Arabia (`WITH CHECK OPTION`) |
| `AccessoriesProducts` | Products that belong to the "Accessories" category (`WITH CHECK OPTION`) |
| `CustomerOrderSummary` | Summary of each customer's orders (total, completed, pending, cancelled) |
| `ProductStockStatus` | Stock status of each product with the supplier name and stock quantity |
| `ShippingOverview` | Shipping details of each order |
| `DiscountedProducts` | Products with an active discount, with the discounted price |
| `RecentCompletedOrders` | Completed orders dated on or after January 1, 2024 (`WITH CHECK OPTION`) |

**Note on `RecentCompletedOrders`:** inserting a row that does not meet the view's condition raises `ORA-01402: view WITH CHECK OPTION where-clause violation`, which confirms that `WITH CHECK OPTION` works as expected.

```sql
CREATE VIEW RecentCompletedOrders AS
SELECT OrderID, CustomerID, OrderDate, Status
FROM Orders
WHERE OrderDate >= TO_DATE('2024-01-01', 'YYYY-MM-DD')
  AND Status = 'Completed'
WITH CHECK OPTION;
```

## 8. Queries

35 queries in [`sql/04_queries.sql`](sql/04_queries.sql):

| # | Description |
|---|-------------|
| 1 | First and last names of all customers from Saudi Arabia |
| 2 | Number of customers in each country |
| 3 | All categories in alphabetical order |
| 4 | Average price of products in the "Mobile Phones" category |
| 5 | Total sales amount for each product category |
| 6 | Pending orders made by customers residing in Dammam |
| 7 | Add a new category "Wearables" with a description |
| 8 | Set the stock of all "Audio Devices" products to 20 units |
| 9 | Delete all orders with status "Cancelled" |
| 10 | Highest price among all products |
| 11 | Customers who have placed two orders |
| 12 | Countries with customers who paid by "Credit Card" |
| 13 | Products priced between $100 and $500 |
| 14 | Set the status of the order with `OrderID = 3` to "Completed" |
| 15 | Rename `ContactEmail` in Suppliers to `Email` |
| 16 | Products with "Samsung" in their name or description |
| 17 | Average rating for each product |
| 18 | Products that are part of a 50% promotion |
| 19 | Orders placed in 2024, sorted by order date |
| 20 | Set status to "Cancelled" for orders placed before 2024 |
| 21 | Names of all products in the Tablets category |
| 22 | Total sales for each order, highest to lowest |
| 23 | Customers with a "Completed" order who also left a review |
| 24 | Average product price for each supplier |
| 25 | Top 5 most expensive products |
| 26 | Number of products in each category |
| 27 | Change "Shipped" orders with a `NULL` delivery date to "Pending" |
| 28 | Delete promotions for categories that have no products |
| 29 | Add a `DiscountAmount` column to Promotions |
| 30 | Count of products in each customer's wishlist |
| 31 | Customers who placed an order but left no review |
| 32 | All customers with their wishlist items (including empty wishlists) |
| 33 | Product stock label ("In Stock" if stock > 10, otherwise "Low Stock") |
| 34 | All products with their categories (`FULL JOIN`) |
| 35 | All orders with their associated customer details (`NATURAL JOIN`) |

Sample query (Q5 – total sales per category):

```sql
SELECT Categories.Name AS CategoryName,
       SUM(OrderDetails.Price * OrderDetails.Quantity) AS TotalSales
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.Name;
```

## 9. E-R Model

The steps used to draw the E-R model:

**Step 1: identify the entities**
![Entities](images/er_step1_entities.png)

**Step 2: identify the attributes**
![Attributes](images/er_step2_attributes.png)

**Step 3: identify the relationships**
![Relationships](images/er_step3_relationships.png)

**Step 4: identify the participation constraints**
![Participation constraints](images/er_step4_participation.png)

## 10. Normalization

Normalization of three tables: **Customers**, **Categories**, and **Products**.

### Customers

| Step | Problem found | Result |
|------|---------------|--------|
| 1NF | The table has multiple values | `Customer_1` |
| 2NF | The table has a partial dependency | `Customer_2` and `CustomerInfo` |
| 3NF | The table has a transitive functional dependency | `CustomerInfo_2` and `Country`, then `Customer_2` |

![Customers 1NF](images/norm_customer_1nf.png)
![Customers 2NF](images/norm_customer_2nf.png)
![Customers 3NF](images/norm_customer_3nf_a.png)
![Customers 3NF (continued)](images/norm_customer_3nf_b.png)

### Categories

| Step | Problem found | Result |
|------|---------------|--------|
| 1NF | The table has multiple values | `Category_1` |
| 2NF | The table has a partial dependency | `Category` and `Items` |
| 3NF | The table has a transitive functional dependency | `Category_2` and `CategoryDescription` |

![Categories 1NF](images/norm_categories_1nf.png)
![Categories 2NF](images/norm_categories_2nf.png)
![Categories 3NF](images/norm_categories_3nf_a.png)
![Categories 3NF (continued)](images/norm_categories_3nf_b.png)

### Products

| Step | Problem found | Result |
|------|---------------|--------|
| 1NF | The table has multiple values | `Products_1` |
| 2NF | The table has no partial dependency | `Suppliers`, `Category`, and `Products_2` |

![Products 1NF](images/norm_products_1nf.png)
![Products 2NF](images/norm_products_2nf_a.png)
![Products 2NF (continued)](images/norm_products_2nf_b.png)

## Repository Structure

```
.
├── README.md
├── sql/
│   ├── 01_schema.sql     # DDL: 14 tables
│   ├── 02_data.sql       # DML: sample data
│   ├── 03_views.sql      # 7 views
│   └── 04_queries.sql    # 35 queries
└── images/               # schema, E-R model, and normalization diagrams
```

## How to Run

1. Open Oracle SQL Developer (or any Oracle SQL client).
2. Run the scripts in this order: `01_schema.sql`, `02_data.sql`, `03_views.sql`, `04_queries.sql`.
3. Queries 7–9, 14, 15, 20, 27–29 modify data or tables, so run them on a fresh copy if you want to reproduce the outputs in the same order.

## Resources

- Silberschatz, A., Korth, H.F., & Sudarshan, S. (2010). *Database System Concepts*. 6th ed. New York: McGraw-Hill.
- Elmasri, R. & Navathe, S.B. (2010). *Fundamentals of Database Systems*. 6th ed. Boston: Pearson.
- ERDPlus. *ERDPlus – Online Database Diagram Tool*.
