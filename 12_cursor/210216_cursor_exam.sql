use sqlDB
go

declare cur_usertbl cursor global 
	for select userName, height from userTbl

open cur_usertbl

declare @userName nchar(8)
declare @height smallint -- 회원의 키담는 변수
declare @cnt int = 0 -- 회원수(읽은 행수)
declare @totalHeight int = 0 -- 회원 키의 합계 변수

fetch next from cur_usertbl into @userName, @height -- 커서 값을 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt += 1
	set @totalHeight += @height
	print concat('회원 : ', @userName, '키 : ', @height)
	fetch next from cur_usertbl into @userName, @height
	--print @@fetch_status
end

print concat('회원 키 평균 => ', @totalHeight / @cnt)

close cur_usertbl
deallocate cur_usertbl
