"""
MAX_BY()
    MAX_BY() is like MAX(), but can be used to simplify queries that involve grouping. Here's how:
  
    MAX(price) - this gives us the largest value in the "price" column.
    MAX_BY(vegetable, price) - this gives us the value in the "vegetable" column whose price = MAX(price).

    If we didn't use MAX_BY(), our query would be more complicated! One strategy to find the name of the vegetable with 
    the MAX() price would be to use a subquery in the WHERE clause. This pattern is common, but it's a bit messy to read.
    To make query simpler and more readable, just use MAX_BY() instead! Of course, there's also a MIN_BY() function that 
    works the same way.

    NOTE: if there's a tie, MAX_BY() only returns one row, but using the WHERE clause will return multiple rows.
"""

-- Table: groceries
 ___________________ 
| vegetable | price |
 ___________________
| broccoli  | 10.15 |
| cabbage   | 5.25  |
| arugula   | 1.05  |
 ___________________

-- Subquery version:
SELECT vegetable
FROM groceries
WHERE price = (SELECT MAX(price) FROM groceries);

-- MAX BY() version:
SELECT MAX_BY(vegetable, price) AS most_expensive_veg
FROM groceries;

-- Result:
 ____________________
| most_expensive_veg |
 ____________________
| broccoli           |
 ____________________
