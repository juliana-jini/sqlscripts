-- �ۼ��� : ��

CREATE TABLE students_tbl (
	id_num char(7) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	age NUMBER(3),
	address varchar2(20)
);

INSERT INTO students_tbl(id_num, name, age, address) VALUES ('2021001', '����', 16, '���ʱ�');
INSERT INTO students_tbl(id_num, name, age, address) VALUES ('2019019', '������', 18, '������');

SELECT * FROM students_tbl;

DROP TABLE students_tbl;

CREATE TABLE scores_tbl (
	id_num char(7) NOT NULL,
	subject varchar2(20) NOT NULL,
	score NUMBER(3) NOT NULL,
	teacher varchar2(20) NOT NULL,
	semester varchar2(20) NOT NULL
);

-- alter table ~ add constraint
ALTER TABLE socres_tbl ADD CONSTRAINT pk_scores PRIMARY KEY (id_num, subject);

ALTER TABLE socres_tbl ADD CONSTRAINT fk_scores foreign KEY (id_num) REFERENCES students_tbl(id_num);

INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '����', 89, '�̳���', '2022_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '����', 78, '��浿', '2022_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '����', 67, '�ڼ���', '2021_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '����', 92, '�̳���', '2019_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '����', 85, '������', '2019_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '����', 88, '�ڼ���', '2020_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019020', '����', 88, '�̳���', '2020_1');

SELECT * FROM scores_tbl;

DROP TABLE scores_tbl;

