package online_tour_guide;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetAllGuidesServletC")
public class GetAllGuidesServletC extends BaseServlet {  //  extends BaseServlet
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IGuideRepository guideRepo = new GuideControllerC();  // Using interface type
        List<GuideModelC> allGuides = guideRepo.getAllGuides();
        request.setAttribute("allGuides", allGuides);
        request.getRequestDispatcher("GuideDetailsC.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}