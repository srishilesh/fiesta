

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.*;
import java.io.*;

/**
 * Servlet implementation class AddAnnouncement
 */
@WebServlet("/addAnnouncement")
public class AddAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnnouncement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Sanjay");
		response.sendRedirect("Announcements/createAnnouncement.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String announcement = request.getParameter("ann");
		String event_id = request.getParameter("event_id");
		String title = request.getParameter("title");
		System.out.println(announcement);
		System.out.println(event_id);
		System.out.println(title);
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			PreparedStatement stmt = con.prepareStatement("INSERT INTO  table_announcement VALUES(?,?,?,?)");
			stmt.setInt(1, announcementIDTrigger()); 
			stmt.setString(2, announcement); 
			stmt.setString(3, title); 
			stmt.setInt(4, Integer.parseInt(event_id));
			
			int rows_updated = stmt.executeUpdate();
			System.out.println(rows_updated + " records inserted");  
			con.close();
			
//			response.getWriter().append("Served at: ").append(request.getContextPath());
		    response.sendRedirect(request.getContextPath()+"/adminHome");
		}
		catch(Exception e) {
			System.out.println(e);
		} 
//		doGet(request, response);
	}
	
	public static int announcementIDTrigger() {
		ResultSet rst = null;
		int announcement_id = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			String select_announcement_id = "SELECT announcement_id FROM fiesta.table_id_counter_new WHERE id='1'";
			PreparedStatement stmt = con.prepareStatement(select_announcement_id);
			rst = stmt.executeQuery();
			while (rst.next()) {
				announcement_id = rst.getInt(1);
			}
			System.out.println("Retrieved the announcement_id: "+announcement_id);
			
			String update_query = "UPDATE fiesta.table_id_counter_new SET announcement_id=? WHERE id='1'";
			PreparedStatement update_stmt = con.prepareStatement(update_query);
			
			update_stmt.setInt(1, announcement_id + 1);
			int row = update_stmt.executeUpdate();
			System.out.println("Updated the new announcement_id: "+(announcement_id + 1));

		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return announcement_id + 1;
	}

}
