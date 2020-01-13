/* CARS SEED */
INSERT INTO Stores (name, country)
VALUES ("Suc. Madrid", "Spain");

INSERT INTO Stores (name, country)
VALUES ("Suc. Barcelona", "Spain");

INSERT INTO Stores (name, country)
VALUES ("Suc. Berlin", "Germany");

INSERT INTO Stores (name, country)
VALUES ("Suc. Paris", "France");

INSERT INTO Stores (name, country)
VALUES ("Suc. Mimia", "Spain");

INSERT INTO Stores (name, country)
VALUES ("Suc. Mexico City", "Mexico");

INSERT INTO Stores (name, country)
VALUES ("Suc. Amsterdam", "Netherlands");

INSERT INTO Stores (name, country)
VALUES ("Suc. São Paulo", "Brazil");

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue", 4);

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "Red", 1);

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White", 8);

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "Silver", 6);

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "Gray", 1);

INSERT INTO Cars (vin, manufacturer, model, year, color, Stores_id)
VALUES ("DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray", 1);


/* CUSTOMERS SEED */
INSERT INTO Customers (name, last_name, phone, address, city, state, country, zip_code)
VALUES ("Pablo", "Picaso", "+34 636 17 63 82", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045);

INSERT INTO Customers (name, last_name, phone, address, city, state, country, zip_code)
VALUES ("Abraham", "Lincoln", "+1 305 907 7086", "120 SW 8th St", "Miami", "Florida", "United States", 33130);

INSERT INTO Customers (name, last_name, phone, address, city, state, country, zip_code)
VALUES ("Napoléon", "Bonaparte", "+33 1 79 75 40 00", "40 Rue du Colisée", "Paris", "Île-de-France", "France", 75008);


/* SALESPERSON SEED */
INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Petey", "Cruiser", 1);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Anna", "Sthesia", 2);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Paul", "Molive", 3);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Gail", "Forcewind", 4);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Paige", "Turner", 5);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Bob", "Frapples", 6);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Walter", "Melon", 7);

INSERT INTO Salespersons (name, last_name, Stores_id)
VALUES ("Shonda", "Leer", 8);


/* INVOICES SEED */
INSERT INTO Invoices (date, Cars_id, Customers_id, Salespersons_id, Stores_id)
VALUES ("2018-08-22", 1, 2, 4, 4);

INSERT INTO Invoices (date, Cars_id, Customers_id, Salespersons_id, Stores_id)
VALUES ("2018-12-31", 4, 1, 6, 6);

INSERT INTO Invoices (date, Cars_id, Customers_id, Salespersons_id, Stores_id)
VALUES ("2019-01-22", 3, 3, 8, 8);