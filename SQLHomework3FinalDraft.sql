--Gabrielle Romano
--Database Systemes
--SQL Homework 3
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
select distinct city
from agents inner join orders on agents.aid=orders.aid
			and cid = 'c002';

--3
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

--4
select distinct	orders.pid
from customers customers
	right join orders orders2 on customers.cid = orders2.cid
	right join agents on orders2.aid = agents.aid 
	right join orders on agents.aid = orders.aid
where customers.city = 'Kyoto'
	
--5
select name
from customers
where cid not in (
	select cid
	from orders
	);
	
--6
select name
from 	customers c left outer join orders o on o.cid = c.cid
where o.cid is null
order by c.cid

--7
select distinct c.name, a.name
from customers c
inner join orders o on o.cid = c.cid
inner join agents a on o.aid = a.aid
and a.city = c.city

--8 
select c.name,
	a.name, 
	c.city
from 	customers c inner join agents a on c.city = a.city
	
--9.
select distinct	c.name,
				c.city
from 	customers c inner join orders o on c.cid = o.cid
					inner join products p on p.pid = o.pid
where 	c.city = ( 
				select city 
				from (
					select 	p.city,
					count(p.city) as "NumberofCities"
					from products p
					group by p.city) sub1
				where "NumberofCities" = (
									select min("NumberofCities")
									from
										(select p.city,
												count(p.city) as "NumberofCities"
										from products p
										group by p.city) sub2
										)	
				);
				
--10
select distinct	c.name,
		c.city
from 	customers c 	inner join orders o on c.cid = o.cid
						inner join products p on p.pid = o.pid
where c.city = (
				select city
				from (
					select p.city,
					count(p.city) as "NumberofCities"
					from products p
					group by p.city) sub1
				where "NumberofCities" = (
									select max("NumberofCities")
									from (
											select p.city,
											count(p.city) as "NumberofCities"
											from products p
											group by p.city) sub2
					)
					LIMIT 1
		);

--11
select distinct	c.name,
				c.city
from 			customers c
where c.city in (
		select city
		from (
			select p.city,
			count(p.city) as "NumberofCities"
			from products p
			group by p.city) sub1
		where "NumberofCities" = (
						select max("NumberofCities")
						from (
							select p.city,
								count(p.city) as "NumberofCities"
							from products p
							group by p.city) sub2
					)
					
		);
		
--12
select 	p.name
from products p
group by p.name
having avg(priceusd) > (select avg(priceusd) from products)

--13
select 	c.name,
		o.pid,
		o.dollars
from 	orders o inner join customers c on o.cid = c.cid
order by o.dollars desc

--14 
select 	c.name,
	sum(o.dollars) as "Total Ordered"
from 	customers c inner join orders o on c.cid = o.cid
group by c.name
having sum(o.dollars) = sum(o.dollars)
order by c.name asc
	
--15
select 	c.name,
		p.name,
		a.name
from 	orders o inner join customers c	 on o.cid = c.cid
		inner join products p	 on o.pid = p.pid
		inner join agents a	 on o.aid = a.aid
		and a.city = 'New York'	
		
--16
select 	o.qty,
	p.priceUSD,
	c.discount,
	o.dollars,
	o.qty * p.priceUSD * (1- c.discount / 100) as "CalculatedDiscount"
from orders o 	inner join products p on o.pid = p.pid
		inner join customers c on o.cid = c.cid


--17
--created an error in the dollars table
delete
from orders 
where ordno = 1011

INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1011, 'jan', 'c001', 'a01', 'p01', 1000, 451.00);

--query checking accuracy
select 	o.qty,
	p.priceUSD,
	c.discount,
	o.dollars,
	o.qty * p.priceUSD * (1- c.discount / 100) as "CalculatedDiscount"
from orders o 	inner join products p on o.pid = p.pid
		inner join customers c on o.cid = c.cid
where o.qty * p.priceUSD * (1- c.discount / 100) != o.dollars
	
	
	
