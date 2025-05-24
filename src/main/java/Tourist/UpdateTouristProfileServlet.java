package Tourist;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateTouristProfileServlet")
public class UpdateTouristProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String touristID = request.getParameter("TouristID");
		String fName = request.getParameter("FName");
		String lName = request.getParameter("LName");
		String email = request.getParameter("Email");
		String phoneNo= request.getParameter("PhoneNo");
		String userName = request.getParameter("UserName");
		String password = request.getParameter("Password");
		
		// Debug statements - print all parameters to verify they're received correctly
        System.out.println("TouristID: " + touristID);
        System.out.println("FName: " + fName);
        System.out.println("LName: " + lName);
        System.out.println("Email: " + email);
        System.out.println("PhoneNo: " + phoneNo);
        System.out.println("UserName: " + userName);
		
		
		boolean isTrue;
		isTrue = TouristController.updattouristprofile(touristID, fName, lName, email, phoneNo, userName, password);
		
		if(isTrue == true) {
			List<TouristModel> userdetails = TouristController.getById(touristID);
			request.setAttribute("userdetails", userdetails);
			
			String alertMessage = "Profile Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'login.jsp'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
