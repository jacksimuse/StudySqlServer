use sqlDB;
go

-- �̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
 where userName = '���ȣ';

 -- 1970�� ���� ���, Ű�� 182 �̻��� ����� ��ȸ ID, �̸��� ��ȸ
 select userID, userName, height
  from userTbl
  where birthYear >= 1970 
  and height >= 182;

  select userID, userName, height
  from userTbl
  where birthYear >= 1970 
  or height >= 182;

  -- Ű�� 180~183�� ��� ��ȸ
 select userID, userName, height
  from userTbl
  where height between 180 and 183;
 
 -- ���� �泲 ���� ���
 select userID, userName, addr
  from userTbl
  where addr in ('�泲', '����', '���');

  --like
  select userID, userName, height
  from userTbl
  where userName like'��%';

  select userID, userName, height
  from userTbl
  where userName like '_����';

  -- SUBQUERY 
  select userName, height 
  from userTbl
  where height > 177;

  select userName, height
  from userTbl
  where height >
  (
	select height from userTbl where userName = '��%'
	);

	select userName, height
  from userTbl
  where height in
  (	select height from userTbl where addr = '�泲'); -- 170, 173
  
  -- order by ����
  select userName, mDate
  from userTBl 
  order by mDate asc; --asc(��������) desc(��������)

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

  -- ����
  select * into buyTbl2 from buyTbl;
  select userID, prodName into buyTbl3 from buyTbl;

-- group by
select * from buyTbl;

select userid, amount
from buyTbl
order by userid;

select userid, sum(amount) as '�հ�'
from buyTbl
group by userid;

-- min, max
select userid, username, min(height) as '�ּ�Ű', max(height) as '�ּ�Ű'
from userTbl
group by userID, username;

select userid, username, height
from userTbl
where height = (select min(height) from userTbl)
or height = (select max(height) from userTbl);


--�� ������ ����

select count(*) as 'ȸ����' from userTbl;
select count(*) as '���ų�����' from buyTbl;