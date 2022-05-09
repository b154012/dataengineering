import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class delete_table {

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
			stmt.execute("CREATE TABLE unlimited AS"
		                     + " select * from day3.jtable_zulmi");
			System.out.println("Table unlimited created");

			//rename table
			stmt.execute("DROP TABLE IF EXISTS unlimited");
			System.out.println("Table dropped successfully");

			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1);
		}
	}
}
