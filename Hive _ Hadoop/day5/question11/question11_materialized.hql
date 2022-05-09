--Create a data table and insert the above sample data.
hive> create table if not exists dep_table_materialized as
    > select * from dep_table;
Query ID = hdoop_20211020153622_809a0a52-6730-4aee-badd-dc90ca113978
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634573357294_0023, Tracking URL = http://zul:8088/proxy/application_1634573357294_0023/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0023
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-20 15:36:33,417 Stage-1 map = 0%,  reduce = 0%
2021-10-20 15:36:40,935 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.88 sec
MapReduce Total cumulative CPU time: 1 seconds 880 msec
Ended Job = job_1634573357294_0023
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/.hive-staging_hive_2021-10-20_15-36-22_886_2578793204815747442-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/dep_table_materialized
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.88 sec   HDFS Read: 5461 HDFS Write: 219 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 880 msec
OK
Time taken: 20.68 seconds
hive> create table if not exists work_table_materialized as
    > select * from work_table;
Query ID = hdoop_20211020153728_87497f2d-f54a-47e1-b705-628774dd449c
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there is no reduce operator
Starting Job = job_1634573357294_0024, Tracking URL = http://zul:8088/proxy/application_1634573357294_0024/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0024
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
2021-10-20 15:37:39,365 Stage-1 map = 0%,  reduce = 0%
2021-10-20 15:37:46,768 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.57 sec
MapReduce Total cumulative CPU time: 1 seconds 570 msec
Ended Job = job_1634573357294_0024
Stage-4 is selected by condition resolver.
Stage-3 is filtered out by condition resolver.
Stage-5 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/.hive-staging_hive_2021-10-20_15-37-28_819_6295614177555566561-1/-ext-10002
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/work_table_materialized
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1   Cumulative CPU: 1.57 sec   HDFS Read: 5134 HDFS Write: 144 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 570 msec
OK
Time taken: 19.349 seconds


--Select the appropriate associated field to query the number of users of different work_names.
hive> select w.work_name, count(d.work)
    > from dep_table_materialized d
    > join work_table_materialized w on d.work = w.work_id
    > group by work_name;
Query ID = hdoop_20211020154327_a1b9960d-624a-4076-ae15-f1374150398d
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
Starting Job = job_1634573357294_0025, Tracking URL = http://zul:8088/proxy/application_1634573357294_0025/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0025
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2021-10-20 15:43:52,496 Stage-2 map = 0%,  reduce = 0%
2021-10-20 15:44:00,273 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 2.17 sec
2021-10-20 15:44:08,764 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 4.28 sec
MapReduce Total cumulative CPU time: 4 seconds 280 msec
Ended Job = job_1634573357294_0025
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 4.28 sec   HDFS Read: 19606 HDFS Write: 130 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 280 msec
OK
Doctor	3
Teacher	3
Time taken: 42.729 seconds, Fetched: 2 row(s)


--Create a result_view materialized view based on the above query, and then query based on the materialized view.
hive> create materialized view result_view as
    > select w.work_name, count(d.work)
    > from dep_table_materialized d
    > join work_table_materialized w on d.work = w.work_id
    > group by w.work_name;
Query ID = hdoop_20211020163345_fc9d612f-b835-4ee3-a26b-f9fcf1786929
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
Starting Job = job_1634573357294_0030, Tracking URL = http://zul:8088/proxy/application_1634573357294_0030/
Kill Command = /home/hdoop/hadoop-3.3.1/bin/mapred job  -kill job_1634573357294_0030
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2021-10-20 16:34:08,801 Stage-2 map = 0%,  reduce = 0%
2021-10-20 16:34:17,393 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 2.15 sec
2021-10-20 16:34:25,834 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 4.09 sec
MapReduce Total cumulative CPU time: 4 seconds 90 msec
Ended Job = job_1634573357294_0030
Moving data to directory hdfs://localhost:9000/user/hive/warehouse/days_5.db/result_view
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 4.09 sec   HDFS Read: 19390 HDFS Write: 414 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 90 msec
OK
Time taken: 41.633 seconds
hive> explain extended select w.work_name, d.name
    > from dep_table_materialized d
    > join work_table_materialized w on d.work = w.work_id
    > group by w.work_name, d.name;
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
            Statistics: Num rows: 3 Data size: 55 Basic stats: COMPLETE Column stats: NONE
            GatherStats: false
            Filter Operator
              isSamplingPred: false
              predicate: work_id is not null (type: boolean)
              Statistics: Num rows: 3 Data size: 55 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: work_id (type: int), work_name (type: string)
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 3 Data size: 55 Basic stats: COMPLETE Column stats: NONE
                HashTable Sink Operator
                  keys:
                    0 _col1 (type: int)
                    1 _col0 (type: int)
                  Position of Big Table: 0

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: d
            Statistics: Num rows: 6 Data size: 127 Basic stats: COMPLETE Column stats: NONE
            GatherStats: false
            Filter Operator
              isSamplingPred: false
              predicate: work is not null (type: boolean)
              Statistics: Num rows: 6 Data size: 127 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: name (type: string), work (type: int)
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 6 Data size: 127 Basic stats: COMPLETE Column stats: NONE
                Map Join Operator
                  condition map:
                       Inner Join 0 to 1
                  keys:
                    0 _col1 (type: int)
                    1 _col0 (type: int)
                  outputColumnNames: _col0, _col3
                  Position of Big Table: 0
                  Statistics: Num rows: 6 Data size: 139 Basic stats: COMPLETE Column stats: NONE
                  Group By Operator
                    keys: _col0 (type: string), _col3 (type: string)
                    mode: hash
                    outputColumnNames: _col0, _col1
                    Statistics: Num rows: 6 Data size: 139 Basic stats: COMPLETE Column stats: NONE
                    Reduce Output Operator
                      key expressions: _col0 (type: string), _col1 (type: string)
                      null sort order: aa
                      sort order: ++
                      Map-reduce partition columns: _col0 (type: string), _col1 (type: string)
                      Statistics: Num rows: 6 Data size: 139 Basic stats: COMPLETE Column stats: NONE
                      tag: -1
                      auto parallelism: false
      Execution mode: vectorized
      Local Work:
        Map Reduce Local Work
      Path -> Alias:
        hdfs://localhost:9000/user/hive/warehouse/days_5.db/dep_table_materialized [$hdt$_0:d]
      Path -> Partition:
        hdfs://localhost:9000/user/hive/warehouse/days_5.db/dep_table_materialized 
          Partition
            base file name: dep_table_materialized
            input format: org.apache.hadoop.mapred.TextInputFormat
            output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
            properties:
              COLUMN_STATS_ACCURATE {"BASIC_STATS":"true"}
              bucket_count -1
              bucketing_version 2
              column.name.delimiter ,
              columns id,name,work,level,deposit
              columns.comments 
              columns.types int:string:int:string:double
              file.inputformat org.apache.hadoop.mapred.TextInputFormat
              file.outputformat org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
              location hdfs://localhost:9000/user/hive/warehouse/days_5.db/dep_table_materialized
              name days_5.dep_table_materialized
              numFiles 1
              numRows 6
              rawDataSize 127
              serialization.ddl struct dep_table_materialized { i32 id, string name, i32 work, string level, double deposit}
              serialization.format 1
              serialization.lib org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
              totalSize 133
              transient_lastDdlTime 1634715403
            serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
          
              input format: org.apache.hadoop.mapred.TextInputFormat
              output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
              properties:
                COLUMN_STATS_ACCURATE {"BASIC_STATS":"true"}
                bucket_count -1
                bucketing_version 2
                column.name.delimiter ,
                columns id,name,work,level,deposit
                columns.comments 
                columns.types int:string:int:string:double
                file.inputformat org.apache.hadoop.mapred.TextInputFormat
                file.outputformat org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                location hdfs://localhost:9000/user/hive/warehouse/days_5.db/dep_table_materialized
                name days_5.dep_table_materialized
                numFiles 1
                numRows 6
                rawDataSize 127
                serialization.ddl struct dep_table_materialized { i32 id, string name, i32 work, string level, double deposit}
                serialization.format 1
                serialization.lib org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
                totalSize 133
                transient_lastDdlTime 1634715403
              serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
              name: days_5.dep_table_materialized
            name: days_5.dep_table_materialized
        hdfs://localhost:9000/user/hive/warehouse/days_5.db/work_table_materialized 
          Partition
            base file name: work_table_materialized
            input format: org.apache.hadoop.mapred.TextInputFormat
            output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
            properties:
              COLUMN_STATS_ACCURATE {"BASIC_STATS":"true"}
              bucket_count -1
              bucketing_version 2
              column.name.delimiter ,
              columns work_id,work_name,work_type
              columns.comments 
              columns.types int:string:string
              file.inputformat org.apache.hadoop.mapred.TextInputFormat
              file.outputformat org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
              location hdfs://localhost:9000/user/hive/warehouse/days_5.db/work_table_materialized
              name days_5.work_table_materialized
              numFiles 1
              numRows 3
              rawDataSize 55
              serialization.ddl struct work_table_materialized { i32 work_id, string work_name, string work_type}
              serialization.format 1
              serialization.lib org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
              totalSize 58
              transient_lastDdlTime 1634715468
            serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
          
              input format: org.apache.hadoop.mapred.TextInputFormat
              output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
              properties:
                COLUMN_STATS_ACCURATE {"BASIC_STATS":"true"}
                bucket_count -1
                bucketing_version 2
                column.name.delimiter ,
                columns work_id,work_name,work_type
                columns.comments 
                columns.types int:string:string
                file.inputformat org.apache.hadoop.mapred.TextInputFormat
                file.outputformat org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                location hdfs://localhost:9000/user/hive/warehouse/days_5.db/work_table_materialized
                name days_5.work_table_materialized
                numFiles 1
                numRows 3
                rawDataSize 55
                serialization.ddl struct work_table_materialized { i32 work_id, string work_name, string work_type}
                serialization.format 1
                serialization.lib org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
                totalSize 58
                transient_lastDdlTime 1634715468
              serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
              name: days_5.work_table_materialized
            name: days_5.work_table_materialized
      Truncated Path -> Alias:
        /days_5.db/dep_table_materialized [$hdt$_0:d]
      Needs Tagging: false
      Reduce Operator Tree:
        Group By Operator
          keys: KEY._col0 (type: string), KEY._col1 (type: string)
          mode: mergepartial
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 3 Data size: 69 Basic stats: COMPLETE Column stats: NONE
          Select Operator
            expressions: _col1 (type: string), _col0 (type: string)
            outputColumnNames: _col0, _col1
            Statistics: Num rows: 3 Data size: 69 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              GlobalTableId: 0
              directory: hdfs://localhost:9000/tmp/hive/hdoop/bb2ee9a5-e3ba-4b2d-a21f-7761f486768f/hive_2021-10-20_16-34-59_613_1637638836218070835-1/-mr-10001/.hive-staging_hive_2021-10-20_16-34-59_613_1637638836218070835-1/-ext-10002
              NumFilesPerFileSink: 1
              Statistics: Num rows: 3 Data size: 69 Basic stats: COMPLETE Column stats: NONE
              Stats Publishing Key Prefix: hdfs://localhost:9000/tmp/hive/hdoop/bb2ee9a5-e3ba-4b2d-a21f-7761f486768f/hive_2021-10-20_16-34-59_613_1637638836218070835-1/-mr-10001/.hive-staging_hive_2021-10-20_16-34-59_613_1637638836218070835-1/-ext-10002/
              table:
                  input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                  properties:
                    columns _col0,_col1
                    columns.types string:string
                    escape.delim \
                    hive.serialization.extend.additional.nesting.levels true
                    serialization.escape.crlf true
                    serialization.format 1
                    serialization.lib org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
                  serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
              TotalFiles: 1
              GatherStats: false
              MultiFileSpray: false

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink

Time taken: 0.491 seconds, Fetched: 221 row(s)

hive> select * from result_view;
OK
Doctor	3
Teacher	3
Time taken: 0.272 seconds, Fetched: 2 row(s)
