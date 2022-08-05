create table member
( userId varchar2(20) primary key,
  userPasswd varchar2(20) not null,
  userName varchar2(20) not null,
  nickname varchar2(20) not null,
  gender varchar2(20) not null,
  birth date not null,
  phone1 varchar2(60) not null,
  phone2 varchar2(60) not null,
  phone3 varchar2(60) not null,
  post varchar2(60) not null,
  address1 varchar2(200) not null,
  address2 varchar2(200) not null,
  email1 varchar2(60) not null,
  email2 varchar2(60) not null,
  profilePhoto varchar2(60),
  hobby varchar2(200)
);
insert into member values ( 'admin' , 'admin' , '관리자', 'GM', '남자', '98/08/21','010', '1234', '5678', '06234','서울 강남구 테헤란로 124 (역삼동)','서울 강남구 역삼동 823', 'admin', 'naver.com', 'lee.jpg','외국어,댄스·뮤직');
insert into member values ( 'manager' , 'manager' , 'manager', 'manager', '남자', '2002/05/21', '010', '1234', '5678', '05399','서울 강동구 성내로8길 9-11 (성내동)','서울 강동구 성내동 550-10', 'ags2gsd','nate.com', 'lee.jpg','스포츠·피트니스,요리·공예·취미,드로잉·디자인·영상');
insert into member values ( '1' , '1' , 'name1', 'nickname1', '남자', '22/07/15','010', '1234', '5678', '06000','서울 강남구 압구정로11길 17 (압구정동, 미성아파트)','서울 강남구 압구정동 414', '111', 'daum.net', 'a.jpg','스포츠·피트니스,드로잉·디자인·영상');
insert into member values ( '2' , '2' , 'name2', 'nickname2', '남자', '2000/01/01', '010', '1234', '5678','02480','서울 동대문구 경동시장로22길 8 (제기동)','서울 동대문구 제기동 355', 'avcd','yahoo.com', 'b.jpg','스포츠·피트니스,드로잉·디자인·영상');
insert into member values ( '3' , '3' , 'name3', 'nickname3', '여자', '1990/02/04', '010', '1234', '5678', '18577','경기 화성시 팔탄면 3.1만세로771번길 25','경기 화성시 팔탄면 매곡리 176-3', 'sdwq','c.net', 'noImage.jpg','요리·공예·취미');
insert into member values ( '4' , '4' , 'name4', 'nickname4', '남자', '1935/09/07', '010', '1234', '5678', '01015','서울 강북구 4.19로17길 11 (수유동)','서울 강북구 수유동 535-172', 'dasd','nate.com', 'd.jpg','외국어');
insert into member values ( '5' , '5' , 'name5', 'nickname5', '여자', '1952/11/30', '010', '1234', '5678', '57639','전남 구례군 구례읍 5일시장큰길 3','전남 구례군 구례읍 봉동리 202-9', 'qeweq','google.co.kr', 'a1.jpg','요리·공예·취미,뷰티·심리.퍼스널 검사');
insert into member values ( '6' , '6' , 'name6', 'nickname6', '남자', '2010/02/15', '010', '1234', '5678', '08209','서울 구로구 경인로66길 13 (신도림동)','서울 구로구 신도림동 362-33', 'dffe','naver.com', 'b1.jpg','스포츠·피트니스,뷰티·심리.퍼스널 검사');
insert into member values ( '7' , '7' , 'name7', 'nickname7', '여자', '2001/06/18', '010', '1234', '5678', '06247','서울 강남구 논현로77길 5 (역삼동)','서울 강남구 역삼동 746-13', 'qwex','daum.net', 'c1.jpg','');
insert into member values ( '8' , '8' , 'name8', 'nickname8', '남자', '2002/05/21', '010', '1234', '5678', '05399','서울 강동구 성내로8길 9-11 (성내동)','서울 강동구 성내동 550-10', 'agsgsd','nate.com', 'd1.jpg','스포츠·피트니스,요리·공예·취미,드로잉·디자인·영상');

commit;

DROP TABLE member;
--ALTER TABLE member MODIFY birth VAR date;


-- sys계정에서 계정생성
--create user admin identified by OGOogo1234567;
--grant connect, resource to admin;