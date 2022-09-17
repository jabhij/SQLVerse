/*
Use simple EQUI JOINS
*/


/*
Using 
*/

SELECT 
  *
FROM 
  table1 a
JOIN
  table2 b
ON a.date = CONCAT(b.year, '-', b.month, '-', b.day)

/*
Using simple Equi Joins
*/

SELECT 
  *
FROM 
  table1 a
JOIN (
  SELECT
    name, CONCAT(b.year, '-', b.month, '-', b.day) as date
  FROM 
    table2 b
    ) new

ON a.date = new.date
    

/*
Case Study
*/

??
