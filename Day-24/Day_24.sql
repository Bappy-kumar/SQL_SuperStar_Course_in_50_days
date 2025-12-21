-- customers table and an orders table


use practise_joins;
show tables;

-- Find all the customers who have not placed even a single order.

select * from customers;
select * from orders;
-- subquery
select * from customers where customer_id not in
(select order_customer_id from orders);

-- left join
/* check for nulls on the right
 left outer join
 */
 
 select customer_id
 from customers c
 left join orders o
 on c.customer_id = o.order_customer_id
 where o.order_customer_id is null;

 select *
 from customers c
 left join orders o
 on c.customer_id = o.order_customer_id
 where o.order_customer_id is null;
 
 
 select  c.*
 from customers c
 left join orders o
 on c.customer_id = o.order_customer_id
 where o.order_customer_id is null;
 
 -- except
 select customer_id from customers
 except
 select order_customer_id from orders;
 
 select * from customers where customer_id in
 (select customer_id from customers
 except
 select order_customer_id from orders);
 
 -- not exists keyword (correlated subquery)
select * from customers c where not exists
(select * from orders o where o.order_customer_id = c.customer_id);
 
 -- all the customers who have placed altleast one order
 
 select * from customers where customer_id in
 (select order_customer_id from orders);
 
 select count(*) from customers;
 
 -- using inner join
 select  distinct(customer_id)
 from customers c
 inner join orders o
 on c.customer_id = o.order_customer_id;
 
 -- using intersect
 select customer_id from customers
 intersect
 select order_customer_id from orders;
 
 -- correlated subquery
select * from customers c where
exists 
(select * from orders o where o.order_customer_id = c.customer_id);
 
 -- we need to find avg number of order items in each order,
 -- and we need to find avg order amount.
 
 select * from order_items;
 
 -- total_items 3
 -- total_amount 580
 
 select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id;
 
 select avg(num_order_items) as avg_order_items,
 avg(order_amount) as avg_order_amount
 from ( select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id) as x;
 
 -- find avg number of orders placed by each customer
 select * from orders;
 -- customer_id, number_of_orders_placed
 /*
 1, 4
 2, 3
 3, 7
 4, 1
 */
 
 select order_customer_id, count(*) as total_orders
 from orders
 group by order_customer_id;
 
 select avg(total_orders)
 from (select order_customer_id, count(*) as total_orders
 from orders
 group by order_customer_id) as x;
 
 /*
I want to find big orders
all the orders where order items are > avg_order_items
and order amount > avg_order_amount
 */
 
SELECT *
FROM (
    SELECT
        order_item_order_id AS order_id,
        COUNT(*) AS num_order_items,
        SUM(order_item_subtotal) AS order_amount
    FROM order_items
    GROUP BY order_item_order_id
) a
CROSS JOIN (
    SELECT
        AVG(num_order_items) AS avg_order_items,
        AVG(order_amount) AS avg_order_amount
    FROM (
        SELECT
            order_item_order_id,
            COUNT(*) AS num_order_items,
            SUM(order_item_subtotal) AS order_amount
        FROM order_items
        GROUP BY order_item_order_id) x
    ) b on num_order_items > avg_order_items
    and order_amount > avg_order_amount;

 /* select *
 from a
 join b 
 on
 */
 SELECT *
FROM (
    SELECT
        order_item_order_id AS order_id,
        COUNT(*) AS num_order_items,
        SUM(order_item_subtotal) AS order_amount
    FROM order_items
    GROUP BY order_item_order_id
) a
CROSS JOIN (
    SELECT
        AVG(num_order_items) AS avg_order_items,
        AVG(order_amount) AS avg_order_amount
    FROM (
        SELECT
            order_item_order_id,
            COUNT(*) AS num_order_items,
            SUM(order_item_subtotal) AS order_amount
        FROM order_items
        GROUP BY order_item_order_id) x
    ) b where num_order_items > avg_order_items
    and order_amount > avg_order_amount;
 
 
 -- from
 -- join
 -- where
 -- having
 -- select
 
 select order_item_order_id as order_id,
 count(*) as num_order_items ,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id
 
 select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id
 having count(*) > (select avg(num_order_items) as avg_order_items
 from (select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal)
 from order_items
 group by order_item_order_id) x)
 and order_amount > (select avg(order_amount) as avg_order_amount
 from (select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id) x);
 
 select order_item_order_id as order_id,
 count(*) as num_order_items,
 sum(order_item_subtotal) as order_amount
 from order_items
 group by order_item_order_id
 having count(*) > 2.9983
 and order_amount > 597.6322996016944;
 
 select * from orders;
 
 select avg(total_orders)
 from (select order_customer_id, count(*) as total_orders
 from orders
 group by order_customer_id) x;
 
-- we want to find premium customers
-- number of orders > avg number of orders
 
 select order_customer_id, count(*) 
 from orders
 group by order_customer_id
 having count(*) > (select avg(total_orders)
 from (select order_customer_id, count(*) as total_orders
 from orders
 group by order_customer_id) x);
 
 select * from orders;
 
 -- as part of select in orders table I want one extra column which indicates
 -- the avg number of orders each customer places.
 
 select *, (select avg(total_orders)
 from (select order_customer_id, count(*) as total_orders
 from orders 
 group by order_customer_id) x) as avg_orders
 from orders;
 
 CREATE TABLE employees (
emp_id INT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10, 2)
);
INSERT INTO employees (emp_id, name, salary) VALUES
(1, 'Amit', 60000.00),
(2, 'Sneha', 75000.00),
(3, 'Raj', 50000.00),
(4, 'Priya', 80000.00),
(5, 'Vijay', 45000.00);

select * from employees;

-- find employees with above avg salaries
select * from employees where salary
>(select avg(salary) as avg_salary from employees);

-- There are 3 main types of subqueries
/*
1. scalar subquery: a subquery that returns just one row
and one column. in general terms a subquery which returns just one 
value.

2. Multiple rows / multiple columns:
   from
   join
   
3. correlated subquery: a subquery that depends on the results of the outer query   
*/

drop table employees;

 CREATE TABLE employees (
emp_id INT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10, 2),
department_id INT
);
 
 
 INSERT INTO employees (emp_id, name, salary, department_id) VALUES
(1, 'Amit', 60000.00, 1),
(2, 'Sneha', 75000.00, 2),
(3, 'Raj', 50000.00, 1),
(4, 'Priya', 80000.00, 2),
(5, 'Vijay', 45000.00, 1),
(6, 'Anita', 70000.00, 3),
(7, 'Sunil', 65000.00, 3),
(8, 'Pooja', 55000.00, 2);
 
 
 select * from employees;
 
 -- find employees earning more than avg salary in their department.
select department_id , avg(salary) as avg_salary
from employees
group by department_id;
 
select  emp_id, name, salary, e.department_id, avg_salary
from employees e
inner join
(select department_id , avg(salary) as avg_salary
from employees
group by department_id) d
on e.department_id = d.department_id
where salary > avg_salary;
 
 select * from employees;
 
 -- using correlated subquery:
 select avg(salary) from employees
 where department_id = 1;
 
SELECT 
    *
FROM
    employees e
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees
        WHERE
            department_id = e.department_id);
            
            
 
 
 
 



