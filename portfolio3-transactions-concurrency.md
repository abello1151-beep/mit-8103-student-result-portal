Portfolio 3: Transactions and Concurrency

1. Objective
The objective of this exercise was to understand database transactions, COMMIT, ROLLBACK, transaction isolation, and storage-engine support for transactions.

2. ROLLBACK Experiment
I started a transaction and temporarily changed John Okafor's score from 85 to 70.

```sql
START TRANSACTION;

UPDATE Results
SET score = 70
WHERE registration_id = 1;

ROLLBACK;
```

After executing ROLLBACK, I checked the score and confirmed that it returned to 85. This demonstrated that ROLLBACK cancels an uncommitted change.

3. COMMIT Experiment
I started another transaction and changed Aisha Bello's score from 92 to 93.

```sql
START TRANSACTION;

UPDATE Results
SET score = 93
WHERE registration_id = 2;

COMMIT;
```

I checked the score after committing and confirmed that it was 93. This demonstrated that COMMIT saves a transaction's changes.

4. Transaction Isolation
I used the following command to check the transaction isolation level:

```sql
SELECT @@transaction_isolation;
```

MySQL returned `REPEATABLE-READ`. This isolation level helps provide consistent reads within a transaction.

5. Storage Engine
I checked the storage engines used by the database tables.

```sql
SELECT TABLE_NAME, ENGINE
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'university_portal';
```

The tables used the InnoDB storage engine. InnoDB supports transactions and helps protect data consistency when multiple operations take place.

6. Conclusion
These experiments demonstrated how COMMIT saves changes and ROLLBACK cancels uncommitted changes. I also learned how to check the transaction isolation level and storage engine in MySQL.

Limitation: These exercises demonstrated transaction control, but did not include a separate two-session concurrency or locking experiment.
