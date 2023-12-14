

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginUser extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String email = req.getParameter("lemail");
		String password = req.getParameter("lpassword");
		
		PrintWriter pw = resp.getWriter();
		//pw.println(email + " " + password);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
			PreparedStatement ps = con.prepareStatement("select * from reg_user where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			int c = 0;
			while(rs.next()) {
				
				c++;
				
			}
			if(c==1) {
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				pw.println(1);
			}
			else {
				pw.println(0);
			}
			
//			if(c==1) {
//				HttpSession session = req.getSession();
//				session.setAttribute("email", email);
//				//redirect to userhome.jsp on successful login
//				resp.sendRedirect("userhome.jsp");
//			}
//			else {
//				pw.println("Wrong Email or Password.");
//			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
