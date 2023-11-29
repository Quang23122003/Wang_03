create database Salemanagement;
use salemanagent;
create table department(
department_id bigint,
department_name nvarchar(50),
day_of_purchase date
);

create table position (
position_id bigint,
position_name nvarchar(50),
day_of_purchase date
);

create table account (
account_id nvarchar(50),
email_address nvarchar(50),
user_name nvarchar(50),
full_name nvarchar(50),
department_id nvarchar(50),
position_id nvarchar(50),
create_day date
);

create table trainee (
trainee_id nvarchar(50),
full_name nvarchar(50),
birth_date date,
GENDER    nvarchar(50),
ET_IQ     varchar(20),
ET_Gmath  varchar(20),
ET_English varchar(50),
Training_class nvarchar(50),
Evaluation_note nvarchar(50),


);



