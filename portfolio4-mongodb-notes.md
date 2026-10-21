Portfolio 4: NoSQL and Advanced Data Models

Project: University Student Result Portal

1. Introduction
This exercise demonstrates how student result records can be represented and queried using a document-based NoSQL data model. MongoDB-style documents were used to represent students, their course codes, scores, and grades.

2. Sample Data
Two student records were used:

- John Okafor — CSC101 — Score: 85 — Grade: A
- Aisha Bello — CSC102 — Score: 93 — Grade: A

Each record contains a student ID, student name, course code, score, and grade.

3. Queries Performed
The following exercises were completed using Mongo Playground:

1. Retrieve all records:** `db.collection.find({})`
2. Find one student's record:** `db.collection.find({ "student_name": "John Okafor" })`
3. Filter by score:** `db.collection.find({ "score": { "$gt": 90 } })`
4. Sort by score:** `db.collection.aggregate([{ "$sort": { "score": -1 } }])`

4. Results and Observations
The first query displayed both student records. The second returned John Okafor's record. The score-filtering query returned students with scores above 90, while the aggregation query sorted the records from highest to lowest score.

5. Conclusion
This exercise provided practical experience with document-based data, filtering, retrieving, and sorting student results using MongoDB-style queries. The browser-based playground was used without installing database software.

6. Evidence
Screenshots of the student records and query results have been uploaded to the project GitHub repository.

**Note:** Mongo Playground was used as a browser-based practice environment. This exercise demonstrates query syntax and behaviour; it does not by itself demonstrate deployment of a persistent MongoDB database.
