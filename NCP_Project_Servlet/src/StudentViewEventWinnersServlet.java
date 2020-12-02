

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
 * Servlet implementation class StudentViewEventWinnersServlet
 */
@WebServlet("/studentViewEventWinners")
public class StudentViewEventWinnersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentViewEventWinnersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
int event_id = Integer.parseInt(request.getParameter("event_id"));
		
		ArrayList<ArrayList<String>> event_winners = new ArrayList<ArrayList<String>>();
		ArrayList<String> eventDetails = new ArrayList<String>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String select_winners = "select distinct t.team_id , team_name, event_id, position \r\n" + 
					"from fiesta.table_team_details t inner join fiesta.table_event_winners w on t.team_id = w.team_id \r\n" + 
					"where w.event_id=? \r\n" + 
					"order by position;";
			PreparedStatement stmt = con.prepareStatement(select_winners);
			stmt.setInt(1, event_id);
			ResultSet rst = stmt.executeQuery();
			int cnt_winners = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getInt(3)+"");
				temp.add(rst.getInt(4)+"");
				event_winners.add(temp);
				cnt_winners += 1;
			}			
			
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
			
			request.setAttribute("event_winners", event_winners);
			request.setAttribute("eventDetails", eventDetails);
			request.getRequestDispatcher("Student%20pages/Student%20Events/view_event_winners.jsp").forward(request, response);
			
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		
		
//		response.sendRedirect("Student%20pages/Student%20Events/view_event_winners.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
