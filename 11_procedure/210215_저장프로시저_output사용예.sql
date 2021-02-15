

create or alter procedure plusNew
	@p1 int, -- 입력 파라미터
	@p2 int, -- 입력 파라미터
	@pout int output --출력 파라미터
as
	select @pout = @p1 + @p2
go

declare @newresult int
set @newresult = 0
exec plusNew 3, 4, @newresult output
print concat('plusNew(3, 4) = ', @newresult)