--Create a data table, insert the above sample data, and set the birthday field to be stored as a date type.
hive> create table if not exists day4_year(
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
Time taken: 0.048 seconds
hive> load data local inpath '/home/hdoop/data/day4_year.txt' overwrite into table day4_year;
Loading data to table day3.day4_year
OK
Time taken: 0.176 seconds
hive> select * from day4_year;
OK
1	carry	doctor	A	1970-01-01
2	jams	teacher	A	1971-03-27
3	owen	teacher	B	1969-08-22
4	bob	doctor	B	1973-12-11
5	mary	teacher	B	1970-07-08
6	kries	doctor	A	1971-05-18
Time taken: 0.133 seconds, Fetched: 6 row(s)


--Use select to query data of which year of birth is 1970.
hive> select * from day4_year
    > where year(birthday) == 1970; 
OK
1	carry	doctor	A	1970-01-01
5	mary	teacher	B	1970-07-08
Time taken: 0.15 seconds, Fetched: 2 row(s)
