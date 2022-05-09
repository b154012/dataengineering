--Create a data table and insert the above sample data.
hive> create table if not exists dep_table4(
    > user_id int,
    > name string,
    > age int,
    > level string,
    > deposit double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.092 seconds
hive> create table if not exists work_table4(
    > user_id int,
    > work_name string,
    > work_type string)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.117 seconds

hive> load data local inpath '/home/hdoop/data/dep_table_full.txt'
    > overwrite into table dep_table4;
Loading data to table day_5.dep_table4
OK
Time taken: 0.189 seconds
hive> select * from dep_table4;
OK
1	carry	25	A	235262.323
2	jams	27	A	192285.456
3	owen	24	B	201578.532
Time taken: 0.142 seconds, Fetched: 3 row(s)

hive> load data local inpath '/home/hdoop/data/work_table_full.txt'
    > overwrite into table work_table4;
Loading data to table day_5.work_table4
OK
Time taken: 0.186 seconds
hive> select * from work_table4;
OK
4	doctor	medicine
5	teacher	education
6	engineer	internet
Time taken: 0.159 seconds, Fetched: 3 row(s)


--Select the appropriate field and use the full outer join query to merge the information of the two tables into one data table.
hive> select *
    > from dep_table4 d
    > full outer join work_table4 w on d.user_id = w.user_id;
Query ID = hdoop_20211015122824_6cec3657-11df-4ed0-8f99-e84f3615b80f
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0045, Tracking URL = http://zul:8088/proxy/application_1634132952931_0045/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0045
Hadoop job information for Stage-1: number of mappers: 2; number of reducers: 1
2021-10-15 12:28:34,232 Stage-1 map = 0%,  reduce = 0%
2021-10-15 12:28:46,414 Stage-1 map = 50%,  reduce = 0%, Cumulative CPU 1.4 sec
2021-10-15 12:28:47,442 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.82 sec
2021-10-15 12:28:52,724 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 4.1 sec
MapReduce Total cumulative CPU time: 4 seconds 100 msec
Ended Job = job_1634132952931_0045
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 2  Reduce: 1   Cumulative CPU: 4.1 sec   HDFS Read: 17975 HDFS Write: 359 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 100 msec
OK
1	carry	25	A	235262.323	NULL	NULL	NULL
2	jams	27	A	192285.456	NULL	NULL	NULL
3	owen	24	B	201578.532	NULL	NULL	NULL
NULL	NULL	NULL	NULL	NULL	4	doctor	medicine
NULL	NULL	NULL	NULL	NULL	5	teacher	education
NULL	NULL	NULL	NULL	NULL	6	engineer	internet
Time taken: 30.44 seconds, Fetched: 6 row(s)
