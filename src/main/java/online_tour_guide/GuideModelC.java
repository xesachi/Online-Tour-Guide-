package online_tour_guide;

public class GuideModelC {
	
	private int id;
	private String username;
	private String email;
	private String licenseno;
	private String phoneno;
	private String dob;
	public GuideModelC(int id, String username, String email, String licenseno, String phoneno, String dob) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.licenseno = licenseno;
		this.phoneno = phoneno;
		this.dob = dob;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLicenseno() {
		return licenseno;
	}
	public void setLicenseno(String licenseno) {
		this.licenseno = licenseno;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	

}
