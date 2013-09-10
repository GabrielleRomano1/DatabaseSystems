--Homework 1
--Gabrielle Romano

SELECT name, city
FROM agents
WHERE
	name==Smith;





SELECT
	pid,
	name,
	quantity
FROM
	Products
WHERE
	priceUSD > 1.25;
	




SELECT
	ordno,
	aid
FROM 
	Orders;



SELECT
	name,
	city
FROM 
	Customers
WHERE
	city!=Dallas;


SELECT
	name
FROM 
	Agents
WHERE
	
	city==New York && city==Newark;



SELECT
	*
FROM 
	Products
WHERE
	city!=New York || city!=Newark && priceUSD =< 1;




SELECT
	*
FROM
	Orders
WHERE
	mon==jan && mon==ma;



SELECT
	*
FROM
	orders
WHERE
	mon==feb && priceUSD<100;




SELECT
	*
FROM 
	customers
WHERE
	cid==c005;



