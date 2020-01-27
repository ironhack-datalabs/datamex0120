USE lab_mysql;
#SEEDING cars
INSERT INTO cars VALUES(234565, 'Volkswagen', 'Tiguan', 2019, 'Blue', 25000);
INSERT INTO cars VALUES(234300, 'Peugeot', 'Rifter', 2019, 'Red', 25500);
INSERT INTO cars VALUES(235098, 'Ford', 'Fusion', 2018, 'White', 30000);
INSERT INTO cars VALUES(235500, 'Toyota', 'RAV4', 2018, 'Silver', 40000);
INSERT INTO cars VALUES(240600, 'Volvo', 'V60', 2019, 'Gray', 26000);
INSERT INTO cars VALUES(245689, 'Volvo', 'V60 Cross Country', 2019, 'Gray', 26500);
#SEEDING customers
INSERT INTO customers VALUES(10001, 'Pablo Picasso', '+34 636 17 63 82', null, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid','Spain',28045);
INSERT INTO customers VALUES(20001, 'Abraham Lincoln', '+1 305 907 7086', null, '120 SW 8th St', 'Miami', 'Florida','United States',33130);
INSERT INTO customers VALUES(30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', null, '40 Rue du Colisée', 'Paris','Île-de-France', 'France', 75008);
#SEEDING salespersons
INSERT INTO salespersons VALUES(00001, 'Petey Cruiser', 'Madrid');
INSERT INTO salespersons VALUES(00002, 'Anna Sthesia', 'Barcelona');
INSERT INTO salespersons VALUES(00003, 'Paul Molive', 'Berlin');
INSERT INTO salespersons VALUES(00004, 'Gail Forcewind', 'Paris');
INSERT INTO salespersons VALUES(00005, 'Paige Turner', 'Mimia');
INSERT INTO salespersons VALUES(00006, 'Bob Frapples', 'Mexico City');
INSERT INTO salespersons VALUES(00007, 'Walter Melon', 'Amsterdam');
INSERT INTO salespersons VALUES(00008, 'Shonda Leer', 'São Paulo');
#SEEDING invoices
INSERT INTO invoices VALUES(852399038, '2018-08-22', 235098,30001,3);
INSERT INTO invoices VALUES(731166526, '2018-08-22', 235500,20001,5);
INSERT INTO invoices VALUES(271135104, '2018-08-22', 245689,30001,7);