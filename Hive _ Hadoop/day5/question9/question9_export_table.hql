--Choose a Hive internal table and export the data of the internal table to a local folder.
hive> create table if not exists u_data(
    > userid int,
    > movieid int,
    > rating int,
    > unixtime string)
    > row format delimited
    > fields terminated by '\t'
    > stored as textfile;
OK
Time taken: 0.722 seconds
hive> load data inpath '/tmp/u.data' overwrite into table u_data;
Loading data to table day5_q9.u_data
OK
Time taken: 0.416 seconds

hive> export table u_data to '/tmp/day9';
OK
Time taken: 0.206 seconds

hive> dfs -ls /tmp/day9;
Found 2 items
-rw-r--r--   1 hdoop supergroup       1439 2021-10-21 13:57 /tmp/day9/_metadata
drwxr-xr-x   - hdoop supergroup          0 2021-10-21 13:57 /tmp/day9/data

hdoop@zul:~$ hdfs dfs -get /tmp/day9 /home/hdoop/data
OpenJDK Server VM warning: You have loaded library /home/hdoop/hadoop-3.3.1/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It is highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
2021-10-21 13:58:49,164 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable

--Use a text editor to view.
attached
