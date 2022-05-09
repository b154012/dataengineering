--Create a data table, insert the above sample data, and set the score field to be stored as a double type
hive> create table if not exists day4_approx(
    > eid int,
    > name string,
    > work string,
    > level string,
    > score double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.093 seconds

hive> load data local inpath '/home/hdoop/data/day4_approximation.txt'
    > overwrite into table day4_approx;
Loading data to table day4.day4_approx
OK
Time taken: 0.168 seconds

hive> select * from day4_approx;
OK
1	carry	doctor	A	88.5
2	jams	teacher	A	85.0
3	owen	teacher	B	78.5
4	bob	doctor	B	77.75
5	mary	teacher	B	77.0
6	kries	doctor	A	82.5
Time taken: 0.136 seconds, Fetched: 6 row(s)

--Use select to query the score field to round up data greater than 80 points.
hive> select eid, name, work, level, round(score) from day4_approx
    > where round(score) > 80;
OK
1	carry	doctor	A	89.0
2	jams	teacher	A	85.0
6	kries	doctor	A	83.0
Time taken: 0.137 seconds, Fetched: 3 row(s)
