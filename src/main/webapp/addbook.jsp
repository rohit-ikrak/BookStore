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
					<th>User ID</th>
					<td><%out.print(id); %></td>				
				</tr>
				<tr>
					<th>Book ID</th>
					<td><input type="text" name="bid" id="bid" placeholder="Enter book ID"/></td>
				</tr>
				<tr>
					<th>Book Title</th>
					<td><input type="text" name="bname" id="bname" placeholder="Enter book name"/></td>
				</tr>
				<tr>
					<th>Author</th>
					<td><input type="text" name="aname" id="aname" placeholder="Enter author"/></td>
				</tr>
				<tr>
					<th>Publisher</th>
					<td><input type="text" name="pname" id="pname" placeholder="Enter publisher"/></td>
				</tr>
				<tr>
					<th>Published Year</th>
					<td><input type="text" name="pyear" id="pyear" placeholder="Enter year of publication"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" id="btn" value="Submit"/></td>
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
			var bid = $("#bid").val();
			var bname = $("#bname").val();
			var aname = $("#aname").val();
			var pname = $("#pname").val();
			var pyear = $("#pyear").val();
			//alert(bid + " " + bname + " " +aname + " " +pname + " " +pyear);
			$.post("AddBook", {'bid': bid, 'bname':bname, 'aname':aname, 'pname':pname, 'pyear':pyear},function(data){
				alert(data);
			});
		});
	});
</script>