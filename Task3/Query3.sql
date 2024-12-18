-- Declare the month as a parameter
WITH params AS (
    SELECT 'October' AS month_name
)
SELECT
    i.instructor_id AS "Instructor Id",
    i.name AS "Name",
    COUNT(l.lesson_id) AS "No of Lessons"
FROM
    instructor i
JOIN
    lesson l ON i.instructor_id = l.instructor_id
JOIN
    time_slot ts ON l.time_slot_id = ts.time_slot_id,
    params
WHERE
    TO_CHAR(ts.date, 'Month') ILIKE params.month_name || '%'
GROUP BY
    i.instructor_id, i.name
HAVING
    COUNT(l.lesson_id) > 0 -- Replace '3' with your desired threshold
ORDER BY
    COUNT(l.lesson_id) DESC;




----------------------------------------------

-- OPTIMERAT VERSION AV QUERY 3 EFTER EXPLAIN ANALYZE   

WITH params AS (
    SELECT 10 AS month, 2024 AS year -- Replace with desired month/year
)
SELECT
    i.instructor_id AS "Instructor Id",
    i.name AS "Name",
    COUNT(filtered_lessons.lesson_id) AS "No of Lessons"
FROM
    instructor i
JOIN (
    SELECT
        l.lesson_id,
        l.instructor_id
    FROM
        lesson l
    JOIN time_slot ts ON l.time_slot_id = ts.time_slot_id
    WHERE
        EXTRACT(MONTH FROM ts.date) = (SELECT month FROM params)
        AND EXTRACT(YEAR FROM ts.date) = (SELECT year FROM params)
) filtered_lessons ON i.instructor_id = filtered_lessons.instructor_id
GROUP BY
    i.instructor_id, i.name
HAVING
    COUNT(filtered_lessons.lesson_id) > 0
ORDER BY
    COUNT(filtered_lessons.lesson_id) DESC;


-- Benefits of Optimizations

    --Efficient Index Usage:
      --  Replacing TO_CHAR with EXTRACT allows the query to use indexes on the time_slot.date column.

    --Scalability:
      --  Adding indexes and using pre-aggregated data ensures the query remains efficient even as the dataset grows.

    --Maintainability:
      --  Using numeric filters (month and year) is more intuitive and easier to adjust programmatically.


