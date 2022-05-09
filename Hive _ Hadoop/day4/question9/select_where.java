import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class select_where {
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
      		ResultSet res  =  stmt.executeQuery("select eid, name, work, level, deposit"
                                                   + " from sample_data"
                                                   + " where work = 'doctor' and deposit > 200000");
      
      		System.out.println("Result:");
      		System.out.println("ID \t Name \t Work \t Level \t Deposit ");
      
		//print statement
      		while (res.next()) {
         		System.out.println(res.getInt(1) + "\t" + res.getString(2) + "\t" + res.getString(3) + "\t" + res.getString(4) + "\t" + res.getDouble(5));
      		}

      		con.close();

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.exit(1);
	}
   }
}

