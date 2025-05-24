package Tourist;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TouristController {
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert Data Function
		public static boolean insertdata(String FName, String LName, String Email, String PhoneNo, String UserName, String Password) {
			
			boolean isSuccess = false;
			try {
				//DB Connection Call
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				
				//SQL Query
				
				String sql = "insert into tourist value(0,'"+FName+"', '"+LName+"', '"+Email+"','"+PhoneNo+"','"+UserName+"','"+Password+"')";
				int rs = stmt.executeUpdate(sql);
				if(rs>0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
		}
		
		//Login Validate
		public static List<TouristModel> loginValidate(String UserName, String Password ){
			ArrayList<TouristModel> tourist = new ArrayList<>();
			
			try {
				//DB Connection
				con=DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from tourist where UserName='"+UserName+"' and Password= '"+Password+"'";
				rs = stmt.executeQuery(sql);
				
				
				if(rs.next()) {
					int touristID = rs.getInt(1);
					String fName = rs.getString(2);
					String lName = rs.getString(3);
					String email = rs.getString(4);
					String phoneNo = rs.getString(5);
					String user = rs.getString(6);
					String pass = rs.getString(7);
					
					
					TouristModel t = new TouristModel(touristID, fName, lName, email, phoneNo, user, pass);
					tourist.add(t);
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return tourist;
		}
		
		//GetById function
		public static List<TouristModel> getById(String Id){
			int convertID = Integer.parseInt(Id);
			
			ArrayList <TouristModel> user = new ArrayList<>();
			
			try {
					//DB Connection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//Query
					String sql = "select * from tourist where TouristID ='"+convertID+"'";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int id = rs.getInt(1);
						String fname = rs.getString(2);
						String lname = rs.getString(3);
						String email = rs.getString(4);
						String phone = rs.getString(5);
						String username = rs.getString(6);
						String password = rs.getString(7);
						
						
						TouristModel u = new TouristModel(id, fname, lname, email, phone, username, password);
						user.add(u);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				return user;
			}
		
		//GetAllData
		public static List<TouristModel> getAllUser(){
			
			ArrayList <TouristModel> user = new ArrayList<>();
			try {
				//DB Connection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "select * from tourist";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String fname = rs.getString(2);
					String lname = rs.getString(3);
					String email = rs.getString(4);
					String phone = rs.getString(5);
					String username = rs.getString(6);
					String password = rs.getString(7);
					
					
					TouristModel u = new TouristModel(id, fname, lname, email, phone, username, password);
					user.add(u);
					}
				}
				catch(Exception e) {
					e.printStackTrace();
			}
			return user;
		}
		
		//UserManagement
				public static List<TouristModel> touristprofile (String Id){
					int convertID = Integer.parseInt(Id);
					
					ArrayList<TouristModel> user = new ArrayList<>();
					try {
						//DB Connection
						con=DBConnection.getConnection();
						stmt = con.createStatement();
						
						String sql = "select * from tourist where id='"+convertID+"'";
						rs = stmt.executeQuery(sql);
						
						if(rs.next()) {
							int id = rs.getInt(1);
							String fname = rs.getString(2);
							String lname = rs.getString(3);
							String email = rs.getString(4);
							String phone = rs.getString(5);
							String username = rs.getString(6);
							String password = rs.getString(7);
							
							
							TouristModel u = new TouristModel(id, fname, lname, email, phone, username, password);
							user.add(u);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}
					return user;
				}
				
				//UpdateProfile
				public static boolean updattouristprofile(String TouristID, String FName, String LName,  String Email, String PhoneNo, String UserName, String Password) {
					try {
						//DB Connection Call
						con = DBConnection.getConnection();
						stmt = con.createStatement();
						
						// Debug print out all parameters to ensure they're received correctly
				        System.out.println("In controller - TouristID: " + TouristID);
				        System.out.println("In controller - FName: " + FName);
				        System.out.println("In controller - LName: " + LName);
				        System.out.println("In controller - Email: " + Email);
				        System.out.println("In controller - PhoneNo: " + PhoneNo);
				        System.out.println("In controller - UserName: " + UserName);
				        System.out.println("In controller - Password: " + Password);
						
						//SQL Query
						String sql = "update tourist set FName='"+FName+"', LName='"+LName+"', Email= '"+Email+"', PhoneNo='"+PhoneNo+"', UserName= '"+UserName+"', Password= '"+Password+"' where TouristID = '"+TouristID+"'";
						
						int rs =stmt.executeUpdate(sql);
						
						if(rs > 0) {
							isSuccess = true;
						}
						else {
							isSuccess = false;
						}
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					return isSuccess;
				}
				
				//Delete Data
				public static boolean deleteprofiledata(String id) {
					int convID = Integer.parseInt(id);
					try {
						//DB Connection Call
						con = DBConnection.getConnection();
						stmt = con.createStatement();
						
						//SQL Quarry
						String sql = "delete from tourist where TouristID = '"+convID+"'";
						
						int rs = stmt.executeUpdate(sql);
						if(rs > 0) {
							isSuccess = true;
						}
						else {
							isSuccess = false;
						}
					}
					catch(Exception e){
						e.printStackTrace();
						
					}
					return isSuccess;
				}
			

}
