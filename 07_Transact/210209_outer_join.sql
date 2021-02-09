
/*select * from stdtbl
select * from clubtbl
select * from clubregtbl
*/

select *
	from stdtbl s
	inner join clubregtbl r
	on s.id = r.std_id

select *
	from clubtbl c
	inner join clubregtbl r
	on c.id = r.club_id

-- inner join(내부 조인)
select s.id, s.stdName, c.clubname, c.buildingNum
	from stdtbl s
	inner join clubregtbl r
	on s.id = r.std_id
	inner join clubtbl c
	on  r.club_id = c.id

-- 테이블 순서 바꿔도 같음
select s.id, s.stdName, c.clubname, c.buildingNum
	from  clubtbl c
	inner join clubregtbl r
	on c.id = r.club_id
	inner join stdtbl s
	on  r.std_id = s.id

-- inner join 약식(SQL Server T-SQL)
select s.id, s.stdName, c.clubname, c.buildingNum
	from  stdtbl s, clubtbl c, clubregtbl r
	where s.id = r.std_id 
	and r.club_id = c.id

-- outer join(외부 조인)
select s.id, s.stdName, c.clubname, c.buildingNum
	from stdtbl s
	left outer join clubregtbl r
	on s.id = r.std_id
	left outer join clubtbl c
	on  r.club_id = c.id

-- userTBL / buyTBL
select u.userName, u.addr, b.prodName, b.price
	from userTbl u
   right outer join buyTbl b
      on u.userID = b.userID

select * from buyTbl