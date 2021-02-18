-- IoT 데이터베이스

-- 1번 문항

-- 1-1
select lower(email) email, Mobile, Names, addr
  from membertbl
 order by Names desc

-- 1-2
select Names, Author, ReleaseDate, Price
  from bookstbl

-- 2번 문항

-- 2-1
select top(10) CONCAT(right(names, 2), ', ', left(names, 1)) as '변경이름'
     , Levels
	 , left(addr, 2) as '도시'
	 , lower(Email) as '이메일'
from membertbl

-- 2-2
select Idx, 
       concat('제목 : ', Names) as 'Names'
	 , concat('저자 > ', Author) as 'Author'
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일'
	 , ISBN
	 , format(price, '#,#원') as '가격' 
  from bookstbl
 order by idx desc

-- 3번 문항

-- 3-1
select b.Idx as '번호'
     , b.Division as '장르번호'
	 , d.Names as '장르'
	 , b.Names as '책제목'
	 , b.Author as '저자'
  from bookstbl b
 inner join divtbl d
    on b.Division = d.Division
 where d.Division = 'B002'
 
-- 3-2
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate 
  from membertbl m
  left outer join rentaltbl r
    on m.Idx = r.memberIdx where r.rentalDate is null

-- 4번문항

-- 4-1
begin tran
	insert into divtbl values ('I002', '자기개발서')

select * from divtbl
rollback
commit

-- 4-2
begin tran	
	update membertbl
	   set Addr='부산시 해운대구'
	     , Mobile='010-6683-7732'
     where Names = '성명건'

select * from membertbl

rollback
commit

-- 5번 문항

select d.Names
     , sum(b.Price) 총합계금액
  from divtbl d
 right outer join bookstbl b
    on d.Division = b.Division 
 group by rollup(d.Names)