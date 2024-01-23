SUBQUERIES --
+-------------------------------------------------------------+-------------------------------------------+
|                           DETAILS                           |                   DEMO                    |
+-------------------------------------------------------------+-------------------------------------------+
| - A subquery is a query that is nested inside a DML command | SELECT ---                                |
|   SELECT, INSERT, UPDATE, or DELETE  statement, or inside   |   --- Subquery goes in here ---           |
|   another subquery.                                         |   FROM ---                                |
+-------------------------------------------------------------+-------------------------------------------+

TYPES --
+----------------+-------------------------------------------------------------+-------------------------------------------+
|       Type     |                               DETAILS                       |                   DEMO                    |
+----------------+-------------------------------------------------------------+-------------------------------------------+
|     Scaler     | - Always returns only one column and one row.               | SELECT ---                                |
|    Subquery    | - Can be used in- WHERE, FROM, SELECT clauses.              |   --- Subquery goes in here ---           |                                   |  
|                |                                                             |     FROM ---                              |
+----------------+-------------------------------------------------------------+-------------------------------------------+
|  Multiple Row  | - Returns multiple columns and multiple rows.               | SELECT ---                                |                         |
|  / Non-Scaler  | - Returns only 1 column and multiple rows.                  |   --- Subquery goes in here ---           |
|    Subquery    | - We can use IN, EXISTS, HAVING                             |      FROM ---                             |
+----------------+-------------------------------------------------------------+-------------------------------------------+
|                | - Correlated subqueries are subqueries that reference one   |                                           |
|                |   or more columns in the main query.                        |                                           |
|   Correlated   | - Correlated subqueries depend on information in the main   |                                           |
|    Subquery    |   query to run, and thus, cannot be executed independently. |                                           |
|                | - Correlated subqueries are evaluated in SQL once per row   |                                           |
|                |   of data retrieved.                                        |                                           |
+----------------+-------------------------------------------------------------+-------------------------------------------+


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
                                                                                                   
  /* SUBQUERY */

SELECT Uni_Name,
  (SELECT Student_Name
    FROM Students
      WHERE University_Details.ID = Students.Student_Id)
 FROM University_Details;

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


---------- SCALER SUBQUERY ----------

/*
  1. Using Scalar Subquery in SELECT Clause:
*/
  SELECT Student_Name, Passing_year, 
    (SELECT MAX(Grades) FROM Students) AS Max_Grades
  FROM Students;

  /* Explanation-
   This subquery in the SELECT clause retrieves the maximum grades across all students for each row.
  */

/*
  2. Using Scalar Subquery in WHERE Clause:
*/
  SELECT Uni_Name, Course
  FROM University_Details
  WHERE (SELECT COUNT(*) FROM Ranks WHERE University = University_Details.Uni_Name) > 2;

  /* Explanation-
   The subquery in the WHERE clause checks if a university has more than 2 ranks in the Ranks table before including it in the result.
  */

/*
  3. Using Scalar Subquery in UPDATE Statement:
*/
  UPDATE Students
  SET Passing_year = 'S2025'
  WHERE Student_Id = 3 AND (SELECT MAX(Rank) FROM Ranks) > 3;

  /* Explanation-
   This update statement uses a subquery to ensure that the passing year is updated only if the maximum rank in the Ranks table is 
   greater than 3.
  */

/*
  4. Using Scalar Subquery in INSERT Statement:
*/
  INSERT INTO Ranks (University, Course, Rank)
  VALUES ('XYZ', 'AI', (SELECT MIN(Grades) * 2 FROM Students));

  /* Explanation-
   Here, the scalar subquery calculates the rank for a new entry in the Ranks table based on the minimum grades from the Students table.
  */

/*
  5. Using Scalar Subquery in SELECT with EXISTS:
*/
  SELECT Student_Name
  FROM Students
  WHERE EXISTS (SELECT 1 FROM Ranks WHERE Ranks.Rank > 4 AND Students.Student_Id = Ranks.Id);

  /* Explanation-
   This query selects student names where there exists a rank with a value greater than 4 in the Ranks table for the corresponding student.
  */

--- PRO TIP ---
/* 
   Scalar subqueries are versatile and can be used in various parts of SQL statements to retrieve single values for 
   comparison, calculation, or assignment.
*/

  
---------- NON-SCALER SUBQUERY ----------

/*
  1. Non-Scalar Subquery with IN Clause:
*/   
  SELECT Uni_Name, Course
  FROM University_Details
  WHERE Uni_Name IN (SELECT University FROM Ranks WHERE Rank <= 3);

  /* Explanation-
   In this example, the subquery with the IN clause checks if a university has ranks within the top 3 in the Ranks table before 
   including it in the result.
  */

/*  
  2. Non-Scalar Subquery with EXISTS Clause:
*/   
  SELECT Student_Name
  FROM Students
  WHERE EXISTS (SELECT 1 FROM Ranks WHERE Ranks.Student_Id = Students.Student_Id AND Rank > 4);

  /* Explanation-
   This query selects student names where there exists a rank with a value greater than 4 in the Ranks table for the corresponding 
   student, using the EXISTS clause.
  */

/*  
  3. Non-Scalar Subquery with HAVING Clause:
*/   
  SELECT Uni_Name, AVG(Grades) AS Avg_Grades
  FROM University_Details
  JOIN Students ON University_Details.Uni_Name = Students.Uni_Name
  GROUP BY Uni_Name
  HAVING AVG(Grades) > (SELECT AVG(Grades) FROM Students);

  /* Explanation-
   In this example, the HAVING clause is used to filter universities with an average student grade higher than the overall average grade.
  */

--- PRO TIP ---
/* 
   In general, scalar subqueries are used in the SELECT clause because they return a single value. Non-scalar subqueries, which can 
   return multiple rows or columns are typically used in other parts of the SQL statement, such as the WHERE clause, FROM clause, or 
   HAVING clause.
   However, there are certain scenarios where a non-scalar subquery can be used in the SELECT clause, but it requires careful handling 
   to avoid errors. One common approach is to use subqueries in combination with aggregate functions to ensure that the subquery returns 
   a single value."
*/
