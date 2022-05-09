--Create a data table and insert the above sample data.
hive> create table if not exists dep_table(
    > id int,
    > name string,
    > work int,
    > level string,
    > deposit double)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile;
OK
Time taken: 1.095 seconds
hive> load data local inpath '/home/hdoop/data/dep_table_ex.txt'
    > overwrite into table dep_table;
Loading data to table days_5.dep_table
OK
Time taken: 1.306 seconds
hive> select * from dep_table;
OK
1	carry	1	A	235262.323
2	jams	2	A	192285.456
3	owen	2	B	201578.532
4	bob	1	B	215577.758
5	mary	2	B	201276.689
6	kries	1	A	225782.254
Time taken: 2.938 seconds, Fetched: 6 row(s)

hive> select * from dep_table;
OK
1	carry	1	A	235262.323
2	jams	2	A	192285.456
3	owen	2	B	201578.532
4	bob	1	B	215577.758
5	mary	2	B	201276.689
6	kries	1	A	225782.254
Time taken: 2.938 seconds, Fetched: 6 row(s)
hive> create table if not exists work_table(
    > work_id int,
    > work_name string,
    > work_type string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile;
OK
Time taken: 0.165 seconds
hive> load data local inpath '/home/hdoop/data/work_table_ex.txt'
    > overwrite into table work_table;
Loading data to table days_5.work_table
OK
Time taken: 0.435 seconds
hive> select * from work_table;
OK
1	Doctor	medicine
2	Teacher	education
3	engineer	internet
Time taken: 0.311 seconds, Fetched: 3 row(s)

--Select the appropriate associated field to query the number of users of different work_names.
hive> select w.work_name, count(d.work)
    > from dep_table d
    > join work_table w on d.work = w.work_id
    > group by work_name;
Query ID = hdoop_20211020151423_f1474df9-5516-494e-bcf3-b8d67064734a
Total jobs = 1
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
Starting Job = job_1634573357294_0022, Tracking URL = http://zul:8088/proxy/application_1634573357294_0022/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0022
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2021-10-20 15:14:47,651 Stage-2 map = 0%,  reduce = 0%
2021-10-20 15:14:56,223 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 2.43 sec
2021-10-20 15:15:04,770 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 4.47 sec
MapReduce Total cumulative CPU time: 4 seconds 470 msec
Ended Job = job_1634573357294_0022
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 4.47 sec   HDFS Read: 19343 HDFS Write: 130 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 470 msec
OK
Doctor	3
Teacher	3
Time taken: 41.999 seconds, Fetched: 2 row(s)

--Use explain syntax to view the execution plan of join.
hive> explain select w.work_name, count(d.work)
    > from dep_table d
    > join work_table w on d.work = w.work_id
    > group by work_name;
OK
STAGE DEPENDENCIES:
  Stage-5 is a root stage
  Stage-2 depends on stages: Stage-5
  Stage-0 depends on stages: Stage-2

STAGE PLANS:
  Stage: Stage-5
    Map Reduce Local Work
      Alias -> Map Local Tables:
        $hdt$_1:w 
          Fetch Operator
            limit: -1
      Alias -> Map Local Operator Tree:
        $hdt$_1:w 
          TableScan
            alias: w
            Statistics: Num rows: 1 Data size: 580 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: work_id is not null (type: boolean)
              Statistics: Num rows: 1 Data size: 580 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: work_id (type: int), work_name (type: string)
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 1 Data size: 580 Basic stats: COMPLETE Column stats: NONE
                HashTable Sink Operator
                  keys:
                    0 _col0 (type: int)
                    1 _col0 (type: int)

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: d
            Statistics: Num rows: 1 Data size: 1330 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: work is not null (type: boolean)
              Statistics: Num rows: 1 Data size: 1330 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: work (type: int)
                outputColumnNames: _col0
                Statistics: Num rows: 1 Data size: 1330 Basic stats: COMPLETE Column stats: NONE
                Map Join Operator
                  condition map:
                       Inner Join 0 to 1
                  keys:
                    0 _col0 (type: int)
                    1 _col0 (type: int)
                  outputColumnNames: _col0, _col2
                  Statistics: Num rows: 1 Data size: 1463 Basic stats: COMPLETE Column stats: NONE
                  Group By Operator
                    aggregations: count(_col0)
                    keys: _col2 (type: string)
                    mode: hash
                    outputColumnNames: _col0, _col1
                    Statistics: Num rows: 1 Data size: 1463 Basic stats: COMPLETE Column stats: NONE
                    Reduce Output Operator
                      key expressions: _col0 (type: string)
                      sort order: +
                      Map-reduce partition columns: _col0 (type: string)
                      Statistics: Num rows: 1 Data size: 1463 Basic stats: COMPLETE Column stats: NONE
                      value expressions: _col1 (type: bigint)
      Execution mode: vectorized
      Local Work:
        Map Reduce Local Work
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          keys: KEY._col0 (type: string)
          mode: mergepartial
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 1 Data size: 1463 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 1463 Basic stats: COMPLETE Column stats: NONE
            table:
                input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.625 seconds, Fetched: 86 row(s)
