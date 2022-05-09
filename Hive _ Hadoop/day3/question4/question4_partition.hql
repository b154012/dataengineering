--create table
create table if not exists workers(
wid int,
name string)
partitioned by (work string, level string)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as textfile;

--load data to workers
load data local inpath '/home/hdoop/data/day3_partition.txt'
overwrite into table workers;

--query all data
select * from workers;
