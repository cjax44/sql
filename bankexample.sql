DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
use bank_db;

CREATE TABLE Accounts (
	ID int not null primary key auto_increment,
	account_holder nvarchar(50) not null,
	balance decimal(18,2) not null,
	fees decimal(10,2) not null
);

CREATE TABLE Transactions (
	ID int not null primary key auto_increment,
	amount decimal(18,2) not null,
    txn_type nvarchar(50) not null,
    account_ID int not null
);