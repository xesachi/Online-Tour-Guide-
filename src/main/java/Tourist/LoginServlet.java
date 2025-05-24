package Tourist;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("UserName");
		String password = request.getParameter("Password");
		
		try {
			List<TouristModel> userlogin = TouristController.loginValidate(username, password);
			if(userlogin != null && !userlogin.isEmpty()) {	
				
				request.getSession().setAttribute("user", userlogin.get(0));
				response.sendRedirect("HomeServlet");
				
			}else {
				String alertMessage2 = "Invalide Credentials,please try again";
				response.getWriter().println("<script>alert('"+alertMessage2+"');window.location.href='login.jsp'</script>");
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}
