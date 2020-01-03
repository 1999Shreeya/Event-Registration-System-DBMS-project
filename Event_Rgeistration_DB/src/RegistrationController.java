
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
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

@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String category = request.getParameter("category");
		session.setAttribute("error_msg", " ");
		
		if(name.isEmpty() || email.isEmpty() || mobile.isEmpty() || username.isEmpty() || password.isEmpty() || category.isEmpty()) {
			
		   RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		   out.println("<font color=red>Please fill all the fields</font>");
		   rd.include(request, response);
		}
		else {
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 

			    String query1 = "insert into person(person_name,email,mobile,username,pass) values(?,?,?,?,?);";

			    PreparedStatement ps = con.prepareStatement(query1); // generates sql query

			    ps.setString(1, name);
			    ps.setString(2, email);
			    ps.setString(3,mobile);
			    ps.setString(4, username);
			    ps.setString(5, password);

			    int val = ps.executeUpdate();
			   
			    if(val > 0){
			    	session.setAttribute("error_msg", "Registration Successfull");
			    	
				    ps.close();
				    
				    String query2 = "call insert_into_participant(?,?);";
				    
				    CallableStatement cs = con.prepareCall(query2);
				    
				    cs.setString(1, username);
				    cs.setString(2, category);
				    
				    cs.executeQuery();
				    
				    cs.close();
				    
				    con.close();
				    
				    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
					rd.forward(request, response);
				    
			    }
			    
			    session.setAttribute("error_msg", "Account is already present same username or email address!!");
		    	RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

