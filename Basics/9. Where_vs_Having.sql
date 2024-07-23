- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

- If at all possible, always use the WHERE clause in your SQL queries. The WHERE clause is faster than HAVING. Because you need to group records before the HAVING clause can execute, it’s a slower strategy 
than filtering records with the WHERE clause. Some queries will require using HAVING, but it should only be used if the WHERE clause will not give you the desired result.
