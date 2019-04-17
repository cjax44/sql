select * from customer;

select * from customer
	where name like 'A%'
	or name like 'D%';
    
select * from customer
	where name like '%A%.';
--    and state = 'NJ';
    
select * from customer
	where name REGEXP "^[aeioud].*";