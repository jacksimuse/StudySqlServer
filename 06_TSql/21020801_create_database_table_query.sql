use tempdb;
go

create database sqlDB;
go

--DB생성
use sqlDB;

create table userTbl --회원테이블
(
	userID	char(8) not null primary key, --사용자 ID
	uwerName	nvarchar(10) not null, --이름
	birthYear	int not null, -- 출생년도
	addr	nchar(2) not null, -- 지역
	mobile1	char(3), -- 휴대폰 국번(010~019)
	mobile2	char(8), -- 휴대폰 나머지(-제외)
	height	smallint, -- 키
	mDate	date -- 회원 가입일
);
go
create table buyTbl -- 구매 테이블
(
	num int identity not null primary key, --순번(PK)
	userID char(8) not null --아이디(FK)
		FoREIGN KEY REFERENCES userTbl(userID),
	prodName nvarchar(20) not null, -- 물품명
	groupName nchar(4), -- 분류
	price int not null, -- 단가
	amount  smallint not null -- 수량
);
go