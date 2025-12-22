-- Assignment Solutions

create database interview_questions;

use interview_questions;

CREATE TABLE SOURCE (
ID INT PRIMARY KEY,
NAME VARCHAR(10)
);
-- Create TARGET Table
CREATE TABLE TARGET (
ID INT PRIMARY KEY,
NAME VARCHAR(10)
);
-- Insert Data into SOURCE Table
INSERT INTO SOURCE (ID, NAME) VALUES (1, 'A');
INSERT INTO SOURCE (ID, NAME) VALUES (2, 'B');
INSERT INTO SOURCE (ID, NAME) VALUES (3, 'C');
INSERT INTO SOURCE (ID, NAME) VALUES (4, 'D');
-- Insert Data into TARGET Table
INSERT INTO TARGET (ID, NAME) VALUES (1, 'A');
INSERT INTO TARGET (ID, NAME) VALUES (2, 'B');
INSERT INTO TARGET (ID, NAME) VALUES (4, 'X');
INSERT INTO TARGET (ID, NAME) VALUES (5, 'E');

select * from source;
select * from target;

-- will find new in source
select s.id, 'New in Source' as Comment
from 
source s
left join target t
on s.id = t.id
where t.id is null;
-- will find new in target
select t.id, 'New in Target' as Comment
from 
source s
right join target t
on s.id = t.id
where s.id is null;


select s.id, 'New in Source' as Comment
from 
source s
left join target t
on s.id = t.id
where t.id is null
union all
select t.id, 'New in Target' as Comment
from 
source s
right join target t
on s.id = t.id
where s.id is null
union all
-- will find the mismatch
select s.id, 'Mismatch' as Comment
from 
source s
inner join target t
on s.id = t.id
where s.name != t.name;

select s.id,
case 
    when t.id is NULL then 'New in Source'
    when s.name != t.name then 'Mismatch'
end  as Comment  
from 
source s
left join target t
on s.id = t.id
where t.id is null or s.name!= t.name
union all
select t.id, 'New in Target' as Comment
from 
source s
right join target t
on s.id = t.id
where s.id is null









