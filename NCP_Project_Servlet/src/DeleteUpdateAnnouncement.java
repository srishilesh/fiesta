

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
 * Servlet implementation class DeleteUpdateAnnouncement
 */
@WebServlet("/deleteUpdateAnnouncement")
public class DeleteUpdateAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUpdateAnnouncement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Announcements/delete_update_announcement.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String announce_id = request.getParameter("announce_id");
		String ann = request.getParameter("ann");
		String cmd = request.getParameter("option");
		String title = request.getParameter("title");
		String event_id = request.getParameter("event_id");
		
		System.out.println(announce_id);
		System.out.println(ann);
		System.out.println(cmd);
		System.out.println(title);
		System.out.println(event_id);
		
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			if(cmd.equals("delete")) {
				PreparedStatement stmt = con.prepareStatement("DELETE FROM table_announcement WHERE announcement_id=?");
				stmt.setInt(1, Integer.parseInt(announce_id));
				int rows_updated = stmt.executeUpdate();
				System.out.println(rows_updated + " records deleted"); 
			}
			else { //update
				if(!ann.isEmpty()) {
					PreparedStatement stmt = con.prepareStatement("UPDATE table_announcement SET announcement_message=? WHERE announcement_id=?");
					stmt.setString(1, ann);
					stmt.setInt(2, Integer.parseInt(announce_id));
					int rows_updated = stmt.executeUpdate();
					System.out.println(rows_updated + " records updated"); 
				}
				if(!event_id.isEmpty()) {
					PreparedStatement stmt = con.prepareStatement("UPDATE table_announcement SET event_id=? WHERE announcement_id=?");
					stmt.setInt(1, Integer.parseInt(event_id));
					stmt.setInt(2, Integer.parseInt(announce_id));
					int rows_updated = stmt.executeUpdate();
					System.out.println(rows_updated + " records updated"); 
				}
				if(!title.isEmpty()) {
					PreparedStatement stmt = con.prepareStatement("UPDATE table_announcement SET announcement_title=? WHERE announcement_id=?");
					stmt.setString(1, title);
					stmt.setInt(2, Integer.parseInt(announce_id));
					int rows_updated = stmt.executeUpdate();
					System.out.println(rows_updated + " records updated"); 
				}
				
			}
			con.close();
			
//			response.getWriter().append("Served at: ").append(request.getContextPath());
		    response.sendRedirect(request.getContextPath()+"/adminHome");
		}
		catch(Exception e) {
			System.out.println(e);
		} 
		
//		doGet(request, response);
	}

}
