--Create a data table and unzip the data file package, then upload the data file u.data to HDFS.
hdoop@zul:~$ hdfs dfs -put ml-100k/u.data /tmp/day7
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-20 00:17:44,000 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
hdoop@zul:~$ hdfs dfs -ls /tmp/day7
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-20 00:17:53,924 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 1 items
-rw-r--r--   1 hdoop supergroup    1979173 2021-10-20 00:17 /tmp/day7/u.data


--Create the appearance, read the data data, then create the orc table, and import the data into the orc table.
hive> create external table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile
    > location '/tmp/day7';
OK
Time taken: 0.157 seconds
hive> select * from u_data limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 0.175 seconds, Fetched: 5 row(s)


hive> create external table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile
    > location '/tmp/day7';
OK
Time taken: 0.157 seconds
hive> select * from u_data limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 0.175 seconds, Fetched: 5 row(s)

hive> create table if not exists udata(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > comment 'orc'
    > stored as orc;
OK
Time taken: 0.117 seconds
hive> insert overwrite table udata select * from u_data;
Query ID = hdoop_20211020012903_c1cf656a-5701-41d6-9402-7d45da6bcd9d
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634573357294_0019, Tracking URL = http://zul:8088/proxy/application_1634573357294_0019/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0019
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-20 01:29:14,433 Stage-1 map = 0%,  reduce = 0%
2021-10-20 01:29:25,205 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 3.92 sec
2021-10-20 01:29:33,771 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 5.88 sec
MapReduce Total cumulative CPU time: 5 seconds 880 msec
Ended Job = job_1634573357294_0019
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/udata/.hive-staging_hive_2021-10-20_01-29-03_755_6292785730722114917-1/-ext-10000
Loading data to table days_5.udata
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 5.88 sec   HDFS Read: 1995785 HDFS Write: 693975 SUCCESS
Total MapReduce CPU Time Spent: 5 seconds 880 msec
OK
Time taken: 31.547 seconds
hive> select * from udata limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 0.196 seconds, Fetched: 5 row(s)


--Perform aggregate statistics on the rating field in the external table and the orc table to compare the query efficiency of different types of data storage.
hive> select distinct rating, count(rating)
    > from u_data
    > group by rating;
FAILED: SemanticException 3:9 SELECT DISTINCT and GROUP BY can not be in the same query. Error encountered near token 'rating'
hive> select rating, count(distinct userid)
    > from u_data
    > group by rating;
Query ID = hdoop_20211020005930_c96abd91-cb10-4b49-a0de-ad41c9d60a23
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634573357294_0016, Tracking URL = http://zul:8088/proxy/application_1634573357294_0016/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0016
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-20 00:59:40,745 Stage-1 map = 0%,  reduce = 0%
2021-10-20 00:59:48,146 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.24 sec
2021-10-20 00:59:57,711 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 4.02 sec
MapReduce Total cumulative CPU time: 4 seconds 20 msec
Ended Job = job_1634573357294_0016
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 4.02 sec   HDFS Read: 1988065 HDFS Write: 177 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 20 msec
OK
1	723
2	894
3	936
4	942
5	928
Time taken: 28.441 seconds, Fetched: 5 row(s)


hive> select rating, count(distinct userid)
    > from u_data
    > sfdfd;
FAILED: SemanticException [Error 10025]: Line 1:7 Expression not in GROUP BY key 'rating'
hive> select rating, count(distinct userid)
    > from udata
    > group by rating;
Query ID = hdoop_20211020010036_6dff53d1-d9e1-4b45-a96d-5f1e1fd37266
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634573357294_0017, Tracking URL = http://zul:8088/proxy/application_1634573357294_0017/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0017
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-20 01:00:49,834 Stage-1 map = 0%,  reduce = 0%
2021-10-20 01:00:58,684 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.46 sec
2021-10-20 01:01:08,434 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 4.61 sec
MapReduce Total cumulative CPU time: 4 seconds 610 msec
Ended Job = job_1634573357294_0017
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 4.61 sec   HDFS Read: 206171 HDFS Write: 177 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 610 msec
OK
1	723
2	894
3	936
4	942
5	928
Time taken: 33.521 seconds, Fetched: 5 row(s)

