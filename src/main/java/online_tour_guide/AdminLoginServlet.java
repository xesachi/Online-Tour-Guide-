package online_tour_guide;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBConnectionC.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin_users WHERE username=? AND password=?")) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", username);
                response.sendRedirect("AdminDashbordC.jsp");
            } else {
                response.sendRedirect("admin_login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
