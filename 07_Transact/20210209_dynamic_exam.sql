use sqlDB
go

--exec sp_helpdb

declare @sql varchar(100)
set @sql = 'select * from userTBL where userID = ''EJW'' '
exec(@sql)