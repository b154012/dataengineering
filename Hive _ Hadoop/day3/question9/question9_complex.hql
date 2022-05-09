--Create a data table, insert the above sample data, and set the country field to be stored as an array type.
hive> create table if not exists hive_complex(
    > eid int,
    > country array<string>)
    > row format delimited
    > fields terminated by '\t'
    > collection items terminated by ','
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.089 seconds
hive> load data local inpath '/home/hdoop/data/day3_complex.txt'
    > overwrite into table hive_complex;
Loading data to table day3.hive_complex
OK
Time taken: 0.183 seconds
hive> select * from hive_complex;
OK
1	["CHINA","NEPAL","THAILAND","LAOS"]
2	["USA","CUBA","CANADA","MEXICO"]
Time taken: 0.113 seconds, Fetched: 2 row(s)

-Use select to query the first element of the country field.
hive> select eid, country[1] from hive_complex;
OK
1	NEPAL
2	CUBA
Time taken: 0.134 seconds, Fetched: 2 row(s)
