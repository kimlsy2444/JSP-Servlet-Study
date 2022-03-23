drop database if exists testdb;
create database testdb;

use testdb;

drop table if exists members;

create table members(
    id varchar(20) primary key,
    pw varchar(20) not null,
    username varchar(20) not null,
    phone varchar(20)
);

-- delete from members;
select * from members;

update members 
	set username = "김연아"
    where id = "kim";
    
delete from members 
	where id ="kim" and pw ="1234";


alter table members
	drop column phone;