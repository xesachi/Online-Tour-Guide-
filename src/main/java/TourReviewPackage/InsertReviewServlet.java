package TourReviewPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import Tourist.TouristModel;

@WebServlet("/InsertReviewServlet")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rating = Integer.parseInt(request.getParameter("rating"));
		int guideid = Integer.parseInt(request.getParameter("guideid"));
        String comment = request.getParameter("comment");

        // TODO: Replace this with actual tourist ID from session
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        TouristModel t = null;
        if (session != null) {
        	 t = (TouristModel) session.getAttribute("user");
        }
        int touristID = t.getTouristID();

        // Validate rating
        if (rating < 1 || rating > 5) {
            request.setAttribute("error", "Invalid rating value.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        
        boolean isTrue = ReviewController.insertdata(touristID, touristID, rating, comment, guideid);
        
        if(isTrue == true) {
			String alertMessage = "Review Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href ='DisplayReviewServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,response);
		}
	
	}

}
