--tbl_custom �����ϴ� �ܷ�Ű ����
--ALTER TABLE tbl_buy DROP CONSTRAINT SYS_C008371;
ALTER TABLE tbl_buy DROP CONSTRAINT TBL_BUY_FK1;
-- on delete �ɼ����� �ٽ� �ܷ�Ű ����
ALTER TABLE tbl_buy ADD CONSTRAINT fk_custom_id
	FOREIGN KEY (custom_id)		-- tbl_buy ���̺��� �÷�
	REFERENCES tbl_custom(custom_id) -- tbl_custom ���� ���̺� �÷� custom_id
	ON DELETE CASCADE;

