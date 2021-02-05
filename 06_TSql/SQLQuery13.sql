/*
select memberID, memberName 
  from memberTbl
 where memberID like 'H%'
 */

 --select '1';
 
--  use BikeStores;

--  select * from sales.customers;

--  select * from production.products;

 --DB조회
exec sp_helpdb
--테이블 정보 조회
exec sp_tables  @table_type = "'TABLE'";
--열 이름 조회
exec sp_columns @table_name = 'stocks',
				        @table_owner = 'production';