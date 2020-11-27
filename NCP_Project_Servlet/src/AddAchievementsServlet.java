

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddAchievementsServlet
 */
@WebServlet("/addAchievements")
public class AddAchievementsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAchievementsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Student%20pages/profile/achievements.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String name = request.getParameter("event_name");
		String date = request.getParameter("event_date");
		String location = request.getParameter("location");
		String size = request.getParameter("team_size");
		String participation = request.getParameter("participation");
		String proof = request.getParameter("proof");
		String skill = request.getParameter("skill");
		String team_leader = request.getParameter("team_leader");
		String desc = request.getParameter("desc");
		
		Cookie cookie = null;
		Cookie[] cookies = null;
		  
		// Get an array of Cookies associated with this domain
		String student_id_str = "";
		cookies = request.getCookies();
		if( cookies != null ) {
			// System.out.println("Found Cookies Name and Value");
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (cookie.getName().equals("student_id"))
					student_id_str = cookie.getValue();
//				System.out.print("Name : " + cookie.getName( ) + ",  ");
//				System.out.print("Value: " + cookie.getValue( ) + "\n");
			}
		} 
		else {
			System.out.println("No cookies founds");
		}
		int student_id = 0;
		if (student_id_str.equals(""))
			student_id = 0;
		else
			student_id = Integer.parseInt(student_id_str);
		
		insertIntoDatabase(student_id, name, date, location, size, participation, proof, skill, team_leader, desc);
		response.sendRedirect(request.getContextPath() +"/studentHome");
	}
	
	public static void insertIntoDatabase(int student_id, String name, String date, String location, String size, String participation,
			String proof, String skill, String team_leader, String desc) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- STUDENT - ADD PERSONAL DETAILS -------------------"); 
					
			String query = "insert into fiesta.table_student_profile_achievements values (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			
			stmt.setInt(1, student_id);
			stmt.setString(2, name);
			stmt.setString(3, date);
			stmt.setString(4, location);
			stmt.setString(5, size);
			stmt.setString(6, participation);
			stmt.setString(7, proof);
			stmt.setString(8, skill);
			stmt.setString(9, team_leader);
			stmt.setString(10, desc);
			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Achievements Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
	}

}
