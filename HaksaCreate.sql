-- MySQL Script generated by MySQL Workbench
-- Fri Jan  5 15:59:30 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema haksa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema haksa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `haksa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `haksa` ;

-- -----------------------------------------------------
-- Table `haksa`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`department` (
  `department_code` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`department_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(10) NOT NULL,
  `department_department_code` INT NOT NULL,
  PRIMARY KEY (`professor_id`),
  INDEX `fk_professor_department1_idx` (`department_department_code` ASC) VISIBLE,
  CONSTRAINT `fk_professor_department1`
    FOREIGN KEY (`department_department_code`)
    REFERENCES `haksa`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(10) NOT NULL,
  `student_height` VARCHAR(45) NOT NULL,
  `department_department_code` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_department_idx` (`department_department_code` ASC) VISIBLE,
  CONSTRAINT `fk_student_department`
    FOREIGN KEY (`department_department_code`)
    REFERENCES `haksa`.`department` (`department_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`subject` (
  `subject_code` INT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(20) NOT NULL,
  `subject_start` DATE NOT NULL,
  `subject_end` DATE NOT NULL,
  `professor_professor_id` INT NOT NULL,
  PRIMARY KEY (`subject_code`),
  INDEX `fk_subject_professor1_idx` (`professor_professor_id` ASC) VISIBLE,
  CONSTRAINT `fk_subject_professor1`
    FOREIGN KEY (`professor_professor_id`)
    REFERENCES `haksa`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `haksa`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `haksa`.`class` (
  `class_id` INT NOT NULL,
  `student_student_id` INT NOT NULL,
  `subject_subject_code` INT NOT NULL,
  PRIMARY KEY (`student_student_id`, `subject_subject_code`),
  INDEX `fk_class_student1_idx` (`student_student_id` ASC) VISIBLE,
  INDEX `fk_class_subject1_idx` (`subject_subject_code` ASC) VISIBLE,
  UNIQUE INDEX `class_id_UNIQUE` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `haksa`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_subject1`
    FOREIGN KEY (`subject_subject_code`)
    REFERENCES `haksa`.`subject` (`subject_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
