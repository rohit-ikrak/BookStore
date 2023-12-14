<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%
	String email = session.getAttribute("email").toString();
	int id = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
		PreparedStatement ps = con.prepareStatement("Select * from reg_user where email = ?");
		ps.setString(1, email);
		ResultSet r = ps.executeQuery();
		while(r.next()){
			id = r.getInt(1);
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
		PreparedStatement ps = con.prepareStatement("Select * from books");
		ResultSet rs = ps.executeQuery();
			
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
      	<h1>Search Books</h1>
      </div>
      
      <div id="ucontent">   
      	<div id="uleft">
			<div class="btn-group">
				<a href="manageprofile.jsp"><button>Manage Profile</button></a>
				<a href="allbooks.jsp"><button>See all Books</button></a>
				<a href="searchbooks.jsp"><button>Search Specific Book</button></a>
				<a href="yourbooks.jsp"><button>See your Books</button></a>
				<a href="changepassword.jsp"><button>Change Password</button></a>
				<a href="logout.jsp"><button>logout</button></a>
				
			</div>
		</div>
		
		<div id="uright">
		<h3 style="text-align: left; padding-top: 5px;">Enter value in any one (default top to bottom):</h3>
			<div class="center-content-search">
				<table border=1 >
					<tr>
						<th>By Book Id</th>
						<td><input type="text" id="bid"/></td>
						<td><input type="button" id="btnbid" value="search" /></td>
					</tr>
					<tr>
						<th>By Book Name</th>
						<td><input type="text" id="bname"/></td>
						<td><input type="button" id="btnbname" value="search"/></td>
					</tr>
					<tr>
						<th>By Author</th>
						<td><input type="text" id="auth" /></td>
						<td><input type="button" id="btnauth" value="search"/></td>
					</tr>
					<tr>
						<th>By Publisher</th>
						<td><input type="text" id="pub" /></td>
						<td><input type="button" id="btnpub" value="search"/></td>
					</tr>
					<tr>
						<th>By year</th>
						<td><input type="text" id="year" /></td>
						<td><input type="button" id="btnyr" value="search"/></td>
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
<% 
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>

<script src="js/jquery.js"></script>

<script>
	$("document").ready(function(){
		$("").click(function(){
			
		});
	});
</script>