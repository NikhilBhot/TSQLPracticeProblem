-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Address VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create the Order table
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer (CustomerID, CustomerName, Address, Phone)
VALUES (1, 'John Doe', '123 Main St', '555-1234');

INSERT INTO Customer (CustomerID, CustomerName, Address, Phone)
VALUES (2, 'Jane Smith', '456 Elm St', '555-5678');

-- Step 3: Insert order details
INSERT INTO [Order] (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (1, 1, '2023-07-01', 100.00);

INSERT INTO [Order] (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (2, 2, '2023-07-05', 150.00);

	-- Retrieve customer details from customer table and order table
	SELECT c.CustomerID, c.CustomerName, c.Address, c.Phone, o.OrderID, o.OrderDate, o.TotalAmount
	FROM Customer c
	JOIN [Order] o ON c.CustomerID = o.CustomerID;

-- Delete orders for the customer
DELETE FROM [Order]
WHERE CustomerID = 1;

-- Delete customer details
DELETE FROM Customer
WHERE CustomerID = 1;



-- Update customer details in both tables
UPDATE Customer
SET CustomerName = 'New Name', Address = 'New Address', Phone = 'New Phone'
WHERE CustomerID = 1;

UPDATE [Order]
SET TotalAmount = 200.00
WHERE CustomerID = 1;

