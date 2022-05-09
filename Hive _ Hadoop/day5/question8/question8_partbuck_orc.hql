--Create a data table and unzip the data file package, then upload the data file u.data to HDFS.
hdoop@zul:~$ hdfs dfs -mkdir /tmp/day8
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-20 01:33:12,503 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
hdoop@zul:~$ hdfs dfs -put ml-100k/u.data /tmp/day8
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-20 01:33:19,148 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
hdoop@zul:~$ hdfs dfs -ls /tmp/day8
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-20 01:33:26,127 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 1 items
-rw-r--r--   1 hdoop supergroup    1979173 2021-10-20 01:33 /tmp/day8/u.data

--Create an external table, read the data data, and then select the appropriate partition key and bucket key to create an orc partition and bucket table.
hive> create external table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile
    > location '/tmp/day8';
OK
Time taken: 0.142 seconds
hive> select * from u_data limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 0.178 seconds, Fetched: 5 row(s)

--create an orc partition and bucket table.
-- partition the rating and bucket the userid into 4 buckets.
--locate it into HDFS /tmp
hive> set map.reduce.tasks = 4;
hive> set hive.exec.dynamic.partition.mode=nonstrict;
hive> set hive.enforce.bucketing = true;
hive> create table udata_pb(
    > userid int,
    > movieid int,
    > unixtime string)
    > partitioned by (rating int)
    > clustered by (userid)
    > into 4 buckets
    > stored as orc
    > location '/tmp';
OK
Time taken: 0.367 seconds


--Import the data into the partition and bucket table, and use select to query the data in one of the partitions.

hive> insert into udata_pb partition(rating) select userid, movieid, unixtime, rating from u_data;
Query ID = hdoop_20211021113418_4d26792c-4a5f-4191-a973-ab2088031899
Total jobs = 2
Launching Job 1 out of 2
Number of reduce tasks determined at compile time: 4
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634783511494_0004, Tracking URL = http://zul:8088/proxy/application_1634783511494_0004/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634783511494_0004
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 4
2021-10-21 11:34:27,075 Stage-1 map = 0%,  reduce = 0%
2021-10-21 11:34:33,447 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.88 sec
2021-10-21 11:34:54,920 Stage-1 map = 100%,  reduce = 25%, Cumulative CPU 4.51 sec
2021-10-21 11:34:59,449 Stage-1 map = 100%,  reduce = 50%, Cumulative CPU 7.17 sec
2021-10-21 11:35:01,703 Stage-1 map = 100%,  reduce = 75%, Cumulative CPU 9.79 sec
2021-10-21 11:35:02,738 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 12.38 sec
MapReduce Total cumulative CPU time: 12 seconds 380 msec
Ended Job = job_1634783511494_0004
Loading data to table day5_q8.udata_pb partition (rating=null)


	 Time taken to load dynamic partitions: 1.033 seconds
	 Time taken for adding to write entity : 0.001 seconds
Launching Job 2 out of 2
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634783511494_0005, Tracking URL = http://zul:8088/proxy/application_1634783511494_0005/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634783511494_0005
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2021-10-21 11:35:18,090 Stage-3 map = 0%,  reduce = 0%
2021-10-21 11:35:24,381 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 1.17 sec
2021-10-21 11:35:31,702 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 2.65 sec
MapReduce Total cumulative CPU time: 2 seconds 650 msec
Ended Job = job_1634783511494_0005
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 4   Cumulative CPU: 12.38 sec   HDFS Read: 2015837 HDFS Write: 727115 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 2.65 sec   HDFS Read: 46284 HDFS Write: 11362 SUCCESS
Total MapReduce CPU Time Spent: 15 seconds 30 msec
OK
Time taken: 75.726 seconds
hive> dfs -ls /tmp
    > ;
Found 11 items
drwxr-xr-x   - hdoop supergroup          0 2021-10-19 00:28 /tmp/day6
drwxr-xr-x   - hdoop supergroup          0 2021-10-20 01:20 /tmp/day7
drwxr-xr-x   - hdoop supergroup          0 2021-10-20 01:33 /tmp/day8
drwx------   - hdoop supergroup          0 2021-10-19 00:41 /tmp/hadoop-yarn
drwx-wx-wx   - hdoop supergroup          0 2021-10-19 00:16 /tmp/hive
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 11:35 /tmp/rating=1
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 11:35 /tmp/rating=2
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 11:35 /tmp/rating=3
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 11:35 /tmp/rating=4
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 11:35 /tmp/rating=5
-rw-r--r--   1 hdoop supergroup    1979173 2021-10-21 10:54 /tmp/u.data

hive> dfs -ls /tmp/rating=1
    > ;
Found 4 items
-rw-r--r--   1 hdoop supergroup       7435 2021-10-21 11:34 /tmp/rating=1/000000_0
-rw-r--r--   1 hdoop supergroup      16622 2021-10-21 11:34 /tmp/rating=1/000001_0
-rw-r--r--   1 hdoop supergroup       9689 2021-10-21 11:35 /tmp/rating=1/000002_0
-rw-r--r--   1 hdoop supergroup       8838 2021-10-21 11:35 /tmp/rating=1/000003_0

hive> select * from udata_pb where rating  = 1 limit 5;
OK
276	1090	874795795	1
868	405	877109082	1
204	333	892391748	1
880	3	880175023	1
820	751	887955180	1
Time taken: 0.866 seconds, Fetched: 5 row(s)




