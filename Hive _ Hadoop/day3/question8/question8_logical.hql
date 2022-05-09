--Create a data table and insert the above sample data. The salary field means annual salary and the unit is US Dollars.
hive> create table if not exists hive_logical(
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
Time taken: 0.125 seconds
hive> load data local inpath '/home/hdoop/data/day3_logical.txt'
    > overwrite into table hive_logical;
Loading data to table day3.hive_logical
OK
Time taken: 0.185 seconds
hive> select * from hive_logical;
OK
1	carry	doctor	A	160000
2	jams	teacher	A	150000
3	owen	teacher	B	144000
4	Bob	doctor	B	130000
5	mary	teacher	B	135000
6	kries	doctor	A	155000
Time taken: 0.148 seconds, Fetched: 6 row(s)


--Use select to query data where work is a teacher and the average monthly salary is greater than 12,200
--METHOD 1
hive> select eid, name, work, level, annual_salary, round(annual_salary/12) from hive_logical
    > where work = 'teacher' and round(annual_salary/12) > 12200;
OK
2	jams	teacher	A	150000	12500.0
Time taken: 0.153 seconds, Fetched: 1 row(s)

--METHOD 2
hive> select eid, name, work, level, annual_salary, round(avg(annual_salary/12)) salary from hive_logical
    > where work = 'teacher'
    > group by eid, name, work, level, annual_salary
    > having round(avg(annual_salary/12)) > 12200;
Query ID = hdoop_20211014200718_e3d99ac2-2c0a-414b-9aa0-f7069c7d44a7
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1634132952931_0014, Tracking URL = http://zul:8088/proxy/application_1634132952931_0014/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634132952931_0014
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2021-10-14 20:07:27,065 Stage-1 map = 0%,  reduce = 0%
2021-10-14 20:07:33,308 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.58 sec
2021-10-14 20:07:40,567 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 3.3 sec
MapReduce Total cumulative CPU time: 3 seconds 300 msec
Ended Job = job_1634132952931_0014
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 3.3 sec   HDFS Read: 20080 HDFS Write: 131 SUCCESS
Total MapReduce CPU Time Spent: 3 seconds 300 msec
OK
2	jams	teacher	A	150000	12500.0
Time taken: 22.698 seconds, Fetched: 1 row(s)
