

create or alter procedure plusNew
	@p1 int, -- �Է� �Ķ����
	@p2 int, -- �Է� �Ķ����
	@pout int output --��� �Ķ����
as
	select @pout = @p1 + @p2
go

declare @newresult int
set @newresult = 0
exec plusNew 3, 4, @newresult output
print concat('plusNew(3, 4) = ', @newresult)