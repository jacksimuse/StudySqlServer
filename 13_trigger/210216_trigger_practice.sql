use sqlDB
go

create or alter trigger trg_backupUsertbl
on userTBL
after update, delete
as
	declare @modType nchar(2)

	if (COLUMNS_UPDATED() > 0) -- 업데이트
	begin
		set @modType = '수정'
	end
	else -- 딜리트
	begin
		set @modType = '삭제'
	end

	insert into backup_userTbl
	SELECT [userID]
      ,[userName]
      ,[birthYear]
      ,[addr]
      ,[mobile1]
      ,[mobile2]
      ,[height]
      ,[mDate]
      ,@modType
      ,GETDATE()
      ,USER_NAME()
  FROM deleted
		
go
