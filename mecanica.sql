
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mecanica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mecanica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mecanica` DEFAULT CHARACTER SET utf8 ;
USE `mecanica` ;

-- -----------------------------------------------------
-- Table `mecanica`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Cpf` VARCHAR(45) NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanica`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Mecanico` (
  `idMecanico` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanica`.`Ordem de Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Ordem de Servico` (
  `idOrdem de Servico` INT NOT NULL,
  `Data` DATETIME NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  `Veiculos_idVeiculos` INT NOT NULL,
  `Veiculos_Clientes_idClientes` INT NOT NULL,
  `Tipo Servico` VARCHAR(45) NULL,
  `Data Entrega` DATETIME NULL,
  `Valor` FLOAT NULL,
  `Order de Servicocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrdem de Servico`, `Mecanico_idMecanico`, `Veiculos_idVeiculos`, `Veiculos_Clientes_idClientes`),
  INDEX `fk_Order de Servico_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  INDEX `fk_Order de Servico_Veiculos1_idx` (`Veiculos_idVeiculos` ASC, `Veiculos_Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Order de Servico_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mecanica`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order de Servico_Veiculos1`
    FOREIGN KEY (`Veiculos_idVeiculos` , `Veiculos_Clientes_idClientes`)
    REFERENCES `mecanica`.`Veiculos` (`idVeiculos` , `Clientes_idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanica`.`Serviços e Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Serviços e Peças` (
  `idServiços e Peças` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  `Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idServiços e Peças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanica`.`Serviços e Peças da OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Serviços e Peças da OS` (
  `Ordem de Servico_idOrder de Servico` INT NOT NULL,
  `Ordem de Servico_Mecanico_idMecanico` INT NOT NULL,
  `Ordem de Servico_Veiculos_idVeiculos` INT NOT NULL,
  `Ordem de Servico_Veiculos_Clientes_idClientes` INT NOT NULL,
  `Serviços e Peças_idServiços e Peças` INT NOT NULL,
  `Quantidade` INT NULL,
  `Serviços e Peças da OScol` VARCHAR(45) NULL,
  PRIMARY KEY (`Ordem de Servico_idOrder de Servico`, `Ordem de Servico_Mecanico_idMecanico`, `Ordem de Servico_Veiculos_idVeiculos`, `Ordem de Servico_Veiculos_Clientes_idClientes`, `Serviços e Peças_idServiços e Peças`),
  INDEX `fk_Order de Servico_has_Serviços e Peças_Serviços e Peç_idx` (`Serviços e Peças_idServiços e Peças` ASC) VISIBLE,
  INDEX `fk_Order de Servico_has_Serviços e Peças_Order de Servico_idx` (`Ordem de Servico_idOrder de Servico` ASC, `Ordem de Servico_Mecanico_idMecanico` ASC, `Ordem de Servico_Veiculos_idVeiculos` ASC, `Ordem de Servico_Veiculos_Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Order de Servico_has_Serviços e Peças_Order de Servico1`
    FOREIGN KEY (`Ordem de Servico_idOrder de Servico` , `Ordem de Servico_Mecanico_idMecanico` , `Ordem de Servico_Veiculos_idVeiculos` , `Ordem de Servico_Veiculos_Clientes_idClientes`)
    REFERENCES `mecanica`.`Ordem de Servico` (`idOrdem de Servico` , `Mecanico_idMecanico` , `Veiculos_idVeiculos` , `Veiculos_Clientes_idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order de Servico_has_Serviços e Peças_Serviços e Peças1`
    FOREIGN KEY (`Serviços e Peças_idServiços e Peças`)
    REFERENCES `mecanica`.`Serviços e Peças` (`idServiços e Peças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanica`.`Veiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanica`.`Veiculos` (
  `idVeiculos` INT NOT NULL,
  `Modelo` VARCHAR(45) NULL,
  `Placa` VARCHAR(45) NULL,
  `Cor` VARCHAR(45) NULL,
  `Veiculoscol` VARCHAR(45) NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idVeiculos`, `Clientes_idClientes`),
  INDEX `fk_Veiculos_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculos_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `mecanica`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
