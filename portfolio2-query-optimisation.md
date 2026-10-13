Portfolio 2: Query Processing and Optimisation

1. Objective
The objective of this exercise was to practise SQL queries and examine how MySQL processes queries using the EXPLAIN command.
 
2. Basic Query
I used the following query to display all students:

```sql
SELECT * FROM Students;
```

This query retrieves all rows and columns from the Students table.

3. Using EXPLAIN
I used EXPLAIN to examine how MySQL processes queries.

Query 1: Retrieve All Students

```sql
EXPLAIN SELECT * FROM Students;
```

Observation: MySQL reported the access type as `ALL`, indicating a full table scan.

### Query 2: Search by Student ID

```sql
EXPLAIN SELECT * FROM Students
WHERE student_id = 1;
```

Observation: MySQL reported the access type as `const`, showing that the primary-key lookup can identify at most one matching row.

### Query 3: Create an Index on Last Name

```sql
CREATE INDEX idx_student_last_name
ON Students (last_name);
```

I used `SHOW INDEX FROM Students;` to check that the index was created.

Query 4: Search by Last Name

```sql
EXPLAIN SELECT * FROM Students
WHERE last_name = 'Okafor';
```

Observation: MySQL reported the access type as `ref`, which is consistent with a lookup using a non-unique index.
 4. Join Query
I joined the Students, Registrations, and Courses tables to retrieve student and course information.

```sql
SELECT
    Students.first_name,
    Students.last_name,
    Courses.course_code,
    Courses.course_name
FROM Students
JOIN Registrations
    ON Students.student_id = Registrations.student_id
JOIN Courses
    ON Registrations.course_id = Courses.course_id;
```

The query executed successfully and returned the students with their registered courses.

5. Conclusion
The EXPLAIN command helped me understand how MySQL accesses data. The experiments demonstrated a full table scan, a primary-key lookup, and an indexed lookup. Indexes can improve searches on suitable columns, although their actual benefit depends on the data and query plan.
