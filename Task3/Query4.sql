-- Declare the week start date as a parameter
WITH params AS (
    SELECT '2024-11-21'::DATE AS start_date
)
SELECT
    TO_CHAR(ts.date, 'Dy') AS "Day",
    l.genre AS "Genre",
    CASE
        WHEN l.maximum_number_of_students IS NULL AND l.minimum_number_of_students IS NULL THEN 'Individual Lesson'
        WHEN l.maximum_number_of_students - COUNT(DISTINCT l.student_id) <= 0 THEN 'No Seats'
        WHEN l.maximum_number_of_students - COUNT(DISTINCT l.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM
    lesson l
JOIN
    time_slot ts ON l.time_slot_id = ts.time_slot_id,
    params
WHERE
    ts.date BETWEEN params.start_date AND params.start_date + INTERVAL '7 days'
GROUP BY
    TO_CHAR(ts.date, 'Dy'), l.genre, l.maximum_number_of_students, l.minimum_number_of_students, ts.date
ORDER BY
    l.genre, ts.date;
