

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		String name = request.getParameter("studentname");
		String dob = request.getParameter("dob");
		String regno = request.getParameter("registrationnumber");
		String graduation = request.getParameter("graduation");
		String dept = request.getParameter("dept");
		String availability = request.getParameter("member");
		String extracurricular = request.getParameter("extracurricular");
		String aboutme = request.getParameter("aboutme");
		
		
	}
	
	public static void insertIntoDatabase(String name, String dob, String regno, String graduation, String dept, String availability,
			String extracurricular, String aboutme) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- STUDENT - ADD PERSONAL DETAILS -------------------"); 
					
			String query = "insert into fiesta.table_student_profile_personal values (?,?,?,?,?,?,?,?) on duplicate key update";
			PreparedStatement stmt = con.prepareStatement(query);
			
			
			stmt.setInt(1, name);
			stmt.setString(2, dob);
			stmt.setString(3, regno);
			stmt.setString(4, graduation);
			stmt.setInt(5, dept);
			stmt.setString(6, availability);
			stmt.setInt(7, extracurricular);
			stmt.setString(8, aboutme);

			
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
