package TourReviewPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import TourReviewPackage.ReviewModel;
import TourReviewPackage.DBConnection;

public class ReviewController {
    
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stat = null;
    private static ResultSet rs = null;
    
    //insert data
    public static boolean insertdata(int review_id, int tour_id, int rating, String comment, int guide_id) {
        boolean isSuccess = false;
        try {
            // db connection call
            con = DBConnection.getConnection();
            stat = con.createStatement();
            
            // Escape single quotes in comment to prevent SQL injection
            String escapedComment = comment.replace("'", "''");
            
            // Corrected SQL query with proper parentheses and removed review_id parameter since it's auto-incremented
            String sql = "INSERT INTO review VALUES (0, '" + tour_id + "','" + rating + "','" + escapedComment + "', '"+ guide_id+"')";
            
            int rs = stat.executeUpdate(sql);
            
            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stat != null) stat.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    
    public static List<ReviewModel> getByReviewId(String review_id ){
    	int convertedID=Integer.parseInt(review_id);
    	
    	ArrayList<ReviewModel> rlist = new ArrayList<ReviewModel>();
    	
    	try {
    		con = DBConnection.getConnection();
    		stat = con.createStatement();
    		//change
    		//Query
    		String sql = "select * from review where id'"+convertedID+"'";
    		
    		rs = stat.executeQuery(sql);
    		
    		while(rs.next()) {
    			int rid = rs.getInt("reviewID");
    			int tid = rs.getInt("touristID");
    			int rating = rs.getInt("rating");
    			String comment = rs.getString("comment");
    			int gid = rs.getInt("guideID");
    			
    			ReviewModel rm = new ReviewModel(rid, tid, rating, comment, gid);
    			rlist.add(rm);
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return rlist;
    }
    
    public static ReviewModel getByReviewById(String review_id) {
        ReviewModel rm = null;

        try {
            int convertedID = Integer.parseInt(review_id);
            con = DBConnection.getConnection();
            stat = con.createStatement();
            
            String sql = "SELECT * FROM review WHERE reviewID = " + convertedID;
            rs = stat.executeQuery(sql);

            if (rs.next()) {
                int rid = rs.getInt("reviewID");
                int tid = rs.getInt("touristID");
                int rating = rs.getInt("rating");
                String comment = rs.getString("comment");
                int gid = rs.getInt("guideID");
                
                rm = new ReviewModel(rid, tid, rating, comment, gid);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rm;
    }
    
    //
    public static List<ReviewModel> getsAllReview() {
    	
    	
    	ArrayList<ReviewModel> Reviews = new ArrayList<ReviewModel>();
    	
    	try {
    		con = DBConnection.getConnection();
    		stat = con.createStatement();
    		//change
    		//Query
    		String sql = "select * from review ";
    		
    		rs = stat.executeQuery(sql);
    		
    		while(rs.next()) {
    			int rid = rs.getInt("reviewID");
    			int tid = rs.getInt("touristID");
    			int rating = rs.getInt("rating");
    			String comment = rs.getString("comment");
    			int gid = rs.getInt("guideID");          
    			System.out.println(gid);
    			
    			ReviewModel rm = new ReviewModel(rid, tid, rating, comment, gid);
    			Reviews.add(rm);
    			         
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return Reviews;
    }
    	//update data
    	public static boolean updatedata(int review_id, int rating, String comment) {
   		 try {
	    		con = DBConnection.getConnection();
	    		stat = con.createStatement();
	    		
	    		//Query
	    		String escapedComment = comment.replace("'", "''");
	    		String sql = "UPDATE review SET rating = " + rating + ", comment = '" + escapedComment +"' WHERE reviewID = " + review_id;

	    		
	    		int rs=stat.executeUpdate(sql);
	    		 
	            if (rs >0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return isSuccess;
   	 
    	
}
    	//delete data
    	public static boolean deletedata(String Id) {
	    	int conID = Integer.parseInt(Id);
	    	try {
	    		con = DBConnection.getConnection();
	    		stat = con.createStatement();
	    		
	    		//Query
	    		String sql = "delete  from review where reviewID = '"+ conID+"'";
	    		
 	    		int rs=stat.executeUpdate(sql);
	    		 
 	            if (rs >0) {
 	                isSuccess = true;
 	            } else {
 	                isSuccess = false;
 	            }
	    		
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return isSuccess;
	    }
    	
        public static ReviewModel getByReviewByTouristId(String t_id) {
            ReviewModel rm = null;

            try {
                int convertedID = Integer.parseInt(t_id);
                con = DBConnection.getConnection();
                stat = con.createStatement();
                
                String sql = "SELECT * FROM review WHERE touristID = " + convertedID;
                rs = stat.executeQuery(sql);

                if (rs.next()) {
                    int rid = rs.getInt("reviewID");
                    int tid = rs.getInt("touristID");
                    int rating = rs.getInt("rating");
                    String comment = rs.getString("comment");
                    int gid = rs.getInt("guideID");

                    rm = new ReviewModel(rid, tid, rating, comment, gid);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return rm;
        }
}





