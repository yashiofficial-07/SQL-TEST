-- Step 1: Create & connect to database
CREATE DATABASE school_db;
 


-- Step 2: students table
CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
age INT,
gender VARCHAR(10),
city VARCHAR(50),
enrollment_date DATE
);

-- Step 3: subjects table
CREATE TABLE subjects (
subject_id SERIAL PRIMARY KEY,
subject_name VARCHAR(100) NOT NULL,
teacher_name VARCHAR(100),
max_marks INT
);

-- Step 4: grades table (connects students + subjects)
CREATE TABLE grades (
grade_id SERIAL PRIMARY KEY,
student_id INT REFERENCES students(student_id),
subject_id INT REFERENCES subjects(subject_id),
marks_obtained INT,
exam_date DATE
);

-- INSERT INTO students
INSERT INTO students (name, age, gender, city, enrollment_date) VALUES
('Aarav Sharma', 17, 'Male', 'Delhi', '2023-04-01'),
('Priya Gupta', 16, 'Female', 'Mumbai', '2023-04-03'),
('Rahul Verma', 18, 'Male', 'Delhi', '2022-06-15'),
('Sneha Patel', 15, 'Female', 'Lucknow', '2023-07-20'),
('Amit Singh', 17, 'Male', 'Jaipur', '2022-09-10'),
('Divya Nair', 16, 'Female', 'Chennai', '2023-01-05'),
('Karan Mehta', 18, 'Male', 'Delhi', '2021-11-22'),
('Anjali Yadav', 15, 'Female', 'Lucknow', '2023-03-18'),
('Vikram Joshi', 17, 'Male', 'Mumbai', '2022-08-30'),
('Neha Tiwari', 16, 'Female', 'Delhi', '2023-05-14');


-- INSERT INTO subjects
INSERT INTO subjects (subject_name, teacher_name, max_marks) VALUES
('Mathematics', 'Mr. Rajesh Kumar', 100),
('Science', 'Mrs. Sunita Sharma', 100),
('English', 'Mr. Anil Verma', 80),
('History', 'Mrs. Pooja Mishra', 80),
('Computer', 'Mr. Deepak Singh', 100);


-- INSERT INTO grades
INSERT INTO grades (student_id, subject_id, marks_obtained, exam_date) VALUES
(1,1,88,'2024-03-10'), (1,2,76,'2024-03-11'), (1,3,65,'2024-03-12'),
(2,1,92,'2024-03-10'), (2,3,78,'2024-03-12'), (2,5,95,'2024-03-14'),
(3,1,55,'2024-03-11'), (3,2,55,'2024-03-11'), (3,4,60,'2024-03-13'),
(3,5,70,'2024-03-14'),
(4,1,45,'2024-03-10'), (4,2,50,'2024-03-11'), (4,3,38,'2024-03-12'),
(5,1,80,'2024-03-10'), (5,4,74,'2024-03-13'), (5,5,88,'2024-03-14'),
(6,2,91,'2024-03-11'), (6,3,83,'2024-03-12'), (6,5,97,'2024-03-14'),
(7,1,33,'2024-03-10'), (7,2,40,'2024-03-11'), (7,4,28,'2024-03-13'),
(8,1,72,'2024-03-10'), (8,3,68,'2024-03-12'), (8,5,85,'2024-03-14'),
(9,2,60,'2024-03-11'), (9,4,55,'2024-03-13'), (9,5,78,'2024-03-14'),
(10,1,95,'2024-03-10'), (10,2,90,'2024-03-11'), (10,5,99,'2024-03-14');

-- QUESTION::>>1(A)
select name , age ,city
from 
students
where city = 'Delhi' AND age >16 
ORDER BY name ASC;

-- QUESTION::>>(B)
SELECT DISTINCT city 
FROM
students;

-- QUESTION::>>(c)
SELECT *
FROM 
students 
where gender = 'Female';

-- QUESTION::>>(d)
SELECT *
FROM students
WHERE enrollment_date > '2023-01-01'
ORDER BY enrollment_date DESC;

-- QUESTION::>>(e)
SELECT  age
FROM 
students
where age BETWEEN 15 AND 18;


-- QUESTION::>>2(A)
SELECT name ,city
FROM 
students 
WHERE name LIKE 'A%';

-- QUESTION::>>(B)
SELECT city
FROM 
students 
WHERE city LIKE '%i';

-- QUESTION::>>(C)
SELECT DISTINCT gender
FROM students;

-- QUESTION::>>(D)
SELECT *
FROM students
WHERE name LIKE '%Kumar%';

-- QUESTION::>>(E)
SELECT *
FROM students
ORDER BY student_id ASC
LIMIT 5;

-- QUESTION::>>3(A)
SELECT *
FROM subjects
WHERE max_marks = 100;

-- QUESTION::>>(B)

SELECT subject_name, teacher_name
FROM subjects
ORDER BY subject_name ASC;

-- QUESTION::>>(C)
SELECT *
FROM subjects
WHERE teacher_name LIKE 'Mr';

-- QUESTION::>>(D)
SELECT *
FROM subjects
WHERE max_marks < 100;

-- QUESTION::>>(E)
SELECT DISTINCT max_marks
 FROM subjects;
 
 -- QUESTION::>>4(A)
SELECT *
FROM grades
WHERE marks_obtained > 80;

-- QUESTION::>>(B)
SELECT *
FROM grades
WHERE marks_obtained < 50;

-- QUESTION::>>(C)
SELECT *
FROM grades
WHERE exam_date = '2024-03-10';

-- QUESTION::>>(D)
SELECT *
FROM grades
WHERE marks_obtained BETWEEN 60 AND 90;

-- QUESTION::>>(E)
SELECT *
FROM grades
ORDER BY marks_obtained DESC
LIMIT 5;



-- QUESTION::>>5(A)

SELECT name, enrollment_date
FROM students
ORDER BY enrollment_date DESC
LIMIT 3;

-- QUESTION::>>(B)
SELECT *
FROM students
WHERE gender = 'Male' AND city = 'Delhi'
ORDER BY age DESC;

-- QUESTION::>>(C)
SELECT *
FROM students
WHERE age <> 17;

-- QUESTION::>>(D)
SELECT *
FROM students
WHERE city IN ('Mumbai', 'Lucknow');

-- QUESTION::>>(E)
SELECT *
FROM students
WHERE city IS NULL;


-- QUESTION::>>6(A)
SELECT COUNT(*) AS total_grade_records
FROM grades;

-- QUESTION::>>(B)
SELECT AVG(marks_obtained) AS average_marks
FROM grades;

-- QUESTION::>>(C)
SELECT MAX(marks_obtained) AS highest_marks
FROM grades;

-- QUESTION::>>(D)
SELECT MIN(marks_obtained) AS lowest_marks
FROM grades;

-- QUESTION::>>(E)
SELECT SUM(marks_obtained) AS total_marks
FROM grades
WHERE student_id = 2;


-- QUESTION::>>7(A)
SELECT student_id, SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id
ORDER BY student_id;

-- QUESTION::>>(B)
SELECT subject_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id
ORDER BY subject_id;

-- QUESTION::>>(C)
SELECT student_id, COUNT(*) AS total_exams
FROM grades
GROUP BY student_id
ORDER BY student_id;

-- QUESTION::>>(D)
SELECT student_id, MAX(marks_obtained) AS maximum_marks
FROM grades
GROUP BY student_id
ORDER BY student_id;

-- QUESTION::>>(E)
SELECT subject_id, MIN(marks_obtained) AS minimum_marks
FROM grades
GROUP BY subject_id
ORDER BY subject_id;




-- QUESTION::>>8(A)
SELECT student_id, SUM(marks_obtained) AS total_marks
FROM grades
GROUP BY student_id
HAVING SUM(marks_obtained) > 200;

-- QUESTION::>>(B)
SELECT subject_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY subject_id
HAVING AVG(marks_obtained) > 70;

-- QUESTION::>>(C)
SELECT student_id, COUNT(*) AS total_exams
FROM grades
GROUP BY student_id
HAVING COUNT(*) > 2;

-- QUESTION::>>(D)
SELECT subject_id, MAX(marks_obtained) AS maximum_marks
FROM grades
GROUP BY subject_id
HAVING MAX(marks_obtained) > 90;

-- QUESTION::>>(E)
SELECT student_id, AVG(marks_obtained) AS average_marks
FROM grades
GROUP BY student_id
HAVING AVG(marks_obtained) < 60;


-- QUESTION::>>9(A)
SELECT COUNT(*) AS total_subjects
FROM subjects;

-- QUESTION::>>(B)
SELECT AVG(max_marks) AS average_max_marks
FROM subjects;

-- QUESTION::>>(C)
SELECT *
FROM subjects
WHERE max_marks = (
    SELECT MAX(max_marks)
    FROM subjects
);

-- QUESTION::>>(D)
SELECT COUNT(*) AS subjects_with_100_marks
FROM subjects
WHERE max_marks = 100;

-- QUESTION::>>(E)
SELECT teacher_name, COUNT(*) AS total_subjects
FROM subjects
GROUP BY teacher_name
ORDER BY teacher_name;


-- QUESTION::>>10(A)
SELECT COUNT(*) AS total_students
FROM students;

-- QUESTION::>>(B)
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city
ORDER BY city;

-- QUESTION::>>(C)
SELECT gender, COUNT(*) AS total_students
FROM students
GROUP BY gender
ORDER BY gender;

-- QUESTION::>>(D)
SELECT AVG(age) AS average_age
FROM students;

-- QUESTION::>>(E)
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city
HAVING COUNT(*) > 2;


-- QUESTION::>>11(A)
SELECT s.name, g.marks_obtained, g.exam_date
FROM students s
INNER JOIN grades g
ON s.student_id = g.student_id;

-- QUESTION::>>(B)
SELECT s.name, COALESCE(SUM(g.marks_obtained), 0) AS total_marks
FROM students s
LEFT JOIN grades g
ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;

-- QUESTION::>>(C)
SELECT s.name
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.marks_obtained = (
    SELECT MAX(marks_obtained) FROM grades
);

-- QUESTION::>>(D)
SELECT s.name, g.marks_obtained, g.exam_date
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE s.city = 'Delhi';

-- QUESTION::>>(E)
SELECT s.name, COUNT(g.grade_id) AS exam_count
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.name;

-- QUESTION::>>12(A)
SELECT s.name, sub.subject_name, g.marks_obtained
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id;

-- QUESTION::>>(B)
SELECT s.name, g.marks_obtained
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Mathematics'
AND g.marks_obtained > 80;

-- QUESTION::>>(C)
SELECT sub.subject_name, AVG(g.marks_obtained) AS average_marks
FROM subjects sub
LEFT JOIN grades g ON sub.subject_id = g.subject_id
GROUP BY sub.subject_id, sub.subject_name;

-- QUESTION::>>(D)
SELECT s.name, g.marks_obtained
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Computer'
AND g.marks_obtained > (
    SELECT AVG(g2.marks_obtained)
    FROM grades g2
    JOIN subjects sub2 ON g2.subject_id = sub2.subject_id
    WHERE sub2.subject_name = 'Computer'
);

-- QUESTION::>>(E)
SELECT s.name, sub.subject_name, g.marks_obtained, g.exam_date
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
ORDER BY s.name ASC, sub.subject_name ASC;

-- QUESTION::>>13(A)
CREATE TABLE library_records (
    record_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    book_name VARCHAR(100) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE
);

-- QUESTION::>>(B)
INSERT INTO library_records
(student_name, book_name, borrow_date, return_date)
VALUES
('Rahul', 'DBMS', '2026-09-01', '2026-09-10'),
('Amit', 'Java', '2026-09-03', NULL),
('Rahul', 'Python', '2026-09-05', NULL),
('Priya', 'C Programming', '2026-09-06', '2026-09-12'),
('Rahul', 'SQL', '2026-09-08', NULL),
('Neha', 'Data Structures', '2026-09-09', NULL);

-- QUESTION::>>(C)
SELECT *
FROM library_records
WHERE return_date IS NULL;

-- QUESTION::>>(D)
SELECT *
FROM library_records
WHERE student_name = 'Rahul';
-- QUESTION::>>(E)
SELECT student_name, COUNT(*) AS total_books
FROM library_records
GROUP BY student_name
HAVING COUNT(*) > 2;

-- QUESTION::>>14(A)
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    attendance_date DATE NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Present', 'Absent'))
);

-- QUESTION::>>(B)
INSERT INTO attendance
(student_name, subject_name, attendance_date, status)
VALUES
('Rahul', 'DBMS', '2026-10-01', 'Present'),
('Rahul', 'Java', '2026-10-02', 'Absent'),
('Rahul', 'DBMS', '2026-10-03', 'Present'),
('Rahul', 'Java', '2026-10-04', 'Absent'),
('Amit', 'DBMS', '2026-10-01', 'Present'),
('Amit', 'Java', '2026-10-02', 'Present'),
('Priya', 'DBMS', '2026-10-01', 'Absent'),
('Priya', 'Java', '2026-10-02', 'Present');

-- QUESTION::>>(C)
SELECT student_name, COUNT(*) AS present_days
FROM attendance
WHERE status = 'Present'
GROUP BY student_name;

-- QUESTION::>>(D)
SELECT student_name, COUNT(*) AS absent_days
FROM attendance
WHERE status = 'Absent'
GROUP BY student_name
HAVING COUNT(*) > 2;

-- QUESTION::>>(E)
SELECT student_name,
       ROUND(
           100.0 * SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END)
           / COUNT(*), 2
       ) AS attendance_percentage
FROM attendance
GROUP BY student_name;

-- QUESTION::>>15(A)
CREATE TABLE fee_records (
    fee_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount_paid NUMERIC(10,2) NOT NULL,
    payment_date DATE,
    payment_mode VARCHAR(10)
        CHECK (payment_mode IN ('Cash', 'Online', 'Cheque')),
    status VARCHAR(10)
        CHECK (status IN ('Paid', 'Pending'))
);

-- QUESTION::>>(B)
INSERT INTO fee_records
(student_name, amount_paid, payment_date, payment_mode, status)
VALUES
('Rahul', 5000, '2026-09-01', 'Cash', 'Paid'),
('Amit', 4000, '2026-09-02', 'Online', 'Paid'),
('Priya', 3000, NULL, NULL, 'Pending'),
('Rahul', 2000, '2026-09-10', 'Online', 'Paid'),
('Neha', 6000, NULL, NULL, 'Pending'),
('Amit', 2500, '2026-09-15', 'Cheque', 'Paid'),
('Priya', 3500, '2026-09-18', 'Online', 'Paid');

-- QUESTION::>>(C)
SELECT *
FROM fee_records
WHERE status = 'Pending';

-- QUESTION::>>(D)
SELECT SUM(amount_paid) AS total_fee_collected
FROM fee_records
WHERE status = 'Paid';

--QUESTION::>>(E)
SELECT student_name, SUM(amount_paid) AS total_amount_paid
FROM fee_records
WHERE status = 'Paid'
GROUP BY student_name
ORDER BY total_amount_paid DESC;