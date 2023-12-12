-- 1
drop procedure if exists GetAccountsByDepartmentName;
       DELIMITER $$
       CREATE PROCEDURE GetAccountsByDepartmentName()
      
       begin
         select * from account;
         end$$
         
         DELIMITER $$
 call GetAccountsByDepartmentName();
 
-- 2
drop procedure if exists getmember
delimiter $$
create procedure getmember()
begin
select group_id, count(account_id) AS numberaccount from groupmember group by group_id ;
end$$

delimiter ; 

call getmember();
-- 
-- 3
 drop procedure if exists gettypee
delimiter $$
create procedure gettypee()
begin
select  count(q.id) AS numberquestion from question q INNER JOIN questiontype t ON q.type_id = t.`type`
where created_date > "2023-12-01" AND created_date <"2023-12-31" 
group by q.type_id ;
end$$
delimiter ;
call gettypee();

-- Cau 3
drop procedure if exists gettypee
delimiter $$
create procedure gettypee()
begin
select q.type_id, count(q.id) AS numberquestion from question q INNER JOIN questiontype t ON q.type_id = t.id
where created_date > "2023-12-01" AND created_date <"2023-12-31" 
group by q.type_id;
end$$
delimiter ;
call gettypee();

select * from questiontype

select * from question
where created_date
-- 4
drop procedure if exists GetIdTypeQuestion
delimiter $$
create procedure GetIdTypeQuestion()
begin
select t.id from question q inner join questiontype t ON q.id = t.id
GROUP BY t.id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
end$$
delimiter ;
call GetIdTypeQuestion();
-- 4
drop procedure if exists cau4
delimiter $$
create procedure cau4()
begin
	select q.type_id
	from question q 
		inner join questiontype t ON q.type_id = t.id
	GROUP BY q.type_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
end$$
delimiter ;
call cau4();
-- 5
drop procedure if exists cau5
delimiter $$
create procedure cau5()
begin
	select q.type_id,t.type
	from question q 
		inner join questiontype t ON q.type_id = t.id
	GROUP BY q.type_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
end$$
delimiter ;
call cau5()
-- 8
drop procedure if exists DeleteExamById
delimiter $$
CREATE PROCEDURE DeleteExamById()
BEGIN
    DELETE FROM exam WHERE id;
END$$
delimiter ;
call DeleteExamById();
-- 12

drop procedure if exists GetQuestionByYear
delimiter $$
create procedure GetQuestionByYear()
begin
   select  month(created_date), COUNT(created_date) AS Question
   WHERE YEAR(created_date) = YEAR(CURDATE())
   group by month(created_date)
   ORDER BY  month(created_date);
   DECLARE @month INT;
   DECLARE @questioncount INT;
   OPEN monthCursor;

    FETCH NEXT FROM monthCursor INTO @month, @questionCount;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Tháng ' + CONVERT(VARCHAR, @month) + ': ' + CONVERT(VARCHAR, @questionCount) + ' câu hỏi';

        FETCH NEXT FROM monthCursor INTO @month, @questionCount;
    END;

    CLOSE monthCursor;
    DEALLOCATE monthCursor;
END;
end$$
delimiter ;
call GetQuestionByYear();


select * from question
