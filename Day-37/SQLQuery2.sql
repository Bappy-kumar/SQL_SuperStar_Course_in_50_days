drop table orders;

CREATE TABLE orders(
order_id int NOT NULL,
order_date datetime NOT NULL,
order_customer_id int NOT NULL,
order_status varchar(45) NOT NULL,
PRIMARY KEY (order_id)
);
insert into orders
select * from orders_temp;



create nonclustered index IX_orders_customer_id
on orders (order_customer_id);

execute sp_helpindex orders;

-- Key lookup required
select * from orders where order_customer_id = 123;

-- no Key lookup required
select count(*) from orders where order_customer_id = 123;

-- no Key lookup required
select order_id from orders where order_customer_id = 123;

-- Key lookup required
select order_id, order_status from orders where order_customer_id = 123;

drop index [IX_orders_customer_id] on [dbo].[orders]
go

create nonclustered index IX_orders_customer_id
on orders (order_customer_id) include (order_status)

select order_id, order_status
from orders
where order_customer_id = 123;

select order_id, order_status
from orders
where order_status = 'COMPLETE';



select order_id from orders where order_customer_id = 123;

drop index [IX_orders_customer_id] on [dbo].[orders]
go

create unique nonclustered index UIX_orders_customer_id on orders (
order_customer_id) include (order_status);