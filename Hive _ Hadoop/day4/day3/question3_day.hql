--Create a data table, insert the above sample data, and require the birthday field to be stored as a date type.
hive> create table if not exists day4_day(
    > eid int,
    > name string,
    > work string,
    > level string,
    > birthday date)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.115 seconds

hive> load data local inpath '/home/hdoop/data/day4_day.txt' overwrite into table day4_day;
Loading data to table day4.day4_day
OK
Time taken: 0.177 seconds

hive> select * from day4_day;
OK
1	carry	doctor	A	1970-01-01
2	jams	teacher	A	1971-03-27
3	owen	teacher	B	1969-08-22
4	bob	doctor	B	1973-12-11
5	mary	teacher	B	1970-07-08
6	kries	doctor	A	1971-05-18
Time taken: 0.134 seconds, Fetched: 6 row(s)

--Use select to query the data of which birth day is on the 18th.
hive> select * from day4_day
    > where day(birthday) == 18;
OK
6	kries	doctor	A	1971-05-18
Time taken: 0.118 seconds, Fetched: 1 row(s)
