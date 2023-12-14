import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateUser extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		String email = session.getAttribute("email").toString();
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String contact = req.getParameter("contact");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");

		
		PrintWriter pw = resp.getWriter();
		//pw.println(name+email+contact+address+gender+password);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
			PreparedStatement ps = con.prepareStatement("Update reg_user set name=?, contact=?, gender=?, address=? where email=?");
			
			ps.setString(1, name);
			ps.setString(2, contact);
			ps.setString(3, gender);
			ps.setString(4, address);
			ps.setString(5, email);
			
			int x = ps.executeUpdate();
			
			if(x>0) {
				pw.print("Data Updated");
			}
			else {
				pw.print("Error!!!");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
