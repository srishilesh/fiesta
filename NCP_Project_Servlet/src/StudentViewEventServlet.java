

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
 * Servlet implementation class StudentViewEventServlet
 */
@WebServlet("/studentViewEvent")
public class StudentViewEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentViewEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
//		int event_id = 6;
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		ArrayList<String> eventDetails = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			
			//check if winners are available for the event
			PreparedStatement stmt = con.prepareStatement("select count(event_id) from fiesta.table_event_winners where event_id=?;");
			stmt.setInt(1, event_id);
			ResultSet rst = stmt.executeQuery();
			int cnt;
			System.out.println(rst);
			if(!rst.next()) {
				cnt = rst.getInt(1);
			}
			if(rst.getInt(1) > 0) {
				request.setAttribute("event_id", event_id);
				request.getRequestDispatcher("/studentViewEventWinners").forward(request, response);					
			}
			else {
				String select_eventDetails = "select * from fiesta.table_event where event_id=?";
				stmt = con.prepareStatement(select_eventDetails);
				stmt.setInt(1, event_id); 
				rst = stmt.executeQuery();
				int cnt_eventDetails = 0;
				while (rst.next()) {
					eventDetails.add(rst.getInt(1)+"");
					eventDetails.add(rst.getString(2));
					eventDetails.add(rst.getString(3));
					eventDetails.add(rst.getString(4));
					eventDetails.add(rst.getInt(5)+"");
					eventDetails.add(rst.getString(6));
					eventDetails.add(rst.getInt(7)+"");
					eventDetails.add(rst.getString(8));
					eventDetails.add(rst.getString(9));
					eventDetails.add(rst.getString(10));
					eventDetails.add(rst.getString(11));
					eventDetails.add(rst.getString(12));
					eventDetails.add(rst.getString(13));
					eventDetails.add(rst.getString(15));
					eventDetails.add(rst.getString(16));
					eventDetails.add(rst.getString(17));
					eventDetails.add(rst.getString(18));
					cnt_eventDetails += 1;
				}					
				System.out.println(eventDetails);
				request.setAttribute("eventDetails", eventDetails);
				request.getRequestDispatcher("Student%20pages/Student%20Events/view_event.jsp").forward(request, response); 
			}
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
//		response.sendRedirect("Events/view_event.jsp");
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
