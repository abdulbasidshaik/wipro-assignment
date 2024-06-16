-- Selecting all from employee table
select * from employee;

-- Ordering by age
select * from employee order by age;
select id, name, age from employee order by age;
select id, name, age from employee order by age asc;
select id, name, age from employee order by age desc;

-- Grouping by department and performing aggregations
select dept from employee group by dept;
select dept, count(id) from employee group by dept;
select sum(salary), min(salary), max(salary) from employee;
select count(id) from employee;
select dept, count(id), sum(salary), min(salary), max(salary), avg(salary) from employee group by dept;
select dept, sum(salary) from employee group by dept;
select dept, max(salary) from employee group by dept;
select dept, max(salary) from employee group by dept order by max(salary) desc;

-- Inserting new records
insert into employee values (8, 'pankaj', 35000, 'admin', 37);
insert into employee values (9, 'suraj', 47000, 'tester', 27);

-- Grouping with having and filtering
select dept, count(id) from employee group by dept order by count(id) desc;
select dept, count(id) from employee group by dept having count(id) > 1 order by count(id) desc;
select dept, count(id) from employee where dept != 'hr' group by dept having count(id) > 1 order by count(id) desc;

-- Creating and inserting into new tables
create table employee2 (
    id number(10) primary key,
    name varchar2(30) not null,
    age number(10)
);

desc employee2;
select * from employee2;
insert into employee2 values (3, 'abdulbasid', 24);
insert into employee2 (id, age) values (4, 25);

create table employee3 (
    id number(10) primary key, 
    name varchar2(30) not null,
    age number(10) check (age > 22),
    dept varchar2(30) default 'trainee',
    email varchar2(30) unique,
    contactNo varchar2(30) unique
);

desc employee3;
insert into employee3 values (2, 'rahul', 23, 'hr', 'rahul@xyz.com', '7896888787');
insert into employee3 (id, name, age) values (3, 'kumar', 30);
select * from employee3;

create table employee4 (
    id number(10),
    name varchar2(30),
    age number,
    constraint pk1 primary key (id)
);

-- Foreign key example
create table dept (
    id number(10) primary key,
    name varchar2(30) not null,
    manager varchar2(30)
);

insert into dept values (101, 'developer', 'ankit');
select * from dept;

create table emp (
    id number(10) primary key,
    name varchar2(30),
    age number(10),
    salary number(10),
    deptid number(10),
    constraint fk1 foreign key (deptid) references dept (id) on delete set null
);

desc emp;
select * from emp;
select * from dept;
insert into emp values (4, 'raj', 26, 41000, 101);
delete from emp where id = 4;
delete from dept where id = 101;
drop table emp;
drop table dept;

create table dept (
    id number(10) primary key,
    name varchar2(30) not null,
    manager varchar2(30)
);

insert into dept values (101, 'tester', 'rahul');
select * from dept;

create table emp (
    id number(10) primary key,
    name varchar2(30),
    age number(10),
    salary number(10),
    deptid number(10),
    constraint fk1 foreign key (deptid) references dept (id) on delete set null
);

desc emp;
select * from emp;
select * from dept;
insert into emp values (4, 'raj', 26, 41000, 101);
delete from emp where id = 4;
delete from dept where id = 101;
drop table emp;
drop table dept;

create table emp1 (
    id number(10) primary key,
    name varchar2(30),
    age number(10),
    salary number(10),
    deptid number(10),
    constraint fk2 foreign key (deptid) references dept (id) on delete cascade
);

insert into emp1 values (1, 'mohan', 30, 42000, 100);
insert into emp1 values (2, 'ankul', 32, 24000, 100);
insert into emp1 values (3, 'arun', 24, 32000, 100);
insert into emp1 values (4, 'mohit', 27, 51000, 101);
insert into emp1 values (5, 'raj', 28, 52000, 101);
select * from emp1;
select * from dept;
delete from dept where id = 101;
insert into dept values (102, 'hr', 'rohit');

-- Using LIKE operator
select * from employee;
select * from employee where name like 's%';
select * from employee where name like '%t';
select * from employee where name like '_a%';
select * from employee where name like '__n%';
select * from employee where name like '%a%';

-- Filtering and subqueries
select * from employee;
select * from employee where salary > 45000;
select * from employee where salary > (select salary from employee where name = 'ankit');
select * from employee where salary > (select salary from employee where dept = 'developer');

-- IN, ANY, ALL operators
select * from employee;
select * from employee where id = 1;
select * from employee where id in (1, 2, 3, 8, 9, 10, 11);
select * from employee where id in (101, 20, 3, 8, 9, 10, 11);
select * from employee where id > 5;
select * from employee where id > any (4, 6, 7);
select * from employee where id > all (4, 6, 7);
select * from employee where salary > any (select salary from employee where dept = 'developer') and dept != 'developer';
select * from employee where salary > all (select salary from employee where dept = 'developer');

-- SQL Joins
select * from emp;
select * from dept;
insert into dept values (102, 'admin', 'raj');
insert into dept values (103, 'security', 'mohan');
update emp set deptid = 101 where id = 4;
insert into emp (id, name, age, salary) values (6, 'ankul', 30, 32000);

select * from emp inner join dept on emp.deptid = dept.id;
select * from emp left outer join dept on emp.deptid = dept.id;
select * from emp right outer join dept on emp.deptid = dept.id;
select * from emp full outer join dept on emp.deptid = dept.id;

select e.id, e.name, e.age, e.salary, d.name, d.manager 
from emp e inner join dept d on e.deptid = d.id 
where e.salary > 40000 
order by e.salary desc;

select * from emp cross join dept;

-- SET operators
create table bangaloreoffice (
    id number(10),
    name varchar2(30),
    dept varchar2(30)
);

create table chennaioffice (
    id number(10),
    name varchar2(30),
    dept varchar2(30)
);

insert into bangaloreoffice values (1, 'abdul', 'hr');
insert into bangaloreoffice values (2, 'rahul', 'tester');
insert into bangaloreoffice values (3, 'ravi', 'developer');
insert into bangaloreoffice values (4, 'geethika', 'hr');
insert into chennaioffice values (1, 'sachin', 'hr');
insert into chennaioffice values (2, 'sourab', 'hr');
insert into chennaioffice values (3, 'ankit', 'hr');
insert into chennaioffice values (4, 'mahesh', 'hr');

select * from bangaloreoffice;
select * from chennaioffice;

select * from bangaloreoffice union select * from chennaioffice;
select * from bangaloreoffice union all select * from chennaioffice;
select * from bangaloreoffice intersect select * from chennaioffice;
select * from bangaloreoffice minus select * from chennaioffice;

-- SQL functions
select round(100.234) from dual;
select round(100.567) from dual;
select round(100.23456, 1) from dual;
select round(100.23456, 2) from dual;
select round(200.9678, 2) from dual;
select trunc(200.9678, 2) from dual;

select id, name, salary, salary / 30, round(salary / 30), round(salary / 30, 1), round(salary / 30, 2) from employee;

select round(99.785) from dual;  -- Output: 100
select trunc(99.785) from dual;  -- Output: 99

select mod(3,2) from dual;  -- Output: 1
select mod(3,3) from dual;  -- Output: 0
select mod(8,3) from dual;  -- Output: 2


select concat('abdulbasid',' shaik') from dual;  -- Output: abdulbasid shaik

select id, name, concat('Welcome ', name) from employee;
select id, name, concat(id, name) from employee;

select id, name, length(name), substr(name, 1, 3) from employee;
select id, name, length(name) from employee where length(name) > 5 and name like 's%';
select id, name, length(name) from employee where length(name) > 5 or name like 's%';

select instr('sachin', 's') from dual;  -- Output: 1
select instr('sachin', 'a') from dual;  -- Output: 2
select instr('sachin', 'i') from dual;  -- Output: 5
select id, name, instr(name, 'a') from employee;
select id, name, instr(name, 'a') from employee where instr(name, 'a') > 0 and instr(name, 'a') <= 2;

select lpad(45000, 10, '-') from dual;  -- Output: -----45000
select rpad(45000, 10, '-') from dual;  -- Output: 45000-----
select id, name, lpad(salary, 12, '*') from employee;
select replace('sachin', 'a', 'bbbbbb') from dual;  -- Output: sbbbbbbchin
select id, name, replace(name, 'a', ' ') from employee;

select id, name, upper(name), lower(name), initcap(name) from employee;
select * from employee;
select id, name, dept from employee where dept='Developer';
update employee set name='John' where id=2;
select id, name, dept from employee where lower(dept) = 'developer';
select * from employee where lower(name)='john';

-- sql Date Functions

select sysdate from dual;
select sysdate+1 from dual;
select sysdate+5 from dual;
select sysdate-1 from dual;
select id, name, dob from employee;
select id, name, dob, (sysdate-dob) from employee;
select id, name, dob, round((sysdate-dob)) from employee;
select id, name, dob, round((sysdate-dob)/365) as year from employee;
select id, name, dob, round((sysdate-dob)/365) as year from employee order by year;
select id, name, dob, round((sysdate-dob)/365) as year from employee order by year desc;
select months_between('15-mar-2024', '15-apr-2024') from dual;  -- Output: -1
select id, name, dob, months_between(sysdate, dob) from employee;
select id, name, dob, round(months_between(sysdate, dob)) from employee;

alter table employee add (doj date);
select * from employee;
select add_months(sysdate, 1) from dual;
select add_months(sysdate, 2) from dual;
select add_months('20-jan-24', 3) from dual;
select next_day('15-jun-24', 'saturday') from dual;
select last_day('15-jun-24') from dual;
select last_day('15-feb-24') from dual;
select id, name, dob, to_char(dob, 'DD MM YYYY') from employee;
select id, name, dob, to_char(dob, 'DD MONTH YYYY') from employee;
select id, name, dob, to_char(dob, 'DAY MONTH YYYY') from employee;
select id, name, dob, to_char(dob, 'DAY MONTH year') from employee;
select id, name, dob, to_char(dob, 'DAY MONTH year ') from employee;
select to_char(sysdate, 'DAY MONTH YY, HH MI SS') from dual;
select id, name, dob, to_char(dob, 'dd month yy HH MI SS') from employee;

-- sql Advanced Queries (Window Functions)
select * from emp10;
select * from employee;
update employee set dept='developer' where id='4';
select dept, count(name) from employee group by dept;
select name, count(name) from employee group by name;
select id, name, salary, age, dept, count(name) over (partition by dept) from employee;
select id, name, salary, age, dept, count(name) over (partition by dept), avg(salary) over (partition by dept) from employee;
select id, name, salary, dept, rank() over(order by salary) from employee;
select id, name, salary, dept, rank() over( partition by dept order by salary) from employee;
select id, name, salary, dept, sum(salary) over (partition by dept) from employee;
select id, name, salary, dept, rank() over (order by salary) from employee;
select id, name, salary, dept, dense_rank() over (order by salary) from employee;
select * from employee;
select id, name, salary, dept, dense_rank() over(order by salary) as emprank from employee;
select * from (select id, name, salary, dept, dense_rank() over(order by salary desc) as emprank from employee) where emprank=4;

-- sql views
select * from employee;
create view developerview as select * from employee where dept='developer';
select * from developerview;
create view namelist as select id, name, age from employee;
select * from namelist;

--sql index
select * from employee;
create index empidindex on employee(id);
select * from employee where id=4;
