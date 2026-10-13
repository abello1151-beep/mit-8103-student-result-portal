create database university_portal;
use university_portal;
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);
INSERT INTO Students (first_name, last_name, email)
VALUES
('John', 'Okafor', 'john@example.com'),
('Aisha', 'Bello', 'aisha@example.com');
SELECT * FROM Students;
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_units INT NOT NULL
);
INSERT INTO Courses (course_code, course_name, credit_units)
VALUES
('CSC101', 'Advanced Database Systems', 3),
('CSC102', 'Computer Networks', 2);
SELECT * FROM Courses;
CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    registration_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    UNIQUE (student_id, course_id)
);
SELECT * FROM Students;
SELECT * FROM Courses;
INSERT INTO Registrations
    (student_id, course_id, registration_date)
VALUES
    (1, 1, CURDATE()),
    (2, 2, CURDATE());
SELECT * FROM Registrations;
CREATE TABLE Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_id INT NOT NULL UNIQUE,
    score DECIMAL(5,2) NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (registration_id)
        REFERENCES Registrations(registration_id),
    CHECK (score >= 0 AND score <= 100)
);
SELECT * FROM Registrations;
INSERT INTO Results (registration_id, score, grade)
VALUES
(1, 85, 'A'),
(2, 92, 'A');
SELECT * FROM Results;
SELECT
    Students.first_name,
    Students.last_name,
    Courses.course_code,
    Courses.course_name,
    Results.score,
    Results.grade
FROM Students
JOIN Registrations
    ON Students.student_id = Registrations.student_id
JOIN Courses
    ON Registrations.course_id = Courses.course_id
JOIN Results
    ON Registrations.registration_id = Results.registration_id;
SHOW TABLES;
SELECT * FROM Students;
EXPLAIN SELECT * FROM Students;
EXPLAIN
SELECT *
FROM Students
WHERE student_id = 1;
CREATE INDEX idx_student_last_name
ON Students (last_name);
SHOW INDEX FROM Students;
EXPLAIN
SELECT *
FROM Students
WHERE last_name = 'Okafor';
