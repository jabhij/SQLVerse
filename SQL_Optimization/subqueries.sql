/*
Avoid subqueries in WHERE Clause
*/


/*
Subqueries in WHERE Clause
*/
SELECT 
  SUM(price)
FROM
  table1 
WHERE
  itemid IN (
    SELECT itemid
    FROM table2
)

/*
Avoiding subqueries in WHERE Clause
*/
WITH t2 AS(
  SELECT itemid
  FROM table2
)
SELECT 
  SUM(price)
FROM
  table1 as t1
JOIN
  t2
ON t1.itemid = t2.itemid
)

/*
Case Study
*/

??
