CREATE TABLE students0(
	stuno char(7) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	age number(3) CHECK (age BETWEEN 10 AND 30),
	address nvarchar2(50)
);

INSERT INTO students0(stuno,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students0(stuno,name,age,address)
VALUES ('2019019','강다현',18,'강남구');

CREATE TABLE scores0(
	stuno char(7),
	subject nvarchar2(20),
	jumsu number(3) NOT NULL,	-- 점수
	teacher nvarchar2(20) NOT NULL,
	term char(6) NOT NULL,	-- 학기
	PRIMARY KEY (stuno,subject),		-- 기본키 설정(not null 그리고 unique)
	FOREIGN KEY (stuno) REFERENCES students0(stuno)
	-- 외래키 설정 REFERENCES(참조) 키워드 뒤에 참조 테이블(참조컬럼)
	--				외래키 컬럼과 참조컬럼 모두 stuno로 같으면 (참조컬럼) 생략 가능.
	-- 외래키 컬럼은 FOREIGN KEY 키워드 뒤에 (스코어 테이블 stuno) 안에 작성.
	-- 검색해보세요. 참조컬럼의 조건은? 기본키 또는 unique 제약조건 컬럼만 됩니다.
);

INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','과학',67,'박세리','2021_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','과학',88,'박세리','2020_1');
