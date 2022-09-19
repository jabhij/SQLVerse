/*
Converting long list of IN clause into a temporary table
*/


/*
IN Clause 
*/

SELECT *
FROM table1 as T1
WHERE
  itemid IN (123453, 535647, 123486, 954524, ..., 348592)

/*
Temporary Table
*/

SELECT * 
FROM table1 as T1
JOIN (
  SELECT 
    itemid 
  FROM (
    SELECT 
      Split ('123453, 535647, ...', '123486, 954524, ...')
          as bar
     )
     
  CROSS JOIN
    UNNEST(bar) AS t(itemid)
) AS table2 as T2

ON
    T1.itemid = T2.itemid

        
/*
Case Study
*/

?
