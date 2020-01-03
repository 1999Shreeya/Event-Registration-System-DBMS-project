
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/AddEvent")
@MultipartConfig(maxFileSize = 16177215)  
public class AddEvent extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String e_name = request.getParameter("e_name");
    	String desc = request.getParameter("desc");
    	String s_date = request.getParameter("s_date");
    	String e_date = request.getParameter("e_date");
    	String category = request.getParameter("category");
    	int price = Integer.parseInt(request.getParameter("price"));
    	int capacity = Integer.parseInt(request.getParameter("capacity"));
    	InputStream inputStream = null; // input stream of the upload file
        Part filePart = request.getPart("logo");
    	HttpSession session = request.getSession();
    	int person_id = 0;
    	
    	session.setAttribute("error_msg", " ");
    	
    	if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
    	
    	try {
        	
        	if(session.getAttribute("person_id")!=null) {
        		person_id = (int)session.getAttribute("person_id");
        	}
    		
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 
		    String query1 = "insert into event_tab(event_name, price, occupied, capacity, category, person_id, description, start_date, end_date, logo) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		    
		    PreparedStatement ps = con.prepareStatement(query1); // generates sql query
		    ps.setString(1, e_name);
		    ps.setInt(2, price);
		    ps.setInt(3, 0);
		    ps.setInt(4, capacity);
		    ps.setString(5, category);
		    ps.setInt(6, person_id);
		    ps.setString(7, desc);
		    ps.setDate(8, java.sql.Date.valueOf(s_date));
		    ps.setDate(9, java.sql.Date.valueOf(s_date));
		    if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(10, inputStream);
            }
		    
		    int val = ps.executeUpdate();
		    
		    if(val!=1) {
		    	session.setAttribute("error_msg","Error!!");
		    	
		    }
		    else {
		    	session.setAttribute("error_msg", "Added Successfully");
		    }
		    
		    ps.close();
		    con.close();
		    response.sendRedirect("add_event.jsp");
    		
    	} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    }

}
