-- 작성자 : 조윤진

-- TBL_CUSTOM#
INSERT INTO TBL_CUSTOM#(custom_id, name, email, age, reg_date) 
VALUES ('mina012', '김미나', 'kimm@gmail.com', 20, 
to_date('2022-02-07 15:03:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOM#(custom_id, name, email, age, reg_date) 
VALUES ('hongGD', '홍길동', 'gil@korea.com', 32, 
to_date('2022-02-07 15:03:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOM#(custom_id, name, email, age, reg_date) 
VALUES ('twice', '박모모', 'momo@daum.net', 39, 
to_date('2022-02-05', 'YYYY-MM-DD'));
INSERT INTO TBL_CUSTOM#(custom_id, name, email, age, reg_date) 
VALUES ('wonder', '이나나', 'nana@korea.kr', 23, 
to_date('2022-02-05', 'YYYY-MM-DD'));
INSERT INTO TBL_CUSTOM#(custom_id, name, email, age, reg_date) 
VALUES ('sana', '최사나', 'unknown', 22, 
to_date('2022-02-09 15:19:24', 'YYYY-MM-DD HH24:MI:SS'));


-- TBL_PRODUCT#
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('CJ-BABQ1', 'B1', 'CJ햇반잡곡밥SET', '26000');
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('DOWON123a', 'B1', '동원참치선물세트', '54000');
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('dk_143', 'A2', '모션데스크', '234500');
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('IPAD011', 'A1', '아이패드10', '880000');
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('GAL0112', 'A1', '갤럭시20', '912300');
INSERT INTO TBL_PRODUCT#(pcode, category, pname, price) 
VALUES ('CHR-J59', 'A2', 'S체어', '98700');


-- TBL_BUY#
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (29, 'mina012', 'IPAD011', 1, 
to_date('2022-02-06', 'YYYY-MM-DD'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (30, 'hongGD', 'IPAD011', 2, 
to_date('2022-02-08 15:55:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (31, 'wonder', 'DOWON123a', 3, 
to_date('2022-02-06', 'YYYY-MM-DD'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (32, 'mina012', 'dk_143', 1, 
to_date('2022-02-08 15:55:08', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (33, 'twice', 'DOWON123a', 2, 
to_date('2022-02-07', 'YYYY-MM-DD'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (63, 'hongGD', 'dk_143', 1, 
to_date('2022-02-11', 'YYYY-MM-DD'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (61, 'twice', 'CHR-J59', 2, 
to_date('2022-02-12', 'YYYY-MM-DD'));
INSERT INTO TBL_BUY#(buy_seq, custom_id, pcode, quantity, buy_date) 
VALUES (62, 'hongGD', 'CJ-BABQ1', 4, 
to_date('2022-02-11', 'YYYY-MM-DD'));


-- 1)
SELECT * FROM TBL_BUY# 
WHERE buy_date >= '2022-02-11';

-- 2)
SELECT pcode, pname, price 
FROM TBL_PRODUCT# 
WHERE price = (SELECT max(price) FROM TBL_PRODUCT#); 

-- 3)
SELECT category, max(price) 
FROM TBL_PRODUCT# 
GROUP BY category 
ORDER BY max(price) DESC;

-- 4)
SELECT c.CUSTOM_ID, name, quantity 
FROM TBL_CUSTOM# c 
JOIN TBL_BUY# b 
ON c.CUSTOM_ID = b.CUSTOM_ID 
WHERE pcode = 'IPAD011';

-- 5)
SELECT c.CUSTOM_ID, name, age 
FROM TBL_CUSTOM# c, TBL_BUY# b
WHERE c.CUSTOM_ID = b.CUSTOM_ID(+) 
AND buy_date IS NULL;

-- 6)
SELECT to_char(buy_date, 'yyyy-MM-dd') AS buy_date2, sum(price*quantity) AS "SUM(MONEY)"
FROM TBL_BUY# b 
JOIN TBL_PRODUCT# p 
ON b.PCODE = p.PCODE
GROUP BY buy_date 
ORDER BY buy_date ASC;

