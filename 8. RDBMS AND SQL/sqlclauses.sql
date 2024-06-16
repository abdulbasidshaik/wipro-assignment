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

