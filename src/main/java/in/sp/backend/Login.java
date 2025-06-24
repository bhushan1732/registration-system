package in.sp.backend;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String inputPassword = req.getParameter("password");
        String hashedInput = PasswordUtil.hashPassword(inputPassword);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/demo", "root", "bhushan"
            );

            String sql = "SELECT * FROM register WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String storedHashedPass = rs.getString("password");

                if (storedHashedPass.equals(hashedInput)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("username", rs.getString("name"));
                    resp.sendRedirect(req.getContextPath() + "/registration/welcome.jsp");
                } else {
                    resp.setContentType("text/html");
                    resp.getWriter().println("<h3 style='color:red'>Invalid password</h3>");
                }
            } else {
                resp.setContentType("text/html");
                resp.getWriter().println("<h3 style='color:red'>User not found</h3>");
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/registration/Login.jsp");
    }
}
