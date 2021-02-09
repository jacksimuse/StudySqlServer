select * from userTbl
select * from buyTbl

select * from userTbl where userID = 'JYP'
select * from buyTbl where userID = 'JYP'

select * from buyTbl where userID = 'BBK'


-- INNER JOIN
select *
	from buyTbl
	inner join userTbl
	on buyTbl.userID = userTbl.userID
	where buyTbl.userID = 'JYP'


select  u.userName, u.addr,
		CONCAT(u.mobile1, '-', left(u.mobile2, 4), '-', RIGHT(u.mobile2, 4)) as mobile,
		b.prodName, b.price, b.amount
		from buyTbl as b
	inner join userTbl as u
	  on b.userID = u.userID
 where b.userID = 'JYP'

