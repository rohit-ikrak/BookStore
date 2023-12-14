<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%
	String email = session.getAttribute("email").toString();
	String name = "";
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
					<th>ID</th>
					<td><input type="text" name="bid" id="bid" required /></td>
				</tr>

				<tr>
					<th></th>
					<td><input type="button"  id="btn"  value="Delete" /></td>
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
		$("#btn").click(){
			var bid = $("#bid").val();
			
			$.post("bookdeleter.jsp", {bid: bid},function(data){
				alert(data);
			});
		});
	});
</script>