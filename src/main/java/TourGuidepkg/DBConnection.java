package TourGuidepkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/tour_guide";
    private static final String USER = "root";
    private static final String PASSWORD = "2002"; // ← ️Ensure this matches your MySQL password!

    public static Connection getConnection() {
        System.out.println("[DEBUG] Attempting to connect to: " + URL); // Log connection attempt
        Connection con = null;
        try {
            // 1. Load MySQL driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // 2. Establish connection
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("[DEBUG] Connection successful!"); // Log success
            return con;
            
        } catch (ClassNotFoundException e) {
            System.err.println("[ERROR] MySQL Driver not found! Add JDBC JAR to your project.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("[ERROR] Database connection failed!");
            System.err.println("URL: " + URL);
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null; // Return null if connection fails
    }
}