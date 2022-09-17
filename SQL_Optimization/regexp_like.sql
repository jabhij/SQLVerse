/*
Use of 'REGEXP_LIKE' to replace 'LIKE' clauses
*/

/*
LIKE Clauses
*/

SELECT * 
  FROM
    table1

WHERE
  lower(item_name) LIKE '%abc%' OR
  lower(item_name) LIKE '%xyz%' OR
  lower(item_name) LIKE '%lmn%' OR
  lower(item_name) LIKE '%ijk%'
  -- and so on
  
/*
REGEXP_LIKE
*/
  
  SELECT *
    FROM
      table1
      
 WHERE
  REGEXP_LIKE (lower(item_name), 'abc | xyz | lmn | ijk')
