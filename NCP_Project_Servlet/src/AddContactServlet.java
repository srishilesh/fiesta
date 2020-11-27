

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
 * Servlet implementation class AddContactServlet
 */
@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Student%20pages/profile/contact.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String media1= request.getParameter("media1");
		String media2= request.getParameter("media2");
		
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
		
		insertIntoDatabase(student_id, email, phone, media1, media2);
		response.sendRedirect(request.getContextPath() +"/studentHome");
	}
	
	public static void insertIntoDatabase(int student_id, String email, String phone, String media1, String media2) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- STUDENT - ADD CONTACT DETAILS -------------------"); 
					
			String query = "insert into fiesta.table_student_profile_contact values (?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			
			stmt.setInt(1, student_id);
			stmt.setString(2, email);
			stmt.setString(3, phone);
			stmt.setString(4, media1);
			stmt.setString(5, media2);
			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Contact Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
	}

}
