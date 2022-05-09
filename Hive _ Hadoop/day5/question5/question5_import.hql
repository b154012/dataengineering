-- Create a data table and unzip the data file package, and then import the data file u.data into the data table.

hive> use day_5;
OK
Time taken: 0.579 seconds

hive> create table u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile;
OK
Time taken: 0.117 seconds

hive> load data local inpath '/home/hdoop/ml-100k/u.data' overwrite into table u_data;
Loading data to table day_5.u_data
OK
Time taken: 0.725 seconds

hive> select * from u_data limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 1.976 seconds, Fetched: 5 row(s)


-- Use select to query in reverse order according to the unixtime time column.
hive> select * from u_data order by unixtime desc limit 5;
Query ID = hdoop_20211015222849_6e0e260f-187f-4211-86b6-47c1974df5ba
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634307375605_0001, Tracking URL = http://zul:8088/proxy/application_1634307375605_0001/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634307375605_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-15 22:29:02,731 Stage-1 map = 0%,  reduce = 0%
2021-10-15 22:29:09,086 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.62 sec
2021-10-15 22:29:15,399 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.82 sec
MapReduce Total cumulative CPU time: 2 seconds 820 msec
Ended Job = job_1634307375605_0001
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.82 sec   HDFS Read: 1990098 HDFS Write: 247 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 820 msec
OK
729	689	4	893286638
729	333	4	893286638
729	313	3	893286638
729	272	4	893286638
729	328	3	893286638
Time taken: 26.808 seconds, Fetched: 5 row(s)
