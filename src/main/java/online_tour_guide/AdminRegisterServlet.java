package online_tour_guide;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnectionC.getConnection();
            String sql = "INSERT INTO admin_users (username, password) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password); // For security, hash it in production
            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AdminDashbordC.jsp");
            } else {
                response.getWriter().println("<script>alert('Admin not added!'); location='admin_register.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred!'); location='admin_register.jsp';</script>");
        }
    }
}
