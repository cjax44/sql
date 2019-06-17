-- create and select the database
DROP DATABASE IF EXISTS music_db;
CREATE DATABASE music_db;
USE music_db;

-- create the Artist table
CREATE TABLE Artist (
  ID			INT            PRIMARY KEY  AUTO_INCREMENT,
  Band		    VARCHAR(50)    NOT NULL	
);
-- create the Album table
CREATE TABLE Album (
  ID			INT 		   PRIMARY KEY	AUTO_INCREMENT,
  Album			VARCHAR(50)	   NOT NULL,
  Artist		VARCHAR(50)    NOT NULL
  );


-- insert some rows into the Product table
INSERT INTO Artist VALUES
(1, 'Elvis Presley'),
(2, 'John Prine'),
(3, 'The Beatles');




-- create a user and grant privileges to that user
CREATE USER music_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON music_db.* TO music_db_user@localhost;
