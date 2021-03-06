--Gabrielle Romano
--Database Systemes
--SQL Homework 2
--Sept 22 2013


--1
select city 
from agents
where aid in (
		select aid
		from orders
		where cid = 'c002'
	);

--2	
select distinct pid
from orders
where aid in (
		select aid
		from orders
		where cid in (
			select cid
			from customers
			where city = 'Kyoto'
			)
		
	);

--3
select cid, name
from customers
where cid not in (	
		select cid
		from orders
		where aid not in (
			select aid
			from agents 
			where aid != 'a03'
			)
		);

--4
select cid, name
from customers
where cid in (
	select cid
	from orders
	where pid = 'p01') AND 
	cid in (
		select cid
		from orders
		where pid = 'p07'
	);

--5
select pid
from products
where pid in (
	select pid
	from orders
	where aid in (
		select aid
		from agents
		where aid = 'a03'
		)
	);


--6
select name, discount
from customers
where cid in (
	select cid
	from orders
	where aid in (
		select aid 
		from agents
		where city = 'Dallas' OR city = 'Duluth'
		)
	);




--7
select *
from customers 
where discount in (
	select discount
	from customers
	where city = 'Dallas' OR city = 'Kyoto'
	 )
	 And city != 'Dallas' And city != 'Kyoto' ;








	
