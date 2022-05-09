METHOD 1
--Create a data table and unzip the data file package, then upload the data file u.data to HDFS.

hive> use day5;
OK
Time taken: 0.074 seconds

hdoop@zul:~$ hdfs dfs -mkdir /tmp/day6
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-19 00:27:52,960 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable

hdoop@zul:~$ hdfs dfs -put ml-100k/u.data /tmp/day6
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-19 00:28:04,999 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable

hive> create external table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile
    > location '/tmp/day6';
OK
Time taken: 0.659 seconds

--Establish appearance, read and manage data through Hive.
hive> select * from u_data limit 10;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
298	474	4	884182806
115	265	2	881171488
253	465	5	891628467
305	451	3	886324817
6	86	3	883603013
Time taken: 0.248 seconds, Fetched: 10 row(s)

hive> select rating, count(*)
    > from u_data
    > group by rating;
Query ID = hdoop_20211019004105_95dca26b-a413-4fea-be2c-1ca56bc26aed
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634573357294_0001, Tracking URL = http://zul:8088/proxy/application_1634573357294_0001/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-19 00:41:20,014 Stage-1 map = 0%,  reduce = 0%
2021-10-19 00:41:26,384 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.42 sec
2021-10-19 00:41:33,823 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.85 sec
MapReduce Total cumulative CPU time: 2 seconds 850 msec
Ended Job = job_1634573357294_0001
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.85 sec   HDFS Read: 1992112 HDFS Write: 186 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 850 msec
OK
1	6110
2	11370
3	27145
4	34174
5	21201

hive> select count(distinct userid)
    > from u_data;
Query ID = hdoop_20211019010442_933386ee-b04f-40f0-9112-adc014872285
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634573357294_0011, Tracking URL = http://zul:8088/proxy/application_1634573357294_0011/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0011
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-19 01:04:50,678 Stage-1 map = 0%,  reduce = 0%
2021-10-19 01:04:56,913 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.47 sec
2021-10-19 01:05:03,144 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.78 sec
MapReduce Total cumulative CPU time: 2 seconds 780 msec
Ended Job = job_1634573357294_0011
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.78 sec   HDFS Read: 1987699 HDFS Write: 103 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 780 msec
OK
943
Time taken: 21.579 seconds, Fetched: 1 row(s)

METHOD 2:
hive> create database if not exists day5_;
OK
Time taken: 0.122 seconds
hive> use day5_;
OK
Time taken: 0.074 seconds

--Copy table from u_data in table day_5
hive> create table if not exists u_data as
    > select * from day_5.u_data;
Query ID = hdoop_20211018233256_d360bb61-6208-4ee3-855e-bd2bb2e45c61
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634307375605_0003, Tracking URL = http://zul:8088/proxy/application_1634307375605_0003/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634307375605_0003
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-18 23:33:06,179 Stage-1 map = 0%,  reduce = 0%
2021-10-18 23:33:12,580 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.74 sec
MapReduce Total cumulative CPU time: 1 seconds 740 msec
Ended Job = job_1634307375605_0003
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day5_.db/.hive-staging_hive_2021-10-18_23-32-56_219_1479281553238002796-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/day5_.db/u_data
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.74 sec   HDFS Read: 1984193 HDFS Write: 1979250 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 740 msec
OK
Time taken: 18.808 seconds

--export table to HDFS /tmp
hive> EXPORT TABLE u_data TO '/tmp';
OK
Time taken: 0.646 seconds
hive> dfs -ls /tmp;
Found 5 items
-rw-r--r--   1 hdoop hdoop            1485 2021-10-18 23:51 /tmp/_metadata
drwxr-xr-x   - hdoop hdoop               0 2021-10-18 23:51 /tmp/data
drwxrwxrwx   - hdoop supergroup          0 2021-09-29 13:31 /tmp/hadoop-yarn
drwxrwxrwx   - hdoop supergroup          0 2021-10-03 01:41 /tmp/hive
drwxr-xr-x   - hdoop hdoop               0 2021-10-15 22:27 /tmp/ml-100k

hive> dfs -ls /tmp/data;
Found 1 items
-rw-r--r--   1 hdoop hdoop    1979173 2021-10-18 23:51 /tmp/data/000000_0

--Establish appearance, read and manage data through Hive.
hive> IMPORT TABLE u_table FROM '/tmp';
Copying data from hdfs://localhost:9000/tmp/data
Copying file: hdfs://localhost:9000/tmp/data/000000_0
Loading data to table day5_.u_table
OK
Time taken: 0.805 seconds
hive> select * from u_table limit 10;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
298	474	4	884182806
115	265	2	881171488
253	465	5	891628467
305	451	3	886324817
6	86	3	883603013
Time taken: 0.245 seconds, Fetched: 10 row(s)

hive> select * from u_table limit 10;
hive> select * from day5_.u_data limit 5;
OK
196	242	3	881250949
186	302	3	891717742
22	377	1	878887116
244	51	2	880606923
166	346	1	886397596
Time taken: 0.172 seconds, Fetched: 5 row(s)
