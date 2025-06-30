use library_db;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, City)
VALUES 
(1, 'Ram', 'Mumbai'),
(2, 'Ramya', 'Delhi'),
(3, 'Kavya', 'Chennai'),
(4, 'Mani', 'Hyderabad');

INSERT INTO Customers VALUES (5, 'Eve', 'Bangalore');
select * from Customers;

INSERT INTO Orders (OrderID, CustomerID, Product, Amount)
VALUES 
(101, 1, 'Laptop', 55000),
(102, 1, 'Mouse', 500),
(103, 2, 'Keyboard', 800),
(104, 5, 'Monitor', 12000);
select * from Orders;

SELECT c.Name, o.Product, o.Amount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.Name, o.Product, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.Name, o.Product, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.Name, o.Product, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.Name, o.Product, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

