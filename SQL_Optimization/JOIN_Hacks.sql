/*
Always order your JOINs from largest tables to smallest tables
*/


/*
Smallest table first
*/
SELECT 
  *
FROM 
  small_table

JOIN 
  large_table
ON small_table.id = large_table.id

/*
Largest  table first
*/
SELECT 
  *
FROM 
  large_table

JOIN 
  Small_table
ON small_table.id = large_table.id


/*
Case Study
*/

?
