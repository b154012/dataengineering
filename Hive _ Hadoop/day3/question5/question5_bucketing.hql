--create table1
hive> create table if not exists table1(
    > wid int,
    > name string,
    > work string,
    > level string)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;

--load sample data into table1
hive> load data local inpath '/home/hdoop/data/day3_bucketing.txt'
    > overwrite into table table1;

--create tabel2 for bucketing, clustered by wid by 2 buckets
hive> create table if not exists table2(
    > wid int,
    > name string,
    > work string,
    > level string)
    > clustered by (wid) into 2 buckets
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > ;

--set min no. of reducers and enable enforce bucketing
hive> set map.reduce.tasks = 2;
hive> set hive.enforce.bucketing = true;
hive> insert overwrite table table2 select * from table1;

--verify the bcukets in the HDFS from shell
hdfs dfs -ls /user/hive/warehouse/day3.db/table2
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-14 12:19:39,592 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 2 items
-rw-r--r--   1 hdoop supergroup         32 2021-10-14 12:18 /user/hive/warehouse/day3.db/table2/000000_0
-rw-r--r--   1 hdoop supergroup         34 2021-10-14 12:18 /user/hive/warehouse/day3.db/table2/000001_0

--Use select query to compare whether the data in data table 1 and data table 2 are consistent.
hive> select * from table1;
OK
1	carry	doctor	A
2	Jams	teacher	A
3	owen	teacher	B
4	Bob	doctor	B
Time taken: 0.311 seconds, Fetched: 4 row(s)
hive> select * from table2;
OK
4	Bob	doctor	B
2	Jams	teacher	A
3	owen	teacher	B
1	carry	doctor	A
Time taken: 0.265 seconds, Fetched: 4 row(s)
