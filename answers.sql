DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

-- Step 1: Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

-- Step 2: Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

-- Step 3: Create OrderItems table (junction table)
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 4: Insert data into Orders
INSERT INTO Orders (OrderID, CustomerName, OrderDate)
VALUES
(201, 'Alice Johnson', '2025-04-01'),
(202, 'Bob Williams', '2025-04-03'),
(203, 'Catherine Lee', '2025-04-05');

-- Step 5: Insert data into Products
INSERT INTO Products (ProductID, ProductName)
VALUES
(1, 'Smartphone'),
(2, 'Wireless Charger'),
(3, 'Bluetooth Headphones'),
(4, 'Gaming Laptop'),
(5, 'Mechanical Keyboard'),
(6, 'HD Monitor');

-- Step 6: Insert data into OrderItems
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity)
VALUES
(1, 201, 1, 1),  -- Alice: Smartphone
(2, 201, 2, 1),  -- Alice: Wireless Charger
(3, 202, 4, 1),  -- Bob: Gaming Laptop
(4, 202, 5, 1),  -- Bob: Keyboard
(5, 203, 1, 2),  -- Catherine: Smartphones
(6, 203, 3, 1),  -- Catherine: Headphones
(7, 203, 6, 2);  -- Catherine: Monitors
