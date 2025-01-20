-- FOOD DELIVERY MANAGEMENT SYSTEM

-- Restaurants: 10 entries, representing various cuisines.
-- Menu_Items: 20 items spanning diverse dishes.
-- Customers: 10 unique customers.
-- Orders: 10 orders with varying statuses.
-- Order_Details: 40 detailed order records showing multiple items per order.
-- Delivery_Personnel: 10 delivery personnel available for assignments.
-- Deliveries: 10 records tracking order statuses and assigned personnel.

create database food_management;
show databases;
use food_management;
CREATE TABLE Restaurants (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    ContactNumber VARCHAR(15)
);
desc Restaurants;
CREATE TABLE Menu_Items (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantID INT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    ContactNumber VARCHAR(15)
);
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    Status ENUM('Pending', 'Preparing', 'Out for Delivery', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Order_Details (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES Menu_Items(MenuItemID)
);
CREATE TABLE Delivery_Personnel (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15)
);

CREATE TABLE Deliveries (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryPersonnelID INT,
    DeliveryDate DATETIME,
    DeliveryStatus ENUM('Assigned', 'Delivered', 'Failed') DEFAULT 'Assigned',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (DeliveryPersonnelID) REFERENCES Delivery_Personnel(DeliveryID)
);

INSERT INTO Restaurants (Name, Address, ContactNumber)
VALUES
('Pizza Palace', '123 Main St', '123-456-7890'),
('Burger Town', '456 Elm St', '987-654-3210'),
('Sushi Delight', '789 Maple Ave', '111-222-3333'),
('Taco Haven', '234 Pine St', '444-555-6666'),
('Pasta Paradise', '567 Oak Blvd', '777-888-9999'),
('Grill Master', '321 Willow Dr', '222-333-4444'),
('Curry Corner', '654 Cedar Ln', '555-666-7777'),
('Salad Stop', '876 Birch Rd', '888-999-1111'),
('Dessert Den', '159 Chestnut St', '111-555-6666'),
('Wrap World', '741 Oak Blvd', '999-888-7777');

INSERT INTO Menu_Items (RestaurantID, Name, Price)
VALUES
(1, 'Margherita Pizza', 9.99),
(1, 'BBQ Chicken Pizza', 14.99),
(2, 'Veggie Burger', 7.99),
(2, 'Double Cheeseburger', 10.99),
(3, 'Dragon Roll', 12.99),
(3, 'Avocado Roll', 8.99),
(4, 'Shrimp Taco', 4.99),
(4, 'Fish Taco', 5.49),
(5, 'Lasagna', 13.49),
(5, 'Ravioli', 12.49),
(6, 'BBQ Ribs', 15.99),
(6, 'Grilled Chicken', 12.99),
(7, 'Chicken Tikka Masala', 11.99),
(7, 'Paneer Butter Masala', 10.99),
(8, 'Caesar Salad', 8.49),
(8, 'Greek Salad', 9.49),
(9, 'Chocolate Lava Cake', 6.99),
(9, 'Cheesecake', 5.99),
(10, 'Chicken Wrap', 8.99),
(10, 'Veggie Wrap', 7.99);

INSERT INTO Customers (Name, Address, ContactNumber)
VALUES
('Alice', '789 Oak St', '555-123-4567'),
('Bob', '321 Pine St', '555-987-6543'),
('Charlie', '567 Birch Rd', '555-654-7890'),
('Diana', '432 Walnut Ln', '555-321-9876'),
('Eve', '210 Cedar Ct', '555-444-2222'),
('Frank', '901 Maple St', '555-222-3333'),
('Grace', '567 Pine Ave', '555-888-9999'),
('Henry', '345 Cedar Blvd', '555-777-0000'),
('Isla', '789 Birch Ct', '555-111-8888'),
('Jack', '654 Chestnut St', '555-444-9999');

SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Orders (CustomerID, TotalAmount, Status)
VALUES
(1, 23.98, 'Preparing'),
(2, 11.98, 'Out for Delivery'),
(3, 30.96, 'Delivered'),
(4, 18.98, 'Cancelled'),
(5, 15.49, 'Pending'),
(6, 20.99, 'Delivered'),
(7, 27.49, 'Preparing'),
(8, 12.99, 'Out for Delivery'),
(9, 25.99, 'Delivered'),
(10, 10.99, 'Preparing');


INSERT INTO Order_Details (OrderID, MenuItemID, Quantity)
VALUES
(1, 1, 2), -- Alice orders 2 Margherita Pizzas
(1, 4, 1), -- Alice adds a Double Cheeseburger
(2, 3, 1), -- Bob orders Veggie Burger
(2, 6, 2), -- Bob adds 2 Avocado Rolls
(3, 7, 1), -- Charlie orders 1 Shrimp Taco
(3, 9, 2), -- Charlie adds 2 Lasagnas
(4, 10, 1), -- Diana orders 1 Ravioli
(5, 13, 3), -- Eve orders 3 Chicken Tikka Masalas
(6, 17, 2), -- Frank orders 2 Greek Salads
(6, 18, 1), -- Frank adds a Cheesecake
(7, 11, 1), -- Grace orders 1 BBQ Ribs
(7, 12, 1), -- Grace adds 1 Grilled Chicken
(8, 19, 1), -- Henry orders 1 Chicken Wrap
(8, 20, 1), -- Henry adds 1 Veggie Wrap
(9, 15, 1), -- Isla orders 1 Caesar Salad
(9, 16, 2), -- Isla adds 2 Greek Salads
(10, 8, 1), -- Jack orders 1 Fish Taco
(10, 14, 1), -- Jack adds 1 Paneer Butter Masala
(2, 5, 1), -- Bob adds 1 Dragon Roll
(3, 19, 1); -- Charlie adds 1 Chicken Wrap


INSERT INTO Delivery_Personnel (Name, ContactNumber)
VALUES
('John', '555-444-3333'),
('Sarah', '555-222-1111'),
('Mike', '555-999-8888'),
('Emma', '555-777-6666'),
('Liam', '555-111-0000'),
('Olivia', '555-888-2222'),
('Noah', '555-666-4444'),
('Ava', '555-333-5555'),
('Sophia', '555-000-9999'),
('James', '555-111-7777');

INSERT INTO Deliveries (OrderID, DeliveryPersonnelID, DeliveryDate, DeliveryStatus)
VALUES
(1, 1, '2024-11-28 12:30:00','Assigned'),
(2, 2, '2024-11-28 13:00:00','Delivered'),
(3, 3, '2024-11-28 14:00:00','Delivered'),
(4, 4, '2024-11-28 15:00:00','Failed'),
(5, 5, '2024-11-28 16:00:00','Assigned'),
(6, 6, '2024-11-28 17:00:00','Delivered'),
(7, 7, '2024-11-28 18:00:00','Assigned'),
(8, 8, '2024-11-28 19:00:00','Delivered'),
(9, 9, '2024-11-28 20:00:00','Delivered'),
(10, 10, '2024-11-28 21:00:00','Assigned');


-- 1 Retrieve all menu items sorted by price in descending order.
select * from menu_items order by price DESC;

-- 2 List all customers sorted by their name alphabetically.
SELECT * FROM customers ORDER BY Name;

-- 3 Fetch the top 5 orders with the highest total amount.
SELECT * FROM orders ORDER BY TotalAmount DESC LIMIT 5;

-- 4 List orders sorted by status (alphabetically) and then by total amount in ascending order.
SELECT * FROM orders ORDER BY Status, TotalAmount;

-- 5 Retrieve delivery personnel sorted by the number of deliveries they have completed, in descending order
SELECT DP.Name,COUNT(D.DeliveryID) as TotalDeliveries
 FROM delivery_personnel DP 
 INNER JOIN  deliveries D 
 ON DP.DeliveryID=D.DeliveryID
GROUP BY  DP.Name 
ORDER BY  TotalDeliveries DESC ;

-- 6 Find the total number of orders placed by each customer.
SELECT C.Name, count(O.OrderID) 
AS Total_order FROM customers C
INNER JOIN orders O ON C.CustomerID=O.CustomerID
GROUP BY  C.Name ;

-- 7 Calculate the total revenue generated by each restaurant.
SELECT R.Name,sum(M.Price*O.Quantity) AS Total_revenue
FROM  restaurants R
INNER JOIN menu_items M ON R.RestaurantID=M.RestaurantID
INNER JOIN order_details O ON  M.MenuItemID=O.MenuItemID
GROUP BY R.Name;

-- 8 Retrieve the number of menu items offered by each restaurant.
SELECT  R.Name,count(M.MenuItemID) AS MenuItemCount
FROM restaurants R
INNER JOIN menu_items M ON R.RestaurantID=M.RestaurantID
GROUP BY  R.Name;

-- 9 List the status of orders along with the count of orders for each status.
SELECT Status,count(OrderID) AS OrderCount
 FROM orders 
 GROUP BY Status
 ORDER BY OrderCount;
 
 -- 10 Find the average price of menu items for each restaurant.
 SELECT  R.Name,AVG(M.Price) AS AVG_MENU_PRICE
 FROM restaurants R
INNER JOIN menu_items M ON R.RestaurantID=M.RestaurantID
GROUP BY  R.Name;

-- 11 Find customers who have placed more than one order.
SELECT Name from customers where CustomerID IN (SELECT CustomerID FROM orders GROUP BY customerID having count(OrderID) >1 );

-- 12 Retrieve the details of the most expensive menu item.
SELECT * FROM menu_items where Price=(SELECT MAX(Price) from menu_items); 

-- 13 List all restaurants that have menu items priced above $15.
SELECT Name from restaurants where RestaurantID  IN (SELECT RestaurantID FROM menu_items where Price >15);

-- 14 Find orders where the total amount is greater than the average order total.
SELECT *
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

-- 15 Retrieve the names of customers who ordered all the items on the menu (using GROUP BY).
SELECT C.Name FROM customers C 
INNER JOIN orders O ON C.CustomerID=O.CustomerID
INNER JOIN order_details OD ON  O.OrderID=OD.OrderID
INNER JOIN menu_items M ON OD.MenuItemID=M.MenuItemID
GROUP BY C.Name
HAVING count(DISTINCT M.MenuItemID)=(SELECT count(*) FROM menu_items)  ;

-- 16 Display orders with a column indicating "High", "Medium", or "Low" based on the total amount.
SELECT OrderID,TotalAmount ,
CASE
 WHEN TotalAmount >50 THEN "High"
 WHEN TotalAmount BETWEEN 20 AND 50 THEN "Medium"
 ELSE "Low"
 END AS OrderCategory
 FROM orders;
 
 -- 17 Retrieve a list of all customers, indicating whether they have placed any orders ("Yes" or "No").
SELECT C.Name ,
CASE 
WHEN (SELECT COUNT(*) FROM Orders O WHERE O.CustomerID = C.CustomerID) > 0 THEN "YES"
ELSE "NO"
END "HasPlacedOrder"
FROM customers C;

-- 18 Classify menu items based on their price range.
SELECT Name,Price,
case
WHEN Price > 14 then "Premium"
WHEN Price BETWEEN 14  and 11.99 THEN "Standard"
ELSE "Budget"
END PriceCategory
FROM menu_items;

-- 19 Identify peak hours for order placement (hour with the most orders).
SELECT HOUR(O.OrderDate) AS OrderHour, COUNT(*) AS TotalOrders
FROM Orders O
GROUP BY OrderHour
ORDER BY TotalOrders DESC
LIMIT 1;




