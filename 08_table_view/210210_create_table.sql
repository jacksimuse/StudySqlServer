--create table testTBL (num int)
--drop table testTBL
/*
use tempdb
go
drop database tableDB
go
create database tableDB
*/

use tableDB
go
drop table  buyTBL, userTBL
go
create table userTBL -- �θ�
(
	userID		char(8)		 not null	primary key,  -- ���̵�
	userName	nvarchar(10) not null,	-- �̸�
	birthYear	int			 not null default year(getdate()),	-- ����⵵
	addr		nchar(2)	 not null default '����',	-- ����
	mobile1		char(3)		 null,		-- �޴��� ����
	mobile2		char(8)		 null,		-- �޴�����ȣ
	height		smallint	 null	  default 170,-- Ű
	email		varchar(150) not null   unique,  -- �̸����߰� 210210 14:25
	mDate		date		 null		-- ȸ��������
);
go
create table buyTBL -- �ڽ�
(
	num			int			 not null	identity(1, 1) primary key, -- ����(PK)
	userID		char(8)		 not null
		foreign key references userTBL(userID), 	-- ���̵�
	prodName	nchar(6)	 not null,	-- ǰ��
	groupName	nchar(4)	 null,		-- �з�
	price		int			 not null,	-- �ܰ�
	amount		smallint	 not null	-- ����
);
go