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

public class BookSearch extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException  {
		String bid= req.getParameter("bid");
		PrintWriter pw = resp.getWriter();
		//out.println(bid);
		try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","");
					PreparedStatement ps=conn.prepareStatement("delete from books where bid=?");
					ps.setInt(1, Integer.parseInt(bid));
					ResultSet rs= ps.executeQuery();
					pw.println("<center><table border=5>");
					while(rs.next())
					{
						String id=rs.getString(1);
						pw.println("<tr><th>Book ID</th><td>"+rs.getInt(1)+"</td></tr>");
						pw.println("<tr><th>Book Name</th><td>"+rs.getString(2)+"</td></tr>");
						pw.println("<tr><th>Book ISBN</th><td>"+rs.getString(3)+"</td></tr>");
						pw.println("<tr><th>Book Author</th><td>"+rs.getString(4)+"</td></tr>");
						pw.println("<tr><th>Book Publisher</th><td>"+rs.getString(5)+"</td></tr>");
						pw.println("<tr><th>Year</th><td>"+rs.getString(6)+"</td></tr>");
						pw.println("<tr><th><a href=delete.jsp?bid="+id+">DELETE</a></th><th><a href=update.jsp?bid="+id+">UPDATE</a></th></tr>");
					}
					pw.println("</table></center>");
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}


		
	}
}
