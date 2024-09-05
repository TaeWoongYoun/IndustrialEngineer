create table tbl_student_202205(
studentid char(8) NOT NULL PRIMARY KEY,
studentname varchar2(20),
majorcode char(2),
jumin varchar2(14),
phone varchar(13),
course char(2));

INSERT INTO tbl_student_202205 VALUES ('20220001', '김길동', '03', '030101-3000001', '010-1111-0001', 'BD');
INSERT INTO tbl_student_202205 VALUES ('20220002', '이길동', '03', '030101-3000002', '010-1111-0002', 'BD');
INSERT INTO tbl_student_202205 VALUES ('20220003', '박길동', '03', '030101-3000003', '010-1111-0003', 'BD');
INSERT INTO tbl_student_202205 VALUES ('20220004', '정길동', '03', '030101-4000004', '010-1111-0004', 'BD');
INSERT INTO tbl_student_202205 VALUES ('20220005', '최길동', '03', '030101-4000005', '010-1111-0005', 'BD');
INSERT INTO tbl_student_202205 VALUES ('20220006', '황길동', '03', '030101-4000006', '010-1111-0006', 'BD');

create table tbl_subject_202205(
subjectcode char(4) NOT NULL PRIMARY KEY,
subjectname varchar2(40),
professorname varchar(20),
classification char(2));

INSERT INTO tbl_subject_202205 VALUES ('S001', '메타버스의이해', '김교수', '02');
INSERT INTO tbl_subject_202205 VALUES ('S002', '게임엔진기초', '이교수', '01');
INSERT INTO tbl_subject_202205 VALUES ('S003', '게임엔진심화', '박교수', '01');
INSERT INTO tbl_subject_202205 VALUES ('S004', '인문학개론', '정교수', '04');

create table tbl_grade_202205(
studentid char(8) NOT NULL,
subjectcode char(4),
mid number(3),
final number(3),
attend number(3),
report number(3),
etc number(3));

INSERT INTO tbl_grade_202205 VALUES ('20220001', 'S001', '70', '80', '100', '100', '90');
INSERT INTO tbl_grade_202205 VALUES ('20220001', 'S002', '80', '85', '100', '90', '90');
INSERT INTO tbl_grade_202205 VALUES ('20220001', 'S003', '70', '80', '100', '100', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220002', 'S001', '70', '80', '90', '90', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220002', 'S002', '60', '70', '100', '90', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220002', 'S003', '70', '70', '100', '100', '90');
INSERT INTO tbl_grade_202205 VALUES ('20220003', 'S001', '90', '90', '90', '100', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220003', 'S002', '90', '85', '100', '100', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220003', 'S003', '100', '100', '100', '90', '100');
INSERT INTO tbl_grade_202205 VALUES ('20220004', 'S004', '90', '90', '90', '90', '90');

SELECT a.studentid, a.studentname, a.jumin, c.subjectname, c.classification, c.professorname, b.mid, b.final, b.attend, b.report, b.etc,  sum(b.mid*0.3 + b.final*0.3 + b.attend*0.2 + b.report*0.1 + b.etc*0.1) FROM tbl_student_202205 a JOIN tbl_grade_202205 b ON a.studentid = b.studentid JOIN tbl_subject_202205 c ON b.subjectcode = c.subjectcode group by a.studentid, a.studentname, a.jumin, c.subjectname, c.classification, c.professorname, b.mid, b.final, b.attend, b.report, b.etc order by c.subjectname, a.studentid;

SELECT a.course, a.studentid, a.studentname, count(b.studentid), sum(b.mid*0.3 + b.final*0.3 + b.attend*0.2 + b.report*0.1 + b.etc*0.1) FROM tbl_student_202205 a JOIN tbl_grade_202205 b ON a.studentid = b.studentid group by a.course, a.studentid, a.studentname ORDER by a.studentid desc