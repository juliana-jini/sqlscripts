CREATE TABLE tbl_custom (
		custom_id varchar2(20) PRIMARY KEY,
		name nvarchar2(20) NOT NULL,
		email varchar2(20),
		age number(3),
		reg_date DATE DEFAULT sysdate	-- 기본값 설정
);

-- 상품 테이블 : 카테고리 예시 A1 : 전자제품, B1 : 식품
CREATE TABLE tbl_product (
		pcode varchar2(20) PRIMARY KEY,
		category char(2) NOT NULL,
		pname nvarchar2(20) NOT NULL,
		price number(9) NOT NULL
);

-- 구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
CREATE TABLE tbl_buy (
		custom_id varchar2(20) NOT NULL,
		pcode varchar2(20) NOT NULL,
		quantity number(5) NOT NULL, -- 수량
		buy_date DATE DEFAULT sysdate
		--CONSTRAINT TBL_buy_FK1 FOREIGN KEY (custom_id) REFERENCES tbl_custom (custom_id),
		--CONSTRAINT TBL_buy_FK2 FOREIGN KEY (pcode) REFERENCES tbl_product (pcode)
);

-- Date 형식에 지정되는 패턴 설정하기 -> insert 할 때 to_date 함수 생략 가능
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

INSERT INTO tbl_custom VALUES ('mina012', '김미나', 'kimm@gmail.com', 20, to_date('2022-03-10 14:23:25', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, '2021-10-21');
INSERT INTO tbl_custom VALUES ('twice', '박모모', 'momo@daum.com', 29, '2021-12-25 19:23:45');
INSERT INTO tbl_custom(custom_id, name, email, age) VALUES ('wonder', '이나나', 'lee@naver.com', 40); -- reg_date 컬럼은 DEFAULT sysdate

INSERT INTO tbl_product VALUES ('IPAD011', 'A1', '아이패드10', '880000');
INSERT INTO tbl_product VALUES ('DOWON123a', 'B1', '동원참치선물세트', '54000');
INSERT INTO tbl_product VALUES ('dk_143', 'A2', '모션데스크', '234000');

INSERT INTO tbl_buy VALUES ('mina012', 'IPAD011', 1, to_date('2022-02-06', 'YYYY-MM-DD'));
INSERT INTO tbl_buy VALUES ('hongGD', 'IPAD011', 2, to_date('2022-06-29 20:37:47', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('wonder', 'DOWON123a', 3, to_date('2022-02-06', 'YYYY-MM-DD'));
INSERT INTO tbl_buy VALUES ('mina012', 'dk_143', 1, sysdate);
INSERT INTO tbl_buy(custom_id, pcode, quantity) VALUES ('mina012', 'dk_143', 1);
INSERT INTO tbl_buy VALUES ('twice', 'DOWON123a', 2, to_date('2022-02-09 08:49:55', 'YYYY-MM-DD HH24:MI:SS'));

ALTER TABLE tbl_buy ADD buyNo number(8);

UPDATE tbl_buy SET buyNo = 1001 WHERE custom_id = 'mina012' AND pcode = 'IPAD011';
UPDATE tbl_buy SET buyNo = 1002 WHERE custom_id = 'hongGD' AND pcode = 'IPAD011';
UPDATE tbl_buy SET buyNo = 1003 WHERE custom_id = 'wonder' AND pcode = 'DOWON123a';
UPDATE tbl_buy SET buyNo = 1004 WHERE custom_id = 'mina012' AND pcode = 'dk_143';
UPDATE tbl_buy SET buyNo = 1005 WHERE custom_id = 'twice' AND pcode = 'DOWON123a';

ALTER TABLE TBL_BUY ADD CONSTRAINT TBL_buy_PK PRIMARY KEY (buyNo);

ALTER TABLE TBL_BUY ADD CONSTRAINT TBL_buy_FK1 
	FOREIGN KEY (custom_id) REFERENCES tbl_custom (custom_id);
ALTER TABLE TBL_BUY ADD CONSTRAINT TBL_buy_FK2 
	FOREIGN KEY (pcode) REFERENCES tbl_product (pcode);

CREATE SEQUENCE tblbuy_seq
	START WITH 1006;

INSERT INTO tbl_buy(BUYNO, custom_id, pcode, quantity, BUY_DATE) 
VALUES (tblbuy_seq.nextval, 'wonder', 'IPAD011', 1, 
	to_date('2022-05-15', 'YYYY-MM-DD HH24:MI'));


-- 6월 30일 복습문제
--1. age가 30세 이상 고객의 모든 컬럼 조회
SELECT * FROM tbl_custom WHERE age >= 30;
--2. custom_id 'twice'의 email 조회
SELECT email FROM tbl_custom WHERE custom_id = 'twice';
--3. category 'A2'의 pname 조회
SELECT pname FROM tbl_product WHERE category = 'A2';
--4. 상품 price의 최고값 조회
SELECT MAX(price) FROM tbl_product price;
--5. 'IPAD011' 총구매 수량 조회
SELECT sum(quantity) FROM tbl_buy quantity WHERE pcode = 'IPAD011';
--6. custom_id 'mina012'이 구매한 내용 조회
SELECT pcode FROM tbl_buy WHERE custom_id = 'mina012';
--7. 구매 상품 중 pcode가 '0'이 포함된 것 조회
SELECT * FROM tbl_buy WHERE pcode LIKE ('%0%');
--8. 구매 상품 중 pcode에 'on'을 포함하는 것 조회(대소문자 구분없는 조회)
SELECT * FROM tbl_buy WHERE pcode LIKE upper('%ON%');

-- 테이블 조회
SELECT * FROM tbl_custom;
SELECT * FROM tbl_product;
SELECT * FROM tbl_buy;

-- 테이블 삭제
DROP TABLE tbl_custom;
DROP TABLE tbl_product;
DROP TABLE tbl_buy;

-- 시퀀스 삭제
DROP SEQUENCE tblbuy_seq;




