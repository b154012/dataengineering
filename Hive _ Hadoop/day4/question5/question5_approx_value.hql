--Create a data table, insert the above sample data, and set the deposit field to be stored as a double type.
hive> create table if not exists day4_approx_value(
    > eid int,
    > name string,
    > work string,
    > level string,
    > deposite double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.081 seconds
hive> load data local inpath '/home/hdoop/data/day4_approx_value.txt'
    > overwrite into table day4_approx_value;
Loading data to table day4.day4_approx_value
OK
Time taken: 0.139 seconds

hive> alter table day4_approx_value change deposite deposit double;
OK
Time taken: 0.119 seconds

hive> select * from day4_approx_value;
OK
1	carry	doctor	A	235262.323
2	jams	teacher	A	192285.456
3	owen	teacher	B	201578.532
4	Bob	doctor	B	215577.758
5	mary	teacher	B	201276.689
6	kries	doctor	A	225782.254
Time taken: 0.132 seconds, Fetched: 6 row(s)


--Use select to query the deposit field deposit after rounding to the nearest 2 decimal places.
hive> select eid, name, work, level, round(deposit,2) from day4_approx_value;
OK
1	carry	doctor	A	235262.32
2	jams	teacher	A	192285.46
3	owen	teacher	B	201578.53
4	Bob	doctor	B	215577.76
5	mary	teacher	B	201276.69
6	kries	doctor	A	225782.25
Time taken: 0.18 seconds, Fetched: 6 row(s)
