Query: To write an SQL query to find out the Employees having same salary in the entire dataset.

Solution: Using CTE method..

CREATE TABLE Employee(
    name VARCHAR(255),
    salary DECIMAL(10,2)
);

INSERT INTO Employee(name,salary) VALUES
('Anmol',1000.00),
('Manu',1000.00),
('Akash',2000.00),
('Ansh',2000.00),
('Ujjawal',3000.00);


WITH s1 AS (Select name,salary,
dense_rank() over (order by salary) as rankedSalary
from Employee)

SELECT name,salary
FROM s1
where salary IN 
(SELECT salary
from s1
group by salary
having count(*)>1)

Output:-

Output:
+--------+---------+
| name   | salary  |
+--------+---------+
| Anmol  | 1000.00 |
| Manu   | 1000.00 |
| Akash  | 2000.00 |
| Ansh   | 2000.00 |
+--------+---------+
