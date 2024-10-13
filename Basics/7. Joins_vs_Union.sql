+---------------------------------------------------------+---------------------------------------------------------+
|                         JOINS                           |                          UNIONS                         |
+---------------------------------------------------------+---------------------------------------------------------+
| - Used for joining multiple tables.                     | - Used for joining multiple tables.                     |
+---------------------------------------------------------+---------------------------------------------------------+
| - Two tables can have different number of columns, but  | - Two tables must have same number of columns, and the  |
|   the corresponding columns must have compatible types. |   corresponding columns must have compatible types.     |
+---------------------------------------------------------+---------------------------------------------------------+

  
+---------------+-------------------------------------------------+-------------------------------------------------+
|     Aspect	 |                   FULL JOIN                    |                       UNION                     |
+---------------+-------------------------------------------------+-------------------------------------------------+
| Combines Data | - Horizontally (joins columns)                  | - Vertically (stacks rows)                      |
+---------------+-------------------------------------------------+-------------------------------------------------+
|   Duplicates	| - Keeps all data, including unmatched rows      | - Removes by default (use UNION ALL to keep     |
|               |   filled with NULLs                             |   duplicates)                                   |
+---------------+-------------------------------------------------+-------------------------------------------------+
|    Use Case   | - Merge tables to see data relationships,       | - Combine similar results from two tables       |
|               |   including unmatched rows                      |                                                 |
+---------------+-------------------------------------------------+-------------------------------------------------+
|   Required    | - Can have different columns and data types in  | - Same number of columns and compatible data    |
|   Columns     |   each table                                    |   types                                         |
+---------------+-------------------------------------------------+-------------------------------------------------+
