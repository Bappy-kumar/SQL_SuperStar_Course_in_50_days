use retail_db;

select * from customers;
-- concat
select *, concat(customer_fname,' ', customer_lname) as full_name from customers;

select *, concat(customer_street,',', customer_city,',',customer_state,',',customer_zipcode)
as address from customers;

-- length

select *, length(customer_fname) as name_length
from customers;

select *, length(customer_fname) as name_length
from customers
where length(customer_fname) = 8;

select *
from customers
where length(customer_fname) = 8;

select length('Bappy Kumar');

select length(customer_id) from
customers;

select customer_id, length(customer_id) 
from customers;

select * from customers;


select count(*) from customers
where length(customer_state) != 2
or length(customer_zipcode) != 5;

-- Lower / Upper

select lower('SQL Champion Program');

select upper('SQL Champion Program');

-- Substring

select substring('Hello World', 7, 5);

select substring('Hello World',  3);

select substring('Hello World',  -3);

select substring('Hello World',  -5);

select customer_fname, substring(customer_fname, -3)
from customers;

select substring('Hello World', 1);

-- trim / ltrim / rtrim

select trim('    SQL Champion Program    ');

-- find all the customers with leading or trailing spaces in customer_street
select *
from 
customers
where trim(customer_street) != customer_street;

select *
from 
customers
where trim(customer_city) != customer_city;

select ltrim('    SQL Champion Program    ');

select rtrim('    SQL Champion Program    ');

-- Replace

select replace('Hello World', 'World', 'MySQL');

select customer_id, customer_fname, replace(customer_state, 'CA', 'CALIFORNIA')
from customers;

-- Locate / instr

select locate('World', 'Hello World') as position;

select instr('Hello World', 'World') as position;

select *, substr(customer_street, 1,locate(' ', customer_street)-1) as street_number
from customers;











