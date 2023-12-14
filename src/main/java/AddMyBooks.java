

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


public class AddMyBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	
    	PrintWriter pw = resp.getWriter();
    	int id = Integer.parseInt(req.getParameter("id"));
    	int bid = Integer.parseInt(req.getParameter("bid"));
    	String bname = req.getParameter("bname");
    	String aname = req.getParameter("aname");
    	String pname = req.getParameter("pname");
    	String pyear = req.getParameter("pyear");
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");       
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
    		PreparedStatement p = con.prepareStatement("select * from userbooks where id=? and bookid=?");
    		p.setInt(1, id);
    		p.setInt(2, bid);
    		ResultSet rs = p.executeQuery();
    		if(rs.next()) {
    			pw.println("data already exists.");
    		}
    		else {
    			PreparedStatement ps = con.prepareStatement("Insert into userbooks values (?,?,?,?,?,?,?)");
    			ps.setInt(1, id);
    			ps.setInt(2, bid);
    			ps.setString(3, bname);
    			ps.setString(4, aname);
    			ps.setString(5, pname);
    			ps.setString(6, pyear);
    			ps.setString(7, "pending");
    		
    			int x = ps.executeUpdate();
    		
    			if(x>0)
					pw.println("Book Added!!!");
				else
					pw.println("Book Already Exist!!!");
    		}
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    }
   
}
