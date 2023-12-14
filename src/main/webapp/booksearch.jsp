<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
String bid=request.getParameter("bid");
//out.println(bid);
try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","");
			PreparedStatement ps=conn.prepareStatement("delete from book where bid=?");
			ps.setInt(1, Integer.parseInt(bid));
			ResultSet rs= ps.executeQuery();
			out.println("<center><table border=5>");
			while(rs.next())
			{
				String id=rs.getString(1);
				out.println("<tr><th>Book ID</th><td>"+rs.getInt(1)+"</td></tr>");
				out.println("<tr><th>Book Name</th><td>"+rs.getString(2)+"</td></tr>");
				out.println("<tr><th>Book ISBN</th><td>"+rs.getString(3)+"</td></tr>");
				out.println("<tr><th>Book Author</th><td>"+rs.getString(4)+"</td></tr>");
				out.println("<tr><th>Book Publisher</th><td>"+rs.getString(5)+"</td></tr>");
				out.println("<tr><th>Year</th><td>"+rs.getString(6)+"</td></tr>");
				out.println("<tr><th><a href=delete.jsp?bid="+id+">DELETE</a></th><th><a href=update.jsp?bid="+id+">UPDATE</a></th></tr>");
			}
			out.println("</table></center>");
			
}
catch(Exception e)
{
	e.printStackTrace();
}



%>