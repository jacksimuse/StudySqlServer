create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8)
	select @userID = userId
	  from userTbl
	where userName = @userName

	if (@userID <> '') return 1 -- inline if
	else return 0
go

declare @retVal int
exec @retVal = usp_return 'ÀºÁö¿ø'
print @retVal