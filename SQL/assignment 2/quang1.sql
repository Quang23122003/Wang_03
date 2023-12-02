create database SaleManagement;
Use SaleManagement ;
create table tranee(
 tranee_id bigint not null auto_increment primary key,
 full_name nvarchar(50),
 birth_day date,
 gender enum('male','female','unknown'),
 ET_IQ nvarchar(20), 
 ET_Gmath nvarchar(20),
 ET_English nvarchar(20),
 Trainning_class bigint,
 evaluation_notes 	nvarchar(50)
);
alter table tranee 
add column VTI_account nvarchar(50) not null unique;

