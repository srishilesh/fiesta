

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

//import com.sun.tools.javac.util.List;

/**
 * Servlet implementation class AdminHomeServlet
 */
@WebServlet("/adminHome")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<ArrayList<String>> anns = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> events = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
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
			
			String select_events = "select event_id, event_name, event_desc, event_venue, event_max_participants, event_start_datetime, event_end_datetime, event_organizer_college, event_type_participation from fiesta.table_event";
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
				String tmp = rst.getString(9);
				if (tmp.equals("1"))
					tmp = "Team";
				else
					tmp = "Solo";
				temp.add(tmp);
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
		request.getRequestDispatcher("Admin/admin_home.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
