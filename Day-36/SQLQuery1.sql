create database sql_week8;

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

select * from orders where order_customer_id = 45;

