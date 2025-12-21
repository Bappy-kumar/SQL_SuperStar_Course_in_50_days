-- CTE
-- Common table expression

/*
common table expression syntax:
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
)
SELECT *
FROM cte_name;
*/

use practise_joins;

select avg(num_order_items) as avg_order_items,
avg(order_amount) as avg_order_amount
from ( select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal) as order_amount
from order_items
group by order_item_order_id) as x;
 
select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal) as order_amount
from order_items
group by order_item_order_id;

with aggregated_results as ( select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal) as order_amount
from order_items
group by order_item_order_id)
select avg(num_order_items) as avg_order_items,
avg(order_amount) as avg_order_amount
from aggregated_results;

with aggregated_results as ( select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal) as order_amount
from order_items
group by order_item_order_id)
select * from aggregated_results;
-- subqueries
-- query3(query2(query1))

-- ctes
-- query1
-- query2
-- query3


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
    
    
  SELECT
        order_item_order_id AS order_id,
        COUNT(*) AS num_order_items,
        SUM(order_item_subtotal) AS order_amount
    FROM order_items
    GROUP BY order_item_order_id;

with grouped as ( SELECT
        order_item_order_id AS order_id,
        COUNT(*) AS num_order_items,
        SUM(order_item_subtotal) AS order_amount
    FROM order_items
    GROUP BY order_item_order_id),
    averaged as (select avg(num_order_items) as avg_order_items,
    avg(order_amount) as avg_order_amount
    from grouped)
    select * from grouped join
    averaged on num_order_items > avg_order_items
    and order_amount > avg_order_amount;
    
    /*
    1. group the order_id
    2. avg of number of order items and order amount
    3. join the 2 tables and have the filter condition
    */
    
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
    
with order_items_aggregated as (select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal)
from order_items
group by order_item_order_id)
select * from order_items_aggregated;

with order_items_aggregated as (select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal)
from order_items
group by order_item_order_id),
order_items_avgd as (select avg(num_order_items) as avg_order_items
from order_items_aggregated)
select * from order_items_avgd;


with order_items_aggregated as (select order_item_order_id as order_id,
count(*) as num_order_items,
sum(order_item_subtotal) as order_total
from order_items
group by order_item_order_id),
order_items_avgd as (select avg(num_order_items) as avg_order_items
from order_items_aggregated),
order_amnt_avgd as (select avg(order_total) as avg_order_amount
from order_items_aggregated)
select order_id,
num_order_items,
order_total
from order_items_aggregated
where num_order_items > (select avg_order_items from order_items_avgd)
and order_total > (select avg_order_amount from order_amnt_avgd);

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
    
-- using ctes
 with dept_avg_salary as (select department_id, avg(salary) as avg_salary
from employees
group by department_id)
select emp_id, name, salary, e.department_id, avg_salary
from employees e
inner join dept_avg_salary d
on e.department_id = d.department_id
where salary > avg_salary;

with cte_orders as (
select * from orders
)
select * from cte_orders where order_id = 10000;

-- Recursive CTE

drop table employees;

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
ManagerID INT
);
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'John', NULL), -- John is the CEO
(2, 'Alice', 1), -- Alice reports to John
(3, 'Bob', 1), -- Bob reports to John
(4, 'Charlie', 2), -- Charlie reports to Alice
(5, 'David', 2), -- David reports to Alice
(6, 'Eva', 3); -- Eva reports to Bob

select * from employees;


select employeeid,
employeename,
managerid,
0 as level
from employees
where managerid is null;

select employeeid,
employeename,
managerid,
1 as level
from employees
where managerid  = 1;

select employeeid,
employeename,
managerid,
2 as level
from employees
where managerid = 2

union all

select employeeid,
employeename,
managerid,
2 as level
from employees
where managerid = 3;

with recursive EmployeeHierarchy as (
  -- anchor member: select the top level employee (CEO)
     select employeeid,
     employeename,
     managerid,
     0 as level
     from employees
     where managerid is null
     union all
     -- recursive member: find employees who report to the current employee
     select  
     e.employeeid,
     e.employeename,
     e.managerid,
     eh.level + 1 -- increment the level for each recursion
     from employees e
     inner join EmployeeHierarchy eh
     on e.managerid = eh.employeeid
)
select employeeid,
employeename,
managerid,
level
from EmployeeHierarchy
order by level, employeeid;


with recursive EmployeeHierarchy as (
-- anchor member
select employeeid,
employeename,
managerid
from employees
where employeeid = 6
-- recursive member
union all
select e.employeeid,
e.employeename,
e.managerid
from employees e 
inner join EmployeeHierarchy eh
on e.employeeid = eh.managerid
)
select employeeid,
employeename,
managerid
from EmployeeHierarchy
order by employeeid;

-- fibonnacci series
-- 0 1 1 2 3 5 8 13 21 .....


with recursive fibbonacci as (
-- anchor member
select 0 as number, 1 as next, 1 as level
union all

-- recursive member
select next, number + next, level + 1
from fibbonacci 
where level < 10
)
select number, level from fibbonacci;

 