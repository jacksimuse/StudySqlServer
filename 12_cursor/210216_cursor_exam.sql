use sqlDB
go

declare cur_usertbl cursor global 
	for select userName, height from userTbl

open cur_usertbl

declare @userName nchar(8)
declare @height smallint -- ȸ���� Ű��� ����
declare @cnt int = 0 -- ȸ����(���� ���)
declare @totalHeight int = 0 -- ȸ�� Ű�� �հ� ����

fetch next from cur_usertbl into @userName, @height -- Ŀ�� ���� �о @height ������ �Ҵ�

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin
	set @cnt += 1
	set @totalHeight += @height
	print concat('ȸ�� : ', @userName, 'Ű : ', @height)
	fetch next from cur_usertbl into @userName, @height
	--print @@fetch_status
end

print concat('ȸ�� Ű ��� => ', @totalHeight / @cnt)

close cur_usertbl
deallocate cur_usertbl
