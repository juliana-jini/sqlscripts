-- ������ ���̽� Ʈ���� : insert, update, delete �� �� �����ϴ� ���ν���
--		Ư�� ���̺� �����ִ� ��ü 

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom		-- Ʈ���� �����ϴ� ���̺�, SQL�� ����
BEGIN 
	IF to_char(sysdate, 'HH24:MI') BETWEEN '13:00' AND '15:00' THEN
		raise_application_error(-20000, '���� ���� 1��~3�ô� �۾��� �� �����ϴ�.');
	END IF;
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM tbl_custom WHERE CUSTOM_ID = 'momo';

-- Ʈ���� ��Ȱ��ȭ : disable, Ȱ��ȭ : enable
ALTER TRIGGER secure_custom enable;

-- Ʈ���ſ� �ʿ��� ���̺� ������ ����.
CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = '0';
-- Ʈ���� ����(����)
CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy
FOR EACH ROW		-- ����(����)�ϴ� ���� ������ �϶�, : OLD UPDATE �Ǵ� DELETE �ϱ� ���� ��, : NEW�� INSERT �� ��
BEGIN
	-- ���� ���(tbl_buy ���̺��� ����)�� ������ tbl_temp �ӽ����̺� insert : �����࿡ ���� �۾�(�� Ʈ����)
	INSERT INTO tbl_temp
	VALUES
	(:OLD.custom_id, :OLD.pcode, :OLD.quantity, :OLD.buy_date, :OLD.buyno);

END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'wonder';
SELECT * FROM TBL_temp;

-- �߰� view ���� ����
-- grant resource, connect to c##idev -> ���⿡�� view ���������� �����ϴ�.
-- grant create view to c##idev;	-> �� �������� ���� ���� ����� �߰� ���� �ο� �ϼ���.
CREATE VIEW v_buy
AS
SELECT tb.CUSTOM_ID , tb.PCODE , tc.NAME , tc.EMAIL , tb.QUANTITY 
FROM TBL_BUY tb , TBL_CUSTOM tc 
WHERE tb.CUSTOM_ID = tc.CUSTOM_ID ;

