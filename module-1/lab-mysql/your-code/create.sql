-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(18) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` SMALLINT NULL,
  `color` VARCHAR(45) NULL,
  `Stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cars_Stores1_idx` (`Stores_id` ASC),
  CONSTRAINT `fk_Cars_Stores1`
    FOREIGN KEY (`Stores_id`)
    REFERENCES `lab_mysql`.`Stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salespersons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `Stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Salespersons_Stores1_idx` (`Stores_id` ASC),
  CONSTRAINT `fk_Salespersons_Stores1`
    FOREIGN KEY (`Stores_id`)
    REFERENCES `lab_mysql`.`Stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `Customers_id` INT NOT NULL,
  `Salespersons_id` INT NOT NULL,
  `Cars_id` INT NOT NULL,
  `Stores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Invoices_Customers_idx` (`Customers_id` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_id` ASC),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_id` ASC),
  INDEX `fk_Invoices_Stores1_idx` (`Stores_id` ASC),
  CONSTRAINT `fk_Invoices_Customers`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `lab_mysql`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_id`)
    REFERENCES `lab_mysql`.`Salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_id`)
    REFERENCES `lab_mysql`.`Cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Stores1`
    FOREIGN KEY (`Stores_id`)
    REFERENCES `lab_mysql`.`Stores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
