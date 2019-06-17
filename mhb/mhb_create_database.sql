-- create and select the database
DROP DATABASE IF EXISTS mhb;
CREATE DATABASE mhb;
USE mhb;

-- create the Insult table
CREATE TABLE Insult (
  ID			INT             PRIMARY KEY 	AUTO_INCREMENT,
  Insult        VARCHAR(225)	NOT NULL     	UNIQUE,
  Rating		VARCHAR(10)   	NOT NULL,
  Category		VARCHAR(45)  	NOT NULL
);


-- insert some rows into the Insult table
INSERT INTO Insult VALUES 
(1, 'Stupid people can believe in anything, so you can believe in yourself!', 'PG', 'Stupid'),
(2, 'If Mr. Rogers was your neighbor, he’d move.', 'PG', 'Society'),
(3, 'You have a face made for radio.', 'PG', 'Looks'),
(4, 'Two wrongs do not make a right, take your parents as an example.', 'PG', 'Society'),
(5, 'YYou must have been born on a highway because that is where most accidents happen.', 'PG', 'Society'),
(6, 'If laughter is the best medicine, your face must be curing the world.', 'PG', 'Looks'),
(7, 'I was not born with enough middle fingers to let you know how I feel about you.', 'PG', 'Society'),
(8, 'It looks like your face caught on fire and someone tried to put it out with a hammer.', 'PG', 'Looks');


-- create a user and grant privileges to that user
CREATE USER IF NOT EXISTS mhb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON mhb.* TO mhb_user@localhost;