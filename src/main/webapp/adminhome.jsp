<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%
	String email = session.getAttribute("email").toString();
	String name = "";
	String contact = "";
	String gender = "";
	String address = "";
	int id = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
		PreparedStatement ps = con.prepareStatement("Select * from reg_user where email = ?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			id = rs.getInt(1);
			name = rs.getString(2);
			contact = rs.getString(4);
			address = rs.getString(5);
			gender = rs.getString(6);
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>
    
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Book Store</title>
	<link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <div id="page">
      <div id="header">
      	<h1><%out.print(name); %></h1>
      </div>
      
      <div id="ucontent">   
      	<div id="uleft">
			<div class="btn-group">
				<a href="manageprofile.jsp"><button>Manage Profile</button></a>
				<a href="addrecord.jsp"><button>Add Record</button></a>
				<a href="deleterecord.jsp"><button>Delete Record</button></a>
				<a href="searchrecord.jsp"><button>Search Record</button></a>
				<a href="completerecord.jsp"><button>Complete Record</button></a>
				<a href="changepassword.jsp"><button>Change Password</button></a>
				<a href="logout.jsp"><button>logout</button></a>
				
			</div>
		</div>
		
		<div id="uright">
			<div class="center-content">
			<table border=5 class="utable">
				<tr>
					<th>Id</th>
					<td><%out.print(id); %></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><%out.print(name); %></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><%out.print(email); %></td>
				</tr>
				<tr>
					<th>Contact</th>
					<td><%out.print(contact); %></td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><%out.print(gender); %></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><%out.print(address); %></td>
				</tr>
			</table>
			</div>
		</div>
      </div>

      <div id="footer">
      	made by <b><i>@rohitkarki</i></b>
      </div>
  </div>
</body>
</html>