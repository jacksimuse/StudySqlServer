select * from uv_notrentalmember

-- 데이터 입력
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
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
)

-- 책테이블 위 책 정보중, 설명, 등록일자 수정
begin tran

select 
	* from booksTBL

update booksTBL
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
     , regDate = '2021-02-18'
 where bookidx = 15


rollback
commit

select * from cateTBL
-- 카테고리 입력
begin tran

insert into cateTBL values ('I0001', '대화/협상'),
						   ('I0002', '성공/처세'),
						   ('I0003', '시간관리')

rollback
commit

begin tran

delete from cateTBL where cateidx = 'I0003'

rollback
commit