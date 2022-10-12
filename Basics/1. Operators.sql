OPERATORS --
+------------------------------------------------------------------------------------+-------------------------------------------+
|        OPERATOR	   |                      CONDITIONS	                     |                     DEMO                  |
+--------------------------+---------------------------------------------------------+-------------------------------------------+
|                          |                                                         |  col_name = value                         |
|   =, !=, < <=, >, >=	   |  Standard numerical operators	                     |  col_name != value                        |
|                          |                                                         |  col_name <= value                        | 
+--------------------------+---------------------------------------------------------+-------------------------------------------+
|    BETWEEN ... AND ...   |  Number is within range of two values (inclusive)       |  col_name BETWEEN value_1 AND value_2     |
+--------------------------+---------------------------------------------------------+-------------------------------------------+
|  NOT BETWEEN ... AND ... |  Number is not within range of two values (inclusive)	 |  col_name NOT BETWEEN value_1 AND value_2 |
+--------------------------+---------------------------------------------------------+-------------------------------------------+
|          IN (...)	     |  Number exists in a list	                               |  col_name IN (value_1, value_2)           |
+--------------------------+---------------------------------------------------------+-------------------------------------------+
|        NOT IN (...)	     |  Number does not exist in a list	                       |  col_name NOT IN (value_1, value_2)       |
+--------------------------+---------------------------------------------------------+-------------------------------------------+


Students -
+------------+--------------+--------------+--------+
| Student_ID | Student_Name | Passing_year | Grades | 
+------------+--------------+--------------+--------+
|      1     |       A      |     S2024    |   3.5  |
+------------+--------------+--------------+--------+
|      2     |       B      |     F2023    |   4.0  |
+------------+--------------+--------------+--------+
|      3     |       C      |     F2022    |   3.7  |
+------------+--------------+--------------+--------+
|      4     |       D      |     S2025    |   3.0  |
+------------+--------------+--------------+--------+
|      5     |       E      |      NULL    |   2.5  |
+------------+--------------+--------------+--------+


EXAMPLES -

/* 
Selecting all values for student 'C' 
*/
SELECT * 
FROM Students
WHERE Student_Name = C;
+------------+--------------+--------------+--------+
| Student_ID | Student_Name | Passing_year | Grades |
+------------+--------------+--------------+--------+
|      3     |       C      |     F2022    |   3.7  |
+------------+--------------+--------------+--------+

/* 
Selecting Passing Year and Grades for students having Ids between 1 and 3
*/
SELECT Passing_Year, Grades 
FROM Students
WHERE Student_ID BETWEEN 1 AND 3;
+--------------+--------+
| Passing_year | Grades |
+--------------+--------+
|     F2023    |   4.0  |
+--------------+--------+
|     F2022    |   3.7  |
+--------------+--------+


/*
Selecting student having grades between 3.5 to 4.0
*/
SELECT Student_Name
FROM Students
WHERE Grades IN (3.5, 4.0)
+--------------+ 
| Student_Name | 
+--------------+ 
|       B      |    
+--------------+ 
|       C      |     
+--------------+ 
