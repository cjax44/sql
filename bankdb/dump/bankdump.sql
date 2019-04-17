CREATE DATABASE  IF NOT EXISTS `bank_db`;
USE `bank_db`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `account_holder` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `balance` decimal(18,2) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`)
);

--
-- Dumping data for table `account`
--

INSERT INTO `account` VALUES (1,'Anna Bengel',8888.00,250.00),(2,'Chase Williams',5444.00,175.00),(3,'Jonelle Wehrman',3333.00,88.00),(4,'Steven Ross',3322.00,250.00);

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(18,2) NOT NULL,
  `txn_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `account_ID` (`account_ID`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`)
);


--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` VALUES (1,500.00,'Deposit',3),(2,-200.00,'Withdrawal',3),(3,200.00,'Deposit',4),(4,248.00,'Deposit',1);


-- Dump completed on 2019-04-17 13:53:06
