
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginControllerPart")
public class LoginControllerPart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String un = request.getParameter("username");
        String pw = request.getParameter("pass");
        HttpSession session = request.getSession();
        session.setAttribute("error_msg", " ");
// Connect to mysql(mariadb) and verify username password

        try {
            Class.forName("com.mysql.jdbc.Driver");
// loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection

            PreparedStatement ps = c.prepareStatement("select person.person_id,username,pass from person,participant where username=? and pass=? and person.person_id = participant.person_id");
            ps.setString(1, un);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
            	session.setAttribute("error_msg", " ");
            	session.setAttribute("username", un);
            	int id = rs.getInt("person_id");
            	session.setAttribute("person_id",id);
                response.sendRedirect("dashboard.jsp");
                return;
            }
            else {
            	session.setAttribute("error_msg", "Invalid Credentials!!");
            	response.sendRedirect("dashboard.jsp");
                return;
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}