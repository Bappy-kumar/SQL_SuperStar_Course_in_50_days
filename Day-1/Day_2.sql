#show databases
show databases;
#how to create a databases
create database retail_db;

select database();

#To connect to the database

use retail_db;

CREATE TABLE orders(
order_id int,
order_date datetime,
customer_id int,
order_status varchar(30)
);

show tables;

use information_schema;

show tables;

use retail_db;

select * from orders;

insert into orders values (1, "2013-07-25 00:00:00.0" , 11599 , "Closed"); 
insert into orders values (2, "2013-07-25", 256, "Pending_payment"); 
select * from orders;

show tables;

drop table orders;

show tables;
show databases;

drop database retail_db;








