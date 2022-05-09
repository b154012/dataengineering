--Create a data table, insert the above sample data, and require the deposit field deposit to be stored as a double type.
hive> create table if not exists day4_view as
    > select * from day4_agg;
Query ID = hdoop_20211014214229_67053f6a-560c-4a86-9cc0-0a0469a0051e
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1634132952931_0017, Tracking URL = http://zul:8088/proxy/application_1634132952931_0017/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0017
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-14 21:42:40,410 Stage-1 map = 0%,  reduce = 0%
2021-10-14 21:42:48,887 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.41 sec
MapReduce Total cumulative CPU time: 1 seconds 410 msec
Ended Job = job_1634132952931_0017
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day4.db/.hive-staging_hive_2021-10-14_21-42-29_583_247571671714708731-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day4.db/day4_view
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.41 sec   HDFS Read: 5660 HDFS Write: 239 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 410 msec
OK
Time taken: 20.507 seconds

hive> select * from day4_view;
OK
1	carry	doctor	A	235262.323
2	jams	teacher	A	192285.456
3	owens	teacher	B	201578.532
4	bob	doctor	B	215577.758
5	marry	teacher	B	201276.689
6	kries	doctor	A	225782.254
Time taken: 0.114 seconds, Fetched: 6 row(s)


--Create a view to view user information with deposits greater than 200,000.
hive> create view if not exists view_deposit comment 'View User Info' as
    > select * from day4_view
    > where ceil(deposit) > 200000;
OK
Time taken: 0.145 seconds
hive> select * from view_deposit;
OK
1	carry	doctor	A	235262.323
3	owens	teacher	B	201578.532
4	bob	doctor	B	215577.758
5	marry	teacher	B	201276.689
6	kries	doctor	A	225782.254
Time taken: 0.106 seconds, Fetched: 5 row(s)
