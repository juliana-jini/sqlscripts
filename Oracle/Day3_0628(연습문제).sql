-- 작성자 : 나

CREATE TABLE students_tbl (
	id_num char(7) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	age NUMBER(3),
	address varchar2(20)
);

INSERT INTO students_tbl(id_num, name, age, address) VALUES ('2021001', '김모모', 16, '서초구');
INSERT INTO students_tbl(id_num, name, age, address) VALUES ('2019019', '강다현', 18, '강남구');

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

INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '국어', 89, '이나연', '2022_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '영어', 78, '김길동', '2022_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2021001', '과학', 67, '박세리', '2021_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '국어', 92, '이나연', '2019_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '영어', 85, '박지성', '2019_2');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019019', '과학', 88, '박세리', '2020_1');
INSERT INTO scores_tbl(id_num, subject, score, teacher, semester) VALUES ('2019020', '국어', 88, '이나연', '2020_1');

SELECT * FROM scores_tbl;

DROP TABLE scores_tbl;

