-- create and select database
DROP DATABASE IF EXISTS dmdb;
CREATE DATABASE dmdb;
USE dmdb;

-- create tables

CREATE TABLE Actor (
	ID int primary key auto_increment,
    firstName varchar(25),
    lastName varchar(25),
    gender varchar(6),
    birthDate date
);
CREATE TABLE Genre (
	ID int primary key auto_increment,
    Name varchar(25)
);
CREATE TABLE Movie (
	ID int primary key auto_increment,
    title varchar(100),
    rating varchar(5),
    year int,
    director varchar(50)
);
CREATE TABLE Credit (
	ID int primary key auto_increment,
    movieID int,
    actorID int,
    role varchar(25),
    FOREIGN KEY (actorID) REFERENCES Actor (ID),
    FOREIGN KEY (movieID) REFERENCES Movie (ID)
);
CREATE TABLE MovieGenre (
	ID int primary key auto_increment,
    movieID int,
    genreID int,
    FOREIGN KEY (movieID) REFERENCES Movie (ID),
    FOREIGN KEY (genreID) REFERENCES Genre (ID)
);

-- insert values
Insert into Actor (firstName, lastName, gender, birthDate) VALUES
	('Tom', 'Hanks', 'Male', '1956-07-09'),
    ('Norman', 'Reedus', 'Male', '1969-01-06'),
    ('Sandra', 'Bullock', 'Female', '1964-07-24'),
    ('Tom', 'Cruise', 'Male', '1962-07-02'),
    ('Daniel', 'Radcliff', 'Male', '1989-07-23'),
    ('Zoe', 'Saldana', 'Female', '1978-06-19'),
    ('Chris', 'Hemsworth', 'Male', '1983-08-11');
    
    
Insert into Movie (title, rating, year, director) VALUES
	('Thor: Ragnarok', 'PG-13', 2017, 'Taika Waititi'),
    ('Boondock Saints', 'R', 1999, 'Troy Duffy'),
    ('Bird Box', 'R', 2018, 'Susanne Bier'),
    ('Mission: Impossible 2', 'R', 2000, 'John Woo'),
    ('Harry Potter and the Philosopher''s Stone', 'PG', 2001, 'Chris Colombus'),
    ('The Lord of the Rings: The Two Towers', 'PG-13', 2002, 'Peter Jackson'),
    ('The Lord of the Rings: The Return of the King', 'PG-13', 2003, 'Peter Jackson'),
    ('Shrek 2', 'PG', 2004, 'Andrew Adamson'),
    ('Harry Potter and the Goblet of Fire', 'PG-13', 2005, 'Mike Newell'),
    ('Pirates of the Caribbean: Dead Man''s Chest', 'PG-13', 2006, 'Gore Verbinski'),
    ('Pirates of the Caribbean: At World''s End', 'PG-13', 2007, 'Gore Verbinski'),
    ('The Dark Knight', 'PG-13', 2008, 'Christopher Nolan'),
    ('Avatar', 'PG-13', 2009, 'James Cameron'),
    ('The Da Vinci Code', 'PG-13', 2006, 'Ron Howard'),
    ('American Pie', 'R', 1999, 'Paul Weitz'),
    ('Borat', 'R', 2006, 'Larry Charles'),
    ('Toy Story', 'G', 1995, 'John Lasseter');

Insert into Genre (Name) Values
('Adventure'),
('Comedy'),
('Crime'),
('Drama'),
('Fantasy'),
('Historical'),
('Historical fiction'),
('Horror'),
('Magical realism'),
('Mystery'),
('Paranoid Fiction'),
('Philosophical'),
('Political'),
('Romance'),
('Saga'),
('Satire'),
('Science fiction'),
('Social'),
('Speculative'),
('Thriller'),
('Urban'),
('Western');

Insert into MovieGenre (movieID, genreID) VALUES
    (1,1),
    (1,2);


Insert into Credit (movieID, actorID, role) VALUES
	(1, 7, 'Thor, God of Thunder');
-- create user

CREATE USER IF NOT EXISTS bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON sdb.* TO bmdb_user@localhost;