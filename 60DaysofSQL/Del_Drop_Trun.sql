/*

Delete -
    - DML command
    - Deletes a particular row(s) from the table

Drop - 
    - DDL command
    - Removes one or more tables (both data & definition)
    
Truncate -
    - DDL command
    - Drops then re-creates the table
    - Empties the table completely (data only)
    - Can't be rolled back
    - Much faster way of deletion

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


DELETE 
FROM Table1
WHERE col_2 = NULL;
+------------------------------+
|Col_1 | Col_2 | Col_3 | result| 
+------+-------+-------+-------+
|   A  |   1   |   Z   |   0   |
+------+-------+-------+-------+
|   B  |   2   |  NULL |   9   |
+------+-------+-------+-------+
|   C  |   3   |   X   |   8   |
+------+-------+-------+-------+


DROP 
TABLE Table1;
--

TRUNCATE 
TABLE Table1;
--
