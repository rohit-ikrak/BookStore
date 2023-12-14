

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterUser extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("rname");
		String email = req.getParameter("remail");
		String contact = req.getParameter("rcontact");
		String address = req.getParameter("raddress");
		String gender = req.getParameter("rgender");
		String password = req.getParameter("rpassword");
		
		PrintWriter pw = resp.getWriter();
		//pw.println(name+email+contact+address+gender+password);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
			PreparedStatement ps = con.prepareStatement("Insert into reg_user values(?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, contact);
			ps.setString(5, address);
			ps.setString(6, gender);
			ps.setString(7, password);
			
			int x = ps.executeUpdate();
			
			if(x>0) {
				pw.println("Account created.");
			}
			else {
				pw.print("Account might already exist.");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
