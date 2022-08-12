create table classorder
( userid varchar2(20) not null REFERENCES member(userid),
 classnum NUMBER not null REFERENCES class(classnum),
 orderstatus varchar2(20)
);


insert into classorder values ('1','1','결제 대기중');
insert into classorder values ('1','2','결제 완료');
insert into classorder values ('2','2','결제 대기중');

COMMIT;

--스케줄 컬럼 추가
ALTER TABLE classorder ADD SCHEDULE1 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE2 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE3 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE4 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE5 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE6 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE7 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE8 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE9 VARCHAR2(50 BYTE);
ALTER TABLE classorder ADD SCHEDULE10 VARCHAR2(50 BYTE);

drop table classorder;