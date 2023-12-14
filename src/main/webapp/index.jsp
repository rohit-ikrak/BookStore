
<html>
  <head>
    <meta charset="UTF-8">
    <title>BookStore</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body>
    <div id="page">
      <div id="header">
        <h1>Book Store</h1>
      </div>
      
      <div id="content">        
        <div id="left">
          <h1>Register</h1>
          <form id="reg-form">
            <table id="reg-table">
                <tr>
                  <th><label for="rname">Name</label></th>
                  <td><input type="text" name="rname" id="rname" /></td>
                </tr>
                <tr>
                  <th><label for="remail">Email</label></th>
                  <td><input type="email" name="remail" id="remail" /></td>
                </tr>
                <tr>
                  <th><label for="rcontact">Contact</label></th>
                  <td><input type="text" name="rcontact" id="rcontact" /></td>
                </tr>

                <tr>
                  <th><label for="raddress">Address</label></th>
                  <td><textarea rows="4" cols="20" name="raddress" id="raddress"></textarea></td>
                </tr>
                <tr>
                  <th>Gender</th>
                  <td>
                    <label><input type="radio" name="rgender" id="rmale" value="male" />Male</label>
                    <label><input type="radio" name="rgender" id="rfemale" value="female" />Female</label>
                  </td>
                </tr>

                <tr>
                  <th><label for="rpassword">Password</label></th>
                  <td><input  type="password" name="rpassword" id="rpassword" /></td>
                </tr>
                <tr>
                  <th></th>
                  <td><input type="button" id="rbtn" value="REGISTER" /></td>
                </tr>
            </table>
          </form>
        </div>
        
        <div id="right">
          <h1>Login</h1>
          <form id="login-form">
            <table id="log-table">
                <tr>
                  <th><label for="lemail">E-Mail</label></th>
                  <td><input type="text" id="lemail" name="lemail" /></td>
                </tr>

                <tr>
                  <th><label for="lpassword">Password</label></th>
                  <td><input type="password" id="lpassword" name="lpassword" /></td>
                </tr>
                <tr>
                  <th></th>
                  <td><input type="button"  id="lbtn" value="LOGIN" /></td>
                </tr>
            </table>
          </form>
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
		$("#rbtn").click(function(){
			var name = $("#rname").val();
			var email = $("#remail").val();
			var contact = $("#rcontact").val();
			var address = $("#raddress").val();
			var gender = $("#rgender:checked").val();
			var password = $("#rpassword").val();
			
			$.post("RegisterUser", {'rname':name,'remail':email,'rcontact':contact,'raddress':address,'rgender':gender,'rpassword':password}, function(data){
				alert(data);
			});
		});

		$("#lbtn").click(function(){
			var email = $("#lemail").val();
			var password = $("#lpassword").val();

			$.post("LoginUser",{'lemail':email, 'lpassword':password}, function(data){
				
				if(data){
					window.location.replace("userhome.jsp");	
				}
				else{
					alert("Wrong email or password");
				}
			});			
		});
	});
</script>