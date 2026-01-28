CREATE DATABASE LMS_DB

CREATE SCHEMA LMS;
--users Table
CREATE TABLE LMS.users (
user_id INT IDENTITY(1,1) PRIMARY KEY,
user_name VARCHAR(100) NOT NULL,
user_email VARCHAR(150) NOT NULL UNIQUE,
user_password VARCHAR(255) NOT NULL);

INSERT INTO lms.users (user_name, user_email, user_password) VALUES
('Aarav Sharma','aarav.sharma@example.com','hash_aarav_123'),
('Priya Verma', 'priya.verma@example.com','hash_priya_123'),
('Rohit Kumar', 'rohit.kumar@example.com','hash_rohit_123'),
('Ananya Singh','ananya.singh@example.com','hash_ananya_123'),
('Vikram Patel','vikram.patel@example.com','hash_vikram_123'),
('Sneha Reddy','sneha.reddy@example.com','hash_sneha_123'),
('Karan Mehta','karan.mehta@example.com','hash_karan_123'),
('Neha Gupta','neha.gupta@example.com','hash_neha_123'),
('Arjun Nair','arjun.nair@example.com','hash_arjun_123'),
('Pooja Iyer','pooja.iyer@example.com','hash_pooja_123');

INSERT INTO LMS.users (user_name, user_email, user_password) VALUES
('Ramesh Rao', 'ramesh.rao@example.com', 'hash_ramesh_123'),
('Kavya N', 'kavya.n@example.com', 'hash_kavya_123'),
('Suresh Iyer', 'suresh.iyer@example.com', 'hash_suresh_123'),
('Meena Das', 'meena.das@example.com', 'hash_meena_123'),
('Ajay Malhotra', 'ajay.malhotra@example.com', 'hash_ajay_123'),
('Divya Kapoor', 'divya.kapoor@example.com', 'hash_divya_123'),
('Nitin Joshi', 'nitin.joshi@example.com', 'hash_nitin_123'),
('Pallavi Kulkarni', 'pallavi.k@example.com', 'hash_pallavi_123'),
('Amit Chatterjee', 'amit.c@example.com', 'hash_amit_123'),
('Shalini Mishra', 'shalini.m@example.com', 'hash_shalini_123');

SELECT * FROM LMS.users
-----------------------------------------------------------------------------
--Curses table
CREATE TABLE LMS.courses (
    courses_id INT IDENTITY(101,1) PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    course_duration INT NOT NULL);

INSERT INTO LMS.courses (course_name, course_duration) VALUES
('SQL',40),
('Java',60),
('Python',50),
('C',45),
('C++',55),
('.NET',65);
INSERT INTO LMS.courses (course_name, course_duration) VALUES
('Data Structures', 70),
('Web Development', 80),
('DevOps Basics', 50),
('Machine Learning', 90);

SELECT * FROM LMS.courses;
-------------------------------------------------------------------
--Lessons Table
CREATE TABLE LMS.lessons (
lesson_id INT IDENTITY(201,1)PRIMARY KEY,
lesson_name VARCHAR(150) NOT NULL,
course_id INT NOT NULL,
CONSTRAINT fk_lessons_course FOREIGN KEY (course_id) REFERENCES lms.courses(courses_id));

INSERT INTO LMS.lessons (lesson_name, course_id) VALUES
('SQL Introduction',101),
('SQL Joins',101),
('SQL Aggregation',101),
('Java Basics',102),
('OOP Concepts in Java',102),
('Exception Handling',102),
('Python Basics',103),
('Python Data Types',103),
('Python Functions',103),
('C Introduction',104),
('Pointers in C',104),
('Memory Management',104),
('C++ Basics',105),
('OOP in C++',105),
('STL Overview',105),
('.NET Introduction',106),
('ASP.NET Basics',106),
('Entity Framework',106);
INSERT INTO LMS.lessons (lesson_name, course_id) VALUES
('Arrays and Linked Lists', 107),
('Stacks and Queues', 107),
('Trees and Graphs', 107),
('HTML Basics', 108),
('CSS Fundamentals', 108),
('JavaScript Intro', 108),
('Linux Basics', 109),
('CI/CD Pipelines', 109),
('Docker Fundamentals', 109),
('ML Introduction', 110),
('Supervised Learning', 110),
('Model Evaluation', 110);

SELECT * FROM LMS.lessons;
--------------------------------------------------
--ENROLLMENTS TABLE
CREATE TABLE LMS.enrollments (
enroll_id INT IDENTITY(301,1) PRIMARY KEY,
user_id INT NOT NULL,
course_id INT NOT NULL,
enrolled_date DATE NOT NULL,
CONSTRAINT fk_enrollments_user FOREIGN KEY (user_id) REFERENCES lms.users(user_id),
CONSTRAINT fk_enrollments_course FOREIGN KEY (course_id) REFERENCES lms.courses(courses_id));

INSERT INTO LMS.enrollments (user_id, course_id, enrolled_date, enrollment_status) VALUES
(11, 101, '2025-02-10', 'active'),
(11, 107, '2025-02-11', 'inactive'),
(12, 108, '2025-02-12', 'active'),
(12, 102, '2025-02-13', 'active'),
(13, 103, '2025-02-14', 'inactive'),
(13, 109, '2025-02-15', 'active'),
(14, 110, '2025-02-16', 'active'),
(14, 101, '2025-02-17', 'inactive'),
(15, 107, '2025-02-18', 'active'),
(15, 108, '2025-02-19', 'inactive'),
(16, 109, '2025-02-20', 'active'),
(16, 110, '2025-02-21', 'active'),
(17, 101, '2025-02-22', 'inactive'),
(17, 102, '2025-02-23', 'active'),
(18, 103, '2025-02-24', 'active'),
(18, 104, '2025-02-25', 'inactive'),
(19, 105, '2025-02-26', 'active'),
(19, 106, '2025-02-27', 'inactive'),
(20, 107, '2025-02-28', 'active'),
(20, 110, '2025-03-01', 'inactive');

SELECT * FROM LMS.enrollments;
------------------------------------------------------------
--ASSESSMENTS TABLE
CREATE TABLE LMS.assessments (
ass_id INT IDENTITY(401,1) PRIMARY KEY,
ass_name VARCHAR(150) NOT NULL,
lesson_id INT NOT NULL,
max_score INT NOT NULL DEFAULT 100,
CONSTRAINT fk_assessments_lesson FOREIGN KEY (lesson_id) REFERENCES lms.lessons(lesson_id),
CONSTRAINT chk_assessment_max_score CHECK (max_score = 100));

INSERT INTO lms.assessments (ass_name, lesson_id) VALUES
('SQL Introduction Quiz',201),
('SQL Joins Test',202),
('SQL Aggregation Assignment',203),
('Java Basics Quiz',204),
('OOP Concepts Test',205),
('Exception Handling Quiz',206),
('Python Basics Quiz',207),
('Python Data Types Test',208),
('Python Functions Assignment',209),
('C Introduction Quiz', 210),
('Pointers in C Test',211),
('Memory Management Quiz',212),
('C++ Basics Quiz', 213),
('OOP in C++ Test',214),
('STL Assignment',215),
('.NET Introduction Quiz',216),
('ASP.NET Basics Test',217),
('Entity Framework Assignment',218);

INSERT INTO LMS.assessments (ass_name, lesson_id) VALUES
('Arrays Quiz', 224),
('Stacks Test', 225),
('Graphs Assignment', 226),
('HTML Quiz', 227),
('CSS Test', 228),
('JavaScript Assignment', 229),
('Linux Quiz', 230),
('CI/CD Test', 231),
('Docker Assignment', 232),
('ML Intro Quiz', 233),
('Supervised Learning Test', 234),
('Model Evaluation Assignment', 235);

 SELECT * FROM LMS.assessments;
 -------------------------------------------------------------------------
 --ASSESSMENT SUBMISSION TABLE

CREATE TABLE LMS.assessment_submission (
submission_id INT IDENTITY(501,1) PRIMARY KEY,
ass_id INT NOT NULL,
user_id INT NOT NULL,
score DECIMAL(5,2) NOT NULL,
submitted_date DATE NOT NULL,
ass_status varchar(20) not null default 'not started',
CONSTRAINT fk_submission_assessment FOREIGN KEY (ass_id) REFERENCES lms.assessments(ass_id),
CONSTRAINT fk_submission_user FOREIGN KEY (user_id) REFERENCES lms.users(user_id)
);

INSERT INTO LMS.assessment_submission (ass_id, user_id, score, submitted_date, ass_status)
VALUES
(406, 1, 88.0, '2026-01-20 10:00:00', 'completed'),
(407, 2, 76.5, '2026-01-21 11:15:00', 'completed'),
(408, 3, 92.0, '2026-01-22 09:30:00', 'in progress'),
(409, 4, 85.5, '2026-01-23 14:45:00', 'completed'),
(410, 5, 79.0, '2026-01-24 13:00:00', 'completed'),
(411, 6, 91.5, '2026-01-25 12:30:00', 'in progress'),
(412, 7, 68.0, '2026-01-26 10:45:00', 'not started'),
(413, 8, 83.0, '2026-01-26 15:20:00', 'completed'),
(414, 9, 87.5, '2026-01-27 09:10:00', 'completed'),
(415, 10, 90.0, '2026-01-27 16:00:00', 'in progress');

INSERT INTO LMS.assessment_submission (ass_id, user_id, score, submitted_date, ass_status) VALUES
(421, 13, 88.0, '2026-01-29', 'completed'),
(422, 14, 91.0, '2026-01-29', 'completed'),
(423, 15, 54.0, '2026-01-30', 'completed'),
(424, 16, 77.5, '2026-01-30', 'completed'),
(425, 17, 83.0, '2026-01-31', 'completed'),
(426, 18, 69.0, '2026-01-31', 'completed'),
(427, 19, 95.0, '2026-02-01', 'completed'),
(428, 20, 58.0, '2026-02-01', 'completed'),
(429, 11, 92.0, '2026-02-02', 'completed'),
(430, 12, 86.0, '2026-02-02', 'completed'),
(431, 15, 71.0, '2026-02-04', 'completed'),
(432, 16, 66.0, '2026-02-04', 'completed');

SELECT * FROM LMS.assessment_submission;
-----------------------------------------------------------------
--USER ACTIVITY TABLE
CREATE TABLE LMS.user_activity (
activity_id INT IDENTITY(601,1) PRIMARY KEY,
user_id INT NOT NULL,
activity_status VARCHAR(20) NOT NULL DEFAULT 'notstarted',
lesson_id INT NOT NULL,
activity_datetime DATETIME NOT NULL DEFAULT GETDATE(),
CONSTRAINT FK_UserActivity_User FOREIGN KEY (user_id) REFERENCES lms.users(user_id),
CONSTRAINT FK_UserActivity_Lesson FOREIGN KEY (lesson_id) REFERENCES lms.lessons(lesson_id),
CONSTRAINT CK_ActivityStatus CHECK (activity_status IN ('notstarted','started','completed')));

INSERT INTO LMS.user_activity (user_id, activity_status, lesson_id, activity_datetime)VALUES
(1, 'completed', 201, '2026-01-20 09:30:00'),
(2, 'started', 202, '2026-01-20 10:15:00'),
(3, 'notstarted', 203, '2026-01-21 08:45:00'),
(4, 'completed', 204, '2026-01-21 11:00:00'),
(5, 'started', 205, '2026-01-22 14:30:00'),
(6, 'completed', 206, '2026-01-22 09:50:00'),
(7, 'notstarted', 207, '2026-01-23 10:20:00'),
(8, 'started', 208, '2026-01-23 12:45:00'),
(9, 'completed', 209, '2026-01-24 13:30:00'),
(10, 'notstarted', 210, '2026-01-24 15:10:00');

INSERT INTO LMS.user_activity (user_id, activity_status, lesson_id, activity_datetime) VALUES
(11, 'started',   224, '2026-01-28 08:45'),
(11, 'completed', 225, '2026-01-29 09:30'),
(13, 'completed', 226, '2026-01-29 14:00'),
(14, 'started',   227, '2026-01-29 10:15'),
(15, 'completed', 228, '2026-01-30 11:45'),
(16, 'completed', 229, '2026-01-30 15:30'),
(17, 'started',   230, '2026-01-31 09:00'),
(17, 'completed', 231, '2026-01-31 13:00'),
(19, 'completed', 232, '2026-02-01 10:30'),
(20, 'started',   233, '2026-02-01 11:00'),
(11, 'completed', 234, '2026-02-02 09:15'),
(12, 'completed', 235, '2026-02-02 12:00'),
(11, 'completed', 201, '2026-02-03 10:00'),
(12, 'started',   202, '2026-02-03 11:00'),
(13, 'completed', 203, '2026-02-04 09:30'),
(14, 'started',   204, '2026-02-04 10:45'),
(15, 'completed', 205, '2026-02-05 14:15'),
(16, 'started',   206, '2026-02-05 15:00'),
(17, 'completed', 207, '2026-02-06 10:30'),
(18, 'started',   208, '2026-02-06 11:15'),
(19, 'completed', 209, '2026-02-07 12:00'),
(20, 'started',   210, '2026-02-07 13:30');

SELECT * FROM LMS.user_activity;
