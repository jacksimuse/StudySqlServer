select * from sales.customers
where last_name like 's%'
and state = 'NY'
and phone is not null
order by first_name