select * from member_tbl_02;
select * from money_tbl_02;

-- ȸ��������ȸ ���ΰ� group by

-- step 1) ȸ���� �����հ�
SELECT custno, sum(price) FROM MONEY_TBL_02 mt
GROUP BY CUSTNO;

-- step 2) ���� ���� Ȯ���ϱ�
SELECT custno, sum(price) asum FROM MONEY_TBL_02 mt
GROUP BY CUSTNO
ODER BY asum desc;

-- step 3) custno �÷����� step 2)�� �����̺� �����Ͽ� ������ ��ü ��������
SELECT * FROM MEMBER_TBL_02 mt,
			(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt
			GROUP BY CUSTNO
			ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.custno;

-- �Ǵ�
SELECT * FROM MEMBER_TBL_02 mt JOIN
			(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt
			GROUP BY CUSTNO
			ORDER BY asum desc) sale
ON mt.custno = sale.custno;

-- step 4) ������ �䱸���׿� ���� �ʿ��� �÷��� ��ȸ�ϱ�
SELECT mt.CUSTNO,
	  mt.CUSTNAME,
	  decode(mt.GRADE, 'A', 'VIP', 'B', '�Ϲ�', 'C', '����') AS agrade,
	  sale.asum
FROM member_tbl_02 mt,
			(SELECT CUSTNO, sum(price) AS asum FROM money_tbl_02
			GROUP BY CUSTNO
			ORDER BY asum desc) sale
WHERE mt.CUSTNO = sale.CUSTNO;
