INSERT INTO cars (VIN,manufacturer,model,year,color)
VALUES('3K096I98581DHSNUP ', 'Volkswagen', 'Tiguan', 2019 , 'Blue');

INSERT INTO cars (VIN,manufacturer,model,year,color)
VALUES('ZM8G7BEUQZ97IH46V ', 'Peugeot', 'Rifter', 2019 , 'Red');

INSERT INTO cars (VIN,manufacturer,model,year,color)
VALUES('RKXVNNIHLVVZOUB4M ', 'Ford', 'Fusion', 2018 , 'White');

INSERT INTO cars (VIN,manufacturer,model,year,color)
VALUES('HKNDGS7CU31E9Z7JW ', 'Toyota', 'RAV4', 2018 , 'Silver');

INSERT INTO cars (VIN,manufacturer,model,year,color)
VALUES('DAM41UDN3CHU2WVF6 ', 'Volvo', 'V60 Cross Country', 2019 , 'Gray');

USE lab_mysql;
SELECT * FROM cars;

INSERT INTO customers(idcustomer, name, phonenumber, email, address, state, country, zip)
VALUES('10001','Pablo Picasso','+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');

INSERT INTO customers(idcustomer, name, phonenumber, email, address, state, country, zip)
VALUES('20001','Abraham Lincoln','+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'USA', '33130');

INSERT INTO customers(idcustomer, name, phonenumber, email, address, state, country, zip)
VALUES('30001','Napoleon Bonaparte','+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

select * from customers;

INSERT INTO salespersons(idstaff,name,store)
VALUES('00001','Petey Cruiser','Madrid');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00002','Anna Sthesia','Barcelona');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00003','Paul Molive','Berlin');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00004','Gail Forcewind','Paris');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00005','Paige Turner','Mimia');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00006','Bob Frapples','Mexico City');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00007','Walter Melon','Amsterdam');

INSERT INTO salespersons(idstaff,name,store)
VALUES('00008','Shonda Leer	','São Paulo');

select * from salespersons;

INSERT INTO invoices(invoicenumber,date,car,customer,salesperson)
VALUES('852399038','2018-08-22','3K096I98581DHSNUP','20001','00003');

INSERT INTO invoices(invoicenumber,date,car,customer,salesperson)
VALUES('731166526','2018-12-31','RKXVNNIHLVVZOUB4M','10001','00005');

INSERT INTO invoices(invoicenumber,date,car,customer,salesperson)
VALUES('271135104','2019-01-22','ZM8G7BEUQZ97IH46V','30001','00007');

select * from invoices;
