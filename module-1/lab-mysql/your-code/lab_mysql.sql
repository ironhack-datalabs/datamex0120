CREATE TABLE `lab_mysql`.`cars` (
  `VIN` VARCHAR(18) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN`));

CREATE TABLE `lab_mysql`.`customers` (
  `idcustomer` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `phonenumber` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`idcustumer`));

CREATE TABLE `lab_mysql`.`salespersons` (
  `idstaff` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idstaff`));

CREATE TABLE `lab_mysql`.`invoices` (
  `invoicenumber` VARCHAR(15) NOT NULL,
  `date` DATE NULL,
  `car` VARCHAR(18) NULL,
  `customer` VARCHAR(10) NULL,
  `salesperson` VARCHAR(10) NULL,
  PRIMARY KEY (`invoicenumber`),
  FOREIGN KEY(car) REFERENCES cars(VIN),
  FOREIGN KEY(customer) REFERENCES customers(idcustomer),
  FOREIGN KEY(salesperson) REFERENCES salespersons(idstaff));

