CREATE table class
(classnum NUMBER CONSTRAINT class_classid_pk PRIMARY KEY,
classname VARCHAR2(100) CONSTRAINT class_classname_nn not null,
userid VARCHAR2(20) CONSTRAINT class_userid_fk REFERENCES member(userid),
category VARCHAR2(20) CONSTRAINT class_category_nn not null,
price NUMBER CONSTRAINT class_price_nn not null,
schedule VARCHAR2(50) CONSTRAINT class_schedule_nn not null,
place VARCHAR2(100) CONSTRAINT class_place_nn not null
);

create table content
(classnum NUMBER CONSTRAINT content_classnum_fk REFERENCES class(classnum),
con_class CLOB,
con_tutor CLOB,
con_attention CLOB,
con_notice CLOB);

CREATE table heart
(classnum NUMBER CONSTRAINT like_classnum_fk REFERENCES class(classnum),
userid VARCHAR2(20) CONSTRAINT like_userid_fk REFERENCES member(userid),
num NUMBER(6) CONSTRAINT like_num_nn not null);

create sequence heart_seq; --num하고 연관
create sequence class_seq; --classnum하고 연관

--class테이블 SCHEDULE 컬럼명 수정
ALTER TABLE class RENAME COLUMN SCHEDULE to SCHEDULE1;
--class테이블 SCHEDULE2~10 컬럼 추가
ALTER TABLE class ADD SCHEDULE2 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE3 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE4 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE5 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE6 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE7 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE8 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE9 VARCHAR2(50 BYTE);
ALTER TABLE class ADD SCHEDULE10 VARCHAR2(50 BYTE);

--class테이블 CATEGORY 컬럼명 수정
ALTER TABLE class RENAME COLUMN CATEGORY to SUBCATEGORY;

--class테이블 PLACE 데이터 타입 수정
ALTER TABLE class MODIFY place VARCHAR2(150);

--classimg 테이블
CREATE table classimg
(classnum NUMBER CONSTRAINT classimg_classnum_fk REFERENCES class(classnum),
classPhoto1 VARCHAR2(60),
classPhoto2 VARCHAR2(60),
classPhoto3 VARCHAR2(60),
classPhoto4 VARCHAR2(60),
classPhoto5 VARCHAR2(60));