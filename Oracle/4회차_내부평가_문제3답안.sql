-- �ۼ��� : ������

-- 1)
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('137964', '����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('138761', '����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('412510', '��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE(postcode, area1) 
VALUES ('409880', '��õ������ ������ �ڿ���');


-- 2)
UPDATE TBL_CUSTOM# SET postcode = '137964' 
WHERE custom_id = 'mina012' AND name = '��̳�';
UPDATE TBL_CUSTOM# SET postcode = '412510' 
WHERE custom_id = 'hongGD' AND name = 'ȫ�浿';
UPDATE TBL_CUSTOM# SET postcode = '409880' 
WHERE custom_id = 'wonder' AND name = '�̳���';
UPDATE TBL_CUSTOM# SET postcode = '138761' 
WHERE custom_id = 'sana' AND name = '�ֻ糪';


-- 3)
CREATE VIEW v_custom_info
AS
SELECT CUSTOM_ID, c.postcode, area1
FROM TBL_CUSTOM# c, TBL_POSTCODE pc
WHERE c.postcode = pc.postcode;

SELECT * FROM v_custom_info;
