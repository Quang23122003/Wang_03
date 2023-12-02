create database Salemanagement;
use salemanagent;
create table department(
department_id bigint not null auto_increment primary key,
department_name nvarchar(50),
day_of_purchase date,
email nvarchar(50) unique
);

create table position (
position_id bigint not null auto_increment primary key,
position_name nvarchar(50)
);

create table account (
account_id bigint not null auto_increment primary key,
email_address nvarchar(50) unique,
user_name nvarchar(50),
full_name nvarchar(50),
department_id int, 
position_id int ,
create_day date
);

create table `group`(
group_id bigint not null auto_increment primary key,
group_name nvarchar(50) unique ,
creator_id nvarchar(50) unique ,
create_date date
);

create table groupaccount(
group_id bigint not null auto_increment primary key,
account_id bigint unique,
join_date date
);

create table typequestion(
type_id bigint not null auto_increment primary key,
type_name enum('essay','multiple-choice')
);

create table categoryquestion(
category_id bigint not null auto_increment primary key,
category_name enum('java','net','sql','ruby','postman')
);

create table question(
question_id bigint not null auto_increment primary key,
content nvarchar(100),
category bigint,
type_id bigint,
creator_id bigint,
create_date date
);

create table answer(
answer_id bigint not null auto_increment primary key,
content nvarchar(100),
question_id bigint,
is_correct  enum('đúng','sai')
);
create table exam(
exam_id bigint not null auto_increment primary key,
co_de   bigint,
title   nvarchar(50),
category_id bigint,
duration int,
creator_id bigint,
create_date date
);

create table examquestion(
exam_id bigint not null auto_increment primary key,
question_id bigint
);
Drop table if exists exam;
drop table if exists department;
   
use salemanagement;

select * from department;
select * from position;
select * from account;
select * from `group`;
select * from groupaccount;
select * from typequestion;
select * from categoryquestion;
select * from question;
select * from answer;
select * from exam;
select * from examquestion;

insert into department (department_name,day_of_purchase,email) 
values ('songthu','2023-12-1','thu@gmail.com');
insert into department (department_name,day_of_purchase,email) 
values ('haiho','2023-12-1','haiho@gmail.com');
insert into position (position_name)
values ('nhan vien');
insert into account (email_address,user_name,full_name,department_id,position_id,create_day)
values ('quang@gmail.com','quang','tranquang','2','1','2023-12-1');
insert into `group` (group_name,creator_id,create_date)
values ('nhom 3','4','2023-12-1');
insert into groupaccount (account_id,join_date)
values ('6','2023-12-1');
insert into typequestion (type_name)
values ('essay');
insert into typequestion (type_name)
values ('multiple-choice');
insert into categoryquestion (category_name)
values ('sql');
insert into question(content,category,type_id,creator_id,create_date)
values ('chuongtrinhsale','1','3','2','2','2023-12-1');
insert into answer (content,question_id,is_correct)
values ('san sale','3','sai');
insert into exam (co_de,title,category_id,duration,creator_id,create_date)
values ('1','HK2','3','90','2',now());
insert into examquestion(question_id)
values ('10');




