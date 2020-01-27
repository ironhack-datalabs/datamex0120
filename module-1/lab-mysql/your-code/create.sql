CREATE DATABASE lab_mysql;

USE lab_mysql;

CREATE TABLE cars
(vin INT NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
model VARCHAR(30) NOT NULL,
model_year INT,
color VARCHAR(20),
price FLOAT,
PRIMARY KEY (vin));

CREATE TABLE salespersons
(staff_id INT NOT NULL,
salesperson_name VARCHAR(45) NOT NULL,
store VARCHAR(30) NOT NULL,
PRIMARY KEY (staff_id));

CREATE TABLE customers
(customer_id INT NOT NULL,
customer_name VARCHAR(45) NOT NULL,
phone VARCHAR(20) NULL,
email VARCHAR(20) NULL,
address VARCHAR(45) NOT NULL,
city VARCHAR (25) NOT NULL,
state_province VARCHAR(25) NOT NULL,
country VARCHAR(25) NOT NULL,
postal VARCHAR(15) NOT NULL,
PRIMARY KEY(customer_id));

CREATE TABLE invoices
(invoice_number INT NOT NULL,
invoice_date DATE NOT NULL,
car INT NOT NULL,
customer INT NOT NULL,
sales_person INT NOT NULL,
PRIMARY KEY(invoice_number),
FOREIGN KEY (car) REFERENCES cars(vin),
FOREIGN KEY (customer) REFERENCES customers(customer_id),
FOREIGN KEY (sales_person) REFERENCES salespersons(staff_id));