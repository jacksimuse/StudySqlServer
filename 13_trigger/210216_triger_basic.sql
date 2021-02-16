use sqlDB
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- 삭제, 수정할 때 트리거 발생
as
	print '새트리거 발생'

insert into testTBL values ('BTS')
select * from testTBL where txt = '마마무'
update testTBL set txt = '마마무뉴!' where id = 3
delete testTBL where id = 2