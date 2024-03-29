
+-------------------------------------------------------------------+--------------------------------------+
|                              DETAILS                              |                  DEMO                |
+-------------------------------------------------------------------+--------------------------------------+
| - Used when we need to apply multiple conditions over a table(s). | CASE WHEN x = 1 THEN 'a'             |
| - Contains a WHEN, THEN, and ELSE statement, whiles finishes with |      ELSE 'b'                        |                                   
|   an END.                                                         |      END                             |
+-------------------------------------------------------------------+--------------------------------------+


Students --                                                   University_Details --                 Ranks --
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+          
| Student_Id | Student_Name | Passing_year | Grades |         |     Id     |    Uni_Name  |         | University |   Course  |  Rank  |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      1     |     Abc      |     S2024    |   3.0  |         |      2     |      LMU     |         |     LMU    |    DS     |    4   | 
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      2     |     Bcd      |     F2023    |   4.0  |         |      3     |      PSU     |         |     PSU    |    PSY    |    5   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      3     |     Cde      |     F2022    |   3.7  |         |      1     |      JKU     |         |     XYU    |    CS     |    6   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      4     |     Def      |     S2025    |   3.0  |         |      5     |      XYU     |         |     IJU    |    ARCH   |    2   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      5     |     Efg      |     NULL     |   2.5  |         |      4     |      IJU     |         |     JKU    |    BS     |    1   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
                                                                                                    |     LMN    |    ML     |    3   | 
                                                                                                    +------------+-----------+--------+ 

A. Select Student Name(s) and assign them a result (A, B, or C) based on their grades.

SELECT Student_Name
    CASE WHEN Grades < 3.0 THEN "C"
         WHEN Grades > 3.0 AND Grades < 3.5 THEN "B"
         ELSE "A"
    END AS results
    
FROM Students
  
