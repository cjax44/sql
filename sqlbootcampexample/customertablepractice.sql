select * from customer;

select * from customer
	where name like 'A%'
	or name like 'D%';
    
select * from customer
	where name like '%A%.';
--    and state = 'NJ';
    
-- regex fun    
select * from customer
	where name REGEXP "^[aeioud].*";
    
-- insert stmt practice

insert into customer
	values (14, 'Fender', 'Scottsdale', 'AZ', 456789000,1);
    
insert into customer (Name, City, State, Sales, Active) 
	values ('Ibanez', 'Bensalem', 'PA', 91827323, 1),
		   ('Ibenez', 'Not real town', 'NA', 00000012, 1),
           ('Ibenez', 'Not real town', 'NA', 00000012, 1);
           
-- update statement practice

update customer 
	set name = 'Pearl', 
		city = 'Test',
        state = 'TE'
	where id = 16;
    
DELETE
	from customer
    where ID = 18;