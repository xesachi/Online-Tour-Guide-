package online_tour_guide;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServletC")
public class InsertServletC extends BaseServlet {  //  extends BaseServlet
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String licenseno = request.getParameter("licenseno");
        String phoneno = request.getParameter("phoneno");
        String dob = request.getParameter("dob");
        
        IGuideRepository guideRepo = new GuideControllerC();  // Using interface type
        boolean isSuccess = guideRepo.insertGuide(username, email, licenseno, phoneno, dob);
        
        if(isSuccess) {
            showAlertAndRedirect(response, "Data Insert Successful", "GetAllGuidesServletC");  // Using inherited method
        } else {
            try {
                handleError(request, response);  // Use inherited method
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}