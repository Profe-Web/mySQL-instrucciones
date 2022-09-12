-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clave_foranea_2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clave_foranea_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clave_foranea_2` DEFAULT CHARACTER SET utf8 ;
USE `clave_foranea_2` ;

-- -----------------------------------------------------
-- Table `clave_foranea_2`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clave_foranea_2`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clave_foranea_2`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clave_foranea_2`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clave_foranea_2`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clave_foranea_2`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `clientes_id` INT NOT NULL,
  `productos_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `clientes_id_idx` (`clientes_id` ASC) VISIBLE,
  INDEX `productos_id_idx` (`productos_id` ASC) VISIBLE,
  CONSTRAINT `clientes_id`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `clave_foranea_2`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productos_id`
    FOREIGN KEY (`productos_id`)
    REFERENCES `clave_foranea_2`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;

select * FROM pedidos;

INSERT INTO `clave_foranea_2`.`productos` (`nombre`, `precio`) VALUES ('cohete', '200');
INSERT INTO `clave_foranea_2`.`productos` (`nombre`, `precio`) VALUES ('casita', '120');
INSERT INTO `clave_foranea_2`.`productos` (`nombre`, `precio`) VALUES ('yate', '150');
INSERT INTO productos(nombre, precio)
VALUES('gnomo', '300');

INSERT INTO `clave_foranea_2`.`clientes` (`nombre`, `telefono`) VALUES ('Marcos', '4152689');
INSERT INTO `clave_foranea_2`.`clientes` (`nombre`, `telefono`) VALUES ('Maria', '6253985');
INSERT INTO `clave_foranea_2`.`clientes` (`nombre`, `telefono`) VALUES ('Zeus', '4857951');
INSERT INTO `clave_foranea_2`.`clientes` (`nombre`, `telefono`) VALUES ('Berto', '7485961');

INSERT INTO `clave_foranea_2`.`pedidos` (`fecha`, `clientes_id`, `productos_id`) VALUES ('2022-09-12', '1', '3');
INSERT INTO `clave_foranea_2`.`pedidos` (`fecha`, `clientes_id`, `productos_id`) VALUES ('2022-09-12', '2', '4');
INSERT INTO `clave_foranea_2`.`pedidos` (`fecha`, `clientes_id`, `productos_id`) VALUES ('2022-09-12', '3', '2');
INSERT INTO `clave_foranea_2`.`pedidos` (`fecha`, `clientes_id`, `productos_id`) VALUES ('2022-09-12', '4', '1');

UPDATE `clave_foranea_2`.`pedidos` SET `fecha` = '2020-04-10' WHERE (`id` = '3');
UPDATE `clave_foranea_2`.`pedidos` SET `fecha` = '2015-12-31' WHERE (`id` = '4');
UPDATE `clave_foranea_2`.`pedidos` SET `fecha` = '2019-03-06' WHERE (`id` = '5');

SELECT clientes.nombre AS cliente, productos.nombre AS producto, fecha FROM pedidos
LEFT JOIN clientes ON clientes_id = clientes.id
LEFT JOIN productos ON productos_id = productos.id
ORDER BY cliente
;

INSERT INTO `clave_foranea_2`.`pedidos` (`fecha`, `clientes_id`, `productos_id`) VALUES ('2014-06-10', '1', '2');


SELECT * FROM pedidos;


