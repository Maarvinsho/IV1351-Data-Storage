SELECT
    sibling_count AS "No of Siblings",
    COUNT(student_id) AS "No of Students"
FROM (
    SELECT
        s.student_id,
        COUNT(spn.sibling_personal_number) AS sibling_count
    FROM
        student s
    LEFT JOIN
        sibling_personal_number spn ON s.student_id = spn.student_id
    GROUP BY
        s.student_id
) sibling_counts
GROUP BY
    sibling_count
ORDER BY
    sibling_count;
