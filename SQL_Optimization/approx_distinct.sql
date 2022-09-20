/*
Use APPROX_DISTINCT() instead of COUNT(distinct) for very large datasets
*/

/*
Use of COUNT(distinct)
*/
SELECT 
  COUNT(distinct col_name)
FROM
  table1

/*
Use of APPROX_DISTINCT()
*/
SELECT 
  APPROX_DISTINCT(close_value)
FROM
  table1
  
/*
Case Study
*/

??
