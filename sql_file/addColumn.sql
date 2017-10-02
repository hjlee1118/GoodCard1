alter table MEMBER add CARD1 VARCHAR(200);
alter table MEMBER add CARD2 VARCHAR(200);
alter table MEMBER add CARD3 VARCHAR(200);

commit;


select CARD1, CARD2, CARD3 from MEMBER;


select * from SEARCH_KEYWORD;


select sum(COMMUNICATION) as communication, sum(RESTAURANT) as restaurant, sum(MART) as mart, sum(BEAUTY) as beauty, sum(GASSTATION) as gasStation, sum(FASTFOOD) as fastFood,
sum(SUPERMARKET) as superMarket, sum(BOOKSTORE) as bookstore, sum(MOVIE) as movie, sum(CAFETERIA) as cafeteria, sum(ONLINESHOPPING) as onlineShopping, sum(ACADEMY) as academy, sum(TRANSPORTATION) as transportation,
sum(CAFE) as cafe, sum(CONVENIENCE) as convenience, sum(AMUSEMENTPARK) as amusementPark, sum(MEDICAL) as medical
from SEARCH_KEYWORD 
where card_type=`credit` and age between 20 and 29;


select * from MEMBER where id = `hjlee1118`;


update MEMBER
set CARD1 = NULL, CARD2 = NULL, CARD3 = NULL
where id = `hjlee1118`;

commit;

CREATE TABLE RECOMMEND_COUNT
(
   `NO`         INT(11) UNSIGNED           primary key auto_increment, 
   `BRAND`      VARCHAR(200)    NULL, 
   `CARD_TYPE`   VARCHAR(200)    NULL, 
    `COMMUNICATION`   INT(11) UNSIGNED           NULL, 
`RESTAURANT`   INT(11) UNSIGNED           NULL, 
`MART`   INT(11) UNSIGNED           NULL, 
`BEAUTY`   INT(11) UNSIGNED           NULL, 
`GASSTATION`   INT(11) UNSIGNED           NULL, 
`FASTFOOD`   INT(11) UNSIGNED           NULL, 
`SUPERMARKET`   INT(11) UNSIGNED           NULL, 
`BOOKSTORE`   INT(11) UNSIGNED           NULL, 
`MOVIE`   INT(11) UNSIGNED           NULL, 
`CAFETERIA`   INT(11) UNSIGNED           NULL, 
`ONLINESHOPPING`   INT(11) UNSIGNED           NULL, 
`ACADEMY`   INT(11) UNSIGNED           NULL, 
`TRANSPORTATION`   INT(11) UNSIGNED           NULL, 
`CAFEBAKERY`   INT(11) UNSIGNED           NULL, 
`CONVENIENCE`   INT(11) UNSIGNED           NULL, 
`AMUSEMENTPARK`   INT(11) UNSIGNED           NULL, 
`MEDICAL`   INT(11) UNSIGNED           NULL
);

ALTER TABLE RECOMMEND_COUNT ADD CARD_NO INT(11) NULL;

ALTER TABLE `MEMBER` CHANGE `NAME` `NAME` CHARACTER SET VARCHAR(200) UTF8 NOT NULL;

select * from MEMBER;


insert into MEMBER (ID, PASSWORD, NAME, GENDER, EMAIL, PHONE, TYPE, BIRTHDATE)
values('abc1234', 'abc1234!', '에이', 'W', 'abc1234', '01030571743', 'U', '1994-12-20')
	
