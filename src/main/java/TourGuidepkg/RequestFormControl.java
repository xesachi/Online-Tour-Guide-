package TourGuidepkg;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class RequestFormControl {
	
//insert
    public static boolean insertData(int touristID, String firstName, String lastName, String phone,
                                   String email, LocalDate expectedArrivalDate, LocalDate expectedDepartureDate,
                                   int noOfTravellers, double budgetPerPerson, String location,
                                   String message) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "INSERT INTO tour_request (TouristID, FirstName, LastName, Phone, Email, " +
                 "ExpectedArrivalDate, ExpectedDepartureDate, NoOfTravellers, BudgetPerPerson, " +
                 "Location, Message) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

            pstmt.setInt(1, touristID);
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setDate(6, Date.valueOf(expectedArrivalDate));
            pstmt.setDate(7, Date.valueOf(expectedDepartureDate));
            pstmt.setInt(8, noOfTravellers);
            pstmt.setDouble(9, budgetPerPerson);
            pstmt.setString(10, location);
            pstmt.setString(11, message);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("[ERROR] Database operation failed: " + e.getMessage());
            return false;
        }
    }

    public static List<RequestFormModel> getRequestsByTouristID(int touristID) {
        List<RequestFormModel> requests = new ArrayList<>();
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "SELECT * FROM tour_request WHERE TouristID = ?")) {

            pstmt.setInt(1, touristID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(new RequestFormModel(
                    rs.getInt("RequestID"),
                    rs.getInt("TouristID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    rs.getDate("ExpectedArrivalDate").toLocalDate(),
                    rs.getDate("ExpectedDepartureDate").toLocalDate(),
                    rs.getInt("NoOfTravellers"),
                    rs.getDouble("BudgetPerPerson"),
                    rs.getString("Location"),
                    rs.getString("Message")
                ));
            }
        } catch (SQLException e) {
            System.err.println("[ERROR] Database operation failed: " + e.getMessage());
        }
        return requests;
    }

    public static RequestFormModel getRequestById(int requestId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "SELECT * FROM tour_request WHERE RequestID = ?")) {

            pstmt.setInt(1, requestId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new RequestFormModel(
                    rs.getInt("RequestID"),
                    rs.getInt("TouristID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    rs.getDate("ExpectedArrivalDate").toLocalDate(),
                    rs.getDate("ExpectedDepartureDate").toLocalDate(),
                    rs.getInt("NoOfTravellers"),
                    rs.getDouble("BudgetPerPerson"),
                    rs.getString("Location"),
                    rs.getString("Message")
                );
            }
        } catch (SQLException e) {
            System.err.println("[ERROR] Database operation failed: " + e.getMessage());
        }
        return null;
    }

    public static boolean updateData(int requestId, int touristId, String firstName, String lastName, 
                                   String phone, String email, LocalDate expectedArrivalDate, 
                                   LocalDate expectedDepartureDate, int noOfTravellers, 
                                   double budgetPerPerson, String location, String message) {
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "UPDATE tour_request SET FirstName=?, LastName=?, Phone=?, Email=?, " +
                 "ExpectedArrivalDate=?, ExpectedDepartureDate=?, NoOfTravellers=?, " +
                 "BudgetPerPerson=?, Location=?, Message=? " +
                 "WHERE RequestID=? AND TouristID=?")) {

            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, phone);
            pstmt.setString(4, email);
            pstmt.setDate(5, Date.valueOf(expectedArrivalDate));
            pstmt.setDate(6, Date.valueOf(expectedDepartureDate));
            pstmt.setInt(7, noOfTravellers);
            pstmt.setDouble(8, budgetPerPerson);
            pstmt.setString(9, location);
            pstmt.setString(10, message);
            pstmt.setInt(11, requestId);
            pstmt.setInt(12, touristId);

            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("[ERROR] Database operation failed: " + e.getMessage());
            return false;
        }
    }
    
    public static boolean deleteData(int requestId) {
        /* FUTURE USER PROFILE VERSION:
        public static boolean deleteData(int requestId, int userId) {
            String sql = "DELETE FROM tour_request WHERE RequestID = ? AND TouristID = ?";
        */
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "DELETE FROM tour_request WHERE RequestID = ?")) {
            
            // For future user profile version:
            // pstmt.setInt(1, requestId);
            // pstmt.setInt(2, userId);
            
            pstmt.setInt(1, requestId);
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("[ERROR] Database operation failed: " + e.getMessage());
            return false;
        }
    }
}