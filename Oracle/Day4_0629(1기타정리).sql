-- DDL : create, alter, drop, TRUNCATE
--	(����� user, table, sequence, view, ... �� truncate�� ���̺� ���)
-- DML : insert, update, delete, select -> Ʈ��������� �����˴ϴ�.

drop table STUDENTS0;	-- ���� : students0 ���̺� ���� �����ϸ� 
		-- ���� : �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�.
drop table SCORES0;

-- UPDATE ���̺�� SET �÷��� = ��, �÷��� = ��, �÷��� = ��, .... 
-- WHERE �����÷� �����
-- DELETE from ���̺�� where �����÷������
-- ������ �� : update�� delete�� where ���� ����ϴ� ���� ������ ����.
--			truncate�� ������ ���(rollback)�� �� ���� ������ DDL�� ���մϴ�.


-- update, delete, select���� where�� �÷��� �⺻Ű �÷����� ���������̸�
--		����Ǵ� ��� �ݿ��Ǵ� ���� ��ϱ��? �ִ� 1��
--		�⺻Ű�� ������ ���̺��� ��������� ����(�ĺ�)
UPDATE STUDENTS0 SET age = 17 WHERE STUNO = 2021001;

-- rollback, commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 manual�� �����մϴ�.)
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', age = 16 WHERE STUNO = 2021001;
ROLLBACK;	-- ���� UPDATE ������ ���
SELECT * FROM STUDENTS0;		-- �ٽ� '���ʱ�', 17���� ����
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', age = 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS0;		-- '���ϱ�', 16���� �ݿ���.
ROLLBACK;
SELECT * FROM STUDENTS0;		-- �̹� COMMIT�� �� ��ɾ�� ROLLBACK ����.
-------------------------------------- �������
-- Ʈ����� ������� : ROLLBACK, COMMIT

DELETE FROM SCORES0;
ROLLBACK;
SELECT * FROM SCORES0;
DELETE FROM SCORES0 WHERE stuno = 2019019;
SELECT * FROM SCORES0;
-- 38���� �������� �� 
-- �� ������� Ʈ����� ���� ����̰� ���� â������ SELECT ��� 2019019�� �����ϴ�.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ�̹Ƿ� ���� ����(���� Ŀ���� ����)�� �������ϴ�.
ROLLBACK;
SELECT * FROM SCORES0;

-------------------------------------- ������� �ι�° ����
TRUNCATE TABLE SCORES0;			-- ��� �����͸� ����ϴ�. ROLLBACK ���� Ȯ��?
								-- �� : ROLLBACK �Ұ�.
-- ��� �����͸� ���� ���� Ȯ���ϸ� �ٸ� �͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ض�.
------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT;			(1) ���� 50, 51
 * UPDATE
 * DELETE;
 * ROLLBACK;		(2) ���� 53, 54
 * INSERT;
 * INSERT;
 * ROLLBACK;		(3) ���� 56, 57
 * INSERT
 * UPDATE;
 * COMMIT;			(4) ���� 59, 60
 * 
 */

