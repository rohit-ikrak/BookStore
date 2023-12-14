

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


public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	PrintWriter pw = resp.getWriter();
    	int id = Integer.parseInt(req.getParameter("id"));
    	String oldpw = req.getParameter("oldpw");
    	String newpw = req.getParameter("newpw");
    	String query1 = "Select * from reg_user where id=?";
    	String query2 = "update reg_user set password=? where id=?";
    	int c = 0;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
    		PreparedStatement ps = con.prepareStatement(query1);
    		ps.setInt(1, id);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			String password = rs.getString(7);
    			if(password.equals(oldpw)) {	
    	    		ps = con.prepareStatement(query2);
    	    		ps.setString(1, newpw);
    	    		ps.setInt(2, id);
    	    		int x = ps.executeUpdate();
    	    		if(x>0) {
    	    			pw.print("password changed.");
    	    		}
    	    		else {
    	    			pw.print("Something is Wrong ...");
    	    		}
    	    	}
    		}
    		else {
    			c=0;
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
}
