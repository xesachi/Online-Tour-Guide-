package TourGuidepkg;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Tourist.TouristModel;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        TouristModel t = null;
        if (session != null) {
        	 t = (TouristModel) session.getAttribute("user");
        }
        int touristID = t.getTouristID();
        
       
        try {
            // Get form parameters with validation
            String firstName = getRequiredParameter(request, "FirstName", "First name");
            String lastName = getRequiredParameter(request, "LastName", "Last name");
            String phone = getRequiredParameter(request, "Phone", "Phone");
            String email = getRequiredParameter(request, "Email", "Email");
            LocalDate arrivalDate = LocalDate.parse(getRequiredParameter(request, "ExpectedArrivalDate", "Arrival date"));
            LocalDate departureDate = LocalDate.parse(getRequiredParameter(request, "ExpectedDepartureDate", "Departure date"));
            
            int travelers = Integer.parseInt(getRequiredParameter(request, "NoOfTravellers", "Number of travelers"));
            if (travelers <= 0) throw new ServletException("Number of travelers must be positive");
            
            double budget = Double.parseDouble(getRequiredParameter(request, "BudgetPerPerson", "Budget"));
            if (budget < 0) throw new ServletException("Budget cannot be negative");
            
            String location = getRequiredParameter(request, "Location", "Location");
            String message = request.getParameter("Message"); // Optional field

            boolean isSuccess = RequestFormControl.insertData(
                touristID, firstName, lastName, phone, email, 
                arrivalDate, departureDate, travelers, budget, 
                location, message
            );

            if (isSuccess) {
                response.sendRedirect("RequestGetAll?success=insert_success");
            } else {
                response.sendRedirect("request.jsp?error=submission_failed");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("request.jsp?error=invalid_number_format");
        } catch (DateTimeParseException e) {
            response.sendRedirect("request.jsp?error=invalid_date_format");
        } catch (ServletException e) {
            response.sendRedirect("request.jsp?error=" + e.getMessage().replace(" ", "_"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("request.jsp?error=server_error");
        }
    }
    
    private String getRequiredParameter(HttpServletRequest request, String paramName, String fieldName) 
            throws ServletException {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            throw new ServletException(fieldName + " is required");
        }
        return value.trim();
    }
}