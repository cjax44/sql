-- create and select database
DROP DATABASE IF EXISTS sdb;
CREATE DATABASE sdb;
USE sdb;

-- create tables

CREATE TABLE Student (
	ID int primary key auto_increment,
    FirstName nvarchar(25),
    LastName nvarchar(25),
    StreetAddress nvarchar(25),
    City nvarchar(25),
    State nvarchar(2),
    Zip nvarchar(5),
    Birthdate date,
    PhoneNumber nvarchar(12),
    Email nvarchar(50),
    SSN nvarchar(11)
    );
    
CREATE TABLE Course (
	ID int primary key auto_increment,
    Number int unique,
    Subject nvarchar(25),
    Name nvarchar(25)
    );
    
CREATE TABLE Instructor (
	ID int primary key auto_increment,
    CourseID int,
    First nvarchar(25),
    Last nvarchar(25),
    FOREIGN KEY (CourseID) REFERENCES Course (ID)
    );
    
CREATE TABLE Enrollment (
	ID int primary key auto_increment,
    StudentID int,
    CourseID int,
    Grade decimal(5,2),
    FOREIGN KEY (CourseID) REFERENCES Course (ID),
    FOREIGN KEY (StudentID) REFERENCES Student (ID)
    );
    
-- insert values (2+ instructors, 5+ students, 3 courses, enrollment data?)

Insert into Student Values
	(1, 'Chris', 'Jackson', '5267 Terrace Ridge Dr', 'Milford', 'OH', '45150', '1989-01-23', '513-207-4329', 'cjax44@gmail.com', '123-45-6789'),
    (2, 'Owen', 'Wilson', '123 Wow St', 'Wow', 'PA', '12345', '1950-02-24', '123-867-5309', 'owenwilson@wow.com', '999-99-1234'),
    (3, 'Dwayne', 'Johnson', '4444 Rock Ave', 'Rockland', 'RO', '44444', '1970-07-14', '911', 'canyousmell@wrockscooking.com', '911-91-9119'),
    (4, 'Mark', 'Zuckerberg', 'Redacted', 'Private', 'NA', 'XXXXX', '1900-01-01', 'NOT-FOR-VIEW', 'alienlizardman@facebook.com', 'XXX-XX-XXXX'),
    (5, 'Nicki', 'Minaj', '#1', 'Charts', 'OG', '00001', '1990-04-01', '888-YOU-WISH', 'youngmoney@gmail.com', '123-12-1234');
    
Insert into Course Values
	(1, '001', 'MATH', 'Calculus'),
    (2, '002', 'MATH', 'Algebra'),
    (3, '010', 'ENGLISH', 'Poetry'),
    (4, '011', 'ENGLISH', 'Composition'),
    (5, '100', 'ART', 'Pottery'),
    (6, '101', 'ART', 'Music');
    
Insert into Instructor Values
	(1, 1, 'John', 'Wick'),
    (2, 2, 'Frank', 'Castle'),
    (3, 3, 'Ariana', 'Large'),
    (4, 4, 'Rick', 'Rolled');
    
Insert into Enrollment Values
	(1, 1, 1, 100.00),
    (2, 2, 3, 95.00),
    (3, 3, 1, 50.00),
    (4, 3, 2, 55.00),
    (5, 3, 3, 57.00),
    (6, 1, 2, 99.99),
    (7, 1, 3, 99.91),
    (8, 4, 1, 70.02),
    (9, 4, 4, 84.25),
    (10, 4, 5, 92.20),
    (11, 5, 2, 80.00),
    (12, 5, 6, 19.00),
    (13, 5, 4, 68.75);
    

-- create and grant user

CREATE USER sdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON sdb.* TO sdb_user@localhost;