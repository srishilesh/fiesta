

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class UpdateEventServlet
 */
@WebServlet("/updateEvent")
public class UpdateEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventServlet() {
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
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<String> event_ids = new ArrayList<String>();
			PreparedStatement stmt = con.prepareStatement("select event_id from fiesta.table_event");
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				event_ids.add(rst.getInt(1)+"");
			}				
			
			con.close();
			request.setAttribute("event_ids", event_ids);
			System.out.println(event_ids);
			request.getRequestDispatcher("Events/update_event.jsp").forward(request, response); 
		}
		catch(Exception e) {
			System.out.println(e);
		} 
//		response.sendRedirect("Events/update_event.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		try {
			String eventID = request.getParameter("event_name");
			String eventDesc = request.getParameter("event_desc");
			String eventTags = request.getParameter("event_tags");
			String eventTypeParticipatoion = request.getParameter("event_type_participation");
			String eventStartDT = request.getParameter("event_start_datetime");
			String eventEndDT = request.getParameter("event_end_datetime");
			String eventVenue = request.getParameter("event_venue");
			String eventMaxParticipants = request.getParameter("event_max_participants");
			String eventRegistrationLink = request.getParameter("event_registration_link");
			String organizerCollege = request.getParameter("event_organizer_college");
			String organizerCampus = request.getParameter("event_organizer_campus");
			String organizerOther = request.getParameter("event_organizer_other");
			String organizerName = request.getParameter("event_organizer_name");
			String organizerEmail = request.getParameter("event_organizer_email");
			String organizerPhone = request.getParameter("event_organizer_phone");
			String organizerDetails = request.getParameter("event_organizer_details");
//			System.out.println(eventID+" "+eventDesc+" "+eventTags);
			int event_id = getEventID();
//			 updateDatabase(event_id, eventName, eventDesc, eventTags, eventTypeParticipation, eventStartDT, eventEndDT, eventVenue,
//					 eventMaxParticipants, eventRegistrationLink, organizerCollege, organizerCampus, organizerOther, organizerName, organizerEmail,
//					 organizerPhone, organizerDetails);
		}
		catch(Exception e) {
			System.out.println("Error while retrieving data through POST method");
		}
		try {
			response.sendRedirect(request.getContextPath()+"/adminHome");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	public static int getEventID() {
		ResultSet rst = null;
		int event_id = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			String select_event_id = "SELECT event_id FROM fiesta.table_id_counter_new WHERE id='1'";
			PreparedStatement stmt = con.prepareStatement(select_event_id);
			rst = stmt.executeQuery();
			while (rst.next()) {
				event_id = rst.getInt(1);
			}
			System.out.println("Retrieved the event_id: "+event_id);
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return event_id;
	}
}
