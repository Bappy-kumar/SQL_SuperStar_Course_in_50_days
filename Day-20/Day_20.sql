-- set operations
-- union

-- union all

-- intersect

-- except

-- you manage a ecommerce platform

-- purchase
-- newsletter subscription
-- returns
use retail_db;
CREATE TABLE purchases (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
purchase_date DATE
);

INSERT INTO purchases (customer_id, first_name, last_name, email,
purchase_date) VALUES
(101, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '2024-07-05'),
(102, 'Vihaan', 'Singh', 'vihaan.singh@example.com', '2024-06-25'),
(103, 'Aditi', 'Mehta', 'aditi.mehta@example.com', '2024-07-15'),
(104, 'Rohan', 'Kumar', 'rohan.kumar@example.com', '2024-07-12'),
(105, 'Isha', 'Patel', 'isha.patel@example.com', '2024-07-18'),
(106, 'Kavya', 'Verma', 'kavya.verma@example.com', '2024-06-28'),
(107, 'Arjun', 'Reddy', 'arjun.reddy@example.com', '2024-07-09'),
(108, 'Anaya', 'Nair', 'anaya.nair@example.com', '2024-07-22'),
(109, 'Saanvi', 'Gupta', 'saanvi.gupta@example.com', '2024-07-20'),
(110, 'Kabir', 'Agarwal', 'kabir.agarwal@example.com', '2024-07-19'),
(111, 'Neha', 'Saxena', 'neha.saxena@example.com', '2024-06-24'),
(112, 'Tanishq', 'Rana', 'tanishq.rana@example.com', '2024-07-10'),
(113, 'Mira', 'Bhatt', 'mira.bhatt@example.com', '2024-07-21'),
(114, 'Dev', 'Kapoor', 'dev.kapoor@example.com', '2024-07-17'),
(115, 'Riya', 'Joshi', 'riya.joshi@example.com', '2024-07-11');

CREATE TABLE newsletter_subscriptions (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
subscription_date DATE
);

INSERT INTO newsletter_subscriptions (customer_id, first_name, last_name,
email, subscription_date) VALUES
(101, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '2024-07-01'),
(109, 'Saanvi', 'Gupta', 'saanvi.gupta@example.com', '2024-07-05'),
(116, 'Lakshay', 'Malhotra', 'lakshay.malhotra@example.com', '2024-06-29'),
(112, 'Tanishq', 'Rana', 'tanishq.rana@example.com', '2024-07-03'),
(117, 'Sneha', 'Chawla', 'sneha.chawla@example.com', '2024-07-15'),
(113, 'Mira', 'Bhatt', 'mira.bhatt@example.com', '2024-06-30'),
(118, 'Rahul', 'Pillai', 'rahul.pillai@example.com', '2024-07-06'),
(105, 'Isha', 'Patel', 'isha.patel@example.com', '2024-07-18'),
(106, 'Kavya', 'Verma', 'kavya.verma@example.com', '2024-07-20'),
(115, 'Riya', 'Joshi', 'riya.joshi@example.com', '2024-07-22'),
(119, 'Nikhil', 'Chandra', 'nikhil.chandra@example.com', '2024-07-08'),
(107, 'Arjun', 'Reddy', 'arjun.reddy@example.com', '2024-07-10'),
(108, 'Anaya', 'Nair', 'anaya.nair@example.com', '2024-07-13'),
(114, 'Dev', 'Kapoor', 'dev.kapoor@example.com', '2024-07-14'),
(104, 'Rohan', 'Kumar', 'rohan.kumar@example.com', '2024-07-11');

CREATE TABLE returns (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
return_date DATE
);

INSERT INTO returns (customer_id, first_name, last_name, email, return_date)
VALUES
(103, 'Aditi', 'Mehta', 'aditi.mehta@example.com', '2024-07-17'),
(102, 'Vihaan', 'Singh', 'vihaan.singh@example.com', '2024-07-14'),
(104, 'Rohan', 'Kumar', 'rohan.kumar@example.com', '2024-07-19'),
(110, 'Kabir', 'Agarwal', 'kabir.agarwal@example.com', '2024-07-08'),
(105, 'Isha', 'Patel', 'isha.patel@example.com', '2024-07-21'),
(107, 'Arjun', 'Reddy', 'arjun.reddy@example.com', '2024-07-10'),
(111, 'Neha', 'Saxena', 'neha.saxena@example.com', '2024-07-16'),
(116, 'Lakshay', 'Malhotra', 'lakshay.malhotra@example.com', '2024-07-02'),
(117, 'Sneha', 'Chawla', 'sneha.chawla@example.com', '2024-07-18'),
(112, 'Tanishq', 'Rana', 'tanishq.rana@example.com', '2024-07-07'),
(108, 'Anaya', 'Nair', 'anaya.nair@example.com', '2024-07-09'),
(114, 'Dev', 'Kapoor', 'dev.kapoor@example.com', '2024-07-11'),
(109, 'Saanvi', 'Gupta', 'saanvi.gupta@example.com', '2024-07-12'),
(113, 'Mira', 'Bhatt', 'mira.bhatt@example.com', '2024-07-20'),
(101, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '2024-07-22');

select * from purchases;

select * from returns;

select * from newsletter_subscriptions;

select customer_id, first_name, last_name, email from purchases
where purchase_date >= date_sub(current_date(), interval 20 month)
union 
select customer_id, first_name, last_name, email  from newsletter_subscriptions
where subscription_date >= date_sub(current_date(), interval 20 month)
union
select customer_id, first_name, last_name, email from returns
where return_date >= date_sub(current_date(), interval 20 month);

select customer_id, first_name, last_name, email from purchases
where purchase_date >= date_sub(current_date(), interval 20 month)
union all
select customer_id, first_name, last_name, email  from newsletter_subscriptions
where subscription_date >= date_sub(current_date(), interval 20 month)
union all
select customer_id, first_name, last_name, email from returns
where return_date >= date_sub(current_date(), interval 20 month);

-- INTERSECT

-- customers who purchased a product and also subscribed to the newsletters letter.

select customer_id, first_name, last_name, email from purchases
where purchase_date >= date_sub(current_date(), interval 20 month)
intersect
select customer_id, first_name, last_name, email  from newsletter_subscriptions
where subscription_date >= date_sub(current_date(), interval 20 month);

select customer_id, first_name, last_name, email from purchases
where purchase_date >= date_sub(current_date(), interval 20 month)
except
select customer_id, first_name, last_name, email  from newsletter_subscriptions
where subscription_date >= date_sub(current_date(), interval 20 month);

select 1, "Sumit",10000
union
select 1, "Sumit", 10000;

select 1, "Sumit",10000
union all
select 1, "Sumit", 10000;

select 1, "Sumit",10000
union 
select 1, "Sumit", 10000.0;

select 1, "Sumit",10000
union all
select 1, "Sumit", 10000.0;

select 1, "Sumit", "Mittal"
union
select 1, "Sumit", 10000.0;

select 1, "Sumit", "Mittal"
union all
select 1, "Sumit", 10000.0;

select 1, "Sumit", "Mittal"
union
select 1, "Mittal", "Sumit";


select * from customers;

drop table orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    order_status VARCHAR(50)
);

select * from orders;

-- find out customers who have not made even a single purchase.

select customer_id from customers
except
select customer_id from orders;

-- as part of data quality check

-- I want to find is there any customer who placed a order but not there in customers table

select customer_id from orders
except
select customer_id from customers;

-- I want to find out customers who purchased or subscribed to the newsletter but not both
-- in the last 1 month

(select customer_id, first_name, last_name, email from purchases
where purchase_date >= DATE_SUB(current_date(), INTERVAL 20 MONTH)
except
select customer_id, first_name, last_name, email from
newsletter_subscriptions
where subscription_date >= DATE_SUB(current_date(), INTERVAL 20 MONTH))
union all
(select customer_id, first_name, last_name, email from newsletter_subscriptions
where subscription_date >= DATE_SUB(current_date(), INTERVAL 20 MONTH)
except
select customer_id, first_name, last_name, email from purchases
where purchase_date >= DATE_SUB(current_date(), INTERVAL 20 MONTH));




