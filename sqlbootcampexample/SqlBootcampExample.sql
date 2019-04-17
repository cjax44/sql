DROP DATABASE IF EXISTS SqlBootcampExample;
CREATE DATABASE SqlBootcampExample;
use SqlBootcampExample;

CREATE TABLE State (
	StateCode nvarchar(2) not null primary key,
    Name nvarchar(50) not null
);

CREATE TABLE Customer (
	ID int not null primary key auto_increment,
	Name nvarchar(50) not null,
	City nvarchar(50) not null,
	State nvarchar(2) not null,
	Sales decimal(18,2) not null,
	Active bit not null,
    foreign key (State) references State(StateCode)
);

Insert State (StateCode, Name) Values ('AL', 'Alabama');
Insert State (StateCode, Name) Values ('CA', 'California');
Insert State (StateCode, Name) Values ('HI', 'Hawaii');
Insert State (StateCode, Name) Values ('NJ', 'New Jersey');
Insert State (StateCode, Name) Values ('NV', 'Nevada');
Insert State (StateCode, Name) Values ('OH', 'Ohio');
Insert State (StateCode, Name) Values ('TX', 'Texas');
Insert State (StateCode, Name) Values ('WA', 'Washington');

Insert Customer (Name, City, State, Sales, Active) Values ('Acme, inc.','Jersey City','NJ',14381891,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Widget Corp','Seattle','WA',97865829,1);
Insert Customer (Name, City, State, Sales, Active) Values ('123 Warehousing','Los Angeles','CA',77503710,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Demo Company','Columbus','OH',74647541,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Smith and Co.','Honolulu','HI',36046590,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Foo Bars','Fresno','CA',39912857,1);
Insert Customer (Name, City, State, Sales, Active) Values ('ABC Telecom','Birmingham','AL',31149083,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Fake Brothers','Stockton','CA',31226191,1);
Insert Customer (Name, City, State, Sales, Active) Values ('QWERTY Logistics','Lubbock','TX',17226905,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Demo, Inc.','Las Vegas','NV',69551557,1);

Insert into Customer (Name, City, State, Sales, Active)	
	Values 
    ('Super Cool Computers','Cincinnati','OH','12345678.90',1),
    ('Target','Cincinnati','OH','55555555.55', 1);

-- inner join

Select c.Name, c.City, s.Name as 'State'
	From Customer c
    JOIN State s
    on s.StateCode = c.State;