show databases;
-- worked
insert into orders values (1, "2013-07-25 00:00:00.0" , "11599" , "Closed"); 

select * from orders;
-- failed
insert into orders values (2, "2013-07-25 00:00:00.0" , "1159-A12" , "Closed"); 

-- worked
insert into orders values (3, "2013-07-25" , "11599" , "Closed"); 

select * from orders;
-- worked
insert into orders values (4, "2013-07-25 00:00:00", 11599, 8);

select * from orders;

drop table orders;
CREATE TABLE orders(
order_id int,
order_date datetime,
customer_id int,
order_status varchar(5)
);
-- has not worked (data too long for column order_status)
insert into orders values (5, '2013-07-25',256,'PENDING_PAYMENT');

drop table orders;

CREATE TABLE order_items (
order_item_id int,
order_item_order_id int,
order_item_product_id int,
order_item_quantity int,
order_item_subtotal float,
order_item_product_price float
);

/* 701, 101, macbook, 1, 130000, 130000
890, 101, airpods, 2, 36000, 18000
*/
INSERT INTO order_items VALUES (1,1,957,1,299.98,299.98);
select * from order_items;
INSERT INTO order_items VALUES (1,1,957,1,299.9878,299.9856);

drop table order_items;

CREATE TABLE order_items (
order_item_id int,
order_item_order_id int,
order_item_product_id int,
order_item_quantity int,
order_item_subtotal decimal(20,5),
order_item_product_price decimal(20,8)
);

INSERT INTO order_items VALUES (1,1,957,1,299.98,299.98);

select * from order_items;

INSERT INTO order_items VALUES (1,1,957,1,299.9878,299.9856);





