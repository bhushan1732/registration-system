package in.sp.backend;
import in.sp.backend.PasswordUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/demo", "root", "bhushan"
            );

            String sql = "INSERT INTO register(name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, myname);
            ps.setString(2, myemail);
            ps.setString(3, hashedPass); // Store hashed password

            ps.setString(4, mygender);
            ps.setString(5, mycity);

            int result = ps.executeUpdate();

            resp.setContentType("text/html");
            if (result > 0) {
                resp.getWriter().println("<h3 style='color:green'>Registration successful!</h3>");
            } else {
                resp.getWriter().println("<h3 style='color:red'>Registration failed. Please try again.</h3>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("<h3 >Error: " + e.getMessage() + "</h3>");
        }
    }
}
