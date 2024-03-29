JOINS --
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|     CLAUSE    |                               DETAILS                               |                   DEMO                    |
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|  INNER JOIN / | - Returns only those rows where the linking values match in both    | INNER JOIN table1                         |
|  JOIN         |   of the tables or in result sets.                                  |   ON (tabl1.col_name = table2.col_name);  |
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|  LEFT OUTER   | - Common values from both the tables + All the selected values from | LEFT JOIN table1                          |
|  JOIN         |   from the left table.                                              |   ON (tabl1.col_name = table2.col_name);  |
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|  RIGHT OUTER  | - Common values from both the tables + All the selected values from | RIGHT JOIN table1                         |
|  JOIN         |   from the right table.                                             |   ON (tabl1.col_name = table2.col_name);  |
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|  FULL JOIN    | - LEFT OUTER JOIN U RIGHT OUTER JOIN.                               | (LEFT JOIN statement) UNION ALL           |
|               |                                                                     | (RIGHT JOIN statement)                    |      
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|  SELF JOIN    | -
|               |                                                                     |                    |  
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|               | - it combines each row from the first table with each row from the  | SELECT table1.Id, table2.Id               |                                          
|  CROSS JOIN   |   second table.                                                     |   FROM table1                             |
|               |                                                                     |     CROSS JOIN table2;                    |
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|   SEMI JOIN   | -                  
|               |                                                                     |                  |  
+---------------+---------------------------------------------------------------------+-------------------------------------------+
|   ANTI JOIN   | -            
|               |                                                                     |                   |  
+---------------+---------------------------------------------------------------------+-------------------------------------------+

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

/* 
INNER JOIN -
Select the University along with the Student
*/
SELECT Uni_Name, Student_Name
FROM University_Details
  INNER JOIN Students
    ON (Students.Student_Id = University_Details.Id);
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

/* 
INNER JOIN -
Select the Course along with the Students
*/
SELECT Course, Student_Name
FROM Ranks
  JOIN University_Details
    ON (Ranks.University = University_Details.Uni_Name)
    JOIN Students
      ON (University_Details.Id = Students.Student_Id)
+------------+--------------+ 
|   Course   | Student_Name |  
+------------+--------------+ 
|     DS     |       B      |    
+------------+--------------+ 
|     PSY    |       C      |     
+------------+--------------+ 
|     CS     |       A      |   
+------------+--------------+ 
|    ARCH    |       E      |    
+------------+--------------+ 
|     BS     |       D      |   
+------------+--------------+

/* 
INNER JOIN -
Select the Course for the student B 
*/
SELECT Course, Student_Name
FROM Ranks
  JOIN University_Details
    ON (Ranks.University = University_Details.Uni_Name)
    JOIN Students
      ON (University_Details.Id = Students.Student_Id)
      
WHERE Student_Name = "B"
+------------+--------------+ 
|   Course   | Student_Name |  
+------------+--------------+ 
|     DS     |       B      |    
+------------+--------------+ 

________________________________________________________________________________________________________________________________________
