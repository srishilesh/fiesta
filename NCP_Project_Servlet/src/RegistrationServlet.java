

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Student%20Registration/registration.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pword = request.getParameter("password");
		String roll = request.getParameter("roll");
		String student_id = studentIDTrigger() + "";
		try {
			if (insertIntoDatabase(student_id, name, email, pword, roll) == 1) {
				response.sendRedirect(request.getContextPath()+"/home");
			}
			else {
			    response.sendRedirect(request.getContextPath()+"/registration");
			}
			
		}
		catch(Exception e) {
			System.out.println("Error: "+e);
			
		}
	}
	
	public static int studentIDTrigger() {
		ResultSet rst = null;
		int student_id = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			String select_student_id = "SELECT student_id FROM fiesta.table_id_counter_new WHERE id='1'";
			PreparedStatement stmt = con.prepareStatement(select_student_id);
			rst = stmt.executeQuery();
			while (rst.next()) {
				student_id = rst.getInt(1);
			}
			System.out.println("Retrieved the student_id: "+student_id);
			
			

		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return student_id + 1;
	}
	
	public static int insertIntoDatabase(String student_id, String name, String email, String password, String rollno) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- STUDENT - REGISTRATION -------------------"); 
					
			String query = "insert into fiesta.table_student_registration values (?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			int temp = Integer.parseInt(student_id) + 1;
			student_id = temp + "";
			stmt.setString(1, student_id);
			stmt.setString(2, name);
			stmt.setString(3, rollno);
			stmt.setString(4, email);
			stmt.setString(5, password);
			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Registration Details successfully!");
			
			
			String update_query = "UPDATE fiesta.table_id_counter_new SET student_id=? WHERE id='1'";
			PreparedStatement update_stmt = con.prepareStatement(update_query);
			
			
//			student_id = temp + "";
			update_stmt.setString(1, student_id);
			int row = update_stmt.executeUpdate();
			System.out.println("Updated the new student_id: "+(student_id + 1));
			con.close();
			return 1;
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("Inserted Failed!");
		}
		return 0;
	}

}
