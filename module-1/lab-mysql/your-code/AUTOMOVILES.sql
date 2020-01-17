


mysql -u root -p

CREATE DATABASE AUTOMOV;
USE AUTOMOV;

CREATE TABLE clientes (ID_CLIENTE VARCHAR(30), NOMBRE VARCHAR(30), TEL VARCHAR(30),MAIL VARCHAR(30), DIRECCION VARCHAR(30), ID_AUTO VARCHAR(30));
DESC clientes;

CREATE TABLE facturas (ID_FACTURA VARCHAR(30), FECHA DATE, ID_AUTO VARCHAR(30), ID_CLIENTE VARCHAR(30), ID_VENDEDOR VARCHAR(30));
DESC facturas;

CREATE TABLE coches (ID_AUTO VARCHAR(30), FABRICANTE VARCHAR(30), MODELO VARCHAR(30), COLOR VARCHAR(30));
DESC coches;

CREATE TABLE vendedores (ID_VENDEDOR VARCHAR(30), NOMBRE VARCHAR(30), TIENDA VARCHAR(30));
DESC vendedores;


INSERT INTO AUTOMOV.clientes VALUES
("10001",'Pablo Picasso', "34636 17 63 82", "pablo2gmail.com", 	"Paseo de la Chopera 14", "3K096I98581DHSNUP");
("20001",'Abraham Lincoln', "31 305 907 7086", "abraham@gmail.com", 	"120 SW 8th St", "ZM8G7BEUQZ97IH46V	");
("30001",'Napoleón Bonaparte', "33 1 79 75 40 00", "napo@gmail.com", 	"40 Rue du Colisée", "RKXVNNIHLVVZOUB4M");

SELECT * FROM AUTOMOV.clientes;


INSERT INTO AUTOMOV.facturas VALUES
("852399038",22-08-2018, "0 0", "20001",	"00001");
("731166526",31-12-2018, "1", "20001",	"00002");
("271135104",22-01-2019, "2", "20001",	"00003");

SELECT * FROM AUTOMOV.facturas;


INSERT INTO AUTOMOV.coches VALUES
("0 0", "Volkswagen", "Tiguan",	"Azul");
("1", "Peugeot", "Rifter",	"rojo");
("2","Vado", "Fusión1",	"Blanco");
("3","Toyota", "RAV4",	"Plata");
("44","Volvo", "V60",	"gris");
("55","Volvo", "V60 Cross Country	",	"gris");

SELECT * FROM AUTOMOV.coches;


INSERT INTO AUTOMOV.vendedores VALUES
("00001", "Crucero Petey", "Madrid");
("00002", "Anna Sthesia", "Barcelona");
("00003", "Paul Molive", "Berlina");
("00004", "Gail Forcewind", "París");
("00005", "Paige Turner", "Miami");
("00006", "Bob Frapples", "Ciudad de mexico");
("00007", "Walter Melon", "Amsterdam");
("00008", "VShonda Leer", "Sao Paulo");

SELECT * FROM AUTOMOV.vendedores;
