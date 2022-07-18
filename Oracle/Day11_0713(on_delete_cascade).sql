--tbl_custom 참조하는 외래키 삭제
--ALTER TABLE tbl_buy DROP CONSTRAINT SYS_C008371;
ALTER TABLE tbl_buy DROP CONSTRAINT TBL_BUY_FK1;
-- on delete 옵션으로 다시 외래키 생성
ALTER TABLE tbl_buy ADD CONSTRAINT fk_custom_id
	FOREIGN KEY (custom_id)		-- tbl_buy 테이블의 컬럼
	REFERENCES tbl_custom(custom_id) -- tbl_custom 참조 테이블 컬럼 custom_id
	ON DELETE CASCADE;

