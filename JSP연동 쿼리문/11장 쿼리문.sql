
drop table if exists members;


create table MemberDTO(
	username varchar(15),
    id varchar(15),
    pw varchar(15),
    phone1 varchar(15),
    phone2 varchar(15),
    phone3 varchar(15),
    gender varchar(15)
);

select * from memberdto;
-- insert into memberdto values ('홍길동','Hong','1234''010','1234','5678','남자');

insert into MemberDTO values ('홍길동','Hong','1234','010','1234','1234','남자');
insert into MemberDTO values ('가나다','ga','1234','010','1234','1234','남자');
insert into MemberDTO values ('라마바','ra','1234','010','1234','1234','남자');
insert into MemberDTO values ('사아자','sa','1234','010','1234','1234','남자');