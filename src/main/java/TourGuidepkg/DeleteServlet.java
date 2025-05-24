package TourGuidepkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// FUTURE: import javax.servlet.http.HttpSession;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int requestId = Integer.parseInt(request.getParameter("requestid"));
            
            // FUTURE USER PROFILE VERSION:
            // HttpSession session = request.getSession();
            // Integer touristId = (Integer) session.getAttribute("userId");
            // if (touristId == null) {
            //     response.sendRedirect("login.jsp");
            //     return;
            // }
            // boolean isSuccess = RequestFormControl.deleteData(requestId, touristId);
            
            // Current version with hardcoded ID:
            boolean isSuccess = RequestFormControl.deleteData(requestId);
            
            if(isSuccess) {
                String alertMessage = "Data Delete Successful";
                response.getWriter().println("<script>alert('"+alertMessage+"');"
                    + "window.location.href='RequestGetAll';</script>");
            } else {
                response.sendRedirect("error.jsp?message=Delete+failed");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?message=Invalid+Request+ID");
        }
    }
}
