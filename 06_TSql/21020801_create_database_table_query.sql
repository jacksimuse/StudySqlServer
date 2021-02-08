use tempdb;
go

create database sqlDB;
go

--DB����
use sqlDB;

create table userTbl --ȸ�����̺�
(
	userID	char(8) not null primary key, --����� ID
	uwerName	nvarchar(10) not null, --�̸�
	birthYear	int not null, -- ����⵵
	addr	nchar(2) not null, -- ����
	mobile1	char(3), -- �޴��� ����(010~019)
	mobile2	char(8), -- �޴��� ������(-����)
	height	smallint, -- Ű
	mDate	date -- ȸ�� ������
);
go
create table buyTbl -- ���� ���̺�
(
	num int identity not null primary key, --����(PK)
	userID char(8) not null --���̵�(FK)
		FoREIGN KEY REFERENCES userTbl(userID),
	prodName nvarchar(20) not null, -- ��ǰ��
	groupName nchar(4), -- �з�
	price int not null, -- �ܰ�
	amount  smallint not null -- ����
);
go