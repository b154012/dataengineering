--Create a data table and insert the above sample data.
hive> create table if not exists dep_table(
    > id int, name string, work string, level string, deposit double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.536 seconds
hive> create table if not exists work_table(
    > work_id int, work_name string, work_type string)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.133 seconds

hive> load data local inpath '/home/hdoop/data/dep_table.txt'
    > overwrite into table dep_table;
Loading data to table day_5.dep_table
OK
Time taken: 0.431 seconds

hive> load data local inpath '/home/hdoop/data/work_table.txt'
    > overwrite into table work_table;
Loading data to table day_5.work_table
OK
Time taken: 0.756 seconds

hive> select * from work_table;
OK
1	doctor	medicine
2	teacher	education
3	engineer	internet
Time taken: 0.222 seconds, Fetched: 3 row(s)

hive> select * from dep_table;
OK
1	carry	1	A	235262.323
2	jams	2	A	192285.456
3	owen	2	B	201578.532
4	bob	1	B	215577.758
5	mary	2	B	201276.689
6	kries	1	A	225782.254
Time taken: 0.209 seconds, Fetched: 6 row(s)


--Select the appropriate associated field to query the number of users of different work_names.
hive> select w.work_name, count(d.work)
    > from dep_table d
    > join work_table w on (d.work = w.work_id)
    > group by work_name, work;
Query ID = hdoop_20211015114419_bd6994c7-7af5-4ef3-acbf-03fe4231b387
Total jobs = 1
2021-10-15 11:44:28	End of local task; Time Taken: 1.751 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0032, Tracking URL = http://zul:8088/proxy/application_1634132952931_0032/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0032
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2021-10-15 11:44:38,476 Stage-2 map = 0%,  reduce = 0%
2021-10-15 11:44:44,854 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 1.76 sec
2021-10-15 11:44:52,263 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 3.28 sec
MapReduce Total cumulative CPU time: 3 seconds 280 msec
Ended Job = job_1634132952931_0032
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 3.28 sec   HDFS Read: 20406 HDFS Write: 130 SUCCESS
Total MapReduce CPU Time Spent: 3 seconds 280 msec
OK
doctor	3
teacher	3
Time taken: 33.916 seconds, Fetched: 2 row(s)

