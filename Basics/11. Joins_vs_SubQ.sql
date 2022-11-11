
JOIN VS SUB QUERY
+---------------------------------------------------------+---------------------------------------------------------+
|                         JOIN                            |                        SUB QUERY                        |
+---------------------------------------------------------+---------------------------------------------------------+
| - Used for joining multiple tables.                     | - Used for joining multiple tables.                     |
+---------------------------------------------------------+---------------------------------------------------------+
| - Two tables can have different number of columns, but  | - Two tables can have different number of columns, but  |
|   the corresponding columns must have compatible types. |   the corresponding columns must have compatible types. |
+---------------------------------------------------------+---------------------------------------------------------+
| - Faster execution                                      | - Slower in comparison to JOINS                         |
+---------------------------------------------------------+---------------------------------------------------------+

Students --                                                   University_Details --                 Ranks --
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+          
| Student_Id | Student_Name | Passing_year | Grades |         |     Id     |    Uni_Name  |         | University |   Course  |  Rank  |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      1     |       A      |     S2024    |   3.0  |         |      2     |      LMU     |         |     LMU    |    DS     |    4   | 
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      2     |       B      |     F2023    |   4.0  |         |      3     |      PSU     |         |     PSU    |    PSY    |    5   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      3     |       C      |     F2022    |   3.7  |         |      1     |      JKU     |         |     XYU    |    CS     |    6   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      4     |       D      |     S2025    |   3.0  |         |      5     |      XYU     |         |     IJU    |    ARCH   |    2   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      5     |       E      |     NULL     |   2.5  |         |      4     |      IJU     |         |     JKU    |    BS     |    1   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
                                                                                                    |     LMN    |    ML     |    3   | 
                                                                                                    +------------+-----------+--------+ 
                                                                                                    
---------- INNER JOIN ----------

SELECT Uni_Name, Student_Name
FROM University_Details
  INNER JOIN Students
    ON (Students.Student_Id = University_Details.Id);
    
    
---------- SUB QUERY ----------
SELECT Uni_Name,
  (SELECT Student_Name
    FROM Students
      WHERE University_Details.ID = Students.Student_Id)
 FROM University_Details;
  
/* For both queries the output would be -- */

+------------+--------------+ 
|  Uni_Name  | Student_Name |  
+------------+--------------+ 
|     LMU    |       B      |    
+------------+--------------+ 
|     PSU    |       C      |     
+------------+--------------+ 
|     JKU    |       A      |   
+------------+--------------+ 
|     XYU    |       E      |    
+------------+--------------+ 
|     IJU    |       D      |   
+------------+--------------+
