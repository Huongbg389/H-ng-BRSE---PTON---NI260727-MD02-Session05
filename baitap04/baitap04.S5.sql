CREATE DATABASE Salemanager;
USE Salemanager;

CREATE TABLE Customer (
    CustomerID INT PRIMARY key AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO Customer (CustomerName)
VALUE 
('Computer'),
('Table'),
('Laptop'),
('Smart Phone'),
('Tablet');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO Orders (OrderDate, CustomerID)
VALUE
('2026-05-06', '1'),
('2026-05-20', '2'),
('2026-06-03', '3'),
('2026-06-08', '4'),
('2026-06-26', '5');
 
 CREATE TABLE Order_items (
    OrderID INT,
    CustomerID INT,
    ProductName VARCHAR(100) NOT NULL UNIQUE,
    Quantity INT,
    Price DECIMAL(12,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
 );

 INSERT INTO Order_items (OrderID, CustomerID, ProductName, Quantity, Price)
 VALUES
 (1, 1, 'Computer', 1, 15000000),
 (2, 2, 'Table', 3, 900000),
 (3, 3, 'Tablet', 2, 18000000),
 (4, 4, 'Smart Phone', 3, 30000000),
 (5, 5, 'Laptop', 1, 12000000);
 UPDATE Customer
 SET CustomerName = CASE CustomerID
 WHEN 1 THEN 'Nguyen Van A'
 WHEN 2 THEN 'Tran Thi Binh'
 WHEN 3 THEN  'Le Van Cuong'
 WHEN 4 THEN 'Pham Thi Dung'
 WHEN 5 THEN 'Hoang Van Nam'
 END
 WHERE CustomerID IN(1, 2, 3, 4, 5);
 SELECT * FROM Customer
 ORDER BY CustomerID ASC;

 -- Hiển thị mã đơn hàng, ngày đặt hàng, tên khách hàng
 SELECT * FROM Customer INNER JOIN Orders ON Customer.CustomerID = Orders.CustomerID
 ORDER BY Customer.CustomerID ASC;

 -- Hiển thị danh sách sản phẩm trong mỗi đơn hàng

SELECT OrderID, ProductName, Quantity, Price
FROM Order_items
ORDER BY OrderID ASC;

-- Tính tổng tiền của mỗi đơn hàng
SELECT 
     OrderID,
     SUM(Quantity * Price) AS TotalAmount
FROM Order_items
GROUP BY OrderID;

-- Hiển thị các đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT 
     OrderID,
     SUM(Quantity * Price) AS TotalAmount
FROM Order_items
GROUP BY OrderID
HAVING SUM(Quantity * Price) > 10000000;
