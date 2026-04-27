CREATE DATABASE NovaStoreDB;
GO
USE NovaStoreDB;
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(50),
    City VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Stock INT DEFAULT 0,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT
);

GO

INSERT INTO Categories (CategoryName) 
VALUES ('Electronics'), ('Clothing'), ('Books'), ('Cosmetics'), ('Home & Garden');

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES 
('iPhone 15 Pro', 1200.00, 25, 1), ('MacBook Air M3', 1500.00, 10, 1), ('AirPods Pro', 250.00, 50, 1),
('Leather Jacket', 200.00, 15, 2), ('Cotton Hoodie', 55.00, 40, 2), ('Running Shoes', 120.00, 30, 2),
('Swift Programming Guide', 45.00, 12, 3), ('Database Design 101', 35.00, 8, 3),
('Skin Serum', 25.00, 60, 4), ('Luxury Perfume', 110.00, 20, 4),
('Robot Vacuum', 400.00, 5, 5), ('Coffee Table', 150.00, 10, 5);

INSERT INTO Customers (FullName, City, Email)
VALUES 
('Alice Walker', 'New York', 'alice@example.com'), ('Bob Miller', 'London', 'bob@example.com'),
('Charlie Davis', 'Berlin', 'charlie@example.com'), ('Diana Prince', 'Paris', 'diana@example.com'),
('Edward Norton', 'Tokyo', 'edward@example.com'), ('Fiona Gallagher', 'Chicago', 'fiona@example.com');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2026-04-10', 1200.00), (2, '2026-04-11', 55.00), (3, '2026-04-12', 45.00), (4, '2026-04-13', 25.00),
(5, '2026-04-14', 400.00), (6, '2026-04-15', 1500.00), (1, '2026-04-16', 250.00), (2, '2026-04-17', 200.00),
(3, '2026-04-18', 35.00), (4, '2026-04-19', 110.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1), (2, 5, 1), (3, 7, 1), (4, 9, 1), (5, 11, 1),
(6, 2, 1), (7, 3, 1), (8, 4, 1), (9, 8, 1), (10, 10, 1);

GO

SELECT ProductName, Stock, Price 
FROM Products 
WHERE Stock < 20 
ORDER BY Stock ASC;

SELECT P.ProductName, C.CategoryName, P.Price 
FROM Products P 
JOIN Categories C ON P.CategoryID = C.CategoryID;

SELECT City, COUNT(*) AS TotalCustomers 
FROM Customers 
GROUP BY City;

SELECT TOP 5 OrderID, TotalAmount, OrderDate 
FROM Orders 
ORDER BY TotalAmount DESC;

SELECT C.CategoryName, SUM(P.Stock) AS TotalStock 
FROM Products P 
JOIN Categories C ON P.CategoryID = C.CategoryID 
GROUP BY C.CategoryName;

SELECT 
    COUNT(*) AS TotalProductCount, 
    AVG(Price) AS AveragePrice, 
    SUM(Price * Stock) AS TotalPotentialRevenue 
FROM Products;