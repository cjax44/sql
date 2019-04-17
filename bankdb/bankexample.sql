DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
use bank_db;

CREATE TABLE Account (
	ID int not null primary key auto_increment,
	account_holder nvarchar(50) not null,
	balance decimal(18,2) not null,
	fees decimal(10,2) not null
);

CREATE TABLE Transaction (
	ID int not null primary key auto_increment,
	amount decimal(18,2) not null,
    txn_type nvarchar(50) not null,
    account_ID int not null,
    FOREIGN KEY (account_ID) references account(`ID`)
);

Insert Account (account_holder, balance, fees) values ('Anna Bengel', 8888, 250);
Insert Account (account_holder, balance, fees) values ('Chase Williams', 5444, 175);
Insert Account (account_holder, balance, fees) values ('Jonelle Wehrman', 3333, 88);
Insert Account (account_holder, balance, fees) values ('Steven Ross', 3322, 250);

Insert Transaction (amount, txn_type, account_ID) values (500, 'Deposit', 3);
Insert Transaction (amount, txn_type, account_ID) values (-200, 'Withdrawal', 3);
Insert Transaction (amount, txn_type, account_ID) values (200, 'Deposit', 4);
Insert Transaction (amount, txn_type, account_ID) values (248, 'Deposit', 1);