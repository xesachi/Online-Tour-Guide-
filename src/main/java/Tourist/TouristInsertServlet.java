package Tourist;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TouristInsertServlet")
public class TouristInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Fname = request.getParameter("FName");
		String Lname = request.getParameter("LName");
		String Email = request.getParameter("Email");
		String PhoneNo= request.getParameter("PhoneNo");
		String UserName = request.getParameter("UserName");
		String Password= request.getParameter("Password");
		
		boolean isTrue;
		
		isTrue = TouristController.insertdata(Fname, Lname, Email, PhoneNo, UserName, Password);
		
		if(isTrue == true) {
			String alertMessage = "Register Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'login.jsp'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
