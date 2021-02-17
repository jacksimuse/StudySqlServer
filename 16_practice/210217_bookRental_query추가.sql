-- 실제 회원정보 불러오기 레벨 역순 + 이름순
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels desc, memberName asc


 -- 책정보, 시스템 함수, 포맷 함수 쿼리
 SELECT  b.bookidx
     -- , b.cateidx
      , b.bookName
      , b.author
      , b.interpreter
      , b.company
  FROM dbo.booksTBL b
 inner join cateTBL c
    on b.cateidx = c.cateidx

-- 대여된 책의 정보 쿼리 조인
SELECT r.rentalidx
      --,r.memberidx
      --,r.bookidx
	  ,m.memberName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') 대여일
	  ,format(r.returnDt, 'yyyy-MM-dd') 반납일
	  ,dbo.ufn_getState(r.rentalState) 대여상태
  FROM dbo.rentalTBL r
 inner join booksTBL b
    on r.bookidx = b.bookidx
 inner join memberTBL m
    on r.memberidx = m.memberidx

-- 시스템 정의 함수사용 쿼리
select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) 미국식이름,
      dbo.ufn_getLevel(levels) 회원레벨,
      mobile,
      upper(email) 이메일
  from memberTBL
 where levels <> 's'
 order by levels, memberName

--책을 안빌린 회원 조회
SELECT r.rentalidx
      --,r.memberidx
      --,r.bookidx
	  ,m.memberName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') 대여일
	  ,dbo.ufn_getState(r.rentalState) 대여상태
  FROM dbo.rentalTBL r
 left outer join booksTBL b
    on r.bookidx = b.bookidx
 right outer join memberTBL m
    on r.memberidx = m.memberidx
 where r.rentalidx is null
 order by memberName

 -- 우리 책대여점에 없는 소설장르
 select c.cateidx
	   ,c.cateName
	   ,b.bookName
  from cateTBL c
  left outer join booksTBL b
    on c.cateidx = b.cateidx