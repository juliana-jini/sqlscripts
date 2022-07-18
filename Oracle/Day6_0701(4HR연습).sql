-- HR ��Ű���� �̿��Ͽ� ���ΰ� group by�� �����ؼ� select�� �˻��ϴ� ������ 10�� �����
-- group by ����ε� ������ �� �� �ֽ��ϴ�. ���� : �μ��ο��� ���� ���� �μ���?

-- �ּ����� �˻��ϴ� ���뾲��
-- select ���� �ۼ��ϼ���.


-- �������� �̸�, �μ�����?
SELECT e.FIRST_NAME , d.DEPARTMENT_NAME  FROM EMPLOYEES e JOIN DEPARTMENTS d 
		ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ; 
	
-- ������ �� �޿��� 8000 �̻��� ������ �̸�, �޿�, �μ���, JOB_TITLE��?
SELECT e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME , j.JOB_TITLE
		FROM EMPLOYEES e, DEPARTMENTS d, JOBS j 
		WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
		AND e.SALARY >= 8000 ;

-- ���� 'King'�� �������� �̸�, ��, �μ�����?
SELECT e.FIRST_NAME , e.LAST_NAME , d.DEPARTMENT_NAME
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	AND e.LAST_NAME = 'King' ;

-- IT�μ� �������� �̸�, JOB_ID, �μ���, �Ŵ���ID��?
SELECT e.FIRST_NAME , e.JOB_ID , d.DEPARTMENT_NAME , d.MANAGER_ID 
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	AND d.DEPARTMENT_NAME = 'IT' ;

-- ��볯¥�� 2005�� 01�� 01�� ������ �������� �̸�, ��볯¥, ����ID, JOB_ID��?
SELECT e.FIRST_NAME , e.HIRE_DATE , jh.EMPLOYEE_ID , jh.JOB_ID  
	FROM EMPLOYEES e , JOB_HISTORY jh
	WHERE e.JOB_ID = jh.JOB_ID 
	AND e.HIRE_DATE >= '2005-01-01' ;

-- �μ��� �޿��� 5000 �̻��� �������� ��ձ޿���?
SELECT d.DEPARTMENT_NAME , avg(e.SALARY)
	FROM EMPLOYEES e
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	WHERE e.SALARY >= 5000
	GROUP BY d.DEPARTMENT_NAME ;

-- �μ��� �ο� ��ȸ�ϱ�
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID)
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_NAME ; 

-- �μ��� ���� ���� ���� �μ���?
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID)
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_NAME
	HAVING count(e.DEPARTMENT_ID) =
	(SELECT max(count(e.DEPARTMENT_ID)) 
	FROM EMPLOYEES e 
	GROUP BY DEPARTMENT_ID) ; 
	
-- �μ��� �ְ�޿�, �����޿�, ��ձ޿���?
SELECT d.DEPARTMENT_NAME , max(e.SALARY) , min(e.SALARY) , avg(e.SALARY) 
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	GROUP BY d.DEPARTMENT_NAME ;

-- ��볯¥�� 2007�� 01�� 01�� ������ �������� �μ��� �ο� ��, ��� �޿���?
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID) , avg(e.SALARY)  
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	WHERE e.HIRE_DATE >= '2007-01-01' 
	GROUP BY d.DEPARTMENT_NAME ;

-----------------------------------------------------------------------

-- jobs ���̺�
	--1) min _salary �÷��� 10000 �̻��� job_title ��ȸ
		SELECT job_title FROM JOBS j WHERE MIN_SALARY >= 10000 ;
	--2)job_title �÷��� programmer�� ���� ��� �÷� ��ȸ
		SELECT * FROM JOBS j WHERE job_title = 'programmer' ;
		SELECT * FROM JOBS j WHERE job_title = 'programmer' ;
		-- ��ҹ��� ������� ���� �˻��Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : upper(), lower() �̿��մϴ�.
		SELECT * FROM JOBS j WHERE UPPER(job_title) = 'PROGRAMMER' ;
		SELECT * FROM JOBS j WHERE LOWER(job_title) = 'programmer' ;
	
	--3)max_salary �ʵ尪�� �÷��� �ִ밪 ��ȸ
		SELECT MAX(max_salary) FROM JOBS j ;
	
-- locations ���̺�
	--1)city �÷��� london�� postal_code ��ȸ
		SELECT postal_code FROM LOCATIONS l WHERE CITY = 'London' ;
		SELECT postal_code FROM LOCATIONS l WHERE CITY = 'Seattle' ;
	
	--2)LOCATIONAL_ID �÷��� 1700, 2700, 2500�� �ƴϰ� city �÷��� Tokyo�� ���� ��� �÷� ��ȸ
	SELECT *FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY = 'Tokyo' ;

-- Jonathan Taylor�� �ٹ� �̷� Ȯ���ϱ�
SELECT * FROM EMPLOYEES e JOIN JOB_HISTORY jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
AND FIRST_NAME = 'Jonathan' AND LAST_NAME = 'Taylor' ;

-- ����Լ�(���� �Լ�) : employees ���̺�
SELECT count(*) FROM EMPLOYEES e ;		-- �Ѱ��� : 107
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG' ;		-- ���� job_id : IT_PROG

-- �μ����̺�� �������̺� join
SELECT count(*) FROM EMPLOYEES e , DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID ;
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

-- �μ��� 'Sales'�� ������ �ο��� ��ȸ�ϱ�
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.EMPLOYEE_ID = d.DEPARTMENT_ID 
AND department_name = 'Sales' ;

-- jobs ���̺� : min_salary�� ��պ��� ���� job�� ���� ����
SELECT AVG(min_salary) FROM JOBS j ;
SELECT job_id , job_title , min_salary FROM JOBS j
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS j) ;

-- �Ʒ� ����� ���� -> �׷��Լ��� �ݵ�� select������ ����մϴ�. *
SELECT job_id , job_title, min_salary FROM JOBS j 
WHERE MIN_SALARY < AVG(MIN_SALARY) ;

-- ���� ���� �ʿ��� ���� : ������ ���̺� ���
-- �ּұ޿��� �޴� ����� first_name, last_name �÷� ��ȸ�ϱ�
SELECT first_name , last_name , salary FROM EMPLOYEES e 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG') ;

SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG' ;
-- job_id�� 'IT_PROG'�� �ƴ� �� ��ȸ
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID <> 'IT_PROG' ;
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE NOT JOB_ID = 'IT_PROG' ; --**

-- �μ��� ��ձ޿��� ��ȸ�մϴ�. ������ ��ձ޿� ������������ �μ�_ID, �μ���, ��ձ޿� (�Ҽ��� 1�ڸ��� �ݿø�)
-- ����Ŭ �Ҽ��� ���� �Լ� : round(�ݿø�) , trunc(����) ,  ceil(����)

-- �׷��Լ� ��ȸ�� �� group by�� ��� group by�� �� �÷��� select�� ��ȸ�� �� �ֽ��ϴ�.
--		group by �÷� �ܿ��� �ٸ� �÷� select �� �� �����ϴ�. -> join, ��������
-- 1�ܰ� : ����� �׷��Լ� �����ϱ�
SELECT DEPARTMENT_ID , avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2�ܰ� : join �ϱ�
SELECT * FROM DEPARTMENTS d JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID ;

-- 3�ܰ� : �÷� �����ϱ�
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , round(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC ;
	
-- 4�ܰ� : ������ ����� Ư�� ��ġ ���� : first n�� ���� n���� ��ȸ.
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , round(tavg.cavg,1) "��ձ޿�" FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY ;
	
-- �ٸ� ����
SELECT d.DEPARTMENT_ID did , d.DEPARTMENT_NAME , e.cnt
	FROM DEPARTMENTS d 
	JOIN
		(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID) e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
	ORDER BY cnt DESC
FETCH FIRST 1 ROWS ONLY ;		-- 12c �������� ����մϴ�.

-- ����Ŭ�� rownum�� ������ �ӽ� �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�.
--			���� �÷� ����� ���� join�� �ѹ� �� �ʿ��մϴ�.
SELECT rownum , tcnt.* FROM
(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum < 5 ;

SELECT rownum , tcnt.* FROM
(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum = 1 ;

-- rownum ����� �� ��� Ȯ���� �ȵǴ� ���� : rownum 1���� �����ؼ� ã�ư� �� �ִ� ���ǽĸ� ����.
-- WHERE rownum = 3 ;
-- WHERE rownum > 5 ;
-- �׷��� �ѹ� �� ROWNUM�� ������ ��ȸ ����� select�� �մϴ�. �̶� ROWNUM�� ��Ī �ο�.
SELECT * FROM
	(SELECT rownum rn , tcnt.* FROM
		(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
			GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt)
WHERE rn BETWEEN 5 AND 9 ;
--WHERE rn = 3 ;



