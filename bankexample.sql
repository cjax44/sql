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

Insert Accounts (account_holder, balance, fees) values ('Anna Bengel', 888800, 25000)
Insert Accounts (account_holder, balance, fees) values ('Chase Williams', 544400, 217500)
Insert Accounts (account_holder, balance, fees) values ('Jonelle Wehrman', 333300, 8800)
Insert Accounts (account_holder, balance, fees) values ('Steven Ross', 332200, 25000)

Insert Transactions (amount, txn_type, account_ID) values (50000, 'Deposit', 3)
Insert Transactions (amount, txn_type, account_ID) values (-20000, 'Withdrawal', 34)
Insert Transactions (amount, txn_type, account_ID) values (20000, 'Deposit', 4)
Insert Transactions (amount, txn_type, account_ID) values (24800, 'Deposit', 1)