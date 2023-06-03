REGEXP (Regular Expression) vs LIKE --

In SQL, both the LIKE operator & the REGEXP (regular expression) operator can be used for pattern matching, but they differ in functionality & syntax. 
Let's check some crucial parameters-

1. 𝐏𝐞𝐫𝐟𝐨𝐫𝐦𝐚𝐧𝐜𝐞-
LIKE tends to be more efficient than REGEXP. Regular expressions involve more complex pattern-matching algorithms, which can be slower when dealing with 
large datasets. If performance is a crucial consideration and your pattern-matching needs can be met with LIKE, it may be a more optimal choice.

2. 𝐏𝐚𝐭𝐭𝐞𝐫𝐧 𝐌𝐚𝐭𝐜𝐡𝐢𝐧𝐠 𝐏𝐫𝐞𝐜𝐢𝐬𝐢𝐨𝐧-
If you require precise pattern matching with specific rules or conditions, regular expressions offer more control. Regular expressions allow you to define 
complex patterns using metacharacters, quantifiers, capturing groups, and more. This level of precision may be beneficial for intricate pattern-matching 
scenarios.

3. 𝐃𝐚𝐭𝐚𝐛𝐚𝐬𝐞 𝐂𝐨𝐦𝐩𝐚𝐭𝐢𝐛𝐢𝐥𝐢𝐭𝐲-
The availability and support for REGEXP vary across different SQL database systems. While LIKE is a standard operator supported by almost all SQL databases. 
If you need your code to be portable across various database systems, LIKE is a safer choice.

4. 𝐃𝐚𝐭𝐚 𝐕𝐨𝐥𝐮𝐦𝐞- 
Consider the size of your dataset & the number of pattern matching operations you need to perform. If you have a large dataset and numerous pattern matching 
queries, the performance difference between REGEXP and LIKE becomes more significant. You may need to conduct performance testing to determine which option 
is more efficient for your specific situation.

5. 𝐂𝐚𝐬𝐞 𝐒𝐞𝐧𝐬𝐢𝐭𝐢𝐯𝐢𝐭𝐲-
By default, both LIKE & REGEXP are case-sensitive. However, some database systems provide options to make them case-insensitive. If you need case-insensitive 
pattern matching, check the capabilities of your database system.

-------------------------------------------------------------------------------------------------------------------------------------------------------------

Students --                                                   University_Details --                 Ranks --
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+          
| Student_Id | Student_Name | Passing_year | Grades |         |     Id     |    Uni_Name  |         | University |   Course  |  Rank  |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      1     |       A      |     S2024    |   3.0  |         |      2     |      LMU     |         |     LMU    |    CDS    |    4   | 
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      2     |       B      |     F2023    |   4.0  |         |      3     |      PSU     |         |     PSU    |    PSY    |    5   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      3     |       C      |     F2022    |   3.7  |         |      1     |      JKU     |         |     XYU    |    CS     |    6   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      4     |       D      |     S2025    |   3.0  |         |      5     |      XYU     |         |     IJU    |    ARCH   |    2   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      5     |       E      |     NULL     |   2.5  |         |      4     |      IJU     |         |     JKU    |    BS     |    1   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      6     |       F      |     NULL     |   3.3  |                                               |     LMN    |    ML     |    3   | 
+------------+--------------+--------------+--------+                                               +------------+-----------+--------+ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------

A. Select all Student's detail with a Passing year starting with "S":

/* Using LIKE */
SELECT * FROM Students
WHERE Passing_year LIKE "S%";

/* Using REGEXP */
SELECT * FROM Students
WHERE Passing_year REGEXP "^S";

+------------+--------------+--------------+--------+                   
| Student_Id | Student_Name | Passing_year | Grades |           
+------------+--------------+--------------+--------+        
|      1     |       A      |     S2024    |   3.0  |        
+------------+--------------+--------------+--------+       
|      4     |       D      |     S2025    |   3.0  |         
+------------+--------------+--------------+--------+ 

B. Select all University's detail with a course name ending with "S":

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course LIKE "%S";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "S$";

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+          
|     LMU    |    CDS    |    4   | 
+------------+-----------+--------+     
|     XYU    |    CS     |    6   |  
+------------+-----------+--------+     
|     JKU    |    BS     |    1   |  
+------------+-----------+--------+   

C. Select all Student's detail with Passing year having "202" in any position:

/* Using LIKE */
SELECT * FROM Students
WHERE Passing_year LIKE "%202%";

/* Using REGEXP */
SELECT * FROM Students
WHERE Passing_year REGEXP "202";

+------------+--------------+--------------+--------+                   
| Student_Id | Student_Name | Passing_year | Grades |           
+------------+--------------+--------------+--------+        
|      1     |       A      |     S2024    |   3.0  |        
+------------+--------------+--------------+--------+       
|      2     |       B      |     S2023    |   4.0  |         
+------------+--------------+--------------+--------+ 
|      3     |       C      |     S2022    |   3.7  |        
+------------+--------------+--------------+--------+       
|      4     |       D      |     S2025    |   3.0  |         
+------------+--------------+--------------+--------+ 

D. Select all University's detail with a course name having "S" and atleaast 2 characters in length:

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course LIKE "C_%";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "CS.";

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+          
|     LMU    |    CDS    |    4   | 
+------------+-----------+--------+     
|     XYU    |    CS     |    6   |  
+------------+-----------+--------+     

E. Select all University's detail with a course name starting with "S" in the second position:

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course LIKE "_S%";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "^.{1}S.*";

/*
In the REGEXP Query-
^     indicates the start of the string.
.{1}  matches any single character.
r     matches the letter 'r'.
.*    matches zero or more of any character.
*/

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+           
|     PSU    |    PSY    |    5   | 
+------------+-----------+--------+     
|     XYU    |    CS     |    6   |
+------------+-----------+--------+ 
|     JKU    |    BS     |    1   |   
+------------+-----------+--------+ 

F. Select all University's detail with a course name starting with "C" & ending with "S":

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course LIKE "C%S";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "^C.*S$";

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+          
|     LMU    |    CDS    |    4   | 
+------------+-----------+--------+     
|     XYU    |    CS     |    6   |  
+------------+-----------+--------+     

G. Select all University's detail where a course name does not starts with "C":

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course NOT LIKE "C%";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "^[^C]";

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+          
|     PSU    |    PSY    |    5   | 
+------------+-----------+--------+     
|     IJU    |    ARCH   |    2   |  
+------------+-----------+--------+     
|     JKU    |    BS     |    1   |
+------------+-----------+--------+  
|     LMN    |    ML     |    3   | 
+------------+-----------+--------+ 

H. Select all University's detail where a course name does not ends with "S":

/* Using LIKE */
SELECT * FROM Ranks
WHERE Course NOT LIKE "%S";

/* Using REGEXP */
SELECT * FROM Ranks
WHERE Course REGEXP "[^S]$";

+------------+-----------+--------+ 
| University |   Course  |  Rank  | 
+------------+-----------+--------+          
|     PSU    |    PSY    |    5   | 
+------------+-----------+--------+     
|     IJU    |    ARCH   |    2   |  
+------------+-----------+--------+     
|     LMN    |    ML     |    3   | 
+------------+-----------+--------+

/* Stay Tuned for more updates */
