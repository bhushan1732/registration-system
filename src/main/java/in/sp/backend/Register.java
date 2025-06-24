package in.sp.backend;

import in.sp.backend.PasswordUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

@WebServlet("/regForm")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String myname = req.getParameter("name1");
        String myemail = req.getParameter("email1");
        String mypass = req.getParameter("pass1");
        String hashedPass = PasswordUtil.hashPassword(mypass);
        String mygender = req.getParameter("gender1");
        String mycity = req.getParameter("city1");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "bhushan");

            // Check if email already exists
            String checkSql = "SELECT email FROM register WHERE email = ?";
            ps = con.prepareStatement(checkSql);
            ps.setString(1, myemail);
            rs = ps.executeQuery();

            if (rs.next()) {
                req.getSession().setAttribute("registerError", "Email already exists. Try another one.");
                resp.sendRedirect(req.getContextPath() + "/registration/register.jsp");
                return;
            }

            // Close previous PreparedStatement
            ps.close();

            // Insert new user
            String insertSql = "INSERT INTO register(name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(insertSql);
            ps.setString(1, myname);
            ps.setString(2, myemail);
            ps.setString(3, hashedPass);
            ps.setString(4, mygender);
            ps.setString(5, mycity);

            int result = ps.executeUpdate();
            resp.setContentType("text/html");

            if (result > 0) {
                req.getSession().setAttribute("registerSuccess", "Registration successful. Please login.");
                resp.sendRedirect(req.getContextPath() + "/registration/Login.jsp");
            } else {
                req.getSession().setAttribute("registerError", "Registration failed. Please try again.");
                resp.sendRedirect(req.getContextPath() + "/registration/register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            resp.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
