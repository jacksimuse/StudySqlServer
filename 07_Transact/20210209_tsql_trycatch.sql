begin try
	insert into userTbl values ('LSG', '�̻�', 1988, '���', null, null, 170, GETDATE())
	print '���强��'
end try

begin catch
	print '�������'
end catch