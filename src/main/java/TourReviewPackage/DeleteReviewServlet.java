package TourReviewPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
	    boolean isTrue = ReviewController.deletedata(id);

	    if (isTrue) {
	       String alertMessage ="data Delete successful";
	       List<ReviewModel>reviewdetails = ReviewController.getsAllReview();
	       request.setAttribute("reviewdetails",reviewdetails);
	       response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='DisplayReviewServlet';</script>");
	    } else {
	    	
	    	RequestDispatcher  dispacher=request.getRequestDispatcher("wrong.jsp");
	    	dispacher.forward(request, response);
	    }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
