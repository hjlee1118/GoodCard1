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
where card_type='credit' and age between 20 and 29;


select * from MEMBER where id = 'hjlee1118';


update MEMBER
set CARD1 = NULL, CARD2 = NULL, CARD3 = NULL
where id = 'hjlee1118';

commit;

