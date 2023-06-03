REGEXP (Regular Expression) vs LIKE --

In SQL, both the LIKE operator & the REGEXP (regular expression) operator can be used for pattern matching, but they differ in functionality & syntax. Let's check some crucial parameters-

1. 𝐏𝐞𝐫𝐟𝐨𝐫𝐦𝐚𝐧𝐜𝐞-
LIKE tends to be more efficient than REGEXP. Regular expressions involve more complex pattern-matching algorithms, which can be slower when dealing with large datasets. If performance is a crucial consideration and your pattern-matching needs can be met with LIKE, it may be a more optimal choice.

2. 𝐏𝐚𝐭𝐭𝐞𝐫𝐧 𝐌𝐚𝐭𝐜𝐡𝐢𝐧𝐠 𝐏𝐫𝐞𝐜𝐢𝐬𝐢𝐨𝐧-
If you require precise pattern matching with specific rules or conditions, regular expressions offer more control. Regular expressions allow you to define complex patterns using metacharacters, quantifiers, capturing groups, and more. This level of precision may be beneficial for intricate pattern-matching scenarios.

3. 𝐃𝐚𝐭𝐚𝐛𝐚𝐬𝐞 𝐂𝐨𝐦𝐩𝐚𝐭𝐢𝐛𝐢𝐥𝐢𝐭𝐲-
The availability and support for REGEXP vary across different SQL database systems. While LIKE is a standard operator supported by almost all SQL databases. If you need your code to be portable across various database systems, LIKE is a safer choice.

4. 𝐃𝐚𝐭𝐚 𝐕𝐨𝐥𝐮𝐦𝐞- 
Consider the size of your dataset and the number of pattern matching operations you need to perform. If you have a large dataset and numerous pattern matching queries, the performance difference between REGEXP and LIKE becomes more significant. You may need to conduct performance testing to determine which option is more efficient for your specific situation.

5. 𝐂𝐚𝐬𝐞 𝐒𝐞𝐧𝐬𝐢𝐭𝐢𝐯𝐢𝐭𝐲-
By default, both LIKE and REGEXP are case-sensitive. However, some database systems provide options to make them case-insensitive. If you need case-insensitive pattern matching, check the capabilities of your database system.

------------------------------

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
|      6     |       F      |     NULL     |   3.3  |                                               |     LMN    |    ML     |    3   | 
+------------+--------------+--------------+--------+                                               +------------+-----------+--------+ 

---------- LEFT OUTER JOIN ----------



---------- LEFT OUTER JOIN ----------



---------- LEFT OUTER JOIN ----------



---------- LEFT OUTER JOIN ----------


---------- LEFT OUTER JOIN ----------
