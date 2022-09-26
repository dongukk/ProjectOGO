create table CLASS_COMMENT
(
COMMENT_NO NUMBER CONSTRAINT COMMENT_NO_PK PRIMARY KEY,
COMMENT_NOTICE VARCHAR2(80) NOT NULL,
COMMENT_DATE DATE DEFAULT SYSDATE
);

drop table CLASS_COMMENT;


create SEQUENCE comment_no_seq
  INCREMENT BY 1 MAXVALUE 5000 CYCLE;


insert into class_comment (comment_no,comment_notice,userid,classnum)
		 VALUES(COMMENT_NO_SEQ.nextval,'좋아요22',1,221);