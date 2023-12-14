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
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
		PreparedStatement ps=conn.prepareStatement("delete from books where bookid=?");
		ps.setInt(1, Integer.parseInt(bid));
		ps.executeUpdate();
		out.println("Record Deleted!!");
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}



%>