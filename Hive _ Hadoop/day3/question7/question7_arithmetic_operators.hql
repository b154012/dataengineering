--Create a data table and insert the above sample data. The salary field means annual salary and the unit is US Dollars.

hive> create table if not exists hive_arithmetic(
    > eid int,
    > name string,
    > work string,
    > level string,
    > annual_salary int)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.088 seconds
hive> load data local inpath '/home/hdoop/data/day3_arithmetic.txt'
    > overwrite into table hive_arithmetic;
Loading data to table day3.hive_arithmetic
OK
Time taken: 0.187 seconds


--Use select to view the average monthly salary of each user.
hive> select eid, name, work, level, avg(annual_salary/12)
    > from hive_arithmetic
    > group by eid, name, work, level, annual_salary;
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0010, Tracking URL = http://zul:8088/proxy/application_1634132952931_0010/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0010
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-14 14:07:55,515 Stage-1 map = 0%,  reduce = 0%
2021-10-14 14:08:01,759 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.22 sec
2021-10-14 14:08:09,050 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.98 sec
MapReduce Total cumulative CPU time: 2 seconds 980 msec
Ended Job = job_1634132952931_0010
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.98 sec   HDFS Read: 18915 HDFS Write: 310 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 980 msec
OK
1	carry	doctor	A	13333.33
2	jams	teacher	A	12500.0
3	owen	teacher	B	12000.0
4	bob	doctor	B	10833.33
5	mary	teacher	B	11250.0
6	kries	doctor	A	12916.67
Time taken: 23.595 seconds, Fetched: 6 row(s)
