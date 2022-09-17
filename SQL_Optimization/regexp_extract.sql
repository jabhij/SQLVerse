/*
Use 'REGEXP_EXTRACT' to replace 'CASE- WHEN LIKE'
*/


/*
CASE- WHEN LIKE Clause
*/

SELECT
CASE

  WHEN CONCAT(' ', item_name, ' ') LIKE '%abc%' THEN 'abc'
  WHEN CONCAT(' ', item_name, ' ') LIKE '%xyz%' THEN 'xyz'
  WHEN CONCAT(' ', item_name, ' ') LIKE '%lmn%' THEN 'lmn'
...

AS random_names
FROM item_list


/*
REGEXP_EXTRACT Clause
*/

SELECT
  REGEXP_EXTRACT(itam_name, '(abc | xyz | lmn |..)')
AS random_names
FROM item_list
