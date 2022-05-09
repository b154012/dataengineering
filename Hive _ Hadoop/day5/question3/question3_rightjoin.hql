--Create a data table and insert the above sample data.
hive> create table if not exists dep_table3 as
    > select * from dep_table;
Query ID = hdoop_20211015115801_60b27857-200d-45ae-8a67-ea01428d3f92
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0039, Tracking URL = http://zul:8088/proxy/application_1634132952931_0039/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0039
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-15 11:58:09,552 Stage-1 map = 0%,  reduce = 0%
2021-10-15 11:58:14,881 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.12 sec
MapReduce Total cumulative CPU time: 1 seconds 120 msec
Ended Job = job_1634132952931_0039
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/.hive-staging_hive_2021-10-15_11-58-01_704_219930686748959216-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/dep_table3
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.12 sec   HDFS Read: 5380 HDFS Write: 206 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 120 msec
OK
Time taken: 15.448 seconds

hive> create table if not exists work_table3 as
    > select * from work_table;
Query ID = hdoop_20211015120046_6f148e15-40dd-4ecc-8e16-b50f2b9ae59a
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0040, Tracking URL = http://zul:8088/proxy/application_1634132952931_0040/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0040
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-15 12:00:54,794 Stage-1 map = 0%,  reduce = 0%
2021-10-15 12:01:01,048 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.18 sec
MapReduce Total cumulative CPU time: 1 seconds 180 msec
Ended Job = job_1634132952931_0040
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/.hive-staging_hive_2021-10-15_12-00-46_726_4160189119627287606-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day_5.db/work_table3
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.18 sec   HDFS Read: 5047 HDFS Write: 131 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 180 msec
OK
Time taken: 15.581 seconds


--Select the appropriate field, use right outer join to query, use work_table as the left table to query the users included in each work_type (work type).
hive> select w.work_id, w.work_name, w.work_type, d.id, d.level, d.deposit
    > from work_table3 w
    > right outer join dep_table3 d on w.work_id = d.work;
Query ID = hdoop_20211015120854_359882fb-8c58-4261-b32d-7c1b6edbb85b
Total jobs = 1
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634132952931_0043, Tracking URL = http://zul:8088/proxy/application_1634132952931_0043/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0043
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 0
2021-10-15 12:09:10,880 Stage-3 map = 0%,  reduce = 0%
2021-10-15 12:09:17,174 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 1.56 sec
MapReduce Total cumulative CPU time: 1 seconds 560 msec
Ended Job = job_1634132952931_0043
MapReduce Jobs Launched: 
Stage-Stage-3: Map: 1   Cumulative CPU: 1.56 sec   HDFS Read: 9947 HDFS Write: 363 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 560 msec
OK
1	doctor	medicine	1	A	235262.323
2	teacher	education	2	A	192285.456
2	teacher	education	3	B	201578.532
1	doctor	medicine	4	B	215577.758
2	teacher	education	5	B	201276.689
1	doctor	medicine	6	A	225782.254
Time taken: 24.049 seconds, Fetched: 6 row(s)
