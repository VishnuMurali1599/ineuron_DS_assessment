create database INU;
use INU;

create table runners (id int, name varchar(50));

insert into runners values(1,'John Doe'),
(2, 'Jane Doe'),
(3,'ALice Jones'),
(4,'Bobby louis'),
(5,'Lisa Romero');

create table races (id int, event varchar(100) , winner_id int);

insert into races values(1,'100 meter dash',2),
(2,'500 meter dash',3),
(3,'cross-country',2),
(4,'triathalon',NULL);

select * from runners 
where id 
NOT in (select winner_id from races)

select r.id, r.name , ra.event , ra.winner_id
from runners r
join races ra
on r.id = ra.id


select * from races


------------------------------------ Question 2 ---------------------------------------

create table test_a(id numeric);
create table test_b(id numeric);

insert into test_a(id) values
(10),
(20),
(30),
(40),
(50);

insert into test_b(id) values
(10),
(30),
(50);

SELECT a.*
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;


--------------------------------- Question 3 -----------------------------------------

create table users (user_id int , username varchar(50));

create table training_details(user_training_id int ,
user_id int , training_id int,
training_date date);

insert into users values (1, 'John Doe'),
(2, 'Jane Don'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

insert into training_details values(1,1,1,"2015-08-02"),
(2,2,1,"2015-08-03"),
(3,3,2,"2015-08-02"),
(4,4,2,"2015-08-04"),
(5,2,2,"2015-08-03"),
(6,1,1,"2015-08-02"),
(7,3,2,"2015-08-04"),
(8,4,3,"2015-08-03"),
(9,1,4,"2015-08-03"),
(10,3,1,"2015-08-02"),
(11,4,2,"2015-08-04"),
(12,3,2,"2015-08-02"),
(13,1,1,"2015-08-02"),
(14,4,3,"2015-08-03");

select user_id, training_id, training_date, COUNT(*) AS traning_count
from training_details
group by user_id, training_id, training_date
having COUNT(*) > 1
order by training_date desc;

------------------------ Question 4 ---------------------------------------------------

create table employee(Emp_ID int , Emp_name varchar(50), Salary int, Manager_id int);

insert into employee values (10,"Anil",50000,18),
(11,"Vikas",75000,16),
(12,"Nisha",40000,18),
(13,"Nidhi",60000,17),
(14,"priya",80000,18),
(15,"Mohit",45000,18),
(16,"Rajesh",90000,Null),
(17,"Raman",55000,16),
(18,"Santosh",65000,17);

select Manager_id, avg(Salary) as Average_Salary
from employee
where Manager_id is not null
group by Manager_id
order by Average_Salary desc

---------------------------------------------------------------------------------------------