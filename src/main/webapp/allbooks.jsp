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
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Book Store</title>
	<link rel="stylesheet" href="css/style.css" />
	
</head>
<body>
    <div id="page">
      <div id="header">
      	<h1>List of all the Books</h1>
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
			<table border='5' class="utable">
				
				<tr>
					<th>Book ID</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Publisher</th>
					<th>Published Year</th>
					<th>Actions</th>
				</tr>
				
				<%
				while(rs.next()){
				%>
				<tr>
					<td><% out.print(rs.getInt(1)); %></td>
					<td><% out.print(rs.getString(2)); %></td>
					<td><% out.print(rs.getString(3)); %></td>
					<td><% out.print(rs.getString(4)); %></td>
					<td><% out.print(rs.getString(5)); %></td>
					<td><input type="button" id="btn_<% rs.getInt(1); %>" 
							data-id="<%= id %>"
							data-bid="<%= rs.getInt(1) %>"
           					data-bname="<%= rs.getString(2) %>"
           					data-aname="<%= rs.getString(3) %>"	
							data-pname="<%= rs.getString(4) %>"
           					data-pyear="<%= rs.getString(5) %>"
							value="Add" />
					</td>					
				</tr>
				<%
				} 
				%>
				
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
		$("input[id^='btn_']").click(function(){
			// Use 'this' to refer to the specific button that was clicked
			var id = $(this).data("id");
			var bid = $(this).data("bid");
			var bname = $(this).data("bname");
			var aname = $(this).data("aname");
			var pname = $(this).data("pname");
			var pyear = $(this).data("pyear");

//			alert("ID: " + id + "\n" +
//			      "Book ID: " + bid + "\n" +
//			      "Book Name: " + bname + "\n" +
//			      "Author Name: " + aname + "\n" +
//			      "Publisher Name: " + pname + "\n" +
//			      "Published Year: " + pyear);

			$.post("AddMyBooks",{'id':id, 'bid':bid, 'bname':bname, 'aname':aname, 'pname':pname, 'pyear':pyear}, function(data){
				alert(data);
			});
		});
	});
</script>