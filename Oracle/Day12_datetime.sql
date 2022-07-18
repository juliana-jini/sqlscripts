/*
 * ��¥�� �ð� ������ ����
 * Date : �Ϲ�����. �ʴ������� ǥ��
 * Timestamp : ǥ�ؽø� �������� �ϴ� timezone ǥ���Ҽ� �ְ�. 
 * 			  ����(������ 9�ڸ�)�� ���� ǥ�� ����
 * 
 * �Ϲ������δ� date�� timestmap
 */


SELECT SYSDATE, 		-- ������ Date
		CURRENT_DATE,	-- Ŭ���̾�Ʈ�� Date
		SYSTIMESTAMP,	-- ������ timestamp
		CURRENT_TIMESTAMP   -- Ŭ���̾�Ʈ�� timestamp
FROM dual;


DROP TABLE tbl_date;
CREATE TABLE tbl_date(
	acol DATE DEFAULT sysdate,
	bcol DATE DEFAULT systimestamp,
	ccol timestamp(9),	-- 9�� �� ���� �Ҽ��� ���� 9�ڸ����� ǥ��
	dcol timestamp DEFAULT systimestamp,
	ecol timestamp WITH TIME ZONE DEFAULT systimestamp
	-- ���� ���������� �� �⺻��(default) :sysdate �� ���� ��¥/�ð�(����)
	-- Ŭ���̾�Ʈ ��ǻ���� �ð��� current_date 
);

alter session set NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH:MI:SS.FF';

INSERT INTO tbl_date(ccol) 
VALUES (to_timestamp('2022-07-12 14:46:00.123456789', 'yyyy-mm-dd hh24:mi:ss.ff'));

SELECT * FROM tbl_date;

-- ��¥������ ���ڿ� 'yyyy-MM-dd' �� �ڵ�ĳ������ �˴ϴ�.
INSERT INTO tbl_date(acol,ccol)
VALUES ('2022-10-11','2022-10-12');		-- DATE, timestamp ���̰� �����ϴ�.

-- **���� ���迡�� timestamp Ÿ���� date Ÿ�԰� �Ȱ��� �ڵ��ϸ� �˴ϴ�.**
-- ��¥������ ���ڿ� 'yyyy-MM-dd'�� �ڵ�ĳ������ �˴ϴ�.
-- date�� timestamp ��� to_char �Լ��� �����ϰ� ����մϴ�.

-- GMT, UTC ǥ�ؽð��� ����

