# Grocery Management Database Project

## Overview
This project is a SQL-based database system for managing a grocery store's inventory, suppliers, customers, sales, orders, and employees. The database includes several tables such as `product`, `category`, `supplier`, `customer`, `sale`, `order_table`, and `employee`, along with triggers to enforce business rules and data integrity.

## Database Schema
The database schema includes the following tables:
1. **Product**: Stores information about products.
2. **Category**: Stores product categories.
3. **Supplier**: Stores information about suppliers.
4. **Customer**: Stores customer information.
5. **Sale**: Records sales transactions.
6. **Order Table**: Records orders from suppliers.
7. **Employee**: Stores information about employees.

## Setup Instructions
To set up and use this database, follow these steps:

### Prerequisites
- MySQL installed on your machine
- MySQL Workbench (optional but recommended)

### Creating the Database and Tables
1. Open MySQL Workbench or your preferred SQL client.
2. Create the database and use it:
   ```sql
   CREATE DATABASE grocery_management;
   USE grocery_management;
