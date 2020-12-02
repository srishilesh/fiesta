

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminViewAllStudentsServlet
 */
@WebServlet("/adminViewAllStudents")
public class AdminViewAllStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminViewAllStudentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta";
			String username = "admin";
			String password = "nithin_aakash";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<ArrayList<String>> registrationDetails = new ArrayList<ArrayList<String>>();
			PreparedStatement stmt = con.prepareStatement("select * from fiesta.table_event_registrations");
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				ArrayList<String> tmp = new ArrayList<String>();
				tmp.add(rst.getInt(1)+"");
				PreparedStatement stmt1 = con.prepareStatement("select event_name from fiesta.table_event where event_id=?");
				stmt1.setInt(1, rst.getInt(1));
				ResultSet rst1 = stmt1.executeQuery();
				while(rst1.next()) {
					tmp.add(rst1.getString(1));
				}
				tmp.add(rst.getInt(2)+"");
				tmp.add(rst.getString(3));
				registrationDetails.add(tmp);
			}				
			
			con.close();
			request.setAttribute("registrationDetails", registrationDetails);
			System.out.println(registrationDetails);
			request.getRequestDispatcher("Admin/admin_view_all_students.jsp").forward(request, response); 
		}
		catch(Exception e) {
			System.out.println(e);
		}
//		response.sendRedirect("Admin/admin_view_all_students.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
