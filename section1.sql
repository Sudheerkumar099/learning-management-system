--1.List all users who are enrolled in more than three courses.
SELECT user_name,u.user_id, count(course_id) as total_course_count 
FROM lms.users u LEFT JOIN lms.enrollments ue 
ON u.user_id = ue.user_id 
GROUP BY u.user_id,user_name
HAVING count(course_id)>3;
/*WHY LEFT JOIN : USED A LEFT JOIN AS WE WANT TO COUNT THE COURSES FOR EVERY USER  AND THEN FILTER THE USERS
ASSUNMPTIONS : DECIDED TO COUNT course_id SO THAT IT  GIVES THE  TOTAL COURSES PER USER.*/

--2.Find courses that currently have no enrollments. 
SELECT C.courses_id ,C.course_name
FROM LMS.courses C LEFT JOIN LMS.enrollments E
ON C.courses_id = E.course_id
WHERE e.user_id IS NULL;
/*WHY LEFT JOIN : USED A LEFT JOIN AS WE WANT TO CHECK FOR EVERY COURSE
ASSUNMPTIONS : DECIDED TO FILTER THE NULL USER_ID FOR THE COURSES AFTER JOINING */


--3.Display each course along with the total number of enrolled users.
SELECT C.courses_id,COUNT(E.user_id)
FROM LMS.courses C LEFT JOIN LMS.enrollments E
ON C.courses_id = E.course_id
GROUP BY C.courses_id;
/*WHY LEFT JOIN : USED A LEFT JOIN AS WE WANT TO CHECK FOR EVERY COURSE AND COUNT THE USERS
ASSUNMPTIONS : DECIDED TO GROUP COURSES BY THEIR ID THEN THOUGHT TO COUNT THE USER IDS PER COURSE */

--4.Identify users who enrolled in a course but never accessed any lesson. 
SELECT U.user_id,U.user_name
FROM LMS.users U LEFT JOIN LMS.user_activity UA
ON U.user_id = UA.user_id
WHERE UA.activity_status IS NULL;
/*WHY LEFT JOIN : USED A LEFT JOIN AS WE WANT TO CHECK FOR EVERY USER AND HAVE TO SEE WHEATHER THERE IS ANY ACTIVITY OR NOT ON ANY LESSON
ASSUNMPTIONS : THOUGHT LIKE IF THE USER DOESNT STARTED ANY ACTIVITY THEN THE ACTIVITY FOR THAT USER WILL BE NULL */

--5.Fetch lessons that have never been accessed by any user.
SELECT L.lesson_id,L.lesson_name
FROM LMS.lessons L LEFT JOIN LMS.user_activity UA
ON L.lesson_id = UA.lesson_id
WHERE UA.user_id IS NULL;
--WHY LEFT JOIN : USED A LEFT JOIN AS WE WANT TO CHECK FOR EVERY LESSON AND HAVE TO SEE WHEATHER THERE IS ANY USER STARTED IT OR NOT
--ASSUNMPTIONS : THOUGHT LIKE IF THE LESSON DOESNT STARTED BY ANY USER THEN FOR THAT LESSON USER ID WILL BE NULL 


--6.Show the last activity timestamp for each user.
SELECT U.user_id, MAX(U.activity_datetime)
FROM LMS.user_activity U
GROUP BY U.user_id;
/*NO JOIN USED PERFORMED ON SINGLE TABLE
ASSUNMPTIONS : THOUGHT LIKE THE MAX(DATE) WILL BE THE HIGHEST DATE*/



--7.List users who submitted an assessment but scored less than 50 percent of the maximum score. 
SELECT AA.user_id ,U.user_name
FROM LMS.assessment_submission AA LEFT JOIN LMS.assessments A
ON A.ass_id = AA.ass_id LEFT JOIN LMS.users U
ON U.user_id = AA.user_id
WHERE AA.score < A.max_score/2;
/*WHY LEFT JOIN : USED A  LEFT JOIN AS WE WANT TO CHECK FOR EVERY ASSESSMENT SUBMISSION BY USER WHO SUBMITTED A ASSESSMENT 
                  AND HAVE TO SEE WHEATHER THERE IS THE SCORE IS LESS THAN THE 50% OF THE MAX SCORE
ASSUNMPTIONS : THOUGHT SHOULD CHECK WITH THE USERS PRESENT IN THE ASSESSMENT SUBMISSION TABLE  AND THEN SHOULD FILTER THE SCORE*/


--8.Find assessments that have not received any submissions. 
SELECT A.ass_id,A.ass_name
FROM LMS.assessments A LEFT JOIN LMS.assessment_submission AA
ON A.ass_id = AA.ass_id
WHERE AA.ass_status IS NULL;
/*WHY LEFT JOIN :PERFORMED A LEFT JOIN AS WE WANT TO CHECK FOR EVERY ASSESSMENT AND HAVE TO SEE WHEATHER THERE IS ANY SUBMISSION  OR NOT FOR THAT ASSESMENT
ASSUNMPTIONS : THOUGHT LIKE IF THE ASSESSMENT STATUS IS NULL AFTER JOINNG  THEN IT IS CONSIDERED AS ASSESSMENT IS HAVING NO SUBMISSION*/

--9.Display the highest score achieved for each assessment. 
SELECT AA.ass_id,A.ass_name,MAX(AA.score)
FROM LMS.assessment_submission AA LEFT JOIN LMS.assessments A
ON A.ass_id = AA.ass_id
GROUP BY AA.ass_id,A.ass_name;
/*WHY LEFT JOIN :PERFOEMED  A LEFT JOIN AS WE WANT TO CHECK MAX SCORE FOR EVERY ASSESSMENT SUBMISSION FOR EVERY ASSESMENT SUBMITTED AND ALSO GROUPED THE ASS NAME TO DISPLAY THE NAMES OF THE ASSESMENT
ASSUNMPTIONS : THOUGHT LIKE BY GROUPING A SUBMITTED ASSESSMENTS WE CAN FIND THE MAX SCORE BY GROUPING ASSESSMENT IDS*/

--10. Identify users who are enrolled in a course but have an inactive enrollment status.
SELECT DISTINCT(U.user_id) ,U.user_name
FROM LMS.users U LEFT JOIN LMS.enrollments E
ON U.user_id = E.user_id
WHERE E.enrollment_status = 'inactive';
/*WHY LEFT JOIN :PERFORMED A LEFT JOIN TO GET THE NAME OF THE USER 
ASSUNMPTIONS : USED DISTINCT AS THE USER MAY BE ENROLLED FOR MANY COURSES AND INACTIVE IN THAT COURSES*/

