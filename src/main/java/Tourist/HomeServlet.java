package Tourist;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Review user information form session
		TouristModel user = (TouristModel) request.getSession().getAttribute("user");
		
		if(user != null) {
			//Forward user data to profile.jsp
			request.setAttribute("user", user);
			request.getRequestDispatcher("Home2.jsp").forward(request, response);
		}else {
			//Handle case where user is not logged in
			response.sendRedirect("login.jsp");
		}
	}

}
