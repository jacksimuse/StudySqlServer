create view uv_notrentalMember
as
	SELECT r.rentalidx
	--   , r.memberidx
		 , m.memberName
	--   , r.bookidx
		 , b.bookName
		 , c.cateName
		 , format(r.rentalDt, 'yyyy-MM-dd') rentalDt
		 , format(r.returnDt, 'yyyy-MM-dd') returnDt
		 , dbo.ufn_getState(r.rentalState) 대여상태
	  FROM rentalTBL r
	 right outer join memberTBL m
		on r.memberidx = m.memberidx
	 left outer join booksTBL b
		on r.bookidx = b.bookidx
	 left outer join cateTBL c
		on c.cateidx = b.cateidx
	where r.rentalidx is null