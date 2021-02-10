use sqlDB
go

select u.userID, 
       u.userName,
	   iif(sum(price * amount) is null, 0, sum(price * amount)) [ÃÑ ±¸¸Å±Ý¾×],
	   case
	    when (sum(price * amount) >= 1500) then 'VVIP'
		when (sum(price * amount) >= 1000) then 'VIP'
		when (sum(price * amount) >= 1) then 'Person'
		else 'Ghost'
	   end '°í°´·¹º§'
  from buyTbl b
 right outer join userTbl u
    on b.userID = u.userID
 group by u.userID, u.userName
 order by sum(price * amount) desc



