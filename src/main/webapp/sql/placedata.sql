drop table placedata purge;

CREATE SEQUENCE travelspot_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


create table placedata(
	seq 	number(5)	primary key,
	name	varchar2(200),
	address varchar2(200),
	longitude	number(5),
	latitude		number(5)
);

select *
from placedata;