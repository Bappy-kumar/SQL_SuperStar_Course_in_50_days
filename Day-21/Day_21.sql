use practise_joins;

show tables;

select * from orders;
select * from customers;
select * from order_items;
select * from products;
select * from categories;
select * from departments;

-- whats the name of person who placed the order_id = 1;

select order_customer_id from orders where order_id = 1;
-- 11599

select * from customers 
where customer_id = (select order_customer_id 
from orders where order_id = 1);

select * 
from orders
join customers
on orders.order_customer_id = customers.customer_id;

select * 
from orders as o
join customers as c
on o.order_customer_id = c.customer_id;

select o.*, c.*
from orders as o
join customers as c
on o.order_customer_id = c.customer_id;

select o.order_id, date(o.order_date),o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from orders as o
join customers as c
on o.order_customer_id = c.customer_id;


select order_id, date(order_date),order_customer_id,
order_status, customer_fname, customer_city,
customer_state
from orders as o
join customers as c
on o.order_customer_id = c.customer_id;

-- How many total records are there when i am joining both tables?

select count(*)
from orders as o
inner join customers as c
on o.order_customer_id = c.customer_id;

-- How many customers have placed atleast one order?

-- we want records from customers table which have a match
-- in orders table.

select count(distinct c.customer_id)
from orders o
inner join customers c 
on o.order_customer_id = c.customer_id;

-- using set operations
select customer_id from customers
intersect
select order_customer_id from orders;


select count(*) from (select customer_id from customers
intersect
select order_customer_id from orders) c;

select count(*) from customers;

-- I want to find customers who are in customers table but 
-- not in the orders table

-- except

select customer_id from customers
except
select order_customer_id from orders;

select count(*) from (select customer_id from customers
except
select order_customer_id from orders) c;











