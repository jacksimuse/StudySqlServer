-- ����� ���� �Լ��� ������ ��
select
	*,
	(year(getdate() - birthYear) + 1 ����
	from userTbl

-- ����� ���� �Լ� ���
select *,
	dbo.ufn_getAge(birthYear) ����
 from userTbl