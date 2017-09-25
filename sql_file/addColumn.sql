alter table MEMBER add CARD1 VARCHAR(200);
alter table MEMBER add CARD2 VARCHAR(200);
alter table MEMBER add CARD3 VARCHAR(200);

commit;


select CARD1, CARD2, CARD3 from MEMBER;


select * from SEARCH_KEYWORD;

select * from SEARCH_KEYWORD where age between 20 and 29;