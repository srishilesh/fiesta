

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LatestNewsServlet
 */
@WebServlet("/latestNews")
public class LatestNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LatestNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		ArrayList<ArrayList<String>> news = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String select_news = "select * from fiesta.table_latest_news";
			PreparedStatement stmt = con.prepareStatement(select_news);
			ResultSet rst = stmt.executeQuery();
			int cnt_news = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getString(3));
				temp.add(rst.getString(4));
				news.add(temp);
				cnt_news += 1;
			}					
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		request.setAttribute("latestNews", news);
//		request.setAttribute("announcements", "ann");
//		getServletConfig().getServletContext().getRequestDispatcher("Admin/admin_home.jsp").forward(request,response);
//		request.setAttribute("announcements", anns); 
//		response.sendRedirect("Admin/admin_home.jsp");
		request.getRequestDispatcher("Announcements/Latest_News.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
