-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Case Study: University Student Result Portal
-- These commands document practical exercises already performed.

USE university_portal;

-- 1. Check John's original result
SELECT *
FROM Results
WHERE registration_id = 1;

-- 2. Demonstrate ROLLBACK
-- This temporary change was rolled back during the practical.
START TRANSACTION;

UPDATE Results
SET score = 70
WHERE registration_id = 1;

ROLLBACK;

-- Verify that John's score returned to 85
SELECT score
FROM Results
WHERE registration_id = 1;

-- 3. Demonstrate COMMIT
-- Aisha's score was changed from 92 to 93 and committed.
START TRANSACTION;

UPDATE Results
SET score = 93
WHERE registration_id = 2;

COMMIT;

-- Verify Aisha's committed score
SELECT score
FROM Results
WHERE registration_id = 2;

-- 4. Check the transaction isolation level
SELECT @@transaction_isolation;

-- 5. Check the storage engines used by the tables
SELECT TABLE_NAME, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'university_portal';

-- 6. Identify the current database session
SELECT
    CONNECTION_ID() AS session_id,
    @@autocommit AS autocommit_setting,
    @@transaction_isolation AS isolation_level;

-- 7. Final check of John's result
SELECT
    Students.first_name,
    Students.last_name,
    Results.score,
    Results.grade
FROM Students
JOIN Registrations
    ON Students.student_id = Registrations.student_id
JOIN Results
    ON Registrations.registration_id = Results.registration_id
WHERE Students.student_id = 1;

-- Note:
-- A two-session concurrency exercise was attempted.
-- The expected isolation behaviour was not conclusively verified.
