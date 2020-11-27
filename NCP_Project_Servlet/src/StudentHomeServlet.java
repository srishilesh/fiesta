

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentHomeServlet
 */
@WebServlet("/studentHome")
public class StudentHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
//		Cookie cookie = null;
//		Cookie[] cookies = null;
//		  
//		// Get an array of Cookies associated with this domain
//		cookies = request.getCookies();
//		if( cookies != null ) {
//			System.out.println("Found Cookies Name and Value");
//			for (int i = 0; i < cookies.length; i++) {
//				cookie = cookies[i];
//				System.out.print("Name : " + cookie.getName( ) + ",  ");
//				System.out.print("Value: " + cookie.getValue( ) + "\n");
//			}
//		} 
//		else {
//			System.out.println("No cookies founds");
//		}
		
		
		ArrayList<ArrayList<String>> anns = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> events = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			String select_announcements = "select * from fiesta.table_announcement";
			PreparedStatement stmt = con.prepareStatement(select_announcements);
			ResultSet rst = stmt.executeQuery();
			int cnt_anns = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getString(3));
				temp.add(rst.getInt(4)+"");
				anns.add(temp);
				cnt_anns += 1;
			}			
			
			String select_events = "select event_id, event_name, event_desc, event_venue, event_max_participants, event_start_datetime, event_end_datetime, event_organizer_college from fiesta.table_event";
			stmt = con.prepareStatement(select_events);
			rst = stmt.executeQuery();
			int cnt_events = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getString(3));
				temp.add(rst.getString(4));
				temp.add(rst.getString(5));
				temp.add(rst.getString(6));
				temp.add(rst.getString(7));
				temp.add(rst.getString(8));
				events.add(temp);
				cnt_events += 1;
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		request.setAttribute("announcements", anns);
		request.setAttribute("upcomingEvents", events);
//		request.setAttribute("announcements", "ann");
//		getServletConfig().getServletContext().getRequestDispatcher("Admin/admin_home.jsp").forward(request,response);
//		request.setAttribute("announcements", anns); 
//		response.sendRedirect("Admin/admin_home.jsp");
		request.getRequestDispatcher("Student%20pages/student_dashboard/student_home.jsp").forward(request, response); 
//		request.getRequestDispatcher("Admin/admin_home.jsp").forward(request, response); 
		
		
//		response.sendRedirect("Student%20pages/student_dashboard/student_home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		

	}

}
