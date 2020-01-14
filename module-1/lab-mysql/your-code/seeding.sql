
INSERT INTO tabla (columna1,columna2,columna3) VALUES (Dato_columna1,Dato_columna2,Dato_columna3),
(Dato_columna1,Dato_columna2,Dato_columna3),
(Dato_columna1,Dato_columna2,Dato_columna3);


insert into cars (ID_car, VIN,Manufacturer,model,year,color) values ('1','3K096I98581DHSNUP','Volkswagen','Tiguan','2019','Blue'),
('2','ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),
('3','RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White'),
('4','HKNDGS7CU31E9Z7JW','Toyota','RAV4','2018','Silver'),
('5','DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray'),
('6','DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019','Gray');


#Arreglando tabla customers.. FALTABA el nombre...
alter table customers
add name VARCHAR(15) after ID_customer;

select * from customers;

#Inserting customers...
insert into customers (ID_customer,name,phone,e_mail,address,city,province,country,zip_code) values ('10001','Pablo Picasso','+34 636 17 63 82',null,'Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045'),
('20001','Abraham Lincoln','+1 305 907 7086',null,'120 SW 8th Street','Miami','Florida','United States','33130'),
('30001','Napoléon Bonap','+33 1 79 75 40 00',null,'40 Rue du Colisée','Paris','Île-de-France','France','75008');

select * from sales;

#Inserting sales personnel
insert into sales (id_salesperson,name,store) values('00001','Petey Cruiser','Madrid'),
('00002','Anna Sthesia','Barcelona'),
('00003','Paul Molive','Berlin'),
('00004','Gail Forcewind','Paris'),
('00005','Paige Turner','Miami'),
('00006','Bob Frapples','Mexico City'),
('00007','Walter Melon','Amsterdam'),
('00008','Shonda Leer','São Paulo');


select * from sales;

alter table invoices change column ID_costumer ID_customer int (10) NOT NULL;


#Inserting invoices...
insert into invoices (ID_invoice,number_invoice,date,ID_car,ID_customer,ID_salesperson) values ('1','852399038','2018-08-22','1','10001','00004'),
('2','731166526','2018-12-31','4','10001','00007'),
('3','271135104','2019-01-22','3','30001','00007');

#Bonus Challenge - Updating and Deleting Database Records
#Updating
update customers
set e_mail = 'ppicasso@gmail' WHERE ID_customer = '10001';

update customers
set e_mail = 'lincoln@us.gov' WHERE ID_customer = '20001';

update customers
set e_mail = 'hello@napoleon' WHERE ID_customer = '30001';
    
select * from customers;

#Deleting
delete from cars where ID_car='6';

select * from cars;


