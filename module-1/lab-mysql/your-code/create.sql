USE lab_mysql;

create table car (VIN varchar(17), manufacturer varchar(20), model varchar(20), year smallint, color varchar(20));

create table customers (Cust_id int(11), name varchar(40), phone int(13), email varchar(40), address tinytext, city tinytext, state varchar, country varchar, zip int(11));

create table salespersons (Staff_id int(11), name varchar(40), store varchar(20));

create table invoices (Invoice_id int(11), date date, VIN varchar(17), Cust_id int(11), Staff_id int(11));