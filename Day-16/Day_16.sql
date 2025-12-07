use retail_db;

CREATE TABLE IF NOT EXISTS sales (
id INT AUTO_INCREMENT PRIMARY KEY,
product VARCHAR(50),
category VARCHAR(50),
amount DECIMAL(10, 2),
sale_date DATE,
quantity INT,
customer_id INT,
store_location VARCHAR(50)
);

select * from sales;

-- total sales
-- max order amount
-- min order amount
-- average order value

select max(amount) as order_amount from sales;

select min(amount) as order_amount from sales;

select avg(amount) as order_amount from sales;

select count(*) as total_orders,
sum(amount) as total_sales,
max(amount) as max_order_amount,
min(amount) as min_order_amount,
avg(amount) as avg_order_value,
min(sale_date) as min_sale_date,
max(sale_date) as max_sale_date
from sales;

select count(*) as total_orders from sales 
union 
select sum(amount) as total_sales from sales
union
select max(amount) as max_order_amount from sales
union
select min(amount)as min_order_amount from sales
union
select avg(amount) as avg_order_value from sales;


select 'total_orders' as aggregation, count(*) as value from sales
union all
select 'total_sales' , sum(amount) as total_sales from sales
union all
select 'max_order_amount' , max(amount) as max_order_amount from sales
union all
select 'min_order_amount' , min(amount) as min_order_amount from sales
union all
select 'avg_order_value' , avg(amount) as avg_order_value from sales
union all
select 'total_sales' , sum(amount) as total_sales from sales;








