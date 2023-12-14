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
				<a href="allbooks.jsp"><button>See all Books</button></a>
				<a href="searchbooks.jsp"><button>Search Specific Book</button></a>
				<a href="yourbooks.jsp"><button>See your Books</button></a>
				<a href="changepassword.jsp"><button>Change Password</button></a>
				<a href="logout.jsp"><button>logout</button></a>
				
			</div>
		</div>
		
		<div id="uright">
			<div class="center-content">
			<table border=5 class="utable">
				<tr>
					<th>Id</th>
					<td><%out.print(id);%></td>
				</tr>
				<tr>
					<th>Name</th>
					<td><input type="text" name="name" id="name" value="<%out.print(name);%>"/></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><%out.print(email);%></td>
				</tr>
				<tr>
					<th>Contact</th>
					<td><input type="text" name="contact" id="contact" value="<%out.print(contact);%>"/></td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><input type="text" name="gender" id="gender" value="<%out.print(gender);%>"/></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><input type="text" name="address" id="address" value="<%out.print(address);%>"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" id="btn" value="Update"/></td>
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

<script src="js/jquery.js"></script>
<script>
	$("document").ready(function(){
		$("#btn").click(function(){
			name = $("#name").val();
			contact = $("#contact").val();
			gender = $("#gender").val();
			address = $("#address").val();
			$.post("UpdateUser", {name:name, contact:contact, gender:gender, address:address}, function(data){
				alert(data);
			});
		});
	});
</script>