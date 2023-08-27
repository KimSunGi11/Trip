drop table reply purge;

create table reply(
	seq		number(5),
	reseq	number(5)	primary key,
	writer	varchar2(20),
	content	varchar2(400),
	image1 varchar2(200),
	image2 varchar2(200),
	image3 varchar2(200),
	image4 varchar2(200),
	regDate	date	default sysdate
);


select * from REPLY;

