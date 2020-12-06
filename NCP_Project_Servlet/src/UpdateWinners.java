

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
@WebServlet("/updateWinners")
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
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta";
			String username = "admin";
			String password = "nithin_aakash";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<ArrayList<String>> event_ids = new ArrayList<ArrayList<String>>();
			PreparedStatement stmt = con.prepareStatement("select event_id from fiesta.table_event");
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				ArrayList<String> tmp = new ArrayList<String>();
				tmp.add(rst.getInt(1)+"");
				// event_ids.add(rst.getInt(1)+"");
				event_ids.add(tmp);
			}				
			
			con.close();
			request.setAttribute("event_ids", event_ids);
			System.out.println(event_ids);
			request.getRequestDispatcher("Events/update_winners.jsp").forward(request, response);
		}
		catch(Exception e) {
			System.out.println(e);
		} 
//		response.sendRedirect("Events/update_winners.jsp");
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
			String path_to_db = "jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta";
			String username = "admin";
			String password = "nithin_aakash";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			for(int i=0; i<count; i++) {
				PreparedStatement stmt = con.prepareStatement("INSERT INTO fiesta.table_event_winners VALUES(?,?,?)");
				stmt.setInt(1, Integer.parseInt(event_id));
				stmt.setInt(2, i+1);
				stmt.setInt(3, Integer.parseInt(winners[i]));
				int rows_updated = stmt.executeUpdate();
				System.out.println(rows_updated + " records inserted"); 
			}
					
			for(int i=0; i<count; i++) {
				PreparedStatement stmt = con.prepareStatement("select student_id from fiesta.table_team_details where team_id=?");
				stmt.setInt(1, Integer.parseInt(winners[i]));
				ResultSet rst = stmt.executeQuery();
				ArrayList<Integer> stu_ids = new ArrayList<Integer>();
				while (rst.next()) {
					Integer stu_id = rst.getInt(1);
					stu_ids.add(stu_id);
				}
				for(int j=0; j<stu_ids.size(); j++) {
					stmt = con.prepareStatement("select student_id from fiesta.table_student_scores where student_id=?");
					stmt.setInt(1, stu_ids.get(j));
					rst = stmt.executeQuery();
					int rows_updated;
					if(rst.next() == true) {
						stmt = con.prepareStatement("update fiesta.table_student_scores set student_score=student_score+? where student_id=?");	
					}
					else {
						stmt = con.prepareStatement("INSERT INTO fiesta.table_student_scores (`student_score`, `student_id`) VALUES(?,?)");
					}
					stmt.setInt(1, 20-i-1);
					stmt.setInt(2, stu_ids.get(j));
					rows_updated = stmt.executeUpdate();
					System.out.println(rows_updated + " records inserted"); 
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
