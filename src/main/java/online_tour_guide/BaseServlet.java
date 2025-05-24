package online_tour_guide;

import java.io.IOException;



import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// create Abstract class for common servlet function



public abstract class BaseServlet extends HttpServlet {
    
    // Common method to show alert and redirect
    protected void showAlertAndRedirect(HttpServletResponse response, String message, String url) throws IOException {
        response.getWriter().println("<script>alert('"+message+"'); window.location.href='"+url+"'</script>");
    }
    
    // Common method to handle errors
    protected void handleError(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getRequestDispatcher("wrong.jsp").forward(request, response);
    }
}