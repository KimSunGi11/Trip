drop table users purge;

create table users(
	MEMBER_SEQ number(5) default 1 primary key,
	MEMBER_ID VARCHAR2(20),
	MEMBER_PW VARCHAR2(15),
	MEMBER_NAME VARCHAR2(20),
	MEMBER_EMAIL VARCHAR2(25),
	MEMBER_EMAIL_GET VARCHAR2(20),
	MEMBER_PHONE VARCHAR2(13)
	
);

select * from users;
insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('1','admin','1111','관리자','admin','naver.com','0101111')

select * from users;
insert into users(MEMBER_SEQ, MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('2', 'hong','1111','홍길동','hong123','naver.com','0101111')


insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('4','min','1111','강민수','min123','naver.com','0101111')
insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('4','ssi','1111','김지수','ssi987','naver.com','0101111')
insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('5','myungsoo','1111','박명수','myungsoo','naver.com','0101111')
insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('6','susu','1111','이수지','susu','naver.com','0101111')
insert into users(MEMBER_SEQ,MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_EMAIL,MEMBER_EMAIL_GET,MEMBER_PHONE) values('7','youngji','1111','이영지','youngji','naver.com','0101111')

delete from users where MEMBER_SEQ = 5;