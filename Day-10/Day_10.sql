-- update vs delete

drop table orders;
drop table customers;
use retail_db;

CREATE TABLE retail_db.customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(45)
);
select * from customers;

update customers
set customer_street = '7869 Crystal View Villas' ,
customer_city = 'Brooklyn',
customer_state = 'NY'
where customer_id = 2;

select * from customers;

rollback;

select * from customers;

update customers
set customer_street = '8324 Little Common' ,
customer_city = 'San Marcos',
customer_state = 'CA'
where customer_id = 2;

select * from customers;

rollback;

select * from customers;

delete from customers 
where customer_id = 7;

commit;

select * from customers;

delete from customers;

rollback;

select * from customers;

-- update and alter

-- ===========================

-- delete vs truncate

delete from customers;

rollback;

select * from customers;

truncate customers;

select * from customers;

rollback;

select * from customers;














