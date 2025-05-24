package online_tour_guide;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//  implement IGuideRepository interface

public class GuideControllerC implements IGuideRepository {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    // Implement interface methods
    @Override
    public boolean insertGuide(String username, String email, String licenseno, String phoneno, String dob) {
        try {
            con = DBConnectionC.getConnection();
            stmt = con.createStatement();
            String sql = "INSERT INTO tourguides VALUES (0, '" + username + "', '" + email + "', '" + licenseno + "', '" + phoneno + "', '" + dob + "')";
            return stmt.executeUpdate(sql) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<GuideModelC> getGuideById(String id) {
        ArrayList<GuideModelC> tourguides = new ArrayList<>();
        try {
            if (id != null && !id.isEmpty()) {
                int convertID = Integer.parseInt(id);
                con = DBConnectionC.getConnection();
                stmt = con.createStatement();
                String sql = "SELECT * FROM tourguides WHERE id = '" + convertID + "'";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    tourguides.add(new GuideModelC(
                        rs.getInt(1), rs.getString(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tourguides;
    }

    @Override
    public List<GuideModelC> getAllGuides() {
        ArrayList<GuideModelC> tourguides = new ArrayList<>();
        try {
            con = DBConnectionC.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM tourguides";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                tourguides.add(new GuideModelC(
                    rs.getInt(1), rs.getString(2), rs.getString(3), 
                    rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tourguides;
    }

    @Override
    public boolean updateGuide(String id, String username, String email, String licenseno, String phoneno, String dob) {
        try {
            if (id != null && !id.isEmpty()) {
                con = DBConnectionC.getConnection();
                stmt = con.createStatement();
                String sql = "UPDATE tourguides SET username = '" + username + "', email = '" + email + 
                             "', licenseno = '" + licenseno + "', phoneno = '" + phoneno + 
                             "', dob = '" + dob + "' WHERE id = '" + id + "'";
                return stmt.executeUpdate(sql) > 0;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteGuide(String id) {
        try {
            if (id != null && !id.isEmpty()) {
                int convID = Integer.parseInt(id);
                con = DBConnectionC.getConnection();
                stmt = con.createStatement();
                String sql = "DELETE FROM tourguides WHERE id = '" + convID + "'";
                return stmt.executeUpdate(sql) > 0;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}