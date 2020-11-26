

import java.io.IOException;
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
 * Servlet implementation class LoginStudentServlet
 */
@WebServlet("/studentLogin")
public class LoginStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Login%20pages/student_login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String email = request.getParameter("email");
		String pword = request.getParameter("password");
		 String student_id = retrieveStudent(email, pword);
		// String student_id = "3";
		if (student_id.equals("-1") == false) {
			Cookie cookie = new Cookie("student_id", student_id);
			// Set expiry date after 24 Hrs for both the cookies.
			cookie.setMaxAge(123456);
			// Add both the cookies in the response header.
			response.addCookie(cookie);
			
			// response.sendRedirect("Student%20pages/student_dashboard/student_home.jsp");
			response.sendRedirect(request.getContextPath()+"/studentHome");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/studentLogin");
		}
		
	}
	
	public String retrieveStudent(String email, String password) {
		ResultSet rst = null;
		String student_id = "";
		String pass = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			String select_student_id = "SELECT student_id, student_password FROM fiesta.table_student_registration WHERE student_email=?";
			PreparedStatement stmt = con.prepareStatement(select_student_id);
			
			stmt.setString(1, email);
			
			rst = stmt.executeQuery();
			while (rst.next()) {
				student_id = rst.getString(1);
				pass = rst.getString(2);
			}
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		if (pass.equals(password))
			return student_id;
		else
			return "-1";
	}
	

}
