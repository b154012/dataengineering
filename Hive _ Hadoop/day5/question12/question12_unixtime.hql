--Create a data table and decompress the data package, and then import the data file u.data into the data table.
hive> create table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile;
OK
Time taken: 0.126 seconds

hive> dfs -put /home/hdoop/ml-100k/u.data /tmp;

hive> load data inpath '/tmp/u.data' overwrite into table u_data;
Loading data to table day5_q12.u_data
OK
Time taken: 0.248 seconds


--Using UDF function to convert unixtime to weekday, and then aggregate statistics according to weekday.
hive> select from_unixtime(bigint(unixtime), 'EEEE') from u_data limit 5;
OK
Thursday
Saturday
Friday
Thursday
Monday
Time taken: 0.175 seconds, Fetched: 5 row(s)

hive> select from_unixtime(bigint(unixtime), 'EEEE'), count(from_unixtime(bigint(unixtime), 'EEEE'))
    > from u_data
    > group by from_unixtime(bigint(unixtime), 'EEEE')
    > ;
Query ID = hdoop_20211021155632_c231851d-414a-422f-b4c0-36e1bca33592
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634783511494_0018, Tracking URL = http://zul:8088/proxy/application_1634783511494_0018/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634783511494_0018
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-21 15:56:42,110 Stage-1 map = 0%,  reduce = 0%
2021-10-21 15:56:49,466 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.31 sec
2021-10-21 15:56:56,762 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 3.8 sec
MapReduce Total cumulative CPU time: 3 seconds 800 msec
Ended Job = job_1634783511494_0018
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 3.8 sec   HDFS Read: 1993781 HDFS Write: 270 SUCCESS
Total MapReduce CPU Time Spent: 3 seconds 800 msec
OK
Friday	15918
Monday	13174
Saturday	15077
Sunday	11913
Thursday	13364
Tuesday	13933
Wednesday	16621
Time taken: 24.978 seconds, Fetched: 7 row(s)

--slower but sorted according to the no. of weekdays ascendingly.
hive> select from_unixtime(bigint(unixtime), 'EEEE') as weekday, count(from_unixtime(bigint(unixtime), 'EEEE')) as statistics
    > from u_data
    > group by from_unixtime(bigint(unixtime), 'EEEE')
    > order by statistics asc;
Query ID = hdoop_20211021160314_df507ab0-16b4-42d2-b92f-a79df4d2e5ac
Total jobs = 2
Launching Job 1 out of 2
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634783511494_0019, Tracking URL = http://zul:8088/proxy/application_1634783511494_0019/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634783511494_0019
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-21 16:03:22,767 Stage-1 map = 0%,  reduce = 0%
2021-10-21 16:03:30,049 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.14 sec
2021-10-21 16:03:37,381 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 3.48 sec
MapReduce Total cumulative CPU time: 3 seconds 480 msec
Ended Job = job_1634783511494_0019
Launching Job 2 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634783511494_0020, Tracking URL = http://zul:8088/proxy/application_1634783511494_0020/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634783511494_0020
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2021-10-21 16:03:51,010 Stage-2 map = 0%,  reduce = 0%
2021-10-21 16:03:57,390 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 1.43 sec
2021-10-21 16:04:04,676 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 2.79 sec
MapReduce Total cumulative CPU time: 2 seconds 790 msec
Ended Job = job_1634783511494_0020
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 3.48 sec   HDFS Read: 1992933 HDFS Write: 293 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 2.79 sec   HDFS Read: 7789 HDFS Write: 270 SUCCESS
Total MapReduce CPU Time Spent: 6 seconds 270 msec
OK
Sunday	11913
Monday	13174
Thursday	13364
Tuesday	13933
Saturday	15077
Friday	15918
Wednesday	16621
Time taken: 51.284 seconds, Fetched: 7 row(s)
