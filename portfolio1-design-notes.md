Portfolio 1: Database Design and Modelling

1. Case Study
The University Student Result Portal is a database system designed to manage student information, course details, course registrations, and examination results.

2. Database Tables
The database contains four tables:

- Students: Stores student IDs, first names, last names, and email addresses.
- Courses: Stores course IDs, course codes, course names, and credit units.
- Registrations: Connects students to the courses they register for and stores registration dates.
- Results: Stores scores and grades for course registrations.

3. Relationships
- One student can have multiple registrations.
- One course can have multiple registrations.
- Each registration can have one result record.

4. Primary and Foreign Keys
- `Students.student_id` is the primary key of the Students table.
- `Courses.course_id` is the primary key of the Courses table.
- `Registrations.registration_id` is the primary key of the Registrations table.
- `Results.result_id` is the primary key of the Results table.
- `Registrations.student_id` references `Students.student_id`.
- `Registrations.course_id` references `Courses.course_id`.
- `Results.registration_id` references `Registrations.registration_id`.

5. Constraints
The database uses primary keys, foreign keys, NOT NULL constraints, unique constraints, and a score check constraint to help maintain data accuracy and consistency.

6. Normalisation

The database was organised to follow First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF). Each table stores information about a specific subject: students, courses, registrations, or results. Primary and foreign keys link the tables, while unique constraints prevent duplicate student-course registrations and duplicate results for a registration. This structure reduces unnecessary data duplication and helps maintain data consistency.

7. Evidence
The Entity-Relationship Diagram is available in `university_portal_erd.png`. The SQL table definitions are available in `university_portal.sql`.
