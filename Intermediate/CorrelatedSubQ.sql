Correlated Subqueries --
+------------------------------------------------------------------------------+-------------------------------------------+
|                                 DETAILS                                      |                   DEMO                    |
+------------------------------------------------------------------------------+-------------------------------------------+
| - Correlated subqueries are subqueries that reference one or more columns in | SELECT ---                                |
|   in the main query.                                                         |   --- Subquery goes in here ---           |
| - Correlated subqueries depend on information in the main query to run, and  |   FROM ---                                |
|   thus, cannot be executed on their own.                                     |                     
| - Correlated subqueries are evaluated in SQL once per row of data retrieved  |
|   -- a process that takes a lot more computing power & time than a simple    | 
|   subquery.                                                                  |
+--------------------------------------------------------------------------------------------------------------------------+

 
 
