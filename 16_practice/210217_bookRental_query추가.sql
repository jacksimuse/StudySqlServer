-- ���� ȸ������ �ҷ����� ���� ���� + �̸���
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels desc, memberName asc


 -- å����, �ý��� �Լ�, ���� �Լ� ����
 SELECT  b.bookidx
     -- , b.cateidx
      , b.bookName
      , b.author
      , b.interpreter
      , b.company
  FROM dbo.booksTBL b
 inner join cateTBL c
    on b.cateidx = c.cateidx

-- �뿩�� å�� ���� ���� ����
SELECT r.rentalidx
      --,r.memberidx
      --,r.bookidx
	  ,m.memberName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') �뿩��
	  ,format(r.returnDt, 'yyyy-MM-dd') �ݳ���
	  ,dbo.ufn_getState(r.rentalState) �뿩����
  FROM dbo.rentalTBL r
 inner join booksTBL b
    on r.bookidx = b.bookidx
 inner join memberTBL m
    on r.memberidx = m.memberidx

-- �ý��� ���� �Լ���� ����
select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) �̱����̸�,
      dbo.ufn_getLevel(levels) ȸ������,
      mobile,
      upper(email) �̸���
  from memberTBL
 where levels <> 's'
 order by levels, memberName

--å�� �Ⱥ��� ȸ�� ��ȸ
SELECT r.rentalidx
      --,r.memberidx
      --,r.bookidx
	  ,m.memberName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') �뿩��
	  ,dbo.ufn_getState(r.rentalState) �뿩����
  FROM dbo.rentalTBL r
 left outer join booksTBL b
    on r.bookidx = b.bookidx
 right outer join memberTBL m
    on r.memberidx = m.memberidx
 where r.rentalidx is null
 order by memberName

 -- �츮 å�뿩���� ���� �Ҽ��帣
 select c.cateidx
	   ,c.cateName
	   ,b.bookName
  from cateTBL c
  left outer join booksTBL b
    on c.cateidx = b.cateidx