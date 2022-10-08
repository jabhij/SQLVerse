/*

count(*) - counts all the values in that column, including NULL(s)
count(col_name) - counts all the values in that column, except the NULL(s)
count(number) - counts all the values in that column, including NULL(s)
count(string) - counts all the values in that column, including NULL(s)

*/

Table1 -
------------------------------
Col_1 | Col_2 | Col_3 | result 
------------------------------
   A  |   1   |   Z   |   0
------------------------------
   B  |   2   |  NULL |   9
------------------------------
   C  |   3   |   X   |   8
------------------------------
   D  |  NULL |   W   |   7
------------------------------


SELECT
COUNT(*) FROM Table1
AS result
------
result  
------
  4   
------


SELECT
COUNT(col_2) FROM Table1
AS result
------
result  
------
  5   
------


SELECT
COUNT(1) FROM Table1
AS result
------
result  
------
  5   
------


SELECT
COUNT(One) FROM Table1
AS result
------
result  
------
  5   
------
