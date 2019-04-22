DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- Create tables

CREATE TABLE User (
	ID 				int 			primary key 				auto_increment,
	UserName 		varchar(20) 	not null,
    Password 		varchar(10) 	not null,
    FirstName 		varchar(20) 	not null,
    LastName 		varchar(20) 	not null,
    PhoneNumber 	varchar(12) 	not null,
    Email 			varchar(72)		not null,
    IsReviewer 		TinyInt(1) 		default 1 					not null,
    IsAdmin 		tinyint(1) 		default 1 					not null,
    IsActive 		TinyInt(1) 		default 1 					not null,
    DateCreated 	datetime 		default current_timestamp 	not null,
    DateUpdated 	datetime 		default current_timestamp 	not null,
    UpdatedByUser 	int 			not null					default 1
);

CREATE TABLE Vendor (
	ID 					int 			primary key 		auto_increment,
    Code 				varchar(10) 	not null,
    Name 				varchar(255) 	not null,
    Address 			varchar(255) 	not null,
    City 				varchar(255) 	not null,
    State 				varchar(2) 		not null,
    Zip 				varchar(5) 		not null,
    PhoneNumber 		varchar(12) 	not null,
    Email 				varchar(100) 	not null,
    IsPreApproved 		TinyInt(1) 		not null			default 1,
    IsActive 			TinyInt(1) 		not null			default 1,
    DateCreated 		datetime 		not null			default current_timestamp,
    DateUpdated 		datetime 		not null			default current_timestamp,
    UpdatedByUser 		int 			not null  			default 1
);

CREATE TABLE PurchaseRequest (
	ID 					int 			primary key 	auto_increment,
    UserID 				int 			not null,
    Description 		varchar(100) 	not null,
    Justification 		varchar(255) 	not null,
    DateNeeded 			date 			not null,
    DeliveryMode 		varchar(25) 	not null,
    Status 				varchar(20) 	not null,
    Total 				decimal(10,2) 	not null,
    SubmittedDate 		datetime 		not null,
    ReasonForRejection 	varchar(100),
    IsActive 			tinyint(1) 		default 1 		not null,
    DateCreated 		datetime 		not null		default current_timestamp,
    DateUpdated 		datetime		default current_timestamp,
    UpdatedByUser 		int 			not null		default 1,
    FOREIGN KEY (UserID) REFERENCES User (ID)
);

CREATE TABLE Product (
	ID 				int 			primary key 		auto_increment,
    VendorID 		int 			not null,
    PartNumber 		varchar(50) 	not null,
    Name 			varchar(150) 	not null,
    Price 			decimal(10,2) 	not null,
    Unit 			varchar(255),
    PhotoPath 		varchar(255),
    IsActive 		tinyint(1) 		default 1			not null,
    DateCreated 	datetime 		not null			default current_timestamp,
    DateUpdated 	datetime 		not null 			default current_timestamp,
    UpdatedByUser 	int 			not null			default 1,
    FOREIGN KEY (VendorID) REFERENCES Vendor (ID)
);

CREATE TABLE PurchaseRequestLineItem (
	ID 					int 		primary key 		auto_increment,
    PurchaseRequestID 	int 		not null,
    ProductID 			int 		not null,
    Quantity 			int 		not null,
    IsActive 			tinyint 	not null			default 1,
    DateCreated 		datetime 	not null			default current_timestamp,
    DateUpdated 		datetime 	not null			default current_timestamp,
    UpdatedByUser 		int 		not null 			default 1,
    FOREIGN KEY (ProductID) REFERENCES Product (ID),
    FOREIGN KEY (PurchaseRequestID) REFERENCES PurchaseRequest (ID)
);

-- Insert Values

-- insert users

INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
(3, 'cjackson', 'login','Chris','Jackson','513-207-4329','cjax44@gmail.com',1,1);

-- insert vendors

INSERT INTO vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) 
VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0);

-- insert base products
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO product (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');

-- Constraints

ALTER TABLE User 
    ADD CONSTRAINT uname
    UNIQUE KEY(username);
    
 ALTER TABLE purchaserequestlineitem 
    ADD CONSTRAINT req_pdt
    UNIQUE KEY(PurchaseRequestID, productID);
  
 ALTER TABLE product 
    ADD CONSTRAINT vendor_part
    UNIQUE KEY(VendorID, PartNumber);
    
 ALTER TABLE vendor 
    ADD CONSTRAINT vcode
    UNIQUE KEY(Code);
    
-- Create user if nonexistant

CREATE USER IF NOT EXISTS prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;