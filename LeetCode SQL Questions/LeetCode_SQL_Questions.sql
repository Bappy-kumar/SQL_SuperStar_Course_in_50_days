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

-- ----------------------------------------------------------------------------------------------------

Create table If Not Exists Person (personId int, firstName varchar(255), lastName varchar(255));
Create table If Not Exists Address (addressId int, personId int, city varchar(255), state varchar(255));
Truncate table Person;
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen');
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob');
Truncate table Address;
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York');
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California');


select p.firstName, p.lastName, a.city, a.state from Person as p left join Address as a
on p.personId = a.personId;

-- --------------------------------------------------------------------------------------------------------------------
drop table Employee;
Create table If Not Exists Employee (id int, name varchar(255), salary int, managerId int);
Truncate table Employee;
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3');
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4');
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL);
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL);

select * from employee;

-- Write a solution to find the employees who earn more than their managers.
--    Return the result table in any order.

SELECT name as Employee
FROM Employee e
WHERE salary > (
    SELECT salary
    FROM Employee
    WHERE id = e.managerId
);

