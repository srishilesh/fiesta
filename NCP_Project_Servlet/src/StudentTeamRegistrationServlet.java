

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentTeamRegistrationServlet
 */
@WebServlet("/studentTeamRegistration")
public class StudentTeamRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentTeamRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		int team_max = Integer.parseInt(request.getParameter("team_max"));
		
		
		request.setAttribute("event_id", event_id);
		request.setAttribute("team_max", team_max);
		
		request.getRequestDispatcher("Student%20pages/Students%20Event%20Registration/team_registration.jsp").forward(request, response);
//		response.sendRedirect("Student%20pages/Students%20Event%20Registration/team_registration.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		int team_max = Integer.parseInt(request.getParameter("team_max"));
		String team_name = request.getParameter("team_name");
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cur_date = formatter.format(date);
		
		ArrayList<Integer> student_ids = new ArrayList<Integer>();
		
		for(int i=0; i<team_max; i++) {
			String str = request.getParameter("name"+i);
			if(!str.equals("")) {
				student_ids.add(Integer.parseInt(str));
			}
		}
		
		int team_id = TeamIDTrigger();
		
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			PreparedStatement stmt = con.prepareStatement("INSERT INTO fiesta.table_event_registrations VALUES(?,?,?)");
			stmt.setInt(1, event_id); 
			stmt.setInt(2, team_id); 
			stmt.setString(3, cur_date); 
			
			int rows_updated = stmt.executeUpdate();
			System.out.println(rows_updated + " records inserted in event registration");  
			
			stmt = con.prepareStatement("INSERT INTO fiesta.table_team_details VALUES(?,?,?)");
			for(int i=0; i<student_ids.size(); i++) {
				stmt.setInt(1, team_id); 
				stmt.setString(2, team_name); 
				stmt.setInt(3, student_ids.get(i)); 
				
				rows_updated = stmt.executeUpdate();
				System.out.println(rows_updated + " records inserted in team details"); 
			}
			
			con.close();
			
//			response.getWriter().append("Served at: ").append(request.getContextPath());
		    response.sendRedirect(request.getContextPath()+"/adminHome");
		}
		catch(Exception e) {
			System.out.println(e);
		} 
		
//		doGet(request, response);
	}
	
	public static int TeamIDTrigger() {
		ResultSet rst = null;
		int team_id = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			String select_team_id = "SELECT team_id FROM fiesta.table_id_counter_new WHERE id='1'";
			PreparedStatement stmt = con.prepareStatement(select_team_id);
			rst = stmt.executeQuery();
			while (rst.next()) {
				team_id = rst.getInt(1);
			}
			System.out.println("Retrieved the announcement_id: "+team_id);
			
			String update_query = "UPDATE fiesta.table_id_counter_new SET team_id=? WHERE id='1'";
			PreparedStatement update_stmt = con.prepareStatement(update_query);
			
			update_stmt.setInt(1, team_id + 1);
			int row = update_stmt.executeUpdate();
			System.out.println("Updated the new team_id: "+(team_id + 1));

		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return team_id + 1;
	}


}
