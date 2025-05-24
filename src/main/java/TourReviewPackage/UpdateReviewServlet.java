package TourReviewPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rId = request.getParameter("id");
		
		ReviewModel rm = ReviewController.getByReviewById(rId);
		request.setAttribute("review", rm);  // where review is a valid ReviewModel object
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReviewEditDisplay.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("reviewID"));
		int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        boolean isTrue;
        isTrue=ReviewController.updatedata(id,rating, comment);
        
        if(isTrue == true) {
        	List<ReviewModel>reviewdetails = ReviewController.getsAllReview();
        	request.setAttribute("reviewdetails",reviewdetails);
			String alertMessage = "Review update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href ='DisplayReviewServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,response);
		}
	

	}

}
