package online_tour_guide;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServletC")
public class DeleteServletC extends BaseServlet {  // Now extends BaseServlet
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            showAlertAndRedirect(response, "Invalid ID!", "GetAllGuidesServletC");  // Using inherited method
            return;
        }

        IGuideRepository guideRepo = new GuideControllerC();  // Using interface type
        boolean isSuccess = guideRepo.deleteGuide(id);

        if (isSuccess) {
            showAlertAndRedirect(response, "Data Delete Successful", "GetAllGuidesServletC");  // Using inherited method
        } else {
            try {
                handleError(request, response);  // Using inherited method
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}