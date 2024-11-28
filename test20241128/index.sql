create table student(
sno varchar2(3) NOT NULL PRIMARY KEY,
sname varchar2(10),
tel varchar2(15),
bdate date,
lino varchar2(4),
status char(1));

insert into student VALUES ('1', '전한국', '010-1111-2222', '20121201', '100', '2');
insert into student VALUES ('2', '주선미', '010-1111-3333', '20121204', '200', '2');
insert into student VALUES ('3', '비소미', '010-1111-4444', '20121001', '200', '1');
insert into student VALUES ('4', '우소망', '010-1111-5555', '20121109', '100', '2');
insert into student VALUES ('5', '리동국', '010-1111-6666', '20121224', '200', '2');
insert into student VALUES ('6', '내소라', '010-1111-7777', '20121208', '200', '1');

create table licence(
lno varchar2(4) NOT NULL PRIMARY KEY,
lname varchar(20),
lv char(1));

insert into licence values ('100', '정보처리', '1');
insert into licence values ('200', '정보처리', '2');
insert into licence values ('300', '웹디자인', '1');
insert into licence values ('400', '전자출판', '1');