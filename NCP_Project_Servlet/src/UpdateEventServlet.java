

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
	String eventID = "0";
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
		eventID = request.getParameter("event_id");
		System.out.println("Inside Update Event - GET | Event ID: " + eventID);
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta";
			String username = "admin";
			String password = "nithin_aakash";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<String> eventDetails = new ArrayList<String>();
			PreparedStatement stmt = con.prepareStatement("select * from fiesta.table_event where event_id=?");
			stmt.setInt(1, Integer.parseInt(eventID));
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				ArrayList<String> tmp = new ArrayList<String>();
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
				eventDetails.add("");
				eventDetails.add(rst.getString(15));
				eventDetails.add(rst.getString(16));
				eventDetails.add(rst.getString(17));
				eventDetails.add(rst.getString(18));
			}				
			
			con.close();
			request.setAttribute("eventDetails", eventDetails);
			System.out.println(eventDetails);
			request.getRequestDispatcher("Events/update_event.jsp").forward(request, response); 
		}
		catch(Exception e) {
			System.out.println(e);
		} 
//		 response.sendRedirect("Events/update_event.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		System.out.println("Inside Update Event - POST");
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
//			System.out.println(eventID+" "+eventDesc+" "+eventTags);
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
				String query = "delete from fiesta.table_event where event_id=?";
				PreparedStatement stmt = con.prepareStatement(query);		
				stmt.setInt(1, Integer.parseInt(eventID));
				int i = stmt.executeUpdate();
				System.out.println("Deleted Event Details successfully!");
				con.close();
			}
			catch(Exception e) {
				System.out.println(e);
				System.exit(1);
			}
			insertIntoDatabase(eventID, eventName, eventDesc, eventTags, eventTypeParticipation, eventStartDT, eventEndDT, eventVenue,
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
	
	public static void insertIntoDatabase(String event_id, String eventName, String eventDesc, String eventTags, String eventTypeParticipation, 
			String eventStartDT, String eventEndDT, String eventVenue, String eventMaxParticipants, String eventRegistrationLink,
			String organizerCollege, String organizerCampus, String organizerOther, String organizerName, String organizerEmail,
			String organizerPhone, String organizerDetails) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			
			System.out.println("-------------- ADMIN - CREATE EVENT -------------------"); 
					
			String query = "insert into fiesta.table_event values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			int participationType = Integer.parseInt(eventTypeParticipation);
			int maxParticipants = 1;
			if (eventMaxParticipants == null)
				maxParticipants = 1;
			else
				maxParticipants = Integer.parseInt(eventMaxParticipants);
			
			stmt.setInt(1, Integer.parseInt(event_id));
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
			System.out.println("Error during insertion: "+e);
			System.exit(1);
		}
	}
}
