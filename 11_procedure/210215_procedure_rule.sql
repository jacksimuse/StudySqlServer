-- ���ν��� ����
create procedure usp_users
as
	select userID, userName, birthYear from userTbl
go

exec usp_users

--���ν��� ����
alter procedure usp_users
as
	select userID, userName, birthYear from userTbl
go

exec usp_users



-- ���ν��� ���� �Ǵ� ������ ���ÿ�
create or alter procedure usp_users
as
	select userID, userName, birthYear from userTbl
go

exec usp_users