--SUB CATEGORY 테이블 생성
CREATE TABLE SUB_CATEGORY(
CATE_ID VARCHAR2(20) CONSTRAINT ID REFERENCES CATEGORY ,
ID VARCHAR2(20) PRIMARY KEY,
NAME VARCHAR2(20)
);

--CATEGORY 테이블 생성
create table CATEGORY(
ID VARCHAR2(20) PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL
);

--INSERT category
insert into category values(
'A', 'BEAUTY'
);
insert into category values(
'B', 'LANGUAGE'
);
insert into category values(
'C', 'DANCE'
);
insert into category values(
'D', 'DIY'
);
insert into category values(
'E', 'ART'
);

--insert subcategory
