create table classorder
( userid varchar2(20) not null REFERENCES member(userid),
 classnum NUMBER not null REFERENCES class(classnum),
 orderstatus varchar2(20)
);


insert into classorder values ('1','1','결제 대기중');
insert into classorder values ('1','2','결제 완료');
insert into classorder values ('2','2','결제 대기중');

COMMIT;


drop table classorder;