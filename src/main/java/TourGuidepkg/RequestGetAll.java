package TourGuidepkg;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Tourist.TouristModel;

@WebServlet("/RequestGetAll")
public class RequestGetAll extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        TouristModel t = null;
        if (session != null) {
        	 t = (TouristModel) session.getAttribute("user");
        }
        int touristID = t.getTouristID();
        
        
        List<RequestFormModel> myRequests = RequestFormControl.getRequestsByTouristID(touristID);
        request.setAttribute("allRequests", myRequests);

        RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}