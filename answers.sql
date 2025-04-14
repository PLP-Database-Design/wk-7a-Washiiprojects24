Create the Customers table:

sql
Copy
Edit
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
Create the OrderDetails table:

sql
Copy
Edit
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);
Insert data into Customers table (extract unique OrderID and CustomerName):

sql
Copy
Edit
INSERT INTO Customers (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
Insert data into OrderDetails table (only order and product-related data):

sql
Copy
Edit
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
