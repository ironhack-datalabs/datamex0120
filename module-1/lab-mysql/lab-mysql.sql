use lab_mysql;
create table Cars (VIN VARCHAR(25) primary key, Manufacturer VARCHAR(25),Model VARCHAR(25), Year INT, Color text);
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('3K096I98581DHSNUP','Volskwagen','Tiguan',2019,'Blue');
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red');
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver');
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Grey');
insert into cars (VIN, Manufacturer,Model,Year, Color) values ('DAM41UDN3CHU2WVF7','Volvo','V60 Cross Country',2019,'Grey');
delete VIN from table cars where model = 'V60 Cross country';
create table Customers (Customer_ID INT primary key,Name text,Phone_number bigint,Email VARCHAR(25),Address VARCHAR(25),City text,State_Province text,Country text,Zip_Postal_Code int)
insert into Customers (Customer_ID,Name,Phone_number,Email,Address,City,State_Province,Country,Zip_Postal_Code) values (10001,'Pablo Picasso',34636176382,'-','Paseo de la Chopera 14','Madrid','Madrid','Spain',28045);
insert into Customers (Customer_ID,Name,Phone_number,Address,City,State_Province,Country,Zip_Postal_Code) values (20001,'Abraham Lincoln',13059077086,'120 SW 8th St','Miami','Florida','United States',33130);
insert into Customers (Customer_ID,Name,Phone_number,Address,City,State_Province,Country,Zip_Postal_Code) values (30001,'Napoleon Bonaparte',33179754000,'40 Rue du Colisée','Paris','Île-de-France','France',75008);
create table Sales_Persons (Staff_ID INT primary key,Name text,Store_ID INT) 
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0001,'Petey Cruiser','Madrid');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0002,'Anna Sthesia','Barcelona');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0003,'Paul Molive','Berlin');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0004,'Gail Forcewind','Paris');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0005,'Paige Turner','Mimia');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0006,'Bob Frapples','Mexico City');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0007,'Walter Melon', 'Amsterdam');
insert into Sales_persons (Staff_ID,Name,Store_ID) values (0008,'Shonda Leer','Sao Paulo');
create table Invoices (Invoice_number int primary key,date VARCHAR(20),Car INT,Customer INT,Sales_Person int);
insert into Invoices (Invoice_number,date,Car,Customer,Sales_Person) values (852399038,'22-08-2018',0,1,3);
insert into Invoices (Invoice_number,date,Car,Customer,Sales_Person) values (731166526,'31-12-2018',3,0,5);
insert into Invoices (Invoice_number,date,Car,Customer,Sales_Person) values (271135104,'22-01-2019',2,2,7);