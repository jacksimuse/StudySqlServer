select @@VERSION


-- 형 변환함수
select convert (float, amount)  as amount from buyTbl
select TRY_CONVERT(float, amount) as amount from buyTbl
select AVG(convert (float, amount) ) as [평균구매개수] from buyTbl

select price, amount, price/amount as [단가/수량] from buyTbl;

--
-- 1000 --> 숫자
select parse('2021년 2월 39일' as date);
select try_parse('2021년 2월 39일' as date);

select PARSE('123.45' as int)
select try_PARSE('123.45' as int)

select cast('11' as int)

-- 스칼라함수(단일 리턴함수)
select GETDATE() as [현재날짜]

select year(getdate()) as [금년]
select month(getdate()) as [이번달]
select day(getdate()) as [오늘]

select abs(-100);
select round(3.1415, 3)
select round(1234.5678, -1)

select cast((rand() * 100) as int)

select iif(200 > 100, '메', '롱')

-- 문자열함수
select ASCII('A')
select char(98), char(66)
select UNICODE('가')
select NCHAR(45909)

-- 진짜 많이 쓰이는거
-- 문자열 결함
select concat('SQL', 'Server', 2019)
-- 문자열 시작위치 리턴
select CHARINDEX('Server', 'SQL Server 2019')
-- left, right
select LEFT('SQL Server 2019', 3), RIGHT('SQL Server 2019', 4)
-- substring
select substring('Hello World!', 7 ,5)
select SUBSTRING('안녕하세요, SQL서버입니다!', 11 , 2)
-- len
select len('안녕하세요'), len('Hello World!')
-- lower, upper
select lower('abcdeFG'), upper('abcdeFG')
-- ltrim, rtrim
select len(LTRIM('  Hello World!  ')), len(RTRIM('  Hello World!  ')), len(TRIM('  Hello World!  '))


select REPLACE('(2016년 발표)SQL Server 2016', '2016', '2019')

select FORMAT(getdate(), '')

-- 정말 많이 쓰는 함수
select FORMAT(getdate(), '')
select FORMAT(getdate(), 'dd/MM/yyyy')
select FORMAT(getdate(), 'yyyy-MM-dd hh:mm:ss:ms')


