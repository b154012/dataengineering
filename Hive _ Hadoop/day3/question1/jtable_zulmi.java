import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class jtable_zulmi {

	private static String driverName = "org.apache.hive.jdbc.HiveDriver";

	public static void main(String[] args) throws SQLException {

		try {
			// register driver and create driver instance
			Class.forName(driverName);
			
			//get connection
			Connection con = DriverManager.getConnection("jdbc:hive2://localhost:10000/day3", "", "");

			//create statement
			Statement stmt = con.createStatement();

			//create table
			stmt.execute("CREATE TABLE IF NOT EXISTS"
		                     + " jtable_zulmi(eid int, name string, age int)"
				     + " row format delimited fields terminated by ','"
		                     + " lines terminated by '\n'"
		                     + " stored as textfile");

			System.out.println("Table employee created");
		        
		        //load data
			stmt.execute("load data local inpath'/home/hdoop/data/day3_1.txt' overwrite into table jtable_zulmi");
			System.out.println("Data has been loaded into table employee");

			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
