--Create a data table, insert the above sample data, and require the deposit field deposit to be stored as a double type.
hive> create table if not exists day4_index(
    > eid int,
    > name string,
    > work string,
    > level string,
    > deposit double)
    > row format delimited
    > fields terminated by '\t'
    > lines terminated by '\n'
    > stored as textfile;
OK
Time taken: 0.268 seconds
hive> load data local inpath '/home/hdoop/data/day4_approx_value.txt'
    > overwrite into table day4_index;
Loading data to table day4.day4_index
OK
Time taken: 0.48 seconds
hive> create index day4_indexs
    > on table day4_index (level)
    > AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' 
    > WITH DEFERRED REBUILD;
NoViableAltException(152@[917:1: ddlStatement : ( createDatabaseStatement | switchDatabaseStatement | dropDatabaseStatement | createTableStatement | dropTableStatement | truncateTableStatement | alterStatement | descStatement | showStatement | metastoreCheck | createViewStatement | createMaterializedViewStatement | dropViewStatement | dropMaterializedViewStatement | createFunctionStatement | createMacroStatement | dropFunctionStatement | reloadFunctionStatement | dropMacroStatement | analyzeStatement | lockStatement | unlockStatement | lockDatabase | unlockDatabase | createRoleStatement | dropRoleStatement | ( grantPrivileges )=> grantPrivileges | ( revokePrivileges )=> revokePrivileges | showGrants | showRoleGrants | showRolePrincipals | showRoles | grantRole | revokeRole | setRole | showCurrentRole | abortTransactionStatement | killQueryStatement | resourcePlanDdlStatements );])
	at org.antlr.runtime.DFA.noViableAlt(DFA.java:158)
	at org.antlr.runtime.DFA.predict(DFA.java:116)
	at org.apache.hadoop.hive.ql.parse.HiveParser.ddlStatement(HiveParser.java:4244)
	at org.apache.hadoop.hive.ql.parse.HiveParser.execStatement(HiveParser.java:2494)
	at org.apache.hadoop.hive.ql.parse.HiveParser.statement(HiveParser.java:1420)
	at org.apache.hadoop.hive.ql.parse.ParseDriver.parse(ParseDriver.java:220)
	at org.apache.hadoop.hive.ql.parse.ParseUtils.parse(ParseUtils.java:74)
	at org.apache.hadoop.hive.ql.parse.ParseUtils.parse(ParseUtils.java:67)
	at org.apache.hadoop.hive.ql.Driver.compile(Driver.java:616)
	at org.apache.hadoop.hive.ql.Driver.compileInternal(Driver.java:1826)
	at org.apache.hadoop.hive.ql.Driver.compileAndRespond(Driver.java:1773)
	at org.apache.hadoop.hive.ql.Driver.compileAndRespond(Driver.java:1768)
	at org.apache.hadoop.hive.ql.reexec.ReExecDriver.compileAndRespond(ReExecDriver.java:126)
	at org.apache.hadoop.hive.ql.reexec.ReExecDriver.run(ReExecDriver.java:214)
	at org.apache.hadoop.hive.cli.CliDriver.processLocalCmd(CliDriver.java:239)
	at org.apache.hadoop.hive.cli.CliDriver.processCmd(CliDriver.java:188)
	at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:402)
	at org.apache.hadoop.hive.cli.CliDriver.executeDriver(CliDriver.java:821)
	at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:759)
	at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:683)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:323)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:236)
FAILED: ParseException line 1:7 cannot recognize input near 'create' 'index' 'day4_indexs' in ddl statement


--Create an index for the level column of the data table, and then use select to query.

