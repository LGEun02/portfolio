create table PLAYER_TBL_09(
PLAYER_NO number not null primary key,
PLAYER_NAME varchar2(20) not null,
TEAM_NO number,
PLAYER_PHONE varchar2(14),
PLAYER_BIRTH date,
PLAYER_EMAIL varchar2(50),
BACK_NO number
);

insert into PLAYER_TBL_09 values(10001,'홍명보',10,'1112223333','80/08/10','',15);
insert into PLAYER_TBL_09 values(10002,'추신수',10,'2223334444','81/07/10','',20);
insert into PLAYER_TBL_09 values(10003,'홍길동',10,'3334445555','80/03/20','',21);
insert into PLAYER_TBL_09 values(10004,'이순신',10,'4445556666','82/11/20','',5);

select * from PLAYER_TBL_09;



create table RECOED_TBL_09(
RECOED_NO number not null primary key,
PLAYER_NO number,
MATCH_NO number,
P_TIME number(3) default 0,
PLAYER_SCORE number(2) default 0,
YELLOW_CARD number(2) default 0,
RED_CARD number(2) default 0
);

insert into RECOED_TBL_09 values(1,10001,111,5,0,0,0);
insert into RECOED_TBL_09 values(2,10002,111,90,1,0,1);
insert into RECOED_TBL_09 values(3,10003,111,90,0,2,0);
insert into RECOED_TBL_09 values(4,10004,111,45,2,0,0);
insert into RECOED_TBL_09 values(5,10005,111,45,0,0,0);
insert into RECOED_TBL_09 values(6,10001,112,90,1,0,0);
insert into RECOED_TBL_09 values(7,10002,112,90,1,0,0);
insert into RECOED_TBL_09 values(8,10003,112,90,0,1,0);
insert into RECOED_TBL_09 values(9,10004,112,90,1,1,0);
insert into RECOED_TBL_09 values(10,10005,112,90,0,0,1);
insert into RECOED_TBL_09 values(11,10001,113,45,3,2,1);
insert into RECOED_TBL_09 values(12,10002,113,90,1,1,0);
insert into RECOED_TBL_09 values(13,10003,113,45,2,1,0);
insert into RECOED_TBL_09 values(14,10004,113,45,0,0,0);
insert into RECOED_TBL_09 values(15,10005,113,45,0,0,0);
insert into RECOED_TBL_09 values(16,10002,113,45,1,0,0);

select * from RECOED_TBL_09;

--update
select PLAYER_NAME,TEAM_NO,PLAYER_PHONE,
to_char(PLAYER_BIRTH,'yy/mm/dd') PLAYER_BIRTH,
nvl(PLAYER_EMAIL,' ') PLAYER_EMAIL,
nvl(BACK_NO, 0) BACK_NO
from PLAYER_TBL_09
where PLAYER_NO=10001;

--select
select PLAYER_NO,PLAYER_NAME,TEAM_NO,
substr(PLAYER_PHONE,1,3)||'-'||substr(PLAYER_PHONE,4,3)||'-'||substr(PLAYER_PHONE,7,4) PLAYER_PHONE,
BACK_NO,to_char(PLAYER_BIRTH,'mm/dd') PLAYER_BIRTH
from PLAYER_TBL_09;

--select2
select MATCH_NO, sum(PLAYER_SCORE),sum(YELLOW_CARD),sum(RED_CARD)
from RECOED_TBL_09
group by MATCH_NO
order by MATCH_NO;

select PLAYER_NO,sum(PLAYER_SCORE) tosc
from RECOED_TBL_09
group by  PLAYER_NO;

select rank() over (order by sum(PLAYER_SCORE) desc) rank
from RECOED_TBL_09
group by  PLAYER_NO;

--최우수선수				
select PLAYER_NO,PLAYER_NAME,tosc
from PLAYER_TBL_09 natural join (select PLAYER_NO,sum(PLAYER_SCORE) tosc,
								sum(YELLOW_CARD) YELLOW_CARD ,sum(RED_CARD) RED_CARD,
								rank() over (order by sum(PLAYER_SCORE) desc) rank
								from RECOED_TBL_09
								group by  PLAYER_NO)		
where rank=1
order by YELLOW_CARD,RED_CARD;
				
select B.PLAYER_NO, B.player_name, A.score, A.YELLOW_CARD, A.RED_CARD, A.rank
from (select PLAYER_NO, player_name, sum(PLAYER_SCORE) score, 
	sum(YELLOW_CARD) YELLOW_CARD ,sum(RED_CARD) RED_CARD,
	rank() over(order by sum(PLAYER_SCORE) desc) as rank
	from player_tbl_09 natural join RECORD_TBL_09
	group by PLAYER_NO, player_name) A join player_tbl_09 B
on (A.PLAYER_NO = B.PLAYER_NO)
order by A.rank, A.RED_CARD, A.YELLOW_CARD;

select B.PLAYER_NO, B.player_name, A.score, A.YELLOW_CARD, A.RED_CARD, A.rank
from (select PLAYER_NO, player_name, sum(PLAYER_SCORE) score, 
	sum(YELLOW_CARD) YELLOW_CARD ,sum(RED_CARD) RED_CARD,
	rank() over(order by sum(PLAYER_SCORE) desc) as rank
	from player_tbl_09 natural join RECORD_TBL_09
	group by PLAYER_NO, player_name) A join player_tbl_09 B
on (A.PLAYER_NO = B.PLAYER_NO)
order by A.rank, A.RED_CARD, A.YELLOW_CARD;

drop table PLAYER_TBL_09;
drop table RECOED_TBL_09;