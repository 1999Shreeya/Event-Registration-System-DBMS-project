import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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

@WebServlet("/UpdateEvent")
public class UpdateEvent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String e_name = request.getParameter("e_name");
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		String category = request.getParameter("category");
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		int price = Integer.parseInt(request.getParameter("price"));
		String desc = request.getParameter("desc");
		int id = (int)session.getAttribute("event_id");
		session.setAttribute("error_msg", " ");
			
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 

		    String query1 = "update event_tab set event_name=?, price=?, description=?, capacity=?, start_date=?, end_date=?, category=? where event_id = ?";

		    PreparedStatement ps = con.prepareStatement(query1); // generates sql query

		    ps.setString(1, e_name);
		    ps.setInt(2, price);
		    ps.setString(3, desc);
		    ps.setInt(4, capacity);
		    ps.setDate(5, java.sql.Date.valueOf(s_date));
		    ps.setDate(6, java.sql.Date.valueOf(e_date));
		    ps.setString(7, category);
		    ps.setInt(8, id);

		    if(ps.executeUpdate()!=1) {
		    	session.setAttribute("error_msg", "Error in updation!!");
		    	return;
		    }
		    
		    ps.close();
		    con.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("event_details2.jsp");
	}
}
