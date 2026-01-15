create database sql_week8;
show databases;

-- Indexes
-- Indexes help to speed up searching

-- orders table
-------------------------------------------------------------------------------------------
-- order_id (index)

use sql_week8;

CREATE TABLE orders_temp(
    order_id INT PRIMARY KEY,
    order_date DATETIME,
    customer_id INT,
    order_status VARCHAR(50)
);

drop table orders_temp;

select * from orders_temp;

CREATE TABLE orders(
order_id int NOT NULL,
order_date datetime NOT NULL,
order_customer_id int NOT NULL,
order_status varchar(45) NOT NULL,
PRIMARY KEY (order_id)
);

insert into orders
select * from orders_temp;

select * from orders;

select * from orders where order_id = 45;

select * from orders where order_id = 45;

select * from orders where order_customer_id = 45;




