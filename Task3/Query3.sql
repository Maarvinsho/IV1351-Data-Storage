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
