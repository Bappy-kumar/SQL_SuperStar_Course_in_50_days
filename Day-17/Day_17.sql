use retail_db;

-- Total Sales across each category

select distinct category from sales;

select category, sum(amount) as total_sales
from sales
group by category;


-- this will work but might not make much sense
select sum(amount) as total_sales
from sales
group by category;

-- the below query will work
select category, max(sale_date), sum(amount) as total_sales 
from sales
group by category;

-- this is equivalent to distinct
select category 
from sales
group by category;

select distinct category from sales;

select category, product, sum(amount) as total_sales
from sales
group by category, product;

-- count of products in each category
select category, count(distinct product) as total_products
from sales
group by category;


-- total quantity sold for each product

select product , 
count(*) as total_orders, 
sum(quantity) as total_quantity_sold
from sales
group by product;

-- 3 products with maximum sales volume

select product, sum(quantity) as total_quantity
from sales
group by product
order by total_quantity desc limit 3;

-- total sales and number of transactions per store location

select store_location, 
sum(amount) as total_sales, count(*) as
num_transactions
from sales
group by store_location;

-- average sale amount by each customer

select customer_id, avg(amount) as average_sale,
sum(amount) as total_purchase_amount,
count(*) as num_of_orders,
sum(amount)/count(*) as avgsale
from sales
group by customer_id;

-- all aggregation function ignore null values

-- Total sales by month and category
-- how many rows will be there in output

select date_format(sale_date, '%Y-%m') from sales;

select date_format(sale_date, '%y-%m') from sales;

select date_format(sale_date, '%Y-%M') from sales;

select distinct date_format(sale_date, '%Y-%m'), category from sales;

select date_format(sale_date, '%Y-%m') as sale_month, category, 
sum(amount) as total_sales
from sales
group by sale_month, category;

-- TOTAL SALES BY STORE LOCATION WHERE TOTAL SALES EXCEED 1 MILLION

-- not worked
select store_location, sum(amount) as total_sales
from sales 
where total_sales > 1000000
group by store_location;

select store_location, sum(amount) as total_sales
from sales 
group by store_location
having total_sales > 1000000;

select distinct store_location from sales;

/* 5 groups 
now we want to show only those groups where total_sales > 1 million */
-- 2 groups matched the criteria

select store_location, sum(amount) as total_sales
from sales
group by store_location limit 2;

--  I want to find highest order amount in each category

select category, max(amount) as highest_sale
from sales
group by category;

-- Total sales amount and avg quantity sold per product in newyork

select product, sum(amount) as total_sales , avg(quantity) as avg_quantity
from sales where store_location = 'New York'
group by product;


-- we just need to do the analysis on the product 'Tablet'

select product, sum(amount) as total_sales , avg(quantity) as avg_quantity
from sales where store_location = 'New York'
group by product having product = 'Tablet';

select product, sum(amount) as total_sales , sum(quantity) as sum_quantity
from sales where store_location = 'New York'
group by product having product = 'Tablet';

select product, sum(amount) as total_sales , sum(quantity) as sum_quantity
from sales where store_location = 'New York' and product = 'Tablet'
group by product;

-- total sales and total quantity sold each month

select date_format(sale_date, '%Y-%m') as sale_month, 
sum(amount) as total_sales, 
sum(quantity) as total_quantity
from sales
group by sale_month;

-- from each store I want the count of unique customers 

select store_location, 
count(distinct customer_id) as unique_customers_count,
count(*) as total_orders
from sales
group by store_location;

-- monthly sales by each customer

select date_format(sale_date, '%Y-%m') as sale_month, customer_id,
sum(amount) as total_sales
from sales
group by sale_month, customer_id;

-- monthly sales by each customer who have placed atleast 8 orders

select date_format(sale_date, '%Y-%m') as sale_month, customer_id,
sum(amount) as total_sales
from sales
group by sale_month, customer_id
having count(*) >= 8;

-- monthly sales by premium customers

select date_format(sale_date, '%Y-%m') as sale_month, customer_id,
sum(amount) as total_sales
from sales
group by sale_month, customer_id
having avg(amount) > 600;

-- total sales amount by category with sales in jan 2023

select category, sum(amount) as total_sales
from sales
where month(sale_date) = 1 and year(sale_date) = 2023
group by category;

-- total sales amount by premium customer (>7000)
-- I just want to consider sales on weekdays

select customer_id, sum(amount) as total_sales
from sales
where dayofweek(sale_date) between 2 and 6
group by customer_id
having total_sales > 7000;

-- total sales and number of orders per store location with sales happening in the month of
-- jan 2023, ordered by number of transactions

select store_location, sum(amount) as total_sales, count(*) as num_transactions
from sales
where sale_date between '2023-01-01' and '2023-01-31'
group by store_location
order by num_transactions desc;







