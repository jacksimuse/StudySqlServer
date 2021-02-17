-- 실제 회원정보 불러오기 레벨 역순 + 이름순
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels desc, memberName asc


 -- 책정보
 select cateidx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc

select * from cateTBL

-- 시스템 함수 사용 쿼리
select memberID, 
	   concat(right(memberName, 2),',', left(memberName, 1)) 미국식이름,
	   case levels
			when 'A' then '골드'
			when 'B' then '실버'
			when 'C' then '브론즈'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
	   end 회원레벨,
	   mobile,
	   upper(email) 이메일
  from memberTBL
 where levels <> 's'
 order by levels, memberName

