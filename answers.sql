-- Question 1
-- Step 1 Create a new database
CREATE DATABASE sales;

-- Step 2 Select Database to store tables
USE sales;

-- Step 3 Create a table called ProductDetail, add columns and insert data
CREATE TABLE ProductDetail (
OrderID INT,
CustomerName VARCHAR(100),
Products VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 4 Trasform the table into 1NF by manual normalization
-- Create a new table for normalized data and insert normalized data
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Products) 
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');



-- Question 2
-- Step 1 Create a table called OrderDetails, add columns and insert data
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) 
VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- Step 2 Transform the table into 2NF by removing partial dependencies
-- Create two new tables for normalized data

-- Create a table for Orders and insert data
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName) 
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create a Product table and insert data
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Quantity INT,
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Product (ProductID, ProductName, Quantity, OrderID)
VALUES
(1, 'Laptop', 2, 101),
(2, 'Mouse', 1, 101),
(3, 'Tablet', 3, 102),
(4, 'Keyboard', 1, 102),
(5, 'Mouse', 2, 102),
(6, 'Phone', 1, 103);



