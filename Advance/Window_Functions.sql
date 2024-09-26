"""
  Every window function has 3 parts:
    1. Function + OVER()
    2. PARTITION BY
    3. ORDER BY

  More Details:
    - PARTITION BY does the same thing as GROUP BY.
    - ORDER BY sorts the rows after we've grouped them with PARTITION BY.
    - Since they're inside the OVER() statement, PARTITION BY and ORDER BY apply only to the window function not to the query as a whole.

  Let's put the pieces together to see how they work to build the window function.

    1. Function + OVER():
       This is the function that gets executed on the data in a "window." It gets executed last after we've created the window by grouping and 
       sorting the data with PARTITION BY and ORDER BY. Here are some examples:

        - ROW_NUMBER()
        - RANK()
        - DENSE_RANK()
        - LAG()
        - LEAD()

       We can also use our familiar aggregate functions too:

        - AVG(tripduration)
        - SUM(tripduration)
        - COUNT(tripduration)

      The next part of building a window function is the OVER() statement, which contains the PARTITION BY and GROUP BY statements inside.

    2. PARTITION BY:
       Use PARTITION BY to group the data. The function will be applied to this grouping. For Example:

        - PARTITION BY start_station_name

    3. ORDER BY:
       Use ORDER BY to sort the data. This orders the results after the data has been grouped with PARTITION BY. For Example:
  
        - ORDER BY start_time

      When we pull this all together, we create a window function that calculates a running total:
      SUM(tripduration) OVER(PARTITION BY start_station_name ORDER BY starttime) AS running_total

      This window functions gives us:
        1. The sum of trip durations
        2. Grouped by station name
        3. Ordered by start times
"""

  
-- Create a running total, running count, and running average
-- for trip duration based on start station name for the Citibike dataset.

SELECT
  start_station_name,
  tripduration,
  SUM(tripduration) OVER(PARTITION BY start_station_name ORDER BY starttime) AS running_total,
  COUNT(tripduration) OVER(PARTITION BY start_station_name ORDER BY starttime) AS running_cnt,
  AVG(tripduration) OVER(PARTITION BY start_station_name ORDER BY starttime) AS running_avg
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE start_station_name IS NOT NULL
  AND tripduration IS NOT NULL
ORDER BY start_station_name, running_total;

-- Results:
+--------------------+--------------+---------------+-------------+-------------+
| start_station_name | tripduration | running_total | running_cnt | running_avg |
+--------------------+--------------+---------------+-------------+-------------+
| 1 Ave & E 110 St   |     587      |      587      |       1     |     587.0   |
| 1 Ave & E 110 St   |     632      |      1219     |       2     |     609.5   |
| 1 Ave & E 110 St   |     1254     |      2473     |       3     |     824.33  |
| 1 Ave & E 110 St   |     420      |      2893     |       4     |     723.25  |
| 1 Ave & E 110 St   |     633      |      3526     |       5     |     705.2   |
| 1 Ave & E 110 St   |     438      |      3964     |       6     |     660.67  |
| 1 Ave & E 110 St   |     736      |      4700     |       7     |     671.43  |
| 1 Ave & E 110 St   |     1015     |      5715     |       8     |     714.38  |
| 1 Ave & E 110 St   |     9337     |      15052    |       9     |     1672.44 |
| 1 Ave & E 110 St   |     396      |      15448    |       10    |     1544.8  |
+--------------------+--------------+---------------+-------------+-------------+
