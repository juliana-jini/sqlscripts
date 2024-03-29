-- DDL : create, alter, drop, TRUNCATE
--	(대상은 user, table, sequence, view, ... 단 truncate는 테이블만 사용)
-- DML : insert, update, delete, select -> 트랜잭션으로 관리됩니다.

drop table STUDENTS0;	-- 오류 : students0 테이블 먼저 삭제하면 
		-- 원인 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다.
drop table SCORES0;

-- UPDATE 테이블명 SET 컬러명 = 값, 컬럼명 = 값, 컬럼명 = 값, .... 
-- WHERE 조건컬럼 관계식
-- DELETE from 테이블명 where 조건컬럼관계식
-- 주의할 점 : update와 delete는 where 없이 사용하는 것은 위험한 동작.
--			truncate는 실행을 취소(rollback)할 수 없기 때문에 DDL에 속합니다.


-- update, delete, select에서 where의 컬럼이 기본키 컬럼으로 동등조건이면
--		실행되는 결과 반영되는 행은 몇개일까요? 최대 1개
--		기본키의 목적은 테이블의 여러행들을 구분(식별)
UPDATE STUDENTS0 SET age = 17 WHERE STUNO = 2021001;

-- rollback, commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 manual로 변경합니다.)
UPDATE STUDENTS0 SET ADDRESS = '성북구', age = 16 WHERE STUNO = 2021001;
ROLLBACK;	-- 위의 UPDATE 실행을 취소
SELECT * FROM STUDENTS0;		-- 다시 '서초구', 17세로 복구
UPDATE STUDENTS0 SET ADDRESS = '성북구', age = 16 WHERE STUNO = 2021001;
COMMIT;
SELECT * FROM STUDENTS0;		-- '성북구', 16세로 반영됨.
ROLLBACK;
SELECT * FROM STUDENTS0;		-- 이미 COMMIT이 된 명령어는 ROLLBACK 못함.
-------------------------------------- 여기까지
-- 트랜잭션 관리명령 : ROLLBACK, COMMIT

DELETE FROM SCORES0;
ROLLBACK;
SELECT * FROM SCORES0;
DELETE FROM SCORES0 WHERE stuno = 2019019;
SELECT * FROM SCORES0;
-- 38라인 실행했을 때 
-- 이 편집기는 트랜잭션 수동 모드이고 같은 창에서는 SELECT 결과 2019019가 없습니다.
-- 다른 편집기는 다른 클라이언트이므로 이전 상태(최종 커밋한 상태)로 보여집니다.
ROLLBACK;
SELECT * FROM SCORES0;

-------------------------------------- 여기까지 두번째 예시
TRUNCATE TABLE SCORES0;			-- 모든 데이터를 지웁니다. ROLLBACK 여부 확인?
								-- 답 : ROLLBACK 불가.
-- 모든 데이터를 지울 것이 확실하면 다른 것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 해라.
------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT;			(1) 라인 50, 51
 * UPDATE
 * DELETE;
 * ROLLBACK;		(2) 라인 53, 54
 * INSERT;
 * INSERT;
 * ROLLBACK;		(3) 라인 56, 57
 * INSERT
 * UPDATE;
 * COMMIT;			(4) 라인 59, 60
 * 
 */

