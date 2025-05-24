package Tourist;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url = "jdbc:mysql://127.0.0.1:3306/tour_guide";
	private static String user = "root";
	private static String pass = "2002";
	private static Connection con;
	
	
	public static Connection getConnection () {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		}
		catch(Exception e) {
			System.out.println("Database Not Conected!");
		}
		return con;
	}

}
