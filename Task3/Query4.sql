WITH params AS (
    SELECT "2024-08-10"::DATE AS start_date
)
SELECT
    TO_CHAR(filtered_ensembles.date, 'Dy') AS "Day",
    filtered_ensembles.genre AS "Genre",
    CASE
        WHEN filtered_ensembles.max_students - COUNT(DISTINCT filtered_ensembles.student_id) <= 0 THEN 'No Seats'
        WHEN filtered_ensembles.max_students - COUNT(DISTINCT filtered_ensembles.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM (
    SELECT
        l.genre,
        l.lesson_id,
        l.maximum_number_of_students AS max_students,
        ts.date,
        l.student_id
    FROM
        lesson l
    JOIN time_slot ts ON l.time_slot_id = ts.time_slot_id
    WHERE
        ts.date >= (SELECT start_date FROM params)
        AND ts.date < (SELECT start_date FROM params) + INTERVAL '7 days'
        AND l.genre IS NOT NULL
) filtered_ensembles
GROUP BY
    TO_CHAR(filtered_ensembles.date, 'Dy'), filtered_ensembles.genre, filtered_ensembles.max_students, filtered_ensembles.date
ORDER BY
    filtered_ensembles.genre, filtered_ensembles.date;
