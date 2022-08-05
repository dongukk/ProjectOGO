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
  profilePhoto varchar2(200),
  hobby varchar2(200)
);
  
insert into member values ( 'admin' , 'admin' , '관리자', 'GM', '남자', '2000/01/01','010', '1234', '5678', '우편번호10','도로명주소10','지번주소10', 'adawda', 'daum.net', '프로필img0.jpg','');
insert into member values ( 'id1' , '1234' , 'name1', 'nickname1', '남자', '2000/01/01', '010', '1234', '5678','우편번호1','도로명주소1','지번주소1', 'avcd','naver.com', '프로필img1.jpg','뷰티·심리·퍼스널검사');
insert into member values ( 'id2' , '5678' , 'name2', 'nickname2', '여자', '1990/02/04', '010', '1234', '5678', '우편번호2','도로명주소2','지번주소2', 'sdwq','daum.net', '프로필img2.jpg','외국어');
insert into member values ( 'id3' , '9101' , 'name3', 'nickname3', '남자', '1935/09/07', '010', '1234', '5678', '우편번호3','도로명주소3','지번주소3', 'dasd','nate.com', '프로필img3.jpg','댄스·뮤직');
insert into member values ( 'id4' , '2134' , 'name4', 'nickname4', '여자', '1952/11/30', '010', '1234', '5678', '우편번호4','도로명주소4','지번주소4', 'qeweq','google.co.kr', '프로필img4.jpg','요리·공예·취미');
insert into member values ( 'id5' , '4567' , 'name5', 'nickname5', '남자', '2010/02/15', '010', '1234', '5678', '우편번호5','도로명주소5','지번주소5', 'dffe','naver.com', '프로필img5.jpg','드로잉·디자인·영상');
insert into member values ( 'id6' , '6845' , 'name6', 'nickname6', '여자', '2001/06/18', '010', '1234', '5678', '우편번호6','도로명주소6','지번주소6', 'qwex','daum.net', '프로필img6.jpg','스포츠·피트니스');
insert into member values ( 'id7' , '1234' , 'name7', 'nickname7', '남자', '2002/05/21', '010', '1234', '5678', '우편번호7','도로명주소7','지번주소7', 'agsgsd','nate.com', '프로필img7.jpg','드로잉·디자인·영상');
insert into member values ( 'id8' , '2345' , 'name8', 'nickname8', '남자', '2003/09/28', '010', '1234', '5678', '우편번호8','도로명주소8','지번주소8', 'awef','google.co.kr', '프로필img8.jpg','외국어');
insert into member values ( 'id9' , '3245' , 'name9', 'nickname9', '여자', '2004/12/25', '010', '1234', '5678', '우편번호9','도로명주소9','지번주소9', 'waddwa', 'nate.com', '','');
insert into member values ( 'id10' , '2234' , 'name10', 'nickname10', '여자', '2000/01/01','010', '1234', '5678', '우편번호10','도로명주소10','지번주소10', 'adawda', 'daum.net', '','');

commit;

ALTER TABLE member MODIFY birth VAR date;
DROP TABLE member;
