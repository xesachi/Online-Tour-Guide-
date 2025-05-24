package Tourist;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteTouristProfileServlet")
public class DeleteTouristProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        
        boolean isDeleted = TouristController.deleteprofiledata(id);
        
        if (isDeleted) {
            // Invalidate session since the user is deleted
            HttpSession session = request.getSession();
            session.invalidate();
            
            // Redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            // If delete failed, redirect back to profile with error message
            request.setAttribute("deleteError", "Failed to delete profile. Please try again.");
            request.getRequestDispatcher("/TouristProfileServlet").forward(request, response);
        }
	}

}
