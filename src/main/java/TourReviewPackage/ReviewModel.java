package TourReviewPackage;

public class ReviewModel {
	private int reviewID;
    private int touristID;
    private int rating;
    private String comment;
    private int guideID;
    
	public ReviewModel(int reviewID, int touristID, int rating, String comment, int guideID) {
		super();
		this.reviewID = reviewID;
		this.touristID = touristID;
		this.rating = rating;
		this.comment = comment;
		this.guideID = guideID;
	}

	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}

	public int getTouristID() {
		return touristID;
	}

	public void setTouristID(int touristID) {
		this.touristID = touristID;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
		
	public int getGuideID() { return guideID; }

	public void setGuideID(int guideID) {
		this.guideID = guideID;
	}
    
}
