USE [sqlDB]
GO

begin try
	begin tran

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'������'
			   ,1988
			   ,'����'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,getdate())

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GJY'
			   ,'���۶�'
			   ,null
			   ,80000000
			   ,1)

	commit
end try
begin catch
	rollback
end catch
GO


