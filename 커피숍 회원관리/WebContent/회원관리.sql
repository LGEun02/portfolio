create table member_tbl(
CUSTNO number not null primary key,
CUSTNAME varchar2(20),
GENDER char(1),
PHONE varchar2(13),
ADDRESS varchar2(60),
JOINDATE date,
GRADE char(1),
CITY char(2)
);

select CUSTNO,CUSTNAME,decode(GENDER,'M','남자','F','여자') GENDER,
PHONE,ADDRESS,to_char(JOINDATE,'yyyy-mm-dd') JOINDATE,
decode(GRADE,'A','VIP','B','일반','C','직원') GRADE,CITY
from member_tbl
order by CUSTNO;

select CUSTNO,CUSTNAME,GENDER,PHONE,ADDRESS,
to_char(JOINDATE,'yyyy-mm-dd') JOINDATE,GRADE,CITY
from member_tbl
where CUSTNO=10001;

insert into member_tbl values(10001,'김행복','F','010-1111-2222','서울 동대문구 휘경1동','2015-12-02','A','01');
insert into member_tbl values(10002,'이축복','M','010-1111-3333','서울 동대문구 휘경2동','2015-12-06','B','01');
insert into member_tbl values(10003,'장믿음','F','010-1111-4444','울릉군 울릉읍 독도1리','2015-10-01','B','30');
insert into member_tbl values(10004,'최사랑','M','010-1111-5555','울릉군 울릉읍 독도2리','2015-11-13','A','30');
insert into member_tbl values(10005,'진평화','F','010-1111-6666','제주도 제주시 외나무골','2015-12-25','B','60');
insert into member_tbl values(10006,'차공단','M','010-1111-7777','제주도 제주시 감나무골','2015-12-11','C','60');
insert into member_tbl values(10007,'전진주','M','010-1111-8888','대구 수성구 고산1동','2015-11-03','A','90');
insert into member_tbl values(10008,'중고차','M','010-1111-9999','대구 수성구 고산2동','2015-09-23','A','90');
insert into member_tbl values(10009,'상수리','F','010-2222-0000','대구 수성구 고산3동','2015-12-03','B','90');
insert into member_tbl values(10010,'외다리','F','010-2222-1111','대구 수성구 사월동','2015-10-30','C','90');

select * from member_tbl;

create table sale_tbl(
CUSTNO number not null,
SALENO number not null primary key,
AMOUNT number,
PRICE number,
PCODE varchar2(4),
SDATE date
);

insert into sale_tbl values(10001,1001,5,15000,'A001','19/01/01');
insert into sale_tbl values(10002,1002,5,20000,'A002','19/01/02');
insert into sale_tbl values(10003,1003,5,30000,'A003','19/01/03');
insert into sale_tbl values(10004,1004,4,20000,'A004','19/01/04');
insert into sale_tbl values(10005,1005,5,15000,'A001','19/01/05');
insert into sale_tbl values(10006,1006,1,4000,'A002','19/01/06');
insert into sale_tbl values(10001,1007,2,12000,'A003','19/01/07');
insert into sale_tbl values(10002,1008,3,15000,'A004','19/01/08');
insert into sale_tbl values(10003,1009,4,12000,'A001','19/01/09');
insert into sale_tbl values(10004,1010,5,20000,'A002','19/01/10');
insert into sale_tbl values(10005,1011,6,36000,'A003','19/01/11');
insert into sale_tbl values(10006,1012,7,35000,'A004','19/01/12');

select * from sale_tbl;

create table coffee_tbl(
PCODE varchar2(4) not null,
PNAME varchar2(60) not null,
PCOST number
);

--select2
select PCODE,PNAME,PCOST
from coffee_tbl
order by PCODE;

insert into coffee_tbl values('A001','아메리카노',3000);
insert into coffee_tbl values('A002','카푸치노',4000);
insert into coffee_tbl values('A003','키페모카',6000);
insert into coffee_tbl values('A004','카라멜마끼야또',5000);

select * from coffee_tbl;

drop table coffee_tbl;

commit