

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
 * Servlet implementation class AddPersonalServlet
 */
@WebServlet("/addPersonal")
public class AddPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPersonalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Student%20pages/profile/personal.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String name = request.getParameter("name");
		String regno = request.getParameter("reg_no");
		String graduation = request.getParameter("graduation");
		String dept = request.getParameter("dept");
		String dob = request.getParameter("dob");
		String school = request.getParameter("school");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill1_rating = request.getParameter("skill1_rating");
		String skill2_rating = request.getParameter("skill2_rating");
		String address = request.getParameter("address");
		String aboutme = request.getParameter("aboutme");
		
		Cookie cookie = null;
		Cookie[] cookies = null;
		  
		// Get an array of Cookies associated with this domain
		String student_id_str = "";
		cookies = request.getCookies();
		if( cookies != null ) {
			System.out.println("Found Cookies Name and Value");
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (cookie.getName().equals("student_id"))
					student_id_str = cookie.getValue();
				System.out.print("Name : " + cookie.getName( ) + ",  ");
				System.out.print("Value: " + cookie.getValue( ) + "\n");
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
		
		insertIntoDatabase(student_id, name, regno, graduation, dept, dob, school, skill1, skill1_rating, skill2, skill2_rating, address, aboutme);
		response.sendRedirect(request.getContextPath() +"/studentHome");
		
	}
	
	public static void insertIntoDatabase(int student_id, String name, String regno, String graduation, String dept,
			String dob, String school, String skill1, String skill2, String skill1_rating, String skill2_rating,
			String address, String aboutme) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- STUDENT - ADD PERSONAL DETAILS -------------------"); 
					
			String query = "insert into fiesta.table_student_profile_personal values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			
			stmt.setInt(1, student_id);
			stmt.setString(2, dob);
			stmt.setString(3, graduation);
			stmt.setString(4, dept);
			stmt.setString(5, aboutme);
			stmt.setString(6, school);
			stmt.setString(7, address);
			stmt.setString(8, regno);
			stmt.setString(9, skill1);
			stmt.setString(10, skill2);
			stmt.setString(11, skill1_rating);
			stmt.setString(12, skill2_rating);
			

			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Personal Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
	}
}
