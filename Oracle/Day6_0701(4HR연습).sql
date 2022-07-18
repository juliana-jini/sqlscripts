-- HR 스키마를 이용하여 조인과 group by를 포함해서 select로 검색하는 문제를 10개 만들기
-- group by 결과로도 조인을 할 수 있습니다. 예시 : 부서인원이 가장 많은 부서는?

-- 주석으로 검색하는 내용쓰고
-- select 쿼리 작성하세요.


-- 직원들의 이름, 부서명은?
SELECT e.FIRST_NAME , d.DEPARTMENT_NAME  FROM EMPLOYEES e JOIN DEPARTMENTS d 
		ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ; 
	
-- 직원들 중 급여가 8000 이상인 직원의 이름, 급여, 부서명, JOB_TITLE은?
SELECT e.FIRST_NAME , e.SALARY , d.DEPARTMENT_NAME , j.JOB_TITLE
		FROM EMPLOYEES e, DEPARTMENTS d, JOBS j 
		WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
		AND e.SALARY >= 8000 ;

-- 성이 'King'인 직원들의 이름, 성, 부서명은?
SELECT e.FIRST_NAME , e.LAST_NAME , d.DEPARTMENT_NAME
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	AND e.LAST_NAME = 'King' ;

-- IT부서 직원들의 이름, JOB_ID, 부서명, 매니저ID는?
SELECT e.FIRST_NAME , e.JOB_ID , d.DEPARTMENT_NAME , d.MANAGER_ID 
	FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	AND d.DEPARTMENT_NAME = 'IT' ;

-- 고용날짜가 2005년 01월 01일 이후인 직원들의 이름, 고용날짜, 직원ID, JOB_ID는?
SELECT e.FIRST_NAME , e.HIRE_DATE , jh.EMPLOYEE_ID , jh.JOB_ID  
	FROM EMPLOYEES e , JOB_HISTORY jh
	WHERE e.JOB_ID = jh.JOB_ID 
	AND e.HIRE_DATE >= '2005-01-01' ;

-- 부서별 급여가 5000 이상인 직원들의 평균급여는?
SELECT d.DEPARTMENT_NAME , avg(e.SALARY)
	FROM EMPLOYEES e
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	WHERE e.SALARY >= 5000
	GROUP BY d.DEPARTMENT_NAME ;

-- 부서별 인원 조회하기
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID)
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_NAME ; 

-- 부서별 직원 가장 많은 부서는?
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID)
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	GROUP BY d.DEPARTMENT_NAME
	HAVING count(e.DEPARTMENT_ID) =
	(SELECT max(count(e.DEPARTMENT_ID)) 
	FROM EMPLOYEES e 
	GROUP BY DEPARTMENT_ID) ; 
	
-- 부서별 최고급여, 최저급여, 평균급여는?
SELECT d.DEPARTMENT_NAME , max(e.SALARY) , min(e.SALARY) , avg(e.SALARY) 
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	GROUP BY d.DEPARTMENT_NAME ;

-- 고용날짜가 2007년 01월 01일 이후인 직원들의 부서별 인원 수, 평균 급여는?
SELECT d.DEPARTMENT_NAME , count(e.DEPARTMENT_ID) , avg(e.SALARY)  
	FROM EMPLOYEES e 
	LEFT JOIN DEPARTMENTS d 
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	WHERE e.HIRE_DATE >= '2007-01-01' 
	GROUP BY d.DEPARTMENT_NAME ;

-----------------------------------------------------------------------

-- jobs 테이블
	--1) min _salary 컬럼이 10000 이상인 job_title 조회
		SELECT job_title FROM JOBS j WHERE MIN_SALARY >= 10000 ;
	--2)job_title 컬럼이 programmer인 행의 모든 컬럼 조회
		SELECT * FROM JOBS j WHERE job_title = 'programmer' ;
		SELECT * FROM JOBS j WHERE job_title = 'programmer' ;
		-- 대소문자 상관없이 조건 검색한다면 문자열 관련 오라클 함수 : upper(), lower() 이용합니다.
		SELECT * FROM JOBS j WHERE UPPER(job_title) = 'PROGRAMMER' ;
		SELECT * FROM JOBS j WHERE LOWER(job_title) = 'programmer' ;
	
	--3)max_salary 필드값의 컬럼의 최대값 조회
		SELECT MAX(max_salary) FROM JOBS j ;
	
-- locations 테이블
	--1)city 컬럼이 london인 postal_code 조회
		SELECT postal_code FROM LOCATIONS l WHERE CITY = 'London' ;
		SELECT postal_code FROM LOCATIONS l WHERE CITY = 'Seattle' ;
	
	--2)LOCATIONAL_ID 컬럼이 1700, 2700, 2500이 아니고 city 컬럼이 Tokyo인 행의 모든 컬럼 조회
	SELECT *FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY = 'Tokyo' ;

-- Jonathan Taylor의 근무 이력 확인하기
SELECT * FROM EMPLOYEES e JOIN JOB_HISTORY jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID 
AND FIRST_NAME = 'Jonathan' AND LAST_NAME = 'Taylor' ;

-- 통계함수(집계 함수) : employees 테이블
SELECT count(*) FROM EMPLOYEES e ;		-- 총개수 : 107
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG' ;		-- 조건 job_id : IT_PROG

-- 부서테이블과 직원테이블 join
SELECT count(*) FROM EMPLOYEES e , DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID ;
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

-- 부서명 'Sales'의 직원들 인원수 조회하기
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.EMPLOYEE_ID = d.DEPARTMENT_ID 
AND department_name = 'Sales' ;

-- jobs 테이블 : min_salary가 평균보다 작은 job에 대한 정보
SELECT AVG(min_salary) FROM JOBS j ;
SELECT job_id , job_title , min_salary FROM JOBS j
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS j) ;

-- 아래 명령은 오류 -> 그룹함수는 반드시 select문으로 사용합니다. *
SELECT job_id , job_title, min_salary FROM JOBS j 
WHERE MIN_SALARY < AVG(MIN_SALARY) ;

-- 서브 쿼리 필요한 예시 : 동일한 테이블 대상
-- 최소급여를 받는 사람의 first_name, last_name 컬럼 조회하기
SELECT first_name , last_name , salary FROM EMPLOYEES e 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG') ;

SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG' ;
-- job_id가 'IT_PROG'가 아닌 것 조회
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID <> 'IT_PROG' ;
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE NOT JOB_ID = 'IT_PROG' ; --**

-- 부서별 평균급여를 조회합니다. 정렬은 평균급여 내림차순으로 부서_ID, 부서명, 평균급여 (소수점 1자리로 반올림)
-- 오라클 소수점 관련 함수 : round(반올림) , trunc(버림) ,  ceil(내림)

-- 그룹함수 조회할 때 group by를 써야 group by에 쓴 컬럼을 select로 조회할 수 있습니다.
--		group by 컬럼 외에는 다른 컬럼 select 할 수 없습니다. -> join, 서브쿼리
-- 1단계 : 사용할 그룹함수 실행하기
SELECT DEPARTMENT_ID , avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2단계 : join 하기
SELECT * FROM DEPARTMENTS d JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID ;

-- 3단계 : 컬럼 지정하기
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , round(tavg.cavg,1) FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC ;
	
-- 4단계 : 정렬한 결과로 특정 위치 지정 : first n은 상위 n개를 조회.
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , round(tavg.cavg,1) "평균급여" FROM DEPARTMENTS d 
		JOIN
		(SELECT DEPARTMENT_ID , avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
		ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID
		ORDER BY tavg.cavg DESC
		FETCH FIRST 1 ROWS ONLY ;
	
-- 다른 예시
SELECT d.DEPARTMENT_ID did , d.DEPARTMENT_NAME , e.cnt
	FROM DEPARTMENTS d 
	JOIN
		(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID) e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
	ORDER BY cnt DESC
FETCH FIRST 1 ROWS ONLY ;		-- 12c 버전부터 사용합니다.

-- 오라클의 rownum은 가상의 임시 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값입니다.
--			가상 컬럼 사용을 위해 join이 한번 더 필요합니다.
SELECT rownum , tcnt.* FROM
(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum < 5 ;

SELECT rownum , tcnt.* FROM
(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
		GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt
WHERE rownum = 1 ;

-- rownum 사용할 때 결과 확인이 안되는 예시 : rownum 1부터 시작해서 찾아갈 수 있는 조건식만 가능.
-- WHERE rownum = 3 ;
-- WHERE rownum > 5 ;
-- 그래서 한번 더 ROWNUM을 포함한 조회 결과로 select를 합니다. 이때 ROWNUM은 별칭 부여.
SELECT * FROM
	(SELECT rownum rn , tcnt.* FROM
		(SELECT DEPARTMENT_ID , count(*) cnt FROM EMPLOYEES
			GROUP BY DEPARTMENT_ID ORDER BY cnt DESC) tcnt)
WHERE rn BETWEEN 5 AND 9 ;
--WHERE rn = 3 ;



