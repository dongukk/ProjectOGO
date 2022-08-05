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
