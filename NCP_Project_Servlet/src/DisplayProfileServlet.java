

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayProfileServlet
 */
@WebServlet("/displayProfile")
public class DisplayProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int student_id = getStudentID(request);
		ArrayList<String> profile = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String personal_data = "select student_about_myself, student_address, student_skill1, student_skill2, student_skill1_rating, student_skill2_rating from fiesta.table_student_profile_personal where student_id=?";
			PreparedStatement stmt = con.prepareStatement(personal_data);
			stmt.setInt(1, student_id);
			ResultSet rst = stmt.executeQuery();
			
			 while (rst.next()) {
			// {
				
				String student_name = "select student_name from fiesta.table_student_registration where student_id=?";
				PreparedStatement stmt1 = con.prepareStatement(student_name);
				stmt1.setInt(1, student_id);
				ResultSet rst1 = stmt1.executeQuery();
				
				while (rst1.next()) {
					if (rst1.getString(1).equals(""))
						profile.add("");
					else
						profile.add(rst1.getString(1)); // 0 - Student name
				}
				
				if (rst.getString(1).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(1)); // 1 - about myself
				if (rst.getString(2).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(2)); // 2 - student address
				if (rst.getString(3).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(3)); // 3 - student skill1
				if (rst.getString(4).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(4)); // 4 - student skill2
				if (rst.getString(5).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(5)); // 5 - student skill1 rating
				if (rst.getString(6).equals(""))
					profile.add("");
				else
					profile.add(rst.getString(6)); // 6 - student skill2 rating
				
				String contact_data = "select student_email, student_phone from fiesta.table_student_profile_contact where student_id=?";
				PreparedStatement stmt2 = con.prepareStatement(contact_data);
				stmt2.setInt(1, student_id);
				ResultSet rst2 = stmt2.executeQuery();
				while (rst2.next()) {
					if (rst2.getString(1).equals(""))
						profile.add("");
					else
						profile.add(rst2.getString(1)); // 7 - student email
					if (rst2.getString(2).equals(""))
						profile.add("");
					else
						profile.add(rst2.getString(2)); // 8 - student phone
				}
				
				String achievements_data = "select achievement_name, achievement_description from fiesta.table_student_profile_achievements where student_id=?";
				PreparedStatement stmt3 = con.prepareStatement(achievements_data);
				stmt3.setInt(1, student_id);
				ResultSet rst3 = stmt3.executeQuery();
				while (rst3.next()) {
					if (rst3.getString(1).equals(""))
						profile.add("");
					else
						profile.add(rst3.getString(1)); // 9 - achievement name
					if (rst3.getString(2).equals(""))
						profile.add("");
					else
						profile.add(rst3.getString(2)); // 10 - achievement description
				}
				
			}					
		}
		catch(Exception e) {
			System.out.println(e);
			// System.exit(1);
		}
		request.setAttribute("profile", profile);
		System.out.println(profile);
		request.getRequestDispatcher("Student%20pages/profile/profile_display.jsp").forward(request, response);
		
		
//		response.sendRedirect("Student%20pages/profile/profile_display.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static int getStudentID(HttpServletRequest request) {
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
		return student_id;
		
	}

}
