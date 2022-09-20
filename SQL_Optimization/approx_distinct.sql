/*
Use APPROX_DISTINCT() instead of COUNT(distinct) for very large datasets
*/

/*
COUNT(distinct) Clause
*/
SELECT 
  COUNT(distinct col_name)
FROM
  table1

/*
APPROX_DISTINCT() Clause
*/
SELECT 
  APPROX_DISTINCT(close_value)
FROM
  table1
  
/*
Case Study
*/

??
