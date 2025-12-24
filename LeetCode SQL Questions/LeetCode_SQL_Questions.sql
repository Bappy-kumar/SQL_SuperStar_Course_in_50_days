create database LeetCode_Questions;

use LeetCode_Questions;

Create table If Not Exists Employee (id int, salary int);
-- Truncate table Employee
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

select * from employee;

select id,salary as SecondHighestSalary from employee
limit 1,1;

select distinct salary as SecondHighestSalary from employee order by salary desc
limit 1,1;

select(select distinct salary as SecondHighestSalary from employee order by salary desc
limit 1,1) as SecondHighestSalary;