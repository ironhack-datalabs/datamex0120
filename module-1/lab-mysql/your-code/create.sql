-- Crear la base de datos y seleccionar
-- create database lab_mysql;
-- use lab_mysql;

create table Cars (Id INT, VIN VARCHAR(40), Manufacturer VARCHAR(40), Model VARCHAR(40), Year DATETIME, Color VARCHAR(20));
create table Customers (Id INT, CUSTOMER_ID INT, Name VARCHAR(40), Phone TEXT, Email VARCHAR(30), Address TEXT, City TEXT, State TEXT, Country TEXT, Postal INT);
create table Salespersons (Id INT, STAFF_ID INT, Name VARCHAR(40), Store TEXT);
create table Invoices (Id INT, INVOICE_NUMBER INT, Dateinvoice DATETIME, Car INT, Customer INT, Sales_person INT);






