use sqlDB
go

declare @myVar1 int;
declare @myVar2 smallint;
declare @myVar3 decimal(10, 5)
declare @myVar4 nvarchar(20);

set @myVar1 = 5
set @myVar2 = 3
set @myVar3 = 3.14
set @myVar4 = '가수 이름 ==> ';

select @myVar1
select @myVar2
select @myVar3
select @myVar4, userName from userTbl where height > 180;

declare @myVar5 tinyint;
set @myVar5 = 3

select top(@myVar5) userName, height from userTbl order by height desc;
