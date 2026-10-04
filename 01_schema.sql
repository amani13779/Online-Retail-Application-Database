-- Online Retail Application Database (Oracle SQL)
-- DDL: creation of the 14 tables

CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EmailDomain (
    DomainID INT PRIMARY KEY,
    DomainName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    EmailUser VARCHAR(50) NOT NULL,
    DomainID INT NOT NULL,
    PhoneNumbers VARCHAR(100),
    AddressStreet VARCHAR(100) NOT NULL,
    AddressCity VARCHAR(50) NOT NULL,
    AddressPostalCode VARCHAR(10),
    CountryID INT NOT NULL,
    CONSTRAINT FK_CountryID FOREIGN KEY (CountryID) REFERENCES Country(CountryID) ON DELETE CASCADE,
    CONSTRAINT FK_DomainID FOREIGN KEY (DomainID) REFERENCES EmailDomain(DomainID) ON DELETE CASCADE
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(200)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    ContactEmail VARCHAR(50) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL
);

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

CREATE TABLE Wishlist (
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    PRIMARY KEY (CustomerID, ProductID),
    CONSTRAINT FK_WishlistCustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    CONSTRAINT FK_WishlistProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'Completed', 'Shipped', 'Cancelled')),
    CONSTRAINT FK_OrderCustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT FK_OrderDetailsOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetailsProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

CREATE TABLE PaymentMethods (
    PaymentMethodID INT PRIMARY KEY,
    Method VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Payments (
    OrderID INT PRIMARY KEY,
    PaymentMethodID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PaymentDate DATE NOT NULL,
    CONSTRAINT FK_PaymentOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_PaymentMethodID FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID) ON DELETE CASCADE
);

CREATE TABLE Shipping (
    OrderID INT PRIMARY KEY,
    ShippingDate DATE,
    DeliveryDate DATE,
    CONSTRAINT FK_ShippingOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);

CREATE TABLE Reviews (
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText VARCHAR(300),
    PRIMARY KEY (ProductID, CustomerID),
    CONSTRAINT FK_ReviewProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    CONSTRAINT FK_ReviewCustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY,
    CategoryID INT NOT NULL,
    DiscountPercentage INT CHECK (DiscountPercentage IN (20, 35, 50, 75)),
    CONSTRAINT FK_PromotionCategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE
);
