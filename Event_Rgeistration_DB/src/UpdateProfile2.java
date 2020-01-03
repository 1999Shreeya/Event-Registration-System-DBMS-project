import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateProfile2")
public class UpdateProfile2 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("error_msg", " ");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String username = request.getParameter("username");
		String designation = request.getParameter("designation");
		int id = (int)session.getAttribute("person_id");
		
		if(name.isEmpty() || email.isEmpty() || mobile.isEmpty() || username.isEmpty() || designation.isEmpty()) {
			
		   RequestDispatcher rd = request.getRequestDispatcher("edit_org_profile.jsp");
		   out.println("<font color=red>Please fill all the fields</font>");
		   rd.include(request, response);
		}
		else {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 

			    String query1 = "update person set person_name=?, email=?, mobile=?, username=? where person_id = ?";

			    PreparedStatement ps = con.prepareStatement(query1); // generates sql query

			    ps.setString(1, name);
			    ps.setString(2, email);
			    ps.setString(3,mobile);
			    ps.setString(4, username);
			    ps.setInt(5, id);

			    ps.executeUpdate();
			    
			    String query2 = "update organiser set role = ? where person_id=?";
			    
			    ps = con.prepareStatement(query2);
			    
			    ps.setString(1, designation);
			    ps.setInt(2, id);
			    
			    ps.executeUpdate();
			    
			    ps.close();
			    
			    con.close();
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("org_profile.jsp");
		}
	}
}
