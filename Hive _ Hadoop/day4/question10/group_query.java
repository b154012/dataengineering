import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class group_query {
	private static String driverName = "org.apache.hive.jdbc.HiveDriver";
   
	public static void main(String[] args) throws SQLException {

	try {
		// register driver and create driver instance
		Class.forName(driverName);
			
		//get connection
		Connection con = DriverManager.getConnection("jdbc:hive2://localhost:10000/day4", "", "");
		System.out.println("Connected to the host");
      
      		// create statement
      		Statement stmt = con.createStatement();
      
      		// execute statement
      		ResultSet res  =  stmt.executeQuery("select work, count(*)"
                                                   + " from grouped_data"
                                                   + " where work = 'teacher'"
						   + " group by work");
      
      		System.out.println("Result:");
      		System.out.println("Work \t No. Of People");
      
		//print statement
      		while (res.next()) {
         		System.out.println(res.getString(1) + "\t\t" + res.getInt(2));
      		}

      		con.close();

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.exit(1);
	}
   }
}

