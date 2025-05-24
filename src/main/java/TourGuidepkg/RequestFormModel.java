package TourGuidepkg;

import java.time.LocalDate;

public class RequestFormModel {

    private int requestID;
    private int touristID;
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private LocalDate expectedArrivalDate;
    private LocalDate expectedDepartureDate;
    private int noOfTravellers;
    private double budgetPerPerson;
    private String location;
    private String message;

    public RequestFormModel(int requestID, int touristID, String firstName, String lastName, String phone,
                            String email, LocalDate expectedArrivalDate, LocalDate expectedDepartureDate,
                            int noOfTravellers, double budgetPerPerson, String location, String message) {
        this.requestID = requestID;
        this.touristID = touristID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
        this.expectedArrivalDate = expectedArrivalDate;
        this.expectedDepartureDate = expectedDepartureDate;
        this.noOfTravellers = noOfTravellers;
        this.budgetPerPerson = budgetPerPerson;
        this.location = location;
        this.message = message;
    }

    // Getters for JSP EL
    public int getRequestID() { return requestID; }
    public int getTouristID() { return touristID; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getPhone() { return phone; }
    public String getEmail() { return email; }
    public LocalDate getExpectedArrivalDate() { return expectedArrivalDate; }
    public LocalDate getExpectedDepartureDate() { return expectedDepartureDate; }
    public int getNoOfTravellers() { return noOfTravellers; }
    public double getBudgetPerPerson() { return budgetPerPerson; }
    public String getLocation() { return location; }
    public String getMessage() { return message; }
}
