/*create view uv_user177
as
	select * from userTbl where height >= 177
go*/

create view uv_buyTbl
as
	select num, prodName, groupName from buyTbl where groupName = '����'
go

select * from uv_buyTbl
insert into uv_buyTbl values ('KKH', '��Ÿ', '�Ǳ�', 4000, 1)

/*select * from uv_user177

delete from uv_user177 where height < 177*/

begin tran

delete from uv_buyTbl

rollback
