--Create a data table, insert the above sample data, and set the deposit field to be stored as a double type.

0: jdbc:hive2://localhost:10000> create table if not exists sample_data(
. . . . . . . . . . . . . . . .> eid int,
. . . . . . . . . . . . . . . .> name string,
. . . . . . . . . . . . . . . .> work string,
. . . . . . . . . . . . . . . .> level string,
. . . . . . . . . . . . . . . .> deposit double)
. . . . . . . . . . . . . . . .> row format delimited
. . . . . . . . . . . . . . . .> fields terminated by '\t'
. . . . . . . . . . . . . . . .> lines terminated by '\n'
. . . . . . . . . . . . . . . .> stored as textfile;
No rows affected (0.234 seconds)

0: jdbc:hive2://localhost:10000> show tables;
+--------------+
|   tab_name   |
+--------------+
| sample_data  |
+--------------+
1 row selected (0.255 seconds)

0: jdbc:hive2://localhost:10000> load data local inpath '/home/hdoop/data/day4_hive_query.txt'
. . . . . . . . . . . . . . . .> overwrite into table sample_data;
No rows affected (0.371 seconds)

0: jdbc:hive2://localhost:10000> select * from sample_data;
+------------------+-------------------+-------------------+--------------------+----------------------+
| sample_data.eid  | sample_data.name  | sample_data.work  | sample_data.level  | sample_data.deposit  |
+------------------+-------------------+-------------------+--------------------+----------------------+
| 1                | carry             | doctor            | A                  | 235262.323           |
| 2                | jams              | teacher           | A                  | 192285.456           |
| 3                | owen              | teacher           | B                  | 201578.532           |
| 4                | Bob               | doctor            | B                  | 215577.758           |
| 5                | mary              | teacher           | B                  | 201276.689           |
| 6                | kries             | doctor            | A                  | 225782.254           |
+------------------+-------------------+-------------------+--------------------+----------------------+
6 rows selected (0.412 seconds)

--Use select to query data whose work is a doctor and the deposit field is greater than 200,000. **Use Java to implement the above query.

hdoop@zul:~/java$ javac select_where.java
hdoop@zul:~/java$ java select_where
Connected to the host
Result:
ID 	 Name 	 Work 	 Level 	 Deposit 
1	carry	doctor	A	235262.323
4	Bob	doctor	B	215577.758
6	kries	doctor	A	225782.254

