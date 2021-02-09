use sqlDB;
go

--이름이 김경호인 사람 조회
select * from userTbl
 where userName = '김경호';

 --1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
 select userID, userName, height
  from userTbl
  where birthYear >= 1970 
  and height >= 182;

  select userID, userName, height
  from userTbl
  where birthYear >= 1970 
  or height >= 182;

  -- 1970년 이후 출생이거나 키가 182이상이거나 인 사람들 모두
 select userID, userName, height
  from userTbl
  where height between 180 and 183;
 
 -- 지역이 경남, 전남, 경북
 select userID, userName, addr
  from userTbl
  where addr in ('경남', '전남', '경북');

  --like
  select userID, userName, height
  from userTbl
  where userName like'김%';

  select userID, userName, height
  from userTbl
  where userName like '_종신';

  -- SUBQUERY 
  select userName, height 
  from userTbl
  where height > 177;

  select userName, height
  from userTbl
  where height >
  (
	select height from userTbl where userName = '김경호'
	);

	select userName, height
  from userTbl
  where height in
  (	select height from userTbl where addr = '경남'); -- 170, 173
  
  -- order by 정렬
  select userName, mDate
  from userTBl 
  order by mDate asc; --asc(오름차순), desc(내림차순)

  select *
  from userTbl
  order by height asc;

  -- distinct
  select distinct addr
  from userTbl;

  select top(5) * 
  from userTbl
  order by mdate desc;

  select userid, username, birthyear
  from userTbl
  order by birthYear 
  offset 4 rows;

  -- 복사
  select * into buyTbl2 from buyTbl;
  select userID, prodName into buyTbl3 from buyTbl;

-- group by
select * from buyTbl;

select userid, amount
from buyTbl
order by userid;

select userid, sum(amount) as '합계'
from buyTbl
group by userid;

-- min, max
select userid, username, min(height) as '�최소키', max(height) as '최대키'
from userTbl
group by userID, username;

select userid, username, height
from userTbl
where height = (select min(height) from userTbl)
or height = (select max(height) from userTbl);


--총 데이터의 개수

select count(*) as '회원수' from userTbl;
select count(*) as '구매내역수' from buyTbl;


-- 잘못된 필터링
select userID, sum(price * amount) as 'ID별 구매금액'
from buyTbl
-- where sum(price * amount) > 1000
group by userid
having sum(price * amount) > 1000
order by sum(price * amount) desc;

-- rollup / cube
select num, groupname, sum(price * amount) as '구매금액',
		GROUPING_ID(groupName, num)
from buyTbl
group by  rollup(groupName, num);

--userID, groupName 가지고 cube 다차원 합계
select userID, groupname, sum(price * amount) as '구매금액'
	--	GROUPING_ID(groupName, userID)
from buyTbl
group by  cube(groupName, userID);

-- without CTE
select userid, sum(price * amount) as 'total'
from buyTbl
group by userID
order by sum(price * amount) desc;

-- with CTE
with cte_tmp(userid, total)
as
(   select userid, sum(price * amount) as 'total'
	from buyTbl
	group by userID )
select * from cte_tmp order by userid desc;

