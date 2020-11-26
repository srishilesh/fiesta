

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

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
			stmt.setInt(1, Integer.parseInt(event_id)+13); 
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

}
