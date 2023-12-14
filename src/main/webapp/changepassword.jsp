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
      	<h1>Change Password</h1>
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
					<th>Enter your Password</th>
					<td><input type="password" id="oldpw"/></td>
				</tr>
				<tr>
					<th>Enter new Password</th>
					<td><input type="password" id="newpw"/></td>
				</tr>
				<tr>
					<th>Re-Enter Your Password</th>
					<td><input type="password" id="repw"/></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="button" id="btn" value="Change Password" /></td>
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
            var oldpw = $("#oldpw").val();
            var newpw = $("#newpw").val();
            var repw = $("#repw").val();
            var id = <%=id%>;
            if(newpw != repw){
                alert(oldpw + " " + newpw + " " + repw + " passwords don't match.");
            }
            else{
				//alert(oldpw + newpw + repw + id);
                $.post("ChangePassword", {'oldpw': oldpw, 'newpw': newpw, 'id': id}, function(data){
                    alert(data);
                });
            }
        });
    });
</script>

<%	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>