-- 작성자 : 조윤진

-- 1)
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('137964', '서울특별시 서초구 서초2동');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('138761', '서울특별시 송파구 장지동 409880');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('412510', '경기도 고양시 덕양구 벽제동');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('409880', '인천광역시 옹진군 자월면');


-- 2)
UPDATE TBL_CUSTOM# SET postcode = '137964' 
WHERE custom_id = 'mina012' AND name = '김미나';
UPDATE TBL_CUSTOM# SET postcode = '412510' 
WHERE custom_id = 'hongGD' AND name = '홍길동';
UPDATE TBL_CUSTOM# SET postcode = '409880' 
WHERE custom_id = 'wonder' AND name = '이나나';
UPDATE TBL_CUSTOM# SET postcode = '138761' 
WHERE custom_id = 'sana' AND name = '최사나';


-- 3)
CREATE VIEW v_custom_info
AS
SELECT CUSTOM_ID, c.postcode, area1
FROM TBL_CUSTOM# c, TBL_POSTCODE pc
WHERE c.postcode = pc.postcode;

SELECT * FROM v_custom_info;
