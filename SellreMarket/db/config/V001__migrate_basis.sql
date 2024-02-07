-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema selreMarket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema selreMarket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `selreMarket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `selreMarket` ;

-- -----------------------------------------------------
-- Table `selreMarket`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`product` (
  `productid` INT NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(100) NULL,
  `pEngname` VARCHAR(100) NULL,
  `allery` TEXT NULL,
  `nutrition` TEXT NULL,
  `pstock` INT NULL,
  `pinsertdate` DATETIME NULL,
  `origin` VARCHAR(40) NULL,
  `expirationdate` DATETIME NULL,
  `description` TEXT NULL,
  `status` CHAR(1) NULL,
  PRIMARY KEY (`productid`),
  UNIQUE INDEX `productid_UNIQUE` (`productid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`released`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`released` (
  `releasedid` INT NOT NULL AUTO_INCREMENT,
  `insertdate` DATETIME NOT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`releasedid`, `productid`),
  UNIQUE INDEX `rid_UNIQUE` (`releasedid` ASC) VISIBLE,
  INDEX `fk_released_product_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_released_product`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`request` (
  `requestid` INT NOT NULL AUTO_INCREMENT,
  `rcount` INT NULL,
  `rcomment` TEXT NULL,
  `rdate` DATETIME NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`requestid`, `productid`),
  UNIQUE INDEX `requestid_UNIQUE` (`requestid` ASC) VISIBLE,
  INDEX `fk_request_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_request_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`brand` (
  `brandid` INT NOT NULL AUTO_INCREMENT,
  `bname` VARCHAR(100) NULL,
  `releasedid` INT NOT NULL,
  `productid` INT NOT NULL,
  `requestid` INT NOT NULL,
  PRIMARY KEY (`brandid`, `releasedid`, `productid`, `requestid`),
  UNIQUE INDEX `brandid_UNIQUE` (`brandid` ASC) VISIBLE,
  INDEX `fk_brand_released1_idx` (`releasedid` ASC, `productid` ASC) VISIBLE,
  INDEX `fk_brand_request1_idx` (`requestid` ASC) VISIBLE,
  CONSTRAINT `fk_brand_released1`
    FOREIGN KEY (`releasedid` , `productid`)
    REFERENCES `selreMarket`.`released` (`releasedid` , `productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_brand_request1`
    FOREIGN KEY (`requestid`)
    REFERENCES `selreMarket`.`request` (`requestid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`catetory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`catetory` (
  `catetoryid` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `subtype` VARCHAR(45) NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`catetoryid`, `productid`),
  UNIQUE INDEX `catetoryid_UNIQUE` (`catetoryid` ASC) VISIBLE,
  INDEX `fk_catetory_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_catetory_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`packing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`packing` (
  `packid` INT NOT NULL AUTO_INCREMENT,
  `packtype` VARCHAR(45) NULL,
  `packking` VARCHAR(45) NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`packid`, `productid`),
  UNIQUE INDEX `packid_UNIQUE` (`packid` ASC) VISIBLE,
  INDEX `fk_packing_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_packing_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`saleunit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`saleunit` (
  `unitid` INT NOT NULL AUTO_INCREMENT,
  `utype` VARCHAR(20) NOT NULL,
  `ugram` VARCHAR(45) NULL,
  `product_productid` INT NOT NULL,
  PRIMARY KEY (`unitid`, `product_productid`),
  UNIQUE INDEX `unitid_UNIQUE` (`unitid` ASC) VISIBLE,
  INDEX `fk_saleunit_product1_idx` (`product_productid` ASC) VISIBLE,
  CONSTRAINT `fk_saleunit_product1`
    FOREIGN KEY (`product_productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`delivery_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`delivery_type` (
  `deliveryid` INT NOT NULL AUTO_INCREMENT,
  `dname` VARCHAR(45) NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`deliveryid`, `productid`),
  UNIQUE INDEX `deliveryid_UNIQUE` (`deliveryid` ASC) VISIBLE,
  INDEX `fk_delivery_type_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_type_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`price` (
  `priceid` INT NOT NULL AUTO_INCREMENT,
  `price` INT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`priceid`, `productid`),
  UNIQUE INDEX `priceid_UNIQUE` (`priceid` ASC) VISIBLE,
  INDEX `fk_price_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_price_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`product_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`product_image` (
  `imageid` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(255) NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`imageid`, `productid`),
  UNIQUE INDEX `imageid_UNIQUE` (`imageid` ASC) VISIBLE,
  INDEX `fk_product_image_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_product_image_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`youtuber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`youtuber` (
  `youtubeid` INT NOT NULL AUTO_INCREMENT,
  `yname` VARCHAR(45) NULL,
  `ysrc` TEXT NULL,
  PRIMARY KEY (`youtubeid`),
  UNIQUE INDEX `youtubeid_UNIQUE` (`youtubeid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`recipeOfYoutuber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`recipeOfYoutuber` (
  `recipeid` INT NOT NULL AUTO_INCREMENT,
  `rcontent` TEXT NULL,
  `youtubeid` INT NOT NULL,
  PRIMARY KEY (`recipeid`, `youtubeid`),
  UNIQUE INDEX `recipeid_UNIQUE` (`recipeid` ASC) VISIBLE,
  INDEX `fk_recipeOfYoutuber_youtuber1_idx` (`youtubeid` ASC) VISIBLE,
  CONSTRAINT `fk_recipeOfYoutuber_youtuber1`
    FOREIGN KEY (`youtubeid`)
    REFERENCES `selreMarket`.`youtuber` (`youtubeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`productOfRecipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`productOfRecipe` (
  `recipeid` INT NOT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`recipeid`, `productid`),
  INDEX `fk_productOfRecipe_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_productOfRecipe_recipeOfYoutuber1`
    FOREIGN KEY (`recipeid`)
    REFERENCES `selreMarket`.`recipeOfYoutuber` (`recipeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productOfRecipe_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`questcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`questcode` (
  `questid` INT NOT NULL AUTO_INCREMENT,
  `qname` VARCHAR(45) NULL,
  PRIMARY KEY (`questid`),
  UNIQUE INDEX `questid_UNIQUE` (`questid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`customer` (
  `userid` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NULL,
  `password2` VARCHAR(45) NULL,
  `tel_no` VARCHAR(13) NULL,
  `name` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  `address` VARCHAR(100) NULL,
  `gender` CHAR(1) NULL,
  `birthdate` DATE NULL,
  `status` CHAR(1) NULL,
  `insertdate` DATETIME NULL,
  `updatedate` DATETIME NULL,
  PRIMARY KEY (`userid`),
  UNIQUE INDEX `userid_UNIQUE` (`userid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`personal_inquiry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`personal_inquiry` (
  `inquiryid` INT NOT NULL AUTO_INCREMENT,
  `intitle` VARCHAR(200) NULL,
  `incontent` TEXT NULL,
  `inimage` VARCHAR(255) NULL,
  `answer` TEXT NULL,
  `insertdate` DATETIME NULL,
  `answerdate` DATETIME NULL,
  `status` CHAR(1) NULL,
  `questid` INT NOT NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`inquiryid`, `questid`, `userid`),
  UNIQUE INDEX `inquiryid_UNIQUE` (`inquiryid` ASC) VISIBLE,
  INDEX `fk_inquiry_questcode1_idx` (`questid` ASC) VISIBLE,
  INDEX `fk_personal_inquiry_customer1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_inquiry_questcode1`
    FOREIGN KEY (`questid`)
    REFERENCES `selreMarket`.`questcode` (`questid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_inquiry_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`addresslist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`addresslist` (
  `addressid` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NULL,
  `defaultset` CHAR(1) NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`addressid`, `userid`),
  UNIQUE INDEX `addressid_UNIQUE` (`addressid` ASC) VISIBLE,
  INDEX `fk_addresslist_customer1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_addresslist_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`coupon` (
  `couponid` INT NOT NULL AUTO_INCREMENT,
  `startdate` DATETIME NULL,
  `enddate` DATETIME NULL,
  `status` CHAR(1) NULL,
  `title` VARCHAR(200) NULL,
  `content` TEXT NULL,
  `discountrate` INT NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`couponid`, `userid`),
  UNIQUE INDEX `couponid_UNIQUE` (`couponid` ASC) VISIBLE,
  INDEX `fk_coupon_customer1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_coupon_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`productlike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`productlike` (
  `likecount` INT NOT NULL,
  `productid` INT NOT NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`productid`, `userid`),
  INDEX `fk_productlike_customer1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_productlike_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productlike_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`paymethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`paymethod` (
  `payid` INT NOT NULL AUTO_INCREMENT,
  `payname` VARCHAR(45) NULL,
  PRIMARY KEY (`payid`),
  UNIQUE INDEX `payid_UNIQUE` (`payid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`purchase` (
  `purchaseid` INT NOT NULL AUTO_INCREMENT,
  `purchasedate` DATETIME NULL,
  `status` CHAR(1) NULL,
  `amount` INT NULL,
  `userid` VARCHAR(20) NOT NULL,
  `productid` INT NOT NULL,
  `payid` INT NOT NULL,
  `couponid` INT NOT NULL,
  `addressid` INT NOT NULL,
  PRIMARY KEY (`purchaseid`, `userid`, `productid`, `payid`, `couponid`, `addressid`),
  UNIQUE INDEX `purchaseid_UNIQUE` (`purchaseid` ASC) VISIBLE,
  INDEX `fk_purchase_customer1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_purchase_product1_idx` (`productid` ASC) VISIBLE,
  INDEX `fk_purchase_paymethod1_idx` (`payid` ASC) VISIBLE,
  INDEX `fk_purchase_coupon1_idx` (`couponid` ASC) VISIBLE,
  INDEX `fk_purchase_addresslist1_idx` (`addressid` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_paymethod1`
    FOREIGN KEY (`payid`)
    REFERENCES `selreMarket`.`paymethod` (`payid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_coupon1`
    FOREIGN KEY (`couponid`)
    REFERENCES `selreMarket`.`coupon` (`couponid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_addresslist1`
    FOREIGN KEY (`addressid`)
    REFERENCES `selreMarket`.`addresslist` (`addressid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`event` (
  `eventid` INT NOT NULL AUTO_INCREMENT,
  `ename` VARCHAR(100) NULL,
  `econtent` TEXT NULL,
  `startdate` DATETIME NULL,
  `enddate` DATETIME NULL,
  `salerate` INT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`eventid`, `productid`),
  UNIQUE INDEX `eventid_UNIQUE` (`eventid` ASC) VISIBLE,
  INDEX `fk_event_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_event_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`recipelike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`recipelike` (
  `likecount` INT NOT NULL,
  `userid` VARCHAR(20) NOT NULL,
  `recipeid` INT NOT NULL,
  PRIMARY KEY (`likecount`, `userid`, `recipeid`),
  INDEX `fk_recipelike_customer1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_recipelike_recipeOfYoutuber1_idx` (`recipeid` ASC) VISIBLE,
  CONSTRAINT `fk_recipelike_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipelike_recipeOfYoutuber1`
    FOREIGN KEY (`recipeid`)
    REFERENCES `selreMarket`.`recipeOfYoutuber` (`recipeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`ask`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`ask` (
  `askid` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` TEXT NULL,
  `date` DATETIME NULL,
  `private` CHAR(1) NULL,
  `userid` VARCHAR(20) NOT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`askid`, `userid`, `productid`),
  UNIQUE INDEX `askid_UNIQUE` (`askid` ASC) VISIBLE,
  INDEX `fk_ask_customer1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_ask_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_ask_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ask_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`cart` (
  `cartid` INT NOT NULL AUTO_INCREMENT,
  `qty` INT NULL,
  `userid` VARCHAR(20) NOT NULL,
  `productid` INT NOT NULL,
  PRIMARY KEY (`cartid`, `userid`, `productid`),
  UNIQUE INDEX `cartid_UNIQUE` (`cartid` ASC) VISIBLE,
  INDEX `fk_cart_customer1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_cart_product1_idx` (`productid` ASC) VISIBLE,
  CONSTRAINT `fk_cart_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`review` (
  `reviewid` INT NOT NULL,
  `date` DATETIME NULL,
  `content` VARCHAR(255) NULL,
  `like` INT NULL,
  `productid` INT NOT NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`reviewid`, `productid`, `userid`),
  INDEX `fk_review_product1_idx` (`productid` ASC) VISIBLE,
  INDEX `fk_review_customer1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_review_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `selreMarket`.`product` (`productid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_customer1`
    FOREIGN KEY (`userid`)
    REFERENCES `selreMarket`.`customer` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `selreMarket`.`review_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `selreMarket`.`review_image` (
  `reviewimgid` INT NOT NULL,
  `image` VARCHAR(255) NULL,
  `reviewid` INT NOT NULL,
  PRIMARY KEY (`reviewimgid`, `reviewid`),
  INDEX `fk_review_image_review1_idx` (`reviewid` ASC) VISIBLE,
  CONSTRAINT `fk_review_image_review1`
    FOREIGN KEY (`reviewid`)
    REFERENCES `selreMarket`.`review` (`reviewid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
