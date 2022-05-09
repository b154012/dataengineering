import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class modify_table {

	private static String driverName = "org.apache.hive.jdbc.HiveDriver";

	public static void main(String[] args) throws SQLException {

		try {
			// register driver and create driver instance
			Class.forName(driverName);
			
			//get connection
			Connection con = DriverManager.getConnection("jdbc:hive2://localhost:10000/day3", "", "");

			//create statement
			Statement stmt = con.createStatement();

			//a. create ods_zulmi database
			stmt.execute("CREATE DATABASE IF NOT EXISTS ods_zulmi");
			stmt.execute("USE ods_zulmi");
			System.out.println("DB ods_zulmi created and use ods_zulmi");

			//create table
			stmt.execute("CREATE TABLE jtable_zulmi AS"
		                     + " select * from day3.jtable_zulmi");
			System.out.println("Table jtable_zulmi copied in ods_zulmi");

			//rename table
			stmt.execute("ALTER TABLE jtable_zulmi RENAME TO dwd_zulmi");
			System.out.println("Table renamed successfully");

			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
