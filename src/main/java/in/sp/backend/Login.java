package in.sp.backend;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String inputPassword = req.getParameter("password");
        String hashedInput = PasswordUtil.hashPassword(inputPassword);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/demo", "root", "bhushan"
            );

            String sql = "SELECT * FROM register WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHashedPass = rs.getString("password");

                if (storedHashedPass.equals(hashedInput)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("username", rs.getString("name"));
                    resp.sendRedirect("welcome.jsp");
                } else {
                    resp.getWriter().println("<h3 style='color:red'>Invalid password</h3>");
                }
            } else {
                resp.getWriter().println("<h3 style='color:red'>User not found</h3>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
