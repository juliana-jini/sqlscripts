create table book_member(
    mem_idx number(5) primary key,
    name varchar2(20) not null,
    email varchar2(20) unique,
    tel varchar2(20) unique,
    password varchar2(10)
);

create table tbl_book(
    bcode char(5) primary key,
    title varchar2(30) not null,
    writer varchar2(20),
    publisher varchar2(20),
    pdate date
);

create table tbl_bookrent(
    rent_no number(5) primary key,
    mem_idx number(5) not null,
    bcode char(5) not null,
    rent_date date not null,	-- 빌린 날짜
    exp_date date not null,		-- 반납예정 날짜
    return_date date,			-- 실제 반납 날짜
    delay_days number(3),		-- 연체일수
    CONSTRAINT fk1 foreign key (mem_idx) REFERENCES book_member (mem_idx),	-- CONSTRAINT fk1은 생략가능(근데 나는 생략했더니 안됨)
    CONSTRAINT fk2 foreign key (bcode) REFERENCES tbl_book (bcode)
);


CREATE SEQUENCE bm_seq START WITH 10001;
CREATE SEQUENCE tbr_seq;


INSERT INTO BOOK_MEMBER (MEM_IDX,NAME,EMAIL,TEL,PASSWORD) 
VALUES (bm_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
INSERT INTO BOOK_MEMBER (MEM_IDX,NAME,EMAIL,TEL,PASSWORD) 
VALUES (bm_seq.nextval,'이세종','jong@daum.net','010-2354-6773','2345');
INSERT INTO BOOK_MEMBER (MEM_IDX,NAME,EMAIL,TEL,PASSWORD) 
VALUES (bm_seq.nextval,'최행운','luckey@korea.com','010-5467-8792','9876');
INSERT INTO BOOK_MEMBER (MEM_IDX,NAME,EMAIL,TEL,PASSWORD) 
VALUES (bm_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
INSERT INTO BOOK_MEMBER (MEM_IDX,NAME,EMAIL,TEL,PASSWORD) 
VALUES (bm_seq.nextval,'강감찬','haha@korea.com','010-3987-9087','1234');


INSERT INTO TBL_BOOK (BCODE,TITLE,WRITER,PUBLISHER,PDATE) 
VALUES ('A1101','코스모스','칼세이건','사이언스북스',to_date('2006-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOK (BCODE,TITLE,WRITER,PUBLISHER,PDATE) 
VALUES ('B1101','해커스토익','이해커','해커스랩',to_date('2018-07-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOK (BCODE,TITLE,WRITER,PUBLISHER,PDATE) 
VALUES ('C1101','푸른사자 와니니','이현','창비',to_date('2015-06-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOK (BCODE,TITLE,WRITER,PUBLISHER,PDATE) 
VALUES ('A1102','페스트','알베르트 까뮈','민음사',to_date('2011-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE) 
VALUES (tbr_seq.nextval,10001,'B1101',to_date('2021-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE) 
VALUES (tbr_seq.nextval,10002,'C1101',to_date('2021-09-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE) 
VALUES (tbr_seq.nextval,10003,'B1101',to_date('2021-09-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2021-09-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE) 
VALUES (tbr_seq.nextval,10004,'C1101',to_date('2022-06-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2022-07-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE) 
VALUES (tbr_seq.nextval,10001,'A1101',to_date('2022-07-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2022-07-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BOOKRENT (RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE) 
VALUES (tbr_seq.nextval,10003,'A1102',to_date('2022-07-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2022-07-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),to_date('2022-07-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- 참고하기 : '대여' 기본적인 동작은 대여날짜는 오늘, 반납기한은 오늘 + 14를 기본값으로 할 수 있도록 합니다.
-- ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DATE DEFAULT sysdate;
-- ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY EXP_DATE DATE DEFAULT sysdate+14;
-- INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE)
-- VALUES (bookrent_seq.nextval,10002,'A1101');

-- 컬럼 디폴트 값 없애고 싶을때
-- ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DATE DEFAULT NULL;

select * from book_member;
select * from tbl_book;
select * from tbl_bookrent;

drop table tbl_bookrent;
drop table book_member;
drop table tbl_book;
drop sequence bm_seq;
drop sequence tbr_seq;

