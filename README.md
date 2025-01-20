The Food Delivery Management System is a database project designed to streamline food order management for restaurants, customers, and delivery personnel. This system ensures efficient tracking of orders, menu management, and deliveries, making food delivery operations smoother and more organized.

## Features

- **Restaurant Management**: Store and manage information about restaurants and their contact details.
- **Menu Management**: Maintain a menu with prices linked to specific restaurants.
- **Customer Management**: Record and organize customer details.
- **Order Management**: Track orders, including order status and detailed item breakdowns.
- **Delivery Tracking**: Assign delivery personnel and monitor delivery statuses.


## How to Use

1. **Set Up the Database**:
   - Run the provided SQL script to create the database and tables.
   - Populate tables with sample or real data.
2. **Query the Database**:
   - Use the provided queries to retrieve, update, or analyze data.
3. **Modify as Needed**:
   - Customize table structures or queries to suit specific requirements.
  
  
## Database Design

The project is built using SQL with the following key tables:

1. **Restaurants**

   - Fields: `RestaurantID`, `Name`, `Address`, `ContactNumber`
   - Purpose: Stores restaurant details.

2. **Menu\_Items**

   - Fields: `MenuItemID`, `RestaurantID`, `Name`, `Price`
   - Purpose: Maintains the menu items linked to restaurants.

3. **Customers**

   - Fields: `CustomerID`, `Name`, `ContactNumber`, `Email`, `Address`
   - Purpose: Tracks customer details.

4. **Orders**

   - Fields: `OrderID`, `CustomerID`, `OrderDate`, `Status`
   - Purpose: Manages order information and statuses.

5. **Order\_Details**

   - Fields: `OrderDetailID`, `OrderID`, `MenuItemID`, `Quantity`
   - Purpose: Provide itemized details for each order.

6. **Delivery\_Personnel**

   - Fields: `DeliveryID`, `Name`, `ContactNumber`, `Status`
   - Purpose: Tracks delivery staff availability and assignments.

7. **Deliveries**

   - Fields: `DeliveryID`, `OrderID`, `AssignedTo`, `DeliveryStatus`
   - Purpose: Links orders with delivery personnel and tracks their progress.

## Tools and Technologies Used

- **Database System**: MySQL
- **SQL Features**: DDL (Data Definition Language), DML (Data Manipulation Language), and relationships using foreign keys.
- **Data Management**: Relational database principles for efficient and organized data storage.

## Key Results and Insights

- A fully functional relational database for managing food delivery operations.
- Simplifies restaurant menu updates and customer order tracking.
- Provides clear records of delivery statuses and personnel assignments.

## Analysis Overview

- **Dataset**: The database contains detailed records of restaurants, menu items, customers, orders, and delivery personnel.
- **Scope**: Analysis focuses on the relationship between orders, delivery assignments, and operational efficiency.
- **Methodology**: SQL queries were used to explore and visualize data trends, such as order distribution and delivery performance.

## Results

- Most frequent orders originate from specific restaurants offering popular cuisines.
- Average delivery times and order fulfillment rates were identified for performance benchmarking.
- Customer satisfaction levels improved by tracking and reducing delivery delays.

## Conclusion

The project successfully demonstrates the use of SQL to build a robust database for managing food delivery systems. It highlights the potential for improving operational efficiency through data analysis and structured database management. Future enhancements can further streamline processes and integrate advanced analytics.



 ## Challenges Addressed

- Streamlined the process of linking orders to delivery personnel.
- Ensured data consistency through foreign key constraints.
- Created an efficient structure for managing multiple restaurants and menus.


## Connect with Me

This project reflects my skills in SQL and database design. Feel free to explore the code and reach out for collaborations or feedback:

- **GitHub Repository**: [Link to be added]
- **LinkedIn**: [www.linkedin.com/in/sheikh-muskan-359937209]

