--11.For each course, calculate:  Total number of enrolled users Total number of lessons Average lesson duration
SELECT C.courses_id,E.TOTAL_USERS,L.TOTAL_LESSONS,
CASE 
WHEN L.TOTAL_LESSONS > 0 THEN C.course_duration/L.TOTAL_LESSONS
ELSE 0
END AS avg_lesson_duration
FROM LMS.courses C 
LEFT JOIN (SELECT course_id,COUNT(user_id) AS TOTAL_USERS
        FROM LMS.enrollments 
        GROUP BY course_id) E
ON C.courses_id = E.course_id
LEFT JOIN (SELECT course_id,COUNT(lesson_id) AS TOTAL_LESSONS
           FROM LMS.lessons
           GROUP BY course_id) L
ON C.courses_id = L.course_id ;


--12. Identify the top three most active users based on total activity count. 
SELECT TOP 3 user_id ,COUNT(activity_status) AS TOTAL_ACT_COUNT,RANK() OVER ( ORDER BY COUNT(activity_status) DESC ) AS RANKING
FROM LMS.user_activity
GROUP BY user_id;

--13. Calculate course completion percentage per user based on lesson activity. 




