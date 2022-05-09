-- Create a data table, insert the above sample data, and set the deposit field to be stored as a double type.
0: jdbc:hive2://localhost:10000> create table if not exists grouped_data(
. . . . . . . . . . . . . . . .> eid int,
. . . . . . . . . . . . . . . .> name string,
. . . . . . . . . . . . . . . .> work string,
. . . . . . . . . . . . . . . .> level string,
. . . . . . . . . . . . . . . .> deposit double)
. . . . . . . . . . . . . . . .> row format delimited
. . . . . . . . . . . . . . . .> fields terminated by '\t'
. . . . . . . . . . . . . . . .> lines terminated by '\n'
. . . . . . . . . . . . . . . .> stored as textfile;
No rows affected (0.143 seconds)

0: jdbc:hive2://localhost:10000> show tables;
INFO  : Compiling command(queryId=hdoop_20211015002109_26d27bf9-b213-4d68-abfb-590c9c3e602a): show tables
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : Semantic Analysis Completed (retrial = false)
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hdoop_20211015002109_26d27bf9-b213-4d68-abfb-590c9c3e602a); Time taken: 0.057 seconds
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : Executing command(queryId=hdoop_20211015002109_26d27bf9-b213-4d68-abfb-590c9c3e602a): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hdoop_20211015002109_26d27bf9-b213-4d68-abfb-590c9c3e602a); Time taken: 0.013 seconds
INFO  : OK
INFO  : Concurrency mode is disabled, not creating a lock manager
+---------------+
|   tab_name    |
+---------------+
| grouped_data  |
| sample_data   |
+---------------+
2 rows selected (0.121 seconds)
0: jdbc:hive2://localhost:10000> load data local inpath '/home/hdoop/data/day4_hive_group.txt'
. . . . . . . . . . . . . . . .> overwrite into table grouped_data;

No rows affected (0.267 seconds)
0: jdbc:hive2://localhost:10000> select * from grouped_data;
INFO  : Compiling command(queryId=hdoop_20211015002148_73413ecc-1b18-41e3-87de-65818b106565): select * from grouped_data
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : Semantic Analysis Completed (retrial = false)
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:grouped_data.eid, type:int, comment:null), FieldSchema(name:grouped_data.name, type:string, comment:null), FieldSchema(name:grouped_data.work, type:string, comment:null), FieldSchema(name:grouped_data.level, type:string, comment:null), FieldSchema(name:grouped_data.deposit, type:double, comment:null)], properties:null)
INFO  : Completed compiling command(queryId=hdoop_20211015002148_73413ecc-1b18-41e3-87de-65818b106565); Time taken: 0.178 seconds
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : Executing command(queryId=hdoop_20211015002148_73413ecc-1b18-41e3-87de-65818b106565): select * from grouped_data
INFO  : Completed executing command(queryId=hdoop_20211015002148_73413ecc-1b18-41e3-87de-65818b106565); Time taken: 0.0 seconds
INFO  : OK
INFO  : Concurrency mode is disabled, not creating a lock manager
+-------------------+--------------------+--------------------+---------------------+-----------------------+
| grouped_data.eid  | grouped_data.name  | grouped_data.work  | grouped_data.level  | grouped_data.deposit  |
+-------------------+--------------------+--------------------+---------------------+-----------------------+
| 1                 | carry              | doctor             | A                   | 235262.323            |
| 2                 | jams               | teacher            | A                   | 192285.456            |
| 3                 | owen               | teacher            | B                   | 201578.532            |
| 4                 | Bob                | doctor             | B                   | 215577.758            |
| 5                 | mary               | teacher            | B                   | 201276.689            |
| 6                 | kries              | doctor             | A                   | 225782.254            |
+-------------------+--------------------+--------------------+---------------------+-----------------------+
6 rows selected (0.241 seconds)

-- Query the total number of people whose work is teacher in the data table. **Use Java to implement the above query.
hdoop@zul:~/java$ java group_query
Connected to the host
Result:
Work 	 No. Of People
teacher		3
