

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
		int student_id = getStudentID(request);
		ResultSet rst = null;
		ArrayList<String> contactDetails = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");				
			String query = "select * from fiesta.table_student_profile_contact where student_id=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, student_id);
			rst = stmt.executeQuery();
			System.out.println("Queried Contact Details successfully!");
			
			if (rst.next() == false) {
				System.out.println("Inside loop");
				for (int i = 0; i < 5; i ++) {
					contactDetails.add("");
				}
				System.out.println(contactDetails);
			}
			else {
				if ((rst.getInt(1)+"").equals(""))
					contactDetails.add("");
				else
					contactDetails.add(rst.getInt(1)+"");
				if (rst.getString(2).equals(""))
					contactDetails.add("");
				else
					contactDetails.add(rst.getString(2));
				if (rst.getString(3).equals(""))
					contactDetails.add("");
				else
					contactDetails.add(rst.getString(3));
				if (rst.getString(4).equals(""))
					contactDetails.add("");
				else
					contactDetails.add(rst.getString(4));
				if (rst.getString(5).equals(""))
					contactDetails.add("");
				else
					contactDetails.add(rst.getString(5));
			}
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		request.setAttribute("contactDetails", contactDetails);
		request.getRequestDispatcher("Student%20pages/profile/contact.jsp").forward(request, response); 
//		response.sendRedirect("Student%20pages/profile/contact.jsp");
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
		int student_id = getStudentID(request);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String query = "delete from fiesta.table_student_profile_contact where student_id=?";
			PreparedStatement stmt = con.prepareStatement(query);		
			stmt.setInt(1, student_id);
			int i = stmt.executeUpdate();
			System.out.println("Deleted Contact Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		
		insertIntoDatabase(student_id, email, phone, media1, media2);
		response.sendRedirect(request.getContextPath() +"/studentHome");
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
	public static void insertIntoDatabase(int student_id, String email, String phone, String media1, String media2) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			
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
