/*
Always 'GROUP BY' the attribute/column with the largest number of unique entities/values 
*/


/*
Demo this- NO
*/
SELECT
  main_category,
  sub_category,
  item_id,
  SUM(price)
  
FROM
  table1
GROUP BY
  main_category, sub_category, item_id

/*
Demo this- YES
*/
SELECT
  main_category,
  sub_category,
  item_id,
  SUM(price)
  
FROM
  table1
GROUP BY
  item_id, sub_category, main_category

/*
Case Study
*/

??
