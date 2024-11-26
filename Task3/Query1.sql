SELECT
    TO_CHAR(ts.date, 'Mon') AS Month,
    COUNT(*) AS Total_Lessons,
    SUM(CASE WHEN pl.lesson_type = 'Individual' THEN 1 ELSE 0 END) AS Individual,
    SUM(CASE WHEN pl.lesson_type = 'Group' THEN 1 ELSE 0 END) AS Group,
    SUM(CASE WHEN pl.lesson_type = 'Ensemble' THEN 1 ELSE 0 END) AS Ensemble
FROM
    lesson l
JOIN
    price_list pl ON l.price_list_id = pl.price_list_id
JOIN
    time_slot ts ON l.time_slot_id = ts.time_slot_id
WHERE
    EXTRACT(YEAR FROM ts.date) = 2024 -- Replace with the desired year
GROUP BY
    TO_CHAR(ts.date, 'Mon')
ORDER BY
    MIN(ts.date);