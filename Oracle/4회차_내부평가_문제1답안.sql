-- 작성자 : 조윤진

-- 1)
CREATE TABLE TBL_CUSTOM# (
		custom_id varchar2(20) NOT NULL,
		name nvarchar2(20) NOT NULL,
		email varchar2(30),
		age number(3),
		reg_date timestamp,
		PRIMARY KEY (custom_id)
);

CREATE TABLE TBL_PRODUCT# (
		pcode varchar2(20) NOT NULL,
		category char(2),
		pname nvarchar2(20) NOT NULL,
		price number(9) NOT NULL,
		PRIMARY KEY (pcode)
);

CREATE TABLE TBL_BUY# (
		buy_seq number(8) NOT NULL,
		custom_id varchar2(20),
		pcode varchar2(20),
		quantity number(5) NOT NULL,
		buy_date timestamp,
		CONSTRAINT fk1# foreign key (custom_id) 
		REFERENCES TBL_CUSTOM# (custom_id),
    	CONSTRAINT fk2# foreign key (pcode) 
    	REFERENCES TBL_PRODUCT# (pcode)
);


-- 2)
CREATE SEQUENCE tbl_buy_seq START WITH 2001;


-- 3)
CREATE TABLE TBL_POSTCODE (
		postcode char(6) NOT NULL,
		area1 varchar2(200) NOT NULL,
		PRIMARY KEY (postcode)
);


-- 4)
ALTER TABLE TBL_CUSTOM# ADD postcode char(6);

-- 5)
ALTER TABLE TBL_CUSTOM# 
ADD CONSTRAINT fk# 
FOREIGN KEY (postcode) 
REFERENCES TBL_POSTCODE (postcode);


