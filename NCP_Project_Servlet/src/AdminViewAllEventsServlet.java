

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
 * Servlet implementation class AdminViewAllEventsServlet
 */
@WebServlet("/adminViewAllEvents")
public class AdminViewAllEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminViewAllEventsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<ArrayList<String>> eventDetails = new ArrayList<ArrayList<String>>();
			PreparedStatement stmt = con.prepareStatement("select * from fiesta.table_event");
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				ArrayList<String> tmp = new ArrayList<String>();
				tmp.add(rst.getInt(1)+"");
				tmp.add(rst.getString(2));
				tmp.add(rst.getString(3));
				tmp.add(rst.getString(4));
				tmp.add(rst.getInt(5)+"");
				tmp.add(rst.getString(6));
				tmp.add(rst.getInt(7)+"");
				tmp.add(rst.getString(8));
				tmp.add(rst.getString(9));
				tmp.add(rst.getString(10));
				tmp.add(rst.getString(11));
				tmp.add(rst.getString(12));
				tmp.add(rst.getString(13));
				tmp.add("");
				tmp.add(rst.getString(15));
				tmp.add(rst.getString(16));
				tmp.add(rst.getString(17));
				tmp.add(rst.getString(18));
				eventDetails.add(tmp);
			}				
			
			con.close();
			request.setAttribute("eventDetails", eventDetails);
			System.out.println(eventDetails);
			request.getRequestDispatcher("Admin/admin_view_all_events.jsp").forward(request, response); 
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
//		response.sendRedirect("Admin/admin_view_all_events.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doGet(request, response);
		
	}

}
