alter table MEMBER add CARD1 VARCHAR(200);
alter table MEMBER add CARD2 VARCHAR(200);
alter table MEMBER add CARD3 VARCHAR(200);

commit;


select CARD1, CARD2, CARD3 from MEMBER;