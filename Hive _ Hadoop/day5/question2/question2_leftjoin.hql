--Create a data table and insert the above sample data.

hive> create table if not exists dep_table2 as
    > select * from dep_table;
Query ID = hdoop_20211015114643_5438edda-9b70-4375-bedf-b320a8f978f7
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0033, Tracking URL = http://zul:8088/proxy/application_1634132952931_0033/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0033
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-15 11:46:52,074 Stage-1 map = 0%,  reduce = 0%
2021-10-15 11:46:58,335 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.2 sec
MapReduce Total cumulative CPU time: 1 seconds 200 msec
Ended Job = job_1634132952931_0033
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/.hive-staging_hive_2021-10-15_11-46-43_919_7963234641592929919-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/dep_table2
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.2 sec   HDFS Read: 5473 HDFS Write: 206 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 200 msec
OK
Time taken: 15.721 seconds
hive> create table if not exists work_table2 as
    > select * from work_table;
Query ID = hdoop_20211015114709_204eebfb-797e-41a3-9d39-e6097825fa1f
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0034, Tracking URL = http://zul:8088/proxy/application_1634132952931_0034/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0034
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-15 11:47:17,600 Stage-1 map = 0%,  reduce = 0%
2021-10-15 11:47:23,867 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.14 sec
MapReduce Total cumulative CPU time: 1 seconds 140 msec
Ended Job = job_1634132952931_0034
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/.hive-staging_hive_2021-10-15_11-47-09_320_799095585515931501-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/work_table2
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.14 sec   HDFS Read: 5133 HDFS Write: 131 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 140 msec
OK
Time taken: 15.871 seconds


--Select the appropriate field, use left outer join to query, use dep_table as the left table to query the work information of each user.
hive> select d.id, d.name, d.work, d.level, d.deposit, w.work_name, work_type
    > from dep_table2 d
    > left outer join work_table2 w on d.work = w.work_id;
Query ID = hdoop_20211015115553_dd3025c3-31fe-4470-bf17-17fd63b21261
Total jobs = 1
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0038, Tracking URL = http://zul:8088/proxy/application_1634132952931_0038/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0038
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 0
2021-10-15 11:56:09,717 Stage-3 map = 0%,  reduce = 0%
2021-10-15 11:56:15,958 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 1.61 sec
MapReduce Total cumulative CPU time: 1 seconds 610 msec
Ended Job = job_1634132952931_0038
MapReduce Jobs Launched: 
Stage-Stage-3: Map: 1   Cumulative CPU: 1.61 sec   HDFS Read: 10249 HDFS Write: 394 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 610 msec
OK
1	carry	1	A	235262.323	doctor	medicine
2	jams	2	A	192285.456	teacher	education
3	owen	2	B	201578.532	teacher	education
4	bob	1	B	215577.758	doctor	medicine
5	mary	2	B	201276.689	teacher	education
6	kries	1	A	225782.254	doctor	medicine
Time taken: 24.002 seconds, Fetched: 6 row(s)
