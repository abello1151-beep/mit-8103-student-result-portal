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
```sql
-- Concurrency test results
-- Session 1 connection ID: 9
-- Session 2 connection ID: 17
-- Initial score for registration_id 1: 85
-- Session 2 updated the score to 75 without committing.
-- Session 1 continued to see 85 while the update was uncommitted.
-- Session 2 then committed the update.
-- Session 1 later showed 75, but its transaction was no longer
-- listed in information_schema.innodb_trx.
-- Conclusion: The test demonstrated that Session 1 did not see
-- Session 2's uncommitted update. The full repeatable-read
-- snapshot behaviour was not conclusively verified.
-- Final score restored and verified: 85
```
New successful REPEATABLE READ concurrency experiment
```sql
-- Successful REPEATABLE READ concurrency experiment
-- Session 1 connection ID: 9
-- Session 2 connection ID: 17
-- Initial committed score for registration_id 1: 85
--
-- Session 1:
-- Started a transaction and read score = 85.
--
-- Session 2:
-- Started a transaction and updated score to 75.
-- The update was not committed initially.
--
-- Session 1:
-- Continued to read score = 85 while Session 2's update
-- was uncommitted.
--
-- Session 2:
-- Committed the update to score = 75.
--
-- Session 1:
-- Continued to read score = 85 after Session 2 committed,
-- while Session 1's original transaction remained active.
--
-- Session 1 committed its transaction.
-- Session 2 then observed the committed score of 75.
--
-- Final cleanup:
-- Restored score to 85 and committed the correction.
-- Final score verified as 85.
--
-- Conclusion:
-- The experiment demonstrated REPEATABLE READ snapshot
-- behaviour across two separate MySQL connections.
```
