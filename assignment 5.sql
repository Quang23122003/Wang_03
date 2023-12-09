DROP DATABASE IF EXISTS Training;
CREATE DATABASE IF NOT EXISTS Training;
USE Training;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64)
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64)
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_name NVARCHAR(64) NOT NULL UNIQUE,
	full_name NVARCHAR(64) NOT NULL,
	email VARCHAR(32) UNIQUE,
	gender ENUM('Male', 'Female', 'Unknown'),
    salary INT,
	department_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (department_id) REFERENCES Department(id),
	FOREIGN KEY (position_id) REFERENCES `Position`(id)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name NVARCHAR(64),
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS GroupMember;
CREATE TABLE GroupMember(
	group_id BIGINT NOT NULL,
	account_id BIGINT,
	joined_date DATE,
	FOREIGN KEY (group_id) REFERENCES `Group`(id),
	FOREIGN KEY (account_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS QuestionType;
CREATE TABLE QuestionType(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type varchar(32)
);

DROP TABLE IF EXISTS Category;
CREATE TABLE Category(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category varchar(32)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	category_id BIGINT,
	type_id BIGINT NOT NULL,
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (category_id) REFERENCES Category(id),
	FOREIGN KEY (type_id) REFERENCES QuestionType(id),
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS Anwser;
CREATE TABLE Anwser(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	content text,
	question_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (question_id) REFERENCES Question(id)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	code varchar(16),
	title NVARCHAR(64),
	duration INT,
	category_id BIGINT,
	creator_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (category_id) REFERENCES Category(id),
	FOREIGN KEY (creator_id) REFERENCES Account(id)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	exam_id BIGINT,
	question_id BIGINT,
	FOREIGN KEY (exam_id) REFERENCES Exam(id),
	FOREIGN KEY (question_id) REFERENCES Question(id)
);


INSERT INTO Department(name) VALUES('Sale'), ('Marketing'), ('R&D'), ('Accounting');
SELECT * FROM Department;

INSERT INTO `Position`(name) VALUES('Staff'), ('Manager'), ('PM');
SELECT * FROM `Position`;

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr01', 'Nguyen Bxx Cxx', 'usr01@email.com', 'Male', 1, 1, CURDATE(), 10000),
('usr02', 'Nguyen Bxx Cxx', 'usr02@yahoo.com', 'Male', 1, 1, '2020-05-11', 15000),
('usr03', 'Tran Bxx Cxx', 'usr03@email.com', 'Female', 1, 1, CURDATE(), 12000),
('usr04', 'Nguyen Bxx Cxx', 'usr04@yahoo.com', 'Female', 1, 2, NULL, 14000),
('usr05', 'Tran Bxx Cxx', 'usr05@email.com', 'Male', 2, 1, CURDATE(), 11000),
('usr06', 'Nguyen Bxx Cxx', 'usr06@yahoo.com', 'Male', 2, 1, CURDATE(), 15500),
('usr07', 'Le Bxx Cxx', 'usr07@email.com', 'Male', 2, 2, NULL, 12500);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr08', 'Axx Bxx Cxx', 'usr08@email.com', 'Male', 1, 1, CURDATE(), 17000),
('usr09', 'Le Bxx Cxx', 'usr09@yahoo.com', 'Female', 3, 1, '2021-06-19', 16500),
('usr10', 'Le Bxx Cxx', 'usr10@email.com', 'Female', 3, 1, CURDATE(), 13000),
('usr11', 'Le Bxx Cxx', 'usr11@yahoo.com', 'Male', 3, 2, NULL, 18500),
('usr12', 'Tran Bxx Cxx', 'usr12@yahoo.com', 'Female', 4, 1, '2022-02-23', 14000),
('usr13', 'Le Bxx Cxx', 'usr13@email.com', 'Male', 4, 1, NULL, 12000),
('usr14', 'Tran Bxx Cxx', 'usr14@email.com', 'Female', 4, 2, CURDATE(), 15500);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr15', 'Axx Bxx Cxx', 'usr15@email.com', 'Male', 1, 1, CURDATE(), 16000),
('usr16', 'Le Bxx Cxx', 'usr16@yahoo.com', 'Female', 3, 1, CURDATE(), 19500),
('usr17', 'Le Bxx Cxx', 'usr17@email.com', 'Female', 3, 1, NULL, 14000),
('usr18', 'Le Bxx Cxx', 'usr18@yahoo.com', 'Male', 3, 2, '2022-07-09', 17000),
('usr19', 'Tran Bxx Cxx', 'usr19@email.com', 'Female', 4, 1, CURDATE(), 18000),
('usr20', 'Le Bxx Cxx', 'usr20@yahoo.com', 'Male', 4, 1, NULL, 15000),
('usr21', 'Tran Bxx Cxx', 'usr21@email.com', 'Female', 4, 2, CURDATE(), 13000);

INSERT INTO Account(user_name, full_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('usr22', 'Axx Bxx Cxx', 'usr22@gmail.com', 'Male', 1, 1, CURDATE(), 12000),
('usr23', 'Le Bxx Cxx', 'usr23@yahoo.com', 'Female', 3, 1, CURDATE(), 13000),
('usr24', 'Le Bxx Cxx', 'usr24@email.com', 'Female', 3, 1, NULL, 14000),
('usr25', 'Le Bxx Cxx', 'usr25@gmail.com', 'Male', 3, 2, '2022-07-09', 15000),
('usr26', 'Tran Bxx Cxx', 'usr26@email.com', 'Female', 4, 1, CURDATE(), 16000),
('usr27', 'Le Bxx Cxx', 'usr27@gmail.com', 'Male', 4, 1, NULL, 17000),
('usr28', 'Tran Bxx Cxx', 'usr28@email.com', 'Female', 4, 2, CURDATE(), 18000);

-- SELECT * FROM Account;

INSERT INTO `Group`(name, creator_id, created_date) 
VALUES ('Lap Trinh', 2, CURDATE()), ('Choi Game', 3, CURDATE());

INSERT INTO GroupMember 
VALUES (1, 1, CURDATE()), (1, 2, CURDATE()),
(2, 1, CURDATE()), (2, 2, CURDATE()),
(2, 3, CURDATE()), (2, 4, CURDATE());

INSERT INTO `Group` (name, creator_id, created_date) 
VALUES('Rocket41', 1, '2020-05-19'), ('Rocket42', 2, '2020-05-20'),('Rocket43', 2, '2021-07-25'), 
('Rocket44', 3, '2022-07-14'), ('Rocket45', 1, '2020-09-11'), ('Rocket46', 1, '2022-08-27');

SELECT * FROM `Group`;

INSERT INTO GroupMember (group_id, account_id, joined_date)
VALUES (1, 1, '2020-05-20'), (1, 2, '2020-05-21'), (1, 3, '2020-05-22'),
(2, 1, '2020-05-20'), (2, 2, '2020-05-20'), (2, 4, '2020-05-23'), (2, 5, '2020-05-24'),
(3, 2, '2021-07-29'), (3, 7, '2020-08-01'), (3, 5, '2021-09-20'),
(4, NULL, NULL), (5, NULL, NULL), (6, NULL, NULL);

SELECT * FROM GroupMember;

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	staff_code NVARCHAR(64) NOT NULL UNIQUE,
	staff_name NVARCHAR(64) NOT NULL,
	email VARCHAR(32) UNIQUE,
	gender ENUM('Male', 'Female', 'Unknown'),
    salary INT,
	department_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	created_date DATE,
	FOREIGN KEY (department_id) REFERENCES Department(id),
	FOREIGN KEY (position_id) REFERENCES `Position`(id)
);

INSERT INTO Staff(staff_code, staff_name, email, gender, department_id, position_id, created_date, salary)
SELECT user_name, full_name, email, gender, department_id, position_id, created_date, salary
FROM Account WHERE id >= 20;

INSERT INTO Staff(staff_code, staff_name, email, gender, department_id, position_id, created_date, salary)
VALUES ('staff01', 'Axx Bxx Cxx', 'staff01@gmail.com', 'Male', 1, 1, CURDATE(), 12000),
('staff02', 'Le Bxx Cxx', 'staff02@yahoo.com', 'Female', 3, 1, CURDATE(), 13000),
('staff03', 'Le Bxx Cxx', 'staff03@email.com', 'Female', 3, 1, NULL, 14000),
('staff04', 'Le Bxx Cxx', 'staff04@gmail.com', 'Male', 3, 2, '2022-07-09', 15000);

select * from `group`;
select * from groupmember;

select * from account inner join groupmember on account.id = groupmember.account_id;


select * from account left join groupmember on account.id = groupmember.account_id;

select * from account left join groupmember on account.id = groupmember.account_id
where groupmember.account_id is null;

select group_id,full_name from account inner join groupmember on account.id = groupmember.account_id;
select group_id,full_name from account right join groupmember on account.id = groupmember.account_id;

select group_id,full_name from account right join groupmember on account.id = groupmember.account_id
where groupmember.account_id is null;

select user_name,full_name from account;
select staff_code,staff_name from staff;

select full_name from account
Intersect
select staff_name from staff;

select full_name from account
except
select staff_name from staff;

select full_name from account
union 
select staff_name from staff;

select full_name from account
union all 
select staff_name from staff;
 -- question 1
 select A.id,A.user_name,A.full_name,A.email,A.gender,P.name from account as a
 inner join position as P on A.position_id =P.id;


-- ques 2

select created_date from  account
where created_date > 2010-12-20;

--    4
 Select p.name,count(p.name) as so_nhanvien from account as a inner join position as p on a.position_id = p.id
 group by p.name 
 having so_nhanvien > 9;

-- 5
select * from category ;
INSERT INTO category ( category)
values ('HI'),('HA'),('HO'),('HY');

select * from questiontype ;
INSERT INTO questiontype (type )
values ('BT'),('BQ'),('BA'),('BE'),('BT');

select * from question ;
INSERT INTO question (content , category_id , type_id , creator_id , created_date)
values ('Em ăn cơm chưa ', 1,2,1,curdate()),
(' Em Nhà ở đâu thế  ', 1,3,2,curdate()),
('Siêu Sale ', 1,4,3,curdate());

SELECT count(content) FROM question;

SELECT content
FROM question
ORDER BY length(content) DESC
LIMIT 1;


-- 6

select  count(*) from question
where category_id;
 -- 7
 
  select * from question as q inner join exam as e on q.category_id = e.category_id;
  
  
  -- 8
select * from anwser;
insert into anwser(content,question_id,created_date)
values ('dạ rồi',1,curdate()),
('hải phòng không lòng vòng',2,curdate());


select * from anwser as a inner join question as q on a.id = q.id;
SELECT content, COUNT(*) AS so_luong_cau_tra_loi
FROM anwser
GROUP BY id
ORDER BY so_luong_cau_tra_loi DESC
LIMIT 1;

-- 9
select * from account as a inner join `group` as g on a.id = g.id; 
SELECT id, COUNT(*) AS so_luong_account
FROM account
GROUP BY id;
-- 10
select min(name) from account INNER JOIN position ON account.position_id = position.id ;
-- 11
select * from account INNER JOIN department ON account.department_id = department.id ;
  select  department_id, department.name,  count(*)  from account 
    INNER JOIN department ON account.department_id = department.id
	group by department_id ;

-- 14
select * from account  LEFT JOIN groupmember ON account.id = groupmember.account_id
     where  groupmember.account_id is   null;
     
     -- 15
     select * from question left join anwser on question.id = anwser.id
    
     group by id;
     
     select * from account;
select * from question as q left join answer as a on q.question_id = a.questionId where a.content is null;

-- IN,NOT,ANY,ALL

select user_name,full_name,email,d.name from Account a
inner join department d on a.department_id = d.id where d.name IN ('sale','marketing');

select user_name,full_name,email from Account a
where a.department_id NOT IN (select id from department where name IN ('sale','marketing'));

select full_name,salary from account a where salary > any (
select salary from account a
where a.department_id IN (SELECT id FROM Department WHERE name IN('sale') AND salary >14000)
);

select full_name,salary from account where salary < ALL(
select salary from account  a
where a.department_id  IN (SELECT id FROM Department WHERE name IN('sale') AND salary >14000)
);

select full_name,salary from account where salary != all(
select salary from account  a
where a.department_id  IN (SELECT id FROM Department WHERE name IN('sale') AND salary >14000)
);

select full_name,salary from account a where salary > 15000;
-- exists dùng để check
select exists(select*from account where salary > 15000);

select exists(select*from account where created_date < 2022);

explain select * from account a where salary > 15000;
explain select exists(select*from account where salary > 15000);

-- CTE

WITH 
sale_cte as (
select * from account where department_id = (select id from department where name = 'sale')
)
select * from sale_cte;

--
select sum(salary) as dept_payment,department_id from account group by department_id;

select sum( dept_payment)/count(*) from (select SUM(salary) as dept_payment,department_id from account group by department_id) A;
-- 103500.0000 là gtri tb

SELECT A.dept_payment - B.avg_payment FROM
(
SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id) A,
(
SELECT SUM(dept_payment)/count(*) AS avg_payment FROM (SELECT SUM(salary) AS dept_payment, department_id FROM Account GROUP BY department_id) C
) B;
WITH
    dept_payment AS ( SELECT SUM(salary) AS dept_salary, department_id FROM Account GROUP BY department_id ),
    avg_payment AS ( SELECT SUM(dept_salary)/count(*) AS dept_avg FROM dept_payment)
SELECT dept_payment.dept_salary - avg_payment.dept_avg as hieu   FROM dept_payment, avg_payment having hieu  > 0;
-- 1
create view sale_tbl as 
select user_name,full_name,email,d.name from Account a
inner join department d on a.department_id = d.id where d.name = 'sale'
;
 -- 2
 create view group_members as
select full_name,g.group_id from account a INNER JOIN groupmember g ON a.id = g.account_id
 where g.group_id;
-- 3 
select * from question;
insert into question (content,category_id,type_id,creator_id,created_date)
values ('em nhà ở đâu thế',1,2,curdate()),
('em học lớp mấy',2,3,curdate()),
('em có bạn trai chưa',)

-- 4
create view so_cau_hoi as
select a.department_id,d.name,count(*) as so_luong from account a inner join department d on a.department_id = d.id 
group by a.department_id,d.name ;

-- 5
create view content_sql as
select * from account a inner join question q on a.id = q.id 
WHERE full_name LIKE 'Nguyễn%';



-- SET SQL_SAFE_UPDATES = 0