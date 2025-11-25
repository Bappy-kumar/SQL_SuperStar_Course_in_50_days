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