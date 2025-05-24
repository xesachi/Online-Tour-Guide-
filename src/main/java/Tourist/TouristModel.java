package Tourist;

public class TouristModel {
	private int TouristID;
	private String FName;
	private String LName;
	private String Email;
	private String PhoneNo;
	private String UserName;
	private String Password;
	
	public TouristModel(int touristID, String fName, String lName, String email, String phoneNo, String userName, String password) {
		super();
		this.TouristID = touristID;
		this.FName = fName;
		this.LName = lName;
		this.Email = email;
		this.PhoneNo = phoneNo;
		this.UserName = userName;
		this.Password = password;
	}

	public int getTouristID() {
		return TouristID;
	}

	public void setTouristID(int touristID) {
		this.TouristID = touristID;
	}

	
	public String getFName() {
		return FName;
	}

	public void setFName(String fName) {
		this.FName = fName;
	}

	public String getLName() {
		return LName;
	}

	public void setLName(String lName) {
		this.LName = lName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		this.Email = email;
	}

	public String getPhoneNo() {
		return PhoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.PhoneNo = phoneNo;
	}
	
	public String getUserName() {
		return UserName;
	}
	
	public void setUserName(String userName) {
		this.UserName = userName;
	}

	public String getPassword() {
		return Password;
	}
	
	public void setPassword(String password) {
		this.Password = password;
	}
	

	
	

	
}
