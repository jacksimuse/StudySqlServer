-- ���� ȸ������ �ҷ����� ���� ���� + �̸���
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels desc, memberName asc


 -- å����
 select cateidx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc

select * from cateTBL

-- �ý��� �Լ� ��� ����
select memberID, 
	   concat(right(memberName, 2),',', left(memberName, 1)) �̱����̸�,
	   case levels
			when 'A' then '���'
			when 'B' then '�ǹ�'
			when 'C' then '�����'
			when 'D' then 'öȸ��'
			when 'S' then '������'
			else '��ȸ��'
	   end ȸ������,
	   mobile,
	   upper(email) �̸���
  from memberTBL
 where levels <> 's'
 order by levels, memberName

