/*

CTE - Common table expression
- Every statement or query produces a temporary relation/outcome in MYSQL. A CTE is used to name those temporary
  results Which are under the execution scope of- INSERT, UPDATE, DELETE, SELECT, etc. operations.
- CTEs are defined using WITH clause.
- CTEs are stored in the memory rather than Temporary DB.
- It can be either NON-RECURSIVE or RECURSIVE.

*/

Table1 -
+------------------------------+
|Col_1 | Col_2 | Col_3 | result| 
+------+-------+-------+-------+
|   A  |   1   |   Z   |   0   |
+------+-------+-------+-------+
|   B  |   2   |  NULL |   9   |
+------+-------+-------+-------+
|   C  |   3   |   X   |   8   |
+------+-------+-------+-------+
|  D   |  NULL |   W   |   7   |
+------+-------+-------+-------+


??
WITH RECURSIVE 
cte_name [(col_1, col_2)]
AS (subquery)
SELECT col_1, col_2 
FROM cte_name ??
