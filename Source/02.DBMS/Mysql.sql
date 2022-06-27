-- DCL (Create account, Give access rights, Remove access rights, Delete account)
-- DDL (Constraints, NO SEQUENCE)
-- DML (OUTER JOIN, AND=&&, OR=||, single-line functions)

show databases; -- get list of databases

-- [1] ■■■■■■■■ DCL ■■■■■■■■
create user user01 identified by 'password'; -- Make account
grant all on *.* to user01; -- Give access
revoke all on *.* from user01;
drop user user01;

show databases;
create database kimdb; -- making new database alled 'kimdb'
use kimdb; -- going in to database 'kimdb'
select database(); -- checking which database I am currently insert
use world; -- going in to database 'world'
use kimdb; -- going in to database 'kimdb'
show tables;

-- [2] ■■■■■■■■ DDL ■■■■■■■■
create table emp(
	empno numeric(4) primary key,
    ename varchar(20) not null,
    nickname varchar(20) unique,
    sal numeric(7,2) check (sal>0),
    hiredate datetime default now(),
    comm numeric (7,2) default 0);
    
select * from emp;
drop table if exists emp;

-- Major (mCode (sequencial num):PK, mName, mOffice)
-- Student (sNO:PK, sName, mCode)

create table major(
	mCode int primary key auto_increment,
    mName varchar(20),
    mOffice varchar (50));

create table student (
	sNo int primary key,
    sName varchar(20),
    mCode int references major (mCode));

insert into major (mName, mOffice) 
	values ('ComSci', '402');
insert into major (mName, mOffice) 
	values ('Business', '502');
insert into major (mName, mOffice) 
	values ('Economics', '301');

select *
	from major;
    
insert into student 
	values (1111, 'Unie', 1);
insert into student 
	values (2222, 'Jimmy', 2);
insert into student 
	values (3333, 'Sean', 3);
insert into student
	values (4444, 'Max', 4);

select *
	from student;

drop table if exists student;
drop table if exists major;

create table Major(
	mCode int auto_increment,
    mName varchar(30) not null,
    mOffice varchar(30),
    primary key (mCode));
    
create table student(
	sNo int,
    sName varchar(30),
    primary key (sNo),
    mCode int,
    foreign key (mCode) references Major(mCode));

insert into major (mName, mOffice) 
	values ('ComSci', '402');
insert into major (mName, mOffice) 
	values ('Business', '502');
insert into major (mName, mOffice) 
	values ('Economics', '301');
    
insert into student 
	values (1111, 'Unie', 1);
insert into student 
	values (2222, 'Jimmy', 2);
insert into student 
	values (3333, 'Sean', 3);
insert into student
	values (4444, 'Max', 4);  -- ERROR
    
select sNo, sName, s.mCode, mName, mOffice
	from Student s, Major m
    where s.mCode = m.mCode;


-- TABLE TO BE USED IN JAVA (JDBC)
drop table if exists personal; -- similar to table EMP
drop table division; -- similar to table DEPT

-- CREATING TABLE 'DIVISION'
create table division(
	dno int, -- department number
    dname varchar(20), -- department name
	phone varchar(20), -- department tel number
    positon varchar(20), -- department location
    primary key(dno));
    
insert into division values (10, 'finance', '02-545-5555', 'Seoul');
insert into division values (20, 'research', '02-343-6666', 'Dubai');
insert into division values (30, 'sales', '02-232-7777', 'Milan');
insert into division values (40, 'marketing', '02-676-8888', 'London');

select * from division;

create table personal(
	pno int, 						-- employee number
    pname varchar(20) not null,		-- employee name
    job varchar(20) not null,		-- employee job
    manager int,					-- manager's number
    startdate date,					-- hiredate
    pay int,						-- salary
    bonus int,						-- commission
    dno int,						-- department number (from division)
    primary key(pno),
    foreign key(dno) references division(dno));

insert into personal values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);
insert into personal values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);
insert into personal values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);
insert into personal values (1114,'james','manager',1001,'1990-04-12',3975,null,20);
insert into personal values (1001,'bill','president',null,'1989-01-10',7000,null,10);
insert into personal values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);
insert into personal values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);
insert into personal values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);
insert into personal values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);
insert into personal values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);

select * from personal;
select * from division;


-- [3] ■■■■■■■■ DML ■■■■■■■■ (OUTER JOIN, AND=&&, OR=||, single-line functions)

-- 1. PRINT pno, pname, pay

select pno, pname, pay
from personal;

-- 2. PRINT ALL EMPLOYEES WHOS 2000<pay<5000

select *
from personal
where pay between 2000 and 5000;

-- 3. PRINT pno, pname, phone FOR EMPLOYEES IN dno = 10 =|| dno = 20

select pno, pname, phone
from personal p, division d
where p.dno = d.dno
and p.dno in (10,20);

-- 4. pno, pname, pay WHOS bonus IS null (DESCENDING order pay)

select pno, pname, pay
from personal
where bonus is null
order by pay desc;

-- 5. pno, pname,dno, pay. ORDER dno, pay

select pno, pname, dno, pay
from personal
order by dno, pay;

-- 6. pno, pname, dname

select pno, pname, dname
from personal p, division d
where p.dno = d.dno;

-- 7. pno, pname, manager name

select p.pno, p.pname, m.pname 'Manager name'
from personal p left outer join personal m
on p.manager = m.pno;

-- 8. 사번, 이름, 상사이름(상사가 없는 사람도 출력, 상사가 없으면 대신 null 대신 'ceo')
select w.pno, w.pname, ifnull(m.pname, 'ceo')
	from personal w left outer join personal m
	on w.manager = m.pno; -- left outer join
    
-- 9. employees whos names start with s

select pname
from personal
where pname like 's%';

-- 10. pno, pname, pay, dname, manager name

select p.pno, p.pname, p.pay, dname, m.pname 'Manager name'
from division d, personal p left outer join personal m
on p.manager = m.pno
where d.dno = p.dno;

-- 11. dno, sum(pay), max(pay)

select dno, sum(pay), max(pay)
from personal
group by dno;

-- 12. dname, avg(pay), number of employees

select dname, round(avg(pay),2) , count(*)
from personal p , division d
where d.dno = p.dno
group by dname;

-- 13. dno, sum(pay), number of employees (only depts which have more than 4 employees)

select dno, sum(pay), count(*)
from personal
group by dno
having count(*) >= 4;

-- 14. pno, pname, pay of the employee with highest pay

select pno, pname, pay
from personal
having pay = max(pay);

-- 15. pname, pay, dno of employees with pay > company's avg(pay)

select pname, pay, d.dno
from personal p , division d
where d.dno = p.dno
having pay > (select avg(pay) from personal);

-- 16. add dname to Q15 and order by dname, pay desc

select pname, pay, d.dno, dname
from personal p , division d
where d.dno = p.dno
having pay > (select avg(pay) from personal)
order by dname, pay desc;

-- 17. pname, pay, dno, division average sal, for people who's pay > division average

select pname, pay, p.dno, t.avg "부서평균"
from personal p, (select dno, round(avg(pay)) avg from personal group by dno) t
where p.dno = t.dno
and t.avg < pay;

-- 18. pname, pay and dname of employee hired first

select pname, pay, dname
	from personal p , division d
    where p.dno = d.dno 
    and (select min(startdate) from personal) = startdate;
    
-- 19. pname, pay, division average

select pname, pay, t.avg "부서평균"
	from personal p, (select dno, avg(pay) avg from personal group by dno) t
	where p.dno = t.dno;

-- 20. pname, pay, dname, avg sal of division

select pname, pay, dname,  t.avg "부서평균"
	from personal p , division d, (select dno, avg(pay) avg from personal group by dno) t
    where p.dno = d.dno
    and p.dno = t.dno;

-- Single-line functions that are different between ORACLE AND MYSQL

select round (789.56, 2);
select pname || 's job is' || job || avg
	from personal; -- ERROR
select concat (pname, 's job is', job) 
	from personal; -- CORRECT WAY
    
-- [3.1] Column functions relating to date
    
select year(startdate), month(startdate), day(startdate), 
	hour(startdate), minute(startdate), second(startdate) from personal;

-- Getting current time and date
select sysdate();
select now();

-- Getting current date
select current_date();
select curdate();

-- Getting current time
select current_time();
select curtime();

-- date format (data of type date , 'format')
-- format string: %y: 22(year length 2) | %Y : 2022(year length 4),
-- %M monthName (January, February)| %b short monthName (Jan, Feb...) |  %m month length 2 (01, 02..) | %c month length 1 (1, 2...) 
-- %d day length 2 (20,01,02,03...) | %e day length 1 (20, 1, 2, 3)
-- %H (24h) | %h (12 hour) | %p (PM/AM), %i분, %s초

select date_format(now(), '%Y년%m월%e일 %p %h시 %i분');

-- format (number data) ; add comma every numbers
-- format (number data, # of decimal point)

select format(pay, 1)
	from personal;

-- Delete or edit data in the workbench (compare using the primary key from the 'where' line)
insert into personal (pno, pname, job, manager, startdate, pay, bonus, dno)
	values (1000, 'unie', 'manager', 1001, curdate(), 9000, 900, 40);
commit;
set sql_safe_updates = 0;
delete from personal where pname = 'unie';

-- TOP-N-command
select rownum, pno from personal; -- in mysql, rownum does not exist

select pname, pay from personal order by pay desc limit 5; -- top 5 highest salary earners
select pname, pay from personal order by pay desc limit 3,3; -- 4th highest slary till 6th
select pname, pay from personal order by pay desc limit 5,4; -- 6th highest slary till 9th

-- limit n (1st~nth)
-- limit 3,3 (4th~6th) - 
-- limit 5,4 (6th~9th)








