create or alter function ufn_getState(@rentalState char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5) -- �뿩��, �ݳ�, ��ü��, �н�
	set @result = case @rentalState
					when '1' then '�뿩��'
					when '2' then '�ݳ�'
					when '3' then '��ü��'
					when '4' then '�н�'
					else '����'
				  end
	return @result
end
go