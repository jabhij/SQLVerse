/*
Use APPROX_DISTINCT() instead of COUNT(distinct) for very large datasets
*/

/*
Use of COUNT(distinct)
*/


/*
Use of APPROX_DISTINCT()
*/
SELECT APPROX_DISTINCT(close_value)
FROM
  sales_pipeline
  
/*
Case Study
*/

??
