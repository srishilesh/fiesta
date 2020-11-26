

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class CreateEventServlet
 */
@WebServlet("/addEvent")
public class CreateEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.sendRedirect("Events/create_event.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		try {
			String eventName = request.getParameter("event_name");
			String eventDesc = request.getParameter("event_desc");
			String eventTags = request.getParameter("event_tags");
			String eventTypeParticipation = request.getParameter("event_type_participation");
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
			// System.out.println(eventName+" "+eventDesc+" "+eventTags);
			 int event_id = eventIDTrigger();
			 insertIntoDatabase(event_id, eventName, eventDesc, eventTags, eventTypeParticipation, eventStartDT, eventEndDT, eventVenue,
					 eventMaxParticipants, eventRegistrationLink, organizerCollege, organizerCampus, organizerOther, organizerName, organizerEmail,
					 organizerPhone, organizerDetails);
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
	
	public static int eventIDTrigger() {
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
			
			String update_query = "UPDATE fiesta.table_id_counter_new SET event_id=? WHERE id='1'";
			PreparedStatement update_stmt = con.prepareStatement(update_query);
			
			update_stmt.setInt(1, event_id + 1);
			int row = update_stmt.executeUpdate();
			System.out.println("Updated the new event_id: "+(event_id + 1));

		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		return event_id + 1;
	}
	
	// MODIFY THIS METHOD
	public static void insertIntoDatabase(int event_id, String eventName, String eventDesc, String eventTags, String eventTypeParticipation, 
			String eventStartDT, String eventEndDT, String eventVenue, String eventMaxParticipants, String eventRegistrationLink,
			String organizerCollege, String organizerCampus, String organizerOther, String organizerName, String organizerEmail,
			String organizerPhone, String organizerDetails) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			
			System.out.println("-------------- ADMIN - CREATE EVENT -------------------"); 
					
			String query = "insert into fiesta.table_event values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			int participationType = Integer.parseInt(eventTypeParticipation);
			int maxParticipants = Integer.parseInt(eventMaxParticipants);
			
			stmt.setInt(1, event_id);
			stmt.setString(2, eventName);
			stmt.setString(3, eventDesc);
			stmt.setString(4, eventTags);
			stmt.setInt(5, participationType);
			stmt.setString(6, eventVenue);
			stmt.setInt(7, maxParticipants);
			stmt.setString(8, organizerCollege);
			stmt.setString(9, organizerCampus);
			stmt.setString(10, organizerName);
			stmt.setString(11, organizerEmail);
			stmt.setString(12, organizerPhone);
			stmt.setString(13, organizerDetails);
			stmt.setString(14, null);
			stmt.setString(15, organizerOther);
			stmt.setString(16, eventRegistrationLink);
			stmt.setString(17, eventStartDT);
			stmt.setString(18, eventEndDT);
			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Event Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
	}

}
