select * from uv_notrentalmember

-- ������ �Է�
insert into booksTBL
(
	cateidx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
)
values
(
	'N0002',
	'�������� ���� ����',
	'��ȳ�',
	'������',
	'2019-10-02',
	'9791135445705',
	12500
)

-- å���̺� �� å ������, ����, ������� ����
begin tran

select 
	* from booksTBL

update booksTBL
   set descriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����.'
     , regDate = '2021-02-18'
 where bookidx = 15


rollback
commit

select * from cateTBL
-- ī�װ� �Է�
begin tran

insert into cateTBL values ('I0001', '��ȭ/����'),
						   ('I0002', '����/ó��'),
						   ('I0003', '�ð�����')

rollback
commit

begin tran

delete from cateTBL where cateidx = 'I0003'

rollback
commit