-- ���ڿ� Ÿ��
-- CHAR(����) : ��������, ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ������ ���� ���� ����Ʈ, ���̴� �ִ� �����̰� ������ �޸𸮴� ������ ũ�⸸ŭ ����մϴ�.
--				   �ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_string (
	acol char(10),		-- 10����Ʈ ��������
	bcol varchar2(10),	-- 10����Ʈ ��������
	ccol nchar(10),		-- 10�� ���� ��������
	dcol nvarchar2(10)	-- 10�� ���� ��������
);

-- char Ÿ��
INSERT INTO tbl_string(acol) values('abcdefghij');
INSERT INTO tbl_string(acol) values('abcdef');			-- acol�� �������� Ÿ�� : ���� 4�� �߰�
INSERT INTO tbl_string(acol) values('abcdefghijklm');	-- ���� : ���� �ʰ�
-- INSERT Ȯ��
SELECT  * FROM tbl_string;
--�ѱ� Ȯ��
INSERT INTO tbl_string(acol) values('������');	-- ���� 1�� �߰�
INSERT INTO tbl_string(acol) values('�����ٶ�');	-- ���� : ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_string(acol) values('����');		-- ���� 4�� �߰�


-- varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT INTO tbl_string(bcol) values('abcdefghij');
INSERT INTO tbl_string(bcol) values('abcdef');			-- bcol�� �������� Ÿ��. ���� �߰� ����.
INSERT INTO tbl_string(bcol) values('abcdefghijklm');	-- ���� : ���� �ʰ�
-- INSERT Ȯ��
SELECT  * FROM tbl_string;
--�ѱ� Ȯ��
INSERT INTO tbl_string(bcol) values('������');	-- ���� �߰� ����.
INSERT INTO tbl_string(bcol) values('�����ٶ�');	-- ���� : ���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_string(bcol) values('����');		-- ���� �߰� ����.

-- char�� varchar2�� ����Ʈ ����. nchar�� nvarchar2�� ���� ���� ����(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ����)
-- nchar Ÿ��
INSERT INTO tbl_string(ccol) values('������');	-- ���� 7�� �߰�
INSERT INTO tbl_string(ccol) values('�����ٶ�');	-- ���� 6�� �߰�
INSERT INTO tbl_string(ccol) values('����');		-- ���� 8�� �߰�
INSERT INTO tbl_string(ccol) values('�����ٶ󸶹ٻ������ī');	-- ���� : ���� �ʰ�
SELECT  * FROM tbl_string;
-- nvarchar2 Ÿ��
INSERT INTO tbl_string(dcol) values('������');	 
INSERT INTO tbl_string(dcol) values('�����ٶ�');	
INSERT INTO tbl_string(dcol) values('����');		 
INSERT INTO tbl_string(ccol) values('�����ٶ󸶹ٻ������ī');	-- ���� : ���� �ʰ�





