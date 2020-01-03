<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
PreparedStatement ps = null;
ResultSet rs = null;
try {
	int event_id = 0;
	if(session.getAttribute("username")!=null) {
		event_id = (int)session.getAttribute("event_id");
	}
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 
    String query1 = "select logo from event_tab where event_id = ?";
    
    ps = con.prepareStatement(query1); // generates sql query
    ps.setInt(1, event_id);
    
    rs = ps.executeQuery();

if (rs.next()) {
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
// display the image
response.setContentType("image/jpg");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} finally {
try {
ps.close();
con.close();
} catch (SQLException e) {
e.printStackTrace();
}
}
%>