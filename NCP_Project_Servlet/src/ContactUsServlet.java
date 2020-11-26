

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactUsServlet
 */
@WebServlet("/contactus")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Contact%20Us/contactus.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		System.out.println("Inside POST method");
		try {
			String contactName = request.getParameter("name");
			String contactEmail = request.getParameter("email");
			String contactPhone = request.getParameter("phone");
			String contactMessage = request.getParameter("message");
			
			 int contact_id = contactIDTrigger();
			 insertIntoDatabase(contact_id, contactName, contactEmail, contactPhone, contactMessage);
		}
		catch(Exception e) {
			System.out.println("Error while retrieving data through POST method");
		}		
		response.sendRedirect(request.getContextPath()+"/home");
	}
	
	public static int contactIDTrigger() {
		ResultSet rst = null;
		int contact_id = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/sys";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			String select_contact_id = "SELECT contact_id FROM fiesta.table_id_counter_new WHERE id='1'";
			PreparedStatement stmt = con.prepareStatement(select_contact_id);
			rst = stmt.executeQuery();
			while (rst.next()) {
				contact_id = rst.getInt(1);
			}
			System.out.println("Retrieved the contact_id: "+contact_id);
			
			String update_query = "UPDATE fiesta.table_id_counter_new SET contact_id=? WHERE id='1'";
			PreparedStatement update_stmt = con.prepareStatement(update_query);
			
			update_stmt.setInt(1, contact_id + 1);
			int row = update_stmt.executeUpdate();
			System.out.println("Updated the new contact_id: "+(contact_id + 1));
			con.close();

		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return contact_id + 1;
	}
	public static void insertIntoDatabase(int contact_id, String contactName, String contactEmail, String contactPhone, String contactMessage) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/sys";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
					
			String query = "insert into fiesta.table_contactus values (?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setInt(1, contact_id);
			stmt.setString(2, contactName);
			stmt.setString(3, contactPhone);
			stmt.setString(4, contactEmail);
			stmt.setString(5, contactMessage);
			
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
