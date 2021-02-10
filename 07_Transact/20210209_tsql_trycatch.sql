begin try
	insert into userTbl values ('LSG', '이상구', 1988, '경기', null, null, 170, GETDATE())
	print '저장성공'
end try

begin catch
	print '저장실패'
end catch