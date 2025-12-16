use practise_joins;

-- left outer Join

select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from customers c
left join orders o
on o.order_customer_id = c.customer_id;


select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from customers c
left outer join orders o
on o.order_customer_id = c.customer_id;

select count(distinct customer_id)
from customers c 
left outer join orders o
on o.order_customer_id = c.customer_id;

select * from 
customers c 
left outer join orders o
on o.order_customer_id = c.customer_id
where o.order_customer_id is null;

-- customers who never placed any order
select count(*) from 
customers c 
left outer join orders o
on o.order_customer_id = c.customer_id
where o.order_customer_id is null;

-- Right outer join

select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from customers c
left outer join orders o
on o.order_customer_id = c.customer_id;

select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from orders o  
right outer join customers c
on o.order_customer_id = c.customer_id;

-- Full Outer Join

select count(*) from 
customers c 
full outer join orders o
on o.order_customer_id = c.customer_id
where o.order_customer_id is null;

select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from customers c
left outer join orders o
on o.order_customer_id = c.customer_id
union
select o.order_id, date(o.order_date), o.order_customer_id,
o.order_status, c.customer_fname, c.customer_city,
c.customer_state
from customers c
right outer join orders o
on o.order_customer_id = c.customer_id;

-- ORDER OF EXECUTION

-- from
-- join
-- where 
-- group by
-- having
-- select
-- distinct
-- order by
-- limit


-- CROSS JOIN OR CARTESIAN JOIN

select c.*, o.*
from customers c
join orders o;

select count(*)
from customers c
join orders o;

select * 
from customers c
join orders o;

-- Practise

-- Customers
-- Orders
select * from customers;
select * from orders;

-- top 3 states from where maximum number of orders are placed.....

-- grouping column - states (customer)
-- orders is from orders table

select c.customer_state, count(*) as num_orders
from customers c
inner join orders o
on o.order_customer_id = c.customer_id
group by c.customer_state
order by num_orders desc
limit 3;

-- find top 5 customers with maximum orders in closed status.

select c.customer_id, count(*) as num_orders
from customers c 
inner join orders o 
on o.order_customer_id = c.customer_id
where o.order_status = 'CLOSED'
group by c.customer_id
order by num_orders desc
limit 5;

-- order_customer_id (grouping column) - orders
-- aggregation (order_id) - orders
-- filtering - orders

select order_customer_id, count(*) as num_orders
from orders 
where order_status = 'CLOSED'
group by order_customer_id
order by num_orders desc
limit 5;

-- list the customer_street from where we have orders will all
-- possible order status

select * from customers;

select * from orders;

select distinct order_status from orders;

-- (grouping) customer_street - customers

-- (aggregation) order_status - orders

select c.customer_street, count(distinct o.order_status) as total
from customers c
inner join orders o
on c.customer_id = o.order_customer_id
group by c.customer_street 
having count(distinct o.order_status) = 9;

select c.customer_street as total
from customers c
inner join orders o
on c.customer_id = o.order_customer_id
group by c.customer_street 
having count(distinct o.order_status) = 9;

select c.customer_street as total
from customers c
inner join orders o
on c.customer_id = o.order_customer_id
group by c.customer_street 
having count(distinct o.order_status) = (select count(distinct
order_status) from orders);

select count(distinct
order_status) from orders;




