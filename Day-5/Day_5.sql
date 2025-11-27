/* Alter - change the structure of existing table. */

show databases;

drop database retail_db;

create database retail_db;

use retail_db;

CREATE TABLE orders (
order_id int,
order_item_id int,
order_date date,
customer_id int,
product_id int,
quantity int,
product_price float,
total_price float
);

describe orders;

INSERT INTO orders VALUES
(1, 1, '2013-07-25', 11599, 957, 1, 299.98, 299.98),
(2, 2, '2013-07-25', 256, 1073, 1, 199.99, 199.99),
(2, 3, '2013-07-25', 256, 502, 5, 50.00, 250.00),
(2, 4, '2013-07-25', 256, 403, 1, 129.99, 129.99),
(4, 5, '2013-07-25', 8827, 897, 2, 24.99, 49.98),
(4, 6, '2013-07-25', 8827, 365, 5, 59.99, 299.95),
(4, 7, '2013-07-25', 8827, 502, 3, 50.00, 150.00),
(4, 8, '2013-07-25', 8827, 1014, 4, 49.98, 199.92),
(5, 9, '2013-07-25', 11318, 957, 1, 299.98, 299.98),
(5, 10, '2013-07-25', 11318, 365, 5, 59.99, 299.95),
(5, 11, '2013-07-25', 11318, 1014, 2, 49.98, 99.96),
(5, 12, '2013-07-25', 11318, 957, 1, 299.98, 299.98),
(5, 13, '2013-07-25', 11318, 403, 1, 129.99, 129.99);

select * from orders;

-- add a new column named order_status
alter table orders add column order_status varchar(20);

select * from orders;

INSERT INTO orders VALUES (7, 14, '2013-07-25', 4530, 1073, 1,
199.99, 199.99);


INSERT INTO orders (order_id, order_item_id, order_date,
customer_id, product_id, quantity, product_price, total_price)
VALUES (7, 14, '2013-07-25', 4530, 1073, 1, 199.99, 199.99);

select * from orders;

delete from orders where order_id = 7;

select * from orders;

INSERT INTO orders (order_id, order_item_id, order_date,
customer_id, order_status, product_id, quantity, product_price,
total_price) VALUES (7, 14, '2013-07-25', 4530, 'COMPLETE', 1073, 1,
199.99, 199.99), (7, 15, '2013-07-25', 4530, 'COMPLETE', 957, 1,
299.98, 299.98), (7, 16, '2013-07-25', 4530, 'COMPLETE', 926, 5,
15.99, 79.95);

select * from orders;

INSERT INTO orders (order_id, order_item_id, order_date,
customer_id, order_status, product_id, quantity, product_price,
total_price) VALUES (8, 17, '2013-07-25', 2911, null, 365, 3, 59.99,
179.97),
(8, 18, '2013-07-25', 2911, null, 365, 5, 59.99, 299.95),
(8, 19, '2013-07-25', 2911, null, 1014, 4, 49.98, 199.92),
(8, 20, '2013-07-25', 2911, null, 502, 1, 50.00, 50.00);

select * from orders;

alter table orders drop column total_price;

desc orders;

select * from orders;

alter table orders modify order_date datetime;

select * from orders;

alter table orders modify order_date date;

select * from orders;

delete from orders where order_id = 7;

desc orders;

INSERT INTO orders (order_id, order_item_id, order_date,
customer_id, order_status, product_id, quantity, product_price) VALUES
(7, 14, '2013-07-25 12:42:30', 4530, 'COMPLETE', 1073, 1, 199.99), (7,
15, '2013-07-25', 4530, 'COMPLETE', 957, 1, 299.98), (7, 16,
'2013-07-25', 4530, 'COMPLETE', 926, 5, 15.99);

select * from orders;

alter table orders modify order_date date;

select * from orders;

alter table orders modify order_date datetime;

select * from orders;

-- the business asked me to change the column name

alter table orders rename column order_date to order_time;

select * from orders;

-- change column datatype (float to int)

alter table orders modify product_price int;

select * from orders;

-- change column product_id (int to varchar)

alter table orders modify product_id varchar(5);

select * from orders;

-- change column customer_id (int to varchar)

alter table orders modify customer_id varchar(3);

select * from orders;

-- change (datetime to int)

alter table orders modify order_time int;

-- change (datetime to varchar)

alter table orders modify order_time varchar(5);

alter table orders modify order_time varchar(50);

-- change (varchar to date)

alter table orders modify order_time date;

select * from orders;

-- change order_status to int

alter table orders modify order_status int;

select * from orders;

delete from orders where order_status = 'COMPLETE';

select * from orders;

alter table orders modify order_status int;

desc orders;

-- rename the table as orders_with_status

alter table orders rename to orders_with_status;

show tables;































