

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
 * Servlet implementation class UpdateWinners
 */
@WebServlet("/UpdateWinners")
public class UpdateWinners extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWinners() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Events/update_winners.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String event_id = request.getParameter("event_id");
		int count = Integer.parseInt(request.getParameter("count"));
		String winners[] = new String[count];
		for(Integer i=0; i<count; i++) {
//			System.out.println("message"+i.toString());
			winners[i] = request.getParameter("message"+i.toString());
		}
		System.out.println(event_id);
		System.out.println(count);
		for(int i=0; i<count; i++) {
			System.out.println(winners[i]);
		}
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			for(int i=0; i<count; i++) {
				PreparedStatement stmt = con.prepareStatement("INSERT INTO  table_event_winners VALUES(?,?,?)");
				stmt.setInt(1, Integer.parseInt(event_id));
				stmt.setInt(2, i+1);
				stmt.setInt(3, Integer.parseInt(winners[i]));
				int rows_updated = stmt.executeUpdate();
				System.out.println(rows_updated + " records inserted"); 
			}
			
			
			
			con.close();
			
//			response.getWriter().append("Served at: ").append(request.getContextPath());
//		    response.sendRedirect("indexForm.jsp");
		}
		catch(Exception e) {
			System.out.println(e);
		} 
//		doGet(request, response);
	}

}
