

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
 * Servlet implementation class ViewEventServlet
 */
@WebServlet("/viewEvent")
public class ViewEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int event_id = 6;
		ArrayList<String> eventDetails = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			String select_eventDetails = "select * from fiesta.table_event where event_id=?";
			
			PreparedStatement stmt = con.prepareStatement(select_eventDetails);
			stmt.setInt(1, event_id); 
			ResultSet rst = stmt.executeQuery();
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
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		System.out.println(eventDetails);
		request.setAttribute("eventDetails", eventDetails);
		request.getRequestDispatcher("Events/view_event.jsp").forward(request, response); 

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
