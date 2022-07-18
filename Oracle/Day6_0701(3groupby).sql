-- ���� : ���� �׷�ȭ�ϰ� �׷��Լ��� ����մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�.
-- select �׷��Լ� from ���̺��
-- [WHERE] �׷�ȭ �ϱ� ���� ����� ���ǽ�
-- GROUP BY �׷�ȭ�� ����� �÷���
-- [HAVING] �׷�ȭ ����� ���� ���ǽ�
-- [ORDER BY] �׷�ȭ ��� ���� �÷���� ���


SELECT PCODE , count(*) FROM TBL_BUY tb GROUP BY PCODE ;
SELECT PCODE , count(*) , sum(quantity)
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY 2;			-- ��ȸ�� �÷��� ��ġ

SELECT PCODE , count(*) cnt , sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY cnt;		-- �׷��Լ� ����� ��Ī
	
-- �׷�ȭ �Ŀ� �����հ谡 3 �̻� ��ȸ
SELECT PCODE , count(*) cnt , sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
--	HAVING total >= 3		-- having���� �÷� ��Ī ��� ����. ���̺� �÷����� ����� �� ����.
	HAVING sum(quantity) >= 3
	ORDER BY cnt;		-- �׷��Լ� ����� ��Ī
	
-- ���ų�¥ 2022-04-01 ������ �͸� �׷��Ͽ� ��ȸ
SELECT PCODE , count(*) cnt , sum(quantity) total
	FROM TBL_BUY tb 
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;		
	
	
-- Day2 ����
-- ��� �Լ� : count, avg, max, min, sum. ����Լ��� �׷��Լ���� �մϴ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����.

SELECT count(*) FROM EMPLOYEES e ;		-- ���̺� ��ü ������ ���� : 107
SELECT max(salary) FROM EMPLOYEES e ;	-- salary �÷��� �ִ밪 : 24000
SELECT min(salary) FROM EMPLOYEES e ;	-- salary �÷��� �ּҰ� : 2100
SELECT avg(salary) FROM EMPLOYEES e ;	-- salary �÷��� ��հ� : 6461.83...
SELECT sum(salary) FROM EMPLOYEES e ;	-- salary �÷��� �հ� : 691416 

-- �� 5�� ����Լ��� JOB_ID = 'IT_PROG' ���� ���ǽ����� �Ȱ��� �����غ���
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 5
SELECT max(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 9000
SELECT min(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 4200
SELECT avg(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 5760
SELECT sum(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 28800

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ ���մϴ�.(�׷��Լ��̱� �����Դϴ�.)
SELECT JOB_ID, count(*) FROM EMPLOYEES e
WHERE JOB_ID = 'IT_PROG'; -- ���� : ���� �׷��� �׷� �Լ��� �ƴմϴ�.