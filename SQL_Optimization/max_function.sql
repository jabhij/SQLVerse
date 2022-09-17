/*
Use MAX instead of RANK
*/


/*
Use of MAX
*/
SELECT
  *
FROM (
  SELECT
      userid,
      RANK() over (ORDER BY prdate desc) AS rank
  FROM table1
)
WHERE ranking = 1

/*
Use of RANK
*/
SELECT
  userid, MAX(prdate)
FROM
  table1

GROUP BY 1

/*
Case Study
*/

??
