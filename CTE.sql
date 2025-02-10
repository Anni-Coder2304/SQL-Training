Query: Write an SQL query to find out the highest amount of each item in the bekow dataset given.

Orders
order_id	item	amount	customer_id
1	Keyboard	    400	            4
2	Mouse	        300            	4
3	Monitor    	12000           	3
4	Keyboard   	  400	            1
5	Mousepad	    250           	2
6	Keyboard	    600           	5

SQL query using the CTE:

WITH RankedOrders AS (
    SELECT item, amount,
           DENSE_RANK() OVER (PARTITION BY item ORDER BY amount DESC) AS denseRank
    FROM Orders
),

Item_with_first_highest_amount AS (
    SELECT item, amount,
    FIRST_VALUE(amount) over (partition by item order by amount desc) as FirstValue
    from  RankedOrders)                         
    
select item,FirstValue
from Item_with_first_highest_amount;


Output dataset:

item	FirstValue
Keyboard	600
Keyboard	600
Keyboard	600
Monitor 	12000
Mouse	    300
Mousepad  250
