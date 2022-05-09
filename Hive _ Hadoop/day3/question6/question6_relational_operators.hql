--Create a data table and insert the above sample data.
hive> create table if not exists hive_relational(
    > eid int,
    > name string,
    > work string,
    > level string)
    > ;
OK
Time taken: 1.023 seconds
hive> insert into hive_relational values
    > (1, 'carry', 'doctor', 'A'),
    > (2, 'Jams', 'teacher', 'A'),
    > (3, 'Owen', 'teacher', 'B'),
    > (4, 'Bob', 'doctor', 'B'),
    > (5, 'Marry', 'teacher', 'B'),
    > (6, 'Kries', 'doctor', 'A');

--View the data in the data table where work is doctor.

hive> create view view_relational as
    > select * from hive_relational
    > where work = 'doctor';

hive> select * from view_relational;
OK
1	carry	doctor	A
4	Bob	doctor	B
6	Kries	doctor	A
Time taken: 0.344 seconds, Fetched: 3 row(s)


--Query the data of level A in the data table.
hive> select * from hive_relational
    > where level = 'A';
OK
1	carry	doctor	A
2	Jams	teacher	A
6	Kries	doctor	A
Time taken: 0.203 seconds, Fetched: 3 row(s)
