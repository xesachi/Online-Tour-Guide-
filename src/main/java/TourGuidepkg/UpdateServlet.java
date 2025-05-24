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

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
        
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        TouristModel t = null;
        if (session != null) {
        	 t = (TouristModel) session.getAttribute("user");
        }
        int touristID = t.getTouristID();
        
        
        try {
        	String requestIdStr = request.getParameter("id");
        	if (requestIdStr == null || requestIdStr.trim().isEmpty()) {
        	    response.sendRedirect("display.jsp?error=missing_request_id");
        	    return;
        	}

            int requestId = Integer.parseInt(requestIdStr);
            RequestFormModel requestDetails = RequestFormControl.getRequestById(requestId);
            
            if (requestDetails == null) {
                response.sendRedirect("display.jsp?error=request_not_found");
                return;
            }
            
           
            if (requestDetails.getTouristID() != touristID) {
                response.sendRedirect("display.jsp?error=unauthorized_access");
                return;
            }
       
            
            request.setAttribute("requestDetails", requestDetails);
            request.getRequestDispatcher("Update.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect("display.jsp?error=invalid_request_id");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        //HttpSession session = request.getSession();
        int requestId = 0; // Initialize outside try block for error handling
        
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        TouristModel t = null;
        if (session != null) {
        	 t = (TouristModel) session.getAttribute("user");
        }
        int touristID = t.getTouristID();
   
        
        try {
            // 1. Validate requestId
        	String requestIdStr = request.getParameter("requestId");
        	if (requestIdStr == null || requestIdStr.trim().isEmpty()) {
        	    response.sendRedirect("display.jsp?error=missing_request_id");
        	    return;
        	}
            requestId = Integer.parseInt(requestIdStr);

            // 2. Validate and parse numeric fields with proper error handling
            int travelers = 1;
            try {
                String travelersStr = request.getParameter("travelers");
                if (travelersStr != null && !travelersStr.trim().isEmpty()) {
                    travelers = Integer.parseInt(travelersStr);
                    if (travelers <= 0) throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid number of travelers");
            }

            double budget = 0.0;
            try {
                String budgetStr = request.getParameter("budget");
                if (budgetStr != null && !budgetStr.trim().isEmpty()) {
                    budget = Double.parseDouble(budgetStr);
                    if (budget < 0) throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid budget amount");
            }

            // 3. Get and validate other parameters
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String arrivalDateStr = request.getParameter("arrivalDate");
            String departureDateStr = request.getParameter("departureDate");
            String location = request.getParameter("location");
            String message = request.getParameter("message");

            if (arrivalDateStr == null || arrivalDateStr.trim().isEmpty()) {
                throw new ServletException("Arrival date is required");
            }
            if (departureDateStr == null || departureDateStr.trim().isEmpty()) {
                throw new ServletException("Departure date is required");
            }

            LocalDate arrivalDate = LocalDate.parse(arrivalDateStr);
            LocalDate departureDate = LocalDate.parse(departureDateStr);

            // 4. Perform update
            boolean isSuccess = RequestFormControl.updateData(
                requestId, touristID, firstName, lastName, 
                phone, email, arrivalDate, departureDate, 
                travelers, budget, location, message
            );

            if (isSuccess) {
                response.sendRedirect("RequestGetAll?success=update_success");
            } else {
                response.sendRedirect("Update.jsp?id=" + requestId + "&error=update_failed");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("Update.jsp?id=" + requestId + "&error=invalid_number_format");
        } catch (DateTimeParseException e) {
            response.sendRedirect("Update.jsp?id=" + requestId + "&error=invalid_date_format");
        } catch (ServletException e) {
            response.sendRedirect("Update.jsp?id=" + requestId + "&error=" + e.getMessage().replace(" ", "_"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Update.jsp?id=" + requestId + "&error=server_error");
        }
    }
}
