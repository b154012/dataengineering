--Create a data table, insert the above sample data, and set the deposit field deposit to be stored as a double type.
hive> create table if not exists day4_agg(
    > eid int,
    > name string,
    > work string,
    > level string,
    > deposit double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.093 seconds

hive> insert into table day4_agg values
    > (1, 'carry', 'doctor', 'A', 235262.323),
    > (2, 'jams', 'teacher', 'A', 192285.456),
    > (3, 'owens', 'teacher', 'B', 201578.532),
    > (4, 'bob', 'doctor', 'B', 215577.758),
    > (5, 'marry', 'teacher', 'B', 201276.689),
    > (6, 'kries', 'doctor', 'A', 225782.254);
Query ID = hdoop_20211014213416_0d1e2346-8ee7-42eb-a142-25bd03644ea8
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0015, Tracking URL = http://zul:8088/proxy/application_1634132952931_0015/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0015
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-14 21:34:24,924 Stage-1 map = 0%,  reduce = 0%
2021-10-14 21:34:32,255 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.8 sec
2021-10-14 21:34:38,583 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 3.06 sec
MapReduce Total cumulative CPU time: 3 seconds 60 msec
Ended Job = job_1634132952931_0015
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day4.db/day4_agg/.hive-staging_hive_2021-10-14_21-34-16_721_2842882461249102244-1/-ext-10000
Loading data to table day4.day4_agg
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 3.06 sec   HDFS Read: 21645 HDFS Write: 617 SUCCESS
Total MapReduce CPU Time Spent: 3 seconds 60 msec
OK
Time taken: 24.181 seconds

hive> select * from day4_agg;
OK
1	carry	doctor	A	235262.323
2	jams	teacher	A	192285.456
3	owens	teacher	B	201578.532
4	bob	doctor	B	215577.758
5	marry	teacher	B	201276.689
6	kries	doctor	A	225782.254
Time taken: 0.129 seconds, Fetched: 6 row(s)

--Use SQL logic to query the users with the most deposits, the users with the least deposits, and the average deposits of all users in the data table.

Time taken: 0.129 seconds, Fetched: 6 row(s)
hive> select max(deposit) as Most_Deposit, min(deposit) as Least_Deposit, round(avg(deposit),2) as Average_Deposits
    > from day4_agg;
Query ID = hdoop_20211014213751_6ce85cfb-3e76-4dd2-9dbe-d0a59e8f7f3a
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0016, Tracking URL = http://zul:8088/proxy/application_1634132952931_0016/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0016
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-14 21:38:01,649 Stage-1 map = 0%,  reduce = 0%
2021-10-14 21:38:09,064 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.4 sec
2021-10-14 21:38:19,688 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 3.35 sec
MapReduce Total cumulative CPU time: 3 seconds 350 msec
Ended Job = job_1634132952931_0016
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 3.35 sec   HDFS Read: 17406 HDFS Write: 130 SUCCESS
Total MapReduce CPU Time Spent: 3 seconds 350 msec
OK
235262.323	192285.456	211960.5
Time taken: 30.005 seconds, Fetched: 1 row(s)
