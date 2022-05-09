--Create a data table, insert the above sample data, and set the birthday field to be stored as a date type.
hive> create table if not exists day4_month(
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
Time taken: 0.08 seconds

hive> load data local inpath '/home/hdoop/data/day4_month.txt' overwrite into table day4_month;
Loading data to table day4.day4_month
OK
Time taken: 0.159 seconds

hive> select * from day4_month;
OK
1	carry	doctor	A	1970-01-01
2	jams	teacher	A	1971-03-27
3	owen	teacher	B	1969-08-22
4	bob	doctor	B	1973-12-11
5	mary	teacher	B	1970-07-08
6	kries	doctor	A	1971-05-18
Time taken: 0.114 seconds, Fetched: 6 row(s)


--Use select to query the birthday of July data
hive> select * from day4_month
    > where month(birthday) == 7;
OK
5	mary	teacher	B	1970-07-08
Time taken: 0.114 seconds, Fetched: 1 row(s)
