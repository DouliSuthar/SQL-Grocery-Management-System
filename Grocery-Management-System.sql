CREATE DATABASE grocery_management;
USE grocery_management;
-- Create CATEGORY table
CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200)
);

-- Create PRODUCT table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    category_id INT,
    price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Create SUPPLIER table
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    contact_details VARCHAR(200)
);

-- Create CUSTOMER table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    contact_details VARCHAR(200),
    email VARCHAR(100)
);

-- Create SALE table
CREATE TABLE sale (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    total_amount DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Create ORDER_TABLE table
CREATE TABLE order_table (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    total_cost DECIMAL(10, 2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- Create EMPLOYEE table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    contact_details VARCHAR(200),
    role VARCHAR(100),
    worked_hours INT
);
-- Insert data into CATEGORY table
INSERT INTO category (name) VALUES
('Fruits'),
('Vegetables'),
('Dairy'),
('Bakery'),
('Meat'),
('Beverages');

-- Insert data into PRODUCT table
INSERT INTO product (name, category_id, price, quantity) VALUES
('Apple', 1, 2.5, 100),
('Tomato', 2, 1.0, 150),
('Banana', 1, 1.5, 120),
('Potato', 2, 0.8, 200),
('Cheese', 3, 3.0, 40),
('Cookies', 6, 2.5, 60),
('Milk', 3, 1.5, 50),
('Bread', 4, 2.0, 75),
('Chicken', 5, 5.0, 30),
('Water', 6, 1.0, 200);

-- Insert data into SUPPLIER table
INSERT INTO supplier (name, contact_details) VALUES
('Fresh Farms', '123-456-7890'),
('Green Grocers', '987-654-3210'),
('Frozen Delights Co.', '444-555-6666'),
('Canned Connections', '777-888-9999'),
('Clean & Shine Distributors', '123-456-7890'),
('Care Essentials Ltd.', '987-654-3210'),
('Dairy Delight', '456-789-0123');

-- Insert data into CUSTOMER table
INSERT INTO customer (name, contact_details, email) VALUES
('Alice', '111-222-3333', 'alice@email.com'),
('Bob', '444-555-6666', 'bob@email.com'),
('David', '555-444-3333', 'david@email.com'),
('Emily', '777-666-5555', 'emily@email.com'),
('Frank', '999-888-7777', 'frank@email.com'),
('Grace', '111-000-9999', 'grace@email.com'),
('Henry', '222-111-0000', 'henry@email.com'),
('Ivy', '333-222-1111', 'ivy@email.com'),
('Jack', '444-333-2222', 'jack@email.com'),
('Charlie', '777-888-9999', 'charlie@email.com');

-- Insert data into SALE table
INSERT INTO sale (date, total_amount, customer_id) VALUES
('2023-01-15', 25.0, 1),
('2023-02-20', 15.0, 2),
('2023-04-05', 12.0, 4),
('2023-05-10', 18.0, 6),
('2023-06-15', 24.0, 8),
('2023-07-20', 30.0, 10),
('2023-08-25', 22.0, 2),
('2023-09-30', 14.0, 1),
('2023-10-05', 26.0, 3),
('2023-03-10', 30.0, 3);

-- Insert data into ORDER_TABLE table
INSERT INTO order_table (date, total_cost, supplier_id) VALUES
('2023-01-05', 50.0, 1),
('2023-02-08', 40.0, 2),
('2023-04-01', 60.0, 1),
('2023-05-05', 45.0, 2),
('2023-06-10', 35.0, 3),
('2023-07-15', 40.0, 4),
('2023-08-20', 55.0, 5),
('2023-09-25', 30.0, 1),
('2023-10-30', 48.0, 2),
('2023-03-15', 35.0, 3);

-- Insert data into EMPLOYEE table
INSERT INTO employee (name, contact_details, role, worked_hours) VALUES
('Manager Mike', '999-888-7777', 'Manager', 40),
('Clerk Carol', '666-555-4444', 'Clerk', 30),
('Robert', '789-012-3456', 'Stock Clerk', 35),
('Olivia', '234-567-8901', 'Assistant Manager', 38),
('William', '567-890-1234', 'Clerk', 28),
('Ava', '890-123-4567', 'Cashier', 30),
('Michael', '456-789-0123', 'Stock Clerk', 35),
('Sophia', '789-012-3456', 'Manager', 40),
('Ethan', '345-678-9012', 'Clerk', 30),
('Cashier Chris', '333-222-1111', 'Cashier', 25);

-- Retrieve all customers
SELECT * FROM customer;

-- Retrieve all categories
SELECT * FROM category;

-- Retrieve all suppliers
SELECT * FROM supplier;

-- Retrieve all sales
SELECT * FROM sale;

-- Retrieve all orders
SELECT * FROM order_table;

-- Retrieve all employees
SELECT * FROM employee;

-- AND
SELECT * FROM product WHERE price BETWEEN 2.0 AND 4.0;

-- OR
SELECT * FROM product WHERE category_id = 1 OR category_id = 2;

-- IN
SELECT * FROM order_table WHERE supplier_id IN (1, 3, 5);

-- NOT IN
SELECT customer_id, name FROM customer WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM sale);

-- BETWEEN
SELECT * FROM sale WHERE date BETWEEN '2023-06-01' AND '2023-09-01';

-- ORDER BY
SELECT * FROM customer ORDER BY name ASC;

-- LIKE
SELECT * FROM customer WHERE name LIKE 'A%';

-- LIMIT
SELECT * FROM product LIMIT 5;

-- OFFSET
SELECT * FROM product LIMIT 5 OFFSET 5;

-- SUM
SELECT SUM(total_amount) AS total_sales_amount FROM sale;

-- AVG
SELECT AVG(total_amount) AS average_sales_amount FROM sale;

-- MAX
SELECT MAX(total_amount) AS max_sale_amount FROM sale;

-- MIN
SELECT MIN(total_amount) AS min_sale_amount FROM sale;

-- INNER JOIN
SELECT product.product_id, product.name AS product_name, category.name AS category_name
FROM product
INNER JOIN category ON product.category_id = category.category_id;

-- LEFT JOIN
SELECT s.*, c.name AS customer_name
FROM sale s
LEFT JOIN customer c ON s.customer_id = c.customer_id;

-- RIGHT JOIN
SELECT product.name, category.name AS category_name
FROM product
RIGHT JOIN category ON product.category_id = category.category_id;

-- Update email of a customer
UPDATE customer
SET email = 'david.new@email.com'
WHERE customer_id = 3;

-- Retrieve updated customer
SELECT * FROM customer;

-- Subquery to get products in the 'Dairy' category
SELECT *
FROM product
WHERE category_id = (SELECT category_id FROM category WHERE name = 'Dairy');

-- Delete a product
DELETE FROM product WHERE product_id = 6;

-- Retrieve updated product list
SELECT * FROM product;

-- BEFORE INSERT Trigger
DELIMITER //
CREATE TRIGGER before_sale_insert
BEFORE INSERT ON sale
FOR EACH ROW
BEGIN
    IF NEW.total_amount > 50.0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total amount should not exceed $50';
    END IF;
END //
DELIMITER ;

-- AFTER INSERT Trigger
DELIMITER //
CREATE TRIGGER update_product_quantity
AFTER INSERT ON sale
FOR EACH ROW
BEGIN
    UPDATE product
    SET quantity = quantity - 1
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- BEFORE UPDATE Trigger
DELIMITER //
CREATE TRIGGER before_product_update
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    -- Check if the updated quantity will be negative
    IF NEW.quantity < 0 THEN
        -- Prevent the update
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Quantity cannot be set to a negative value';
    END IF;
END //
DELIMITER ;

-- AFTER UPDATE Trigger
DELIMITER //
CREATE TRIGGER update_product_quantity_after_sale
AFTER INSERT ON sale
FOR EACH ROW
BEGIN
    UPDATE product
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- BEFORE DELETE Trigger
DELIMITER //
CREATE TRIGGER before_delete_customer
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    DECLARE customer_sales INT;
    -- Check if the customer being deleted has any associated sales
    SELECT COUNT(*) INTO customer_sales
    FROM sale
    WHERE customer_id = OLD.customer_id;
    -- If there are sales associated with the customer, prevent deletion
    IF customer_sales IS NOT NULL AND customer_sales > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete customer. Sales are associated.';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE Trigger
DELIMITER //
CREATE TRIGGER after_delete_sale
AFTER DELETE ON sale
FOR EACH ROW
BEGIN
    DECLARE customer_total DECIMAL(10, 2);
    -- Get the total amount of sales for the deleted customer
    SELECT SUM(total_amount) INTO customer_total
    FROM sale
    WHERE customer_id = OLD.customer_id;
    -- Update the customer's total sales in the customer table
    UPDATE customer
    SET total_sales = customer_total
    WHERE customer_id = OLD.customer_id;
END //
DELIMITER ;
