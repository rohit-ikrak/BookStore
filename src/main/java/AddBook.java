import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddBook extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		String bname=req.getParameter("bname");
		String bid=req.getParameter("bid");
		String aname=req.getParameter("aname");
		String pname=req.getParameter("pname");
		String pyear=req.getParameter("pyear");
		PrintWriter pw=resp.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
			PreparedStatement ps=conn.prepareStatement("insert into books values(?,?,?,?,?)");
			
			ps.setInt(1, Integer.parseInt(bid));
			ps.setString(2, bname);
			ps.setString(3, aname);
			ps.setString(4, pname);
			ps.setString(5, pyear);
			int x=ps.executeUpdate();
			if(x>0)
				pw.println("Book Added!!!");
			else
				pw.println("Book Already Exist!!!");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
