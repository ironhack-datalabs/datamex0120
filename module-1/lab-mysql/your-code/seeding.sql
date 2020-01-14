use lab_mysql;


-- create table Cars (Id INT, VIN VARCHAR(40), Manufacturer VARCHAR(40), Model VARCHAR(40), Year DATETIME, Color VARCHAR(20));
-- alter table cars change YearCar YearCar INT;

insert into Cars (Id, VIN, Manufacturer, Model, YearCar, Color)
values
    (0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
 	(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
 	(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
 	(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
 	(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
 	(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

-- create table Customers (Id INT, CUSTOMER_ID INT, Name VARCHAR(40), Phone TEXT, Email VARCHAR(30), Address TEXT, City TEXT, State TEXT, Country TEXT, Postal INT);
 
insert into Customers (Id, CUSTOMER_ID, Name, Phone, Email, Address, City, State, Country, Postal)  
values
    (0, 10001, 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
 	(1, 20001,	'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
 	(2, 30001, 'Napoléon Bonaparte','+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);


 -- create table Salespersons (Id INT, STAFF_ID INT, Name VARCHAR(40), Store TEXT);

insert into Salespersons (Id, STAFF_ID, Name, Store)
values
    (0, 00001, 'Petey Cruiser', 'Madrid'),
 	(1, 00002, 'Anna Sthesia', 'Barcelona'),
 	(2, 00003, 'Paul Molive', 'Berlin'),
 	(3, 00004, 'Gail Forcewind', 'Paris'),
 	(4, 00005, 'Paige Turner', 'Mimia'),
 	(5, 00006, 'Bob Frapples', 'Mexico City'),
 	(6, 00007, 'Walter Melon', 'Amsterdam'),
 	(7, 00008, 'Shonda Leer', 'São Paulo');

-- create table Invoices (Id INT, INVOICE_NUMBER INT, Dateinvoice DATETIME, Car INT, Customer INT, Sales_person INT);	
-- alter table invoices change Dateinvoice Dateinvoice DATE;				

insert into Invoices (Id, INVOICE_NUMBER, Dateinvoice, Car, Customer, Sales_person)
values
    (0, 852399038,	'2018-08-22', 0, 1,	3),
 	(1, 731166526,	'2018-12-31', 3, 0,	5),
 	(2, 271135104,	'2019-01-22', 2, 2,	7);

