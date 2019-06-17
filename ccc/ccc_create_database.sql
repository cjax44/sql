-- create and select the database
DROP DATABASE IF EXISTS ccc;
CREATE DATABASE ccc;
USE ccc;

-- create the Product table
CREATE TABLE Stuffy (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  Type          VARCHAR(25)    NOT NULL,
  Color			VARCHAR(255)   NOT NULL,
  Size			VARCHAR(20)    NOT NULL,
  Limbs			INT			   NOT NULL			
);



-- insert some rows into the Product table
INSERT INTO Stuffy VALUES
(1, "Dog", "Blue", "Large", 4),
(2, "Cat", "Green", "Small", 4),
(3, "Dragon", "Purple", "Medium", 6),
(4, "Snail", "Yellow", "X-Large", 1),
(5, "Platypus", "Blue", "Medium", 4),
(6, "Octopus", "Purple", "Large", 8),
(7, "Squirrel", "Brown", "Small", 4),
(8,"Starfish", "Pink", "X-Large", 5),
(9, "Lobster", "Red", "Large", 10),
(10, "Spider", "Clear", "Small", 8);




-- create a user and grant privileges to that user
CREATE USER ccc_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON ccc.* TO ccc_user@localhost;
